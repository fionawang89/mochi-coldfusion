<cfinclude template="../shared/header.cfm"/>

<cfinvoke  component="mochi.cfc.requestStatus.RequestStatusGateway" method="getAllAsQuery" returnvariable="requestStatus"/>


		

<cfif requestStatus.RecordCount IS 0>
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
        <cfoutput query="requestStatus">			
			
        <tr>
          <td>#requestStatus.Status#</td>          
          <td>#requestStatus.Description#</td>          
          <td><a href="update.cfm?requeststatusid=#requestStatus.RequestStatusID#">Edit</a></td>

          <td><a href="delete.cfm?requeststatusid=#requestStatus.RequestStatusID#">Delete</a></td>
          <td><a href="show.cfm?requeststatusid=#requestStatus.RequestStatusID#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Code</a>