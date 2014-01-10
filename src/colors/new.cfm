<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.colorid")>
	<!--- Check if result code already exist in the system to avoid duplication --->
	<cfquery name="qColor" datasource="#application.datasource#">
		SELECT ColorID
		FROM Colors
        WHERE ColorCode =  '#form.colorcode#'
	</cfquery>
	
	<!--- If result code doesnt exists create one --->
	<cfif qColor.RECORDCOUNT IS 0>
    	
        <cfinvoke  component="mochi.cfc.colors.Color" method="init" returnvariable="color">
			<cfinvokeargument name="stValues" value="#form#"/>
		</cfinvoke>

		<cfinvoke  component="mochi.cfc.colors.ColorGateway" method="save">
			<cfinvokeargument name="obj" value="#color#"/>
		</cfinvoke>

	</cfif>
		
    <cflocation url="index.cfm">
	
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>  
    <th width="149" scope="row">Color Code :</th>
    <td width="168"><cfinput type="text" name="colorcode" id="colorcode"></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Color Name :</th>
    <td width="168"><cfinput type="text" name="colorname" id="colorname"></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"></td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create Code"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="colorid" name="colorid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>