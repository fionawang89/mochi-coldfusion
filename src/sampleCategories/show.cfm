<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.samplecategoryid")>
	<cfinvoke component="mochi.cfc.sampleCategories.SampleCategoryGateway" method="getById" returnvariable="sampleCategory"> 
		<cfinvokeargument name="id" value="#url.samplecategoryid#"/>
	</cfinvoke>

	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Category :</th>
	    <td width="168">#sampleCategory.getCategory()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#sampleCategory.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#sampleCategory.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#sampleCategory.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#sampleCategory.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>