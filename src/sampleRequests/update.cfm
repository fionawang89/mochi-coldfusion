<cfinclude template="../shared/header.cfm">

<cfif IsUserInRole("admin") OR IsUserInRole("sales")> 

	<cfif IsDefined("form.samplerequestid")>

		<!--- First to check if the request is being cancelled --->
        <cfif form.OriginalRequestStatusID EQ 4 AND form.OriginalRequestStatusID NEQ form.RequestStatusID>
        	<cfset form.CancellationDate = ''>	
        	<cfset form.CancelledBy = ''>	
        <cfelseif form.RequestStatusID EQ 4>
        	<!--- set date of cancellation and user information --->
        	<cfset form.CancellationDate = "#DateFormat(CreateODBCDate(Now()), 'mm/dd/yyyy')#">	
        	<cfset form.CancelledBy = "#GetAuthUser()#">
            <!--- send email to notify cancellation --->
            <cfinvoke  component="mochi.cfc.emails.Email" method="emailCancelledSampleRequest">
                <cfinvokeargument name="sampleRequestID" value="#form.sampleRequestID#"/>
                <cfinvokeargument name="cancellationDate" value="#form.CancellationDate#"/>
                <cfinvokeargument name="cancelledBy" value="#form.CancelledBy#"/>
			</cfinvoke>
        <cfelseif form.OriginalRequestStatusID EQ 4 AND form.OriginalRequestStatusID EQ form.RequestStatusID>
            <!--- do nothing --->
        </cfif>

		<!--- if the has order check box is selected --->
        <cfif IsDefined("form.hasOrder")>
            <cfset form.hasOrder=1/>
        <cfelse>
            <cfset form.hasOrder=0 />
        </cfif>
        
		<!--- if the beading check box is selected --->
        <cfif IsDefined("form.Beading")>
            <cfset form.Beading=1/>
        <cfelse>
            <cfset form.Beading=0 />
        </cfif>
    
        <!--- if the has FabricTrim check box is selected --->
        <cfif IsDefined("form.FabricTrim")>
            <cfset form.FabricTrim=1/>
        <cfelse>
            <cfset form.FabricTrim=0 />
        </cfif>
    
		<!--- if this a production sample update the countersample --->
        <cfif form.SampleTypeID EQ 4>
            <cfset form.CounterSample=1/>
        <cfelse>
            <cfset form.CounterSample=0 />
        </cfif>
          
        <cfinvoke  component="mochi.cfc.sampleRequests.SampleRequest" method="init" returnvariable="sampleRequest">
            <cfinvokeargument name="stValues" value="#form#"/>
        </cfinvoke>
    
        <cfinvoke  component="mochi.cfc.sampleRequests.SampleRequestGateway" method="save">
            <cfinvokeargument name="obj" value="#sampleRequest#"/>
        </cfinvoke>
    
    
        <cflocation url="../sampleProgress/update.cfm?samplerequestid=#form.samplerequestid#">
        
    <cfelseif IsDefined("url.samplerequestid")>
    
        <cfinvoke  component="mochi.cfc.sampleRequests.SampleRequestGateway" method="getById" returnvariable="sampleRequest">
            <cfinvokeargument name="id" value="#url.samplerequestid#"/>
        </cfinvoke>
    
    <cfelse>
        <cflocation url="index.cfm">    
    </cfif>
    
    
        <cfinvoke  component="mochi.cfc.styles.StyleGateway" method="getAllAsQuery" returnvariable="styles">
        </cfinvoke>
    
        <cfinvoke  component="mochi.cfc.colors.ColorGateway" method="getAllAsQuery" returnvariable="colors">
        </cfinvoke>
        
        <cfinvoke  component="mochi.cfc.sizes.SizeGateway" method="getAllAsQuery" returnvariable="sizes">
        </cfinvoke>
    
        <cfinvoke  component="mochi.cfc.collections.CollectionGateway" method="getAllAsQuery" returnvariable="collections">
        </cfinvoke>
    
        <cfinvoke  component="mochi.cfc.years.YearGateway" method="getAllAsQuery" returnvariable="years">
        </cfinvoke>

		<cfinvoke  component="mochi.cfc.deliveries.DeliveryGateway" method="getAllAsQuery" returnvariable="deliveries">
		</cfinvoke>
		
        <cfinvoke  component="mochi.cfc.sampleTypes.SampleTypeGateway" method="getAllAsQuery" returnvariable="sampleTypes">
        </cfinvoke>
    
        <cfinvoke  component="mochi.cfc.customers.CustomerGateway" method="getAllAsQuery" returnvariable="customers">
        </cfinvoke>
    
        
        <cfinvoke  component="mochi.cfc.locations.LocationGateway" method="getAllAsQuery" returnvariable="locations">
        </cfinvoke>
    
 		<cfinvoke  component="mochi.cfc.contractors.ContractorGateway" method="getAllAsQuery" returnvariable="contractors">
		</cfinvoke>
   
    	<cfinvoke  component="mochi.cfc.requestStatus.RequestStatusGateway" method="getAllAsQuery" returnvariable="requestStatus">
		</cfinvoke>
        
        
        <!--- fixed on how to display make in information in the drop down --->
        <cfquery name="makeInLocations" datasource="#APPLICATION.DATASOURCE#">
        	SELECT DISTINCT MakeIn
            FROM SampleRequest        
        </cfquery>
    
    
        <cfform method="post">
        
        <table width="333" border="1" align="left">
          <tr>
            <th width="149" scope="row">Reference # :</th>
            <td width="168"><cfoutput>#sampleRequest.getReferenceNumber()#</cfoutput></td>
          </tr>
          <tr>
            <th width="149" scope="row">Style Number :</th>
            <td width="168">
                <cfselect name="StyleID" query="styles" value="styleid" display="StyleName" selected="#sampleRequest.getStyleID()#" required="yes" message="Style Number is required"></cfselect>
            </td>
          </tr>
          <tr>
            <th scope="row">Color :</th>
            <td>
                <cfselect name="ColorID" query="colors" value="colorid" display="ColorName" selected="#sampleRequest.getColorID()#" required="yes" message="Color is required"></cfselect>
            </td>
          </tr>
          <tr>
            <th scope="row">Size :</th>
            <td>
                <cfselect name="SizeID" query="sizes" value="sizeid" display="Size" selected="#sampleRequest.getSizeID()#" required="yes" 
            		 message="Size is required"></cfselect>
            </td>
          </tr>
          <tr>
            <th scope="row">Quantity :</th>
            <td>
                    <cfinput type="text" name="Quantity" id="quantity" validate="integer" validateat="onSubmit"
                             value="#sampleRequest.getQuantity()#" required="yes" message="Quantity is required">
            </td>
          </tr>
          <tr>
            <th scope="row">Has Order :</th>
            <td>
            	<cfinput type="checkbox" name="hasOrder" checked="#IIF(sampleRequest.gethasOrder() EQ 0, DE(0), DE(1))#" />
            </td>
          </tr>
          <tr>
            <th scope="row">Sample Type :</th>
            <td>
                <cfselect name="SampleTypeID" query="sampleTypes" value="SampleTypeID" display="SampleType" selected="#sampleRequest.getSampleTypeID()#" required="yes" 
            		 message="Sample Type is required"></cfselect>
            </td>
          </tr>
          <tr>
            <th scope="row">Collection :</th>
            <td>
                <cfselect name="CollectionID" query="collections" value="collectionID" display="Collection" selected="#sampleRequest.getCollectionID()#" required="yes" message="Collection is required"></cfselect>
            </td>
          </tr>
          <tr>
            <th width="149" scope="row">Year :</th>
            <td width="168">
                <cfselect id="yearid" name="yearid" query="years" value="yearid" display="Year" selected="#sampleRequest.getYearID()#" 
                          required="yes" message="Year is required">
                </cfselect> 
            </td>
          </tr>
		  <tr>
		    <th width="149" scope="row">Delivery :</th>
		    <td width="168">
	        	<cfselect id="deliveryid" name="deliveryid" query="deliveries" value="deliveryid" display="Delivery" selected="#sampleRequest.getDeliveryID()#" required="yes" message="Delivery is required"></cfselect>
		    </td>
		  </tr>
          <tr>
            <th scope="row">Customer :</th>
            <td>
                <cfselect name="Customer" query="customers" value="Customer" display="Customer" selected="#sampleRequest.getCustomer()#" queryPosition="below">
                	<OPTION value="">SELECT CUSTOMER
                </cfselect>
            </td>
          </tr>
          <tr>
            <th scope="row">Comments :</th>
            <td>
                    <cftextarea cols="50%" required="yes" name="Comments" validateat="onSubmit" message="Comments is required" value="#sampleRequest.getComments()#"/>                      
            </td>
          </tr>
          <tr>
            <th scope="row">Requested By :</th>
            <td>
                    <cfselect required="true" query="locations" name="RequestedBy" id="requestedby" value="Location" display="Location"
                              selected="#sampleRequest.getRequestedBy()#"></cfselect>
            </td>
          </tr>
          <tr>
            <th scope="row">Requested For :</th>
            <td>
                    <cfselect required="true" query="locations" name="RequestedFor" id="requestedfor" value="Location" display="Location"
                              selected="#sampleRequest.getRequestedFor()#"></cfselect> 
            </td>
          </tr>	  
          <tr>
            <th scope="row">Request Date :</th>
            <td>
                    <cfinput type="datefield" required="true" name="RequestDate" id="requestdate" validateat="onSubmit"
                             value="#DateFormat(sampleRequest.getRequestDate(), 'm/d/yyyy')#" message="Sample Request date is required">
            </td>
          </tr>
          <tr>
            <th scope="row">Due Date :</th>
            <td>
                    <cfinput  type="datefield" required="true" name="DueDate" id="duedate" validateat="onSubmit"
                              value="#DateFormat(sampleRequest.getDueDate(), 'm/d/yyyy')#" message="Due date is required">
            </td>
          </tr>
          <tr>
            <th scope="row">Make In :</th>
            <td>
                    <cfselect query="makeInLocations" required="true" name="MakeIn" value="MakeIn" display="MakeIn" selected="#sampleRequest.getMakeIn()#">
                    </cfselect> 
            </td>
          </tr>	  
          <tr>
            <th scope="row">Pattern Due Date :</th>
            <td>
                    <cfinput  type="datefield" name="PatternDueDate" id="PatternDueDate" 
                              value="#DateFormat(sampleRequest.getPatternDueDate(), 'm/d/yyyy')#">
            </td>
          </tr>
          <tr>
            <th scope="row">Contractor :</th>
            <td>
                    <cfselect required="true" query="contractors" name="ContractorID" id="ContractorID" value="ContractorID" display="Contractor" queryPosition="below"
                    		  selected="#sampleRequest.getContractorID()#">
                    	<option value="0">Select a Contractor</option>
                    </cfselect> 
            </td>
          </tr>	  
          <tr>
            <th scope="row">Deadline to Contractor :</th>
            <td>
                    <cfinput  type="datefield" name="DeadlineToContractor" id="DeadlineToContractor" value="#DateFormat(sampleRequest.getDeadlineToContractor(), 'm/d/yyyy')#">
            </td>
          </tr>
          <tr>
            <th scope="row">Received Date :</th>
            <td>
                    <cfinput  type="datefield" name="ReceivedDate" id="ReceivedDate" value="#DateFormat(sampleRequest.getReceivedDate(), 'm/d/yyyy')#">
            </td>
          </tr>
          <tr>
            <th scope="row">Status :</th>
            <td>
                    <cfselect query="requestStatus" name="RequestStatusID" id="RequestStatusID" value="RequestStatusID" display="Status"
                               selected="#sampleRequest.getRequestStatusID()#"></cfselect> 
            </td>
          </tr>
          
      <!--- enter new fields here --->
      

      <tr>
         <th scope="row">Beading :</th>
         <td>
          	<cfinput type="checkbox" name="Beading" checked="#IIF(sampleRequest.getBeading() EQ 0, DE(0), DE(1))#" />
        </td>
     </tr>      
	  <tr>
	    <th scope="row">Beading Design Due Date :</th>
	    <td>
		    	<cfinput  type="datefield" name="BeadingStartDate" id="BeadingStartDate" value="#DateFormat(sampleRequest.getBeadingStartDate(), 'm/d/yyyy')#">
	    </td>
	  </tr>
	  <tr>
	    <th scope="row">Beading Due Date :</th>
	    <td>
		    	<cfinput  type="datefield" name="BeadingDueDate" id="BeadingDueDate" value="#DateFormat(sampleRequest.getBeadingDueDate(), 'm/d/yyyy')#">
	    </td>
	  </tr>


      <tr>
         <th scope="row">Fabric Trim :</th>
         <td>
          	<cfinput type="checkbox" name="FabricTrim" checked="#IIF(sampleRequest.getFabricTrim() EQ 0, DE(0), DE(1))#" />
        </td>
     </tr>      
	  <tr>
	    <th scope="row">Fabric Trim Design Due Date :</th>
	    <td>
		    	<cfinput  type="datefield" name="FabricTrimStartDate" id="FabricTrimStartDate" value="#DateFormat(sampleRequest.getFabricTrimStartDate(), 'm/d/yyyy')#">
	    </td>
	  </tr>
	  <tr>
	    <th scope="row">Fabric Trim Due Date :</th>
	    <td>
		    	<cfinput  type="datefield" name="FabricTrimDueDate" id="FabricTrimDueDate" value="#DateFormat(sampleRequest.getFabricTrimDueDate(), 'm/d/yyyy')#">
	    </td>
	  </tr>
      
      <tr>
         <th scope="row">Counter Sample :</th>
         <td>
          	<cfinput type="checkbox" name="CounterSample" checked="#IIF(sampleRequest.getCounterSample() EQ 0, DE(0), DE(1))#"/>
        </td>
     </tr>      
	  <tr>
	    <th scope="row">Counter Sample Start Date :</th>
	    <td>
		    	<cfinput  type="datefield" name="CounterSampleStartDate" id="CounterSampleStartDate" value="#DateFormat(sampleRequest.getCounterSampleStartDate(), 'm/d/yyyy')#">
	    </td>
	  </tr>
	  <tr>
	    <th scope="row">Counter Sample Due Date :</th>
	    <td>
		    	<cfinput  type="datefield" name="CounterSampleDueDate" id="CounterSampleDueDate" value="#DateFormat(sampleRequest.getCounterSampleDueDate(), 'm/d/yyyy')#">
	    </td>
	  </tr>

      <!--- end enter new fields here --->
      

          
          <tr>
            <td colspan="2" align="right"><cfinput type="submit" name="submit" value="Update Request"></td>	
         </tr>
        </table>
        
        <!--- original request status id to check if this was cancelled --->
        <cfinput type="hidden" name="OriginalRequestStatusID" value="#sampleRequest.getRequestStatusID()#">

		<!--- information for cancellation information --->
        <cfinput type="hidden" name="CancellationDate" value="#sampleRequest.getCancellationDate()#">
        <cfinput type="hidden" name="CancelledBy" value="#sampleRequest.getCancelledBy()#">
        
    
        <cfinput type="hidden" name="createdby" value="#sampleRequest.getCreatedBy()#">
        <cfinput type="hidden" name="createddate" value="#sampleRequest.getCreatedDate()#">
        <cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
        <cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
          
        <cfinput type="hidden" name="SampleRequestID" value="#sampleRequest.getSampleRequestID()#">  	
        <cfinput type="hidden" name="ReferenceNumber" value="#sampleRequest.getReferenceNumber()#">
        <cfinput type="hidden" name="RequestSubmitted" value="#sampleRequest.getRequestSubmitted()#">
    
    </cfform>
<cfelse>
	<h1>Access Denied</h1>    
</cfif>