<cfinclude template="../shared/header.cfm"/>


<cfinvoke  component="mochi.cfc.entityTypes.EntityTypeGateway" method="getAllAsQuery" returnvariable="entityTypes"/>

		

<cfif entityTypes.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 
	<table border="1">
    	<tr>
        	<th>Entityp Type ID</th>
            <th>Entityp Type</th>
            <th>Description</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="entityTypes">
        <tr>
          <td>#entityTypes.EntityTypeID#</td>          
          <td>#entityTypes.EntityType#</td>          
          <td>#entityTypes.Description#</td>          
          <td><a href="update.cfm?EntityTypeID=#entityTypes.EntityTypeID#">Edit</a></td>

          <td><a href="delete.cfm?EntityTypeID=#entityTypes.EntityTypeID#">Delete</a></td>
          <td><a href="show.cfm?EntityTypeID=#entityTypes.EntityTypeID#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Entity Type</a>