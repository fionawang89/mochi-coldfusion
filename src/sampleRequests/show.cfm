<cfinclude template="../shared/header.cfm">

<cfif IsDefined("url.samplerequestid")>

    <cfinvoke  component="mochi.cfc.sampleRequests.SampleRequestGateway" method="getById" returnvariable="sampleRequest">
        <cfinvokeargument name="id" value="#url.samplerequestid#"/>
    </cfinvoke>
    
    <cfinvoke  component="mochi.cfc.styles.StyleGateway" method="getById" returnvariable="Style">
        <cfinvokeargument name="id" value="#sampleRequest.getStyleID()#"/>
    </cfinvoke>
    
    <cfinvoke  component="mochi.cfc.images.ImageGateway" method="getByEntity" returnvariable="Image">
        <cfinvokeargument name="entitytypeid" value="2"/>
        <cfinvokeargument name="entityid" value="#sampleRequest.getStyleID()#"/>
    </cfinvoke>
    
    <cfinvoke  component="mochi.cfc.colors.ColorGateway" method="getById" returnvariable="Color">
        <cfinvokeargument name="id" value="#sampleRequest.getColorID()#"/>
    </cfinvoke>
    
    <cfinvoke  component="mochi.cfc.sizes.SizeGateway" method="getById" returnvariable="Size">
        <cfinvokeargument name="id" value="#sampleRequest.getSizeID()#"/>
    </cfinvoke>
    
    <cfinvoke  component="mochi.cfc.collections.CollectionGateway" method="getById" returnvariable="Collection">
        <cfinvokeargument name="id" value="#sampleRequest.getCollectionID()#"/>
    </cfinvoke>
    
    <cfinvoke  component="mochi.cfc.deliveries.DeliveryGateway" method="getById" returnvariable="Delivery">
        <cfinvokeargument name="id" value="#sampleRequest.getDeliveryID()#"/>
    </cfinvoke>
    
    <cfinvoke  component="mochi.cfc.requestStatus.RequestStatusGateway" method="getById" returnvariable="RequestStatus">
        <cfinvokeargument name="id" value="#sampleRequest.getRequestStatusID()#"/>
    </cfinvoke>
    
    <cfinvoke  component="mochi.cfc.contractors.ContractorGateway" method="getById" returnvariable="Contractor">
        <cfinvokeargument name="id" value="#sampleRequest.getContractorID()#"/>
    </cfinvoke>
    
    <cfinvoke  component="mochi.cfc.images.ImageGateway" method="getAllAsQueryByEntity" returnvariable="images">
        <cfinvokeargument name="entityTypeid" value="1"/>
        <cfinvokeargument name="entityId" value="#url.samplerequestid#"/>
    </cfinvoke>
    
    <cfinvoke  component="mochi.cfc.videos.VideoGateway" method="getAllAsQueryByEntity" returnvariable="videos">
        <cfinvokeargument name="entityTypeid" value="1"/>
        <cfinvokeargument name="entityId" value="#url.samplerequestid#"/>
    </cfinvoke>

    
    <cflayout type="tab">
        
        <!--- First tab is sample request information --->
        <cflayoutarea title="Sample Request">
         <table>
          <tr>
            <th>Reference Number :</th>
            <td><cfoutput>#sampleRequest.getReferenceNumber()#</cfoutput></td>
          </tr>
          <tr>
            <th>Request Submitted :</th>
            <td><cfoutput>#sampleRequest.getRequestSubmitted()#</cfoutput></td>
          </tr>
          <tr>
            <th>Make In :</th>
            <td><cfoutput>#sampleRequest.getMakeIn()#</cfoutput></td>
          </tr>
          <tr>  
            <th>Image :</th>
            <td><cfoutput><img src="/mochi/uploads/#Style.getStyleID()#/images/2/#Image.getThumbnailFile()#" /></cfoutput></td>
          </tr>
          <tr>
            <th>Style Name :</th>
            <td><cfoutput>#Style.getStyleName()#</cfoutput></td>
          </tr>
          <tr>
            <th>Color :</th>
            <td><cfoutput>#Color.getColorName()#</cfoutput></td>
          </tr>
          <tr>
            <th>Size :</th>
            <td><cfoutput>#Size.getSize()#</cfoutput></td>
          </tr>
          <tr>
            <th>Collection :</th>
            <td><cfoutput>#Collection.getCollection()#</cfoutput></td>
          </tr>
          <tr>
            <th>Delivery :</th>
            <td><cfoutput>#Delivery.getDelivery()#</cfoutput></td>
          </tr>
          <tr>
            <th>Quantity :</th>
            <td><cfoutput>#sampleRequest.getQuantity()#</cfoutput></td>
          </tr>
          <tr>
            <th>Customer :</th>
            <td><cfoutput>#sampleRequest.getCustomer()#</cfoutput></td>
          </tr>
          <tr>
            <th>Contractor :</th>
            <td><cfoutput>#Contractor.getContractor()#</cfoutput></td>
          </tr>
          <tr>
            <th>Comments :</th>
            <td><cfoutput>#sampleRequest.getComments()#</cfoutput></td>
          </tr>
          <tr>
            <th>Requested By :</th>
            <td><cfoutput>#sampleRequest.getRequestedBy()#</cfoutput></td>
          </tr>
          <tr>
            <th>Requested For :</th>
            <td><cfoutput>#sampleRequest.getRequestedFor()#</cfoutput></td>
          </tr>
          <tr>
            <th>Request Date :</th>
            <td><cfoutput>#DateFormat(sampleRequest.getRequestDate(), 'full')#</cfoutput></td>
          </tr>
          <tr>
            <th>Due Date :</th>
            <td><cfoutput>#DateFormat(sampleRequest.getDueDate(), 'full')#</cfoutput></td>
          </tr>
          <tr>
            <th>Pattern Due Date :</th>
            <td><cfoutput>#DateFormat(sampleRequest.getPatternDueDate(), 'full')#</cfoutput></td>
          </tr>
          <tr>
            <th>Dealine To Contractor :</th>
            <td><cfoutput>#DateFormat(sampleRequest.getDeadlineToContractor(), 'full')#</cfoutput></td>
          </tr>
          <tr>
            <th>Status :</th>
            <td><cfoutput>#RequestStatus.getStatus()#</cfoutput></td>
          </tr>
          <tr>
            <th>Cancelled By :</th>
            <td><cfoutput>#sampleRequest.getCancelledBy()#</cfoutput></td>
          </tr>
          <tr>
            <th>Cancellation Date :</th>
            <td><cfoutput>#DateFormat(sampleRequest.getCancellationDate(), 'full')#</cfoutput></td>
          </tr>
          <tr>
            <th>Created By :</th>
            <td><cfoutput>#sampleRequest.getCreatedBy()#</cfoutput></td>
          </tr>
          <tr>
            <th>Created Date :</th>
            <td><cfoutput>#DateFormat(sampleRequest.getCreatedDate(), 'full')#</cfoutput></td>
          </tr>
          <tr>
            <th>Last Maintained By :</th>
            <td><cfoutput>#sampleRequest.getLastMaintainedBy()#</cfoutput></td>
          </tr>
          <tr>
            <th>Last Maintained Date :</th>
            <td><cfoutput>#DateFormat(sampleRequest.getLastMaintainedDate(), "full")#</cfoutput></td>
          </tr>
       

        <cfinvoke  component="mochi.cfc.sampleProgress.SampleProgressGateway" method="getBySampleRequestId" returnvariable="SampleProgress">
            <cfinvokeargument name="id" value="#url.samplerequestid#"/>                
        </cfinvoke>
        
		<!--- check if there is beading --->
        <cfif sampleRequest.getBeading()>
        	
			<!--- check the beading status type --->
            <cfif SampleProgress.BeadingStatusID NEQ ''>
            
                <cfinvoke  component="mochi.cfc.beadingStatus.BeadingStatusGateway" method="getById" returnvariable="BeadingStatus">
                    <cfinvokeargument name="id" value="#SampleProgress.BeadingStatusID#"/>
                </cfinvoke>

				<cfset beadingStatus = BeadingStatus.getStatus()>
			
            <cfelse>                
            
				<cfset beadingStatus = "NO BEADING STATUS UPDATE">
            	
            </cfif>
			        
            <tr>
				<th>Beading Status</th>                
                <td><cfoutput>#beadingStatus#</cfoutput></td>                
            </tr>
            <tr>
				<th>Beading Updated By</th>                
                <td><cfoutput>#SampleProgress.BeadingUpdatedBy#</cfoutput></td>                
            </tr>
            <tr>
				<th>Beading Updated Date</th>                
                <td><cfoutput>#DateFormat(SampleProgress.BeadingUpdatedDate, 'full')#</cfoutput></td>                
            </tr>
            <tr>
				<th>Beading Approved By</th>                
                <td><cfoutput>#SampleProgress.BeadingApprovedBy#</cfoutput></td>                
            </tr>
            <tr>
				<th>Beading Approved Date</th>                
                <td><cfoutput>#DateFormat(SampleProgress.BeadingApprovedDate, 'full')#</cfoutput></td>                
            </tr>
		<cfelse>
       		<tr>
            	<th colspan="2">NO BEADING</th>
            </tr> 
                   
		</cfif>       	  

		<!--- check if there is fabric trim --->
        <cfif sampleRequest.getFabricTrim()>
        	
			<!--- check the fabric trim status type --->
            <cfif SampleProgress.FabricTrimStatusID NEQ ''>
            
                <cfinvoke  component="mochi.cfc.fabricTrimStatus.FabricTrimStatusGateway" method="getById" returnvariable="FabricTrimStatus">
                    <cfinvokeargument name="id" value="#SampleProgress.FabricTrimStatusID#"/>
                </cfinvoke>

				<cfset fabricTrimStatus = FabricTrimStatus.getStatus()>
			
            <cfelse>                
            
				<cfset fabricTrimStatus = "NO FABRIC TRIM STATUS UPDATE">
            	
            </cfif>
                    
            <tr>
				<th>Fabric Trim Status</th>                
                <td><cfoutput>#fabricTrimStatus#</cfoutput></td>                
            </tr>
            <tr>
				<th>Fabric Trim Updated By</th>                
                <td><cfoutput>#SampleProgress.FabricTrimUpdatedBy#</cfoutput></td>                
            </tr>
            <tr>
				<th>Fabric Trim Updated Date</th>                
                <td><cfoutput>#DateFormat(SampleProgress.FabricTrimUpdatedDate, 'full')#</cfoutput></td>                
            </tr>
            <tr>
				<th>Fabric Trim Approved By</th>                
                <td><cfoutput>#SampleProgress.FabricTrimApprovedBy#</cfoutput></td>                
            </tr>
            <tr>
				<th>Fabric Trim Approved Date</th>                
                <td><cfoutput>#DateFormat(SampleProgress.FabricTrimApprovedDate, 'full')#</cfoutput></td>                
            </tr>
		<cfelse>
       		<tr>
            	<th colspan="2">NO Fabric Trim</th>
            </tr> 
                   
		</cfif>       	  


		<!--- check if there is counter sample --->
        <cfif sampleRequest.getSampleTypeID() EQ 4 >

            <cfif SampleProgress.CounterSampleStatusID NEQ ''>
            
				<!--- check the counter sample status type --->
                <cfinvoke  component="mochi.cfc.counterSampleStatus.CounterSampleStatusGateway" method="getById" returnvariable="CounterSampleStatus">
                    <cfinvokeargument name="id" value="#SampleProgress.CounterSampleStatusID#"/>
                </cfinvoke>

				<cfset counterSampleStatus = CounterSampleStatus.getStatus()>
			
            <cfelse>                
            
				<cfset counterSampleStatus = "NO COUNTER SAMPLE STATUS UPDATE">
            	
            </cfif>
        	
        
            <tr>
				<th>Counter Sample Status</th>                
                <td><cfoutput>#counterSampleStatus#</cfoutput></td>                
            </tr>
            <tr>
				<th>Counter Sample Updated By</th>                
                <td><cfoutput>#SampleProgress.CounterSampleUpdatedBy#</cfoutput></td>                
            </tr>
            <tr>
				<th>Counter SampleUpdated Date</th>                
                <td><cfoutput>#DateFormat(SampleProgress.CounterSampleUpdatedDate, 'full')#</cfoutput></td>                
            </tr>
            <tr>
				<th>Counter Sample Approved By</th>                
                <td><cfoutput>#SampleProgress.CounterSampleApprovedBy#</cfoutput></td>                
            </tr>
            <tr>
				<th>Counter Sample Approved Date</th>                
                <td><cfoutput>#DateFormat(SampleProgress.CounterSampleApprovedDate, 'full')#</cfoutput></td>                
            </tr>
		<cfelse>
       		<tr>
            	<th colspan="2">NO Counter Sample</th>
            </tr> 
                   
		</cfif>       	  

          
          <tr>
            <th colspan="2">Images</th>      
          </tr>
          <cfoutput query="images">
              <tr>
                 <td colspan="2" align="center"><a href="/mochi/uploads/#Style.getStyleID()#/images/1/#Images.File#"><img src="/mochi/uploads/#Style.getStyleID()#/images/1/#Images.ThumbnailFile#" /></a></td>    
              </tr>
               <tr>
                 <td colspan="2" align="center">#Images.Description#</td>    
               </tr>
              
          </cfoutput>
        
          <tr>
            <th colspan="2">Videos</th>      
          </tr>
        
          <cfoutput query="videos">
              <tr>
                 <td colspan="2"><a href="../videos/show.cfm?videoid=#Videos.VideoID#&entityid=#sampleRequest.getSampleRequestID()#">#Videos.Description#</a></td>    
              </tr>      
          </cfoutput>
        </table>
        </cflayoutarea>    
        
        <!--- Second Tab is progress information if there is any --->
        
                        
        <cflayoutarea title="Progress">
        
        </cflayoutarea>
        
        <!--- Third Tab is shipment information if there is any --->
        <cflayoutarea title="Shipment">
        
        </cflayoutarea>
        
    </cflayout>

</cfif>