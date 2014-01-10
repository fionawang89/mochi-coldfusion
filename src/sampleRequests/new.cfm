<cfinclude template="../shared/header.cfm">
<cfif IsUserInRole("admin")>
<cfif IsDefined("form.SampleRequestID")>

	<cfdump var="#form#"/>

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
    
	<cfinvoke  component="mochi.cfc.sampleRequests.SampleRequestGateway" method="save" returnvariable="savedSampleRequest">
		<cfinvokeargument name="obj" value="#sampleRequest#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.emails.Email" method="emailNewSampleRequest">
		<cfinvokeargument name="SampleRequest" value="#sampleRequest#"/>
	</cfinvoke>

	<cfquery name="qMaxSampleRequestID" datasource="#APPLICATION.DATASOURCE#">
    	SELECT MAX(SampleRequestID) as MaxSampleRequestID
        FROM SampleRequest 
    </cfquery>
    
    <!--- create a default sample progress here --->
    <cfset sampleProgressStruct = StructNew()>
    <cfset sampleProgressStruct.SampleProgressID = 0>
    <cfset sampleProgressStruct.SampleRequestID = #qMaxSampleRequestID.MaxSampleRequestID#>
    <cfset sampleProgressStruct.ReferenceNumber = #form.ReferenceNumber#>
    <cfset sampleProgressStruct.RequestReceived = 0>
    <cfset sampleProgressStruct.RequestReceivedBy = "">
    <cfset sampleProgressStruct.RequestReceivedDate = "">
    <cfset sampleProgressStruct.PlanDate = "">
    <cfset sampleProgressStruct.AssignedDate = "">
    <cfset sampleProgressStruct.StartDate = "">
    <cfset sampleProgressStruct.FinishedDate = "">
    <cfset sampleProgressStruct.ApprovedDate = "">
    <cfset sampleProgressStruct.PatternStatusID = 5>
    <cfset sampleProgressStruct.BeadingStatusID = 0>
    <cfset sampleProgressStruct.BeadingUpdatedDate = "">
    <cfset sampleProgressStruct.BeadingUpdatedBy = "">
    <cfset sampleProgressStruct.BeadingApprovedDate = "">
    <cfset sampleProgressStruct.BeadingApprovedBy = "">        
    <cfset sampleProgressStruct.FabricTrimStatusID = 0>
    <cfset sampleProgressStruct.FabricTrimUpdatedDate = "">
    <cfset sampleProgressStruct.FabricTrimUpdatedBy = "">
    <cfset sampleProgressStruct.FabricTrimApprovedDate = "">
    <cfset sampleProgressStruct.FabricTrimApprovedBy = "">    
    <cfset sampleProgressStruct.CounterSampleStatusID = 0>
    <cfset sampleProgressStruct.CounterSampleUpdatedDate = "">
    <cfset sampleProgressStruct.CounterSampleUpdatedBy = "">
    <cfset sampleProgressStruct.CounterSampleApprovedDate = "">
    <cfset sampleProgressStruct.CounterSampleApprovedBy = "">    
    <cfset sampleProgressStruct.Comments = "">
    <cfset sampleProgressStruct.CreatedBy = #form.CreatedBy#>
    <cfset sampleProgressStruct.CreatedDate = #form.CreatedDate#>
    <cfset sampleProgressStruct.LastMaintainedBy = #form.LastMaintainedBy#>
    <cfset sampleProgressStruct.LastMaintainedDate = #form.LastMaintainedDate#>
    
    <!--- save the sample progress --->
    <cfinvoke  component="mochi.cfc.sampleProgress.SampleProgress" method="init" returnvariable="sampleProgress">
		<cfinvokeargument name="stValues" value="#sampleProgressStruct#"/>
	</cfinvoke>

    <cfinvoke  component="mochi.cfc.sampleProgress.SampleProgressGateway" method="save">
		<cfinvokeargument name="obj" value="#sampleProgress#"/>
	</cfinvoke>

    <cflocation url="index.cfm">

</cfif>
	
	<!--- Create a reference number --->
    <cfquery name="qReferenceNumber" datasource="#application.datasource#">
    	SELECT MAX(ReferenceNumber) as MaxReferenceNumber
		FROM SampleRequest
    </cfquery>
    
    <cfif qReferenceNumber.MaxReferenceNumber IS NOT ''>
    	<cfset referenceNumber = qReferenceNumber.MaxReferenceNumber + 1>
    <cfelse>
    	<cfset referenceNumber = 1>        
    </cfif>
    
    <cfinvoke  component="mochi.cfc.styles.StyleGateway" method="getAllAsQuery" returnvariable="styles">
	</cfinvoke>


	<cfinvoke  component="mochi.cfc.colors.ColorGateway" method="getAllAsQuery" returnvariable="colors">
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.sizes.SizeGateway" method="getAllAsQuery" returnvariable="sizes">
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.customers.CustomerGateway" method="getAllAsQuery" returnvariable="customers">
	</cfinvoke>


    <cfinvoke  component="mochi.cfc.locations.LocationGateway" method="getAllAsQuery" returnvariable="locations">
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.years.YearGateway" method="getAllAsQuery" returnvariable="years">
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.deliveries.DeliveryGateway" method="getAllAsQuery" returnvariable="deliveries">
	</cfinvoke>	
	
    <cfinvoke  component="mochi.cfc.collections.CollectionGateway" method="getAllAsQuery" returnvariable="collections">
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.sampleTypes.SampleTypeGateway" method="getAllAsQuery" returnvariable="sampleTypes">
	</cfinvoke>
    
    <cfinvoke  component="mochi.cfc.contractors.ContractorGateway" method="getAllAsQuery" returnvariable="contractors">
	</cfinvoke>

	
	<cfform method="post">
	
	<table width="333" border="1" align="left">
	  <tr>
	    <th width="149" scope="row">Reference # :</th>
	    <td width="168"><cfoutput>#referenceNumber#</cfoutput></td>
	  </tr>
	  <tr>          
	<cfif IsDefined("url.styleid")>
          <tr>
            <th width="149" scope="row">Style Number :</th>
            <td width="168">
                <cfselect id="styleid" name="styleid" query="styles" value="StyleID" display="StyleName" queryPosition="below"
                          required="yes" message="Style Number is required" selected="#url.styleid#">
                    <option value="">Select Style
                </cfselect> 
            </td>
          </tr>
    <cfelse>
          <tr>
            <th width="149" scope="row">Style Number :</th>
            <td width="168">
                <cfselect id="styleid" name="styleid" query="styles" value="StyleID" display="StyleName" queryPosition="below"
                          required="yes" message="Style Number is required">
                    <option value="">Select Style
                </cfselect> 
            </td>
          </tr>          
	</cfif>          
      	  <tr>
	    <th scope="row">Color :</th>
	    <td>
        	<cfselect id="colorid" name="colorid" query="colors" value="ColorID" display="ColorName" queryPosition="below"
            		  required="yes" message="Color is required">
            	<option value="0">Select Color
            </cfselect> 
	    </td>
	  </tr>
	  <tr>
	    <th scope="row">Size :</th>
	    <td>
        	<cfselect id="sizeid" name="sizeid" query="sizes" value="SizeID" display="Size" queryPosition="below" required="yes" 
            		 message="Size is required">
            	<option value="">Select Size
            </cfselect> 
	    </td>
	  </tr>
	  <tr>
	    <th scope="row">Quantity :</th>
	    <td>
		    	<cfinput required="true" type="text" name="quantity" id="quantity" validate="integer" validateat="onSubmit"
		    			 message="Quantity is required">
	    </td>
	  </tr>
      <tr>
         <th scope="row">Has Order :</th>
         <td>
          	<cfinput type="checkbox" name="hasOrder"/>
        </td>
     </tr>      
	  <tr>
	    <th scope="row">Sample Type :</th>
	    <td>
        	<cfselect id="sampleTypeID" name="sampleTypeID" query="sampleTypes" value="sampleTypeID" display="sampleType" queryPosition="below" required="yes" 
            		 message="Sample Type is required">
            	<option value="">Select Sample Type
           </cfselect> 
	    </td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Collection :</th>
	    <td width="168">
        	<cfselect id="collectionid" name="collectionid" query="collections" value="collectionid" display="Collection" queryPosition="below"
            		  required="yes" message="Collection is required">
            	<option value="">Select Collection
            </cfselect> 
	    </td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Year :</th>
	    <td width="168">
        	<cfselect id="yearid" name="yearid" query="years" value="yearid" display="Year" queryPosition="below"
            		  required="yes" message="Year is required">
            	<option value="">Select Year
            </cfselect> 
	    </td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Delivery :</th>
	    <td width="168">
        	<cfselect id="deliveryid" name="deliveryid" query="deliveries" value="deliveryid" display="Delivery" queryPosition="below"
            		  required="yes" message="Delivery is required">
            	<option value="">Select Delivery
            </cfselect> 
	    </td>
	  </tr>
	  <tr>
	    <th scope="row">Customers :</th>
	    <td>
        	<cfselect id="customer" name="customer" query="customers" value="Customer" display="Customer" queryPosition="below">
            	<option value="">Select Customer
            </cfselect> 
	    </td>
	  </tr>
	  <tr>
	    <th scope="row">Comments :</th>
	    <td>
        		<cftextarea cols="50%" required="yes" name="comments" validateat="onSubmit" message="Comments is required">
				</cftextarea>                            
	    </td>
	  </tr>
	  <tr>
	    <th scope="row">Requested By :</th>
	    <td>
		    	<cfselect required="true" query="locations" name="requestedby" id="requestedby" value="Location" display="Location" queryPosition="below">
                	<option value="">Select Requested By
                </cfselect>
	    </td>
	  </tr>
	  <tr>
	    <th scope="row">Requested For :</th>
	    <td>
		    	<cfselect required="true" query="locations" name="requestedfor" id="requestedfor" value="Location" display="Location" queryPosition="below">
                	<option value="">Select Requested For
                </cfselect> 
	    </td>
	  </tr>	  
	  <tr>
	    <th scope="row">Request Date :</th>
	    <td>
		    	<cfinput type="datefield" required="true" name="requestdate" id="requestdate" validateat="onSubmit"
		    			 value="#Now()#" message="Request date is required">
	    </td>
	  </tr>
	  <tr>
	    <th scope="row">Due Date :</th>
	    <td>
		    	<cfinput  type="datefield" required="true" name="duedate" id="duedate" validateat="onSubmit"
		    			  message="Due date is required">
	    </td>
	  </tr>
	  <tr>
	    <th scope="row">Make In :</th>
	    <td>
		    	<cfselect required="true" name="MakeIn">
					<option value="">Select Make In
                	<option value="CHINA">CHINA
                	<option value="LA">LA
                </cfselect> 
	    </td>
	  </tr>	  
	  <tr>
	    <th scope="row">Pattern Due Date :</th>
	    <td>
		    	<cfinput  type="datefield"  name="patternduedate" id="patternduedate">
	    </td>
	  </tr>
	  <tr>
	    <th scope="row">Contractor :</th>
	    <td>
		    	<cfselect required="true" query="contractors" name="ContractorID" id="ContractorID" value="ContractorID" display="Contractor" queryPosition="below">
                	<option value="0">Select Contractor
                </cfselect> 
	    </td>
	  </tr>	  
	  <tr>
	    <th scope="row">Deadline to Contractor :</th>
	    <td>
		    	<cfinput  type="datefield" name="DeadlineToContractor" id="DeadlineToContractor">
	    </td>
	  </tr>
	  <tr>
	    <th scope="row">Received Date :</th>
	    <td>
		    	<cfinput  type="datefield" name="receiveddate">
	    </td>
	  </tr>
      
      
      <!--- enter new fields here --->
      

      <tr>
         <th scope="row">Beading :</th>
         <td>
          	<cfinput type="checkbox" name="Beading"/>
        </td>
     </tr>      
	  <tr>
	    <th scope="row">Beading Design Due Date :</th>
	    <td>
		    	<cfinput  type="datefield" name="BeadingStartDate" id="BeadingStartDate">
	    </td>
	  </tr>
	  <tr>
	    <th scope="row">Beading Due Date :</th>
	    <td>
		    	<cfinput  type="datefield" name="BeadingDueDate" id="BeadingDueDate">
	    </td>
	  </tr>


      <tr>
         <th scope="row">Fabric Trim :</th>
         <td>
          	<cfinput type="checkbox" name="FabricTrim"/>
        </td>
     </tr>      
	  <tr>
	    <th scope="row">Fabric Trim Design Due Date :</th>
	    <td>
		    	<cfinput  type="datefield" name="FabricTrimStartDate" id="FabricTrimStartDate">
	    </td>
	  </tr>
	  <tr>
	    <th scope="row">Fabric Trim Due Date :</th>
	    <td>
		    	<cfinput  type="datefield" name="FabricTrimDueDate" id="FabricTrimDueDate">
	    </td>
	  </tr>
      
      <tr>
         <th scope="row">Counter Sample :</th>
         <td>
          	<cfinput type="checkbox" name="CounterSample"/>
        </td>
     </tr>      
	  <tr>
	    <th scope="row">Counter Sample Start Date :</th>
	    <td>
		    	<cfinput  type="datefield" name="CounterSampleStartDate" id="CounterSampleStartDate">
	    </td>
	  </tr>
	  <tr>
	    <th scope="row">Counter Sample Due Date :</th>
	    <td>
		    	<cfinput  type="datefield" name="CounterSampleDueDate" id="CounterSampleDueDate">
	    </td>
	  </tr>

      <!--- end enter new fields here --->
      
      
	  <tr>
		<td colspan="2" align="right"><cfinput type="submit" name="submit" value="Create Request"></td>	
	 </tr>
	</table>

	<!--- automatically generated reference number --->	
    <cfinput type="hidden" name="requestSubmitted" value="1">
	
	<!--- automatically generated reference number --->
	<cfinput type="hidden" name="ReferenceNumber" value="#referenceNumber#">


	<!--- default request status value open for newly created request --->
    <cfinput type="hidden" name="requestStatusID" value="3">

	<!--- default information for cancellation information --->
    <cfinput type="hidden" name="CancellationDate" value="">
    <cfinput type="hidden" name="CancelledBy" value="">


	<cfinput type="hidden" name="SampleRequestID" value="0">  	    
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">  	
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">  	
	
	</cfform>
<cfelse>
	<h4>Access Denied</h4>
</cfif>	
