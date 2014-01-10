<cfinclude template="../shared/header.cfm"/>

<cfinvoke  component="mochi.cfc.locations.LocationGateway" method="getAllAsQuery" returnvariable="locations">
</cfinvoke>


		

<cfif locations.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 

	<table border="1">
    	<tr>
        	<th>Location</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="locations">			
			
        <tr>
          <td>#locations.Location#</td>          
          <td><a href="update.cfm?LocationID=#locations.LocationID#">Edit</a></td>

          <td><a href="delete.cfm?LocationID=#locations.LocationID#">Delete</a></td>
          <td><a href="show.cfm?LocationID=#locations.LocationID#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Code</a>