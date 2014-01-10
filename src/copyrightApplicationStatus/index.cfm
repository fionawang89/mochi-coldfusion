<cfinclude template="../shared/header.cfm"/>

<cfinvoke  component="mochi.cfc.CopyrightApplicationStatus.CopyrightApplicationStatusGateway" method="getAllAsQuery" returnvariable="CopyrightApplicationStatus"/>


		

<cfif CopyrightApplicationStatus.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 

	<table border="1">
    	<tr>
        	<th>Status</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="CopyrightApplicationStatus">			
			
        <tr>
          <td>#CopyrightApplicationStatus.Status#</td>          
          <td><a href="update.cfm?CopyrightApplicationStatusID=#CopyrightApplicationStatus.CopyrightApplicationStatusID#">Edit</a></td>

          <td><a href="delete.cfm?CopyrightApplicationStatusID=#CopyrightApplicationStatus.CopyrightApplicationStatusID#">Delete</a></td>
          <td><a href="show.cfm?CopyrightApplicationStatusID=#CopyrightApplicationStatus.CopyrightApplicationStatusID#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Code</a>