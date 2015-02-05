/******************************************************************************************************/
/* EJECUTAR ESTOS ANTES PARA CONDICIONES DE FRACCI�N DE SERIE QUE VAN EN LOS OTROS SCRITPS Versi�n 2.8.1 */
/******************************************************************************************************/

	-- Insertar la versi�n actual de bd
	INSERT INTO AGINFOSISTEMA (ID,VALOR,FECHAACTUALIZACION) VALUES ('VERSIONBD','2.8.1',now());

	-- Insertar nivel del cuadro
	INSERT INTO ASGFNIVELCF ( ID, NOMBRE, TIPO, IDFICHADESCRPREF, IDFICHACLFDOCPREF,IDLVOLPREF, SUBTIPO ) 
	VALUES( '00000000000000000000000000000016', 'Fracci�n de serie', 6, '6', NULL, NULL, 62); 
	
	-- Insertar Jerarqu�a entre Serie -> Fracci�n de Serie 
	INSERT INTO ASGFESTRUCTJNIVCF ( IDNIVELPADRE, TIPONIVELPADRE, IDNIVELHIJO,TIPONIVELHIJO ) 
	VALUES ( '00000000000000000000000000000008', 4, '00000000000000000000000000000016', 5); 
	
	-- Insertar campo tabla de rango de expedientes
	INSERT INTO ADCAMPOTBL(ID, NOMBRE, TIPONORMA, IDAREA, ETIQUETAXML, ETIQXMLFILA, DESCRIPCION ) 
	VALUES ('102', 'Rangos de expedientes', 1, '1', 'Rangos_Expedientes', 'Rango_Expedientes', null);
	
	-- Insertar campos de rangos y rangos normalizados
	INSERT INTO ADCAMPODATO(ID, NOMBRE, TIPO, TIPONORMA, IDAREA, IDTBLPADRE, POSENTBL, ETIQUETAXML, DESCRIPCION)
	VALUES ('201', 'Rango de expedientes: Desde', 1, 1, '1', '102', 1, 'Exp_Desde', null);
	
	INSERT INTO ADCAMPODATO(ID, NOMBRE, TIPO, TIPONORMA, IDAREA, IDTBLPADRE, POSENTBL, ETIQUETAXML, DESCRIPCION)
	VALUES ('202', 'Rango de expedientes: Hasta', 1, 1, '1', '102', 2, 'Exp_Hasta', null);
	
	INSERT INTO ADCAMPODATO(ID, NOMBRE, TIPO, TIPONORMA, IDAREA, IDTBLPADRE, POSENTBL, ETIQUETAXML, DESCRIPCION)
	VALUES ('210', 'Rango de expedientes: Desde Normalizado', 1, 1, '1', '102', 3, 'Exp_Desde_Norm', null);
	
	INSERT INTO ADCAMPODATO(ID, NOMBRE, TIPO, TIPONORMA, IDAREA, IDTBLPADRE, POSENTBL, ETIQUETAXML, DESCRIPCION)
	VALUES ('211', 'Rango de expedientes: Hasta Normalizado', 1, 1, '1', '102', 4, 'Exp_Hasta_Norm', null);
	
	/********************************************
	 * Asignar las tablas a las areas
	 ********************************************/
	--Area de menci�n de la identidad->Tabla Volumen y Forma Documental
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'7',2);
	
	--Area de menci�n de la identidad->Volumen y Forma Documental: Cantidad	
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'214',2);
	
	--Area de menci�n de la identidad->Formato       
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'5',2);
	                                                         
	--Area de menci�n de la identidad->Soporte       
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'6',2);

/******************************************************************************************************/
/* Versi�n 2.5 */
/******************************************************************************************************/

	-- Insertar la versi�n actual de bd
	INSERT INTO AGINFOSISTEMA (ID,VALOR,FECHAACTUALIZACION) VALUES ('VERSIONBD','2.5',now());

	--Modificar el campo VALOR para que sea de tipo texto largo en AGINFOSISTEMA.
	ALTER TABLE AGINFOSISTEMA ALTER COLUMN VALOR TYPE TEXT;

	-- Insertar tabla de validaci�n Longitud
	INSERT INTO ADCTLGTBLVLD (ID,NOMBRE,DESCRIPCION,USOINTERNO) VALUES(
	'ID_TBLVLD_LONGITUD','Longitud','Longitud','N');
	
	-- Insertar valores en la tabla de validaci�n Longitud
	INSERT INTO ADTEXTTBLVLD (ID,VALOR,IDTBLVLD) VALUES (141,'mm','ID_TBLVLD_LONGITUD');
	INSERT INTO ADTEXTTBLVLD (ID,VALOR,IDTBLVLD) VALUES (142,'dm','ID_TBLVLD_LONGITUD');
	INSERT INTO ADTEXTTBLVLD (ID,VALOR,IDTBLVLD) VALUES (143,'cm','ID_TBLVLD_LONGITUD');
	INSERT INTO ADTEXTTBLVLD (ID,VALOR,IDTBLVLD) VALUES (144,'m','ID_TBLVLD_LONGITUD');			
	
	--Cambiar el Nombre de la Columna ID por NOMBRE
	ALTER TABLE AGINFOSISTEMA RENAME COLUMN ID TO NOMBRE;	

	--Cambiar el Tama�o de la columna de Nombre a 32
	ALTER TABLE AGINFOSISTEMA ALTER COLUMN NOMBRE TYPE VARCHAR(32);

	--Insertar Valor de DATOS_GEOGRAFICOS
	INSERT INTO AGINFOSISTEMA (NOMBRE,VALOR,FECHAACTUALIZACION) 
		VALUES ('DATOS_GEOGRAFICOS',
		'<datos_geograficos>
		   <pais codigo="108" nombre="Espa�a"/>
		   <provincia codigo="33" nombre="Asturias"/>
		</datos_geograficos>',
		now());	

	--Insertar Valor de MAP_PAISES
	INSERT INTO AGINFOSISTEMA (NOMBRE,VALOR,FECHAACTUALIZACION) 
		VALUES ('MAP_PAISES',
		'<lista_paises>
		<pais nombre="Espa�a" codigo="ES">
			<comunidad nombre="ASTURIAS, PRINCIPADO DE" codigo="03"/>
		</pais>
		</lista_paises>',
		now());

	-- A�adido nuevo campo a la tabla de relaciones de entrega para indicar el nivel documental del que se est� creando la relaci�n de entrega
	ALTER TABLE ASGTRENTREGA ADD IDNIVELDOCUMENTAL VARCHAR(32);

	-- Actualizar en la tabla relaci�n de entrega el nivel de unidad documental
	UPDATE ASGTRENTREGA SET IDNIVELDOCUMENTAL = '00000000000000000000000000000009';

    --Poner la columna IDNIVELDOCUMENTAL en ASGTRENTREGA para que no pueda ser nula.
	ALTER TABLE ASGTRENTREGA ALTER COLUMN IDNIVELDOCUMENTAL TYPE VARCHAR(32);
	ALTER TABLE ASGTRENTREGA ALTER COLUMN IDNIVELDOCUMENTAL SET NOT NULL;		
	
	-- Crear tabla de asociacion de id de ficha con el XML de mapeo a descripci�n
	CREATE TABLE ASGTMAPDESCRUDOC ( 
		IDFICHA     VARCHAR (32)  NOT NULL, 
		INFO		  TEXT  NOT NULL
	);
	
	-- Crear el �ndice para esta tabla
	CREATE UNIQUE INDEX ADASGTMAPDESCRUDOC1 ON ASGTMAPDESCRUDOC (IDFICHA);
	
	-- Insertar XML de mapeo para la ficha de unidad documental
	INSERT INTO ASGTMAPDESCRUDOC
	VALUES ('1','xmlMapeos/unidadDocumental.xml');
	
	-- Insertar XML de mapeo para la ficha de fracci�n de serie
	INSERT INTO ASGTMAPDESCRUDOC
	VALUES ('2','xmlMapeos/fraccionSerie.xml');
	
	--A�adido nivel Raiz. Creada entrada para descendientes del nivel raiz. Id ID_NIVEL_RAIZ tipo 0
	INSERT INTO ASGFESTRUCTJNIVCF ( IDNIVELPADRE, TIPONIVELPADRE, IDNIVELHIJO,TIPONIVELHIJO ) VALUES ('ID_NIVEL_RAIZ', 0, '00000000000000000000000000000001', 1);

	-- A�adido nuevo campo a tabla ASGFSERIE
	ALTER TABLE ASGFSERIE ADD INFOFICHAUDOCLVOL TEXT;

	-- Actualizar las series para meter en un xml los valores de IDFICHADESCRPREFUDOC, IDFICHACLFDOCPREFUDOC y IDLVOLPREFUDOC
	UPDATE ASGFSERIE
SET INFOFICHAUDOCLVOL = 
'<INFO_FICHA_UDOC_LVOL>
 <NIVELES_DOCUMENTALES>
	<NIVEL>
		<ID_NIVEL>00000000000000000000000000000009</ID_NIVEL>
		<ID_FICHADESCRPREFUDOC>'||idfichadescrprefudoc||'</ID_FICHADESCRPREFUDOC>
		<ID_FICHACLFDOCPREFUDOC>'||idfichaclfdocprefudoc||'</ID_FICHACLFDOCPREFUDOC>
		<ID_LVOLPREFUDOC>'||idlvolprefudoc||'</ID_LVOLPREFUDOC>
	</NIVEL>
 </NIVELES_DOCUMENTALES>
</INFO_FICHA_UDOC_LVOL>'
WHERE IDFICHADESCRPREFUDOC IS NOT NULL AND IDFICHACLFDOCPREFUDOC IS NOT NULL
AND IDLVOLPREFUDOC IS NOT NULL;

	UPDATE ASGFSERIE
SET INFOFICHAUDOCLVOL = 
'<INFO_FICHA_UDOC_LVOL>
 <NIVELES_DOCUMENTALES>
	<NIVEL>
		<ID_NIVEL>00000000000000000000000000000009</ID_NIVEL>
		<ID_LVOLPREFUDOC>'||idlvolprefudoc||'</ID_LVOLPREFUDOC>
	</NIVEL>
 </NIVELES_DOCUMENTALES>
</INFO_FICHA_UDOC_LVOL>'
WHERE IDFICHADESCRPREFUDOC IS NULL AND IDFICHACLFDOCPREFUDOC IS NULL
AND IDLVOLPREFUDOC IS NOT NULL;

	UPDATE ASGFSERIE
SET INFOFICHAUDOCLVOL = 
'<INFO_FICHA_UDOC_LVOL>
 <NIVELES_DOCUMENTALES>
	<NIVEL>
		<ID_NIVEL>00000000000000000000000000000009</ID_NIVEL>
		<ID_FICHADESCRPREFUDOC>'||idfichadescrprefudoc||'</ID_FICHADESCRPREFUDOC>
		<ID_LVOLPREFUDOC>'||idlvolprefudoc||'</ID_LVOLPREFUDOC>
	</NIVEL>
 </NIVELES_DOCUMENTALES>
</INFO_FICHA_UDOC_LVOL>'
WHERE IDFICHADESCRPREFUDOC IS NOT NULL AND IDFICHACLFDOCPREFUDOC IS NULL
AND IDLVOLPREFUDOC IS NOT NULL;	
	
	-- Eliminar columnas de la tabla ASGFSERIE
	ALTER TABLE ASGFSERIE DROP COLUMN IDFICHADESCRPREFUDOC;
	ALTER TABLE ASGFSERIE DROP COLUMN IDFICHACLFDOCPREFUDOC;
	ALTER TABLE ASGFSERIE DROP COLUMN IDLVOLPREFUDOC;
	
	-- Actualizar el idarchivo a los elementos que no son fondos o unidades o fracciones de serie
	UPDATE ASGFELEMENTOCF SET IDARCHIVO=NULL WHERE IDNIVEL NOT IN ('00000000000000000000000000000003','00000000000000000000000000000009') AND IDARCHIVO IS NOT NULL;
		
	-- Insertar el campo Emplazamiento Validado
	INSERT INTO ADCAMPODATO(ID,NOMBRE,TIPO,TIPONORMA,IDAREA,IDTBLPADRE,POSENTBL,ETIQUETAXML,DESCRIPCION) VALUES(
	'212','Emplazamiento: Validado',1,1,'1','3',6,'Validado',NULL);
		
	-- Insertar el campo Creaci�n Registro Autoridad
	INSERT INTO ADCAMPODATO ( ID, NOMBRE, TIPO, TIPONORMA, IDAREA, IDTBLPADRE, POSENTBL, ETIQUETAXML,
	DESCRIPCION ) VALUES ( 
	'124', 'Fecha Creaci�n Registro Autoridad', 3, 2, '12', NULL, NULL, 'Fecha_Registro_Autoridad', NULL); 

	--Cambiar el Nombre del Dato 'Cantidad'  ->  'Volumen y Soporte: Cantidad'	ID='7' 		
	UPDATE ADCAMPODATO SET NOMBRE='Volumen y Soporte: Cantidad' WHERE ID='7'; 		
	
	--Cambiar el Nombre del Dato 'Soporte Documental' -> 'Volumen y Soporte: Soporte Documental' ID='8' 		
	UPDATE ADCAMPODATO SET NOMBRE='Volumen y Soporte: Soporte Documental' WHERE ID='8'; 		
	
	--Cambiar el Nombre del Dato 'Interesado_Identidad' por 'Interesado: Identidad' ID='9' 		
	UPDATE ADCAMPODATO SET NOMBRE='Interesado: Identidad' WHERE ID='9'; 		
	
	--Cambiar el Nombre del Dato 'Interesado_NumIdentidad' por 'Interesado: Num. Identidad' ID='10'	
	UPDATE ADCAMPODATO SET NOMBRE='Interesado: Num. Identidad' WHERE ID='10'; 	
	
	--Cambiar el Nombre del Dato 'Interesado_Rol' por 'Interesado: Rol' ID='11' 	
	UPDATE ADCAMPODATO SET NOMBRE='Interesado: Rol' WHERE ID='11'; 	
	
	--Cambiar el Nombre del Dato 'Interesado_Validado' por 'Interesado: Validado' ID='12' 	
	UPDATE ADCAMPODATO SET NOMBRE='Interesado: Validado' WHERE ID='12'; 	
	
	--Cambiar el Nombre del Dato 'Interesado_IdTercero' por 'Interesado: Id de Terceros' ID='51' 	
	UPDATE ADCAMPODATO SET NOMBRE='Interesado: Id de Terceros' WHERE ID='51'; 	
	
	--Cambiar el Nombre del Dato 'Emplazamiento_Pa�s' por 'Emplazamiento: Pa�s' ID='2'	
	UPDATE ADCAMPODATO SET NOMBRE='Emplazamiento: Pa�s' WHERE ID='2'; 		
	
	--Cambiar el Nombre del Dato 'Emplazamiento_Comunidad' por 'Emplazamiento: Provincia' ID='39' 	
	UPDATE ADCAMPODATO SET NOMBRE='Emplazamiento: Provincia' WHERE ID='39'; 	
	
	--Cambiar el Nombre del Dato 'Emplazamiento_Concejo' por 'Emplazamiento: Municipio' ID='40' 	
	UPDATE ADCAMPODATO SET NOMBRE='Emplazamiento: Municipio' WHERE ID='40'; 	
	
	--Cambiar el Nombre del Dato 'Emplazamiento_Poblaci�n' por 'Emplazamiento: Poblaci�n' ID='41' 	
	UPDATE ADCAMPODATO SET NOMBRE='Emplazamiento: Poblaci�n' WHERE ID='41'; 	
	
	--Cambiar el Nombre del Dato 'Emplazamiento_Localizaci�n' por 'Emplazamiento: Localizaci�n' ID='42' 	
	UPDATE ADCAMPODATO SET NOMBRE='Emplazamiento: Localizaci�n' WHERE ID='42'; 	
	
	--Cambiar el Nombre del Dato 'UDoc_Identificador' por 'Identificaci�n' ID='1' 		
	UPDATE ADCAMPODATO SET NOMBRE='Identificaci�n' WHERE ID='1'; 		
	
	--Cambiar el Nombre del Dato 'Fecha Inicial' por 'Fecha Extrema Inicial' ID='3' 		
	UPDATE ADCAMPODATO SET NOMBRE='Fecha Extrema Inicial'	WHERE ID='3'; 		
	
	--Cambiar el Nombre del Dato 'Fecha Final' por 'Fecha Extrema Final' ID='4' 		
	UPDATE ADCAMPODATO SET NOMBRE='Fecha Extrema Final'	WHERE ID='4'; 		
	
	--Cambiar el Nombre del Dato 'Nombre Sistema Productor' por 'Sistema Productor' ID='14' 	
	UPDATE ADCAMPODATO SET NOMBRE='Sistema Productor' WHERE ID='14'; 	
	
	--Cambiar el Nombre del Dato 'ProductorSerie_Nombre' por 'Productor: Nombre'	ID='34' 	
	UPDATE ADCAMPODATO SET NOMBRE='Productor: Nombre' WHERE ID='34'; 	
	
	--Cambiar el Nombre del Dato 'ProductorSerie_FechaIni' por 'Productor: Fecha Inicio' ID='36' 	
	UPDATE ADCAMPODATO SET NOMBRE='Productor: Fecha Inicio'	WHERE ID='36'; 	
	
	--Cambiar el Nombre del Dato 'ProductorSerie_FechaFin' por 'Productor: Fecha Fin' ID='37' 	
	UPDATE ADCAMPODATO SET NOMBRE='Productor: Fecha Fin' WHERE ID='37'; 	
	
	--Cambiar el Nombre del Dato 'Descripci�n Contenido' por 'Descripci�n de Contenido' ID='13' 	
	UPDATE ADCAMPODATO SET NOMBRE='Descripci�n de Contenido' WHERE ID='13'; 	
	
	--Cambiar el Nombre del Dato 'DocumentoF_Nombre' por 'Documento F�sico: Nombre' ID='19' 	
	UPDATE ADCAMPODATO SET NOMBRE='Documento F�sico: Nombre' WHERE ID='19'; 	
	
	--Cambiar el Nombre del Dato 'DocumentoF_Descripci�n' por 'Documento F�sico: Descripci�n' ID='43' 	
	UPDATE ADCAMPODATO SET NOMBRE='Documento F�sico: Descripci�n' WHERE ID='43'; 	
	
	--Cambiar el Nombre del Dato 'DocumentoE_Nombre' por 'Documento Electr�nico: Nombre' ID='49' 	
	UPDATE ADCAMPODATO SET NOMBRE='Documento Electr�nico: Nombre' WHERE ID='49'; 	
	
	--Cambiar el Nombre del Dato 'DocumentoE_Descripcion' por 'Documento Electr�nico: Descripcion' ID='50' 	
	UPDATE ADCAMPODATO SET NOMBRE='Documento Electr�nico: Descripcion' WHERE ID='50'; 	
	
	--Cambiar el Nombre del Dato 'Valoraci�n_FechaEliminaci�n' por 'Valoraci�n: FechaEliminaci�n' ID='20' 	
	UPDATE ADCAMPODATO SET NOMBRE='Valoraci�n: FechaEliminaci�n' WHERE ID='20'; 	
	
	--Cambiar el Nombre del Dato 'Valoraci�n Serie' por 'Valoraci�n de Serie' ID='46' 	
	UPDATE ADCAMPODATO SET NOMBRE='Valoraci�n de Serie' WHERE ID='46'; 	
	
	--Cambiar el Nombre del Dato 'Originales_Existen' por 'Originales: Existen' ID='27' 	
	UPDATE ADCAMPODATO SET NOMBRE='Originales: Existen'	WHERE ID='27'; 	
	
	--Cambiar el Nombre del Dato 'Originales_Descripci�n/Ubicaci�n' por 'Originales: Descripci�n/Ubicaci�n' ID='28' 	
	UPDATE ADCAMPODATO SET NOMBRE='Originales: Descripci�n/Ubicaci�n' WHERE ID='28'; 	
	
	--Cambiar el Nombre del Dato 'Copias_Existen' por 'Copias: Existen' ID='29' 	
	UPDATE ADCAMPODATO SET NOMBRE='Copias: Existen'	WHERE ID='29'; 	
	
	--Cambiar el Nombre del Dato 'Copias_Descripci�n/Ubicaci�n' por 'Copias: Descripci�n/Ubicaci�n' ID='30' 	
	UPDATE ADCAMPODATO SET NOMBRE='Copias: Descripci�n/Ubicaci�n' WHERE ID='30'; 	
	
	--Cambiar el Nombre del Dato 'Unidades Descripci�n Relacionadas' 'Unidades de Descripci�n Relacionadas' ID='31'	
	UPDATE ADCAMPODATO SET NOMBRE='Unidades de Descripci�n Relacionadas' WHERE ID='31'; 	
	
	--Cambiar el Nombre del Dato 'Nota Publicaci�n' por 'Nota de Publicaci�n' ID='32' 	
	UPDATE ADCAMPODATO SET NOMBRE='Nota de Publicaci�n'	WHERE ID='32'; 	
	
	--Cambiar el Nombre del Dato 'Nombre entidad relacionada' por 'Entidad relacionada: Nombre' ID='114'	
	UPDATE ADCAMPODATO SET NOMBRE='Entidad relacionada: Nombre' WHERE ID='114'; 	
	
	--Cambiar el Nombre del Dato 'Tipo de relaci�n' por 'Entidad relacionada: Tipo de relaci�n' ID='115' 	
	UPDATE ADCAMPODATO SET NOMBRE='Entidad relacionada: Tipo de relaci�n' WHERE ID='115'; 	
	
	--Cambiar el Nombre del Dato 'Descripci�n de relaci�n' por 'Entidad relacionada: Descripci�n de relaci�n' ID='116' 	
	UPDATE ADCAMPODATO SET NOMBRE='Entidad relacionada: Descripci�n de relaci�n' WHERE ID='116'; 	
	
	--Cambiar el Nombre del Dato 'Fecha inicio relaci�n' por 'Entidad relacionada: Fecha inicio de relaci�n' ID='117' 	
	UPDATE ADCAMPODATO SET NOMBRE='Entidad relacionada: Fecha inicio de relaci�n' WHERE ID='117'; 	
	
	--Cambiar el Nombre del Dato 'Fecha fin relaci�n' por 'Entidad relacionada: Fecha fin de relaci�n' ID='118' 	
	UPDATE ADCAMPODATO SET NOMBRE='Entidad relacionada: Fecha fin de relaci�n' WHERE ID='118'; 	
	
	--Cambiar el Nombre del Dato 'Identificador instituci�n' por 'Identificador de instituci�n' ID='120' 	
	UPDATE ADCAMPODATO SET NOMBRE='Identificador de instituci�n' WHERE ID='120'; 	


/**************************************************************************************
 *	ACTUALIZAR USO DE OBJETOS																												
 **************************************************************************************/

	-- Eliminar todos los objetos usados en la ficha para darlos de alta de nuevo
	DELETE FROM ADUSOOBJETO;	

/**************************************************************************************
 *	FICHA DE UNIDAD DOCUMENTAL																												
 **************************************************************************************/

--Area de menci�n de la identidad                                                             				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'1',1); 

	--Dato:UDoc_Identificador                                                                     				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',1,'1',1); 																

	--Campo Tabla:Emplazamientos                                                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('3',5,'1',1);
		
		--Dato:Emplazamiento_Pa�s                                                                     				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('2',1,'1',1); 			
		
		--Dato:Emplazamiento_Provincia                                                                				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('39',1,'1',1); 
		
		--Dato:Emplazamiento_Concejo                                                                  				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('40',1,'1',1); 															

		--Dato:Emplazamiento_Poblaci�n                                                                				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('41',1,'1',1); 															

		--Dato:Emplazamiento_Localizaci�n                                                             				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('42',1,'1',1); 			
																
		--Dato:Emplazamiento_Validado                                                                 				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('212',1,'1',1);

	--Dato:Fecha Inicial                                                                          				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('3',1,'1',1); 

	--Dato:Fecha Final                                                                            				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('4',1,'1',1);

	--Campo Tabla:Volumen y Soporte                                                     	          				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',5,'1',1);

		--Dato:Cantidad                                                                               				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('7',1,'1',1); 		

		--Dato:Soporte Documental                                                                               				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('8',1,'1',1); 		
	
	--Campo Tabla:Interesados                                                                     				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('2',5,'1',1); 
 																
		--Dato:Interesado_NumIdentidad                                                                				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('10',1,'1',1); 		
		
		--Dato:Interesado_Identidad                                                                   				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('9',1,'1',1); 			
		
		--Dato:Interesado_Rol                                                                         				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('11',1,'1',1); 															

		--Dato:Interesado_Validado                                                                    				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('12',1,'1',1); 		
		
		--Dato:Interesado_IdTercero                                                                   				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('51',1,'1',1); 		
		
	--Dato:Nombre Sistema Productor                                                               				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('14',1,'1',1); 	
															
	--Dato:Publicaci�n SAC                                                                        				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('15',1,'1',1);

--Area de contexto                                                                            				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('2',4,'1',1); 														

	--Dato:Productor                                                                              				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('16',1,'1',1); 															
	
	--Dato:Historia Institucional                                                                 				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('17',1,'1',1); 															
	
	--Dato:Historia Archiv�stica                                                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('18',1,'1',1);

--Area de alcance y contenido                                                                 				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('3',4,'1',1); 

	--Campo Tabla:Documentos F�sicos                                                              				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('4',5,'1',1); 	
		
		--Dato:Descripci�n Contenido                                                                  				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('13',1,'1',1); 	
	
		--Dato:DocumentoF_Nombre                                                                      				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('19',1,'1',1); 
	
	--Dato:DocumentoF_Descripci�n                                                                 				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('43',1,'1',1);

	--Campo Tabla:Documentos Electr�nicos                                                         				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('6',5,'1',1);

	--Dato:DocumentoE_Nombre                                                                      				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('49',1,'1',1); 

	--Dato:DocumentoE_Descripcion                                                                 				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('50',1,'1',1);

	--Dato:Valoraci�n_FechaEliminaci�n                                                            				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('20',1,'1',1); 															

 	--Dato:Nuevos ingresos                                                                        				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('21',1,'1',1); 

--Area de condiciones de acceso y seguridad                                                   				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('4',4,'1',1); 	

	--Dato:Condiciones de Acceso                                                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('22',1,'1',1); 															
	
	--Dato:Condiciones de Reproducci�n                                                            				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('23',1,'1',1); 															
	
	--Dato:Lenguas                                                                                				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('24',1,'1',1); 															
	
	--Dato:Caracter�sticas f�sicas                                                                				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('25',1,'1',1); 															
	
	--Dato:Instrumentos de Descripci�n                                                            				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('26',1,'1',1); 															

--Area de documentaci�n asociada                                                              				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('5',4,'1',1); 

	--Dato:Originales_Existen                                                                     				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('27',1,'1',1); 															

	--Dato:Originales_Descripci�n/Ubicaci�n                                                       				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('28',1,'1',1); 															

	--Dato:Copias_Existen                                                                         				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('29',1,'1',1); 															

	--Dato:Copias_Descripci�n/Ubicaci�n                                                           				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('30',1,'1',1); 															

	--Dato:Unidades Descripci�n Relacionadas                                                      				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('31',1,'1',1); 															

	--Dato:Nota Publicaci�n                                                                       				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('32',1,'1',1); 															

--Area de notas                                                                               				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('6',4,'1',1); 	
	
	--Dato:Notas                                                                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('35',1,'1',1); 

--Area de control de la descripci�n                                                           				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('7',4,'1',1); 
	
	--Dato:Normas utilizadas                                                                      				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('33',1,'1',1); 															

--Area de descriptores                                                                        				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('8',4,'1',1);															

	--Dato:Descriptor                                                                             				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('44',1,'1',1);															
 																

--DESCRIPTOR

	--Descriptor:Organizaci�n                                                                     				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_LIST_BDORGANIZACION',3,'1',1); 					

	--Descriptor:Provincia
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_LIST_PROVINCIA',3,'1',1); 								

	--Descriptor:Municipio                                                                        				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_LIST_CONCEJO',3,'1',1); 									

	--Descriptor:Instituci�n                                                                      				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_LIST_INSTITUCION',3,'1',1); 							

	--Descriptor:Interesados                                                                      				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_LIST_INTERESADO',3,'1',1); 							

	--Descriptor:Organo                                                                           				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_LIST_ORGANO',3,'1',1); 									

	--Descriptor:Pa�s                                                                             				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_LIST_PAIS',3,'1',1); 										

	--Descriptor:Poblaci�n                                                                        				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_LIST_POBLACION',3,'1',1); 								


--TABLAS DE VALIDACION

	--Tabla de Validaci�n:Formas de ingreso                                                       				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_TBLVLD_INGRESOS',2,'1',1); 							

	--Tabla de Validaci�n:Lengua                                                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_TBLVLD_LENGUA',2,'1',1); 								

	--Tabla de Validaci�n:Rol interesado                                                          				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_TBLVLD_ROLES_INTERESADO',2,'1',1); 			

	--Tabla de Validaci�n:Si/No                                                                   				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_TBLVLD_SINO',2,'1',1); 
		
/**************************************************************************************
 *	FICHA DE SERIE																																		*
 **************************************************************************************/	
 
--Area de menci�n de la identidad                                                             				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'2',1); 																

	--Dato:Fecha Inicial                                                                          				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('3',1,'2',1);
	
	--Dato:Fecha Final                                                                            				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('4',1,'2',1);
	
	--Campo Tabla:Volumen y Soporte                                                               				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',5,'2',1); 
	
		--Dato:Cantidad                                                                               				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('7',1,'2',1); 
	
		--Dato:Soporte Documental                                                                     				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('8',1,'2',1);
	
		--Dato:Nombre Sistema Productor                                                               				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('14',1,'2',1); 															

		--Dato:Publicaci�n SAC                                                                        				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('15',1,'2',1); 
		
--Area de contexto                                                                            				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('2',4,'2',1); 

	--Campo Tabla:Productores de Serie                                                            				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('5',5,'2',1);
	
		--Dato:ProductorSerie_Nombre                                                                  				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('34',1,'2',1); 	
	
		--Dato:ProductorSerie_FechaIni                                                                				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('36',1,'2',1); 															
		
		--Dato:ProductorSerie_FechaFin                                                                				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('37',1,'2',1);
	
	--Dato:Historia Institucional                                                                 				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('17',1,'2',1); 															
	
	--Dato:Historia Archiv�stica                                                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('18',1,'2',1);
	
--Area de alcance y contenido                                                                 				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('3',4,'2',1);

	--Dato:Alcance y contenido                                                                    				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('38',1,'2',1);
	
	--Dato:Valoraci�n Serie                                                                       				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('46',1,'2',1);	
	
	--Dato:Admite Nuevos Ingresos                                                                 				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('47',1,'2',1);
	
--Area de condiciones de acceso y seguridad                                                   				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('4',4,'2',1); 

	--Dato:Condiciones de Acceso                                                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('22',1,'2',1); 															
	
	--Dato:Condiciones de Reproducci�n                                                            				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('23',1,'2',1); 															
	
	--Dato:Lenguas                                                                                				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('24',1,'2',1); 															
	
	--Dato:Caracter�sticas f�sicas                                                                				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('25',1,'2',1); 															
	
	--Dato:Instrumentos de Descripci�n                                                            				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('26',1,'2',1); 															

--Area de documentaci�n asociada                                                              				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('5',4,'2',1);

		--Dato:Originales_Existen                                                                     				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('27',1,'2',1); 															
	
	--Dato:Originales_Descripci�n/Ubicaci�n                                                       				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('28',1,'2',1); 															

	--Dato:Copias_Existen                                                                         				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('29',1,'2',1); 															

	--Dato:Copias_Descripci�n/Ubicaci�n                                                           				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('30',1,'2',1); 															
	
	--Dato:Nota Publicaci�n                                                                       				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('32',1,'2',1); 
	
	
--Area de notas                                                                               				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('6',4,'2',1); 

	--Dato:Notas                                                                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('35',1,'2',1); 																


--Area de control de la descripci�n                                                           				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('7',4,'2',1); 
	
	--Dato:Normas utilizadas                                                                      				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('33',1,'2',1);
	
--Area de descriptores                                                                        				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('8',4,'2',1);	

	--Dato:Descriptor                                                                             				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('44',1,'2',1);
	
	
--DESCRIPTORES	
	--Descriptor:Organizaci�n                                                                     				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_LIST_BDORGANIZACION',3,'2',1); 
	
	--Descriptor:Organizaci�n                                                                     				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_LIST_ORGANO',3,'2',1);
	
	--Descriptor:Organizaci�n                                                                     				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_LIST_INSTITUCION',3,'2',1);							

--TABLAS DE VALIDACION	
	
	--Tabla de Validaci�n:Lengua                                                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_TBLVLD_LENGUA',2,'2',1); 								

	--Tabla de Validaci�n:Si/No                                                                   				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_TBLVLD_SINO',2,'2',1); 
	
	--Tabla de Validaci�n:Longitud
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_TBLVLD_LONGITUD',2,'2',1); 
	
/**************************************************************************************
 *	FICHA DE CLASIFICADOR 																														*
 **************************************************************************************/
 --Area de menci�n de la identidad                                                             				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'3',1);

	--Dato:Fecha Inicial                                                                          				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('3',1,'3',1);
	
	--Dato:Fecha Final                                                                            				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('4',1,'3',1);
	
	--Tabla:Volumen y Soporte                                                               				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',5,'3',1);	
	
		--Campo Tabla:Cantidad                                                                               				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('7',1,'3',1);
		
		--Campo Tabla:Soporte Documental                                                                     				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('8',1,'3',1);	
		
		--Campo Tabla:Nombre Sistema Productor                                                               				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('14',1,'3',1);
		
		--Campo Tabla:Publicaci�n SAC                                                                        				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('15',1,'3',1); 
		
--Area de contexto                                                                            				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('2',4,'3',1); 	

	--Dato:Productor                                                                              				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('16',1,'3',1); 															
	
	--Dato:Historia Institucional                                                                 				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('17',1,'3',1); 															
	
	--Dato:Historia Archiv�stica                                                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('18',1,'3',1);		
	
--Area de alcance y contenido                                                                 				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('3',4,'3',1); 

	--Dato:Alcance y contenido                                                                    				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('38',1,'3',1); 
	
	--Dato:Admite Nuevos Ingresos                                                                 				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('47',1,'3',1); 															
	
	--Dato:Valoraci�n en porcentaje                                                               				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('48',1,'3',1);
	
--Area de condiciones de acceso y seguridad                                                   				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('4',4,'3',1); 	

	--Dato:Condiciones de Acceso                                                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('22',1,'3',1); 															
	
	--Dato:Condiciones de Reproducci�n                                                            				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('23',1,'3',1); 															
	
	--Dato:Lenguas                                                                                				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('24',1,'3',1); 															
	
	--Dato:Caracter�sticas f�sicas                                                                				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('25',1,'3',1); 															
	
	--Dato:Instrumentos de Descripci�n                                                            				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('26',1,'3',1); 	
	
--Area de documentaci�n asociada                                                              				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('5',4,'3',1); 	

	--Dato:Originales_Existen                                                                     				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('27',1,'3',1); 															
	
	--Dato:Originales_Descripci�n/Ubicaci�n                                                       				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('28',1,'3',1); 															
	
	--Dato:Copias_Existen                                                                         				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('29',1,'3',1); 															
	
	--Dato:Copias_Descripci�n/Ubicaci�n                                                           				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('30',1,'3',1); 															
	
	--Dato:Nota Publicaci�n                                                                       				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('32',1,'3',1); 	

--Area de notas                                                                               				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('6',4,'3',1);	

	--Dato:Notas                                                                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('35',1,'3',1);
	
	
--Area de control de la descripci�n                                                           				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('7',4,'3',1);	

	--Dato:Normas utilizadas                                                                      				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('33',1,'3',1);
	
--Area de descriptores                                                                        				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('8',4,'3',1);

	--Dato:Descriptor                                                                             				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('44',1,'3',1); 															


--TABLAS DE VALIDACION

--Tabla de Validaci�n:Lengua                                                                  				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_TBLVLD_LENGUA',2,'3',1); 								

--Tabla de Validaci�n:Si/No                                                                   				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_TBLVLD_SINO',2,'3',1);


/**************************************************************************************
 *	FICHA DE FONDO																																		*
 **************************************************************************************/
--Area de menci�n de la identidad                                                             				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'4',1);

	--Dato:Fecha Inicial                                                                          				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('3',1,'4',1);
	
	--Dato:Fecha Final                                                                            				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('4',1,'4',1); 
	
	--Campo Tabla:Volumen y Soporte                                                               				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',5,'4',1);
	
		--Dato:Cantidad                                                                               				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('7',1,'4',1); 
	
		--Dato:Soporte Documental                                                                     				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('8',1,'4',1);
		
		--Dato:Nombre Sistema Productor                                                               				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('14',1,'4',1); 															
		
		--Dato:Publicaci�n SAC                                                                        				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('15',1,'4',1); 	
		
--Area de contexto                                                                            				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('2',4,'4',1); 	

	--Dato:Productor                                                                              				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('16',1,'4',1); 															
	
	--Dato:Historia Institucional                                                                 				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('17',1,'4',1); 															
	
	--Dato:Historia Archiv�stica                                                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('18',1,'4',1); 
	
--Area de alcance y contenido                                                                 				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('3',4,'4',1); 	

	--Dato:Alcance y contenido                                                                    				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('38',1,'4',1); 
	
	--Dato:Admite Nuevos Ingresos                                                                 				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('47',1,'4',1); 															
	
	--Dato:Valoraci�n en porcentaje                                                               				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('48',1,'4',1);	
	
--Area de condiciones de acceso y seguridad                                                   				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('4',4,'4',1);

	--Dato:Condiciones de Acceso                                                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('22',1,'4',1); 															
	
	--Dato:Condiciones de Reproducci�n                                                            				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('23',1,'4',1); 															
	
	--Dato:Lenguas                                                                                				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('24',1,'4',1); 															
	
	--Dato:Caracter�sticas f�sicas                                                                				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('25',1,'4',1); 															
	
	--Dato:Instrumentos de Descripci�n                                                            				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('26',1,'4',1);			
	
--Area de documentaci�n asociada                                                              				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('5',4,'4',1);

	--Dato:Originales_Existen                                                                     				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('27',1,'4',1); 															
	
	--Dato:Originales_Descripci�n/Ubicaci�n                                                       				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('28',1,'4',1); 															
	
	--Dato:Copias_Existen                                                                         				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('29',1,'4',1); 															
	
	--Dato:Copias_Descripci�n/Ubicaci�n                                                           				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('30',1,'4',1); 															
	
	--Dato:Nota Publicaci�n                                                                       				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('32',1,'4',1); 
	
--Area de notas                                                                               				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('6',4,'4',1); 

	--Dato:Notas                                                                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('35',1,'4',1);
	
--Area de control de la descripci�n                                                           				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('7',4,'4',1);

	--Dato:Normas utilizadas                                                                      				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('33',1,'4',1);	
	
--Area de descriptores                                                                        				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('8',4,'4',1);

	--Dato:Descriptor                                                                             				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('44',1,'4',1);	
	

--TABLAS DE VALIDACION

	--Tabla de Validaci�n:Lengua                                                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_TBLVLD_LENGUA',2,'4',1); 								

	--Tabla de Validaci�n:Si/No                                                                   				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_TBLVLD_SINO',2,'4',1); 	
	
	
/**************************************************************************************
 *	FICHA DE ISAAR																																		*
 **************************************************************************************/
 
 --Area de Identificaci�n                                                                      				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('9',4,'5',1);

	--Dato:Tipo de entidad                                                                        				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('100',1,'5',1); 															

	--Dato:Forma autorizada de nombre                                                             				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('101',1,'5',1);
	
	--Dato:Formas paralelas de nombre                                                             				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('102',1,'5',1); 															
	
	--Dato:Formas normalizadas de nombre                                                          				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('103',1,'5',1); 															
	
	--Dato:Otras formas de nombre                                                                 				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('104',1,'5',1); 															
	
	--Dato:Identificadores para instituciones                                                     				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('105',1,'5',1); 															

--Area de Descripci�n                                                                         				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('10',4,'5',1);

	--Dato:Fechas de existencia                                                                   				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('106',1,'5',1); 															
	
	--Dato:Historia                                                                               				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('107',1,'5',1); 															
	
	--Dato:Lugar                                                                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('108',1,'5',1); 															
	
	--Dato:Estatuto jur�dico                                                                      				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('109',1,'5',1); 	
	
	--Dato:Funciones, ocupaciones                                                                 				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('110',1,'5',1); 															
	
	--Dato:Atribuciones/Fuentes Legales                                                           				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('111',1,'5',1); 															
	
	--Dato:Estructura interna/Genealog�a                                                          				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('112',1,'5',1); 															
	
	--Dato:Contexto General                                                                       				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('113',1,'5',1);		
	
--Area de Relaciones                                                                          				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('11',4,'5',1); 

	--Campo Tabla:Entidades Relacionadas                                                          				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('100',5,'5',1);	
	
	--Dato:Nombre entidad relacionada                                                             				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('114',1,'5',1); 															
	
	--Dato:Tipo de relaci�n                                                                       				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('115',1,'5',1); 															
	
	--Dato:Descripci�n de relaci�n                                                                				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('116',1,'5',1); 															
	
	--Dato:Fecha inicio relaci�n                                                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('117',1,'5',1);		
	
--Area de Control                                                                             				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('12',4,'5',1);

	--Dato:Fecha fin relaci�n                                                                     				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('118',1,'5',1); 															
	
	--Dato:Identificador de autoridad                                                             				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('119',1,'5',1); 															
	
	--Dato:Identificador instituci�n                                                              				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('120',1,'5',1); 															
	
	--Dato:Reglas/Convenciones                                                                    				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('121',1,'5',1); 															
	
	--Dato:Estado de elaboraci�n                                                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('122',1,'5',1); 															
	
	--Dato:Nivel de detalle                                                                       				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('123',1,'5',1); 															

	--Dato:Fecha creaci�n registro autoridad                                                                       				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('124',1,'5',1);
	
	--Dato:Lenguas y escrituras                                                                   				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('127',1,'5',1); 															
	
	--Dato:Fuentes                                                                                				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('128',1,'5',1); 															
	
	--Dato:Nota de mantenimiento                                                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('129',1,'5',1);		
	
--Area Relaci�n de instituciones, personas y familias, con documentos de archivo y otros recurso  				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('13',4,'5',1); 		

	--Campo Tabla:Relaciones de entidades con otros recursos                                      				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('101',5,'5',1);											
	
		--Dato:T�tulo de recurso                                                                      				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('130',1,'5',1); 															
		
		--Dato:Identificador de recurso                                                               				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('131',1,'5',1); 															
		
		--Dato:T�po de recurso                                                                        				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('132',1,'5',1); 															
		
		--Dato:Naturaleza de la relaci�n                                                              				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('133',1,'5',1); 															
		
		--Dato:Fecha de relaci�n                                                                      				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('134',1,'5',1); 	


--DESCRIPTORES
	--Descriptor:Municipio                                                                        				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_LIST_CONCEJO',3,'5',1); 									
	
	--Descriptor:Geogr�fico                                                                       				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_LIST_GEOGRAFICO',3,'5',1); 							

	--Descriptor:Poblaci�n                                                                        				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_LIST_POBLACION',3,'5',1); 								

--TABLAS DE VALIDACION
	--Tabla de Validaci�n:Estado de elaboraci�n                                         				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_TBLVLD_ESTADOELAB',2,'5',1); 						
	
	--Tabla de Validaci�n:Lengua                                                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_TBLVLD_LENGUA',2,'5',1); 								
	
	--Tabla de Validaci�n:Nivel de detalle                                                				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_TBLVLD_NDETALLE',2,'5',1); 							
	
	--Tabla de Validaci�n:Tipo de relaci�n de entidades                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_TBLVLD_NRELACION',2,'5',1); 							
	
	--Tabla de Validaci�n:Tipo de entidad                                               				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_TBLVLD_TIPOENTIDAD',2,'5',1); 						
	
	--Tabla de Validaci�n:Tipo de recurso                                               				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_TBLVLD_TIPORECURSO',2,'5',1); 						
	
	--Tabla de Validaci�n:Tipo de relaci�n                                             				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_TBLVLD_TIPORELACION',2,'5',1);


 /**************************************************************************************
 *	FICHA DE FRACCION DE SERIE																												*
 **************************************************************************************/
--Area de menci�n de la identidad                                                             				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'6',1); 

	--Dato:UDoc_Identificador                                                            	         				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',1,'6',1); 																	

	--Campo Tabla:Rangos de expedientes
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('102',5,'6',1);
	
		--Dato:Desde
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('201',1,'6',1);
		
		--Dato:Hasta
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('202',1,'6',1);		

	--Campo Tabla:Emplazamientos                                                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('3',5,'6',1);	
		
		--Dato:Emplazamiento_Pa�s                                                                     				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('2',1,'6',1); 
	
		--Dato:Emplazamiento_Comunidad                                                                				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('39',1,'6',1); 	
		
		--Dato:Emplazamiento_Concejo                                                                  				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('40',1,'6',1); 															

		--Dato:Emplazamiento_Poblaci�n                                                                				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('41',1,'6',1);		
		
		--Dato:Emplazamiento_Localizaci�n                                                             				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('42',1,'6',1);		

		--Dato:Emplazamiento_Validado                                                             				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('212',1,'6',1);	
		--Dato:Fecha Inicial                                                                          				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('3',1,'6',1); 	
		
		--Dato:Fecha Final                                                                            				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('4',1,'6',1); 
															
		--Campo Tabla:Volumen y Soporte                                                               				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',5,'6',1);
 			
		--Dato:Soporte                                                                                				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('6',1,'6',1);  			
 			
		--Dato:Formato                                                                                				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('5',1,'6',1);  			

		--Dato:Cantidad                                                                               				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('7',1,'6',1); 			
 			
	--Campo Tabla:Interesados                                                                     				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('2',5,'6',1);  																

		--Dato:Interesado_Identidad                                                                   				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('9',1,'6',1);

		--Dato:Interesado_NumIdentidad                                                                				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('10',1,'6',1); 															

		--Dato:Interesado_Rol                                                                         				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('11',1,'6',1); 															

		--Dato:Interesado_Validado                                                                    				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('12',1,'6',1);

		--Dato:Interesado_IdTercero                                                                   				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('51',1,'6',1); 	
		
		--Dato:Interesado_Principal                                                                    				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('213',1,'6',1); 														

		--Dato:Nombre Sistema Productor                                                               				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('14',1,'6',1); 															
		
		--Dato:Publicaci�n SAC                                                                        				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('15',1,'6',1); 							

--Area de contexto                                                                            				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('2',4,'6',1);

	--Dato:Productor                                                                              				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('16',1,'6',1); 															
	
	--Dato:Historia Institucional                                                                 				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('17',1,'6',1); 															
	
	--Dato:Historia Archiv�stica                                                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('18',1,'6',1);

--Area de alcance y contenido                                                                 				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('3',4,'6',1);

	--Dato:Descripci�n Contenido                                                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('13',1,'6',1);
		 															
	--Campo Tabla:Documentos F�sicos                                                              				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('4',5,'6',1); 
 															
	--Dato:DocumentoF_Nombre                                                                      				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('19',1,'6',1);
 															
 	--Dato:DocumentoF_Descripci�n                                                                 				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('43',1,'6',1);															

	 --Campo Tabla:Documentos Electr�nicos                                                         				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('6',5,'6',1);															

	--Dato:DocumentoE_Nombre                                                                      				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('49',1,'6',1);																

	--Dato:DocumentoE_Descripcion                                                                 				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('50',1,'6',1); 																

	--Dato:Valoraci�n_FechaEliminaci�n                                                            				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('20',1,'6',1); 															

	--Dato:Nuevos ingresos                                                                        				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('21',1,'6',1);
																
--Area de condiciones de acceso y seguridad                                                   				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('4',4,'6',1); 

	--Dato:Condiciones de Acceso                                                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('22',1,'6',1); 															
	
	--Dato:Condiciones de Reproducci�n                                                            				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('23',1,'6',1); 															
	
	--Dato:Lenguas                                                                                				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('24',1,'6',1); 															
	
	--Dato:Caracter�sticas f�sicas                                                                				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('25',1,'6',1); 															
	
	--Dato:Instrumentos de Descripci�n                                                            				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('26',1,'6',1); 															
	
--Area de documentaci�n asociada                                                              				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('5',4,'6',1); 

	--Dato:Originales_Existen                                                                     				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('27',1,'6',1); 															

	--Dato:Originales_Descripci�n/Ubicaci�n                                                       				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('28',1,'6',1); 															
	
	--Dato:Copias_Existen                                                                         				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('29',1,'6',1); 															
	
	--Dato:Copias_Descripci�n/Ubicaci�n                                                           				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('30',1,'6',1); 															
	
	--Dato:Unidades Descripci�n Relacionadas                                                      				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('31',1,'6',1); 															
	
	--Dato:Nota Publicaci�n                                                                       				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('32',1,'6',1); 
														
--Area de notas                                                                               				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('6',4,'6',1);

	--Dato:Notas                                                                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('35',1,'6',1);
														

--Area de control de la descripci�n                                                           				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('7',4,'6',1);

	--Dato:Normas utilizadas                                                                      				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('33',1,'6',1); 															

--Area de descriptores                                                                        				
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('8',4,'6',1);
 															
	--Dato:Descriptor                                                                             				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('44',1,'6',1);
															

--DESCRIPTORES

	--Descriptor:Comunidad Aut�noma                                                               				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_LIST_COMUNIDAD',3,'6',1); 								
	
	--Descriptor:Municipio                                                                        				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_LIST_CONCEJO',3,'6',1); 									
	
	--Descriptor:Interesados                                                                      				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_LIST_INTERESADO',3,'6',1); 							
	
	--Descriptor:Pa�s                                                                             				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_LIST_PAIS',3,'6',1); 										
	
	--Descriptor:Poblaci�n                                                                        				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_LIST_POBLACION',3,'6',1); 								
	--Descriptor:Organizaci�n                                                                        				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_LIST_BDORGANIZACION',3,'6',1); 									

	--Descriptor:Organo                                                                     				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_LIST_ORGANO',3,'6',1); 
	
	--Descriptor:Instituci�n                                                                        				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_LIST_INSTITUCION',3,'6',1); 
--TABLAS DE VALIDACION

	--Tabla de Validaci�n:Formato                                                                 				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_TBLVLD_FORMATO',2,'6',1); 								
	
	--Tabla de Validaci�n:Formas de ingreso                                                       				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_TBLVLD_INGRESOS',2,'6',1); 							
	
	--Tabla de Validaci�n:Lengua                                                                  				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_TBLVLD_LENGUA',2,'6',1); 								
	
	--Tabla de Validaci�n:Rol interesado                                                          				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_TBLVLD_ROLES_INTERESADO',2,'6',1); 			
	
	--Tabla de Validaci�n:Si/No                                                                   				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_TBLVLD_SINO',2,'6',1); 									
	
	--Tabla de Validaci�n:Soporte                                                                 				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_TBLVLD_SOPORTE',2,'6',1); 	                                                                           


/********************************************
 * Asignar los campos a las tablas
 ********************************************/
 
--Area de menci�n de la identidad->UDoc_Identificador	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'1',2);
 														
--Area de menci�n de la identidad->Emplazamiento_Pa�s	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'2',2);
 														
--Area de menci�n de la identidad->Fecha Inicial 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'3',2);
 														
--Area de menci�n de la identidad->Fecha Final   	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'4',2);
 														
--Area de menci�n de la identidad->Cantidad  	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'7',2);
 														
--Area de menci�n de la identidad->Soporte Documental	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'8',2);
 														
--Area de menci�n de la identidad->Interesado_Identidad  	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'9',2);
 														
--Area de menci�n de la identidad->Interesado_NumIdentidad   	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'10',2);
 														
--Area de menci�n de la identidad->Interesado_Rol	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'11',2);
 														
--Area de menci�n de la identidad->Interesado_Validado   	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'12',2);
 														
--Area de menci�n de la identidad->Interesado_IdTercero  	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'51',2);
														
--Area de alcance y contenido->Descripci�n Contenido 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('3',4,'13',2);
 														
--Area de menci�n de la identidad->Nombre Sistema Productor  	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'14',2);
 														
--Area de menci�n de la identidad->Publicaci�n SAC   	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'15',2);
 														
--Area de contexto->Productor	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('2',4,'16',2);
 														
--Area de contexto->Historia Institucional   	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('2',4,'17',2);
 														
--Area de contexto->Historia Archiv�stica	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('2',4,'18',2);
 														
--Area de alcance y contenido->DocumentoF_Nombre 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('3',4,'19',2);
 														
--Area de alcance y contenido->Valoraci�n_FechaEliminaci�n   	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('3',4,'20',2);
 														
--Area de alcance y contenido->Nuevos ingresos   	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('3',4,'21',2);
 														
--Area de condiciones de acceso y seguridad->Condiciones de Acceso   	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('4',4,'22',2);
 														
--Area de condiciones de acceso y seguridad->Condiciones de Reproducci�n 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('4',4,'23',2);
 														
--Area de condiciones de acceso y seguridad->Lenguas 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('4',4,'24',2);
 														
--Area de condiciones de acceso y seguridad->Caracter�sticas f�sicas 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('4',4,'25',2);
 														
--Area de condiciones de acceso y seguridad->Instrumentos de Descripci�n 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('4',4,'26',2);
 														
--Area de documentaci�n asociada->Originales_Existen 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('5',4,'27',2);
 														
--Area de documentaci�n asociada->Originales_Descripci�n/Ubicaci�n   	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('5',4,'28',2);
 														
--Area de documentaci�n asociada->Copias_Existen 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('5',4,'29',2);
 														
--Area de documentaci�n asociada->Copias_Descripci�n/Ubicaci�n   	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('5',4,'30',2);
 														
--Area de documentaci�n asociada->Unidades Descripci�n Relacionadas  	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('5',4,'31',2);
 														
--Area de documentaci�n asociada->Nota Publicaci�n   	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('5',4,'32',2);
 														
--Area de control de la descripci�n->Normas utilizadas   	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('7',4,'33',2);
 														
--Area de contexto->ProductorSerie_Nombre	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('2',4,'34',2);
 														
--Area de notas->Notas   	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('6',4,'35',2);
 														
--Area de contexto->ProductorSerie_FechaIni  	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('2',4,'36',2);
 														
--Area de contexto->ProductorSerie_FechaFin  	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('2',4,'37',2);
 														
--Area de alcance y contenido->Alcance y contenido   	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('3',4,'38',2);
 														
--Area de menci�n de la identidad->Emplazamiento_Comunidad   	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'39',2);
 														
--Area de menci�n de la identidad->Emplazamiento_Concejo 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'40',2);
 														
--Area de menci�n de la identidad->Emplazamiento_Poblaci�n   	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'41',2);
 														
--Area de menci�n de la identidad->Emplazamiento_Localizaci�n	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'42',2);

--Area de menci�n de la identidad->Tabla Rangos de Expedientes 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'102',2);
 														
--Area de alcance y contenido->DocumentoF_Descripci�n	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('3',4,'43',2);
 														
--Area de descriptores->Descriptor   	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('8',4,'44',2);
 														
--Area de alcance y contenido->Valoraci�n Serie  	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('3',4,'46',2);
 														
--Area de alcance y contenido->Admite Nuevos Ingresos	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('3',4,'47',2);
 														
--Area de alcance y contenido->Valoraci�n en porcentaje  	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('3',4,'48',2);
 														
--Area de alcance y contenido->DocumentoE_Nombre 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('3',4,'49',2);
 														
--Area de alcance y contenido->DocumentoE_Descripcion	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('3',4,'50',2);
 														
--Area de Identificaci�n->Tipo de entidad	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('9',4,'100',2);
														
--Area de Identificaci�n->Forma autorizada de nombre 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('9',4,'101',2);
														
--Area de Identificaci�n->Formas paralelas de nombre 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('9',4,'102',2);
														
--Area de Identificaci�n->Formas normalizadas de nombre  	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('9',4,'103',2);
														
--Area de Identificaci�n->Otras formas de nombre 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('9',4,'104',2);
														
--Area de Identificaci�n->Identificadores para instituciones 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('9',4,'105',2);
														
--Area de Descripci�n->Fechas de existencia  	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('10',4,'106',2);
													
--Area de Descripci�n->Historia  	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('10',4,'107',2);
													
--Area de Descripci�n->Lugar 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('10',4,'108',2);
													
--Area de Descripci�n->Estatuto jur�dico 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('10',4,'109',2);
													
--Area de Descripci�n->Funciones, ocupaciones	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('10',4,'110',2);
													
--Area de Descripci�n->Atribuciones/Fuentes Legales  	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('10',4,'111',2);
													
--Area de Descripci�n->Estructura interna/Genealog�a 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('10',4,'112',2);
													
--Area de Descripci�n->Contexto General  	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('10',4,'113',2);
													
--Area de Relaciones->Nombre entidad relacionada 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('11',4,'114',2);
													
--Area de Relaciones->Tipo de relaci�n   	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('11',4,'115',2);
													
--Area de Relaciones->Descripci�n de relaci�n	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('11',4,'116',2);
													
--Area de Relaciones->Fecha inicio relaci�n  	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('11',4,'117',2);
													
--Area de Relaciones->Fecha fin relaci�n 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('11',4,'118',2);
													
--Area de Control->Identificador de autoridad	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('12',4,'119',2);
													
--Area de Control->Identificador instituci�n 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('12',4,'120',2);
													
--Area de Control->Reglas/Convenciones   	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('12',4,'121',2);
													
--Area de Control->Estado de elaboraci�n 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('12',4,'122',2);
													
--Area de Control->Nivel de detalle  	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('12',4,'123',2);

--Area de Control->Fecha Creaci�n Registro Autoridad 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('12',4,'124',2);
													
--Area de Control->Lenguas y escrituras  	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('12',4,'127',2);
													
--Area de Control->Fuentes   	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('12',4,'128',2);
													
--Area de Control->Nota de mantenimiento 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('12',4,'129',2);
													
--Relaci�n de instituciones, personas y familias, con documentos de archivo y otros recursos->T�tulo de recurso  	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('13',4,'130',2);
													
--Relaci�n de instituciones, personas y familias, con documentos de archivo y otros recursos->Identificador de recurso   	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('13',4,'131',2);
													
--Relaci�n de instituciones, personas y familias, con documentos de archivo y otros recursos->Tipo de recurso	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('13',4,'132',2);
													
--Relaci�n de instituciones, personas y familias, con documentos de archivo y otros recursos->Naturaleza de la relaci�n  	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('13',4,'133',2);
													
--Relaci�n de instituciones, personas y familias, con documentos de archivo y otros recursos->Fecha de relaci�n  	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('13',4,'134',2);

--Area de menci�n de la identidad->Rango de expedientes: Desde 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'201',2);

--Area de menci�n de la identidad->Rango de expedientes: Hasta
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'202',2);
 
--Area de menci�n de la identidad->Rango de expedientes: Desde Normalizado
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'210',2);

--Area de menci�n de la identidad->Rango de expedientes: Hasta Normalizado
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'211',2);

--Area de menci�n de la identidad->Emplazamiento_Validado	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'212',2);								

/********************************************
 * Asignar las tablas a las areas
 ********************************************/

--Area de menci�n de la identidad->Tabla Volumen y Soporte   	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'1',3);
 														
--Area de menci�n de la identidad->Tabla Interesados 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'2',3);
 														
--Area de menci�n de la identidad->Tabla Emplazamientos  	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'3',3); 													

--Area de menci�n de la identidad->Tabla Rangos de Expedientes 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'102',2);
 														 														
--Area de contexto->Tabla Productores de Serie   	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('2',4,'5',3);

--Area de alcance y contenido->Tabla Documentos F�sicos 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('3',4,'4',3);
 														
--Area de alcance y contenido->Tabla Documentos Electr�nicos 	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('3',4,'6',3);
 														
--Area de Relaciones->Tabla Entidades Relacionadas   	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('11',4,'100',3);
 													
--Area de Relaciones->Tabla Relaciones de entidades con otros recursos   	
INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('11',4,'101',3); 

/******************************************************************************************************/
/* Versi�n 2.5.1 */
/******************************************************************************************************/

	-- Insertar la versi�n actual de bd
	INSERT INTO AGINFOSISTEMA (NOMBRE,VALOR,FECHAACTUALIZACION) VALUES ('VERSIONBD','2.5.1',now());
	
	-- Cambiar el tama�o a la columna titulo de unidades hist�ricas
	ALTER TABLE ASGFHISTUDOC ALTER COLUMN TITULOUDOC TYPE VARCHAR(1024);
	
	-- Cambiar el tama�o a la columna titulo de unidades
	ALTER TABLE ASGFELIMSELUDOC ALTER COLUMN TITULOUDOC TYPE VARCHAR(1024);
	
	-- Actualizar XML de mapeo para la ficha de unidad documental
	-- Ejecutar el script update_texts.sql

	-- Insertar el campo Interesado Principal
	INSERT INTO ADCAMPODATO(ID,NOMBRE,TIPO,TIPONORMA,IDAREA,IDTBLPADRE,POSENTBL,ETIQUETAXML,DESCRIPCION) VALUES(
	'213','Interesado: Principal',1,1,'1','2',6,'Principal',NULL);
	
	--Dato:Interesado_Principal                                                                    				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('213',1,'1',1); 		
	
	--Area de menci�n de la identidad->Interesado_Principal   	
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('1',4,'213',2);
	
	--Eliminar el Campo Formato
	--DELETE FROM ADCAMPODATO WHERE ID='5';

	--Eliminar el Campo Soporte
	--DELETE FROM ADCAMPODATO WHERE ID='6';
	
	--Cambiar el nombre al �ndice ADASGTMAPDESCRUDOC1
	ALTER INDEX ADASGTMAPDESCRUDOC1 RENAME TO ASGTMAPDESCRUDOC1;
	
	--Eliminar las tablas de validaci�n soporte y formato con sus datos
	--DELETE FROM ADCTLGTBLVLD WHERE ID='ID_TBLVLD_SOPORTE';
	--DELETE FROM ADCTLGTBLVLD WHERE ID='ID_TBLVLD_FORMATO';
	--DELETE FROM ADTEXTTBLVLD WHERE IDTBLVLD='ID_TBLVLD_SOPORTE';
	--DELETE FROM ADTEXTTBLVLD WHERE IDTBLVLD='ID_TBLVLD_FORMATO';	
	
/***************************/
/* Versi�n 2.6             */
/***************************/
	
	-- Insertar la versi�n actual de bd
	INSERT INTO AGINFOSISTEMA (NOMBRE,VALOR,FECHAACTUALIZACION) VALUES ('VERSIONBD','2.6',now());
	
	-- Crear una tabla para transferencias de unidades sin documentos f�sicos
	CREATE TABLE ASGTUDOCSDF(
		ID VARCHAR(32) NOT NULL,
		IDRELENTREGA VARCHAR(32) NOT NULL,
		POSICION SMALLINT NOT NULL,
		ESTADOCOTEJO SMALLINT NOT NULL,
		NOTASCOTEJO VARCHAR(254),
		SIGNATURA VARCHAR(32),
		DESCRIPCION VARCHAR(254)
	);

	-- Crear los �ndices para la tabla de unidades sin documentos f�sicos
	CREATE UNIQUE INDEX ASGTUDOCSDF1 ON ASGTUDOCSDF (ID);
	CREATE INDEX ASGTUDOCSDF2 ON ASGTUDOCSDF (IDRELENTREGA);

	-- Modificar �ndice sobre tabla de pr�rrogas para que no sea �nico
	DROP INDEX ASGPPRORROGA1;
	CREATE INDEX ASGPPRORROGA1 ON ASGPPRORROGA (IDPRESTAMO,ESTADO);

	-- Insertar nuevo campo tabla para Volumen y Forma Documental
	INSERT INTO ADCAMPOTBL ( ID, NOMBRE, TIPONORMA, IDAREA, ETIQUETAXML, ETIQXMLFILA,
	DESCRIPCION ) VALUES ( '7', 'Volumen y Forma Documental', 1, '1', 'Volumenes_FormasDoc', 'Volumen_FormaDoc', NULL); 

	-- Insertar nuevo campo cantidad para la tabla de Vol�menes y Formas Documentales
	INSERT INTO ADCAMPODATO ( ID, NOMBRE, TIPO, TIPONORMA, IDAREA, IDTBLPADRE, POSENTBL, ETIQUETAXML,
	DESCRIPCION ) VALUES ( '214', 'Volumen y Forma Documental: Cantidad', 4, 1, '1', '7', 1, 'Cantidad', NULL); 

	-- Actualizar el nombre y el padre del campo 8 de la ficha de series, clasificadores de series y fondos
	UPDATE ADCAMPODATO SET NOMBRE = 'Volumen y Forma Documental: Soporte Documental', idtblpadre='7' WHERE ID = '8';

	-- Actualizar el idcampo del campo Cantidad a 214 para todos los elementos que la ten�an excepto aquellos que 
	-- tienen el nivel de unidad documental
	UPDATE ADVCNUMCF SET IDCAMPO = '214' WHERE IDCAMPO = '7' AND IDELEMENTOCF NOT IN
	(
	    SELECT ID FROM ASGFELEMENTOCF WHERE IDNIVEL = '00000000000000000000000000000009'
	);

 /**************************************************************************************
 *	FICHA DE SERIE																																		*
 **************************************************************************************/
	
	-- Insertar el uso de los nuevos campos en la ficha de series
	-- Campo Tabla:Volumen y Forma Documental                                                	          				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('7',5,'2',1);
	
		--Dato:Cantidad                                                                               				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('214',1,'2',1);
	
	-- Eliminar el uso del campo 7 y tabla 1 en la ficha de series
	-- Uso de la tabla en la ficha
	DELETE FROM ADUSOOBJETO WHERE IDOBJ = '1' AND TIPOOBJ=5 AND IDOBJUSUARIO='2' AND TIPOOBJUSUARIO=1;
	
	
	-- Uso del campo en la ficha
	DELETE FROM ADUSOOBJETO WHERE IDOBJ = '7' AND TIPOOBJ=1 AND IDOBJUSUARIO='2' AND TIPOOBJUSUARIO=1;

	-- Tabla de Validaci�n:Formas Documentales
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_TBLVLD_FORMAS_DOCUMENTALES',2,'2',1); 
	
/**************************************************************************************
 *	FICHA DE CLASIFICADOR 																														*
 **************************************************************************************/

	-- Insertar el uso de los nuevos campos en la ficha de clasificadores de series
	--Campo Tabla:Volumen y Forma Documental                                                                				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('7',5,'3',1); 
	
		--Dato:Cantidad                                                                               				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('214',1,'3',1);
		
	-- Eliminar el uso del campo 7 y tabla 1 en la ficha de clasificadores de series
	-- Uso de la tabla en la ficha
	DELETE FROM ADUSOOBJETO WHERE IDOBJ = '1' AND TIPOOBJ=5 AND IDOBJUSUARIO='3' AND TIPOOBJUSUARIO=1;
	
	-- Uso del campo en la ficha
	DELETE FROM ADUSOOBJETO WHERE IDOBJ = '7' AND TIPOOBJ=1 AND IDOBJUSUARIO='3' AND TIPOOBJUSUARIO=1;

	-- Tabla de Validaci�n:Formas Documentales
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_TBLVLD_FORMAS_DOCUMENTALES',2,'3',1); 	
	
/**************************************************************************************
 *	FICHA DE FONDO																																		*
 **************************************************************************************/
 	
 	--Campo Tabla:Volumen y Forma Documental                                                                				
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('7',5,'4',1); 
	
		--Dato:Cantidad                                                                               				
		INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('214',1,'4',1);

 	-- Eliminar el uso del campo 7 y tabla 1 en la ficha de clasificadores de series
	-- Uso de la tabla en la ficha
	DELETE FROM ADUSOOBJETO WHERE IDOBJ = '1' AND TIPOOBJ=5 AND IDOBJUSUARIO='4' AND TIPOOBJUSUARIO=1;
	
	-- Uso del campo en la ficha
	DELETE FROM ADUSOOBJETO WHERE IDOBJ = '7' AND TIPOOBJ=1 AND IDOBJUSUARIO='4' AND TIPOOBJUSUARIO=1;

	-- Tabla de Validaci�n:Formas Documentales
	INSERT INTO ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO)VALUES('ID_TBLVLD_FORMAS_DOCUMENTALES',2,'4',1); 	

/**************************************************************************************
 *	FIN FICHAS
 **************************************************************************************/

	-- Crear la tabla de unidades electr�nicas en fondos
	CREATE TABLE ASGFUDOCSDF ( 
	  IDUNIDADDOC     VARCHAR (32) NOT NULL, 
	  SIGNATURAUDOC   VARCHAR (32)  NOT NULL, 
	  IDUDOCRE        VARCHAR (32) NOT NULL, 
	  DESCRIPCION     VARCHAR (254),
	  MARCASBLOQUEO INTEGER DEFAULT 0 NOT NULL
	); 
	
	-- Crear los �ndices para la tabla de unidades electr�nicas en fondos
	CREATE UNIQUE INDEX ASGFUDOCSDF1 ON ASGFUDOCSDF(IDUNIDADDOC);
	CREATE UNIQUE INDEX ASGFUDOCSDF2 ON ASGFUDOCSDF (IDUDOCRE);
	
	-- Crear un campo en la relaci�n de entrega para indicar que no tiene documentos f�sicos
	ALTER TABLE ASGTRENTREGA ADD SINDOCSFISICOS CHAR (1);
	
	-- Actualizar los nombres para el resto de valores de la tabla de formatos
	UPDATE ADTEXTTBLVLD set VALOR = 'Carta(s)' WHERE ID = '112';
	UPDATE ADTEXTTBLVLD set VALOR = 'Documento(s)' WHERE ID = '113';
	UPDATE ADTEXTTBLVLD set VALOR = 'Fotograf�a(s)' WHERE ID = '114';	
	
	-- Ampliados campos de justificaci�n de Valoraci�n de Serie a 1024
	ALTER TABLE ASGFVALSERIE ALTER COLUMN VALORCIENTJUST TYPE VARCHAR(1024);
	ALTER TABLE ASGFVALSERIE ALTER COLUMN VALORTECNJUST TYPE VARCHAR(1024);
	ALTER TABLE ASGFVALSERIE ALTER COLUMN VALORCULTJUST TYPE VARCHAR(1024);
	ALTER TABLE ASGFVALSERIE ALTER COLUMN REGIMENACCESOJUST TYPE VARCHAR(1024);
	
	-- Poner la tabla de longitud como tipo interno
	UPDATE ADCTLGTBLVLD SET USOINTERNO = 'S' WHERE ID = 'ID_TBLVLD_LONGITUD';		
	
/***************************/
/* Versi�n 2.7             */
/***************************/

	-- Insertar la versi�n actual de bd
	INSERT INTO AGINFOSISTEMA (NOMBRE,VALOR,FECHAACTUALIZACION) VALUES ('VERSIONBD','2.7',now());

	--Eliminar el Campo SIGNATURA de la tabla ASGTUDOCSDF
	ALTER TABLE ASGTUDOCSDF DROP COLUMN SIGNATURA;

	--Eliminar el Campo DESCRIPCION de la tabla ASGTUDOCSDF
	ALTER TABLE ASGTUDOCSDF DROP COLUMN DESCRIPCION;

	--Eliminar Los �ndices que hacen referencia  la tabla ASGFUDOCSDF
	DROP INDEX ASGFUDOCSDF1;
	DROP INDEX ASGFUDOCSDF2;

	--Eliminar Campos de la tabla ASFFUDOCSDF
	ALTER TABLE ASGFUDOCSDF DROP COLUMN SIGNATURAUDOC;
	ALTER TABLE ASGFUDOCSDF DROP COLUMN IDUDOCRE;
	ALTER TABLE ASGFUDOCSDF DROP COLUMN DESCRIPCION;

	--Renombrar el Campo IDUNIDADOC por IDELEMENTOCF
	ALTER TABLE ASGFUDOCSDF RENAME COLUMN IDUNIDADDOC TO IDELEMENTOCF;

	--Crear el �ndice de la tabla
	CREATE UNIQUE INDEX ASGFUDOCSDF1 ON ASGFUDOCSDF(IDELEMENTOCF);
	
	-- Actualizar el nivel de acceso de los descriptores que lo tienen de 0 a 1 (Hab�a un error en la aplicaci�n)
	UPDATE ADDESCRIPTOR SET NIVELACCESO = '1' WHERE NIVELACCESO = '0';
	
	-- Eliminar el �ndice �nico de ASGFORGPROD porque puede darse el caso de que se repita el mismo idOrgano con el mismo idInst y distinto idDescriptor
	DROP INDEX ASGFORGPROD2;

/***************************/
/* Versi�n 2.8             */
/***************************/

	-- Insertar la versi�n actual de bd
	INSERT INTO AGINFOSISTEMA (NOMBRE,VALOR,FECHAACTUALIZACION) VALUES ('VERSIONBD','2.8',now());

	--Establecer el campo con NO NULO.
	ALTER TABLE ASGPCONSULTA ALTER COLUMN TEMA DROP NOT NULL;	

	--A�adir el Campo SUBTIPO a la tabla de elementos del cuadro.
	ALTER TABLE ASGFELEMENTOCF ADD COLUMN SUBTIPO SMALLINT NOT NULL DEFAULT 0;
	
	--A�adir el Campo SUBTIPO a la tabla de niveles de elementos del cuadro.
	ALTER TABLE ASGFNIVELCF ADD COLUMN SUBTIPO SMALLINT NOT NULL DEFAULT 0;

	-- Actualizar el subtipo de las unidades documentales
	UPDATE ASGFELEMENTOCF SET SUBTIPO = 61 WHERE IDNIVEL = '00000000000000000000000000000009';
	
	-- Actualizar el subtipo del nivel unidad documental
	UPDATE ASGFNIVELCF SET SUBTIPO = 61 WHERE ID = '00000000000000000000000000000009';

	-- Actualizar el subtipo del nivel fracci�n de serie
	UPDATE ASGFNIVELCF SET SUBTIPO = 62 WHERE ID = '00000000000000000000000000000016';
	
	-- A�adir un campo subtipo a la tabla de valoraciones de series
	ALTER TABLE ASGFVALSERIE ADD REGIMENACCESOSUBTIPO INTEGER NULL;
	
	-- Crear un grupo para auditor�a de administradores
	INSERT INTO ASCAGRUPO (ID, NOMBRE, IDARCHIVO, DESCRIPCION) VALUES ('1', 'GRUPO DE ADMINISTRADORES', NULL, 'Grupo de la aplicaci�n para auditor�a de administradores');
	
	-- Actualizar los datos del superusuario
	DELETE FROM ASCAUSRORG WHERE IDUSUARIO IN (SELECT ID FROM ASCAUSUARIO WHERE NOMBRE = 'SYSSUPERUSER');
	DELETE FROM ASCAUSRGRP WHERE IDUSUARIO IN (SELECT ID FROM ASCAUSUARIO WHERE NOMBRE = 'SYSSUPERUSER');
	DELETE FROM ASCAROLUSR WHERE IDUSUARIO IN (SELECT ID FROM ASCAUSUARIO WHERE NOMBRE = 'SYSSUPERUSER');
	UPDATE ASCAUSUARIO SET APELLIDOS=NULL, EMAIL=NULL, DIRECCION=NULL, TIPO='0', HABILITADO='S', FMAXVIGENCIA=NULL, IDUSRSEXTGESTOR=ID, IDUSRSISTORG=NULL, DESCRIPCION=NULL WHERE NOMBRE = 'SYSSUPERUSER';
	
	-- Eliminar de ASCAUSRORG la obligaci�n de meter FECHAINI y FECHAFIN
	ALTER TABLE ASCAUSRORG ALTER COLUMN FECHAINI DROP NOT NULL;
	ALTER TABLE ASCAUSRORG ALTER COLUMN FECHAFIN DROP NOT NULL;		
	