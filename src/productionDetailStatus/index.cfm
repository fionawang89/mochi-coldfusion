<cfinclude template="../shared/header.cfm"/>


<cfinvoke  component="mochi.cfc.productionDetailStatus.productionDetailStatusGateway" method="getAllAsQuery" returnvariable="productionDetailStatus">
</cfinvoke>


<cfif productionDetailStatus.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 


	<table border="1">
    	<tr>
        	<th>Status</th>
        	<th>Description</th>
        	<th>Operation</th>
        	<th>Type</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="productionDetailStatus">			
			
            <cfinvoke  component="mochi.cfc.operations.OperationGateway" method="getById" returnvariable="Operation">
                <cfinvokeargument name="id" value="#productionDetailStatus.OperationID#"/>
            </cfinvoke>

        <tr>
          <td>#productionDetailStatus.Status#</td>          
          <td>#productionDetailStatus.Description#</td>          
          <td>#Operation.getOperation()#</td>
          <td>#productionDetailStatus.Type#</td>          
          <td><a href="update.cfm?productionDetailStatusid=#productionDetailStatus.productionDetailStatusID#">Edit</a></td>

          <td><a href="delete.cfm?productionDetailStatusid=#productionDetailStatus.productionDetailStatusID#">Delete</a></td>
          <td><a href="show.cfm?productionDetailStatusid=#productionDetailStatus.productionDetailStatusID#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Code</a>