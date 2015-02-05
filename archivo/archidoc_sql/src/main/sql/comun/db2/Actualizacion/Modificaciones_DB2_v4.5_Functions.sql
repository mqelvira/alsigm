--/*************************/
--/* Versi�n 4.5           */
--/*************************/

CREATE FUNCTION GETHIJOSELEMENTO(IDELEMENTO VARCHAR(32))
  RETURNS TABLE (ID VARCHAR(32), TIPO SMALLINT)
  LANGUAGE SQL

BEGIN ATOMIC
   RETURN WITH CTE_ELEMENTOS (ID, CODIGO, IDPADRE, TIPO) AS
(
	SELECT ID, CODIGO, IDPADRE, TIPO FROM ASGFELEMENTOCF WHERE ID = IDELEMENTO
	UNION ALL
	SELECT A.ID, A.CODIGO, A.IDPADRE, A.TIPO FROM ASGFELEMENTOCF A, CTE_ELEMENTOS CTE
	WHERE A.IDPADRE = CTE.ID
)
SELECT ID, TIPO FROM CTE_ELEMENTOS;
END@

CREATE FUNCTION GETCODREF(IDELEMENTO VARCHAR(32), SEPARATOR VARCHAR(1))
					RETURNS VARCHAR(1024)
	BEGIN ATOMIC

		DECLARE AUXCODREFERENCIA VARCHAR(1024);
		DECLARE ID VARCHAR(32);
		DECLARE CODIGO_ELEMENTO VARCHAR(128);
		DECLARE IDPADRE VARCHAR(32);
		DECLARE CODPAIS VARCHAR(16);
		DECLARE CODCOMUNIDAD VARCHAR(16);
		DECLARE CODARCHIVO VARCHAR(32);

		SET AUXCODREFERENCIA = '';

		FOR ELEMENTOS as
			WITH CTE_ELEMENTOS (ID, CODIGO, IDPADRE) AS
			(
				SELECT ID, CODIGO, IDPADRE FROM ASGFELEMENTOCF WHERE ID = IDELEMENTO
				UNION ALL
				SELECT A.ID, A.CODIGO, A.IDPADRE FROM ASGFELEMENTOCF A, CTE_ELEMENTOS CTE
				WHERE A.ID = CTE.IDPADRE
			)
			SELECT ID, CODIGO, IDPADRE FROM CTE_ELEMENTOS
    DO
			IF (CODIGO IS NOT NULL) THEN
			IF (AUXCODREFERENCIA = '') THEN
					SET AUXCODREFERENCIA = CODIGO;
				ELSE
					SET AUXCODREFERENCIA = CODIGO || SEPARATOR || AUXCODREFERENCIA;
				END IF;
			END IF;
		END FOR;


		IF (AUXCODREFERENCIA = '') THEN
			SET AUXCODREFERENCIA=NULL;
		ELSE

			FOR FONDO AS
				SELECT CODPAIS, CODCOMUNIDAD, CODARCHIVO FROM ASGFELEMENTOCF ASGFELEMENTOCF, ASGFFONDO ASGFFONDO
				WHERE	ASGFELEMENTOCF.ID=IDELEMENTO AND
						ASGFELEMENTOCF.IDFONDO=ASGFFONDO.IDELEMENTOCF
				DO
				SET AUXCODREFERENCIA = CODPAIS || SEPARATOR || CODCOMUNIDAD || SEPARATOR || CODARCHIVO || SEPARATOR || AUXCODREFERENCIA;
			END FOR;
		END IF;

    RETURN AUXCODREFERENCIA;
END@

CREATE FUNCTION GETFINCODREFPADRE(IDELEMENTO VARCHAR(32), SEPARATOR VARCHAR(1))
RETURNS VARCHAR(1024)
BEGIN ATOMIC

	DECLARE AUXFINALCODREFPADRE VARCHAR(1024);
	DECLARE CODIGOREFERENCIAELEMENTOPADRE VARCHAR(1024);
	DECLARE CODIGOREFERENCIAFONDO VARCHAR(1024);
	DECLARE IDFONDO VARCHAR(32);
	DECLARE TIPO SMALLINT;

	SET AUXFINALCODREFPADRE = '';

	IF (IDELEMENTO IS NULL) THEN
		SET AUXFINALCODREFPADRE = NULL;
	ELSE
		SET TIPO = -1;
		FOR ELEMENTOCF AS
			SELECT TIPO
			FROM ASGFELEMENTOCF
			WHERE ID = IDELEMENTO
		DO
			IF (TIPO IN (-1,2,6)) THEN
				SET AUXFINALCODREFPADRE = NULL;
			ELSE
				FOR ELEMENTO AS
					SELECT GETCODREF(IDPADRE, SEPARATOR) CODIGOREFERENCIAELEMENTOPADRE, GETCODREF(IDFONDO, SEPARATOR) CODIGOREFERENCIAFONDO
					FROM ASGFELEMENTOCF
					WHERE ID = IDELEMENTO
				DO
					IF (LENGTH(CODIGOREFERENCIAFONDO)>0) THEN
						SET AUXFINALCODREFPADRE = REPLACE(CODIGOREFERENCIAELEMENTOPADRE,CODIGOREFERENCIAFONDO || SEPARATOR,'');
						SET AUXFINALCODREFPADRE = REPLACE(AUXFINALCODREFPADRE,CODIGOREFERENCIAFONDO,'');
					ELSE
						SET AUXFINALCODREFPADRE = CODIGOREFERENCIAELEMENTOPADRE;
					END IF;
				END FOR;
			END IF;
		END FOR;
	END IF;

	IF (LENGTH(AUXFINALCODREFPADRE)=0) THEN
		SET AUXFINALCODREFPADRE = NULL;
	END IF;

	RETURN AUXFINALCODREFPADRE;
END@

CREATE PROCEDURE UPDATECODREF ( IN ROOT VARCHAR(32), SEPARATOR VARCHAR(1), UPDTABLES VARCHAR(1) )
BEGIN ATOMIC

	-- Este procedimiento requiere que se establezca el idpadre antes de llamar
	-- para actualizar los c�digos de referencia y el resto de campos

	IF (ROOT IS NOT NULL) THEN
		FOR ELEMENTO AS
			SELECT TIPO FROM ASGFELEMENTOCF WHERE ID=ROOT
		DO

			IF (TIPO IS NOT NULL) THEN
				IF ((TIPO IN (2,3,4,5,6)) AND (UPDTABLES='S')) THEN
					FOR FONDO AS
						WITH CTE_ELEMENTOS (ID, IDPADRE, TIPO, CODREFERENCIA) AS
						(
							SELECT ID, IDPADRE, TIPO, CODREFERENCIA FROM ASGFELEMENTOCF WHERE ID = ROOT
							UNION ALL
							SELECT A.ID, A.IDPADRE, A.TIPO, A.CODREFERENCIA FROM ASGFELEMENTOCF A, CTE_ELEMENTOS CTE
							WHERE A.ID = CTE.IDPADRE
						)
						SELECT CTE.ID IDFONDO_CALCULADO, CTE.CODREFERENCIA CODREFERENCIAFONDO_CALCULADO
						FROM CTE_ELEMENTOS CTE
						WHERE CTE.TIPO=2
					DO
						-- Actualizar el idfondo a todos sus hijos
						UPDATE ASGFELEMENTOCF SET IDFONDO=IDFONDO_CALCULADO WHERE ID IN (SELECT ID FROM TABLE(GETHIJOSELEMENTO(ROOT)) AS HIJOS);

						-- Actualizar el idfondo a todas sus series
						UPDATE ASGFSERIE SET IDFONDO=IDFONDO_CALCULADO WHERE IDELEMENTOCF IN (SELECT ID FROM TABLE(GETHIJOSELEMENTO(ROOT)) AS HIJOS WHERE HIJOS.TIPO=4);

						-- Actualizar el idfondo a todas las unidades documentales
						UPDATE ASGFUNIDADDOC SET IDFONDO=IDFONDO_CALCULADO WHERE IDELEMENTOCF IN (SELECT ID FROM TABLE(GETHIJOSELEMENTO(ROOT)) AS HIJOS WHERE HIJOS.TIPO=6);

						-- Actualizar la identificacion a todas las unidades documentales
						UPDATE ASGDUDOCENUI SET IDENTIFICACION=CODREFERENCIAFONDO_CALCULADO || '-' || SIGNATURAUDOC WHERE IDUNIDADDOC IN (SELECT ID FROM TABLE(GETHIJOSELEMENTO(ROOT)) AS HIJOS WHERE HIJOS.TIPO=6);

						-- Actualizar la identificacion de las unidades de instalaci�n
						UPDATE ASGDUINSTALACION SET IDENTIFICACION=CODREFERENCIAFONDO_CALCULADO || '.' || SIGNATURAUI WHERE ID IN (SELECT ASGDUDOCENUI.IDUINSTALACION FROM ASGDUDOCENUI ASGDUDOCENUI, TABLE(GETHIJOSELEMENTO(ROOT)) AS HIJOS WHERE HIJOS.TIPO=6 AND HIJOS.ID=ASGDUDOCENUI.IDUNIDADDOC);
					END FOR;
				END IF;

				IF ((TIPO IN (6)) AND (UPDTABLES='S')) THEN
					FOR SERIE AS
						WITH CTE_ELEMENTOS (ID, IDPADRE, TIPO) AS
						(
							SELECT ID, IDPADRE, TIPO FROM ASGFELEMENTOCF WHERE ID = ROOT
							UNION ALL
							SELECT A.ID, A.IDPADRE, A.TIPO FROM ASGFELEMENTOCF A, CTE_ELEMENTOS CTE
							WHERE A.ID = CTE.IDPADRE
						)
						SELECT CTE.ID IDSERIE_CALCULADO
						FROM CTE_ELEMENTOS CTE
						WHERE CTE.TIPO=4
					DO
						UPDATE ASGFUNIDADDOC SET IDSERIE=IDSERIE_CALCULADO WHERE IDELEMENTOCF IN (SELECT ID FROM TABLE(GETHIJOSELEMENTO(ROOT)) AS HIJOS WHERE HIJOS.TIPO=6);
					END FOR;
				END IF;

				FOR ELEMENTOS AS
					WITH CTE_ELEMENTOS (ID, CODIGO, IDPADRE) AS
					(
						SELECT ID, CODIGO, IDPADRE FROM ASGFELEMENTOCF WHERE ID = ROOT
						UNION ALL
						SELECT A.ID, A.CODIGO, A.IDPADRE FROM ASGFELEMENTOCF A, CTE_ELEMENTOS CTE
						WHERE A.IDPADRE = CTE.ID
					)
					SELECT ID IDELEMENTO, CODIGO, IDPADRE FROM CTE_ELEMENTOS
				DO

					FOR CODSREF AS
						SELECT COALESCE(GETCODREF(IDFONDO, SEPARATOR),NULLIF('1','1')) CODREFFONDO_CALCULADO,
						GETCODREF(IDELEMENTO, SEPARATOR) CODREFERENCIA_CALCULADO,
						GETFINCODREFPADRE(IDELEMENTO, SEPARATOR) FINALCODREFPADRE_CALCULADO
						FROM ASGFELEMENTOCF WHERE ID=IDELEMENTO
					DO
						UPDATE ASGFELEMENTOCF SET CODREFFONDO=CODREFFONDO_CALCULADO, CODREFERENCIA=CODREFERENCIA_CALCULADO, FINALCODREFPADRE=FINALCODREFPADRE_CALCULADO WHERE ID=IDELEMENTO;
					END FOR;
				END FOR;
			END IF;
		END FOR;
	END IF;
END@
