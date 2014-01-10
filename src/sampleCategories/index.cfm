<cfinclude template="../shared/header.cfm"/>

<cfinvoke component="mochi.cfc.sampleCategories.SampleCategoryGateway" method="getAllAsQuery" returnvariable="sampleCategories"/> 
		

<cfif sampleCategories.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 

	<table border="1">
    	<tr>
        	<th>Category</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="sampleCategories">			
			
        <tr>
          <td>#sampleCategories.Category#</td>          
          <td><a href="update.cfm?samplecategoryid=#samplecategories.SampleCategoryID#">Edit</a></td>

          <td><a href="delete.cfm?samplecategoryid=#samplecategories.SampleCategoryID#">Delete</a></td>
          <td><a href="show.cfm?samplecategoryid=#samplecategories.SampleCategoryID#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Category</a>