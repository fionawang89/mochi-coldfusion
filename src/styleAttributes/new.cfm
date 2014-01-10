<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.attributename")>
	<!--- Check if pattern maker already exist in the system to avoid duplication --->
	<cfquery name="qStyleAttribute" datasource="#application.datasource#">
		SELECT StyleAttributeID
		FROM StyleAttributes
		WHERE AttributeName =  '#form.attributename#'
	</cfquery>
	
	<!--- If StyleAttribute doesnt exists create one --->
	<cfif qStyleAttribute.RECORDCOUNT IS 0>
		<cfset StyleAttribute=CreateObject("component", "mochi.cfc.StyleAttributes.StyleAttribute").init(form)>
		<cfinvoke component="mochi.cfc.StyleAttributes.StyleAttributeGateway" method="save" > 
			<cfinvokeargument name="obj" value="#StyleAttribute#"/>
		</cfinvoke>
	</cfif>
		
    <cflocation url="index.cfm">
	
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Attribute Name :</th>
    <td width="168"><cfinput type="text" name="attributename" id="attributename">
    </td>
  </tr>
  <tr>
    <th scope="row">Description :</th>
    <td><cfinput type="text" name="description" id="description"></td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create StyleAttribute"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="StyleAttributeid" name="StyleAttributeid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>