<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/ispac-util.tld" prefix="ispac" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>

<div class="tabButtons">
	&nbsp;
</div>

<tiles:insert page="../tiles/pcdBCTile.jsp" ignore="true" flush="false"/>

<div class="tabContent">
	
<html:form action='/showProcedureEntity.do'>

	<table width="100%" cellspacing="1" cellpadding="0">
		<tr>
			<td class="blank">
				<table width="100%" border="0" cellspacing="2" cellpadding="2">
					<tr>
						<td width="100%">
							<div class="formtable">
								<!-- TABLA DE CAMPOS -->
								<table border="0" cellspacing="0" cellpadding="0" align="center" width="90%">
									<tr>
										<td>
											<table border="0" cellspacing="0" cellpadding="0" width="100%">
												<logic:notEqual name="defaultForm" property="key" value="-1">
													<tr>
														<td colspan="2"><img src='<ispac:rewrite href="img/pixel.gif"/>' border="0" height="8px"/></td>
													</tr>
													<tr>
														<td height="20" class="formsTitle" width="1%">
															<ispac:tooltipLabel labelKey="form.tpdoc.propertyLabel.id" tooltipKey="form.tpdoc.propertyLabel.id.tooltip"/>
														</td>
														<td height="20">
															&nbsp;&nbsp;<html:text property="property(ID)" styleClass="inputReadOnly" size="5" readonly="true" maxlength="10"/>
														</td>
													</tr>
												</logic:notEqual>
												<tr>
													<td colspan="2"><img src='<ispac:rewrite href="img/pixel.gif"/>' border="0" height="8px"/></td>
												</tr>
												<tr>
													<td height="20" class="formsTitle">
														<ispac:tooltipLabel labelKey="form.tpdoc.propertyLabel.name" tooltipKey="form.tpdoc.propertyLabel.name.tooltip"/>
													</td>
													<td height="20">
														&nbsp;&nbsp;<html:text property="property(NOMBRE)" styleClass="inputReadOnly" readonly="true" size="50" maxlength="100"/>&nbsp; <bean:message key="catalog.data.obligatory"/>
													</td>
												</tr>
												<tr>
													<td colspan="2"><img src='<ispac:rewrite href="img/pixel.gif"/>' border="0" height="8px"/></td>
												</tr>
												<tr>
													<td colspan="2" height="20" class="formsTitle">
														<hr size="2"/>
													</td>
												</tr>
												<tr>
													<td colspan="2"><img src='<ispac:rewrite href="img/pixel.gif"/>' border="0" height="8px"/></td>
												</tr>
												<tr>
													<td height="20" class="formsTitle">
														<ispac:tooltipLabel labelKey="form.tpdoc.propertyLabel.code" tooltipKey="form.tpdoc.propertyLabel.code.tooltip"/>
													</td>
													<td height="20">
														&nbsp;&nbsp;<html:text property="property(COD_TPDOC)" styleClass="inputReadOnly" size="10" readonly="true" maxlength="16"/>
													</td>
												</tr>
												<tr>
													<td colspan="2"><img src='<ispac:rewrite href="img/pixel.gif"/>' border="0" height="8px"/></td>
												</tr>
												<tr>
													<td height="20" class="formsTitle">
														<ispac:tooltipLabel labelKey="form.tpdoc.propertyLabel.type" tooltipKey="form.tpdoc.propertyLabel.type.tooltip"/>
													</td>
													<td height="20">
														&nbsp;&nbsp;<html:text property="property(TIPO)" styleClass="inputReadOnly" size="50" readonly="true" maxlength="64"/>
													</td>
												</tr>
												<tr>
													<td colspan="2"><img src='<ispac:rewrite href="img/pixel.gif"/>' border="0" height="8px"/></td>
												</tr>
												<tr>
													<td height="20" class="formsTitle">
														<ispac:tooltipLabel labelKey="form.tpdoc.propertyLabel.author" tooltipKey="form.tpdoc.propertyLabel.author.tooltip"/>
													</td>
													<td height="20">
														&nbsp;&nbsp;<html:text property="property(AUTOR)" styleClass="inputReadOnly" size="50" readonly="true" maxlength="64"/>
													</td>
												</tr>
												<tr>
													<td colspan="2"><img src='<ispac:rewrite href="img/pixel.gif"/>' border="0" height="8px"/></td>
												</tr>
												<tr>
													<td height="20" class="formsTitle">
														<ispac:tooltipLabel labelKey="form.tpdoc.propertyLabel.creationDate" tooltipKey="form.tpdoc.propertyLabel.creationDate.tooltip"/>
													</td>
													<td height="20">
														&nbsp;&nbsp;<html:text property="property(FECHA)" styleClass="inputReadOnly" size="12" readonly="true" maxlength="10"/>
													</td>
												</tr>
												<tr>
													<td colspan="2"><img src='<ispac:rewrite href="img/pixel.gif"/>' border="0" height="8px"/></td>
												</tr>
												<tr>
													<td height="20" class="formsTitle">
														<ispac:tooltipLabel labelKey="form.tpdoc.propertyLabel.regOut" tooltipKey="form.tpdoc.propertyLabel.regOut.tooltip"/>
													</td>
													<td height="20">
														&nbsp;&nbsp;<html:text property="property(TIPOREG)" styleClass="inputReadOnly" size="50" readonly="true" maxlength="64"/>
													</td>
												</tr>
												<tr>
													<td colspan="2"><img src='<ispac:rewrite href="img/pixel.gif"/>' border="0" height="8px"/></td>
												</tr>
												<tr>
													<td height="20" class="formsTitle">
														<ispac:tooltipLabel labelKey="form.tpdoc.propertyLabel.descrition" tooltipKey="form.tpdoc.propertyLabel.descrition.tooltip"/>
													</td>
													<td height="20">
														&nbsp;&nbsp;<html:textarea property="property(DESCRIPCION)" styleClass="inputReadOnly" readonly="true" cols="72" rows="2"
															styleId="texta" onkeypress="javascript:maxlength('texta', 1024)"/>
													</td>
												</tr>
												<tr>
													<td colspan="2"><img src='<ispac:rewrite href="img/pixel.gif"/>' border="0" height="8px"/></td>
												</tr>
												<tr>
													<td height="20" class="formsTitle">
														<ispac:tooltipLabel labelKey="form.tpdoc.propertyLabel.observations" tooltipKey="form.tpdoc.propertyLabel.observations.tooltip"/>
													</td>
													<td height="20">
														&nbsp;&nbsp;<html:textarea property="property(OBSERVACIONES)" styleClass="inputReadOnly" readonly="true" cols="72" rows="4"
															styleId="texta" onkeypress="javascript:maxlength('texta', 512)"/>
													</td>
												</tr>
												<tr>
													<td colspan="2"><img src='<ispac:rewrite href="img/pixel.gif"/>' border="0" height="8px"/></td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</html:form>
</div>