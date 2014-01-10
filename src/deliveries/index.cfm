<cfinclude template="../shared/header.cfm"/>

<cfinvoke  component="mochi.cfc.deliveries.DeliveryGateway" method="getAllAsQuery" returnvariable="deliveries"/>


		

<cfif deliveries.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 

	<table border="1">
    	<tr>
        	<th>Delivery</th>
        	<th>Description</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="deliveries">			
			
        <tr>
          <td>#deliveries.Delivery#</td>          
          <td>#deliveries.Description#</td>          
          <td><a href="update.cfm?deliveryid=#deliveries.deliveryid#">Edit</a></td>

          <td><a href="delete.cfm?deliveryid=#deliveries.deliveryid#">Delete</a></td>
          <td><a href="show.cfm?deliveryid=#deliveries.deliveryid#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Delivery</a>