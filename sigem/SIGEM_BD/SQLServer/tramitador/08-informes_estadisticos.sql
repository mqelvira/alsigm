-------------------------
-- DECLARACION DE VARIABLES
-------------------------
DECLARE @sequence_id int


---
--- Informes estad�sticos
---

UPDATE SPAC_SQ_SEQUENCES	SET @sequence_id = sequence_id = sequence_id + 1 WHERE sequence_name = 'SPAC_SQ_ID_CTINFORMES';
insert into spac_ct_informes (id, nombre, descripcion, xml, fecha, tipo, visibilidad) values(@sequence_id, 'Expedientes ABIERTOS por procedimiento','Expedientes que se encuentran abiertos agrupados por procedimiento','<?xml version="1.0" encoding="UTF-8"  ?><!-- Created with iReport - A designer
	for JasperReports --><!DOCTYPE jasperReport PUBLIC "//JasperReports//DTD Report Design//EN" "http://jasperreports.sourceforge.net/dtds/jasperreport.dtd">
<jasperReport name="expsAbiertosPorPcd" columnCount="1"
	printOrder="Vertical" orientation="Portrait" pageWidth="595"
	pageHeight="842" columnWidth="535" columnSpacing="0" leftMargin="30"
	rightMargin="30" topMargin="20" bottomMargin="20" whenNoDataType="AllSectionsNoDetail"
	isTitleNewPage="false" isSummaryNewPage="false">
	<property name="ireport.scriptlethandling" value="0" />
	<property name="ireport.encoding" value="UTF-8" />
	<import value="java.util.*" />
	<import value="net.sf.jasperreports.engine.*" />
	<import value="net.sf.jasperreports.engine.data.*" />
	<queryString><![CDATA[SELECT P.NOMBRE, COUNT(*) AS COUNT FROM 	SPAC_P_PROCEDIMIENTOS P,	SPAC_PROCESOS R WHERE 	P.ID = R.ID_PCD    AND R.ESTADO = 1 GROUP BY P.NOMBRE]]></queryString>
	<field name="nombre" class="java.lang.String" />
	<field name="count" class="java.lang.Integer" />
	<variable name="title" class="java.lang.String" resetType="Report"
		calculation="Nothing">
		<initialValueExpression><![CDATA["Expedientes Abiertos por procedimiento"]]></initialValueExpression>
	</variable>
	<variable name="es.title" class="java.lang.String" resetType="Report"
		calculation="Nothing">
		<initialValueExpression><![CDATA["Expedientes Abiertos por procedimiento"]]></initialValueExpression>
	</variable>
	<variable name="ca.title" class="java.lang.String" resetType="Report"
		calculation="Nothing">
		<initialValueExpression><![CDATA["[ca]Expedientes Abiertos por procedimiento"]]></initialValueExpression>
	</variable>
	<variable name="eu.title" class="java.lang.String" resetType="Report"
		calculation="Nothing">
		<initialValueExpression><![CDATA["[eu]Expedientes Abiertos por procedimiento"]]></initialValueExpression>
	</variable>
	<variable name="gl.title" class="java.lang.String" resetType="Report"
		calculation="Nothing">
		<initialValueExpression><![CDATA["[gl]Expedientes Abiertos por procedimiento"]]></initialValueExpression>
	</variable>
	<variable name="column.pcd" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Procedimiento"]]></initialValueExpression>
	</variable>
	<variable name="es.column.pcd" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Procedimiento"]]></initialValueExpression>
	</variable>
	<variable name="ca.column.pcd" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Procediment"]]></initialValueExpression>
	</variable>
	<variable name="eu.column.pcd" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Prozedura"]]></initialValueExpression>
	</variable>
	<variable name="gl.column.pcd" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Procedemento"]]></initialValueExpression>
	</variable>
	<variable name="column.exp" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Expedientes"]]></initialValueExpression>
	</variable>
	<variable name="es.column.exp" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Expedientes"]]></initialValueExpression>
	</variable>
	<variable name="ca.column.exp" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Expedients"]]></initialValueExpression>
	</variable>
	<variable name="eu.column.exp" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Espedienteak"]]></initialValueExpression>
	</variable>
	<variable name="gl.column.exp" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Expedientes"]]></initialValueExpression>
	</variable>
	<variable name="properties"
		class="ieci.tdw.ispac.ispaclib.reports.JasperReportsProperties"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA[new ieci.tdw.ispac.ispaclib.reports.JasperReportsProperties (new String[]{"title", "column.pcd", "column.exp"},			new String[]{"","es", "ca", "eu", "gl"},				new String[][]{	new String[]{$V{title}, $V{column.pcd},$V{column.exp}}, 				new String[]{$V{es.title}, $V{es.column.pcd},$V{es.column.exp}}, 				new String[]{$V{ca.title}, $V{ca.column.pcd},$V{ca.column.exp}}, 				new String[]{$V{eu.title}, $V{eu.column.pcd},$V{eu.column.exp}}, 				new String[]{$V{gl.title}, $V{gl.column.pcd},$V{gl.column.exp}}			      }	    )]]></initialValueExpression>
	</variable>
	<background>
		<band height="0" isSplitAllowed="true">
		</band>
	</background>
	<title>
		<band height="50" isSplitAllowed="true">
			<line direction="TopDown">
				<reportElement x="0" y="48" width="535" height="0"
					forecolor="#000000" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
			<line direction="TopDown">
				<reportElement x="0" y="3" width="535" height="0"
					forecolor="#000000" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
			<textField isStretchWithOverflow="true" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="1" y="11" width="533" height="29"
					key="textField" positionType="Float" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement textAlignment="Center" verticalAlignment="Middle">
					<font size="25" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$V{properties}.getProperty($P{REPORT_LOCALE}, "title")]]></textFieldExpression>
			</textField>
		</band>
	</title>
	<pageHeader>
		<band height="9" isSplitAllowed="true">
			<line direction="BottomUp">
				<reportElement x="0" y="8" width="535" height="1"
					forecolor="#000000" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
		</band>
	</pageHeader>
	<columnHeader>
		<band height="17" isSplitAllowed="true">
			<rectangle>
				<reportElement mode="Opaque" x="0" y="0" width="535"
					height="17" forecolor="#000000" backcolor="#808080" key="rectangle" />
				<graphicElement stretchType="NoStretch" pen="None" />
			</rectangle>
			<line direction="BottomUp">
				<reportElement x="0" y="15" width="535" height="2"
					forecolor="#000000" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
			<textField isStretchWithOverflow="true" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="0" y="0" width="429" height="17"
					forecolor="#FFFFFF" key="column.pcd" positionType="Float" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement>
					<font size="12" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$V{properties}.getProperty($P{REPORT_LOCALE}, "column.pcd")]]></textFieldExpression>
			</textField>
			<textField isStretchWithOverflow="true" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="429" y="0" width="106" height="17"
					forecolor="#FFFFFF" key="column.exp-1" positionType="Float" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement textAlignment="Center">
					<font size="12" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$V{properties}.getProperty($P{REPORT_LOCALE}, "column.exp")]]></textFieldExpression>
			</textField>
		</band>
	</columnHeader>
	<detail>
		<band height="17" isSplitAllowed="true">
			<line direction="TopDown">
				<reportElement x="0" y="16" width="535" height="0"
					forecolor="#808080" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
			<textField isStretchWithOverflow="true" pattern=""
				isBlankWhenNull="true" evaluationTime="Now" hyperlinkType="None"
				hyperlinkTarget="Self">
				<reportElement x="0" y="0" width="429" height="17"
					forecolor="#000000" key="procedimiento" positionType="Float" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement>
					<font size="12" isBold="false" isItalic="false" isUnderline="false"
						isPdfEmbedded="false" isStrikeThrough="false" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$F{nombre}]]></textFieldExpression>
			</textField>
			<textField isStretchWithOverflow="false" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="429" y="-1" width="106" height="18"
					key="expedientes" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement textAlignment="Center">
					<font size="12" />
				</textElement>
				<textFieldExpression class="java.lang.Integer"><![CDATA[$F{count}]]></textFieldExpression>
			</textField>
		</band>
	</detail>
	<columnFooter>
		<band height="0" isSplitAllowed="true">
		</band>
	</columnFooter>
	<pageFooter>
		<band height="27" isSplitAllowed="true">
			<textField isStretchWithOverflow="false" pattern=""
				isBlankWhenNull="false" evaluationTime="Now" hyperlinkType="None"
				hyperlinkTarget="Self">
				<reportElement x="326" y="3" width="170" height="19"
					forecolor="#000000" key="textField" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement textAlignment="Right">
					<font />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$V{PAGE_NUMBER} + "/"]]></textFieldExpression>
			</textField>
			<textField isStretchWithOverflow="false" pattern=""
				isBlankWhenNull="false" evaluationTime="Report" hyperlinkType="None"
				hyperlinkTarget="Self">
				<reportElement mode="Transparent" x="499" y="3" width="36"
					height="19" forecolor="#000000" backcolor="#FFFFFF" key="textField" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement>
					<font size="10" isBold="false" isItalic="false" isUnderline="false"
						isPdfEmbedded="false" isStrikeThrough="false" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA["" + $V{PAGE_NUMBER}]]></textFieldExpression>
			</textField>
			<line direction="TopDown">
				<reportElement x="0" y="5" width="534" height="0"
					forecolor="#000000" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
			<textField isStretchWithOverflow="false" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="1" y="6" width="209" height="19"
					forecolor="#000000" key="textField" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement>
					<font />
				</textElement>
				<textFieldExpression class="java.util.Date"><![CDATA[new Date()]]></textFieldExpression>
			</textField>
		</band>
	</pageFooter>
	<summary>
		<band height="0" isSplitAllowed="true">
		</band>
	</summary>
</jasperReport>',getdate(),3 , 1);





UPDATE SPAC_SQ_SEQUENCES	SET @sequence_id = sequence_id = sequence_id + 1 WHERE sequence_name = 'SPAC_SQ_ID_CTINFORMES';
insert into spac_ct_informes (id, nombre, descripcion, xml, fecha, tipo , visibilidad) values(@sequence_id, 'Expedientes CERRADOS por procedimiento','Expedientes que se encuentran cerrados agrupados por procedimiento','<?xml version="1.0" encoding="UTF-8"  ?><!-- Created with iReport - A designer
	for JasperReports --><!DOCTYPE jasperReport PUBLIC "//JasperReports//DTD Report Design//EN" "http://jasperreports.sourceforge.net/dtds/jasperreport.dtd">
<jasperReport name="expsCerradosPorPcd" columnCount="1"
	printOrder="Vertical" orientation="Portrait" pageWidth="595"
	pageHeight="842" columnWidth="535" columnSpacing="0" leftMargin="30"
	rightMargin="30" topMargin="20" bottomMargin="20" whenNoDataType="AllSectionsNoDetail"
	isTitleNewPage="false" isSummaryNewPage="false">
	<property name="ireport.scriptlethandling" value="0" />
	<property name="ireport.encoding" value="UTF-8" />
	<import value="java.util.*" />
	<import value="net.sf.jasperreports.engine.*" />
	<import value="net.sf.jasperreports.engine.data.*" />
	<queryString><![CDATA[SELECT P.NOMBRE, COUNT(*) FROM 	SPAC_P_PROCEDIMIENTOS P,	SPAC_PROCESOS R WHERE 	P.ID = R.ID_PCD    AND R.ESTADO = 2 GROUP BY P.NOMBRE]]></queryString>
	<field name="nombre" class="java.lang.String" />
	<field name="count" class="java.lang.Integer" />
	<variable name="es.title" class="java.lang.String" resetType="None"
		calculation="Nothing">
		<variableExpression><![CDATA["Expedientes Cerrados por procedimiento"]]></variableExpression>
	</variable>
	<variable name="ca.title" class="java.lang.String" resetType="None"
		calculation="Nothing">
		<variableExpression><![CDATA["[ca]Expedientes Cerrados por procedimiento"]]></variableExpression>
	</variable>
	<variable name="eu.title" class="java.lang.String" resetType="None"
		calculation="Nothing">
		<variableExpression><![CDATA["[eu]Expedientes Cerrados por procedimiento"]]></variableExpression>
	</variable>
	<variable name="gl.title" class="java.lang.String" resetType="None"
		calculation="Nothing">
		<variableExpression><![CDATA["[gl]Expedientes Cerrados por procedimiento"]]></variableExpression>
	</variable>
	<variable name="es.column.pcd" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Procedimiento"]]></initialValueExpression>
	</variable>
	<variable name="ca.column.pcd" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Procediment"]]></initialValueExpression>
	</variable>
	<variable name="eu.column.pcd" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Prozedura"]]></initialValueExpression>
	</variable>
	<variable name="gl.column.pcd" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Procedemento"]]></initialValueExpression>
	</variable>
	<variable name="es.column.exp" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Expedientes"]]></initialValueExpression>
	</variable>
	<variable name="ca.column.exp" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Expedients"]]></initialValueExpression>
	</variable>
	<variable name="eu.column.exp" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Espedienteak"]]></initialValueExpression>
	</variable>
	<variable name="gl.column.exp" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Expedientes"]]></initialValueExpression>
	</variable>
	<variable name="properties"
		class="ieci.tdw.ispac.ispaclib.reports.JasperReportsProperties"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA[new ieci.tdw.ispac.ispaclib.reports.JasperReportsProperties (new String[]{"title", "column.pcd", "column.exp"},			new String[]{"es", "ca", "eu", "gl"},				new String[][]{	new String[]{$V{es.title}, $V{es.column.pcd},$V{es.column.exp}}, 				new String[]{$V{ca.title}, $V{ca.column.pcd},$V{ca.column.exp}}, 				new String[]{$V{eu.title}, $V{eu.column.pcd},$V{eu.column.exp}}, 				new String[]{$V{gl.title}, $V{gl.column.pcd},$V{gl.column.exp}}			      }	    )]]></initialValueExpression>
	</variable>
	<background>
		<band height="0" isSplitAllowed="true">
		</band>
	</background>
	<title>
		<band height="50" isSplitAllowed="true">
			<line direction="TopDown">
				<reportElement x="0" y="48" width="535" height="0"
					forecolor="#000000" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
			<line direction="TopDown">
				<reportElement x="0" y="3" width="535" height="0"
					forecolor="#000000" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
			<textField isStretchWithOverflow="true" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="1" y="11" width="533" height="29"
					key="textField" positionType="Float" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement textAlignment="Center" verticalAlignment="Middle">
					<font size="25" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$V{properties}.getProperty($P{REPORT_LOCALE}, "title")]]></textFieldExpression>
			</textField>
		</band>
	</title>
	<pageHeader>
		<band height="9" isSplitAllowed="true">
			<line direction="BottomUp">
				<reportElement x="0" y="8" width="535" height="1"
					forecolor="#000000" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
		</band>
	</pageHeader>
	<columnHeader>
		<band height="17" isSplitAllowed="true">
			<rectangle>
				<reportElement mode="Opaque" x="0" y="0" width="535"
					height="17" forecolor="#000000" backcolor="#808080" key="rectangle" />
				<graphicElement stretchType="NoStretch" pen="None" />
			</rectangle>
			<line direction="BottomUp">
				<reportElement x="0" y="15" width="535" height="2"
					forecolor="#000000" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
			<textField isStretchWithOverflow="true" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="0" y="0" width="429" height="17"
					forecolor="#FFFFFF" key="column.pcd" positionType="Float" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement>
					<font size="12" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$V{properties}.getProperty($P{REPORT_LOCALE}, "column.pcd")]]></textFieldExpression>
			</textField>
			<textField isStretchWithOverflow="true" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="429" y="0" width="106" height="17"
					forecolor="#FFFFFF" key="column.exp-1" positionType="Float" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement textAlignment="Center">
					<font size="12" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$V{properties}.getProperty($P{REPORT_LOCALE}, "column.exp")]]></textFieldExpression>
			</textField>
		</band>
	</columnHeader>
	<detail>
		<band height="17" isSplitAllowed="true">
			<line direction="TopDown">
				<reportElement x="0" y="16" width="535" height="0"
					forecolor="#808080" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
			<textField isStretchWithOverflow="true" pattern=""
				isBlankWhenNull="true" evaluationTime="Now" hyperlinkType="None"
				hyperlinkTarget="Self">
				<reportElement x="0" y="0" width="429" height="17"
					forecolor="#000000" key="procedimiento" positionType="Float" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement>
					<font size="12" isBold="false" isItalic="false" isUnderline="false"
						isPdfEmbedded="false" isStrikeThrough="false" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$F{nombre}]]></textFieldExpression>
			</textField>
			<textField isStretchWithOverflow="false" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="429" y="-1" width="106" height="18"
					key="expedientes" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement textAlignment="Center">
					<font size="12" />
				</textElement>
				<textFieldExpression class="java.lang.Integer"><![CDATA[$F{count}]]></textFieldExpression>
			</textField>
		</band>
	</detail>
	<columnFooter>
		<band height="0" isSplitAllowed="true">
		</band>
	</columnFooter>
	<pageFooter>
		<band height="27" isSplitAllowed="true">
			<textField isStretchWithOverflow="false" pattern=""
				isBlankWhenNull="false" evaluationTime="Now" hyperlinkType="None"
				hyperlinkTarget="Self">
				<reportElement x="326" y="3" width="170" height="19"
					forecolor="#000000" key="textField" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement textAlignment="Right">
					<font />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$V{PAGE_NUMBER} + "/"]]></textFieldExpression>
			</textField>
			<textField isStretchWithOverflow="false" pattern=""
				isBlankWhenNull="false" evaluationTime="Report" hyperlinkType="None"
				hyperlinkTarget="Self">
				<reportElement mode="Transparent" x="499" y="3" width="36"
					height="19" forecolor="#000000" backcolor="#FFFFFF" key="textField" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement>
					<font size="10" isBold="false" isItalic="false" isUnderline="false"
						isPdfEmbedded="false" isStrikeThrough="false" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA["" + $V{PAGE_NUMBER}]]></textFieldExpression>
			</textField>
			<line direction="TopDown">
				<reportElement x="0" y="5" width="534" height="0"
					forecolor="#000000" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
			<textField isStretchWithOverflow="false" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="1" y="6" width="209" height="19"
					forecolor="#000000" key="textField" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement>
					<font />
				</textElement>
				<textFieldExpression class="java.util.Date"><![CDATA[new Date()]]></textFieldExpression>
			</textField>
		</band>
	</pageFooter>
	<summary>
		<band height="0" isSplitAllowed="true">
		</band>
	</summary>
</jasperReport>',getdate(),3 , 1);





UPDATE SPAC_SQ_SEQUENCES	SET @sequence_id = sequence_id = sequence_id + 1 WHERE sequence_name = 'SPAC_SQ_ID_CTINFORMES';
insert into spac_ct_informes (id, nombre, descripcion, frm_params, xml, fecha, tipo , visibilidad)values(@sequence_id, 'Expedientes iniciados en un per�odo de tiempo por procedimiento','Expedientes iniciados en un per�odo de tiempo indicado por par�metro agrupados por procedimiento','<?xml version="1.0" encoding="ISO-8859-1"?><?xml-stylesheet type="text/xsl" href="ReportParamsForm.xsl"?><reportform>	<fields>		<field>			<columnname>INTERVALO_FECHAS</columnname>			<description>field.label.finicio</description>			<datatype>interval</datatype>			<controltype size="25" maxlength="21">text</controltype>		</field>	</fields>	<resources>		<resource isdefault="true" locale="es" key="field.label.finicio" value="Fecha inicio"/>		<resource locale="ca" key="field.label.finicio" value="Data d''inici"/>		<resource locale="gl" key="field.label.finicio" value="Data inicio"/>		<resource locale="eu" key="field.label.finicio" value="Hasiera-data"/>	</resources></reportform>','<?xml version="1.0" encoding="UTF-8"  ?><!-- Created with iReport - A designer
	for JasperReports --><!DOCTYPE jasperReport PUBLIC "//JasperReports//DTD Report Design//EN" "http://jasperreports.sourceforge.net/dtds/jasperreport.dtd">
<jasperReport name="expsIniciadosPorPcdeIntervalo"
	columnCount="1" printOrder="Vertical" orientation="Portrait" pageWidth="595"
	pageHeight="842" columnWidth="535" columnSpacing="0" leftMargin="30"
	rightMargin="30" topMargin="20" bottomMargin="20" whenNoDataType="AllSectionsNoDetail"
	isTitleNewPage="false" isSummaryNewPage="false">
	<property name="ireport.scriptlethandling" value="0" />
	<property name="ireport.encoding" value="UTF-8" />
	<import value="java.util.*" />
	<import value="net.sf.jasperreports.engine.*" />
	<import value="net.sf.jasperreports.engine.data.*" />
	<parameter name="INTERVALO_FECHAS_INIT_DATE" isForPrompting="true"
		class="java.lang.String" />
	<parameter name="INTERVALO_FECHAS_END_DATE" isForPrompting="true"
		class="java.lang.String" />
	<parameter name="INTERVALO_FECHAS" isForPrompting="true"
		class="java.lang.String">
		<defaultValueExpression><![CDATA[new String("SYSDATE - 31 AND SYSDATE")]]></defaultValueExpression>
	</parameter>
	<queryString><![CDATA[SELECT P.NOMBRE, COUNT(*) AS COUNT FROM 	SPAC_P_PROCEDIMIENTOS P,	SPAC_PROCESOS R WHERE 	P.ID = R.ID_PCD	AND R.FECHA_INICIO BETWEEN $P!{INTERVALO_FECHAS} GROUP BY P.NOMBRE]]></queryString>
	<field name="nombre" class="java.lang.String" />
	<field name="count" class="java.lang.Integer" />
	<variable name="es.title" class="java.lang.String" resetType="Report"
		calculation="Nothing">
		<initialValueExpression><![CDATA["Expedientes iniciados por procedimiento en el intervalo "]]></initialValueExpression>
	</variable>
	<variable name="ca.title" class="java.lang.String" resetType="Report"
		calculation="Nothing">
		<initialValueExpression><![CDATA["[ca]Expedientes iniciados por procedimiento en el intervalo "]]></initialValueExpression>
	</variable>
	<variable name="eu.title" class="java.lang.String" resetType="Report"
		calculation="Nothing">
		<initialValueExpression><![CDATA["[eu]Expedientes iniciados por procedimiento en el intervalo "]]></initialValueExpression>
	</variable>
	<variable name="gl.title" class="java.lang.String" resetType="Report"
		calculation="Nothing">
		<initialValueExpression><![CDATA["[gl]Expedientes iniciados por procedimiento en el intervalo "]]></initialValueExpression>
	</variable>
	<variable name="es.column.pcd" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Procedimiento"]]></initialValueExpression>
	</variable>
	<variable name="ca.column.pcd" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Procediment"]]></initialValueExpression>
	</variable>
	<variable name="eu.column.pcd" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Prozedura"]]></initialValueExpression>
	</variable>
	<variable name="gl.column.pcd" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Procedemento"]]></initialValueExpression>
	</variable>
	<variable name="es.column.exp" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Expedientes"]]></initialValueExpression>
	</variable>
	<variable name="ca.column.exp" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Expedients"]]></initialValueExpression>
	</variable>
	<variable name="eu.column.exp" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Espedienteak"]]></initialValueExpression>
	</variable>
	<variable name="gl.column.exp" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Expedientes"]]></initialValueExpression>
	</variable>
	<variable name="properties"
		class="ieci.tdw.ispac.ispaclib.reports.JasperReportsProperties"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA[new ieci.tdw.ispac.ispaclib.reports.JasperReportsProperties (new String[]{"title", "column.pcd", "column.exp"},			new String[]{"es", "ca", "eu", "gl"},				new String[][]{	new String[]{$V{es.title}, $V{es.column.pcd},$V{es.column.exp}}, 				new String[]{$V{ca.title}, $V{ca.column.pcd},$V{ca.column.exp}}, 				new String[]{$V{eu.title}, $V{eu.column.pcd},$V{eu.column.exp}}, 				new String[]{$V{gl.title}, $V{gl.column.pcd},$V{gl.column.exp}}			      }	    )]]></initialValueExpression>
	</variable>
	<background>
		<band height="0" isSplitAllowed="true">
		</band>
	</background>
	<title>
		<band height="50" isSplitAllowed="true">
			<line direction="TopDown">
				<reportElement x="0" y="48" width="535" height="0"
					forecolor="#000000" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
			<line direction="TopDown">
				<reportElement x="0" y="3" width="534" height="1"
					forecolor="#000000" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
			<textField isStretchWithOverflow="false" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="5" y="7" width="526" height="38"
					key="textField-1" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement textAlignment="Center" verticalAlignment="Middle">
					<font size="12" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$V{properties}.getProperty($P{REPORT_LOCALE}, "title") + $P{INTERVALO_FECHAS_INIT_DATE} + " - " + $P{INTERVALO_FECHAS_END_DATE}]]></textFieldExpression>
			</textField>
		</band>
	</title>
	<pageHeader>
		<band height="9" isSplitAllowed="true">
		</band>
	</pageHeader>
	<columnHeader>
		<band height="18" isSplitAllowed="true">
			<rectangle>
				<reportElement mode="Opaque" x="0" y="0" width="535"
					height="17" forecolor="#000000" backcolor="#808080" key="rectangle" />
				<graphicElement stretchType="NoStretch" pen="None" />
			</rectangle>
			<line direction="BottomUp">
				<reportElement x="0" y="0" width="534" height="1"
					forecolor="#000000" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
			<line direction="BottomUp">
				<reportElement x="0" y="15" width="535" height="0"
					forecolor="#000000" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
			<textField isStretchWithOverflow="true" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="0" y="1" width="418" height="14"
					forecolor="#FFFFFF" key="staticText" positionType="Float" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement>
					<font size="12" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$V{properties}.getProperty($P{REPORT_LOCALE}, "column.pcd")]]></textFieldExpression>
			</textField>
			<textField isStretchWithOverflow="true" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="418" y="1" width="117" height="16"
					forecolor="#FFFFFF" key="staticText" positionType="Float" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement textAlignment="Center">
					<font size="12" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$V{properties}.getProperty($P{REPORT_LOCALE}, "column.exp")]]></textFieldExpression>
			</textField>
		</band>
	</columnHeader>
	<detail>
		<band height="17" isSplitAllowed="true">
			<line direction="TopDown">
				<reportElement x="0" y="16" width="534" height="0"
					forecolor="#808080" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
			<textField isStretchWithOverflow="true" pattern=""
				isBlankWhenNull="false" evaluationTime="Now" hyperlinkType="None"
				hyperlinkTarget="Self">
				<reportElement x="0" y="0" width="418" height="17"
					forecolor="#000000" key="textField" positionType="Float" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement>
					<font size="12" isBold="false" isItalic="false" isUnderline="false"
						isPdfEmbedded="false" isStrikeThrough="false" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$F{nombre}]]></textFieldExpression>
			</textField>
			<textField isStretchWithOverflow="true" pattern=""
				isBlankWhenNull="false" evaluationTime="Now" hyperlinkType="None"
				hyperlinkTarget="Self">
				<reportElement x="418" y="0" width="117" height="17"
					forecolor="#000000" key="textField" positionType="Float" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement textAlignment="Center">
					<font size="12" isBold="false" isItalic="false" isUnderline="false"
						isPdfEmbedded="false" isStrikeThrough="false" />
				</textElement>
				<textFieldExpression class="java.lang.Integer"><![CDATA[$F{count}]]></textFieldExpression>
			</textField>
		</band>
	</detail>
	<columnFooter>
		<band height="0" isSplitAllowed="true">
		</band>
	</columnFooter>
	<pageFooter>
		<band height="27" isSplitAllowed="true">
			<textField isStretchWithOverflow="false" pattern=""
				isBlankWhenNull="false" evaluationTime="Now" hyperlinkType="None"
				hyperlinkTarget="Self">
				<reportElement x="326" y="4" width="170" height="19"
					forecolor="#000000" key="textField" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement textAlignment="Right">
					<font />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$V{PAGE_NUMBER} + "/"]]></textFieldExpression>
			</textField>
			<textField isStretchWithOverflow="false" pattern=""
				isBlankWhenNull="false" evaluationTime="Report" hyperlinkType="None"
				hyperlinkTarget="Self">
				<reportElement mode="Transparent" x="499" y="4" width="36"
					height="19" forecolor="#000000" backcolor="#FFFFFF" key="textField" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement>
					<font size="10" isBold="false" isItalic="false" isUnderline="false"
						isPdfEmbedded="false" isStrikeThrough="false" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA["" + $V{PAGE_NUMBER}]]></textFieldExpression>
			</textField>
			<line direction="TopDown">
				<reportElement x="0" y="3" width="535" height="1"
					forecolor="#000000" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
			<textField isStretchWithOverflow="false" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="1" y="6" width="209" height="19"
					forecolor="#000000" key="textField" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement>
					<font />
				</textElement>
				<textFieldExpression class="java.util.Date"><![CDATA[new Date()]]></textFieldExpression>
			</textField>
		</band>
	</pageFooter>
	<summary>
		<band height="0" isSplitAllowed="true">
		</band>
	</summary>
</jasperReport>',getdate(),3, 1);





UPDATE SPAC_SQ_SEQUENCES	SET @sequence_id = sequence_id = sequence_id + 1 WHERE sequence_name = 'SPAC_SQ_ID_CTINFORMES';
insert into spac_ct_informes (id, nombre, descripcion, xml, fecha, tipo , visibilidad)
values(@sequence_id,
'Media de documentos por expediente seg�n procedimiento',
'Media de documentos generados en los expedientes agrupados por procedimiento',
'<?xml version="1.0" encoding="UTF-8"  ?><!-- Created with iReport - A designer
	for JasperReports --><!DOCTYPE jasperReport PUBLIC "//JasperReports//DTD Report Design//EN" "http://jasperreports.sourceforge.net/dtds/jasperreport.dtd">
<jasperReport name="avgDocsPcd" columnCount="1" printOrder="Vertical"
	orientation="Portrait" pageWidth="595" pageHeight="842" columnWidth="535"
	columnSpacing="0" leftMargin="30" rightMargin="30" topMargin="20"
	bottomMargin="20" whenNoDataType="AllSectionsNoDetail" isTitleNewPage="false"
	isSummaryNewPage="false">
	<property name="ireport.scriptlethandling" value="0" />
	<property name="ireport.encoding" value="UTF-8" />
	<import value="java.util.*" />
	<import value="net.sf.jasperreports.engine.*" />
	<import value="net.sf.jasperreports.engine.data.*" />
	<queryString><![CDATA[SELECT NOMBRE, AVG(CONTADOR) AS AVG FROM (	SELECT P.NOMBRE, E.NUMEXP, COUNT(D.ID) AS CONTADOR FROM SPAC_EXPEDIENTES E LEFT OUTER JOIN SPAC_DT_DOCUMENTOS D 		ON E.NUMEXP = D.NUMEXP,		SPAC_P_PROCEDIMIENTOS P	WHERE  E.ID_PCD = P.ID	GROUP BY P.NOMBRE, E.NUMEXP) TEMPORAL GROUP BY NOMBRE ORDER BY NOMBRE]]></queryString>
	<field name="nombre" class="java.lang.String" />
	<field name="avg" class="java.math.BigDecimal" />
	<variable name="es.title" class="java.lang.String" resetType="Report"
		calculation="Nothing">
		<initialValueExpression><![CDATA["Media de documentos por expediente y procedimiento"]]></initialValueExpression>
	</variable>
	<variable name="ca.title" class="java.lang.String" resetType="Report"
		calculation="Nothing">
		<initialValueExpression><![CDATA["[ca]Media de documentos por expediente y procedimiento"]]></initialValueExpression>
	</variable>
	<variable name="eu.title" class="java.lang.String" resetType="Report"
		calculation="Nothing">
		<initialValueExpression><![CDATA["[eu]Media de documentos por expediente y procedimiento"]]></initialValueExpression>
	</variable>
	<variable name="gl.title" class="java.lang.String" resetType="Report"
		calculation="Nothing">
		<initialValueExpression><![CDATA["[gl]Media de documentos por expediente y procedimiento"]]></initialValueExpression>
	</variable>
	<variable name="es.column.pcd" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Procedimiento"]]></initialValueExpression>
	</variable>
	<variable name="ca.column.pcd" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Procediment"]]></initialValueExpression>
	</variable>
	<variable name="eu.column.pcd" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Prozedura"]]></initialValueExpression>
	</variable>
	<variable name="gl.column.pcd" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Procedemento"]]></initialValueExpression>
	</variable>
	<variable name="es.column.doc" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Documentos"]]></initialValueExpression>
	</variable>
	<variable name="ca.column.doc" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Documents"]]></initialValueExpression>
	</variable>
	<variable name="eu.column.doc" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Dokumentuak"]]></initialValueExpression>
	</variable>
	<variable name="gl.column.doc" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Documentos"]]></initialValueExpression>
	</variable>
	<variable name="properties"
		class="ieci.tdw.ispac.ispaclib.reports.JasperReportsProperties"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA[new ieci.tdw.ispac.ispaclib.reports.JasperReportsProperties (new String[]{"title", "column.pcd", "column.doc"},			new String[]{"es", "ca", "eu", "gl"},				new String[][]{	new String[]{$V{es.title}, $V{es.column.pcd},$V{es.column.doc}}, 				new String[]{$V{ca.title}, $V{ca.column.pcd},$V{ca.column.doc}}, 				new String[]{$V{eu.title}, $V{eu.column.pcd},$V{eu.column.doc}}, 				new String[]{$V{gl.title}, $V{gl.column.pcd},$V{gl.column.doc}}			      }	    )]]></initialValueExpression>
	</variable>
	<background>
		<band height="0" isSplitAllowed="true">
		</band>
	</background>
	<title>
		<band height="50" isSplitAllowed="true">
			<textField isStretchWithOverflow="false" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="0" y="5" width="534" height="40"
					key="staticText" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement textAlignment="Center" verticalAlignment="Middle">
					<font size="18" isBold="true" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$V{properties}.getProperty($P{REPORT_LOCALE}, "title")]]></textFieldExpression>
			</textField>
			<line direction="TopDown">
				<reportElement x="0" y="48" width="534" height="0"
					forecolor="#000000" key="line" positionType="FixRelativeToBottom" />
				<graphicElement stretchType="NoStretch" pen="2Point" />
			</line>
			<line direction="TopDown">
				<reportElement x="0" y="3" width="534" height="0"
					forecolor="#000000" key="line" />
				<graphicElement stretchType="NoStretch" pen="2Point" />
			</line>
		</band>
	</title>
	<pageHeader>
		<band height="9" isSplitAllowed="true">
		</band>
	</pageHeader>
	<columnHeader>
		<band height="20" isSplitAllowed="true">
			<rectangle radius="0">
				<reportElement mode="Opaque" x="1" y="1" width="534"
					height="17" forecolor="#000000" backcolor="#999999" key="element-22" />
				<graphicElement stretchType="NoStretch" pen="Thin" />
			</rectangle>
			<textField isStretchWithOverflow="false" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="0" y="1" width="440" height="16"
					forecolor="#FFFFFF" key="element-90" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" leftPadding="2" rightBorder="None"
					rightBorderColor="#000000" rightPadding="2" bottomBorder="None"
					bottomBorderColor="#000000" />
				<textElement>
					<font size="12" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$V{properties}.getProperty($P{REPORT_LOCALE}, "column.pcd")]]></textFieldExpression>
			</textField>
			<textField isStretchWithOverflow="false" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="440" y="1" width="94" height="16"
					forecolor="#FFFFFF" key="element-90" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" leftPadding="2" rightBorder="None"
					rightBorderColor="#000000" rightPadding="2" bottomBorder="None"
					bottomBorderColor="#000000" />
				<textElement textAlignment="Center">
					<font size="12" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$V{properties}.getProperty($P{REPORT_LOCALE}, "column.doc")]]></textFieldExpression>
			</textField>
		</band>
	</columnHeader>
	<detail>
		<band height="19" isSplitAllowed="true">
			<line direction="TopDown">
				<reportElement x="0" y="17" width="535" height="0"
					forecolor="#808080" key="line" positionType="FixRelativeToBottom" />
				<graphicElement stretchType="NoStretch" pen="Thin" />
			</line>
			<textField isStretchWithOverflow="true" pattern=""
				isBlankWhenNull="true" evaluationTime="Now" hyperlinkType="None"
				hyperlinkTarget="Self">
				<reportElement x="0" y="1" width="440" height="15"
					key="textField" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" leftPadding="2" rightBorder="None"
					rightBorderColor="#000000" rightPadding="2" bottomBorder="None"
					bottomBorderColor="#000000" />
				<textElement>
					<font size="12" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$F{nombre}]]></textFieldExpression>
			</textField>
			<textField isStretchWithOverflow="true" pattern="#,##0.00"
				isBlankWhenNull="true" evaluationTime="Now" hyperlinkType="None"
				hyperlinkTarget="Self">
				<reportElement x="440" y="1" width="94" height="15"
					key="textField" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" leftPadding="2" rightBorder="None"
					rightBorderColor="#000000" rightPadding="2" bottomBorder="None"
					bottomBorderColor="#000000" />
				<textElement textAlignment="Right">
					<font size="12" />
				</textElement>
				<textFieldExpression class="java.math.BigDecimal"><![CDATA[$F{avg}]]></textFieldExpression>
			</textField>
		</band>
	</detail>
	<columnFooter>
		<band height="0" isSplitAllowed="true">
		</band>
	</columnFooter>
	<pageFooter>
		<band height="27" isSplitAllowed="true">
			<textField isStretchWithOverflow="false" pattern=""
				isBlankWhenNull="false" evaluationTime="Now" hyperlinkType="None"
				hyperlinkTarget="Self">
				<reportElement x="325" y="4" width="170" height="19"
					key="textField" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement textAlignment="Right">
					<font size="10" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$V{PAGE_NUMBER} + "/"]]></textFieldExpression>
			</textField>
			<textField isStretchWithOverflow="false" pattern=""
				isBlankWhenNull="false" evaluationTime="Report" hyperlinkType="None"
				hyperlinkTarget="Self">
				<reportElement x="499" y="4" width="36" height="19"
					forecolor="#000000" backcolor="#FFFFFF" key="textField" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement textAlignment="Left" verticalAlignment="Top"
					rotation="None" lineSpacing="Single">
					<font size="10" isBold="false" isItalic="false" isUnderline="false"
						isPdfEmbedded="false" pdfEncoding="CP1252" isStrikeThrough="false" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA["" + $V{PAGE_NUMBER}]]></textFieldExpression>
			</textField>
			<line direction="TopDown">
				<reportElement x="0" y="1" width="535" height="0"
					forecolor="#000000" key="line" />
				<graphicElement stretchType="NoStretch" pen="2Point" />
			</line>
			<textField isStretchWithOverflow="false" pattern=""
				isBlankWhenNull="false" evaluationTime="Now" hyperlinkType="None"
				hyperlinkTarget="Self">
				<reportElement x="1" y="6" width="209" height="19"
					key="textField" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement>
					<font size="10" />
				</textElement>
				<textFieldExpression class="java.util.Date"><![CDATA[new Date()]]></textFieldExpression>
			</textField>
		</band>
	</pageFooter>
	<summary>
		<band height="0" isSplitAllowed="true">
		</band>
	</summary>
</jasperReport>',
getdate(),
3,1)




UPDATE SPAC_SQ_SEQUENCES	SET @sequence_id = sequence_id = sequence_id + 1 WHERE sequence_name = 'SPAC_SQ_ID_CTINFORMES';
insert into spac_ct_informes (id, nombre, descripcion, xml, fecha, tipo, visibilidad)values(@sequence_id, 'Media de tiempo en tramitar expedientes por procedimiento','Media de tiempo en tramitar los expedientes agrupados porprocedimiento','<?xml version="1.0" encoding="UTF-8"  ?><!-- Created with iReport - A designer
	for JasperReports --><!DOCTYPE jasperReport PUBLIC "//JasperReports//DTD Report Design//EN" "http://jasperreports.sourceforge.net/dtds/jasperreport.dtd">
<jasperReport name="avgTramitarExpPorPcd" columnCount="1"
	printOrder="Vertical" orientation="Portrait" pageWidth="595"
	pageHeight="842" columnWidth="535" columnSpacing="0" leftMargin="30"
	rightMargin="30" topMargin="20" bottomMargin="20" whenNoDataType="AllSectionsNoDetail"
	isTitleNewPage="false" isSummaryNewPage="false">
	<property name="ireport.scriptlethandling" value="0" />
	<property name="ireport.encoding" value="UTF-8" />
	<import value="java.util.*" />
	<import value="net.sf.jasperreports.engine.*" />
	<import value="net.sf.jasperreports.engine.data.*" />
	<queryString><![CDATA[SELECT NOMBRE, AVG(INTERVALO) AS MEDIA FROM (SELECT P.NOMBRE, A.ID_EXP, A.HITO,A.FECHA, C.ID_EXP, C.HITO, C.FECHA, C.FECHA - A.FECHA AS INTERVALO FROM 	SPAC_HITOS A INNER JOIN SPAC_HITOS C ON A.ID_EXP = C.ID_EXP AND A.ID_FASE = 0 AND A.HITO = 1 AND C.ID_FASE = 0 AND C.HITO = 2, SPAC_PROCESOS R, SPAC_P_PROCEDIMIENTOS P WHERE A.ID_EXP IN (SELECT ID_EXP FROM SPAC_HITOS WHERE ID_FASE = 0 AND HITO = 1)AND C.ID_EXP IN (SELECT ID_EXP FROM SPAC_HITOS WHERE ID_FASE = 0 AND HITO = 2)AND A.ID_EXP = R.ID AND R.ID_PCD = P.ID) TEMPORAL GROUP BY NOMBRE]]></queryString>
	<field name="nombre" class="java.lang.String" />
	<field name="media" class="java.lang.String" />
	<variable name="es.title" class="java.lang.String" resetType="Report"
		calculation="Nothing">
		<initialValueExpression><![CDATA["Expedientes Cerrados por procedimiento"]]></initialValueExpression>
	</variable>
	<variable name="ca.title" class="java.lang.String" resetType="Report"
		calculation="Nothing">
		<initialValueExpression><![CDATA["[ca]Expedientes Cerrados por procedimiento"]]></initialValueExpression>
	</variable>
	<variable name="eu.title" class="java.lang.String" resetType="Report"
		calculation="Nothing">
		<initialValueExpression><![CDATA["[eu]Expedientes Cerrados por procedimiento"]]></initialValueExpression>
	</variable>
	<variable name="gl.title" class="java.lang.String" resetType="Report"
		calculation="Nothing">
		<initialValueExpression><![CDATA["[gl]Expedientes Cerrados por procedimiento"]]></initialValueExpression>
	</variable>
	<variable name="es.column.pcd" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Procedimiento"]]></initialValueExpression>
	</variable>
	<variable name="ca.column.pcd" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Procediment"]]></initialValueExpression>
	</variable>
	<variable name="eu.column.pcd" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Prozedura"]]></initialValueExpression>
	</variable>
	<variable name="gl.column.pcd" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Procedemento"]]></initialValueExpression>
	</variable>
	<variable name="es.column.media" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Media"]]></initialValueExpression>
	</variable>
	<variable name="ca.column.media" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Mitjana"]]></initialValueExpression>
	</variable>
	<variable name="eu.column.media" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Medio"]]></initialValueExpression>
	</variable>
	<variable name="gl.column.media" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Media"]]></initialValueExpression>
	</variable>
	<variable name="properties"
		class="ieci.tdw.ispac.ispaclib.reports.JasperReportsProperties"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA[new ieci.tdw.ispac.ispaclib.reports.JasperReportsProperties (new String[]{"title", "column.pcd", "column.media"},			new String[]{"es", "ca", "eu", "gl"},				new String[][]{	new String[]{$V{es.title}, $V{es.column.pcd},$V{es.column.media}}, 				new String[]{$V{ca.title}, $V{ca.column.pcd},$V{ca.column.media}}, 				new String[]{$V{eu.title}, $V{eu.column.pcd},$V{eu.column.media}}, 				new String[]{$V{gl.title}, $V{gl.column.pcd},$V{gl.column.media}}			      }	    )]]></initialValueExpression>
	</variable>
	<background>
		<band height="0" isSplitAllowed="true">
		</band>
	</background>
	<title>
		<band height="50" isSplitAllowed="true">
			<line direction="TopDown">
				<reportElement x="0" y="48" width="535" height="0"
					forecolor="#000000" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
			<line direction="TopDown">
				<reportElement x="0" y="3" width="535" height="0"
					forecolor="#000000" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
			<textField isStretchWithOverflow="true" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="1" y="11" width="533" height="29"
					key="textField" positionType="Float" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement textAlignment="Center" verticalAlignment="Middle">
					<font size="25" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$V{properties}.getProperty($P{REPORT_LOCALE}, "title")]]></textFieldExpression>
			</textField>
		</band>
	</title>
	<pageHeader>
		<band height="9" isSplitAllowed="true">
			<line direction="BottomUp">
				<reportElement x="0" y="8" width="535" height="1"
					forecolor="#000000" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
		</band>
	</pageHeader>
	<columnHeader>
		<band height="17" isSplitAllowed="true">
			<rectangle>
				<reportElement mode="Opaque" x="0" y="0" width="535"
					height="17" forecolor="#000000" backcolor="#808080" key="rectangle" />
				<graphicElement stretchType="NoStretch" pen="None" />
			</rectangle>
			<line direction="BottomUp">
				<reportElement x="0" y="15" width="535" height="2"
					forecolor="#000000" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
			<textField isStretchWithOverflow="true" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="0" y="0" width="429" height="17"
					forecolor="#FFFFFF" key="column.pcd" positionType="Float" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement>
					<font size="12" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$V{properties}.getProperty($P{REPORT_LOCALE}, "column.pcd")]]></textFieldExpression>
			</textField>
			<textField isStretchWithOverflow="true" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="429" y="0" width="106" height="17"
					forecolor="#FFFFFF" key="column.exp-1" positionType="Float" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement textAlignment="Center">
					<font size="12" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$V{properties}.getProperty($P{REPORT_LOCALE}, "column.media")]]></textFieldExpression>
			</textField>
		</band>
	</columnHeader>
	<detail>
		<band height="17" isSplitAllowed="true">
			<line direction="TopDown">
				<reportElement x="0" y="16" width="535" height="0"
					forecolor="#808080" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
			<textField isStretchWithOverflow="true" pattern=""
				isBlankWhenNull="true" evaluationTime="Now" hyperlinkType="None"
				hyperlinkTarget="Self">
				<reportElement x="0" y="0" width="429" height="17"
					forecolor="#000000" key="procedimiento" positionType="Float" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement>
					<font size="12" isBold="false" isItalic="false" isUnderline="false"
						isPdfEmbedded="false" isStrikeThrough="false" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$F{nombre}]]></textFieldExpression>
			</textField>
			<textField isStretchWithOverflow="false" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="429" y="-1" width="106" height="18"
					key="expedientes" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement textAlignment="Right">
					<font size="12" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$F{media}]]></textFieldExpression>
			</textField>
		</band>
	</detail>
	<columnFooter>
		<band height="0" isSplitAllowed="true"></band>
	</columnFooter>
	<pageFooter>
		<band height="27" isSplitAllowed="true">
			<textField isStretchWithOverflow="false" pattern=""
				isBlankWhenNull="false" evaluationTime="Now" hyperlinkType="None"
				hyperlinkTarget="Self">
				<reportElement x="326" y="3" width="170" height="19"
					forecolor="#000000" key="textField" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement textAlignment="Right">
					<font />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$V{PAGE_NUMBER} + "/"]]></textFieldExpression>
			</textField>
			<textField isStretchWithOverflow="false" pattern=""
				isBlankWhenNull="false" evaluationTime="Report" hyperlinkType="None"
				hyperlinkTarget="Self">
				<reportElement mode="Transparent" x="499" y="3" width="36"
					height="19" forecolor="#000000" backcolor="#FFFFFF" key="textField" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement>
					<font size="10" isBold="false" isItalic="false" isUnderline="false"
						isPdfEmbedded="false" isStrikeThrough="false" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA["" + $V{PAGE_NUMBER}]]></textFieldExpression>
			</textField>
			<line direction="TopDown">
				<reportElement x="0" y="5" width="534" height="0"
					forecolor="#000000" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
			<textField isStretchWithOverflow="false" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="1" y="6" width="209" height="19"
					forecolor="#000000" key="textField" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement>
					<font />
				</textElement>
				<textFieldExpression class="java.util.Date"><![CDATA[new Date()]]></textFieldExpression>
			</textField>
		</band>
	</pageFooter>
	<summary>
		<band height="0" isSplitAllowed="true">
		</band>
	</summary>
</jasperReport>',getdate(),3, 1);





UPDATE SPAC_SQ_SEQUENCES	SET @sequence_id = sequence_id = sequence_id + 1 WHERE sequence_name = 'SPAC_SQ_ID_CTINFORMES';
insert into spac_ct_informes (id, nombre, descripcion, frm_params, xml, fecha, tipo , visibilidad)values(@sequence_id, 'Responsabilidad. Fases asignadas a responsable','Fases cuyo responsable es un usuario, grupo o departamento a seleccionar como par�metro de entrada','<?xml version="1.0" encoding="ISO-8859-1"?><?xml-stylesheet type="text/xsl" href="ReportParamsForm.xsl"?><reportform>	<fields>		<field order="01">			<columnname>RESP</columnname>			<description>field.label.responsible</description>			<datatype>objectDirectory</datatype>			<controltype size="30" maxlength="30">text</controltype>		</field>	</fields>	<resources>		<resource isdefault="true" locale="es" key="field.label.responsible" value="Responsable"/>		<resource locale="ca" key="field.label.responsible" value="Responsable"/>		<resource locale="gl" key="field.label.responsible" value="Responsable"/>		<resource locale="eu" key="field.label.responsible" value="Arduraduna"/>	</resources></reportform>','<?xml version="1.0" encoding="UTF-8"  ?><!-- Created with iReport - A designer
	for JasperReports --><!DOCTYPE jasperReport PUBLIC "//JasperReports//DTD Report Design//EN" "http://jasperreports.sourceforge.net/dtds/jasperreport.dtd">
<jasperReport name="respStages" columnCount="1" printOrder="Vertical"
	orientation="Portrait" pageWidth="595" pageHeight="842" columnWidth="535"
	columnSpacing="0" leftMargin="30" rightMargin="30" topMargin="20"
	bottomMargin="20" whenNoDataType="AllSectionsNoDetail" isTitleNewPage="false"
	isSummaryNewPage="false">
	<property name="ireport.scriptlethandling" value="0" />
	<property name="ireport.encoding" value="UTF-8" />
	<import value="java.util.*" />
	<import value="net.sf.jasperreports.engine.*" />
	<import value="net.sf.jasperreports.engine.data.*" />
	<parameter name="RESP" isForPrompting="true" class="java.lang.String" />
	<parameter name="NAME_RESP" isForPrompting="true" class="java.lang.String" />
	<queryString><![CDATA[SELECT PR.NOMBRE AS NOMBRE_PCD, P.NOMBRE AS NOMBRE_FASE, COUNT(*) AS COUNT FROM SPAC_FASES F, SPAC_P_FASES P, SPAC_P_PROCEDIMIENTOS PR WHERE F.ID_RESP = $P{RESP} AND F.ID_FASE = P.ID AND F.ID_PCD = PR.ID GROUP BY PR.NOMBRE, P.ID, P.NOMBRE ORDER BY PR.NOMBRE, P.ID]]></queryString>
	<field name="nombre_pcd" class="java.lang.String" />
	<field name="nombre_fase" class="java.lang.String" />
	<field name="count" class="java.lang.String" />
	<variable name="es.title" class="java.lang.String" resetType="Report"
		calculation="Nothing">
		<initialValueExpression><![CDATA["Fases cuya responsabilidad corresponde a ''" + $P{NAME_RESP} + "''"]]></initialValueExpression>
	</variable>
	<variable name="ca.title" class="java.lang.String" resetType="Report"
		calculation="Nothing">
		<initialValueExpression><![CDATA["[ca]Fases cuya responsabilidad corresponde a ''" + $P{NAME_RESP} + "''"]]></initialValueExpression>
	</variable>
	<variable name="eu.title" class="java.lang.String" resetType="Report"
		calculation="Nothing">
		<initialValueExpression><![CDATA["[eu]Fases cuya responsabilidad corresponde a ''" + $P{NAME_RESP} + "''"]]></initialValueExpression>
	</variable>
	<variable name="gl.title" class="java.lang.String" resetType="Report"
		calculation="Nothing">
		<initialValueExpression><![CDATA["[gl]Fases cuya responsabilidad corresponde a ''" + $P{NAME_RESP} + "''"]]></initialValueExpression>
	</variable>
	<variable name="es.column.pcd" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Procedimiento"]]></initialValueExpression>
	</variable>
	<variable name="ca.column.pcd" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Procediment"]]></initialValueExpression>
	</variable>
	<variable name="eu.column.pcd" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Prozedura"]]></initialValueExpression>
	</variable>
	<variable name="gl.column.pcd" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Procedemento"]]></initialValueExpression>
	</variable>
	<variable name="es.column.fase" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Fase"]]></initialValueExpression>
	</variable>
	<variable name="ca.column.fase" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Fase"]]></initialValueExpression>
	</variable>
	<variable name="eu.column.fase" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Fasea"]]></initialValueExpression>
	</variable>
	<variable name="gl.column.fase" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Fase"]]></initialValueExpression>
	</variable>
	<variable name="es.column.exp" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Expedientes"]]></initialValueExpression>
	</variable>
	<variable name="ca.column.exp" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Expedients"]]></initialValueExpression>
	</variable>
	<variable name="eu.column.exp" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Espedienteak"]]></initialValueExpression>
	</variable>
	<variable name="gl.column.exp" class="java.lang.String"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA["Expedientes"]]></initialValueExpression>
	</variable>
	<variable name="properties"
		class="ieci.tdw.ispac.ispaclib.reports.JasperReportsProperties"
		resetType="Report" calculation="Nothing">
		<initialValueExpression><![CDATA[new ieci.tdw.ispac.ispaclib.reports.JasperReportsProperties (new String[]{"title", "column.pcd", "column.fase", "column.exp"},			new String[]{"es", "ca", "eu", "gl"},				new String[][]{	new String[]{$V{es.title}, $V{es.column.pcd},$V{es.column.fase},$V{es.column.exp}}, 				new String[]{$V{ca.title}, $V{ca.column.pcd},$V{ca.column.fase},$V{ca.column.exp}}, 				new String[]{$V{eu.title}, $V{eu.column.pcd},$V{eu.column.fase},$V{eu.column.exp}}, 				new String[]{$V{gl.title}, $V{gl.column.pcd},$V{gl.column.fase},$V{gl.column.exp}}			      }	    )]]></initialValueExpression>
	</variable>
	<background>
		<band height="0" isSplitAllowed="true">
		</band>
	</background>
	<title>
		<band height="50" isSplitAllowed="true">
			<line direction="TopDown">
				<reportElement x="0" y="48" width="535" height="0"
					forecolor="#000000" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
			<line direction="TopDown">
				<reportElement x="0" y="3" width="535" height="0"
					forecolor="#000000" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
			<textField isStretchWithOverflow="true" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="1" y="11" width="533" height="29"
					key="textField" positionType="Float" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement textAlignment="Center" verticalAlignment="Middle">
					<font size="18" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$V{properties}.getProperty($P{REPORT_LOCALE}, "title")]]></textFieldExpression>
			</textField>
		</band>
	</title>
	<pageHeader>
		<band height="9" isSplitAllowed="true">
			<line direction="BottomUp">
				<reportElement x="0" y="8" width="535" height="1"
					forecolor="#000000" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
		</band>
	</pageHeader>
	<columnHeader>
		<band height="17" isSplitAllowed="true">
			<rectangle>
				<reportElement mode="Opaque" x="0" y="0" width="535"
					height="17" forecolor="#000000" backcolor="#808080" key="rectangle" />
				<graphicElement stretchType="NoStretch" pen="None" />
			</rectangle>
			<line direction="BottomUp">
				<reportElement x="0" y="15" width="535" height="2"
					forecolor="#000000" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
			<textField isStretchWithOverflow="true" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="0" y="0" width="312" height="17"
					forecolor="#FFFFFF" key="column.pcd" positionType="Float" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement>
					<font size="12" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$V{properties}.getProperty($P{REPORT_LOCALE}, "column.pcd")]]></textFieldExpression>
			</textField>
			<textField isStretchWithOverflow="true" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="448" y="0" width="87" height="17"
					forecolor="#FFFFFF" key="column.exp-1" positionType="Float" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement textAlignment="Center">
					<font size="12" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$V{properties}.getProperty($P{REPORT_LOCALE}, "column.exp")]]></textFieldExpression>
			</textField>
			<textField isStretchWithOverflow="true" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="313" y="0" width="134" height="17"
					forecolor="#FFFFFF" key="column.pcd-1" positionType="Float" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement>
					<font size="12" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$V{properties}.getProperty($P{REPORT_LOCALE}, "column.fase")]]></textFieldExpression>
			</textField>
		</band>
	</columnHeader>
	<detail>
		<band height="17" isSplitAllowed="true">
			<line direction="TopDown">
				<reportElement x="0" y="16" width="535" height="0"
					forecolor="#808080" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
			<textField isStretchWithOverflow="true" pattern=""
				isBlankWhenNull="true" evaluationTime="Now" hyperlinkType="None"
				hyperlinkTarget="Self">
				<reportElement x="0" y="0" width="312" height="17"
					forecolor="#000000" key="procedimiento" positionType="Float" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement>
					<font size="12" isBold="false" isItalic="false" isUnderline="false"
						isPdfEmbedded="false" isStrikeThrough="false" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$F{nombre_pcd}]]></textFieldExpression>
			</textField>
			<textField isStretchWithOverflow="true" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="448" y="-1" width="87" height="18"
					key="expedientes" positionType="Float" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement textAlignment="Right">
					<font size="12" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$F{count}]]></textFieldExpression>
			</textField>
			<textField isStretchWithOverflow="true" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="313" y="0" width="134" height="16"
					key="textField" positionType="Float" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement>
					<font />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$F{nombre_fase}]]></textFieldExpression>
			</textField>
		</band>
	</detail>
	<columnFooter>
		<band height="0" isSplitAllowed="true">
		</band>
	</columnFooter>
	<pageFooter>
		<band height="27" isSplitAllowed="true">
			<textField isStretchWithOverflow="false" pattern=""
				isBlankWhenNull="false" evaluationTime="Now" hyperlinkType="None"
				hyperlinkTarget="Self">
				<reportElement x="326" y="3" width="170" height="19"
					forecolor="#000000" key="textField" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement textAlignment="Right">
					<font />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA[$V{PAGE_NUMBER} + "/"]]></textFieldExpression>
			</textField>
			<textField isStretchWithOverflow="false" pattern=""
				isBlankWhenNull="false" evaluationTime="Report" hyperlinkType="None"
				hyperlinkTarget="Self">
				<reportElement mode="Transparent" x="499" y="3" width="36"
					height="19" forecolor="#000000" backcolor="#FFFFFF" key="textField" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement>
					<font size="10" isBold="false" isItalic="false" isUnderline="false"
						isPdfEmbedded="false" isStrikeThrough="false" />
				</textElement>
				<textFieldExpression class="java.lang.String"><![CDATA["" + $V{PAGE_NUMBER}]]></textFieldExpression>
			</textField>
			<line direction="TopDown">
				<reportElement x="0" y="5" width="534" height="0"
					forecolor="#000000" backcolor="#FFFFFF" key="line" />
				<graphicElement stretchType="NoStretch" />
			</line>
			<textField isStretchWithOverflow="false" isBlankWhenNull="false"
				evaluationTime="Now" hyperlinkType="None" hyperlinkTarget="Self">
				<reportElement x="1" y="6" width="209" height="19"
					forecolor="#000000" key="textField" />
				<box topBorder="None" topBorderColor="#000000" leftBorder="None"
					leftBorderColor="#000000" rightBorder="None" rightBorderColor="#000000"
					bottomBorder="None" bottomBorderColor="#000000" />
				<textElement>
					<font />
				</textElement>
				<textFieldExpression class="java.util.Date"><![CDATA[new Date()]]></textFieldExpression>
			</textField>
		</band>
	</pageFooter>
	<summary>
		<band height="0" isSplitAllowed="true">
		</band>
	</summary>
</jasperReport>',getdate(),3 , 1);