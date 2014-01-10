<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.MaterialType")>
	<!--- Check if sample type already exist in the system to avoid duplication --->    
	<cfquery name="qMaterialType" datasource="#application.datasource#">
		SELECT MaterialTypes.MaterialTypeID
		FROM MaterialTypes
		WHERE MaterialTypes.MaterialType = '#form.MaterialType#'
	</cfquery>
	
	<!--- If result code doesnt exists create one --->
	<cfif qMaterialType.RECORDCOUNT IS 0>
    	<cfinvoke  component="mochi.cfc.MaterialTypes.MaterialType" method="init" returnvariable="MaterialType">
        	<cfinvokeargument name="stValues" value="#form#"/>		
        </cfinvoke>

		<cfinvoke  component="mochi.cfc.MaterialTypes.MaterialTypeGateway" method="save">
			<cfinvokeargument name="obj" value="#MaterialType#"/>
		</cfinvoke>

	</cfif>
		
    <cflocation url="index.cfm">
	
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>  
    <th width="149" scope="row">Material Type :</th>
    <td width="168"><cfinput type="text" name="MaterialType" id="MaterialType" required="yes" message="Material Type is required"></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"></td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create Material Type"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="MaterialTypeid" name="MaterialTypeid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>