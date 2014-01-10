<cfinclude template="../shared/header.cfm"/>

<cfinvoke  component="mochi.cfc.MaterialTypes.MaterialTypeGateway" method="getAllAsQuery"
 returnvariable="MaterialTypes">
</cfinvoke>


		

<cfif MaterialTypes.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 

	<table border="1">
    	<tr>
        	<th>Material Type</th>
        	<th>Description</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="MaterialTypes">			
			
        <tr>
          <td>#MaterialTypes.MaterialType#</td>          
          <td>#MaterialTypes.Description#</td>          
          <td><a href="update.cfm?MaterialTypeID=#MaterialTypes.MaterialTypeID#">Edit</a></td>

          <td><a href="delete.cfm?MaterialTypeID=#MaterialTypes.MaterialTypeID#">Delete</a></td>
          <td><a href="show.cfm?MaterialTypeID=#MaterialTypes.MaterialTypeID#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Material Type</a>