<cfinclude template="../shared/header.cfm"/>

<cfinvoke component="mochi.cfc.contractors.ContractorGateway" method="getAllAsQuery" returnvariable="contractors"/> 
		

<cfif contractors.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 

	<table border="1">
    	<tr>
        	<th>Contractor</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="contractors">			
			
        <tr>
          <td>#contractors.Contractor#</td>          
          <td><a href="update.cfm?contractorid=#contractors.ContractorID#">Edit</a></td>

          <td><a href="delete.cfm?contractorid=#contractors.ContractorID#">Delete</a></td>
          <td><a href="show.cfm?contractorid=#contractors.ContractorID#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Contractor</a>