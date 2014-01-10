<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.FabricRequestTypeid")>
	<!--- Check if result code already exist in the system to avoid duplication --->
	<cfquery name="qFabricRequestType" datasource="#application.datasource#">
		SELECT FabricRequestTypeID
        FROM FabricRequestTypes
        WHERE Type =  '#TRIM(form.Type)#'
	</cfquery>
	
	<!--- If result code doesnt exists create one --->
	<cfif qFabricRequestType.RECORDCOUNT IS 0>
    
    	<cfinvoke  component="mochi.cfc.FabricRequestTypes.FabricRequestType" method="init" returnvariable="FabricRequestType">
        	<cfinvokeargument name="stValues" value="#form#"/>
		</cfinvoke>

		<cfinvoke  component="mochi.cfc.FabricRequestTypes.FabricRequestTypeGateway" method="save">
			<cfinvokeargument name="obj" value="#FabricRequestType#"/>
		</cfinvoke>


	</cfif>
		
    <cflocation url="index.cfm">
	
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>  
    <th width="149" scope="row">Type :</th>
    <td width="168"><cfinput type="text" name="Type" id="Type"></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"></td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create Type"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="FabricRequestTypeid" name="FabricRequestTypeid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>