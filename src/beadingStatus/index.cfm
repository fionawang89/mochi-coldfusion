<cfinclude template="../shared/header.cfm"/>


<cfinvoke  component="mochi.cfc.BeadingStatus.BeadingStatusGateway" method="getAllAsQuery"
 returnvariable="BeadingStatus">
</cfinvoke>

<cfif BeadingStatus.RecordCount IS 0>
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
        <cfoutput query="BeadingStatus">			
			
        <tr>
          <td>#BeadingStatus.Status#</td>          
          <td>#BeadingStatus.Description#</td>
          <td>#BeadingStatus.Type#</td>          
          <td><a href="update.cfm?BeadingStatusid=#BeadingStatus.BeadingStatusid#">Edit</a></td>

          <td><a href="delete.cfm?BeadingStatusid=#BeadingStatus.BeadingStatusid#">Delete</a></td>
          <td><a href="show.cfm?BeadingStatusid=#BeadingStatus.BeadingStatusid#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Code</a>