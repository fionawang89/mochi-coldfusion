<cfinclude template="../shared/header.cfm"/>


<cfif IsDefined("form.FabricSampleOrderID")>
	
    <!--- if the received by or received date is provided --->
    <cfif form.receivedBy NEQ '' OR form.receivedDate NEQ ''>
    	<cfif form.receivedBy EQ ''>
        	<cfset form.receivedBy = GetAuthUser()>
		<cfelseif form.receivedDate EQ ''>
        	<cfset form.receivedDate= Now()>		        
        </cfif>
        <!--- set the status to received which is 2 --->
        <cfset form.FabricSampleOrderStatusID = 2>
	<cfelseif form.cancelledBy NEQ '' OR form.cancelledDate NEQ ''>
    	<cfif form.cancelledBy EQ ''>
        	<cfset form.cancelledBy = GetAuthUser()>
		<cfelseif form.CancelledDate EQ ''>
        	<cfset form.CancelledDate= Now()>		        
        </cfif>
        <!--- set the status to cancel which is 2 --->
        <cfset form.FabricSampleOrderStatusID = 3>        
    </cfif>
    
    
    
	<cfinvoke  component="mochi.cfc.FabricSampleOrders.FabricSampleOrder" method="init" returnvariable="FabricSampleOrder">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.FabricSampleOrders.FabricSampleOrderGateway" method="save">
		<cfinvokeargument name="obj" value="#FabricSampleOrder#"/>
	</cfinvoke>

	

	<cflocation url="../solidFabrics/index.cfm">

    
<cfelseif IsDefined("url.FabricSampleOrderID")>

	<cfinvoke  component="mochi.cfc.fabricSampleOrders.FabricSampleOrderGateway" method="getById" returnvariable="FabricSampleOrder">
		<cfinvokeargument name="id" value="#url.FabricSampleOrderID#"/>
	</cfinvoke>


	<cfinvoke  component="mochi.cfc.vendors.VendorGateway" method="getAllAsQuery" returnvariable="vendors">
	</cfinvoke>


	<cfinvoke  component="mochi.cfc.users.UserGateway" method="getAllAsQuery" returnvariable="users">
	</cfinvoke>

    <table width="333" border="1" align="left">

        <cfform method="post">	
                
              <tr>
                <th width="149" scope="row">Vendor :</th>
                <td width="168">
                    <cfselect name="VendorID" query="vendors" value="VendorID" display="Vendor" queryPosition="below" required="yes" message="vendor is required" selected="#FabricSampleOrder.getVendorID()#">
                    </cfselect>
                
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Ordered By :</th>
                <td width="168">
                    <cfselect name="OrderedBy" query="users" value="FirstName" display="FirstName" queryPosition="below" required="yes" message="ordered by is required" selected="#FabricSampleOrder.getOrderedBy()#">
                    </cfselect>
                
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Order Date :</th>
                <td width="168"><cfinput type="datefield" name="orderdate" value="#DateFormat(FabricSampleOrder.getOrderDate(), 'mm/dd/yyyy')#"></td>
              </tr>
              <tr>
                <th width="149" scope="row">Estimate Ship Date :</th>
                <td width="168"><cfinput type="datefield" name="estimateshipdate" value="#DateFormat(FabricSampleOrder.getEstimateShipDate(), 'mm/dd/yyyy')#"></td>
              </tr>
              <tr>
                <th scope="row">Sample Yardage :</th>
                <td>
                        <cfinput type="text" name="sampleYardage" id="sampleYardage" required="yes" message="sample yardage is required" value="#FabricSampleOrder.getSampleYardage()#">
                </td>
              </tr>
              <tr>
                <th scope="row">Cost per Yard:</th>
                <td>
                        <cfinput type="text" name="costPerYard" id="costPerYard" value="#FabricSampleOrder.getCostPerYard()#">
                </td>
              </tr>
              <tr>
                <th scope="row">Total Cost :</th>
                <td>
                        <cfinput type="text" name="totalCost" id="totalCost" value="#FabricSampleOrder.getTotalCost()#">
                </td>
              </tr>
              <tr>
                <th scope="row">Currency :</th>
                <td>
                        <cfinput type="text" name="costcurrency" id="costcurrency" value="#FabricSampleOrder.getCostCurrency()#">
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Received By :</th>
                <td width="168">
                    <cfselect name="ReceivedBy" query="users" value="FirstName" display="FirstName" queryPosition="below" selected="#FabricSampleOrder.getReceivedBy()#">
                        <option value="">Select Received By
                    </cfselect>
                
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Received Date :</th>
                <td width="168"><cfinput type="datefield" name="receiveddate" value="#DateFormat(FabricSampleOrder.getReceivedDate(), 'mm/dd/yyyy')#"></td>
              </tr>
              <tr>
                <th scope="row">Received Quantity :</th>
                <td>
                        <cfinput type="text" name="receivedQuantity" id="receivedQuantity" value="#FabricSampleOrder.getReceivedQuantity()#">
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Cancelled By :</th>
                <td width="168">
                    <cfselect name="CancelledBy" query="users" value="FirstName" display="FirstName" queryPosition="below" selected="#FabricSampleOrder.getCancelledBy()#">
                        <option value="">Select Cancelled By
                    </cfselect>
                
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Cancelled Date :</th>
                <td width="168"><cfinput type="datefield" name="cancelleddate" value="#DateFormat(FabricSampleOrder.getCancelledDate(), 'mm/dd/yyyy')#"></td>
              </tr>
              <tr>
                <th scope="row">Comments :</th>
                <td>
                        <cftextarea cols="50%" name="Comments" validateat="onSubmit" required="yes" message="comments is required" value="#FabricSampleOrder.getComments()#"/>                        
                </td>
             </tr>
              <tr>
                <td colspan="2"><cfinput type="submit" name="submit" value="Update Fabric Sample Order"></td>	
             </tr>
             
             
    
        <cfinput type="hidden" name="FabricSampleOrderStatusID" value="#FabricSampleOrder.getFabricSampleOrderStatusID()#">  

        <cfinput type="hidden" name="FabricSampleOrderID" value="#FabricSampleOrder.getFabricSampleOrderID()#">  

        <cfinput type="hidden" name="FabricRequestID" value="#FabricSampleOrder.getFabricRequestID()#">  
        
        <!--- Timestamps --->
        <cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
        <cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
        <cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
        <cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    
             
		</cfform>
    
	</table>

</cfif>