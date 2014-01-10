<cfinclude template="../shared/header.cfm">

<cfif IsDefined("form.Materialid")>


	<!--- save Material in the database --->
	<cfinvoke  component="mochi.cfc.Materials.Material" method="init" returnvariable="Material">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>
                        
	<cfinvoke component="mochi.cfc.Materials.MaterialGateway" method="save" returnvariable="savedMaterial"> 
		<cfinvokeargument name="obj" value="#Material#"/>
	</cfinvoke>
                        
	<cflocation url="show.cfm?Materialid=#form.Materialid#">

    
<cfelseif IsDefined("url.Materialid")>

	<cfinvoke component="mochi.cfc.Materials.MaterialGateway" method="getById" returnvariable="Material"> 
		<cfinvokeargument name="id" value="#url.Materialid#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.materialTypes.MaterialTypeGateway" method="getAllAsQuery" returnvariable="MaterialTypes">
	</cfinvoke>

    <cfinvoke  component="mochi.cfc.MaterialCategories.MaterialCategoryGateway" method="getAllAsQuery" returnvariable="materialCategories">
    </cfinvoke>

    <cfinvoke  component="mochi.cfc.MaterialClass.MaterialClassGateway" method="getAllAsQuery" returnvariable="materialClasses">
    </cfinvoke>

<table width="333" border="1" align="left">

<!--- Form for updating a Material --->
    <cfform method="post"> 
          <tr>
            <th width="149" scope="row">Material Code :</th>
            <td width="168">
                    <cfinput required="true" type="text" name="MaterialCode" id="MaterialCode" validateat="onSubmit"
                             message="Material Code is required" value="#Material.getMaterialCode()#">
            </td>
          </tr>
          <tr>
            <th scope="row">Description :</th>
            <td>
                    <cfinput type="text" name="description" id="description" value="#Material.getDescription()#">
            </td>
          </tr>
          <tr>
            <th scope="row">Material Type :</th>
            <td>
                    <cfselect query="MaterialTypes" name="MaterialTypeID" display="MaterialType" value="MaterialTypeID" required="yes" message="Material Type is required" queryPosition="below" selected="#Material.getMaterialTypeID()#">
                    </cfselect>
            </td>
          </tr>
          <tr>
            <th scope="row">Material Class :</th>
            <td>
                    <cfselect query="materialClasses" name="MaterialClassID" display="MaterialClass" value="MaterialClassID" required="yes" message="Material Class is required" queryPosition="below" selected="#Material.getMaterialClassID()#">
                    </cfselect>
            </td>
          </tr>
          <tr>
            <th scope="row">Material Category :</th>
            <td>
                    <cfselect query="materialCategories" name="MaterialCategoryID" display="Category" value="MaterialCategoryID" required="yes" message="Material Category is required" queryPosition="below" selected="#Material.getMaterialCategoryID()#">
                    	<option value="">SELECT A MATERIAL CATEGORY
                    </cfselect>
            </td>
          <tr>
            <th scope="row">Width :</th>
            <td>
                    <cfinput type="text" name="width" id="width" value="#Material.getWidth()#">
            </td>
          </tr>
          <tr>
            <th scope="row">Content :</th>
            <td>
                    <cfinput type="text" name="content" id="content" value="#Material.getContent()#">
            </td>
          </tr>
          <tr>
            <td colspan="2" align="right"><cfinput type="submit" name="submit" value="Update Material"></td>	
         </tr>
                                            
          
        <cfinput type="hidden" name="Materialid" value="#Material.getMaterialID()#">
    
        <!--- Timestamps --->
        <cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
        <cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
        <cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
        <cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    
            
    </cfform>
    
    
</table>

<cfelse>
	<cflocation url="index.cfm">    
</cfif>

	