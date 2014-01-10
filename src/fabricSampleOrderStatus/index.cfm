<cfinclude template="../shared/header.cfm"/>

<cfinvoke  component="mochi.cfc.FabricSampleOrderStatus.FabricSampleOrderStatusGateway" method="getAllAsQuery" returnvariable="FabricSampleOrderStatus"/>


		

<cfif FabricSampleOrderStatus.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 

	<table border="1">
    	<tr>
        	<th>Status</th>
        	<th>Description</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="FabricSampleOrderStatus">			
			
        <tr>
          <td>#FabricSampleOrderStatus.Status#</td>          
          <td>#FabricSampleOrderStatus.Description#</td>          
          <td><a href="update.cfm?FabricSampleOrderStatusid=#FabricSampleOrderStatus.FabricSampleOrderStatusID#">Edit</a></td>

          <td><a href="delete.cfm?FabricSampleOrderStatusid=#FabricSampleOrderStatus.FabricSampleOrderStatusID#">Delete</a></td>
          <td><a href="show.cfm?FabricSampleOrderStatusid=#FabricSampleOrderStatus.FabricSampleOrderStatusID#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Code</a>