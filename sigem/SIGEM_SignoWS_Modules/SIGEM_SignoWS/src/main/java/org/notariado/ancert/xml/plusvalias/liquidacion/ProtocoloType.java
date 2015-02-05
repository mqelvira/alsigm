//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v@@BUILD_VERSION@@ 
// 	See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// 	Any modifications to this file will be lost upon recompilation of the source schema. 
// 	Generated on: 2011.07.04 en 12:38:50 CEST 
//


package org.notariado.ancert.xml.plusvalias.liquidacion;


/**
 * Java content class for ProtocoloType complex type.
 * 	<p>The following schema fragment specifies the expected 	content contained within this java content object. 	(defined at file:/C:/Sun/jwsdp-1.5/jaxb/bin/IIVTNU-WS-Ayto.xsd line 1296)
 * <p>
 * <pre>
 * &lt;complexType name="ProtocoloType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="NUMERO" type="{http://ancert.notariado.org/XML/Plusvalias/Liquidacion}NUMERO_DOCUMENTOType"/>
 *         &lt;element name="NUMERO_BIS" type="{http://ancert.notariado.org/XML/Plusvalias/Liquidacion}NUMERO_DOCUMENTO_BISType" minOccurs="0"/>
 *         &lt;element name="FECHA_AUTORIZACION" type="{http://ancert.notariado.org/XML/Plusvalias/Liquidacion}TFecha"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 */
public interface ProtocoloType {


    /**
     * N�mero de protocolo
     * 
     */
    long getNUMERO();

    /**
     * N�mero de protocolo
     * 
     */
    void setNUMERO(long value);

    /**
     * Fecha de autorizaci�n del documento p�blico. Ser� la fecha de transmisi�n en transmisiones Intervivos.
     * 
     * @return
     *     possible object is
     *     {@link java.lang.String}
     */
    java.lang.String getFECHAAUTORIZACION();

    /**
     * Fecha de autorizaci�n del documento p�blico. Ser� la fecha de transmisi�n en transmisiones Intervivos.
     * 
     * @param value
     *     allowed object is
     *     {@link java.lang.String}
     */
    void setFECHAAUTORIZACION(java.lang.String value);

    /**
     * N�mero de protocolo bis
     * 
     */
    long getNUMEROBIS();

    /**
     * N�mero de protocolo bis
     * 
     */
    void setNUMEROBIS(long value);

}
