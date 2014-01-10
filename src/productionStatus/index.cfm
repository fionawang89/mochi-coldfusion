<cfinclude template="../shared/header.cfm"/>


<cfinvoke  component="mochi.cfc.productionStatus.ProductionStatusGateway" method="getAllAsQuery" returnvariable="productionStatus">
</cfinvoke>


<cfif productionStatus.RecordCount IS 0>
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
        <cfoutput query="productionstatus">			
			
        <tr>
          <td>#productionstatus.Status#</td>          
          <td>#productionstatus.Description#</td>          
          <td><a href="update.cfm?productionstatusid=#productionstatus.productionstatusID#">Edit</a></td>

          <td><a href="delete.cfm?productionstatusid=#productionstatus.productionstatusID#">Delete</a></td>
          <td><a href="show.cfm?productionstatusid=#productionstatus.productionstatusID#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Code</a>