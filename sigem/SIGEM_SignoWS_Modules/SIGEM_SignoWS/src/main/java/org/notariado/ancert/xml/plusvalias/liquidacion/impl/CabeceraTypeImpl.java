//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v@@BUILD_VERSION@@ 
// 	See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// 	Any modifications to this file will be lost upon recompilation of the source schema. 
// 	Generated on: 2011.07.04 en 12:38:50 CEST 
//


package org.notariado.ancert.xml.plusvalias.liquidacion.impl;

public class CabeceraTypeImpl implements org.notariado.ancert.xml.plusvalias.liquidacion.CabeceraType, com.sun.xml.bind.JAXBObject, org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.UnmarshallableObject, org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.XMLSerializable, org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.ValidatableObject
{

    protected java.lang.String _RECEPTOR;
    protected java.lang.String _APLICACION;
    protected java.lang.String _FECHA;
    protected java.lang.String _HORA;
    protected boolean has_IDCOMUNICACION;
    protected long _IDCOMUNICACION;
    protected java.lang.String _EMISOR;
    protected java.lang.String _OPERACION;
    public final static java.lang.Class version = (org.notariado.ancert.xml.plusvalias.liquidacion.impl.JAXBVersion.class);
    private static com.sun.msv.grammar.Grammar schemaFragment;

    private final static java.lang.Class PRIMARY_INTERFACE_CLASS() {
        return (org.notariado.ancert.xml.plusvalias.liquidacion.CabeceraType.class);
    }

    public java.lang.String getRECEPTOR() {
        return _RECEPTOR;
    }

    public void setRECEPTOR(java.lang.String value) {
        _RECEPTOR = value;
    }

    public java.lang.String getAPLICACION() {
        return _APLICACION;
    }

    public void setAPLICACION(java.lang.String value) {
        _APLICACION = value;
    }

    public java.lang.String getFECHA() {
        return _FECHA;
    }

    public void setFECHA(java.lang.String value) {
        _FECHA = value;
    }

    public java.lang.String getHORA() {
        return _HORA;
    }

    public void setHORA(java.lang.String value) {
        _HORA = value;
    }

    public long getIDCOMUNICACION() {
        return _IDCOMUNICACION;
    }

    public void setIDCOMUNICACION(long value) {
        _IDCOMUNICACION = value;
        has_IDCOMUNICACION = true;
    }

    public java.lang.String getEMISOR() {
        return _EMISOR;
    }

    public void setEMISOR(java.lang.String value) {
        _EMISOR = value;
    }

    public java.lang.String getOPERACION() {
        return _OPERACION;
    }

    public void setOPERACION(java.lang.String value) {
        _OPERACION = value;
    }

    public org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.UnmarshallingEventHandler createUnmarshaller(org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.UnmarshallingContext context) {
        return new org.notariado.ancert.xml.plusvalias.liquidacion.impl.CabeceraTypeImpl.Unmarshaller(context);
    }

    public void serializeBody(org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.XMLSerializer context)
        throws org.xml.sax.SAXException
    {
        if (!has_IDCOMUNICACION) {
            context.reportError(com.sun.xml.bind.serializer.Util.createMissingObjectError(this, "IDCOMUNICACION"));
        }
        context.startElement("http://ancert.notariado.org/XML/Plusvalias/Liquidacion", "APLICACION");
        context.endNamespaceDecls();
        context.endAttributes();
        try {
            context.text(((java.lang.String) _APLICACION), "APLICACION");
        } catch (java.lang.Exception e) {
            org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.Util.handlePrintConversionException(this, e, context);
        }
        context.endElement();
        context.startElement("http://ancert.notariado.org/XML/Plusvalias/Liquidacion", "ID_COMUNICACION");
        context.endNamespaceDecls();
        context.endAttributes();
        try {
            context.text(javax.xml.bind.DatatypeConverter.printLong(((long) _IDCOMUNICACION)), "IDCOMUNICACION");
        } catch (java.lang.Exception e) {
            org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.Util.handlePrintConversionException(this, e, context);
        }
        context.endElement();
        context.startElement("http://ancert.notariado.org/XML/Plusvalias/Liquidacion", "FECHA");
        context.endNamespaceDecls();
        context.endAttributes();
        try {
            context.text(((java.lang.String) _FECHA), "FECHA");
        } catch (java.lang.Exception e) {
            org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.Util.handlePrintConversionException(this, e, context);
        }
        context.endElement();
        context.startElement("http://ancert.notariado.org/XML/Plusvalias/Liquidacion", "HORA");
        context.endNamespaceDecls();
        context.endAttributes();
        try {
            context.text(((java.lang.String) _HORA), "HORA");
        } catch (java.lang.Exception e) {
            org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.Util.handlePrintConversionException(this, e, context);
        }
        context.endElement();
        context.startElement("http://ancert.notariado.org/XML/Plusvalias/Liquidacion", "OPERACION");
        context.endNamespaceDecls();
        context.endAttributes();
        try {
            context.text(((java.lang.String) _OPERACION), "OPERACION");
        } catch (java.lang.Exception e) {
            org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.Util.handlePrintConversionException(this, e, context);
        }
        context.endElement();
        context.startElement("http://ancert.notariado.org/XML/Plusvalias/Liquidacion", "EMISOR");
        context.endNamespaceDecls();
        context.endAttributes();
        try {
            context.text(((java.lang.String) _EMISOR), "EMISOR");
        } catch (java.lang.Exception e) {
            org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.Util.handlePrintConversionException(this, e, context);
        }
        context.endElement();
        context.startElement("http://ancert.notariado.org/XML/Plusvalias/Liquidacion", "RECEPTOR");
        context.endNamespaceDecls();
        context.endAttributes();
        try {
            context.text(((java.lang.String) _RECEPTOR), "RECEPTOR");
        } catch (java.lang.Exception e) {
            org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.Util.handlePrintConversionException(this, e, context);
        }
        context.endElement();
    }

    public void serializeAttributes(org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.XMLSerializer context)
        throws org.xml.sax.SAXException
    {
        if (!has_IDCOMUNICACION) {
            context.reportError(com.sun.xml.bind.serializer.Util.createMissingObjectError(this, "IDCOMUNICACION"));
        }
    }

    public void serializeURIs(org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.XMLSerializer context)
        throws org.xml.sax.SAXException
    {
        if (!has_IDCOMUNICACION) {
            context.reportError(com.sun.xml.bind.serializer.Util.createMissingObjectError(this, "IDCOMUNICACION"));
        }
    }

    public java.lang.Class getPrimaryInterface() {
        return (org.notariado.ancert.xml.plusvalias.liquidacion.CabeceraType.class);
    }

    public com.sun.msv.verifier.DocumentDeclaration createRawValidator() {
        if (schemaFragment == null) {
            schemaFragment = com.sun.xml.bind.validator.SchemaDeserializer.deserialize((
 "\u00ac\u00ed\u0000\u0005sr\u0000\u001fcom.sun.msv.grammar.SequenceExp\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0000xr\u0000\u001dcom.su"
+"n.msv.grammar.BinaryExp\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0002L\u0000\u0004exp1t\u0000 Lcom/sun/msv/gra"
+"mmar/Expression;L\u0000\u0004exp2q\u0000~\u0000\u0002xr\u0000\u001ecom.sun.msv.grammar.Expressi"
+"on\u00f8\u0018\u0082\u00e8N5~O\u0002\u0000\u0002L\u0000\u0013epsilonReducibilityt\u0000\u0013Ljava/lang/Boolean;L\u0000\u000b"
+"expandedExpq\u0000~\u0000\u0002xpppsq\u0000~\u0000\u0000ppsq\u0000~\u0000\u0000ppsq\u0000~\u0000\u0000ppsq\u0000~\u0000\u0000ppsq\u0000~\u0000\u0000pp"
+"sr\u0000\'com.sun.msv.grammar.trex.ElementPattern\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0001L\u0000\tnam"
+"eClasst\u0000\u001fLcom/sun/msv/grammar/NameClass;xr\u0000\u001ecom.sun.msv.gram"
+"mar.ElementExp\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0002Z\u0000\u001aignoreUndeclaredAttributesL\u0000\fcon"
+"tentModelq\u0000~\u0000\u0002xq\u0000~\u0000\u0003pp\u0000sq\u0000~\u0000\u0000ppsr\u0000\u001bcom.sun.msv.grammar.DataE"
+"xp\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0003L\u0000\u0002dtt\u0000\u001fLorg/relaxng/datatype/Datatype;L\u0000\u0006excep"
+"tq\u0000~\u0000\u0002L\u0000\u0004namet\u0000\u001dLcom/sun/msv/util/StringPair;xq\u0000~\u0000\u0003ppsr\u0000#com"
+".sun.msv.datatype.xsd.StringType\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0001Z\u0000\risAlwaysValidx"
+"r\u0000*com.sun.msv.datatype.xsd.BuiltinAtomicType\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0000xr\u0000%"
+"com.sun.msv.datatype.xsd.ConcreteType\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0000xr\u0000\'com.sun."
+"msv.datatype.xsd.XSDatatypeImpl\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0003L\u0000\fnamespaceUrit\u0000\u0012"
+"Ljava/lang/String;L\u0000\btypeNameq\u0000~\u0000\u0018L\u0000\nwhiteSpacet\u0000.Lcom/sun/m"
+"sv/datatype/xsd/WhiteSpaceProcessor;xpt\u0000 http://www.w3.org/2"
+"001/XMLSchemat\u0000\u0006stringsr\u00005com.sun.msv.datatype.xsd.WhiteSpac"
+"eProcessor$Preserve\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0000xr\u0000,com.sun.msv.datatype.xsd.W"
+"hiteSpaceProcessor\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0000xp\u0001sr\u00000com.sun.msv.grammar.Expr"
+"ession$NullSetExpression\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0000xq\u0000~\u0000\u0003sr\u0000\u0011java.lang.Boole"
+"an\u00cd r\u0080\u00d5\u009c\u00fa\u00ee\u0002\u0000\u0001Z\u0000\u0005valuexp\u0000psr\u0000\u001bcom.sun.msv.util.StringPair\u00d0t\u001ej"
+"B\u008f\u008d\u00a0\u0002\u0000\u0002L\u0000\tlocalNameq\u0000~\u0000\u0018L\u0000\fnamespaceURIq\u0000~\u0000\u0018xpq\u0000~\u0000\u001cq\u0000~\u0000\u001bsr\u0000\u001d"
+"com.sun.msv.grammar.ChoiceExp\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0000xq\u0000~\u0000\u0001ppsr\u0000 com.sun."
+"msv.grammar.AttributeExp\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0002L\u0000\u0003expq\u0000~\u0000\u0002L\u0000\tnameClassq\u0000"
+"~\u0000\fxq\u0000~\u0000\u0003q\u0000~\u0000#psq\u0000~\u0000\u0010ppsr\u0000\"com.sun.msv.datatype.xsd.QnameTyp"
+"e\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0000xq\u0000~\u0000\u0015q\u0000~\u0000\u001bt\u0000\u0005QNamesr\u00005com.sun.msv.datatype.xsd."
+"WhiteSpaceProcessor$Collapse\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0000xq\u0000~\u0000\u001eq\u0000~\u0000!sq\u0000~\u0000$q\u0000~\u0000"
+"-q\u0000~\u0000\u001bsr\u0000#com.sun.msv.grammar.SimpleNameClass\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0002L\u0000\tl"
+"ocalNameq\u0000~\u0000\u0018L\u0000\fnamespaceURIq\u0000~\u0000\u0018xr\u0000\u001dcom.sun.msv.grammar.Nam"
+"eClass\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0000xpt\u0000\u0004typet\u0000)http://www.w3.org/2001/XMLSchem"
+"a-instancesr\u00000com.sun.msv.grammar.Expression$EpsilonExpressi"
+"on\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0000xq\u0000~\u0000\u0003sq\u0000~\u0000\"\u0001q\u0000~\u00007sq\u0000~\u00001t\u0000\nAPLICACIONt\u00006http://"
+"ancert.notariado.org/XML/Plusvalias/Liquidacionsq\u0000~\u0000\u000bpp\u0000sq\u0000~"
+"\u0000\u0000ppsq\u0000~\u0000\u0010ppsr\u0000!com.sun.msv.datatype.xsd.LongType\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0000"
+"xr\u0000+com.sun.msv.datatype.xsd.IntegerDerivedType\u0099\u00f1]\u0090&6k\u00be\u0002\u0000\u0001L\u0000"
+"\nbaseFacetst\u0000)Lcom/sun/msv/datatype/xsd/XSDatatypeImpl;xq\u0000~\u0000"
+"\u0015q\u0000~\u0000\u001bt\u0000\u0004longq\u0000~\u0000/sr\u0000*com.sun.msv.datatype.xsd.MaxInclusiveF"
+"acet\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0000xr\u0000#com.sun.msv.datatype.xsd.RangeFacet\u0000\u0000\u0000\u0000\u0000\u0000"
+"\u0000\u0001\u0002\u0000\u0001L\u0000\nlimitValuet\u0000\u0012Ljava/lang/Object;xr\u00009com.sun.msv.datat"
+"ype.xsd.DataTypeWithValueConstraintFacet\"\u00a7Ro\u00ca\u00c7\u008aT\u0002\u0000\u0000xr\u0000*com.s"
+"un.msv.datatype.xsd.DataTypeWithFacet\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0005Z\u0000\fisFacetFi"
+"xedZ\u0000\u0012needValueCheckFlagL\u0000\bbaseTypeq\u0000~\u0000AL\u0000\fconcreteTypet\u0000\'Lc"
+"om/sun/msv/datatype/xsd/ConcreteType;L\u0000\tfacetNameq\u0000~\u0000\u0018xq\u0000~\u0000\u0017"
+"ppq\u0000~\u0000/\u0000\u0001sr\u0000*com.sun.msv.datatype.xsd.MinInclusiveFacet\u0000\u0000\u0000\u0000\u0000"
+"\u0000\u0000\u0001\u0002\u0000\u0000xq\u0000~\u0000Eppq\u0000~\u0000/\u0000\u0000sr\u0000$com.sun.msv.datatype.xsd.IntegerTyp"
+"e\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0000xq\u0000~\u0000@q\u0000~\u0000\u001bt\u0000\u0007integerq\u0000~\u0000/sr\u0000,com.sun.msv.dataty"
+"pe.xsd.FractionDigitsFacet\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0001I\u0000\u0005scalexr\u0000;com.sun.msv"
+".datatype.xsd.DataTypeWithLexicalConstraintFacetT\u0090\u001c>\u001azb\u00ea\u0002\u0000\u0000x"
+"q\u0000~\u0000Hppq\u0000~\u0000/\u0001\u0000sr\u0000#com.sun.msv.datatype.xsd.NumberType\u0000\u0000\u0000\u0000\u0000\u0000\u0000"
+"\u0001\u0002\u0000\u0000xq\u0000~\u0000\u0015q\u0000~\u0000\u001bt\u0000\u0007decimalq\u0000~\u0000/q\u0000~\u0000Tt\u0000\u000efractionDigits\u0000\u0000\u0000\u0000q\u0000~\u0000"
+"Nt\u0000\fminInclusivesr\u0000\u000ejava.lang.Long;\u008b\u00e4\u0090\u00cc\u008f#\u00df\u0002\u0000\u0001J\u0000\u0005valuexr\u0000\u0010jav"
+"a.lang.Number\u0086\u00ac\u0095\u001d\u000b\u0094\u00e0\u008b\u0002\u0000\u0000xp\u0080\u0000\u0000\u0000\u0000\u0000\u0000\u0000q\u0000~\u0000Nt\u0000\fmaxInclusivesq\u0000~\u0000X"
+"\u007f\u00ff\u00ff\u00ff\u00ff\u00ff\u00ff\u00ffq\u0000~\u0000!sq\u0000~\u0000$q\u0000~\u0000Cq\u0000~\u0000\u001bsq\u0000~\u0000&ppsq\u0000~\u0000(q\u0000~\u0000#pq\u0000~\u0000*q\u0000~\u00003q"
+"\u0000~\u00007sq\u0000~\u00001t\u0000\u000fID_COMUNICACIONq\u0000~\u0000;sq\u0000~\u0000\u000bpp\u0000sq\u0000~\u0000\u0000ppsq\u0000~\u0000\u0010ppsr"
+"\u0000%com.sun.msv.datatype.xsd.PatternFacet\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0001[\u0000\bpattern"
+"st\u0000\u0013[Ljava/lang/String;xq\u0000~\u0000Qq\u0000~\u0000;t\u0000\u0006TFechaq\u0000~\u0000/\u0000\u0000sr\u0000\"com.su"
+"n.msv.datatype.xsd.TokenType\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0000xq\u0000~\u0000\u0014q\u0000~\u0000\u001bt\u0000\u0005tokenq\u0000"
+"~\u0000/\u0001q\u0000~\u0000jt\u0000\u0007patternur\u0000\u0013[Ljava.lang.String;\u00ad\u00d2V\u00e7\u00e9\u001d{G\u0002\u0000\u0000xp\u0000\u0000\u0000\u0001t"
+"\u0000\u0011\\d{2}/\\d{2}/\\d{4}q\u0000~\u0000!sq\u0000~\u0000$q\u0000~\u0000hq\u0000~\u0000;sq\u0000~\u0000&ppsq\u0000~\u0000(q\u0000~\u0000#p"
+"q\u0000~\u0000*q\u0000~\u00003q\u0000~\u00007sq\u0000~\u00001t\u0000\u0005FECHAq\u0000~\u0000;sq\u0000~\u0000\u000bpp\u0000sq\u0000~\u0000\u0000ppsq\u0000~\u0000\u0010pps"
+"q\u0000~\u0000eq\u0000~\u0000;t\u0000\u0005THoraq\u0000~\u0000/\u0000\u0000q\u0000~\u0000jq\u0000~\u0000jq\u0000~\u0000luq\u0000~\u0000m\u0000\u0000\u0000\u0001t\u0000\u0011\\d{2}:\\"
+"d{2}:\\d{2}q\u0000~\u0000!sq\u0000~\u0000$q\u0000~\u0000yq\u0000~\u0000;sq\u0000~\u0000&ppsq\u0000~\u0000(q\u0000~\u0000#pq\u0000~\u0000*q\u0000~\u0000"
+"3q\u0000~\u00007sq\u0000~\u00001t\u0000\u0004HORAq\u0000~\u0000;sq\u0000~\u0000\u000bpp\u0000sq\u0000~\u0000\u0000ppsq\u0000~\u0000\u0010ppsr\u0000)com.sun"
+".msv.datatype.xsd.EnumerationFacet\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0001L\u0000\u0006valuest\u0000\u000fLja"
+"va/util/Set;xq\u0000~\u0000Gq\u0000~\u0000;pq\u0000~\u0000\u001f\u0000\u0000q\u0000~\u0000\u001aq\u0000~\u0000\u001at\u0000\u000benumerationsr\u0000\u0011j"
+"ava.util.HashSet\u00baD\u0085\u0095\u0096\u00b8\u00b74\u0003\u0000\u0000xpw\f\u0000\u0000\u0000\u0010?@\u0000\u0000\u0000\u0000\u0000\u0003t\u0000\u000201t\u0000\u000203t\u0000\u000202xq"
+"\u0000~\u0000!sq\u0000~\u0000$t\u0000\u000estring-derivedq\u0000~\u0000;sq\u0000~\u0000&ppsq\u0000~\u0000(q\u0000~\u0000#pq\u0000~\u0000*q\u0000~"
+"\u00003q\u0000~\u00007sq\u0000~\u00001t\u0000\tOPERACIONq\u0000~\u0000;sq\u0000~\u0000\u000bpp\u0000sq\u0000~\u0000\u0000ppq\u0000~\u0000\u0013sq\u0000~\u0000&pp"
+"sq\u0000~\u0000(q\u0000~\u0000#pq\u0000~\u0000*q\u0000~\u00003q\u0000~\u00007sq\u0000~\u00001t\u0000\u0006EMISORq\u0000~\u0000;sq\u0000~\u0000\u000bpp\u0000sq\u0000~"
+"\u0000\u0000ppsq\u0000~\u0000\u0010ppsr\u0000(com.sun.msv.datatype.xsd.WhiteSpaceFacet\u0000\u0000\u0000\u0000"
+"\u0000\u0000\u0000\u0001\u0002\u0000\u0000xq\u0000~\u0000Hq\u0000~\u0000;pq\u0000~\u0000/\u0000\u0001sr\u0000\'com.sun.msv.datatype.xsd.MaxLe"
+"ngthFacet\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0001I\u0000\tmaxLengthxq\u0000~\u0000Gq\u0000~\u0000;pq\u0000~\u0000\u001f\u0000\u0001sr\u0000\'com.s"
+"un.msv.datatype.xsd.MinLengthFacet\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0001I\u0000\tminLengthxq\u0000"
+"~\u0000Gq\u0000~\u0000;pq\u0000~\u0000\u001f\u0000\u0000q\u0000~\u0000\u001aq\u0000~\u0000\u001at\u0000\tminLength\u0000\u0000\u0000\u0003q\u0000~\u0000\u001at\u0000\tmaxLength\u0000"
+"\u0000\u0000\u0006q\u0000~\u0000\u001at\u0000\nwhiteSpaceq\u0000~\u0000!sq\u0000~\u0000$t\u0000\u000estring-derivedq\u0000~\u0000;sq\u0000~\u0000&"
+"ppsq\u0000~\u0000(q\u0000~\u0000#pq\u0000~\u0000*q\u0000~\u00003q\u0000~\u00007sq\u0000~\u00001t\u0000\bRECEPTORq\u0000~\u0000;sr\u0000\"com.s"
+"un.msv.grammar.ExpressionPool\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0001L\u0000\bexpTablet\u0000/Lcom/s"
+"un/msv/grammar/ExpressionPool$ClosedHash;xpsr\u0000-com.sun.msv.g"
+"rammar.ExpressionPool$ClosedHash\u00d7j\u00d0N\u00ef\u00e8\u00ed\u001c\u0003\u0000\u0003I\u0000\u0005countB\u0000\rstream"
+"VersionL\u0000\u0006parentt\u0000$Lcom/sun/msv/grammar/ExpressionPool;xp\u0000\u0000\u0000"
+"\u0014\u0001pq\u0000~\u0000\u0007q\u0000~\u0000\tq\u0000~\u0000\nq\u0000~\u0000\u000fq\u0000~\u0000\u0094q\u0000~\u0000cq\u0000~\u0000\u009aq\u0000~\u0000\bq\u0000~\u0000\u0082q\u0000~\u0000\'q\u0000~\u0000^q\u0000"
+"~\u0000qq\u0000~\u0000}q\u0000~\u0000\u008fq\u0000~\u0000\u0095q\u0000~\u0000\u0006q\u0000~\u0000\u00a7q\u0000~\u0000=q\u0000~\u0000vq\u0000~\u0000\u0005x"));
        }
        return new com.sun.msv.verifier.regexp.REDocumentDeclaration(schemaFragment);
    }

    public class Unmarshaller
        extends org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.AbstractUnmarshallingEventHandlerImpl
    {


        public Unmarshaller(org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.UnmarshallingContext context) {
            super(context, "----------------------");
        }

        protected Unmarshaller(org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.UnmarshallingContext context, int startState) {
            this(context);
            state = startState;
        }

        public java.lang.Object owner() {
            return org.notariado.ancert.xml.plusvalias.liquidacion.impl.CabeceraTypeImpl.this;
        }

        public void enterElement(java.lang.String ___uri, java.lang.String ___local, java.lang.String ___qname, org.xml.sax.Attributes __atts)
            throws org.xml.sax.SAXException
        {
            int attIdx;
            outer:
            while (true) {
                switch (state) {
                    case  12 :
                        if (("OPERACION" == ___local)&&("http://ancert.notariado.org/XML/Plusvalias/Liquidacion" == ___uri)) {
                            context.pushAttributes(__atts, true);
                            state = 13;
                            return ;
                        }
                        break;
                    case  3 :
                        if (("ID_COMUNICACION" == ___local)&&("http://ancert.notariado.org/XML/Plusvalias/Liquidacion" == ___uri)) {
                            context.pushAttributes(__atts, true);
                            state = 4;
                            return ;
                        }
                        break;
                    case  6 :
                        if (("FECHA" == ___local)&&("http://ancert.notariado.org/XML/Plusvalias/Liquidacion" == ___uri)) {
                            context.pushAttributes(__atts, true);
                            state = 7;
                            return ;
                        }
                        break;
                    case  21 :
                        revertToParentFromEnterElement(___uri, ___local, ___qname, __atts);
                        return ;
                    case  0 :
                        if (("APLICACION" == ___local)&&("http://ancert.notariado.org/XML/Plusvalias/Liquidacion" == ___uri)) {
                            context.pushAttributes(__atts, true);
                            state = 1;
                            return ;
                        }
                        break;
                    case  9 :
                        if (("HORA" == ___local)&&("http://ancert.notariado.org/XML/Plusvalias/Liquidacion" == ___uri)) {
                            context.pushAttributes(__atts, true);
                            state = 10;
                            return ;
                        }
                        break;
                    case  18 :
                        if (("RECEPTOR" == ___local)&&("http://ancert.notariado.org/XML/Plusvalias/Liquidacion" == ___uri)) {
                            context.pushAttributes(__atts, true);
                            state = 19;
                            return ;
                        }
                        break;
                    case  15 :
                        if (("EMISOR" == ___local)&&("http://ancert.notariado.org/XML/Plusvalias/Liquidacion" == ___uri)) {
                            context.pushAttributes(__atts, true);
                            state = 16;
                            return ;
                        }
                        break;
                }
                super.enterElement(___uri, ___local, ___qname, __atts);
                break;
            }
        }

        public void leaveElement(java.lang.String ___uri, java.lang.String ___local, java.lang.String ___qname)
            throws org.xml.sax.SAXException
        {
            int attIdx;
            outer:
            while (true) {
                switch (state) {
                    case  11 :
                        if (("HORA" == ___local)&&("http://ancert.notariado.org/XML/Plusvalias/Liquidacion" == ___uri)) {
                            context.popAttributes();
                            state = 12;
                            return ;
                        }
                        break;
                    case  5 :
                        if (("ID_COMUNICACION" == ___local)&&("http://ancert.notariado.org/XML/Plusvalias/Liquidacion" == ___uri)) {
                            context.popAttributes();
                            state = 6;
                            return ;
                        }
                        break;
                    case  17 :
                        if (("EMISOR" == ___local)&&("http://ancert.notariado.org/XML/Plusvalias/Liquidacion" == ___uri)) {
                            context.popAttributes();
                            state = 18;
                            return ;
                        }
                        break;
                    case  21 :
                        revertToParentFromLeaveElement(___uri, ___local, ___qname);
                        return ;
                    case  14 :
                        if (("OPERACION" == ___local)&&("http://ancert.notariado.org/XML/Plusvalias/Liquidacion" == ___uri)) {
                            context.popAttributes();
                            state = 15;
                            return ;
                        }
                        break;
                    case  8 :
                        if (("FECHA" == ___local)&&("http://ancert.notariado.org/XML/Plusvalias/Liquidacion" == ___uri)) {
                            context.popAttributes();
                            state = 9;
                            return ;
                        }
                        break;
                    case  20 :
                        if (("RECEPTOR" == ___local)&&("http://ancert.notariado.org/XML/Plusvalias/Liquidacion" == ___uri)) {
                            context.popAttributes();
                            state = 21;
                            return ;
                        }
                        break;
                    case  2 :
                        if (("APLICACION" == ___local)&&("http://ancert.notariado.org/XML/Plusvalias/Liquidacion" == ___uri)) {
                            context.popAttributes();
                            state = 3;
                            return ;
                        }
                        break;
                }
                super.leaveElement(___uri, ___local, ___qname);
                break;
            }
        }

        public void enterAttribute(java.lang.String ___uri, java.lang.String ___local, java.lang.String ___qname)
            throws org.xml.sax.SAXException
        {
            int attIdx;
            outer:
            while (true) {
                switch (state) {
                    case  21 :
                        revertToParentFromEnterAttribute(___uri, ___local, ___qname);
                        return ;
                }
                super.enterAttribute(___uri, ___local, ___qname);
                break;
            }
        }

        public void leaveAttribute(java.lang.String ___uri, java.lang.String ___local, java.lang.String ___qname)
            throws org.xml.sax.SAXException
        {
            int attIdx;
            outer:
            while (true) {
                switch (state) {
                    case  21 :
                        revertToParentFromLeaveAttribute(___uri, ___local, ___qname);
                        return ;
                }
                super.leaveAttribute(___uri, ___local, ___qname);
                break;
            }
        }

        public void handleText(final java.lang.String value)
            throws org.xml.sax.SAXException
        {
            int attIdx;
            outer:
            while (true) {
                try {
                    switch (state) {
                        case  1 :
                            eatText1(value);
                            state = 2;
                            return ;
                        case  19 :
                            eatText2(value);
                            state = 20;
                            return ;
                        case  21 :
                            revertToParentFromText(value);
                            return ;
                        case  13 :
                            eatText3(value);
                            state = 14;
                            return ;
                        case  16 :
                            eatText4(value);
                            state = 17;
                            return ;
                        case  7 :
                            eatText5(value);
                            state = 8;
                            return ;
                        case  10 :
                            eatText6(value);
                            state = 11;
                            return ;
                        case  4 :
                            eatText7(value);
                            state = 5;
                            return ;
                    }
                } catch (java.lang.RuntimeException e) {
                    handleUnexpectedTextException(value, e);
                }
                break;
            }
        }

        private void eatText1(final java.lang.String value)
            throws org.xml.sax.SAXException
        {
            try {
                _APLICACION = value;
            } catch (java.lang.Exception e) {
                handleParseConversionException(e);
            }
        }

        private void eatText2(final java.lang.String value)
            throws org.xml.sax.SAXException
        {
            try {
                _RECEPTOR = com.sun.xml.bind.WhiteSpaceProcessor.collapse(value);
            } catch (java.lang.Exception e) {
                handleParseConversionException(e);
            }
        }

        private void eatText3(final java.lang.String value)
            throws org.xml.sax.SAXException
        {
            try {
                _OPERACION = value;
            } catch (java.lang.Exception e) {
                handleParseConversionException(e);
            }
        }

        private void eatText4(final java.lang.String value)
            throws org.xml.sax.SAXException
        {
            try {
                _EMISOR = value;
            } catch (java.lang.Exception e) {
                handleParseConversionException(e);
            }
        }

        private void eatText5(final java.lang.String value)
            throws org.xml.sax.SAXException
        {
            try {
                _FECHA = com.sun.xml.bind.WhiteSpaceProcessor.collapse(value);
            } catch (java.lang.Exception e) {
                handleParseConversionException(e);
            }
        }

        private void eatText6(final java.lang.String value)
            throws org.xml.sax.SAXException
        {
            try {
                _HORA = com.sun.xml.bind.WhiteSpaceProcessor.collapse(value);
            } catch (java.lang.Exception e) {
                handleParseConversionException(e);
            }
        }

        private void eatText7(final java.lang.String value)
            throws org.xml.sax.SAXException
        {
            try {
                _IDCOMUNICACION = javax.xml.bind.DatatypeConverter.parseLong(com.sun.xml.bind.WhiteSpaceProcessor.collapse(value));
                has_IDCOMUNICACION = true;
            } catch (java.lang.Exception e) {
                handleParseConversionException(e);
            }
        }

    }

}
