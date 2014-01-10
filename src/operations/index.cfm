<cfinclude template="../shared/header.cfm"/>

<cfinvoke  component="mochi.cfc.operations.OperationGateway" method="getAllAsQuery" returnvariable="operations">
</cfinvoke>

		

<cfif operations.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 
	<table border="1">
    	<tr>
        	<th>Operation</th>
            <th>Operation Code</th>
            <th>Description</th>
            <th>Document Required</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="operations">
        <tr>
          <td>#operations.Operation#</td>          
          <td>#operations.OperationCode#</td>          
          <td>#operations.Description#</td>          
          <td>#operations.RequireDocument#</td>          
          <td><a href="update.cfm?OperationID=#operations.OperationID#">Edit</a></td>

          <td><a href="delete.cfm?OperationID=#operations.OperationID#">Delete</a></td>
          <td><a href="show.cfm?OperationID=#operations.OperationID#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Operation</a>