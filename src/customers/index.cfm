<cfinclude template="../shared/header.cfm"/>

<cfinvoke  component="mochi.cfc.customers.CustomerGateway" method="getAllAsQuery" returnvariable="customers">
</cfinvoke>
		

<cfif customers.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 

	<table border="1">
    	<tr>
        	<th>Customer</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="customers">			
			
        <tr>
          <td>#customers.Customer#</td>          
          <td><a href="update.cfm?CustomerID=#customers.CustomerID#">Edit</a></td>
          <td><a href="delete.cfm?CustomerID=#customers.CustomerID#">Delete</a></td>
          <td><a href="show.cfm?CustomerID=#customers.CustomerID#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Customer</a>