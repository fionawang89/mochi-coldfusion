<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.category")>
	<!--- Check if pattern maker already exist in the system to avoid duplication --->
	<cfquery name="qMaterialCategory" datasource="#application.datasource#">
		SELECT MaterialCategoryID
		FROM MaterialCategories
		WHERE Category =  '#form.category#'
	</cfquery>
	
	<!--- If patternmaker doesnt exists create one --->
	<cfif qMaterialCategory.RECORDCOUNT IS 0>
		<cfset MaterialCategory=CreateObject("component", "mochi.cfc.MaterialCategories.MaterialCategory").init(form)>
		<cfinvoke component="mochi.cfc.MaterialCategories.MaterialCategoryGateway" method="save" > 
			<cfinvokeargument name="obj" value="#MaterialCategory#"/>
		</cfinvoke>
	</cfif>
		
    <cflocation url="index.cfm">
	
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Category :</th>
    <td width="168"><cfinput type="text" name="category" id="category">
    </td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create Category"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="Materialcategoryid" name="Materialcategoryid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>