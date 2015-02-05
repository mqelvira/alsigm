--  Crear tablas para el conector de organizaci�n
CREATE TABLE AOESTRORG(
	ID               VARCHAR2(32) NOT NULL,
	CODIGO           VARCHAR2(64) NOT NULL,
	NOMBRE           VARCHAR2(254) NOT NULL,
	TIPO             NUMBER(38) NOT NULL,
	NIVEL            NUMBER(38) NOT NULL,
	IDORGPADRE       VARCHAR2(32),
	ESTADO           NUMBER(38) NOT NULL,
	FINICIOVIGENCIA  DATE,
	FFINVIGENCIA     DATE,
	DESCRIPCION      VARCHAR2(254)
);

CREATE TABLE AOUSR(
	ID             VARCHAR2(64) NOT NULL,
	DIRECCION      VARCHAR2(254),
	EMAIL          VARCHAR2(254),
	NOMBRE         VARCHAR2(64),
	APELLIDOS      VARCHAR2(128),
	NOMBREUSUARIO  VARCHAR2(64) NOT NULL,
	PASSWORD       VARCHAR2(64) NOT NULL
);

CREATE TABLE AOUSRORGV(
	IDUSUARIO      VARCHAR2(64) NOT NULL,
	NOMBREUSUARIO  VARCHAR2(254) NOT NULL,
	IDORGANO       VARCHAR2(32) NOT NULL
);


-- Si las tablas se meten en un schema distinto del de archivo habr�a que ejecutar las siguientes sentencias:

-- CREATE TABLE ITDGUIDGEN(
-- 	cnode  VARCHAR2(12),
--	clpid  NUMBER(38)
-- );

-- INSERT INTO ITDGUIDGEN (CNODE, CLPID) VALUES ('000000000000', 1);

