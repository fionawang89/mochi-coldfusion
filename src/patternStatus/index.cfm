<cfinclude template="../shared/header.cfm"/>


<cfinvoke  component="mochi.cfc.patternStatus.PatternStatusGateway" method="getAllAsQuery"
 returnvariable="patternStatus">
</cfinvoke>

<cfif patternStatus.RecordCount IS 0>
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
        <cfoutput query="patternStatus">			
			
        <tr>
          <td>#patternStatus.Status#</td>          
          <td>#patternStatus.Description#</td>
          <td>#patternStatus.Type#</td>          
          <td><a href="update.cfm?patternstatusid=#patternStatus.patternstatusid#">Edit</a></td>

          <td><a href="delete.cfm?patternstatusid=#patternStatus.patternstatusid#">Delete</a></td>
          <td><a href="show.cfm?patternstatusid=#patternStatus.patternstatusid#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Code</a>