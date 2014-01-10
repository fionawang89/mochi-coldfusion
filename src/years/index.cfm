<cfinclude template="../shared/header.cfm"/>

<cfinvoke  component="mochi.cfc.years.yearGateway" method="getAllAsQuery" returnvariable="years"/>


		

<cfif years.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 

	<table border="1">
    	<tr>
        	<th>Year</th>
        	<th>Description</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="years">			
			
        <tr>
          <td>#years.year#</td>          
          <td>#years.Description#</td>          
          <td><a href="update.cfm?yearid=#years.yearid#">Edit</a></td>

          <td><a href="delete.cfm?yearid=#years.yearid#">Delete</a></td>
          <td><a href="show.cfm?yearid=#years.yearid#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New year</a>