<cfinclude template="../shared/header.cfm"/>

<cfinvoke  component="mochi.cfc.patternPriorities.PatternPriorityGateway" method="getAllAsQuery" returnvariable="patternPriorities">
</cfinvoke>


<cfif patternPriorities.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 

	<table border="1">
    	<tr>
        	<th>Priority Code</th>
        	<th>Description</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="patternPriorities">			
			
        <tr>
          <td>#patternPriorities.PriorityCode#</td>          
          <td>#patternPriorities.Description#</td>          
          <td><a href="update.cfm?patternPriorityid=#patternPriorities.patternPriorityid#">Edit</a></td>

          <td><a href="delete.cfm?patternPriorityid=#patternPriorities.patternPriorityid#">Delete</a></td>
          <td><a href="show.cfm?patternPriorityid=#patternPriorities.patternPriorityid#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Code</a>