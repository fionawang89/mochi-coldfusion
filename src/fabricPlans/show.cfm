<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.MaterialPlanid")>

	<cfinvoke  component="mochi.cfc.materialPlans.MaterialPlanGateway" method="getById" returnvariable="MaterialPlan">
		<cfinvokeargument name="id" value="#url.MaterialPlanid#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.deliveries.DeliveryGateway" method="getById" returnvariable="Delivery">
		<cfinvokeargument name="id" value="#MaterialPlan.getDeliveryID()#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.years.YearGateway" method="getById" returnvariable="Year">
		<cfinvokeargument name="id" value="#MaterialPlan.getYearID()#"/>
	</cfinvoke>

	
 <cfoutput>	
	    <p>Plan : <b>#MaterialPlan.getPlan()#</b></p>
        <p>Delivery : <b>#Delivery.getDelivery()#</b></p>
        <p>Year : <b>#Year.getYear()#</b></p>
		<p>Plan Date : <b>#DateFormat(MaterialPlan.getPlanDate(), 'mm/dd/yyyy')#</b></p>
        <p>Due Date : <b>#DateFormat(MaterialPlan.getDueDate(), 'mm/dd/yyyy')#</b></p>

 <table width="333" border="1" align="left">
 
	  <tr>
		<th>Fabric</th>
		<th>Color</th>
		<th>Request Date</th>
		<th>Due Date</th>
		<th>Status</th>
		<th>Sourcing</th>
		<th>Lab Dips</th>
        <th>Strikeoff</th>        
	  </tr>
  </cfoutput>
</table>

<br/>

</cfif>