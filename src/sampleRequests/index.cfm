<cfinclude template="../shared/header.cfm"/>

<!--- Maintain filtering variables at session level --->
<cfparam name="SESSION.sampleRequest.referenceNumber" type="string"default="">
<cfparam name="SESSION.sampleRequest.styleID" type="string"default="">
<cfparam name="SESSION.sampleRequest.sampleTypeID" type="string" default="">
<cfparam name="SESSION.sampleRequest.collectionID" type="string" default="">
<cfparam name="SESSION.sampleRequest.fromRequestDate" type="string" default="">
<cfparam name="SESSION.sampleRequest.toRequestDate" type="string" default="">
<cfparam name="SESSION.sampleRequest.fromDueDate" type="string" default="">
<cfparam name="SESSION.sampleRequest.toDueDate" type="string" default="">
<cfparam name="SESSION.sampleRequest.requestStatusID" type="string" default="">
<cfparam name="SESSION.sampleRequest.deliveryID" type="string" default="">

<!--- if the user is submitting the "filter" form --->
<cfif IsDefined("FORM.styleID")>
	<cfset SESSION.sampleRequest.referenceNumber = FORM.referenceNumber>
	<cfset SESSION.sampleRequest.styleID = FORM.styleID>
	<cfset SESSION.sampleRequest.sampleTypeID = FORM.sampleTypeID>
	<cfset SESSION.sampleRequest.collectionID = FORM.collectionID>
	<cfset SESSION.sampleRequest.fromRequestDate = FORM.fromRequestDate>
	<cfset SESSION.sampleRequest.toRequestDate = FORM.toRequestDate>
	<cfset SESSION.sampleRequest.fromDueDate = FORM.fromDueDate>
	<cfset SESSION.sampleRequest.toDueDate = FORM.toDueDate>
	<cfset SESSION.sampleRequest.requestStatusID = FORM.requestStatusID>    
	<cfset SESSION.sampleRequest.deliveryID = FORM.deliveryID>        
</cfif>

<cfquery name="sampleRequests" datasource="#APPLICATION.dataSource#">
	SELECT * 
    FROM SampleRequest
    WHERE 0 = 0
    
	<!--- if the user provided a filter string for the keyword --->
    <cfif SESSION.sampleRequest.referenceNumber IS NOT "">
        AND  SampleRequest.ReferenceNumber = #SESSION.sampleRequest.referenceNumber# 		
    </cfif>
    
    
    <!--- if the user provided a filter string for the style --->
    <cfif SESSION.sampleRequest.styleID IS NOT "">
		AND SampleRequest.StyleID = #SESSION.sampleRequest.styleID#    	
    </cfif>

    <!--- if the user provided a filter string for the sampleTypeID --->
    <cfif SESSION.sampleRequest.sampleTypeID IS NOT "">
		AND SampleRequest.sampleTypeID = #SESSION.sampleRequest.sampleTypeID#    	
    </cfif>
    
    <!--- if the user provided a filter string for the collectionID --->
    <cfif SESSION.sampleRequest.collectionID IS NOT "">
		AND SampleRequest.CollectionID = #SESSION.sampleRequest.collectionID#    	
    </cfif>
    
    <!--- if the user provided a filter date from for the request date --->
    <cfif SESSION.sampleRequest.fromRequestDate IS NOT "">
		AND SampleRequest.RequestDate >= #CreateODBCDate(SESSION.sampleRequest.fromRequestDate)#            	
    </cfif>
    
    <!--- if the user provided a filter date thru for the request date --->
    <cfif SESSION.sampleRequest.toRequestDate IS NOT "">
    		AND SampleRequest.RequestDate <= #CreateODBCDate(SESSION.sampleRequest.toRequestDate)#            	
    </cfif>
        
    <!--- if the user provided a filter date from for the due date --->
    <cfif SESSION.sampleRequest.fromDueDate IS NOT "">
		AND SampleRequest.DueDate >= #CreateODBCDate(SESSION.sampleRequest.fromDueDate)#            	
    </cfif>
    
    <!--- if the user provided a filter date thru for the due date --->
    <cfif SESSION.sampleRequest.toDueDate IS NOT "">
    		AND SampleRequest.DueDate <= #CreateODBCDate(SESSION.sampleRequest.toDueDate)#            	
    </cfif>
    
    <!--- if the user provided a filter string for the statusID --->
    <cfif SESSION.sampleRequest.requestStatusID IS NOT "">
		AND SampleRequest.requestStatusID = #SESSION.sampleRequest.requestStatusID#    	
    </cfif>
    
    <!--- if the user provided a filter string for the makeIn  --->
    <cfif SESSION.sampleRequest.deliveryID IS NOT "">
		AND SampleRequest.DeliveryID = #SESSION.sampleRequest.deliveryID#
    </cfif>
    
    ORDER BY SampleRequest.RequestDate DESC
    
</cfquery>

<!--- Number of rows to display per Next/Back page --->
<cfset rowsPerPage = 10>
<!--- What row to start at? Assume first by default --->
<cfparam name="URL.startRow" default="1" type="numeric">
<!--- Allow for Show All parameter in the URL --->
<cfparam name="URL.showAll" type="boolean" default="No">

<!--- We know the total number of rows from query --->
<cfset totalRows = sampleRequests.recordCount>

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

	<cfinvoke  component="mochi.cfc.styles.StyleGateway" method="getAllAsQuery" returnvariable="styles">
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.sampleTypes.SampleTypeGateway" method="getAllAsQuery" returnvariable="sampleTypes">
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.requestStatus.RequestStatusGateway" method="getAllAsQuery" returnvariable="requestStatus">
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.collections.CollectionGateway" method="getAllAsQuery" returnvariable="collections">
	</cfinvoke>
    
    <cfinvoke  component="mochi.cfc.deliveries.DeliveryGateway" method="getAllAsQuery" returnvariable="deliveries">
	</cfinvoke>


  <cfform name="form1" id="form1" method="post" action="#CGI.SCRIPT_NAME#" width="100%">
  <div id="tbl-container">
    <table border="1" width="100%">
    	<thead>
    	<tr>
       		<th class="link" colspan="15">
            	<cfinclude template="../shared/NextNIncludeBackNext.cfm">
            </th> 
            <th class="link" colspan="3">
            	<cfoutput>
                	<a href="#CGI.SCRIPT_NAME#?&showAll=Yes">Show All</a>
                </cfoutput>
            </th>
        </tr>
        </thead>
        <thead>
        	<th class="locked">Reference # :</th>
            <th><cfinput type="text" name="referenceNumber" value="#SESSION.sampleRequest.referenceNumber#"></th>
    		<th class="locked">Style:</th>
            <th class="locked" colspan="2">
                <cfselect name="StyleID" query="styles" value="StyleID" display="StyleName"
                          selected="#SESSION.sampleRequest.styleID#" queryPosition="below">
                    <option value="">All Styles
                </cfselect>            
            	
            </th>    
            <th class="locked">Collection :</th>
            <th colspan="2">
                <cfselect name="CollectionID" query="collections" value="CollectionID" display="Collection"
                          selected="#SESSION.sampleRequest.collectionID#" queryPosition="below">
                    <option value="">All Collections
                </cfselect>            
            </th>
            <th class="locked">Sample Type:</th>
            <th colspan="2">
                <cfselect name="sampleTypeID" query="sampleTypes" value="SampleTypeID" display="SampleType"
                          selected="#SESSION.sampleRequest.sampleTypeID#" queryPosition="below">
                    <option value="">All Sample Types
                </cfselect>            
            </th>
            <th>Status :</th>
            <th colspan="2">
			    <cfselect name="requestStatusID" query="requestStatus" value="RequestStatusID" display="Status" queryPosition="below" selected="#SESSION.sampleRequest.requestStatusID#">
    				<option value="">All Request Status
			    </cfselect>            
            </th>
            <th>Delivery :</th>
            <th colspan="2">
			    <cfselect name="deliveryID" query="deliveries" value="DeliveryID" display="Delivery" queryPosition="below" selected="#SESSION.sampleRequest.deliveryID#">
    				<option value="">All Deliveries
			    </cfselect>            
            </th>            
        </thead>
        <thead>
    	<tr>
            <th>Request Dates</th>
            <th>From :</th>
            <th colspan="2"><cfinput type="datefield" name="fromRequestDate" value="#SESSION.sampleRequest.fromRequestDate#"></th>
            <th>To :</th>
            <th colspan="2"><cfinput type="datefield" name="toRequestDate" value="#SESSION.sampleRequest.toRequestDate#"></th>
            <th>Due Dates</th>
            <th>From :</th>
            <th colspan="2"><cfinput type="datefield" name="fromDueDate" value="#SESSION.sampleRequest.fromDueDate#"></th>
            <th>To :</th>
            <th colspan="2"><cfinput type="datefield" name="toDueDate" value="#SESSION.sampleRequest.toDueDate#"></th>
            <th colspan="2">
			    <cfinput type="submit" name="submit" value="Apply">            
            </th>
            <th colspan="2">
			    <cfinput type="reset" name="reset" value="Clear">            
            </th>
        </tr>
        </thead>
        <thead>
    	<tr>
        	<th class="locked">Reference #</th>
            <th class="locked">Style Number</th>
            <th class="locked">Color</th>
	        <th class="locked">Size</th>
    	    <th>Make In</th>
    	    <th>Delivery</th>
    	    <th>Sample Type</th>
    	    <th>Comments</th>
	       	<th>Requested For</th>            
	        <th>Request Date</th>
	        <th>Due Date</th>
			<th>Pattern</th>   
			<th>Sample</th>   
            <th colspan="5">Links</th>         
        </tr>
		</thead>

<cfif sampleRequests.RecordCount IS 0>
	<tr>
    	<th colspan="17" align="center">No Records was found</th>
    </tr>
<cfelse>

	<cfloop query="sampleRequests" startrow="#URL.startRow#" endrow="#endRow#">
    	
        	<!--- cfc components --->
    
            <cfinvoke  component="mochi.cfc.styles.StyleGateway" method="getById" returnvariable="Style">
				<cfinvokeargument name="id" value="#sampleRequests.StyleID#"/>
			</cfinvoke>

			<cfinvoke  component="mochi.cfc.colors.ColorGateway" method="getById" returnvariable="Color">
				<cfinvokeargument name="id" value="#sampleRequests.ColorID#"/>
			</cfinvoke>
            
            <cfinvoke  component="mochi.cfc.deliveries.DeliveryGateway" method="getById" returnvariable="Delivery">
				<cfinvokeargument name="id" value="#sampleRequests.DeliveryID#"/>
			</cfinvoke>

            <cfinvoke  component="mochi.cfc.sizes.SizeGateway" method="getById" returnvariable="Size">
				<cfinvokeargument name="id" value="#sampleRequests.SizeID#"/>
			</cfinvoke>

			<cfinvoke  component="mochi.cfc.sampleTypes.SampleTypeGateway" method="getById" returnvariable="SampleType">
				<cfinvokeargument name="id" value="#sampleRequests.SampleTypeID#"/>
			</cfinvoke>


             <cfinvoke  component="mochi.cfc.requestStatus.RequestStatusGateway" method="getById" returnvariable="RequestStatus">
				<cfinvokeargument name="id" value="#sampleRequests.RequestStatusID#"/>
			</cfinvoke>			 


			<cfinvoke  component="mochi.cfc.sampleProgress.SampleProgressGateway" method="getBySampleRequestId" returnvariable="SampleProgress">
				<cfinvokeargument name="id" value="#sampleRequests.SampleRequestID#"/>
				<cfinvokeargument name="fieldlist" value="PatternStatusID, PlanDate"/>
			</cfinvoke>
            
            <cfif SampleProgress.PatternStatusID NEQ ''>
                <cfinvoke  component="mochi.cfc.patternStatus.PatternStatusGateway" method="getById" returnvariable="PatternStatus">
                    <cfinvokeargument name="id" value="#SampleProgress.PatternStatusID#"/>
                </cfinvoke>
                <cfset patternStatus = PatternStatus.getStatus()/>
			<cfelse>
                <cfset patternStatus = 'No Update'/>            
            </cfif>


        <cfoutput>
			
		
        <!--- Old alternate color for the rows --->
        <!---<cfset class = IIF(sampleRequests.currentRow mod 2 eq 0, "'DataA'", "'DataB'")>--->	 
        <cfif sampleRequests.requestStatusID IS 7>
        	<cfset class = "Finished">
        <cfelseif sampleRequests.requestStatusID IS 5>
        	<cfset class = "Shipped">        
        <cfelseif sampleRequests.requestStatusID IS 8>
        	<cfset class = "Received">        
        <cfelseif sampleRequests.requestStatusID IS 9>
        	<cfset class = "Resubmit">        
        <cfelseif sampleProgress.planDate NEQ '' AND sampleRequests.requestStatusID IS 3>
        	<cfset class = "PlanDate">        
        <cfelseif sampleRequests.requestStatusID IS 3>
        	<cfset class = "Open">
        <cfelse>
        	<cfset class = "Cancelled">            
        </cfif>	
			 
        <tr>
          <td class="#class#">#sampleRequests.ReferenceNumber#</td>
          <td class="#class#">#Style.getStyleName()#</td>
          <td class="#class#">#Color.getColorName()#</td>
          <td class="#class#">#Size.getSize()#</td>
          <td class="#class#">#sampleRequests.MakeIn#</td>
          <td class="#class#">#Delivery.getDelivery()#</td>
          <td class="#class#">#SampleType.getSampleType()#</td>
          <td class="#class#">#sampleRequests.Comments#</td>
          <td class="#class#">#sampleRequests.RequestedFor#</td>
          <td class="#class#">#DateFormat(sampleRequests.RequestDate, 'm/d/yyyy')#</td>
          <td class="#class#">#DateFormat(sampleRequests.DueDate, 'm/d/yyyy')#</td>
          <td class="#class#">#patternStatus#</td>
          <td class="#class#">#RequestStatus.getStatus()#</td>
          <td class="#class#"><a href="update.cfm?SampleRequestID=#sampleRequests.SampleRequestID#">Edit</a></td>
          <cfif sampleRequests.RequestStatusID IS 9>
	          <td class="#class#" colspan="4"><a href="show.cfm?SampleRequestID=#sampleRequests.SampleRequestID#">View</a></td>
    	  <cfelse>                
	          <td class="#class#"><a href="../sampleProgress/update.cfm?SampleRequestID=#sampleRequests.SampleRequestID#">Progress</a></td>
	          <td class="#class#"><a href="../sampleShipments/update.cfm?SampleRequestID=#sampleRequests.SampleRequestID#">Shipment</a></td>
	          <td class="#class#"><a href="resubmit.cfm?SampleRequestID=#sampleRequests.SampleRequestID#">Resubmit</a></td>                        
	          <td class="#class#"><a href="show.cfm?SampleRequestID=#sampleRequests.SampleRequestID#">View</a></td>
          </cfif>
        </tr>        
        </cfoutput>
	</cfloop>
</cfif>   
<!--- Too much pages on the footer this was used to add a page number link to navigate the sample request list --->
<!---        <tr>
        	<td colspan="18" align="right">
            	<cfif not URL.showAll and totalRows gt rowsPerPage>
                	Page <cfinclude template="../shared/NextNIncludePageLinks.cfm">
                </cfif>
            </td> 
        </tr>
--->	</table>
	</div>
</cfform>

<a href="new.cfm">Create New Request</a>
