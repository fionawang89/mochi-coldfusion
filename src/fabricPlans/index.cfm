<cfinclude template="../shared/header.cfm"/>

<cfinvoke  component="mochi.cfc.materialPlans.MaterialPlanGateway" method="getAllAsQuery" returnvariable="fabricPlans">
</cfinvoke>

		

<cfif fabricPlans.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 
	<table border="1">
    	<tr>
        	<th>Plan</th>
            <th>Delivery</th>
        	<th>Year</th>
            <th>Plan Date</th>
        	<th>Due Date</th>
            <th>Comments</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="fabricPlans">
        
        <cfinvoke  component="mochi.cfc.deliveries.DeliveryGateway" method="getById" returnvariable="Delivery">
			<cfinvokeargument name="id" value="#fabricPlans.DeliveryID#"/>
		</cfinvoke>

        <cfinvoke  component="mochi.cfc.years.YearGateway" method="getById" returnvariable="Year">
			<cfinvokeargument name="id" value="#fabricPlans.YearID#"/>
		</cfinvoke>

        
        <tr>
          <td>#fabricPlans.Plan#</td>          
          <td>#Delivery.getDelivery()#</td>          
          <td>#Year.getYear()#</td>          
          <td>#DateFormat(fabricPlans.PlanDate, 'mm/dd/yyyy')#</td>          
          <td>#DateFormat(fabricPlans.DueDate, 'mm/dd/yyyy')#</td>          
          <td>#fabricPlans.Comments#</td>          
          <td><a href="update.cfm?MaterialPlanID=#fabricPlans.MaterialPlanID#">Edit</a></td>
          <td><a href="delete.cfm?MaterialPlanID=#fabricPlans.MaterialPlanID#">Delete</a></td>
          <td><a href="show.cfm?MaterialPlanID=#fabricPlans.MaterialPlanID#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Fabric Plan</a>