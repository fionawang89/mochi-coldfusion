<cfinclude template="../shared/header.cfm">

<cfif IsDefined("form.SampleRequestID")>

		<!--- if the has order check box is selected --->
        <cfif IsDefined("form.hasOrder")>
            <cfset form.hasOrder=1/>
        <cfelse>
            <cfset form.hasOrder=0 />
        </cfif>

	<cfinvoke  component="mochi.cfc.sampleRequests.SampleRequest" method="init" returnvariable="sampleRequest">
    	<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

    
	<cfinvoke  component="mochi.cfc.sampleRequests.SampleRequestGateway" method="save" returnvariable="savedSampleRequest">
		<cfinvokeargument name="obj" value="#sampleRequest#"/>
	</cfinvoke>
    
    <!--- change the status of the resubmitted request to resubmit --->
	<cfinvoke  component="mochi.cfc.sampleRequests.SampleRequestGateway" method="getById" returnvariable="OldSampleRequest">
		<cfinvokeargument name="id" value="#form.OldSampleRequestID#"/>
	</cfinvoke>

	<cfscript>
		OldSampleRequest.setRequestStatusID(9);
	</cfscript>

	<cfinvoke  component="mochi.cfc.sampleRequests.SampleRequestGateway" method="save">
		<cfinvokeargument name="obj" value="#OldSampleRequest#"/>
	</cfinvoke>
    
    
    <cflocation url="index.cfm">
    
<cfelseif IsDefined("url.samplerequestid")>

	<cfinvoke  component="mochi.cfc.sampleRequests.SampleRequestGateway" method="getById" returnvariable="SampleRequest">
		<cfinvokeargument name="id" value="#url.samplerequestid#"/>
	</cfinvoke>
    
    <cfinvoke  component="mochi.cfc.styles.StyleGateway" method="getById" returnvariable="Style">
		<cfinvokeargument name="id" value="#SampleRequest.getStyleID()#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.colors.ColorGateway" method="getById" returnvariable="Color">
		<cfinvokeargument name="id" value="#SampleRequest.getColorID()#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.sizes.SizeGateway" method="getById" returnvariable="Size">
		<cfinvokeargument name="id" value="#SampleRequest.getSizeID()#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.sampleTypes.SampleTypeGateway" method="getById" returnvariable="SampleType">
		<cfinvokeargument name="id" value="#SampleRequest.getSampleTypeID()#"/>
	</cfinvoke>

    <cfinvoke  component="mochi.cfc.collections.CollectionGateway" method="getById" returnvariable="Collection">
		<cfinvokeargument name="id" value="#SampleRequest.getCollectionID()#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.years.YearGateway" method="getAllAsQuery" returnvariable="years">
	</cfinvoke>


	<cfinvoke  component="mochi.cfc.deliveries.DeliveryGateway" method="getAllAsQuery" returnvariable="deliveries">
	</cfinvoke>

	<cfform method="post">
	<table width="333" border="1" align="left">
	  <tr>
	    <th width="149" scope="row">Reference # :</th>
	    <td width="168">
        	<cfoutput>#SampleRequest.getReferenceNumber()#</cfoutput>
        </td>
	  </tr>
	  <tr>
	  <tr>
	    <th width="149" scope="row">Style Number :</th>
	    <td width="168">
        	<cfoutput>#Style.getStyleName()#</cfoutput>
	    </td>
	  </tr>
	  <tr>
	    <th scope="row">Color :</th>
	    <td>
			<cfoutput>#Color.getColorCode()#</cfoutput>
	    </td>
	  </tr>
	  <tr>
	    <th scope="row">Size :</th>
	    <td>
			<cfoutput>#Size.getSize()#</cfoutput>
	    </td>
	  </tr>
	  <tr>
	    <th scope="row">Quantity :</th>
	    <td>
        	<cfoutput>#SampleRequest.getQuantity()#</cfoutput>
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
        	<cfoutput>#SampleType.getSampleType()#</cfoutput>
	    </td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Collection :</th>
	    <td width="168">
        	<cfoutput>#Collection.getCollection()#</cfoutput>
	    </td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Year :</th>
	    <td width="168">
        	<cfselect id="yearid" name="yearid" query="years" value="yearid" display="Year" queryPosition="below"
            		  required="yes" message="Year is required" selected="#SampleRequest.getYearID()#">
            	<option value="">Select Year
            </cfselect> 
	    </td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Delivery :</th>
	    <td width="168">
        	<cfselect id="deliveryid" name="deliveryid" query="deliveries" value="deliveryid" display="Delivery" queryPosition="below"
            		  required="yes" message="Delivery is required" selected="#SampleRequest.getDeliveryID()#">
            	<option value="">Select Delivery
            </cfselect> 
	    </td>
	  </tr>
	  <tr>
	    <th scope="row">Customers :</th>
	    <td>
        	<cfoutput>#SampleRequest.getCustomer()#</cfoutput>
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
        	<cfoutput>#SampleRequest.getRequestedBy()#</cfoutput>        	
	    </td>
	  </tr>
	  <tr>
	    <th scope="row">Requested For :</th>
	    <td>
        	<cfoutput>#SampleRequest.getRequestedFor()#</cfoutput>        	
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
	  <tr>
		<td colspan="2" align="right"><cfinput type="submit" name="submit" value="Resubmit Request"></td>	
	 </tr>
	</table>

	<!--- Create a request submit number --->
    <cfquery name="qRequestSubmitted" datasource="#application.datasource#">
    	SELECT MAX(RequestSubmitted) as MaxRequestSubmitted
		FROM SampleRequest
        WHERE ReferenceNumber = #SampleRequest.getReferenceNumber()#
    </cfquery>
    
    <cfif qRequestSubmitted.MaxRequestSubmitted IS NOT ''>
    	<cfset requestSubmitted = qRequestSubmitted.MaxRequestSubmitted + 1>
    <cfelse>
    	<cfset requestSubmitted = 2>        
    </cfif>

    <cfinput type="hidden" name="RequestSubmitted" value="#requestSubmitted#">
	
    
    <!--- Default values that from original Sample Request --->
    <cfinput type="hidden" name="ReferenceNumber" value="#SampleRequest.getReferenceNumber()#">
    <cfinput type="hidden" name="StyleID" value="#SampleRequest.getStyleID()#">
    <cfinput type="hidden" name="ColorID" value="#SampleRequest.getColorID()#">
    <cfinput type="hidden" name="SizeID" value="#SampleRequest.getSizeID()#">
    <cfinput type="hidden" name="CancellationDate" value="">
    <cfinput type="hidden" name="CancelledBy" value="">
	<cfinput type="hidden" name="ContractorID" value="#SampleRequest.getContractorID()#">
    <cfinput type="hidden" name="Quantity" value="#SampleRequest.getQuantity()#">
    <cfinput type="hidden" name="SampleTypeID" value="#SampleRequest.getSampleTypeID()#">
    <cfinput type="hidden" name="CollectionID" value="#SampleRequest.getCollectionID()#">
    <cfinput type="hidden" name="Customer" value="#SampleRequest.getCustomer()#">
    <cfinput type="hidden" name="RequestedBy" value="#SampleRequest.getRequestedBy()#">
    <cfinput type="hidden" name="RequestedFor" value="#SampleRequest.getRequestedFor()#">
    

	<!--- default request status value open for newly created request --->
    <cfinput type="hidden" name="requestStatusID" value="3">

	<cfinput type="hidden" name="SampleRequestID" value="0">  	    
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">  	
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">  	
	
    <!--- request id that needs to be resubmitted --->
    <cfinput type="hidden" name="OldSampleRequestID" value="#SampleRequest.getSampleRequestID()#">
    
	</cfform>

<cfelse>

	<cflocation url="index.cfm">

</cfif>
	
