<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.requeststatusid")>
	<!--- Check if result code already exist in the system to avoid duplication --->
	<cfquery name="qRequestStatus" datasource="#application.datasource#">
		SELECT RequestStatusID
        FROM RequestStatus
        WHERE Status =  '#TRIM(form.status)#'
	</cfquery>
	
	<!--- If result code doesnt exists create one --->
	<cfif qRequestStatus.RECORDCOUNT IS 0>
    
    	<cfinvoke  component="mochi.cfc.requestStatus.RequestStatus" method="init" returnvariable="requestStatus">
        	<cfinvokeargument name="stValues" value="#form#"/>
		</cfinvoke>

		<cfinvoke  component="mochi.cfc.requestStatus.RequestStatusGateway" method="save">
			<cfinvokeargument name="obj" value="#requestStatus#"/>
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
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"></td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create Status"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="requeststatusid" name="requeststatusid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>