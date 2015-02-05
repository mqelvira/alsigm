<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/taglibs/displaydepositotags.tld" prefix="archivo"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

<script language="JavaScript1.2" type="text/JavaScript">
	function popupDescriptores(field)
	{
		popup("<c:url value="/action/descriptores"/>?method=show&field=" + field, "_blank");
	}
	function cleanDescriptores()
	{
		var form = document.forms['<c:out value="${actionMappingName}" />'];
		selectElem = form.elements["selectDescriptores"];
		for (var i = selectElem.options.length - 1; i >= 0; i--)
			if (selectElem.options[i].selected)
				selectElem.remove(i);
		concatIdsDescriptores();
	}
	function cleanAllDescriptores()
	{
		var form = document.forms['<c:out value="${actionMappingName}" />'];
		selectElem = form.elements["selectDescriptores"];
		if ((selectElem != null) && (selectElem != '') && (selectElem != 'undefined')) {
			while (selectElem.options.length > 0)
				selectElem.remove(0);
		}
		concatIdsDescriptores();
	}
	function concatIdsDescriptores()
	{
		var form = document.forms['<c:out value="${actionMappingName}" />'];
		var elem = form.descriptores;
		if (elem)
		{
			var value = "";
			selectElem = form.elements["selectDescriptores"];
			for (var i = 0; i < selectElem.options.length; i++)
			{
				if (i > 0)
					value += "#";
				value += selectElem.options[i].value + ":"
					+ selectElem.options[i].text;
			}
			elem.value = value;
		}
	}
</script>

<tr>
	<td class="<c:out value="${classTdTituloCampo}"/>" width="<c:out value="${sizeCampo}"/>"><bean:message key="archigest.archivo.busqueda.form.descriptores"/>:&nbsp;</td>
	<td class="<c:out value="${classTdCampo}"/>">
		<table cellpadding="0" cellspacing="0">
			<tr valign="top">
				<td width="500">

					<html:hidden property="descriptores" />

					<select id="selectDescriptores" multiple="true" style="width:100%;height:60px;">
		       	 		<c:forTokens var="descrComboValue" items="${busquedaForm.descriptores}" delims="#">
		       	 			<jsp:useBean id="descrComboValue" type="java.lang.String"/>
		       	 			<option value="<%=descrComboValue.substring(0, descrComboValue.indexOf(":"))%>">
		       	 				<%=descrComboValue.substring(descrComboValue.indexOf(":")+1)%>
	       	 				</option>
		       	 		</c:forTokens>

					</select>
					<script>
						function addOption(label, value)
						{
							selectElem = document.getElementById("selectDescriptores");
							selectElem.options[selectElem.options.length] = new Option(label, value);
							concatIdsDescriptores();
						}
					</script>
				</td>
				<td width="10"></td>
				<td><a href="javascript:popupDescriptores('descriptores');"
				    ><html:img page="/pages/images/buscar.gif"
					        altKey="archigest.archivo.buscar"
					        titleKey="archigest.archivo.buscar"
					        styleClass="imgTextMiddle"/></a>
					<a href="javascript:cleanDescriptores();"
					><html:img page="/pages/images/clear0.gif"
					        altKey="archigest.archivo.limpiar"
					        titleKey="archigest.archivo.limpiar"
					        styleClass="imgTextMiddle"/></a>
					<a href="javascript:cleanAllDescriptores();"
					><html:img page="/pages/images/clear_all.gif"
					        altKey="archigest.archivo.limpiarTodos"
					        titleKey="archigest.archivo.limpiarTodos"
					        styleClass="imgTextMiddle"/></a>
				</td>
			</tr>
		</table>
	</td>
</tr>
