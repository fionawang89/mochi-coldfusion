<cfinclude template="../shared/header.cfm"/>

<!--- Maintain filtering variables at session level --->
<cfparam name="SESSION.labDipInfo.fabricID" type="string"default="">
<cfparam name="SESSION.labDipInfo.DeliveryID" type="string"default="">
<cfparam name="SESSION.labDipInfo.YearID" type="string"default="">
<cfparam name="SESSION.labDipInfo.FabricRequestTypeID" type="string"default="">
<cfparam name="SESSION.labDipInfo.FabricCategoryID" type="string"default="1">

<!--- if the user is submitting the "filter" form --->
<cfif IsDefined("FORM.fabricID")>
	<cfset SESSION.labDipInfo.fabricID = FORM.fabricID>
	<cfset SESSION.labDipInfo.DeliveryID = FORM.DeliveryID>
	<cfset SESSION.labDipInfo.YearID = FORM.YearID>    
	<cfset SESSION.labDipInfo.FabricRequestTypeID = FORM.FabricRequestTypeID>    
	<cfset SESSION.labDipInfo.FabricCategoryID = FORM.FabricCategoryID>        
</cfif>


<cfinvoke  component="mochi.cfc.materials.MaterialGateway" method="getAllSolidFabricAsQuery" returnvariable="qFabrics">
</cfinvoke>

<cfinvoke  component="mochi.cfc.deliveries.DeliveryGateway" method="getAllAsQuery" returnvariable="qDeliveries">
</cfinvoke>

<cfinvoke  component="mochi.cfc.years.YearGateway" method="getAllAsQuery" returnvariable="qYears">
</cfinvoke>

<cfinvoke  component="mochi.cfc.fabricRequestTypes.FabricRequestTypeGateway" method="getAllAsQuery" returnvariable="qFabricRequestTypes">
</cfinvoke>

<cfinvoke  component="mochi.cfc.MaterialCategories.MaterialCategoryGateway" method="getAllAsQuery" returnvariable="qFabricCateogories">
</cfinvoke>



<cfquery name="qFabricRequests" datasource="#APPLICATION.dataSource#">
    SELECT Materials.MaterialCode, Materials.Description, Materials.Width, Materials.Content, Colors.ColorName, Images.ThumbnailFile, FabricRequest.PantoneColor, FabricRequest.RequestDate, FabricRequest.RequestedBy, FabricRequest.ReceivedBy, FabricRequest.ReceivedDate, FabricRequestStatus.Status, FabricRequest.FabricRequestID, FabricRequest.Comments, Deliveries.Delivery
    FROM ((((Colors INNER JOIN FabricRequest ON Colors.ColorID = FabricRequest.ColorID) INNER JOIN FabricRequestStatus ON FabricRequest.FabricRequestStatusID = FabricRequestStatus.FabricRequestStatusID) INNER JOIN Deliveries ON FabricRequest.DeliveryID = Deliveries.DeliveryID) LEFT JOIN Images ON (FabricRequest.EntityTypeID = Images.EntityTypeID) AND (FabricRequest.FabricRequestID = Images.EntityID)) INNER JOIN Materials ON FabricRequest.FabricID = Materials.MaterialID
    WHERE FabricCategoryID = #SESSION.labDipInfo.FabricCategoryID#
	<!--- if the user provided a filter string for the style --->
   <cfif SESSION.labDipInfo.FabricID IS NOT "">
    	AND FabricRequest.FabricID = #SESSION.labDipInfo.FabricID#    		
    </cfif>
	<!--- if the user provided a filter string for the delivery --->
    <cfif SESSION.labDipInfo.DeliveryID IS NOT "">
    	AND Deliveries.DeliveryID = #SESSION.labDipInfo.DeliveryID#    		
    </cfif>
	<!--- if the user provided a filter string for the year --->
    <cfif SESSION.labDipInfo.YearID IS NOT "">
    	AND FabricRequest.YearID = #SESSION.labDipInfo.YearID#    		
    </cfif>
	<!--- if the user provided a filter string for the fabric request type --->
    <cfif SESSION.labDipInfo.FabricRequestTypeID IS NOT "">
    	AND FabricRequest.FabricRequestTypeID = #SESSION.labDipInfo.FabricRequestTypeID#    		
    </cfif>
    
    ORDER BY Deliveries.Delivery, Materials.MaterialCode ASC
    
</cfquery>

<!--- Number of rows to display per Next/Back page --->
<cfset rowsPerPage = 10>
<!--- What row to start at? Assume first by default --->
<cfparam name="URL.startRow" default="1" type="numeric">
<!--- Allow for Show All parameter in the URL --->
<cfparam name="URL.showAll" type="boolean" default="No">

<!--- We know the total number of rows from query --->
<cfset totalRows = qFabricRequests.recordCount>

<!--- Show all on the page if showAll passed in the URL --->
<cfif URL.showAll>
	<cfset rowsPerPage = totalRows>
</cfif>

<!--- Last row is 10 rows past the starting row, or --->
<!--- total number of query rows, whichever is less --->
<cfset endRow = min(URL.startRow + rowsPerPage - 1, totalRows)>

<!--- Next button goes to 1 past current end row --->
<cfset startRowNext = endRow + 1>

<!--- Back button goes N rows from start row --->
<cfset startRowBack = URL.startRow - rowsPerPage>

<cfform method="post" action="#CGI.SCRIPT_NAME#">
	<table border="1">
    	<tr>
        	<td colspan="10">
            	<cfinclude template="../shared/NextNIncludeBackNext.cfm">
            </td>
        	<td colspan="6">
            	<cfoutput>
                	<a href="#CGI.SCRIPT_NAME#?&showAll=Yes">Show All</a>
                </cfoutput>
            </td>
        </tr>
    	<tr>
        	<th>Fabric :</th>
        	<th>
            	<cfselect name="FabricID" query="qFabrics" queryPosition="below" value="MaterialID" display="MaterialCode" selected="#SESSION.labDipInfo.FabricID#">
                	<option value="">ALL FABRICS
                </cfselect>
            </th>
        	<th>Delivery :</th>
            <th>
            	<cfselect name="DeliveryID" query="qDeliveries" queryPosition="below" value="DeliveryID" display="Delivery" selected="#SESSION.labDipInfo.DeliveryID#">
                	<option value="">ALL DELIVERIES
                </cfselect>            	
            </th>
        	<th>Year :</th>
            <th>
            	<cfselect name="YearID" query="qYears" queryPosition="below" value="YearID" display="Year" selected="#SESSION.labDipInfo.YearID#">
                	<option value="">ALL YEARS
                </cfselect>            	
            </th>
        	<th>Type :</th>
            <th>
            	<cfselect name="FabricRequestTypeID" query="qFabricRequestTypes" queryPosition="below" value="FabricRequestTypeID" display="Type" selected="#SESSION.labDipInfo.FabricRequestTypeID#">
                	<option value="">ALL TYPES
                </cfselect>            	
            </th>
        	<th>Category :</th>
            <th>
            	<cfselect name="FabricCategoryID" query="qFabricCateogories" queryPosition="below" value="MaterialCategoryID" display="Category" selected="#SESSION.labDipInfo.FabricCategoryID#">
                </cfselect>            	
            </th>
        	<td><cfinput type="submit" name="submit" value="Search"></td>
        </tr>
    	<tr>
        	<th>Image</th>
        	<th>Fabric</th>
            <th>Color</th>
            <th>Description</th>
            <th>Width</th>
            <th>Content</th>
        	<th>Delivery</th>
        	<th>Comments</th>
            <th>Sourcing</th>
 			<cfif SESSION.labDipInfo.FabricCategoryID EQ 1 >
	            <th>Lab Dips</th>
			<cfelse>
	            <th>StrikeOffs</th>                            
            </cfif>    
            <th>Sample Orders</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>


<cfif qFabricRequests.RecordCount IS 0>
	<tr>
    	<th colspan="16">No Data was returned</th>    
    </tr>
<cfelse> 
	<cfloop query="qFabricRequests" startrow="#URL.startRow#" endrow="#endRow#">
        <cfoutput>
        <tr>
			<td align="center"><a href="update.cfm?FabricRequestID=#qFabricRequests.FabricRequestID#"><img src="/mochi/uploads/materials/#qFabricRequests.FabricRequestID#/images/#qFabricRequests.ThumbnailFile#" /></a></td>
        	<td>#qFabricRequests.MaterialCode#</td>         
        	<td>#qFabricRequests.ColorName#</td>         
        	<td>#qFabricRequests.Description#</td>         
        	<td>#qFabricRequests.Width#</td>         
        	<td>#qFabricRequests.Content#</td>         
        	<td>#qFabricRequests.Delivery#</td>         
        	<td>#qFabricRequests.Comments#</td>         
			
			<!--- Enter fabric sourcing information here --->
            <cfquery name="qSourcings" datasource="#APPLICATION.DATASOURCE#">
                SELECT FabricSourcings.FabricSourcingID, Vendors.Vendor, FabricSourcings.Comments, FabricSourcings.LastMaintainedDate, FabricSourcings.USDPrice 
                FROM (FabricRequest INNER JOIN FabricSourcings ON FabricRequest.FabricRequestID = FabricSourcings.FabricRequestID) INNER JOIN 
                	  Vendors ON FabricSourcings.VendorID = Vendors.VendorID
                WHERE FabricRequest.FabricRequestID = #qFabricRequests.FabricRequestID#
                ORDER BY FabricSourcings.LastMaintainedDate DESC            	
            </cfquery>
            
            
                        
            <!--- check if sourcing information is available--->
            <cfif qSourcings.RECORDCOUNT NEQ 0>
            	<td>
                <cfloop query="qSourcings">            
		            <!--- if sourcing is available display the status and link to update information --->
                    <cfif currentRow EQ 1> 
		            	<p class="recentRecord">#DateFormat(qSourcings.LastMaintainedDate, 'mm/dd')# : <a href="../fabricSourcings/update.cfm?FabricSourcingID=#qSourcings.FabricSourcingID#">#qSourcings.Vendor#</a></p>
                        	<ul>
                        		<li>#qSourcings.Comments#</li>
							</ul>                                
                    <cfelse>
		            	<p>#DateFormat(qSourcings.LastMaintainedDate, 'mm/dd')# : <a href="../fabricSourcings/show.cfm?FabricSourcingID=#qSourcings.FabricSourcingID#">#qSourcings.Vendor#</a></p>                        		<ul>
                        		<li>#qSourcings.Comments#</li>
							</ul>                                

                    </cfif>                             
                </cfloop>                
				</td>                    
            <cfelse>
				<td><p class="warning">NOT YET SOURCED</p></td>
            </cfif>
 
 
 			<cfif SESSION.labDipInfo.FabricCategoryID EQ 1 >

				<!--- display only if the fabric is solid --->
                
                <!--- Enter Lab Dip information here --->
                <cfquery name="qLabDips" datasource="#APPLICATION.DATASOURCE#">
                    SELECT FabricLabDips.FabricLabDipID, FabricLabDipStatus.Status, FabricLabDips.Comments, FabricLabDips.SubmitDate  
                    FROM FabricLabDips INNER JOIN FabricLabDipStatus 
                    ON FabricLabDips.FabricLabDipStatusID = FabricLabDipStatus.FabricLabDipStatusID 
                    WHERE  FabricLabDips.FabricRequestID = #qFabricRequests.FabricRequestID# 
                    ORDER BY FabricLabDips.LastMaintainedDate DESC          
                </cfquery>            	
                
                <!--- check if lab dip inforamtion is available--->
                <cfif qLabDips.RECORDCOUNT NEQ 0>
                    <td>
                    <cfloop query="qLabDips">            
                        <!--- if lab dip is available display the status and link to update information --->
                        <cfif currentRow EQ 1> 
                            <p class="recentRecord">#DateFormat(qLabDips.SubmitDate, 'mm/dd')# : <a href="../fabricLabDips/update.cfm?FabricLabDipID=#qLabDips.FabricLabDipID#">#qLabDips.Status#</a></p><li>#qLabDips.Comments#</li>
                        <cfelse>
                            <p>#DateFormat(qLabDips.SubmitDate, 'mm/dd')# : <a href="../fabricLabDips/show.cfm?FabricLabDipID=#qLabDips.FabricLabDipID#">#qLabDips.Status#</a></p><li>#qLabDips.Comments#</li>                        
                        </cfif>                             
                    </cfloop>                
                    </td>                    
                <cfelse>
                    <td><p class="warning">NO LAB DIPS</p></td>
                </cfif>

			<!--- display only if the fabric is print --->
			<cfelse>
            
                <!--- Enter strike off information here --->
                <cfquery name="qStrikeOffs" datasource="#APPLICATION.DATASOURCE#">
                    SELECT FabricStrikeOffs.FabricStrikeOffID, FabricRequestStatus.Status, FabricStrikeOffs.Comments, FabricStrikeOffs.SubmitDate
                    FROM FabricStrikeOffs INNER JOIN FabricRequestStatus ON FabricStrikeOffs.FabricRequestStatusID = FabricRequestStatus.FabricRequestStatusID 
                    WHERE  FabricStrikeOffs.FabricRequestID = #qFabricRequests.FabricRequestID# 
                    ORDER BY FabricStrikeOffs.LastMaintainedDate DESC          
                </cfquery>            	
                
                <!--- check if strike off inforamtion is available--->
                <cfif qStrikeOffs.RECORDCOUNT NEQ 0>
                    <td>
                    <cfloop query="qStrikeOffs">            
                        <!--- if strike off is available display the status and link to update information --->
                        <cfif currentRow EQ 1> 
                            <p class="recentRecord">#DateFormat(qStrikeOffs.SubmitDate, 'mm/dd')# : <a href="../fabricStrikeOffs/update.cfm?FabricStrikeOffID=#qStrikeOffs.FabricStrikeOffID#">#qStrikeOffs.Status#</a></p><li>#qStrikeOffs.Comments#</li>
                        <cfelse>
                            <p>#DateFormat(qStrikeOffs.SubmitDate, 'mm/dd')# : <a href="../fabricStrikeOffs/show.cfm?FabricStrikeOffID=#qStrikeOffs.FabricStrikeOffID#">#qStrikeOffs.Status#</a></p><li>#qStrikeOffs.Comments#</li>                        
                        </cfif>                             
                    </cfloop>                
                    </td>                    
                <cfelse>
                    <td><p class="warning">NO STRIKE OFFS</p></td>
                </cfif>                                
                
			</cfif>            
			
            
			<!--- Enter fabric ordering information here --->
            <cfquery name="qOrders" datasource="#APPLICATION.DATASOURCE#">
                SELECT FabricSampleOrders.FabricSampleOrderID, Vendors.Vendor, FabricSampleOrders.OrderDate, FabricSampleOrders.SampleYardage, FabricSampleOrders.Comments, FabricSampleOrders.CostPerYard, FabricSampleOrderStatus.Status
                FROM (FabricSampleOrders INNER JOIN Vendors ON FabricSampleOrders.VendorID = Vendors.VendorID) INNER JOIN FabricSampleOrderStatus ON FabricSampleOrders.FabricSampleOrderStatusID = FabricSampleOrderStatus.FabricSampleOrderStatusID
                WHERE FabricSampleOrders.FabricRequestID = #qFabricRequests.FabricRequestID#
                ORDER BY FabricSampleOrders.CreatedDate DESC
            </cfquery>
            
            
                        
            <!--- check if fabric ordering  information is available--->
            <cfif qSourcings.RECORDCOUNT NEQ 0>
            	<td>
                <cfloop query="qOrders">            
		            <!--- if sourcing is available display the status and link to update information --->
                    <cfif currentRow EQ 1> 
		            	<p class="recentRecord">#DateFormat(qOrders.OrderDate, 'mm/dd')# : <a href="../fabricSampleOrders/update.cfm?FabricSampleOrderID=#qOrders.FabricSampleOrderID#">#qOrders.Status#</a></p><ul>
                        	<li>#qOrders.Vendor#</li>
                        	<li>Price : #qOrders.CostPerYard#</li>
                         </ul>
                    <cfelse>
		            	<p>#DateFormat(qOrders.OrderDate, 'mm/dd')# : <a href="../fabricSampleOrders/show.cfm?FabricSampleOrderID=#qOrders.FabricSampleOrderID#">#qOrders.Status#</a></p><ul>
                        	<li>#qOrders.Vendor#</li>
                        	<li>Price : #qOrders.CostPerYard#</li>
                         </ul>
                    </cfif>                             
                </cfloop>                
				</td>                    
            <cfelse>
				<td><p class="warning">NO PLACED ORDERS</p></td>
            </cfif>
            
            
            <td><a href="uploadImage.cfm?FabricRequestID=#qFabricRequests.FabricRequestID#">Upload Image</a></td>
            <td><a href="show.cfm?FabricRequestID=#qFabricRequests.FabricRequestID#">View</a></td>
			<td><a href="../fabricSourcings/new.cfm?FabricRequestID=#qFabricRequests.FabricRequestID#">Add Source</a></td>
 			<cfif SESSION.labDipInfo.FabricCategoryID EQ 1 >
				<td><a href="../fabricLabDips/new.cfm?FabricRequestID=#qFabricRequests.FabricRequestID#">Add Lab Dip</a></td>
			<cfelse>
            	<td><a href="../fabricStrikeOffs/new.cfm?FabricRequestID=#qFabricRequests.FabricRequestID#">Add StrikeOff</a></td>
			</cfif>                
			<td><a href="../fabricSampleOrders/new.cfm?FabricRequestID=#qFabricRequests.FabricRequestID#">Add Order</a></td>
        </tr>     
        </cfoutput>        
	</cfloop>        
        <tr>
        	<td colspan="16" align="right">
            	<cfif not URL.showAll and totalRows gt rowsPerPage>
                	Page <cfinclude template="../shared/NextNIncludePageLinks.cfm">
                </cfif>
            </td> 
        </tr>
</cfif>   

    </table>
</cfform>

<a href="new.cfm">Create New Fabric Request</a>

