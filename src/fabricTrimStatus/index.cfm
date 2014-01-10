<cfinclude template="../shared/header.cfm"/>


<cfinvoke  component="mochi.cfc.FabricTrimStatus.FabricTrimStatusGateway" method="getAllAsQuery"
 returnvariable="FabricTrimStatus">
</cfinvoke>

<cfif FabricTrimStatus.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 

	<table border="1">
    	<tr>
        	<th>Status</th>
        	<th>Description</th>
        	<th>Type</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="FabricTrimStatus">			
			
        <tr>
          <td>#FabricTrimStatus.Status#</td>          
          <td>#FabricTrimStatus.Description#</td>
          <td>#FabricTrimStatus.Type#</td>          
          <td><a href="update.cfm?FabricTrimStatusid=#FabricTrimStatus.FabricTrimStatusid#">Edit</a></td>

          <td><a href="delete.cfm?FabricTrimStatusid=#FabricTrimStatus.FabricTrimStatusid#">Delete</a></td>
          <td><a href="show.cfm?FabricTrimStatusid=#FabricTrimStatus.FabricTrimStatusid#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Code</a>