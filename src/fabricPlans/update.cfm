<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.MaterialPlanid")>



        <cfinvoke  component="mochi.cfc.materialPlans.MaterialPlan" method="init" returnvariable="MaterialPlan">
            <cfinvokeargument name="stValues" value="#form#"/>
        </cfinvoke>
    
        <cfinvoke  component="mochi.cfc.materialPlans.MaterialPlanGateway" method="save">
            <cfinvokeargument name="obj" value="#MaterialPlan#"/>
        </cfinvoke>
	

    <cflocation url="index.cfm">
    
<cfelseif IsDefined("url.MaterialPlanid")>

	<cfinvoke  component="mochi.cfc.materialPlans.MaterialPlanGateway" method="getById" returnvariable="MaterialPlan">
		<cfinvokeargument name="id" value="#url.MaterialPlanid#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.deliveries.DeliveryGateway" method="getAllAsQuery" returnvariable="deliveries">
	</cfinvoke>


	<cfinvoke  component="mochi.cfc.years.YearGateway" method="getAllAsQuery" returnvariable="years">
	</cfinvoke>


	
</cfif>

<cfform>
<table width="333" border="1" align="left">
  <tr>  
    <th width="149" scope="row">Plan :</th>
    <td width="168"><cfinput type="text" name="Plan" id="Plan" required="yes" message="Plan information is required" value="#MaterialPlan.getPlan()#"></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Delivery  :</th>
    <td width="168">
    	<cfselect query="deliveries" name="DeliveryID" value="DeliveryID" display="Delivery" required="yes" message="Delivery is required" queryPosition="below" selected="#MaterialPlan.getDeliveryID()#">
        </cfselect>    
    </td>
  </tr>
  <tr>  
    <th width="149" scope="row">Year  :</th>
    <td width="168">
    	<cfselect query="years" name="YearID" value="YearID" display="Year" required="yes" message="Year is required" queryPosition="below" selected="#MaterialPlan.getYearID()#">
        </cfselect>    
    </td>
  </tr>
  <tr>  
    <th width="149" scope="row">Plan Date :</th>
    <td width="168"><cfinput type="datefield" name="PlanDate" id="PlanDate" required="yes" message="Plan date is required" value="#DateFormat(MaterialPlan.getPlanDate(), 'mm/dd/yyyy')#"></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Due Date :</th>
    <td width="168"><cfinput type="datefield" name="DueDate" id="DueDate" required="yes" message="Due date is required" value="#DateFormat(MaterialPlan.getDueDate(), 'mm/dd/yyyy')#"></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Comments :</th>
    <td width="168">        		
    			<cftextarea cols="50%" required="yes" name="comments" validateat="onSubmit" message="Comments is required" value="#MaterialPlan.getComments()#"/>
	</td>
  </tr>



  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Update Material Plan"></td>
  </tr>
</table>

	<cfinput type="hidden" name="MaterialPlanid" value="#MaterialPlan.getMaterialPlanid()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#MaterialPlan.getCreatedBy()#">  
	<cfinput type="hidden" name="createddate" value="#MaterialPlan.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>