

-----------------------------------
-- Actualizaci�n de v5.4 a v5.5
-----------------------------------

--
-- Informaci�n de versi�n
--
INSERT INTO spac_infosistema (id, codigo, valor, fecha_actualizacion) VALUES (nextval('spac_sq_id_infosistema'), 'VERSIONBD', '5.5', current_timestamp);
INSERT INTO spac_infosistema (id, codigo, valor, fecha_actualizacion) VALUES (nextval('spac_sq_id_infosistema'), 'VERSIONAPP', '5.5', current_timestamp);


--
-- Informes
--

-- Secuencias
CREATE SEQUENCE spac_sq_id_ctinformes INCREMENT BY 1 NO MAXVALUE NO MINVALUE CACHE 1;

-- Tablas
CREATE TABLE spac_ct_informes (
  	id integer NOT NULL,
  	nombre character varying(100),
  	descripcion character varying(255),
  	xml text,
  	fecha timestamp without time zone,
  	tipo integer
);

ALTER TABLE ONLY spac_ct_informes ADD CONSTRAINT pk_spac_ct_informes PRIMARY KEY (id);

CREATE TABLE spac_p_informes (
  	id_obj integer NOT NULL,
  	tp_obj integer NOT NULL,
  	id_informe integer NOT NULL
);

ALTER TABLE ONLY spac_p_informes ADD CONSTRAINT pk_spac_p_informes PRIMARY KEY (id_obj, tp_obj, id_informe);

--
-- A la entidad spac_dt_documentos se le a�aden los campos id_reg_entidad e id_entidad  y se modifica su definicion en spac_ct_entities
--
--alter table spac_dt_documentos add id_reg_entidad integer;
--alter table spac_dt_documentos add id_entidad integer;
--update spac_ct_entidades set definicion='<entity version=''1.00''><editable>S</editable><dropable>N</dropable><status>0</status><fields><field id=''1''><physicalName>id</physicalName><type>3</type><nullable>S</nullable></field><field id=''2''><physicalName>numexp</physicalName><type>0</type><size>30</size><nullable>S</nullable></field><field id=''3''><physicalName>fdoc</physicalName><type>6</type><nullable>S</nullable></field><field id=''4''><physicalName>nombre</physicalName><type>0</type><size>100</size><nullable>S</nullable></field><field id=''5''><physicalName>autor</physicalName><type>0</type><size>250</size><nullable>S</nullable></field><field id=''6''><physicalName>id_fase</physicalName><type>3</type><nullable>S</nullable></field><field id=''7''><physicalName>id_tramite</physicalName><type>3</type><nullable>S</nullable></field><field id=''8''><physicalName>id_tpdoc</physicalName><type>3</type><nullable>S</nullable></field><field id=''9''><physicalName>tp_reg</physicalName><type>0</type><size>16</size><nullable>S</nullable></field><field id=''10''><physicalName>nreg</physicalName><type>0</type><size>16</size><nullable>S</nullable></field><field id=''11''><physicalName>freg</physicalName><type>6</type><nullable>S</nullable></field><field id=''12''><physicalName>infopag</physicalName><type>0</type><size>100</size><nullable>S</nullable></field><field id=''13''><physicalName>id_fase_pcd</physicalName><type>3</type><nullable>S</nullable></field><field id=''14''><physicalName>id_tramite_pcd</physicalName><type>3</type><nullable>S</nullable></field><field id=''15''><physicalName>estado</physicalName><type>0</type><size>16</size><nullable>S</nullable></field><field id=''16''><physicalName>origen</physicalName><type>0</type><size>128</size><nullable>S</nullable></field><field id=''17''><physicalName>descripcion</physicalName><type>0</type><size>250</size><nullable>S</nullable></field><field id=''18''><physicalName>origen_id</physicalName><type>3</type><nullable>S</nullable></field><field id=''19''><physicalName>destino</physicalName><type>0</type><size>250</size><nullable>S</nullable></field><field id=''20''><physicalName>autor_info</physicalName><type>0</type><size>250</size><nullable>S</nullable></field><field id=''21''><physicalName>estadofirma</physicalName><type>0</type><size>2</size><nullable>S</nullable></field><field id=''22''><physicalName>id_notificacion</physicalName><type>0</type><size>64</size><nullable>S</nullable></field><field id=''23''><physicalName>estadonotificacion</physicalName><type>0</type><size>2</size><nullable>S</nullable></field><field id=''24''><physicalName>destino_id</physicalName><type>3</type><nullable>S</nullable></field><field id=''25''><physicalName>fnotificacion</physicalName><type>6</type><nullable>S</nullable></field><field id=''26''><physicalName>faprobacion</physicalName><type>6</type><nullable>S</nullable></field><field id=''27''><physicalName>origen_tipo</physicalName><type>0</type><size>1</size><nullable>S</nullable></field><field id=''28''><physicalName>destino_tipo</physicalName><type>0</type><size>1</size><nullable>S</nullable></field><field id=''29''><physicalName>id_plantilla</physicalName><type>3</type><nullable>S</nullable></field><field id=''30''><physicalName>bloqueo</physicalName><type>0</type><size>2</size><nullable>S</nullable></field><field id=''31''><physicalName>repositorio</physicalName><type>0</type><size>8</size><nullable>S</nullable></field><field id=''32''><physicalName>extension</physicalName><type>0</type><size>4</size><nullable>S</nullable></field><field id=''33''><physicalName>ffirma</physicalName><type>6</type><nullable>S</nullable></field><field id=''34''><physicalName>infopag_rde</physicalName><type>0</type><size>256</size><nullable>S</nullable></field><field id=''35''><physicalName>id_reg_entidad</physicalName><type>3</type><nullable>S</nullable></field><field id=''36''><physicalName>id_entidad</physicalName><type>3</type><nullable>S</nullable></field></fields></entity>'
--where id=2;
--
-- Esto ya lo hace el script de actualizaci�n
--

-- Se aumenta el campo extension para los documentos
ALTER TABLE spac_dt_documentos ALTER COLUMN extension TYPE character varying(4);


--
-- Terceros
--
-- Identificaci�n externa de la Direccion asociada a un tercero
ALTER TABLE spac_expedientes  ADD iddireccionpostal character varying(32);
ALTER TABLE spac_dt_intervinientes ADD iddireccionpostal character varying(32);



-- Cambio de tipo del identificador externo del tercero
ALTER TABLE spac_expedientes ALTER COLUMN idtitular TYPE character varying(32);
ALTER TABLE spac_dt_intervinientes ALTER COLUMN id_ext TYPE character varying(32);

--Se actualiza la definici�n de las entidades modificadas
--UPDATE spac_ct_entidades SET definicion='<entity version=''1.00''><editable>S</editable><dropable>N</dropable><status>0</status><fields><field id=''1''><physicalName>id_pcd</physicalName><type>3</type></field><field id=''2''><physicalName>numexp</physicalName><type>0</type><size>30</size></field><field id=''3''><physicalName>referencia_interna</physicalName><type>0</type><size>30</size></field><field id=''4''><physicalName>nreg</physicalName><type>0</type><size>16</size></field><field id=''5''><physicalName>freg</physicalName><type>6</type></field><field id=''6''><physicalName>estadoinfo</physicalName><type>0</type><size>128</size></field><field id=''7''><physicalName>festado</physicalName><type>6</type></field><field id=''8''><physicalName>nifciftitular</physicalName><type>0</type><size>16</size></field><field id=''9''><physicalName>idtitular</physicalName><type>0</type><size>32</size></field><field id=''10''><physicalName>domicilio</physicalName><type>0</type><size>128</size></field><field id=''11''><physicalName>ciudad</physicalName><type>0</type><size>64</size></field><field id=''12''><physicalName>regionpais</physicalName><type>0</type><size>64</size></field><field id=''13''><physicalName>cpostal</physicalName><type>0</type><size>5</size></field><field id=''14''><physicalName>identidadtitular</physicalName><type>0</type><size>128</size></field><field id=''15''><physicalName>tipopersona</physicalName><type>0</type><size>1</size></field><field id=''16''><physicalName>roltitular</physicalName><type>0</type><size>4</size></field><field id=''17''><physicalName>asunto</physicalName><type>0</type><size>512</size></field><field id=''18''><physicalName>finicioplazo</physicalName><type>6</type></field><field id=''19''><physicalName>poblacion</physicalName><type>0</type><size>64</size></field><field id=''20''><physicalName>municipio</physicalName><type>0</type><size>64</size></field><field id=''21''><physicalName>localizacion</physicalName><type>0</type><size>256</size></field><field id=''22''><physicalName>exprelacionados</physicalName><type>0</type><size>256</size></field><field id=''23''><physicalName>codprocedimiento</physicalName><type>0</type><size>16</size></field><field id=''24''><physicalName>nombreprocedimiento</physicalName><type>0</type><size>128</size></field><field id=''25''><physicalName>plazo</physicalName><type>3</type></field><field id=''26''><physicalName>uplazo</physicalName><type>0</type><size>1</size></field><field id=''27''><physicalName>formaterminacion</physicalName><type>0</type><size>1</size></field><field id=''28''><physicalName>utramitadora</physicalName><type>0</type><size>256</size></field><field id=''29''><physicalName>funcionactividad</physicalName><type>0</type><size>80</size></field><field id=''30''><physicalName>materias</physicalName><type>0</type><size>2</size></field><field id=''31''><physicalName>servpresactuaciones</physicalName><type>0</type><size>128</size></field><field id=''32''><physicalName>tipodedocumental</physicalName><type>0</type><size>16</size></field><field id=''33''><physicalName>palabrasclave</physicalName><type>0</type><size>64</size></field><field id=''34''><physicalName>fcierre</physicalName><type>6</type></field><field id=''35''><physicalName>estadoadm</physicalName><type>0</type><size>128</size></field><field id=''36''><physicalName>hayrecurso</physicalName><type>0</type><size>2</size></field><field id=''37''><physicalName>efectosdelsilencio</physicalName><type>0</type><size>1</size></field><field id=''38''><physicalName>fapertura</physicalName><type>6</type></field><field id=''39''><physicalName>observaciones</physicalName><type>0</type><size>256</size></field><field id=''40''><physicalName>idunidadtramitadora</physicalName><type>3</type></field><field id=''41''><physicalName>idproceso</physicalName><type>3</type></field><field id=''42''><physicalName>tipodireccioninteresado</physicalName><type>0</type><size>16</size></field><field id=''43''><physicalName>nversion</physicalName><type>0</type><size>16</size></field><field id=''44''><physicalName>idseccioniniciadora</physicalName><type>0</type><size>64</size></field><field id=''45''><physicalName>seccioniniciadora</physicalName><type>0</type><size>250</size></field><field id=''46''><physicalName>tfnofijo</physicalName><type>0</type><size>32</size></field><field id=''47''><physicalName>tfnomovil</physicalName><type>0</type><size>32</size></field><field id=''48''><physicalName>direcciontelematica</physicalName><type>0</type><size>60</size></field><field id=''49''><physicalName>id</physicalName><type>3</type></field><field id=''50''><physicalName>iddireccionpostal</physicalName><type>0</type><size>32</size></field></fields><validations><validation id=''1''><fieldId>27</fieldId><table>SPAC_TBL_003</table><tableType>3</tableType><class/><mandatory>N</mandatory></validation><validation id=''2''><fieldId>35</fieldId><table>SPAC_TBL_004</table><tableType>3</tableType><class/><mandatory>N</mandatory></validation><validation id=''3''><fieldId>42</fieldId><table>SPAC_TBL_005</table><tableType>3</tableType><class/><mandatory>N</mandatory></validation><validation id=''4''><fieldId>16</fieldId><table>SPAC_TBL_002</table><tableType>3</tableType><class/><mandatory>N</mandatory></validation><validation id=''5''><fieldId>17</fieldId><table/><tableType/><class/><mandatory>S</mandatory></validation></validations></entity>'
--WHERE ID = 1;

--UPDATE spac_ct_entidades SET definicion='<entity version=''1.00''><editable>S</editable><dropable>N</dropable><status>0</status><fields><field id=''1''><physicalName>id_ext</physicalName><type>0</type><size>32</size></field><field id=''2''><physicalName>rol</physicalName><type>0</type><size>4</size></field><field id=''3''><physicalName>tipo</physicalName><type>3</type></field><field id=''4''><physicalName>tipo_persona</physicalName><type>0</type><size>1</size></field><field id=''5''><physicalName>ndoc</physicalName><type>0</type><size>12</size></field><field id=''6''><physicalName>nombre</physicalName><type>0</type><size>250</size></field><field id=''7''><physicalName>dirnot</physicalName><type>0</type><size>250</size></field><field id=''8''><physicalName>email</physicalName><type>0</type><size>250</size></field><field id=''9''><physicalName>c_postal</physicalName><type>0</type><size>10</size></field><field id=''10''><physicalName>localidad</physicalName><type>0</type><size>150</size></field><field id=''11''><physicalName>caut</physicalName><type>0</type><size>150</size></field><field id=''12''><physicalName>tfno_fijo</physicalName><type>0</type><size>32</size></field><field id=''13''><physicalName>tfno_movil</physicalName><type>0</type><size>32</size></field><field id=''14''><physicalName>tipo_direccion</physicalName><type>0</type><size>1</size></field><field id=''15''><physicalName>direcciontelematica</physicalName><type>0</type><size>60</size></field><field id=''16''><physicalName>id</physicalName><type>3</type></field><field id=''17''><physicalName>numexp</physicalName><type>0</type><size>30</size></field><field id=''18''><physicalName>iddireccionpostal</physicalName><type>0</type><size>32</size></field></fields><validations><validation id=''1''><fieldId>6</fieldId><table/><tableType/><class/><mandatory>S</mandatory></validation><validation id=''2''><fieldId>14</fieldId><table>SPAC_TBL_005</table><tableType>3</tableType><class/><mandatory>N</mandatory></validation><validation id=''3''><fieldId>2</fieldId><table>SPAC_TBL_002</table><tableType>3</tableType><class/><mandatory>N</mandatory></validation></validations></entity>'
--WHERE ID = 3;


---
--- Insertamos los informes iniciales
---

insert into spac_ct_informes (id, nombre, descripcion, xml, fecha, tipo)
values(nextval('spac_sq_id_ctinformes'), 'Etiqueta',
 'Informe Etiqueta',
'<?xml version="1.0" encoding="ISO-8859-1"  ?>
<!-- Created with iReport - A designer for JasperReports -->
<!DOCTYPE jasperReport PUBLIC "//JasperReports//DTD Report Design//EN" "http://jasperreports.sourceforge.net/dtds/jasperreport.dtd">
<jasperReport
		 name="EtiquetaExpediente"
		 columnCount="1"
		 printOrder="Vertical"
		 orientation="Portrait"
		 pageWidth="200"
		 pageHeight="130"
		 columnWidth="193"
		 columnSpacing="0"
		 leftMargin="5"
		 rightMargin="2"
		 topMargin="5"
		 bottomMargin="2"
		 whenNoDataType="NoPages"
		 isTitleNewPage="false"
		 isSummaryNewPage="false">
	<property name="ireport.scriptlethandling" value="0" />
	<property name="ireport.encoding" value="ISO-8859-1" />
	<import value="java.util.*" />
	<import value="net.sf.jasperreports.engine.*" />
	<import value="net.sf.jasperreports.engine.data.*" />

	<parameter name="NUM_EXP" isForPrompting="true" class="java.lang.String"/>
	<parameter name="IMAGES_REPOSITORY_PATH" isForPrompting="true" class="java.lang.String"/>
	<queryString><![CDATA[SELECT
     numexp  ,
     asunto ,
     fapertura ,
     utramitadora 
FROM
      spac_expedientes
WHERE
     numexp = $P{NUM_EXP}]]></queryString>

	<field name="numexp" class="java.lang.String"/>
	<field name="asunto" class="java.lang.String"/>
	<field name="fapertura" class="java.sql.Timestamp"/>
	<field name="utramitadora" class="java.lang.String"/>

		<background>
			<band height="50"  isSplitAllowed="true" >
			</band>
		</background>
		<title>
			<band height="0"  isSplitAllowed="true" >
			</band>
		</title>
		<pageHeader>
			<band height="0"  isSplitAllowed="true" >
			</band>
		</pageHeader>
		<columnHeader>
			<band height="0"  isSplitAllowed="true" >
			</band>
		</columnHeader>
		<detail>
			<band height="103"  isSplitAllowed="true" >
				<staticText>
					<reportElement
						x="0"
						y="10"
						width="65"
						height="20"
						key="staticText"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="11" isBold="true"/>
					</textElement>
				<text><![CDATA[Num. Exp]]></text>
				</staticText>
				<textField isStretchWithOverflow="false" isBlankWhenNull="false" evaluationTime="Now" hyperlinkType="None"  hyperlinkTarget="Self" >
					<reportElement
						x="65"
						y="10"
						width="100"
						height="20"
						key="textField"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="11"/>
					</textElement>
				<textFieldExpression   class="java.lang.String"><![CDATA[$F{numexp}]]></textFieldExpression>
				</textField>
				<staticText>
					<reportElement
						x="0"
						y="30"
						width="65"
						height="20"
						key="staticText"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="11" isBold="true"/>
					</textElement>
				<text><![CDATA[Desc.]]></text>
				</staticText>
				<textField isStretchWithOverflow="false" isBlankWhenNull="false" evaluationTime="Now" hyperlinkType="None"  hyperlinkTarget="Self" >
					<reportElement
						x="65"
						y="30"
						width="100"
						height="20"
						key="textField"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="11"/>
					</textElement>
				<textFieldExpression   class="java.lang.String"><![CDATA[$F{asunto}]]></textFieldExpression>
				</textField>
				<staticText>
					<reportElement
						x="0"
						y="50"
						width="65"
						height="20"
						key="staticText"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="11" isBold="true"/>
					</textElement>
				<text><![CDATA[F. Inicio]]></text>
				</staticText>
				<textField isStretchWithOverflow="false" isBlankWhenNull="false" evaluationTime="Now" hyperlinkType="None"  hyperlinkTarget="Self" >
					<reportElement
						x="65"
						y="50"
						width="100"
						height="20"
						key="textField"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="11"/>
					</textElement>
				<textFieldExpression   class="java.sql.Timestamp"><![CDATA[$F{fapertura}]]></textFieldExpression>
				</textField>
				<staticText>
					<reportElement
						x="0"
						y="70"
						width="65"
						height="20"
						key="staticText"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="11" isBold="true"/>
					</textElement>
				<text><![CDATA[O. Tramit.]]></text>
				</staticText>
				<textField isStretchWithOverflow="false" isBlankWhenNull="false" evaluationTime="Now" hyperlinkType="None"  hyperlinkTarget="Self" >
					<reportElement
						x="65"
						y="70"
						width="100"
						height="20"
						key="textField"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="11"/>
					</textElement>
				<textFieldExpression   class="java.lang.String"><![CDATA[$F{utramitadora}]]></textFieldExpression>
				</textField>
			</band>
		</detail>
		<columnFooter>
			<band height="0"  isSplitAllowed="true" >
			</band>
		</columnFooter>
		<pageFooter>
			<band height="0"  isSplitAllowed="true" >
			</band>
		</pageFooter>
		<summary>
			<band height="0"  isSplitAllowed="true" >
			</band>
		</summary>
</jasperReport>' ,
current_timestamp ,1);


insert into spac_ct_informes (id, nombre, descripcion, xml, fecha, tipo)
values(nextval('spac_sq_id_ctinformes'), 'Ficha Expediente',
 'Informe Ficha Expediente',
'<?xml version="1.0" encoding="ISO-8859-1"  ?>
<!-- Created with iReport - A designer for JasperReports -->
<!DOCTYPE jasperReport PUBLIC "//JasperReports//DTD Report Design//EN" "http://jasperreports.sourceforge.net/dtds/jasperreport.dtd">
<jasperReport
		 name="FichaExpediente"
		 columnCount="1"
		 printOrder="Vertical"
		 orientation="Landscape"
		 pageWidth="842"
		 pageHeight="595"
		 columnWidth="535"
		 columnSpacing="0"
		 leftMargin="20"
		 rightMargin="20"
		 topMargin="20"
		 bottomMargin="20"
		 whenNoDataType="NoPages"
		 isTitleNewPage="false"
		 isSummaryNewPage="false">
	<property name="ireport.scriptlethandling" value="0" />
	<property name="ireport.encoding" value="ISO-8859-1" />
	<import value="java.util.*" />
	<import value="net.sf.jasperreports.engine.*" />
	<import value="net.sf.jasperreports.engine.data.*" />

	<parameter name="NUM_EXP" isForPrompting="true" class="java.lang.String"/>
	<parameter name="IMAGES_REPOSITORY_PATH" isForPrompting="true" class="java.lang.String"/>
	<queryString><![CDATA[SELECT
     spac_expedientes."numexp",
     spac_expedientes."asunto",
     spac_expedientes."poblacion",
     spac_expedientes."localizacion",
     spac_expedientes."municipio",
     spac_expedientes."fapertura",
     spac_expedientes."fcierre",
     spac_expedientes."identidadtitular",
     spac_expedientes."nifciftitular",
      spac_dt_intervinientes."nombre" ,
     spac_dt_intervinientes."ndoc",
    spac_dt_intervinientes."localidad",
   spac_dt_intervinientes."email",
   spac_dt_intervinientes."tfno_fijo",
   spac_dt_intervinientes."tfno_movil"
FROM
     "spac_expedientes" spac_expedientes left outer join 
     "spac_dt_intervinientes" spac_dt_intervinientes on spac_expedientes.numexp = spac_dt_intervinientes.numexp
WHERE
     spac_expedientes.numexp = $P{NUM_EXP}
     ]]></queryString>

	<field name="numexp" class="java.lang.String"/>
	<field name="asunto" class="java.lang.String"/>
	<field name="poblacion" class="java.lang.String"/>
	<field name="localizacion" class="java.lang.String"/>
	<field name="municipio" class="java.lang.String"/>
	<field name="fapertura" class="java.sql.Timestamp"/>
	<field name="fcierre" class="java.sql.Timestamp"/>
	<field name="identidadtitular" class="java.lang.String"/>
	<field name="nifciftitular" class="java.lang.String"/>
	<field name="nombre" class="java.lang.String"/>
	<field name="ndoc" class="java.lang.String"/>
	<field name="localidad" class="java.lang.String"/>
	<field name="email" class="java.lang.String"/>
	<field name="tfno_fijo" class="java.lang.String"/>
	<field name="tfno_movil" class="java.lang.String"/>


		<group  name="numexp" >
			<groupExpression><![CDATA[$F{numexp}]]></groupExpression>
			<groupHeader>
			<band height="27"  isSplitAllowed="true" >
				<staticText>
					<reportElement
						mode="Opaque"
						x="0"
						y="0"
						width="139"
						height="27"
						forecolor="#FFFFFF"
						backcolor="#000000"
						key="staticText"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="16"/>
					</textElement>
				<text><![CDATA[N� Expediente]]></text>
				</staticText>
				<textField isStretchWithOverflow="false" isBlankWhenNull="false" evaluationTime="Now" hyperlinkType="None"  hyperlinkTarget="Self" >
					<reportElement
						mode="Opaque"
						x="139"
						y="0"
						width="663"
						height="27"
						forecolor="#FFFFFF"
						backcolor="#000000"
						key="textField"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="16" isBold="true"/>
					</textElement>
				<textFieldExpression   class="java.lang.String"><![CDATA[$F{numexp}]]></textFieldExpression>
				</textField>
			</band>
			</groupHeader>
			<groupFooter>
			<band height="0"  isSplitAllowed="true" >
			</band>
			</groupFooter>
		</group>
		<group  name="asunto" >
			<groupExpression><![CDATA[$F{asunto}]]></groupExpression>
			<groupHeader>
			<band height="28"  isSplitAllowed="true" >
				<staticText>
					<reportElement
						mode="Opaque"
						x="0"
						y="0"
						width="139"
						height="27"
						backcolor="#CCCCFF"
						key="staticText"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="16"/>
					</textElement>
				<text><![CDATA[Asunto]]></text>
				</staticText>
				<textField isStretchWithOverflow="false" isBlankWhenNull="false" evaluationTime="Now" hyperlinkType="None"  hyperlinkTarget="Self" >
					<reportElement
						mode="Opaque"
						x="139"
						y="0"
						width="663"
						height="27"
						backcolor="#CCCCFF"
						key="textField"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="16"/>
					</textElement>
				<textFieldExpression   class="java.lang.String"><![CDATA[$F{asunto}]]></textFieldExpression>
				</textField>
				<line direction="TopDown">
					<reportElement
						x="0"
						y="27"
						width="800"
						height="1"
						key="line"
						positionType="FixRelativeToBottom"/>
					<graphicElement stretchType="NoStretch"/>
				</line>
			</band>
			</groupHeader>
			<groupFooter>
			<band height="0"  isSplitAllowed="true" >
			</band>
			</groupFooter>
		</group>
		<group  name="fapertura" >
			<groupExpression><![CDATA[$F{fapertura}]]></groupExpression>
			<groupHeader>
			<band height="28"  isSplitAllowed="true" >
				<staticText>
					<reportElement
						x="0"
						y="0"
						width="139"
						height="27"
						key="staticText"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="16"/>
					</textElement>
				<text><![CDATA[F. Apertura	]]></text>
				</staticText>
				<textField isStretchWithOverflow="false" isBlankWhenNull="false" evaluationTime="Now" hyperlinkType="None"  hyperlinkTarget="Self" >
					<reportElement
						x="139"
						y="0"
						width="663"
						height="27"
						key="textField"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="16"/>
					</textElement>
				<textFieldExpression   class="java.sql.Timestamp"><![CDATA[$F{fapertura}]]></textFieldExpression>
				</textField>
				<line direction="TopDown">
					<reportElement
						x="0"
						y="27"
						width="800"
						height="1"
						key="line"
						positionType="FixRelativeToBottom"/>
					<graphicElement stretchType="NoStretch"/>
				</line>
			</band>
			</groupHeader>
			<groupFooter>
			<band height="0"  isSplitAllowed="true" >
			</band>
			</groupFooter>
		</group>
		<group  name="fcierre" >
			<groupExpression><![CDATA[$F{fcierre}]]></groupExpression>
			<groupHeader>
			<band height="28"  isSplitAllowed="true" >
				<staticText>
					<reportElement
						x="0"
						y="0"
						width="139"
						height="27"
						key="staticText"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="16" isBold="false"/>
					</textElement>
				<text><![CDATA[F. Cierre]]></text>
				</staticText>
				<textField isStretchWithOverflow="false" isBlankWhenNull="true" evaluationTime="Now" hyperlinkType="None"  hyperlinkTarget="Self" >
					<reportElement
						x="139"
						y="0"
						width="663"
						height="27"
						key="textField"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="16" isBold="false"/>
					</textElement>
				<textFieldExpression   class="java.sql.Timestamp"><![CDATA[$F{fcierre}]]></textFieldExpression>
				</textField>
				<line direction="TopDown">
					<reportElement
						x="0"
						y="27"
						width="800"
						height="1"
						key="line"
						positionType="FixRelativeToBottom"/>
					<graphicElement stretchType="NoStretch"/>
				</line>
			</band>
			</groupHeader>
			<groupFooter>
			<band height="0"  isSplitAllowed="true" >
			</band>
			</groupFooter>
		</group>
		<group  name="municipio" >
			<groupExpression><![CDATA[$F{municipio}]]></groupExpression>
			<groupHeader>
			<band height="28"  isSplitAllowed="true" >
				<textField isStretchWithOverflow="false" isBlankWhenNull="true" evaluationTime="Now" hyperlinkType="None"  hyperlinkTarget="Self" >
					<reportElement
						x="140"
						y="-1"
						width="662"
						height="28"
						key="textField"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="16"/>
					</textElement>
				<textFieldExpression   class="java.lang.String"><![CDATA[$F{municipio}]]></textFieldExpression>
				</textField>
				<staticText>
					<reportElement
						x="1"
						y="0"
						width="139"
						height="28"
						key="staticText"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="16"/>
					</textElement>
				<text><![CDATA[Municipio]]></text>
				</staticText>
				<line direction="TopDown">
					<reportElement
						x="0"
						y="27"
						width="800"
						height="1"
						key="line"
						positionType="FixRelativeToBottom"/>
					<graphicElement stretchType="NoStretch"/>
				</line>
			</band>
			</groupHeader>
			<groupFooter>
			<band height="0"  isSplitAllowed="true" >
			</band>
			</groupFooter>
		</group>
		<group  name="localizacion" >
			<groupExpression><![CDATA[$F{localizacion}]]></groupExpression>
			<groupHeader>
			<band height="28"  isSplitAllowed="true" >
				<textField isStretchWithOverflow="false" isBlankWhenNull="true" evaluationTime="Now" hyperlinkType="None"  hyperlinkTarget="Self" >
					<reportElement
						x="141"
						y="-1"
						width="661"
						height="28"
						key="textField"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="16"/>
					</textElement>
				<textFieldExpression   class="java.lang.String"><![CDATA[$F{localizacion}]]></textFieldExpression>
				</textField>
				<staticText>
					<reportElement
						x="-1"
						y="-1"
						width="139"
						height="28"
						key="staticText"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="16"/>
					</textElement>
				<text><![CDATA[Localizaci�n]]></text>
				</staticText>
				<line direction="TopDown">
					<reportElement
						x="0"
						y="27"
						width="800"
						height="1"
						key="line"
						positionType="FixRelativeToBottom"/>
					<graphicElement stretchType="NoStretch"/>
				</line>
			</band>
			</groupHeader>
			<groupFooter>
			<band height="0"  isSplitAllowed="true" >
			</band>
			</groupFooter>
		</group>
		<group  name="poblacion" >
			<groupExpression><![CDATA[$F{poblacion}]]></groupExpression>
			<groupHeader>
			<band height="45"  isSplitAllowed="true" >
				<textField isStretchWithOverflow="false" isBlankWhenNull="true" evaluationTime="Now" hyperlinkType="None"  hyperlinkTarget="Self" >
					<reportElement
						x="139"
						y="-1"
						width="663"
						height="29"
						key="textField"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="16"/>
					</textElement>
				<textFieldExpression   class="java.lang.String"><![CDATA[$F{poblacion}]]></textFieldExpression>
				</textField>
				<staticText>
					<reportElement
						x="0"
						y="-1"
						width="139"
						height="28"
						key="staticText"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="16"/>
					</textElement>
				<text><![CDATA[Poblaci�n]]></text>
				</staticText>
				<line direction="TopDown">
					<reportElement
						x="0"
						y="27"
						width="800"
						height="1"
						key="line"
						positionType="FixRelativeToBottom"/>
					<graphicElement stretchType="NoStretch"/>
				</line>
			</band>
			</groupHeader>
			<groupFooter>
			<band height="0"  isSplitAllowed="true" >
			</band>
			</groupFooter>
		</group>
		<group  name="Titular" >
			<groupExpression><![CDATA[$V{PAGE_NUMBER}]]></groupExpression>
			<groupHeader>
			<band height="50"  isSplitAllowed="true" >
				<staticText>
					<reportElement
						mode="Opaque"
						x="1"
						y="0"
						width="799"
						height="30"
						backcolor="#CCCCCC"
						key="staticText"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement textAlignment="Center">
						<font size="18" isBold="true"/>
					</textElement>
				<text><![CDATA[Titular]]></text>
				</staticText>
			</band>
			</groupHeader>
			<groupFooter>
			<band height="0"  isSplitAllowed="true" >
			</band>
			</groupFooter>
		</group>
		<group  name="nifciftitular" >
			<groupExpression><![CDATA[$F{nifciftitular}]]></groupExpression>
			<groupHeader>
			<band height="64"  isSplitAllowed="true" >
				<staticText>
					<reportElement
						x="1"
						y="28"
						width="136"
						height="28"
						key="staticText"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="14"/>
					</textElement>
				<text><![CDATA[N� Doc]]></text>
				</staticText>
				<textField isStretchWithOverflow="false" isBlankWhenNull="true" evaluationTime="Now" hyperlinkType="None"  hyperlinkTarget="Self" >
					<reportElement
						x="138"
						y="28"
						width="662"
						height="28"
						key="textField"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="12"/>
					</textElement>
				<textFieldExpression   class="java.lang.String"><![CDATA[$F{nifciftitular}]]></textFieldExpression>
				</textField>
				<textField isStretchWithOverflow="false" isBlankWhenNull="true" evaluationTime="Now" hyperlinkType="None"  hyperlinkTarget="Self" >
					<reportElement
						x="137"
						y="0"
						width="663"
						height="28"
						key="textField"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="12"/>
					</textElement>
				<textFieldExpression   class="java.lang.String"><![CDATA[$F{identidadtitular}]]></textFieldExpression>
				</textField>
				<staticText>
					<reportElement
						x="3"
						y="0"
						width="136"
						height="28"
						key="staticText"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="14"/>
					</textElement>
				<text><![CDATA[Nombre]]></text>
				</staticText>
			</band>
			</groupHeader>
			<groupFooter>
			<band height="0"  isSplitAllowed="true" >
			</band>
			</groupFooter>
		</group>
		<group  name="Lista participantes" >
			<groupExpression><![CDATA[$P{REPORT_PARAMETERS_MAP}]]></groupExpression>
			<groupHeader>
			<band height="57"  isSplitAllowed="true" >
				<staticText>
					<reportElement
						mode="Opaque"
						x="1"
						y="0"
						width="799"
						height="30"
						backcolor="#CCCCCC"
						key="staticText"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement textAlignment="Center">
						<font size="18" isBold="true"/>
					</textElement>
				<text><![CDATA[Listado de Participantes]]></text>
				</staticText>
				<staticText>
					<reportElement
						x="3"
						y="30"
						width="122"
						height="20"
						key="staticText"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="14" isBold="false"/>
					</textElement>
				<text><![CDATA[N� Doc]]></text>
				</staticText>
				<staticText>
					<reportElement
						x="265"
						y="30"
						width="139"
						height="20"
						key="staticText"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="14" isBold="false"/>
					</textElement>
				<text><![CDATA[Localidad]]></text>
				</staticText>
				<staticText>
					<reportElement
						x="404"
						y="30"
						width="133"
						height="20"
						key="staticText"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="14" isBold="false"/>
					</textElement>
				<text><![CDATA[E-mail]]></text>
				</staticText>
				<staticText>
					<reportElement
						x="536"
						y="30"
						width="139"
						height="20"
						key="staticText"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="14" isBold="false"/>
					</textElement>
				<text><![CDATA[Tlfn Fijo]]></text>
				</staticText>
				<staticText>
					<reportElement
						x="675"
						y="30"
						width="124"
						height="20"
						key="staticText"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="14" isBold="false"/>
					</textElement>
				<text><![CDATA[Tlfn Movil]]></text>
				</staticText>
				<staticText>
					<reportElement
						x="126"
						y="30"
						width="139"
						height="20"
						key="staticText"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="14" isBold="false"/>
					</textElement>
				<text><![CDATA[Nombre]]></text>
				</staticText>
			</band>
			</groupHeader>
			<groupFooter>
			<band height="0"  isSplitAllowed="true" >
			</band>
			</groupFooter>
		</group>
		<background>
			<band height="0"  isSplitAllowed="true" >
			</band>
		</background>
		<title>
			<band height="58"  isSplitAllowed="true" >
				<line direction="TopDown">
					<reportElement
						x="0"
						y="8"
						width="800"
						height="1"
						key="line"/>
					<graphicElement stretchType="NoStretch"/>
				</line>
				<line direction="TopDown">
					<reportElement
						x="0"
						y="51"
						width="800"
						height="1"
						key="line"
						positionType="FixRelativeToBottom"/>
					<graphicElement stretchType="NoStretch"/>
				</line>
				<staticText>
					<reportElement
						x="65"
						y="13"
						width="593"
						height="35"
						key="staticText"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement textAlignment="Center">
						<font size="26" isBold="true"/>
					</textElement>
				<text><![CDATA[Ficha del expediente]]></text>
				</staticText>
			</band>
		</title>
		<pageHeader>
			<band height="0"  isSplitAllowed="true" >
			</band>
		</pageHeader>
		<columnHeader>
			<band height="0"  isSplitAllowed="true" >
			</band>
		</columnHeader>
		<detail>
			<band height="30"  isSplitAllowed="true" >
				<textField isStretchWithOverflow="false" isBlankWhenNull="true" evaluationTime="Now" hyperlinkType="None"  hyperlinkTarget="Self" >
					<reportElement
						x="126"
						y="0"
						width="137"
						height="20"
						key="textField"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="12"/>
					</textElement>
				<textFieldExpression   class="java.lang.String"><![CDATA[$F{nombre}]]></textFieldExpression>
				</textField>
				<textField isStretchWithOverflow="false" isBlankWhenNull="true" evaluationTime="Now" hyperlinkType="None"  hyperlinkTarget="Self" >
					<reportElement
						x="1"
						y="0"
						width="122"
						height="20"
						key="textField"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="12"/>
					</textElement>
				<textFieldExpression   class="java.lang.String"><![CDATA[$F{ndoc}]]></textFieldExpression>
				</textField>
				<textField isStretchWithOverflow="false" isBlankWhenNull="true" evaluationTime="Now" hyperlinkType="None"  hyperlinkTarget="Self" >
					<reportElement
						x="265"
						y="0"
						width="139"
						height="20"
						key="textField"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="12"/>
					</textElement>
				<textFieldExpression   class="java.lang.String"><![CDATA[$F{localidad}]]></textFieldExpression>
				</textField>
				<textField isStretchWithOverflow="false" isBlankWhenNull="true" evaluationTime="Now" hyperlinkType="None"  hyperlinkTarget="Self" >
					<reportElement
						x="382"
						y="0"
						width="130"
						height="20"
						key="textField"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="12"/>
					</textElement>
				<textFieldExpression   class="java.lang.String"><![CDATA[$F{email}]]></textFieldExpression>
				</textField>
				<textField isStretchWithOverflow="false" isBlankWhenNull="true" evaluationTime="Now" hyperlinkType="None"  hyperlinkTarget="Self" >
					<reportElement
						x="516"
						y="0"
						width="142"
						height="20"
						key="textField"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="12"/>
					</textElement>
				<textFieldExpression   class="java.lang.String"><![CDATA[$F{tfno_fijo}]]></textFieldExpression>
				</textField>
				<textField isStretchWithOverflow="false" isBlankWhenNull="true" evaluationTime="Now" hyperlinkType="None"  hyperlinkTarget="Self" >
					<reportElement
						x="675"
						y="0"
						width="124"
						height="20"
						key="textField"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="12"/>
					</textElement>
				<textFieldExpression   class="java.lang.String"><![CDATA[$F{tfno_movil}]]></textFieldExpression>
				</textField>
			</band>
		</detail>
		<columnFooter>
			<band height="0"  isSplitAllowed="true" >
			</band>
		</columnFooter>
		<pageFooter>
			<band height="26"  isSplitAllowed="true" >
				<textField isStretchWithOverflow="false" pattern="" isBlankWhenNull="false" evaluationTime="Report" hyperlinkType="None"  hyperlinkTarget="Self" >
					<reportElement
						x="516"
						y="6"
						width="36"
						height="19"
						forecolor="#000000"
						backcolor="#FFFFFF"
						key="textField"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement>
						<font size="10"/>
					</textElement>
				<textFieldExpression   class="java.lang.String"><![CDATA["" + $V{PAGE_NUMBER}]]></textFieldExpression>
				</textField>
				<textField isStretchWithOverflow="false" pattern="" isBlankWhenNull="false" evaluationTime="Now" hyperlinkType="None"  hyperlinkTarget="Self" >
					<reportElement
						x="342"
						y="6"
						width="170"
						height="19"
						forecolor="#000000"
						backcolor="#FFFFFF"
						key="textField"/>
					<box topBorder="None" topBorderColor="#000000" leftBorder="None" leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000" bottomBorder="None" bottomBorderColor="#000000"/>
					<textElement textAlignment="Right">
						<font size="10"/>
					</textElement>
				<textFieldExpression   class="java.lang.String"><![CDATA["Page " + $V{PAGE_NUMBER} + " of "]]></textFieldExpression>
				</textField>
			</band>
		</pageFooter>
		<summary>
			<band height="0"  isSplitAllowed="true" >
			</band>
		</summary>
</jasperReport>' ,
current_timestamp ,1);


--
-- Cambio en la vista de plazos para tener en cuenta las actividades
--
DROP VIEW spac_deadline;
CREATE OR REPLACE VIEW spac_deadline AS 
SELECT obj.numexp, obj.fecha_limite, procedimiento.nombre AS nombre_pcd, obj.id_resp, obj.id AS ID_OBJETO, 'Resoluci�n Expediente' AS descripcion, 1 AS tipo
   FROM spac_procesos obj, spac_ct_procedimientos procedimiento
  WHERE obj.id_pcd = procedimiento.id AND obj.fecha_limite IS NOT NULL
UNION 
 SELECT obj.numexp, obj.fecha_limite, procedimiento.nombre AS nombre_pcd, obj.id_resp, obj.id AS ID_OBJETO, 'Resoluci�n Fase' AS descripcion, 2 AS tipo
   FROM spac_fases obj, spac_ct_procedimientos procedimiento
  WHERE obj.id_pcd = procedimiento.id AND obj.estado = 1 AND obj.tipo=1 AND obj.fecha_limite IS NOT NULL
UNION 
 SELECT obj.numexp, obj.fecha_limite, procedimiento.nombre AS nombre_pcd, obj.id_resp, obj.id AS ID_OBJETO, obj.nombre AS descripcion, 3 AS tipo
   FROM spac_tramites obj, spac_ct_procedimientos procedimiento
  WHERE obj.id_pcd = procedimiento.id AND obj.estado = 1 AND obj.fecha_limite IS NOT NULL
UNION 
 SELECT obj.numexp, obj.fecha_limite, procedimiento.nombre AS nombre_pcd, obj.id_resp, obj.id AS ID_OBJETO, 'Resoluci�n Actividad' AS descripcion, 4 AS tipo
   FROM spac_fases obj, spac_p_procedimientos procedimiento
  WHERE obj.id_pcd = procedimiento.id AND obj.estado = 1 AND obj.tipo=2 AND obj.fecha_limite IS NOT NULL;



---
--- Actualizacion del formulario de busqueda
---

UPDATE spac_ct_frmbusqueda set frm_bsq='<?xml version=''1.0'' encoding=''ISO-8859-1''?>
<?xml-stylesheet type=''text/xsl'' href=''SearchForm.xsl''?>
<queryform displaywidth=''95%'' defaultSort=''1''>
<!--INICIO ENTIDAD PRINCIPAL DE BUSQUEDA-->
<entity type=''main'' identifier=''1''>
<!--INICIO CUERPO BUSQUEDA-->
	<tablename>spac_expedientes</tablename>
	<description>DATOS DEL EXPEDIENTE</description>
	<field type=''query'' order=''01''>
		<columnname>ID_PCD</columnname>
		<description>Procedimiento</description>
		<datatype>integer</datatype>
		<controltype size=''30''  maxlength=''30'' tipo=''validate'' table=''SPAC_P_PROCEDIMIENTOS'' field=''spac_expedientes:ID_PCD'' label=''NOMBRE''  value=''ID'' clause=''WHERE ESTADO IN (2,3) AND TIPO = 1''>text</controltype>
	</field>
	<field type=''query'' order=''04''>
		<columnname>NUMEXP</columnname>
		<description>N�mero de Expediente</description>
		<datatype>string</datatype>
		<operators>
		 	<operator><name>&gt;</name></operator>
			<operator><name>&lt;</name></operator>
 			<operator><name>Contiene(Like)</name></operator>
		 	<operator><name>Contiene(Index)</name></operator>
		</operators>
		<controltype size=''30'' maxlength=''30''>text</controltype>
	</field>
	<field type=''query'' order=''05''>
		<columnname>ASUNTO</columnname>
		<description>Asunto</description>
		<datatype>string</datatype>
		<controltype size=''30'' maxlength=''30''>text</controltype>
	</field>
	<field type=''query'' order=''06''>
		<columnname>NREG</columnname>
		<description>N�mero Anotaci�n Registro</description>
		<datatype>string</datatype>
		<controltype size=''16'' maxlength=''16''>text</controltype>
	</field>
	<field type=''query'' order=''07''>
		<columnname>IDENTIDADTITULAR</columnname>
		<description>Interesado Principal</description>
		<datatype>string</datatype>
		<controltype size=''50'' maxlength=''50''>text</controltype> 
	</field>
	<field type=''query'' order=''08''>
		<columnname>NIFCIFTITULAR</columnname>
		<description>NIF/CIF Interesado</description>
		<datatype>string</datatype>
		<controltype size=''16'' maxlength=''16''>text</controltype>
	</field>
	<field type=''query'' order=''09''>
		<columnname>FAPERTURA</columnname>
		<description>Fecha Apertura</description>
		<datatype>date</datatype> 
		<controltype size=''22'' maxlength=''22''>text</controltype>
	</field>
	
	<field type=''query'' order=''10''>
		<columnname>ESTADOADM</columnname>
		<description>Estado Administrativo</description>
		<datatype>string</datatype>
		<controltype size=''20'' maxlength=''20'' tipo=''validate'' table=''SPAC_TBL_004'' field=''spac_expedientes:ESTADOADM'' label=''SUSTITUTO'' value=''VALOR''>text</controltype>
	</field>
	<field type=''query'' order=''11''>     
		<columnname>HAYRECURSO</columnname>
		<description>Recurso(SI/NO)</description>
		<datatype>string</datatype>
		<controltype size=''2'' maxlength=''2''>text</controltype>
	</field>
	<field type=''query'' order=''12''>
		<columnname>CIUDAD</columnname>
		<description>Ciudad</description>
		<datatype>string</datatype>
		<controltype size=''50'' maxlength=''50''>text</controltype>
	</field>
		<field type=''query'' order=''13''>
		<columnname>DOMICILIO</columnname>
		<description>Domicilio</description>
		<datatype>string</datatype>
		<controltype cols=''100'' rows=''5''>textarea</controltype>
	</field>
	
<!--FIN CUERPO BUSQUEDA-->
</entity>
<!--FIN ENTIDAD PRINCIPAL DE BUSQUEDA-->

<!--INICIO SEGUNDA ENTIDAD DE BUSQUEDA-->
<entity type=''secondary'' identifier=''52''>
	<tablename>spac_fases</tablename>
	<bindfield>NUMEXP</bindfield>
	<field type=''query'' order=''02''>
		<columnname>ID_FASE</columnname>
		<description>Fases</description>
		<datatype>stringList</datatype>
        <binding>in (select ID FROM SPAC_P_FASES WHERE ID_CTFASE IN(@VALUES))</binding>
		<controltype height=''75px'' tipo=''list'' table=''SPAC_CT_FASES'' field=''spac_fases:ID_FASE'' label=''NOMBRE''  value=''id''>text</controltype>	
	</field>
</entity>

<entity type=''secondary'' identifier=''51''>
	
	<tablename>spac_tramites</tablename>
		<field type=''query'' order=''03''>
			<columnname>ID_TRAMITE</columnname>
			<description>Tr�mites</description>
			<datatype>stringList</datatype>
     		<binding>in (select ID FROM SPAC_P_TRAMITES WHERE ID_CTTRAMITE IN(@VALUES))</binding>
			<controltype height=''75px'' tipo=''list'' table=''SPAC_CT_TRAMITES'' field=''spac_tramites:ID_TRAMITE'' label=''NOMBRE''  value=''id''>text</controltype>
		</field>
	<bindfield>NUMEXP</bindfield>
</entity>
<!--FIN SEGUNDA ENTIDAD DE BUSQUEDA-->
<!--INICIO CUERPO RESULTADO-->
<propertyfmt type=''BeanPropertySimpleFmt'' property=''SPAC_FASES.ID'' readOnly=''false'' dataType=''string'' fieldType=''CHECKBOX'' fieldLink=''SPAC_FASES.ID'' />
<propertyfmt type=''BeanPropertySimpleFmt'' property=''SPAC_EXPEDIENTES.NUMEXP'' readOnly=''false'' dataType=''string'' titleKey=''search.numExp'' fieldType=''LINK'' fieldLink=''SPAC_EXPEDIENTES.NUMEXP'' comparator=''ieci.tdw.ispac.ispacweb.comparators.NumexpComparator'' />
<propertyfmt type=''BeanPropertySimpleFmt'' property=''SPAC_EXPEDIENTES.NREG'' readOnly=''false'' dataType=''string'' titleKey=''search.numRegistro'' fieldType=''LIST'' fieldLink=''SPAC_EXPEDIENTES.NREG'' />
<propertyfmt type=''BeanPropertySimpleFmt'' property=''SPAC_EXPEDIENTES.IDENTIDADTITULAR'' readOnly=''false'' dataType=''string'' titleKey=''search.interesado'' fieldType=''LIST'' fieldLink=''SPAC_EXPEDIENTES.IDENTIDADTITULAR'' />
<propertyfmt type=''BeanPropertySimpleFmt'' property=''SPAC_EXPEDIENTES.NIFCIFTITULAR'' readOnly=''false'' dataType=''string'' titleKey=''search.nifInteresado'' fieldType=''LIST'' fieldLink=''SPAC_EXPEDIENTES.NIFCIFTITULAR'' />
<propertyfmt type=''BeanPropertySimpleFmt'' property=''SPAC_EXPEDIENTES.FAPERTURA'' readOnly=''false'' dataType=''date'' titleKey=''search.fechaApertura'' fieldType=''DATE'' fieldLink=''SPAC_EXPEDIENTES.FAPERTURA'' />
<propertyfmt type=''BeanPropertySimpleFmt'' property=''SPAC_EXPEDIENTES.ESTADOADM'' readOnly=''false'' dataType=''string'' titleKey=''search.estadoAdministrativo'' fieldType=''LIST'' fieldLink=''SPAC_EXPEDIENTES.ESTADOADM'' validatetable=''SPAC_TBL_004'' substitute=''SUSTITUTO'' showproperty=''SPAC_TBL_004.SUSTITUTO''  value=''VALOR''/>
<propertyfmt type=''BeanPropertySimpleFmt'' property=''SPAC_EXPEDIENTES.HAYRECURSO'' readOnly=''false'' dataType=''string'' titleKey=''search.recurrido'' fieldType=''LIST'' fieldLink=''SPAC_EXPEDIENTES.HAYRECURSO'' />
<!--FIN CUERPO RESULTADO-->
<!--INICIO ACCIONES-->
<action title=''Cerrar expedientes'' path=''/closeProcess.do'' titleKey=''ispac.action.expedients.close'' />
<action title=''Avanzar fases'' path=''/closeStage.do'' titleKey=''ispac.action.stages.next'' />
<action title=''Retroceder fases'' path=''/redeployPreviousStage.do'' titleKey=''ispac.action.stages.return'' />
<!--FIN ACCIONES-->
</queryform>'
where id=1;

--
--Cambio de tipo de datos para que se admita una fecha dd/mm/yyyy
--

ALTER table spac_ct_procedimientos  alter column  ffin TYPE date;

ALTER table spac_ct_procedimientos  alter column  finicio TYPE date;

ALTER table spac_ct_procedimientos  alter column  fcatalog TYPE date;


---
--Cambio en la definicion de spac_dt_tramites
-----

--UPDATE spac_ct_entidades SET definicion='<entity version=''1.00''><editable>S</editable><dropable>N</dropable><status>0</status><fields><field id=''1''><physicalName>nombre</physicalName><type>0</type><size>250</size></field><field id=''2''><physicalName>estado</physicalName><type>2</type><size>1</size></field><field id=''3''><physicalName>id_tram_pcd</physicalName><type>3</type></field><field id=''4''><physicalName>id_fase_pcd</physicalName><type>3</type></field><field id=''5''><physicalName>id_fase_exp</physicalName><type>3</type></field><field id=''6''><physicalName>id_tram_exp</physicalName><type>3</type></field><field id=''7''><physicalName>id_tram_ctl</physicalName><type>3</type></field><field id=''8''><physicalName>num_acto</physicalName><type>0</type><size>16</size></field><field id=''9''><physicalName>cod_acto</physicalName><type>0</type><size>16</size></field><field id=''10''><physicalName>estado_info</physicalName><type>0</type><size>100</size></field><field id=''11''><physicalName>fecha_inicio</physicalName><type>6</type></field><field id=''12''><physicalName>fecha_cierre</physicalName><type>6</type></field><field id=''13''><physicalName>fecha_limite</physicalName><type>6</type></field><field id=''14''><physicalName>fecha_fin</physicalName><type>6</type></field><field id=''15''><physicalName>fecha_inicio_plazo</physicalName><type>6</type></field><field id=''16''><physicalName>plazo</physicalName><type>3</type></field><field id=''17''><physicalName>uplazo</physicalName><type>0</type><size>1</size></field><field id=''18''><physicalName>observaciones</physicalName><type>0</type><size>254</size></field><field id=''19''><physicalName>descripcion</physicalName><type>0</type><size>100</size></field><field id=''20''><physicalName>und_resp</physicalName><type>0</type><size>250</size></field><field id=''21''><physicalName>fase_pcd</physicalName><type>0</type><size>250</size></field><field id=''22''><physicalName>ID_SUBPROCESO</physicalName><type>3</type></field><field id=''23''><physicalName>id</physicalName><type>3</type></field><field id=''24''><physicalName>numexp</physicalName><type>0</type><size>30</size></field></fields><validations><validation id=''1''><fieldId>17</fieldId><table>SPAC_TBL_001</table><tableType>3</tableType><class/><mandatory>N</mandatory></validation></validations></entity>'
-- where id=7;
