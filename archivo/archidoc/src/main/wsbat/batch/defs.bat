REM Definir classpath

SET BASEDIR=..\..\..\..
SET CLASSES_DIR=%BASEDIR%\target\classes
SET LIB_DIR=%BASEDIR%\target\Archivo\WEB-INF\lib
SET CP=.;%CLASSES_DIR%

REM Definir valores del servidor

SET PORT=8080
SET HOSTNAME=localhost
SET APPLICATION=archidoc

REM Definir valores para generar el wsdl

SET WSDL_DIR=%BASEDIR%\src\main\webapp\docs\wsdl
SET WSDL=%WSDL_DIR%\WSProcesosBatch.wsdl
SET LOCATION=http://%HOSTNAME%:%PORT%/%APPLICATION%/services/WSProcesosBatch
SET NAMESPACE=http://batch.ws
SET INTERFACE=ws.batch.WSProcesosBatch
SET CLASS=ws.batch.WSProcesosBatchImpl
SET STYLE=WRAPPED
REM SET METHODS=*

Rem Definir valores para generar el deploy.wsdd y undeploy.wsdd

SET DEPLOY_SCOPE=request
SET DELETE_JAVA_DIR=%WSDL_DIR%\ws\batch
SET DELETE_JAVA_DIR2=
SET DELETE_JAVA_DIR3=

REM Definir valores para generar el server-config.wsdd

SET URL_ADMIN=http://%HOSTNAME%:%PORT%/%APPLICATION%/services/AdminService
SET DEPLOY_FILE=%WSDL_DIR%\ws\batch\deploy.wsdd

REM Definir valores para generar el cliente
SET CLIENT_DIR=C:\desarrollo\java\proyectos.maven.sigem\archivoTrunk\archivo_ws_clients\src-proxy

REM A�adir las librer�as de axis
for %%i in (%LIB_DIR%\axis*.jar) do call ..\comun\cpappend.bat %%i
for %%i in (%LIB_DIR%\jaxrpc*.jar) do call ..\comun\cpappend.bat %%i
for %%i in (%LIB_DIR%\saaj*.jar) do call ..\comun\cpappend.bat %%i
for %%i in (%LIB_DIR%\wsdl*.jar) do call ..\comun\cpappend.bat %%i
for %%i in (%LIB_DIR%\mail*.jar) do call ..\comun\cpappend.bat %%i
for %%i in (%LIB_DIR%\commons-logging*.jar) do call ..\comun\cpappend.bat %%i
for %%i in (%LIB_DIR%\commons-discovery*.jar) do call ..\comun\cpappend.bat %%i
for %%i in (%LIB_DIR%\activation*.jar) do call ..\comun\cpappend.bat %%i
for %%i in (%LIB_DIR%\archigest*.jar) do call ..\comun\cpappend.bat %%i
for %%i in (%LIB_DIR%\log4j*.jar) do call ..\comun\cpappend.bat %%i