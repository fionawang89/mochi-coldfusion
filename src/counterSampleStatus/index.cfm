<cfinclude template="../shared/header.cfm"/>


<cfinvoke  component="mochi.cfc.CounterSampleStatus.CounterSampleStatusGateway" method="getAllAsQuery"
 returnvariable="CounterSampleStatus">
</cfinvoke>

<cfif CounterSampleStatus.RecordCount IS 0>
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
        <cfoutput query="CounterSampleStatus">			
			
        <tr>
          <td>#CounterSampleStatus.Status#</td>          
          <td>#CounterSampleStatus.Description#</td>
          <td>#CounterSampleStatus.Type#</td>          
          <td><a href="update.cfm?CounterSampleStatusid=#CounterSampleStatus.CounterSampleStatusid#">Edit</a></td>

          <td><a href="delete.cfm?CounterSampleStatusid=#CounterSampleStatus.CounterSampleStatusid#">Delete</a></td>
          <td><a href="show.cfm?CounterSampleStatusid=#CounterSampleStatus.CounterSampleStatusid#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Code</a>