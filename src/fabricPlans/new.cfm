<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.MaterialPlanid")>
	<!--- Check if result code already exist in the system to avoid duplication --->
	<cfquery name="qMaterialPlan" datasource="#application.datasource#">
		SELECT MaterialPlanid
		FROM MaterialPlans
        WHERE DeliveryID =  '#form.DeliveryID#'
        AND   YearID = '#form.YearID#'
	</cfquery>
	
	<!--- If result code doesnt exists create one --->
	<cfif qMaterialPlan.RECORDCOUNT IS 0>
    	
        <cfinvoke  component="mochi.cfc.materialPlans.MaterialPlan" method="init" returnvariable="MaterialPlan">
			<cfinvokeargument name="stValues" value="#form#"/>
		</cfinvoke>

		<cfinvoke  component="mochi.cfc.materialPlans.MaterialPlanGateway" method="save">
			<cfinvokeargument name="obj" value="#MaterialPlan#"/>
		</cfinvoke>

	</cfif>
		
    <cflocation url="index.cfm">
	
</cfif>

<cfform>


<cfinvoke  component="mochi.cfc.deliveries.DeliveryGateway" method="getAllAsQuery" returnvariable="deliveries">
</cfinvoke>

<cfinvoke  component="mochi.cfc.years.YearGateway" method="getAllAsQuery" returnvariable="years">
</cfinvoke>




<table width="333" border="1" align="left">
  <tr>  
    <th width="149" scope="row">Plan :</th>
    <td width="168"><cfinput type="text" name="Plan" id="Plan" required="yes" message="Plan information is required"></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Delivery  :</th>
    <td width="168">
    	<cfselect query="deliveries" name="DeliveryID" value="DeliveryID" display="Delivery" required="yes" message="Delivery is required" queryPosition="below">
        	<option value="">Select Delivery</option>
        </cfselect>    
    </td>
  </tr>
  <tr>  
    <th width="149" scope="row">Year  :</th>
    <td width="168">
    	<cfselect query="years" name="YearID" value="YearID" display="Year" required="yes" message="Year is required" queryPosition="below">
        	<option value="">Select Year</option>
        </cfselect>    
    </td>
  </tr>
  <tr>  
    <th width="149" scope="row">Plan Date :</th>
    <td width="168"><cfinput type="datefield" name="PlanDate" id="PlanDate" required="yes" message="Plan date is required"></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Due Date :</th>
    <td width="168"><cfinput type="datefield" name="DueDate" id="DueDate" required="yes" message="Due date is required"></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Comments :</th>
    <td width="168">        		
    			<cftextarea cols="50%" required="yes" name="comments" validateat="onSubmit" message="Comments is required">
				</cftextarea>                            
	</td>
  </tr>



  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create MaterialPlan"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="MaterialPlanid" name="MaterialPlanid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>