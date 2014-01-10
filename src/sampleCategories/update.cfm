<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.samplecategoryid")>
	<cfset sampleCategory=CreateObject("component", "mochi.cfc.sampleCategories.SampleCategory").init(form)>
	<cfinvoke component="mochi.cfc.sampleCategories.SampleCategoryGateway" method="save" > 
		<cfinvokeargument name="obj" value="#sampleCategory#"/>
	</cfinvoke>
    <cflocation url="index.cfm">
<cfelseif IsDefined("url.samplecategoryid")>
	<cfinvoke component="mochi.cfc.sampleCategories.SampleCategoryGateway" method="getById" returnvariable="sampleCategory"> 
		<cfinvokeargument name="id" value="#url.samplecategoryid#"/>
	</cfinvoke>
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Category :</th>
    <td width="168"><cfinput type="text" name="category" id="category"
            		 value="#sampleCategory.getCategory()#">
    </td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Category"></td>
  </tr>
</table>
	<cfinput type="hidden" name="samplecategoryid" value="#sampleCategory.getSampleCategoryID()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#sampleCategory.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>