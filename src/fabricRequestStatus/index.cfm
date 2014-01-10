<cfinclude template="../shared/header.cfm"/>

<cfinvoke  component="mochi.cfc.FabricRequestStatus.FabricRequestStatusGateway" method="getAllAsQuery" returnvariable="FabricRequestStatus"/>


		

<cfif FabricRequestStatus.RecordCount IS 0>
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
        <cfoutput query="FabricRequestStatus">			
			
        <tr>
          <td>#FabricRequestStatus.Status#</td>          
          <td>#FabricRequestStatus.Description#</td>          
          <td><a href="update.cfm?FabricRequestStatusID=#FabricRequestStatus.FabricRequestStatusID#">Edit</a></td>

          <td><a href="delete.cfm?FabricRequestStatusID=#FabricRequestStatus.FabricRequestStatusID#">Delete</a></td>
          <td><a href="show.cfm?FabricRequestStatusID=#FabricRequestStatus.FabricRequestStatusID#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Code</a>