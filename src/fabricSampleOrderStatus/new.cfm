<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.FabricSampleOrderStatusid")>
	<!--- Check if result code already exist in the system to avoid duplication --->
	<cfquery name="qFabricSampleOrderStatus" datasource="#application.datasource#">
		SELECT FabricSampleOrderStatusID
        FROM FabricSampleOrderStatus
        WHERE Status =  '#TRIM(form.status)#'
	</cfquery>
	
	<!--- If result code doesnt exists create one --->
	<cfif qFabricSampleOrderStatus.RECORDCOUNT IS 0>
    
    	<cfinvoke  component="mochi.cfc.FabricSampleOrderStatus.FabricSampleOrderStatus" method="init" returnvariable="FabricSampleOrderStatus">
        	<cfinvokeargument name="stValues" value="#form#"/>
		</cfinvoke>

		<cfinvoke  component="mochi.cfc.FabricSampleOrderStatus.FabricSampleOrderStatusGateway" method="save">
			<cfinvokeargument name="obj" value="#FabricSampleOrderStatus#"/>
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
  
	<cfinput type="hidden" id="FabricSampleOrderStatusid" name="FabricSampleOrderStatusid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>