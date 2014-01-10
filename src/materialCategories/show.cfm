<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.Materialcategoryid")>
	<cfinvoke component="mochi.cfc.MaterialCategories.MaterialCategoryGateway" method="getById" returnvariable="MaterialCategory"> 
		<cfinvokeargument name="id" value="#url.Materialcategoryid#"/>
	</cfinvoke>

	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Category :</th>
	    <td width="168">#MaterialCategory.getCategory()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#MaterialCategory.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#MaterialCategory.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#MaterialCategory.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#MaterialCategory.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>