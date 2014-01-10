<cfinclude template="../shared/header.cfm"/>

<cfinvoke  component="mochi.cfc.fabricLabDipStatus.fabricLabDipStatusGateway" method="getAllAsQuery" returnvariable="fabricLabDipStatus"/>


		

<cfif fabricLabDipStatus.RecordCount IS 0>
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
        <cfoutput query="fabricLabDipStatus">			
			
        <tr>
          <td>#fabricLabDipStatus.Status#</td>          
          <td>#fabricLabDipStatus.Description#</td>          
          <td><a href="update.cfm?fabricLabDipStatusid=#fabricLabDipStatus.fabricLabDipStatusID#">Edit</a></td>

          <td><a href="delete.cfm?fabricLabDipStatusid=#fabricLabDipStatus.fabricLabDipStatusID#">Delete</a></td>
          <td><a href="show.cfm?fabricLabDipStatusid=#fabricLabDipStatus.fabricLabDipStatusID#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Code</a>