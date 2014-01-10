<cfinclude template="../shared/header.cfm">

<cfif IsDefined("url.Materialid")>

    <cfinvoke  component="mochi.cfc.materials.MaterialGateway" method="getById" returnvariable="Material">
        <cfinvokeargument name="id" value="#url.Materialid#"/>
    </cfinvoke>
    
    <cfinvoke  component="mochi.cfc.materialTypes.MaterialTypeGateway" method="getById" returnvariable="MaterialType">
		<cfinvokeargument name="id" value="#Material.getMaterialTypeID()#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.MaterialCategories.MaterialCategoryGateway" method="getById" returnvariable="MaterialCategory">
		<cfinvokeargument name="id" value="#Material.getMaterialCategoryID()#"/>
	</cfinvoke>


    
     <table width="333" border="1" align="left">
      <cfoutput>	
          <tr>  
            <th width="149" scope="row">Material Code :</th>
            <td width="168"><cfoutput>#Material.getMaterialCode()#</cfoutput></td>
          </tr>
          <tr>
            <th scope="row">Description :</th>
            <td>#Material.getDescription()#</td>
          </tr>
          <tr>
            <th scope="row">Material Type :</th>
            <td>#MaterialType.getMaterialType()#</td>
          </tr>
          <tr>
            <th scope="row">Material Category :</th>
            <td>#MaterialCategory.getCategory()#</td>
          </tr>
          <tr>
            <th scope="row">Width :</th>
            <td>#Material.getWidth()#</td>
          </tr>
          <tr>
            <th scope="row">Content :</th>
            <td>#Material.getContent()#</td>
          </tr>
          <tr>
            <th scope="row">Created By :</th>
            <td>#Material.getCreatedBy()#</td>
          </tr>
          <tr>
            <th scope="row">Created Date :</th>
            <td>#Material.getCreatedDate()#</td>
          </tr>
          <tr>
            <th scope="row">Last Maintained By :</th>
            <td>#Material.getLastMaintainedBy()#</td>
          </tr>
          <tr>
            <th scope="row">Last Maintained Date :</th>
            <td>#Material.getLastMaintainedDate()#</td>
           </tr>
        </cfoutput>
        <tr>
            <td colspan="2" align="center"><a href="new.cfm">Create New Material</a></td>
        </tr>
    </table>
</cfif>