<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.CopyrightApplicationStatusid")>
	<!--- Check if result code already exist in the system to avoid duplication --->
	<cfquery name="qCopyrightApplicationStatus" datasource="#application.datasource#">
		SELECT CopyrightApplicationStatusID
        FROM CopyrightApplicationStatus
        WHERE Status =  '#TRIM(form.status)#'
	</cfquery>
	
	<!--- If result code doesnt exists create one --->
	<cfif qCopyrightApplicationStatus.RECORDCOUNT IS 0>
    
    	<cfinvoke  component="mochi.cfc.CopyrightApplicationStatus.CopyrightApplicationStatus" method="init" returnvariable="CopyrightApplicationStatus">
        	<cfinvokeargument name="stValues" value="#form#"/>
		</cfinvoke>

		<cfinvoke  component="mochi.cfc.CopyrightApplicationStatus.CopyrightApplicationStatusGateway" method="save">
			<cfinvokeargument name="obj" value="#CopyrightApplicationStatus#"/>
		</cfinvoke>


	</cfif>
		
    <cflocation url="index.cfm">
	
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>  
    <th width="149" scope="row">Status :</th>
    <td width="168"><cfinput type="text" name="status" id="status"></td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create Status"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="CopyrightApplicationStatusid" name="CopyrightApplicationStatusid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>