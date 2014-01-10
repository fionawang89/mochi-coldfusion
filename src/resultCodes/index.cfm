<cfinclude template="../shared/header.cfm"/>

<cfinvoke  component="mochi.cfc.resultCodes.ResultCodeGateway" method="getAllAsQuery" returnvariable="resultCodes" />


		

<cfif resultCodes.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 

	<table border="1">
    	<tr>
        	<th>Code</th>
        	<th>Description</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="resultCodes">			
			
        <tr>
          <td>#resultCodes.Code#</td>          
          <td>#resultCodes.Description#</td>          
          <td><a href="update.cfm?resultcodeid=#resultCodes.ResultCodeID#">Edit</a></td>

          <td><a href="delete.cfm?resultcodeid=#resultCodes.ResultCodeID#">Delete</a></td>
          <td><a href="show.cfm?resultcodeid=#resultCodes.ResultCodeID#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Code</a>