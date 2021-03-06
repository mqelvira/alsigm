/**
 * AntivirusWebServiceServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.3 Oct 05, 2005 (05:23:37 EDT) WSDL2Java emitter.
 */

package ieci.tecdoc.sgm.antivirus.ws.client;

public class AntivirusWebServiceServiceLocator extends org.apache.axis.client.Service implements ieci.tecdoc.sgm.antivirus.ws.client.AntivirusWebServiceService {

    public AntivirusWebServiceServiceLocator() {
    }


    public AntivirusWebServiceServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public AntivirusWebServiceServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for AntivirusWebService
    private java.lang.String AntivirusWebService_address = "http://localhost:8080/SIGEM_AntivirusWS/services/AntivirusWebService";

    public java.lang.String getAntivirusWebServiceAddress() {
        return AntivirusWebService_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String AntivirusWebServiceWSDDServiceName = "AntivirusWebService";

    public java.lang.String getAntivirusWebServiceWSDDServiceName() {
        return AntivirusWebServiceWSDDServiceName;
    }

    public void setAntivirusWebServiceWSDDServiceName(java.lang.String name) {
        AntivirusWebServiceWSDDServiceName = name;
    }

    public ieci.tecdoc.sgm.antivirus.ws.client.AntivirusWebService getAntivirusWebService() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(AntivirusWebService_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getAntivirusWebService(endpoint);
    }

    public ieci.tecdoc.sgm.antivirus.ws.client.AntivirusWebService getAntivirusWebService(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            ieci.tecdoc.sgm.antivirus.ws.client.AntivirusWebServiceSoapBindingStub _stub = new ieci.tecdoc.sgm.antivirus.ws.client.AntivirusWebServiceSoapBindingStub(portAddress, this);
            _stub.setPortName(getAntivirusWebServiceWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setAntivirusWebServiceEndpointAddress(java.lang.String address) {
        AntivirusWebService_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (ieci.tecdoc.sgm.antivirus.ws.client.AntivirusWebService.class.isAssignableFrom(serviceEndpointInterface)) {
                ieci.tecdoc.sgm.antivirus.ws.client.AntivirusWebServiceSoapBindingStub _stub = new ieci.tecdoc.sgm.antivirus.ws.client.AntivirusWebServiceSoapBindingStub(new java.net.URL(AntivirusWebService_address), this);
                _stub.setPortName(getAntivirusWebServiceWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("AntivirusWebService".equals(inputPortName)) {
            return getAntivirusWebService();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://server.ws.antivirus.sgm.tecdoc.ieci", "AntivirusWebServiceService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://server.ws.antivirus.sgm.tecdoc.ieci", "AntivirusWebService"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("AntivirusWebService".equals(portName)) {
            setAntivirusWebServiceEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
