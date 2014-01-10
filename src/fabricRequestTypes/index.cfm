<cfinclude template="../shared/header.cfm"/>

<cfinvoke  component="mochi.cfc.FabricRequestTypes.FabricRequestTypeGateway" method="getAllAsQuery" returnvariable="FabricRequestType"/>


		

<cfif FabricRequestType.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 

	<table border="1">
    	<tr>
        	<th>Type</th>
        	<th>Description</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="FabricRequestType">			
			
        <tr>
          <td>#FabricRequestType.Type#</td>          
          <td>#FabricRequestType.Description#</td>          
          <td><a href="update.cfm?FabricRequestTypeid=#FabricRequestType.FabricRequestTypeID#">Edit</a></td>

          <td><a href="delete.cfm?FabricRequestTypeid=#FabricRequestType.FabricRequestTypeID#">Delete</a></td>
          <td><a href="show.cfm?FabricRequestTypeid=#FabricRequestType.FabricRequestTypeID#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Code</a>