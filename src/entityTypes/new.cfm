<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.entitytypeid")>
	<!--- Check if result code already exist in the system to avoid duplication --->
	<cfquery name="qEntityType" datasource="#application.datasource#">
		SELECT entitytypeid
		FROM EntityTypes
        WHERE EntityType=  '#form.EntityType#'
	</cfquery>
	
	<!--- If result code doesnt exists create one --->
	<cfif qEntityType.RECORDCOUNT IS 0>
    	
        <cfinvoke  component="mochi.cfc.EntityTypes.EntityType" method="init" returnvariable="EntityType">
			<cfinvokeargument name="stValues" value="#form#"/>
		</cfinvoke>

		<cfinvoke  component="mochi.cfc.EntityTypes.EntityTypeGateway" method="save">
			<cfinvokeargument name="obj" value="#EntityType#"/>
		</cfinvoke>

	</cfif>
		
    <cflocation url="index.cfm">
	
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>  
    <th width="149" scope="row">Entity Type :</th>
    <td width="168"><cfinput type="text" name="EntityType" id="EntityType" required="yes" message="Entity Type is required" validateat="onsubmit"></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"></td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create Entity Type"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="entitytypeid" name="entitytypeid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>