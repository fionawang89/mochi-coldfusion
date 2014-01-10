<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.resultcodeid")>
	<!--- Check if result code already exist in the system to avoid duplication --->
	<cfquery name="qResultCode" datasource="#application.datasource#">
		SELECT ResultCodeID 
		FROM ResultCodes
        WHERE Code =  '#form.code#'
	</cfquery>
	
	<!--- If result code doesnt exists create one --->
	<cfif qResultCode.RECORDCOUNT IS 0>
		<cfinvoke  component="mochi.cfc.resultCodes.ResultCode" method="init" returnvariable="resultCode">
        	<cfinvokeargument name="stValues" value="#form#"/>
		</cfinvoke>
		
        <cfinvoke  component="mochi.cfc.resultCodes.ResultCodeGateway" method="save">
			<cfinvokeargument name="obj" value="#resultCode#"/>
		</cfinvoke>

	</cfif>
		
    <cflocation url="index.cfm">
	
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>  
    <th width="149" scope="row">Code :</th>
    <td width="168"><cfinput type="text" name="code" id="code"></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"></td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create Code"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="resultcodeid" name="resultcodeid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>