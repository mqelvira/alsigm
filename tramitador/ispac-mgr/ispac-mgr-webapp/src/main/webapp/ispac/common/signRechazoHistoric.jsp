<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display" %>
<%@ taglib uri="/WEB-INF/ispac-util.tld" prefix="ispac" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>

<script type="text/javascript">
<!--
	function validate(){
		document.forms[0].name = "IntervaloFechas";
		return validateIntervaloFechas(document.forms[0]);
	}
//-->
</script>
<ispac:rewrite id="imgcalendar" href="img/calendar/"/>
<ispac:rewrite id="jscalendar" href="../scripts/calendar.js"/>
<ispac:rewrite id="buttoncalendar" href="img/calendar/calendarM.gif"/>

<ispac:calendar-config imgDir='<%= imgcalendar %>' scriptFile='<%= jscalendar %>'/>

<html:errors/>
<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center">
	<tr>
		<td>
			<br>
			<table cellpadding="0" cellspacing="1" border="0" width="100%" class="box">
				<tr>
					<td class="title" height="18px">
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td><img src='<ispac:rewrite href="img/pixel.gif"/>' height="18px"/></td>
								<td width="100%" class="menuhead">
									<bean:message key="es.dipucr.forms.rechazo.historico"/>
								</td>
								<td><img src='<ispac:rewrite href="img/pixel.gif"/>' height="18px"/></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="blank">
						<table width="100%" border="0" cellspacing="2" cellpadding="2">
							<tr><td colspan="3"><img src='<ispac:rewrite href="img/pixel.gif"/>' border="0" height="6px"/></td></tr>
							<tr>
								<td><img height="1" width="8px" src='<ispac:rewrite href="img/pixel.gif"/>'/></td>
								<td class="formsTitleB">
								
									<html:form action="showSignRechazoHistoric.do" onsubmit="javascript:return validate();">
									
										<html:hidden property="method" value="historics"/>
										<html:javascript formName="IntervaloFechas"/>
										<!-- Nombre de Aplicaci�n.
											 Necesario para realizar la validaci�n -->
										<html:hidden property="entityAppName"/>
										
										<bean:message key="es.dipucr.forms.rechazo.intervalo"/>&nbsp;&nbsp;&nbsp;
										<html:text property="property(FECHAINICIO)" styleClass="input" size="14"/>
										<ispac:calendar image='<%= buttoncalendar %>' formId="defaultForm" componentId="property(FECHAINICIO)" format="dd/mm/yyyy" enablePast="true"/>
										&nbsp;&nbsp;&nbsp;<bean:message key="forms.terms.and"/>&nbsp;&nbsp;
										<html:text property="property(FECHAFIN)" styleClass="input" size="14"/>
										<ispac:calendar image='<%= buttoncalendar %>' formId="defaultForm" componentId="property(FECHAFIN)" format="dd/mm/yyyy" enablePast="true"/>&nbsp;&nbsp;&nbsp;
										<input type="submit" value='<bean:message key="common.message.consultar"/>' class="form_button_white"/>
										<br/><br/>
									
										<c:set var="_list" value="${appConstants.actions.BATCH_SIGN_LIST}"/>
										<jsp:useBean id="_list" type="java.lang.String"/>
										
										<logic:empty name='<%=_list%>'>
											<span class="emptybanner"><bean:message key="forms.sign.historic.noDocuments"/></span>
										</logic:empty>
										<logic:notEmpty name='<%=_list%>'>
									
										<!-- displayTag con formateador -->
										<bean:define name="Formatter" id="formatter" type="ieci.tdw.ispac.ispaclib.bean.BeanFormatter"/>
									
										<display:table name='<%=_list%>' 
													   id="object" 
													   requestURI=''
													   export='<%=formatter.getExport()%>'
													   class='<%=formatter.getStyleClass()%>'
													   sort='<%=formatter.getSort()%>'
													   pagesize='<%=formatter.getPageSize()%>'
													   defaultorder='<%=formatter.getDefaultOrder()%>'
													   defaultsort='<%=formatter.getDefaultSort()%>'>
														   		
											<logic:iterate name="Formatter" id="format" type="ieci.tdw.ispac.ispaclib.bean.BeanPropertyFmt">
											
												<logic:equal name="format" property="fieldType" value="LIST">
												
													<display:column titleKey='<%=format.getTitleKey()%>' 
																	media='<%=format.getMedia()%>' 
																	headerClass='<%=format.getHeaderClass()%>'
																	sortable='<%=format.getSortable()%>'
																	sortProperty='<%=format.getPropertyName()%>'
																	decorator='<%=format.getDecorator()%>'
																	comparator='<%=format.getComparator()%>'
																	class='<%=format.getColumnClass()%>'>
																	
														<%=format.formatProperty(object)%>
			
													</display:column>
													
												</logic:equal>
												
												<logic:equal name="format" property="fieldType" value="LINK">
												
												  	<display:column titleKey='<%=format.getTitleKey()%>' 
													  				media='<%=format.getMedia()%>'
													  				headerClass='<%=format.getHeaderClass()%>'
													  				sortable='<%=format.getSortable()%>'
													  				sortProperty='<%=format.getPropertyName()%>'
												 					decorator='<%=format.getDecorator()%>'
												 					comparator='<%=format.getComparator()%>'
												  					class='<%=format.getColumnClass()%>'>
			
												  		<html:link action='<%=format.getUrl()%>' styleClass='<%=format.getStyleClass()%>' paramId='<%=format.getId()%>' 
												  			paramName="object" paramProperty='<%=format.getPropertyLink() %>' target="_blank">
												  			
												  			<%=format.formatProperty(object)%>
												  			<%--
												  			<bean:message key='<%= format.getPropertyValueKey() %>'/>
												  			--%>
													  			
												  		</html:link>
												  		
												  	</display:column>
												  	
												</logic:equal>
												
											</logic:iterate>
											
										</display:table>
										<!-- displayTag -->
										
									</logic:notEmpty>
									
									</html:form>

								</td>
								<td width="8"><img height="1" width="8px" src='<ispac:rewrite href="img/pixel.gif"/>'/></td>
							</tr>
							<tr><td colspan="3"><img src='<ispac:rewrite href="img/pixel.gif"/>' border="0" height="6px"/></td></tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>