package es.ieci.test.client;

import javax.xml.bind.JAXBException;

import junit.framework.TestCase;

import org.apache.log4j.Logger;
import org.notariado.ancert.xml.plusvalias.liquidacion.ActoJuridicoType;
import org.notariado.ancert.xml.plusvalias.liquidacion.AdquirenteType;
import org.notariado.ancert.xml.plusvalias.liquidacion.CALCULOLIQUIDACION;
import org.notariado.ancert.xml.plusvalias.liquidacion.CabeceraType;
import org.notariado.ancert.xml.plusvalias.liquidacion.DireccionType;
import org.notariado.ancert.xml.plusvalias.liquidacion.NotarioType;
import org.notariado.ancert.xml.plusvalias.liquidacion.ObjectFactory;
import org.notariado.ancert.xml.plusvalias.liquidacion.ProtocoloType;
import org.notariado.ancert.xml.plusvalias.liquidacion.SujetoType;
import org.notariado.ancert.xml.plusvalias.liquidacion.TransmitenteType;
import org.notariado.ancert.xml.plusvalias.liquidacion.CALCULOLIQUIDACIONType.REQUESTType;
import org.notariado.ancert.xml.plusvalias.liquidacion.CALCULOLIQUIDACIONType.REQUESTType.ADQUIRENTESType;
import org.notariado.ancert.xml.plusvalias.liquidacion.CALCULOLIQUIDACIONType.REQUESTType.INMUEBLEType;
import org.notariado.ancert.xml.plusvalias.liquidacion.CALCULOLIQUIDACIONType.REQUESTType.TRANSMITENTESType;
import org.notariado.ancert.xml.plusvalias.liquidacion.CALCULOLIQUIDACIONType.REQUESTType.INMUEBLEType.DIRECCIONType;
import org.notariado.ancert.xml.plusvalias.liquidacion.SujetoType.DATOSPERSONALESType;
import org.notariado.ancert.xml.plusvalias.liquidacion.TransmitenteType.BONIFICACIONESType;
import org.notariado.ancert.xml.plusvalias.liquidacion.TransmitenteType.TRANSMISIONESANTERIORESType;
import org.notariado.ancert.xml.plusvalias.liquidacion.TransmitenteType.TRANSMISIONESANTERIORESType.TRANSMISIONType;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import es.ieci.plusvalias.service.ICalculoLiquidacion;

/**
 * @author angel_castro@ieci.es - 20/09/2010
 */
public class CalculoLiquidacionClient extends TestCase {

	public static final Logger logger = Logger
			.getLogger(CalculoLiquidacionClient.class);

	private ApplicationContext context;
	private ICalculoLiquidacion service;

	public void setUp() throws Exception {
		this.context = new FileSystemXmlApplicationContext(new String[] { "src/test/resources/clientContext.xml" });
		this.service = (ICalculoLiquidacion) context.getBean("calculoLiquidacionService");
	}

	public void testCalculoLiquidacion() throws Exception {

		if (logger.isDebugEnabled()){
			logger.debug("Realizando peticion de calculo al servicio");
		}
		
		REQUESTType request = createSampleRequest();
		
		service.calculoLiquidacion(request, "");
	}

	private REQUESTType createSampleRequest() throws JAXBException {
		ObjectFactory factory = new ObjectFactory();
		CabeceraType cabecera = factory.createCabeceraType();
		cabecera.setIDCOMUNICACION(1);
		cabecera.setAPLICACION("aplicacion");
		cabecera.setFECHA("21/10/2010");
		cabecera.setHORA("09:09");
		cabecera.setOPERACION("1");
		cabecera.setEMISOR("1");
		cabecera.setRECEPTOR("1");

		NotarioType notario = factory.createNotarioType();
		notario.setCODIGO("1223");
		notario.setNOMBRE("yo");
		notario.setAPELLIDO1("mismo");

		ProtocoloType protocolo = factory.createProtocoloType();
		protocolo.setNUMERO(123);
		protocolo.setFECHAAUTORIZACION("21/01/2010");

		ActoJuridicoType actoJuridico = factory.createActoJuridicoType();
		actoJuridico.setCODIGO("12");
		actoJuridico.setDESCRIPCION("descripcion");

		DATOSPERSONALESType datosPersonales = factory
				.createSujetoTypeDATOSPERSONALESType();
		datosPersonales.setTIPODOCUMENTO("1");
		datosPersonales.setNUMERODOCUMENTO("30969974Z");
		datosPersonales.setAPELLIDO1RAZONSOCIAL("castro");
		datosPersonales.setNOMBRE("Angel");

		DireccionType domicilio = factory.createDireccionType();
		domicilio.setVIA("montero");
		domicilio.setINEPROVINCIA("cordoba");
		domicilio.setINEMUNICIPIO("cordoba");
		domicilio.setTIPOVIA("calle");
		domicilio.setCODIGOPOSTAL("14001");

		SujetoType sujeto = factory.createSujetoType();
		sujeto.setIDENTIFICADOR(0);
		sujeto.setDATOSPERSONALES(datosPersonales);
		sujeto.setDOMICILIO(domicilio);

		TRANSMISIONType transmision = factory
				.createTransmitenteTypeTRANSMISIONESANTERIORESTypeTRANSMISIONType();
		transmision.setFECHA("01/01/2001");
		transmision.setPORCENTAJE("25");

		TRANSMISIONESANTERIORESType transmisionesAnteriores = factory
				.createTransmitenteTypeTRANSMISIONESANTERIORESType();
		transmisionesAnteriores.getTRANSMISION().add(transmision);

		BONIFICACIONESType bonificaciones = factory
				.createTransmitenteTypeBONIFICACIONESType();
		bonificaciones.setCONCEPTO("concepto");
		bonificaciones.setPORCENTAJE("10");

		TransmitenteType transmitiente = factory.createTransmitenteType();
		transmitiente.setDATOSBASICOS(sujeto);
		transmitiente.setPORCENTAJETRANSMITIDO("100");
		transmitiente.setCLASEDERECHO("1");
		transmitiente.setBONIFICACIONES(bonificaciones);
		transmitiente.setTRANSMISIONESANTERIORES(transmisionesAnteriores);

		TRANSMITENTESType transmitientes = factory
				.createCALCULOLIQUIDACIONTypeREQUESTTypeTRANSMITENTESType();
		transmitientes.getTRANSMITENTE().add(transmitiente);

		AdquirenteType adquiriente = factory.createAdquirenteType();
		adquiriente.setDATOSBASICOS(sujeto);
		adquiriente.setPORCENTAJEADQUIRIDO("50");
		adquiriente.setCLASEDERECHO("1");
		adquiriente.setEDADUSUFRUCTUARIO(28);

		ADQUIRENTESType adquirientes = factory
				.createCALCULOLIQUIDACIONTypeREQUESTTypeADQUIRENTESType();
		adquirientes.getADQUIRENTE().add(adquiriente);

		DIRECCIONType direccion = factory
				.createCALCULOLIQUIDACIONTypeREQUESTTypeINMUEBLETypeDIRECCIONType();
		direccion.setINEPROVINCIA("Cordoba");
		direccion.setINEMUNICIPIO("Cordoba");

		INMUEBLEType inmueble = factory
				.createCALCULOLIQUIDACIONTypeREQUESTTypeINMUEBLEType();
		inmueble.setREFERENCIACATASTRAL("4545701PD7044F0008");
		inmueble.setDIRECCION(direccion);

		REQUESTType request = factory.createCALCULOLIQUIDACIONTypeREQUESTType();
		request.setINMUEBLE(inmueble);
		request.setADQUIRENTES(adquirientes);
		request.setTRANSMITENTES(transmitientes);
		request.setACTOJURIDICO(actoJuridico);
		request.setPROTOCOLO(protocolo);
		request.setNOTARIOAUTORIZANTE(notario);
		request.setNOTARIOTITULAR(notario);
		request.setCABECERA(cabecera);

		CALCULOLIQUIDACION liquidacion = factory.createCALCULOLIQUIDACION();
		liquidacion.setREQUEST(request);
		return request;
	}

}
