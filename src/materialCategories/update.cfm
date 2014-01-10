<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.Materialcategoryid")>
	<cfset MaterialCategory=CreateObject("component", "mochi.cfc.MaterialCategories.MaterialCategory").init(form)>
	<cfinvoke component="mochi.cfc.MaterialCategories.MaterialCategoryGateway" method="save" > 
		<cfinvokeargument name="obj" value="#MaterialCategory#"/>
	</cfinvoke>
    <cflocation url="index.cfm">
<cfelseif IsDefined("url.Materialcategoryid")>
	<cfinvoke component="mochi.cfc.MaterialCategories.MaterialCategoryGateway" method="getById" returnvariable="MaterialCategory"> 
		<cfinvokeargument name="id" value="#url.Materialcategoryid#"/>
	</cfinvoke>
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Category :</th>
    <td width="168"><cfinput type="text" name="category" id="category"
            		 value="#MaterialCategory.getCategory()#">
    </td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Category"></td>
  </tr>
</table>
	<cfinput type="hidden" name="Materialcategoryid" value="#MaterialCategory.getMaterialCategoryID()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#MaterialCategory.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>