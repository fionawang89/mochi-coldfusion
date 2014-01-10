<cfinclude template="../shared/header.cfm"/>


<cfquery datasource="#APPLICATION.DATASOURCE#" name="operationsProcesses">
	SELECT *
    FROM OperationsProcesses
    ORDER BY ProcessID, Sequence 
</cfquery>

<cfif operationsProcesses.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 
	


	<table border="1">
    	<tr>
        	<th>Operation Process ID</th>
        	<th>Process</th>
            <th>Sequence</th>
            <th>Operation ID</th>
            <th>Operation</th>
            <th>Dependecy</th>
            <th>Person In-Charge</th>
            <th>Days Percent to Finish</th>            
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="operationsProcesses">
        
            <cfinvoke  component="mochi.cfc.processes.ProcessGateway" method="getById" returnvariable="Process">
                <cfinvokeargument name="id" value="#operationsProcesses.ProcessID#"/>
            </cfinvoke>
        
        
            <cfinvoke  component="mochi.cfc.operations.OperationGateway" method="getById" returnvariable="Operation">
                <cfinvokeargument name="id" value="#operationsProcesses.OperationID#"/>
            </cfinvoke>
        
            
            <cfinvoke  component="mochi.cfc.operations.OperationGateway" method="getById" returnvariable="OperationDependency">
                <cfinvokeargument name="id" value="#operationsProcesses.Dependency#"/>
            </cfinvoke>
        
        <tr>
          <td>#operationsProcesses.OperationProcessID#</td>
          <td>#Process.getProcess()#</td>          
          <td>#operationsProcesses.Sequence#</td>          
          <td>#Operation.getOperationID()#</td>          
          <td>#Operation.getOperation()#</td>          
          <td>#OperationDependency.getOperation()#</td>          
          <th>#operationsProcesses.PersonInCharge#</th>
          <th>#operationsProcesses.PercentDaysToFinish#</th>
          <td><a href="update.cfm?OperationProcessID=#operationsProcesses.OperationProcessID#">Edit</a></td>
          <td><a href="delete.cfm?OperationProcessID=#operationsProcesses.OperationProcessID#">Delete</a></td>
          <td><a href="show.cfm?OperationProcessID=#operationsProcesses.OperationProcessID#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Process</a>