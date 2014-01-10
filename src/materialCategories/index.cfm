<cfinclude template="../shared/header.cfm"/>

<cfinvoke component="mochi.cfc.MaterialCategories.MaterialCategoryGateway" method="getAllAsQuery" returnvariable="MaterialCategories"/> 
		

<cfif MaterialCategories.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 

	<table border="1">
    	<tr>
        	<th>Category</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="MaterialCategories">			
			
        <tr>
          <td>#MaterialCategories.Category#</td>          
          <td><a href="update.cfm?Materialcategoryid=#Materialcategories.MaterialCategoryID#">Edit</a></td>

          <td><a href="delete.cfm?Materialcategoryid=#Materialcategories.MaterialCategoryID#">Delete</a></td>
          <td><a href="show.cfm?Materialcategoryid=#Materialcategories.MaterialCategoryID#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Category</a>