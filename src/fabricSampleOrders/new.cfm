<cfinclude template="../shared/header.cfm"/>


<cfif IsDefined("form.FabricSampleOrderID")>

  <cfinvoke  component="mochi.cfc.FabricSampleOrders.FabricSampleOrder" method="init" returnvariable="FabricSampleOrder">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.FabricSampleOrders.FabricSampleOrderGateway" method="save">
		<cfinvokeargument name="obj" value="#FabricSampleOrder#"/>
	</cfinvoke>
    
	<cflocation url="../solidFabrics/index.cfm">

<cfelseif IsDefined("url.fabricrequestid")>

	<cfinvoke  component="mochi.cfc.vendors.VendorGateway" method="getAllAsQuery" returnvariable="vendors">
	</cfinvoke>


	<cfinvoke  component="mochi.cfc.users.UserGateway" method="getAllAsQuery" returnvariable="users">
	</cfinvoke>


    <table width="333" border="1" align="left">

        <cfform method="post">	
        
              <tr>
                <th width="149" scope="row">Vendor :</th>
                <td width="168">
                    <cfselect name="VendorID" query="vendors" value="VendorID" display="Vendor" queryPosition="below" required="yes" message="vendor is required">
                        <option value="">Select Vendor
                    </cfselect>
                
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Ordered By :</th>
                <td width="168">
                    <cfselect name="OrderedBy" query="users" value="FirstName" display="FirstName" queryPosition="below" required="yes" message="ordered by is required">
                        <option value="">Select Ordered By
                    </cfselect>
                
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Order Date :</th>
                <td width="168"><cfinput type="datefield" name="orderdate" value="#Now()#"></td>
              </tr>
              <tr>
                <th width="149" scope="row">Estimate Ship Date :</th>
                <td width="168"><cfinput type="datefield" name="estimateshipdate"></td>
              </tr>
              <tr>
                <th scope="row">Sample Yardage :</th>
                <td>
                        <cfinput type="text" name="sampleYardage" id="sampleYardage" required="yes" message="sample yardage is required">
                </td>
              </tr>
              <tr>
                <th scope="row">Cost per Yard:</th>
                <td>
                        <cfinput type="text" name="costPerYard" id="costPerYard" value="0">
                </td>
              </tr>
              <tr>
                <th scope="row">Total Cost :</th>
                <td>
                        <cfinput type="text" name="totalCost" id="totalCost" value="0">
                </td>
              </tr>
              <tr>
                <th scope="row">Currency :</th>
                <td>
                        <cfinput type="text" name="costcurrency" id="costcurrency">
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Received By :</th>
                <td width="168">
                    <cfselect name="ReceivedBy" query="users" value="FirstName" display="FirstName" queryPosition="below">
                        <option value="">Select Received By
                    </cfselect>
                
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Received Date :</th>
                <td width="168"><cfinput type="datefield" name="receiveddate"></td>
              </tr>
              <tr>
                <th scope="row">Received Quantity :</th>
                <td>
                        <cfinput type="text" name="receivedQuantity" id="receivedQuantity" value="0">
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Cancelled By :</th>
                <td width="168">
                    <cfselect name="CancelledBy" query="users" value="FirstName" display="FirstName" queryPosition="below">
                        <option value="">Select Cancelled By
                    </cfselect>
                
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Cancelled Date :</th>
                <td width="168"><cfinput type="datefield" name="cancelleddate"></td>
              </tr>
              <tr>
                <th scope="row">Comments :</th>
                <td>
                        <cftextarea cols="50%" name="Comments" validateat="onSubmit" required="yes" message="comments is required">                        
                        </cftextarea>
                </td>
             </tr>
              <tr>
                <td colspan="2"><cfinput type="submit" name="submit" value="Add Fabric Sample Order"></td>	
             </tr>
             
             
    
        <cfinput type="hidden" name="FabricSampleOrderStatusID" value="1">  

        <cfinput type="hidden" name="FabricSampleOrderID" value="0">  

        <cfinput type="hidden" name="FabricRequestID" value="#url.fabricrequestid#">  
    
        
        <!--- Timestamps --->
        <cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
        <cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
        <cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
        <cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    
             
		</cfform>
    
	</table>


</cfif>