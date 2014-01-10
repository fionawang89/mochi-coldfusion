<cfinclude template="../shared/header.cfm"/>

<cfinvoke  component="mochi.cfc.processes.ProcessGateway" method="getAllAsQuery" returnvariable="processes">
</cfinvoke>

		

<cfif processes.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 
	<table border="1">
    	<tr>
        	<th>Process</th>
            <th>Description</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="processes">
        <tr>
          <td>#processes.Process#</td>          
          <td>#processes.Description#</td>          
          <td><a href="update.cfm?ProcessID=#processes.ProcessID#">Edit</a></td>
          <td><a href="delete.cfm?ProcessID=#processes.ProcessID#">Delete</a></td>
          <td><a href="show.cfm?ProcessID=#processes.ProcessID#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Process</a>