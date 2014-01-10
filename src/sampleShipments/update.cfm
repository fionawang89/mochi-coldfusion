<cfinclude template="../shared/header.cfm">

<cfif IsDefined("form.samplerequestid")>

	<!--- Get the sample request to update the status --->
    <cfinvoke  component="mochi.cfc.sampleRequests.SampleRequestGateway" method="getById" returnvariable="SampleRequest">
		<cfinvokeargument name="id" value="#form.samplerequestid#"/>
	</cfinvoke>
	

	<cfif form.shipmentStatus EQ 'IN-TRANSIT'>      
		<cfscript>
            SampleRequest.setRequestStatusID(5);
        </cfscript>
    <cfelse>
    	<cfscript>
            SampleRequest.setRequestStatusID(form.BeforeShipmentStatus);		
		</cfscript>
    </cfif>   

	<cfif form.receivedDate IS NOT ''>      
		<cfscript>
            SampleRequest.setRequestStatusID(8);			
        </cfscript>
        <cfset form.ReceivedBy = #GetAuthUser()#>
    <cfelse>
    	<cfscript>
            SampleRequest.setRequestStatusID(5);		
		</cfscript>
		<cfset form.ReceivedBy = ''>
    </cfif>   
    
    <cfinvoke  component="mochi.cfc.sampleRequests.SampleRequestGateway" method="save">
		<cfinvokeargument name="obj" value="#SampleRequest#"/>
	</cfinvoke>

    
	<cfinvoke  component="mochi.cfc.sampleShipments.SampleShipment" method="init" returnvariable="sampleShipment">
		<cfinvokeargument name="stValues" value="#form#"/>    	
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.sampleShipments.SampleShipmentGateway" method="save">
		<cfinvokeargument name="obj" value="#sampleShipment#"/>
	</cfinvoke>


	<cflocation url="/mochi/sampleRequests/show.cfm?samplerequestid=#form.samplerequestid#">
    
<cfelseif IsDefined("form.image")>
	
    
	<!--- Check if an image for this shipment already exist there should only be one image --->
    <cfquery name="qImage" datasource="#APPLICATION.DATASOURCE#">
    	DELETE 
        FROM Images
        WHERE EntityTypeID = 4
        AND   EntityID = #form.entityid#
    </cfquery>

	<!--- Save the image in the database --->
	<cfinvoke  component="mochi.cfc.images.ImageGateway" method="uploadImage" returnvariable="uploadImageRet">
        <cfinvokeargument name="entitytypeid" value="4"/>
        <cfinvokeargument name="entityid" value="#form.entityid#"/>
        <cfinvokeargument name="description" value="#form.description#"/>
        <cfinvokeargument name="image" value="#form.image#"/>
    </cfinvoke>
    

	<cflocation url="update.cfm?SampleRequestID=#form.entityid#">

<cfelseif IsDefined("url.samplerequestid")>

	<cfinvoke  component="mochi.cfc.sampleRequests.SampleRequestGateway" method="getById" returnvariable="sampleRequest">
		<cfinvokeargument name="id" value="#url.samplerequestid#"/>
	</cfinvoke>
    
    <cfinvoke  component="mochi.cfc.styles.StyleGateway" method="getById" returnvariable="Style">
		<cfinvokeargument name="id" value="#sampleRequest.getStyleID()#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.colors.ColorGateway" method="getById" returnvariable="Color">
		<cfinvokeargument name="id" value="#sampleRequest.getColorID()#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.sizes.SizeGateway" method="getById" returnvariable="Size">
		<cfinvokeargument name="id" value="#sampleRequest.getSizeID()#"/>
	</cfinvoke>


	<cfinvoke  component="mochi.cfc.sampleShipments.SampleShipmentGateway" method="getBySampleRequestId" returnvariable="sampleShipment">
		<cfinvokeargument name="id" value="#url.samplerequestid#"/>
	</cfinvoke>
    
    <cfinvoke  component="mochi.cfc.users.UserGateway" method="getAllAsQuery" returnvariable="users">
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.locations.LocationGateway" method="getAllAsQuery" returnvariable="locations">
	</cfinvoke>

    <cfinvoke  component="mochi.cfc.images.ImageGateway" method="getAllAsQueryByEntity" returnvariable="images">
        <cfinvokeargument name="entityTypeid" value="4"/>
        <cfinvokeargument name="entityId" value="#url.samplerequestid#"/>
    </cfinvoke>
	

<table>
 
	<cfform method="post">
	
          <tr>
            <th>Reference # :</th>
            <td><cfoutput>#sampleRequest.getReferenceNumber()#</cfoutput></td>
          </tr>
          <tr>
            <th>Style # :</th>
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
            <th>Ship To :</th>
            <td>
            	<cfselect query="locations" name="ShipTo" value="Location" display="Location" selected="#sampleShipment.ShipTo#"
                		  queryPosition="below" required="yes" message="Ship To information is required">
					<option value="">Select Ship To
                </cfselect>
            </td>
          </tr>
          <tr>
            <th>Ship From :</th>
            <td>
            	<cfselect query="locations" name="ShipFrom" value="Location" display="Location" selected="#sampleShipment.ShipFrom#"
                		  queryPosition="below" required="yes" message="Ship From information is required">
					<option value="">Select Ship From
                </cfselect>
            </td>
          </tr>
          <tr>
            <th>Attention To :</th>
            <td>
            	<cfselect query="users" name="AttentionTo" value="FirstName" display="FirstName" selected="#sampleShipment.AttentionTo#"
                		  queryPosition="below" required="yes" message="Attention To information is required">
					<option value="">Select Attention To
                </cfselect>
            </td>
          </tr>
          <tr>
            <th>Sender :</th>
            <td>
            	<cfselect query="users" name="Sender" value="FirstName" display="FirstName" selected="#sampleShipment.Sender#"
                		  queryPosition="below" required="yes" message="Sender information is required">
					<option value="">Select Sender
                </cfselect>
            </td>
          </tr>
          <tr>
            <th>Shipment Date :</th>
            <td>	
            	<cfinput type="datefield" name="shippedDate" value="#DateFormat(sampleShipment.ShippedDate, 'mm/dd/yyyy')#" required="yes" message="Shipment Date is required" validateat="onsubmit">
            </td>
          </tr>
          <tr>
            <th>Ship Via :</th>
            <td>
            	<cfinput type="text" name="shippedVia" value="#sampleShipment.ShippedVia#" required="yes" message="Shipped Via is required" validateat="onsubmit">
            </td>
          </tr>
          <tr>
            <th>Tracking Number :</th>
            <td>
            	<cfinput type="text" name="trackingNumber" value="#sampleShipment.trackingNumber#" required="yes" message="Tracking number is required" validateat="onsubmit">
            </td>
          </tr>
          <tr>
            <th>Shipment Status :</th>
            <td>
            	<cfselect name="shipmentStatus" selected="#sampleShipment.shipmentStatus#">
					<option value="IN-TRANSIT">IN-TRANSIT
					<option value="CANCELLED">CANCELLED                                    
                </cfselect>
            </td>
          </tr>
          <tr>
            <th>Received By :</th>
            <td>
				<cfoutput>#sampleShipment.RECEIVEDBY#</cfoutput>
            </td>
          </tr>
          <tr>
            <th>Received Date :</th>
            <td>	
            	<cfinput type="datefield" name="receivedDate" value="#DateFormat(sampleShipment.receivedDate, 'mm/dd/yyyy')#">
            </td>
          </tr>
          <tr>
            <th>Comments :</th>
            <td>
                    <cftextarea cols="50%" required="yes" name="Comments" validateat="onSubmit" value="#sampleShipment.Comments#"/>                      
            </td>
          </tr>
          <tr>
          	<th>Created By:</th>
            <td><cfoutput>#sampleShipment.CreatedBy#</cfoutput></td>
          </tr>
          <tr>
          	<th>Created Date:</th>
            <td><cfoutput>#DateFormat(sampleShipment.CreatedDate, 'full')#</cfoutput></td>
          </tr>
          <tr>
          	<th>Last Updated By:</th>
            <td><cfoutput>#sampleShipment.LastMaintainedBy#</cfoutput></td>
          </tr>
          <tr>
          	<th>Last Updated Date:</th>
            <td><cfoutput>#DateFormat(sampleShipment.LastMaintainedDate, 'full')#</cfoutput></td>
          </tr>
          <!--- if the shipment has been received already don't allow the information to be updated --->
	      <cfif sampleShipment.ReceivedDate IS ''>
              <tr>
                <td></td>
                <td><cfinput type="submit" name="submit" value="Update Shipment"></td>	
              </tr>
          <cfelse>
              <tr>
                <td colspan="2" bgcolor="#FFFF33"><b>THIS SAMPLE REQUEST HAS BEEN RECEIVED CREATE A NEW REQUEST TO SHIP ANOTHER SAMPLE</b></td>
              </tr>
              
		  </cfif>	                     
    
    	<cfif sampleShipment.sampleShipmentID IS ''>
        	<cfset sampleShipmentID=0>
        	<cfset createdby = "#GetAuthUser()#">
			<cfset createddate = "#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
        <cfelse>
        	<cfset sampleShipmentID="#sampleShipment.sampleShipmentID#">
        	<cfset createdby = "#sampleShipment.CreatedBy#">
            <cfset createddate = "#sampleShipment.CreatedDate#">    
        </cfif>
    
    	<cfif sampleShipment.BeforeShipmentStatus IS ''>        
	    	<cfinput type="hidden" name="BeforeShipmentStatus" value="#sampleRequest.getRequestStatusID()#">
        	
        <cfelse>
	    	<cfinput type="hidden" name="BeforeShipmentStatus" value="#sampleShipment.BeforeShipmentStatus#">
        </cfif>
    
        <cfinput type="hidden" name="createdby" value="#createdby#">
        <cfinput type="hidden" name="createddate" value="#createddate#">
        <cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
        <cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
          
        <cfinput type="hidden" name="sampleShipmentID" value="#sampleShipmentID#">  	
        <cfinput type="hidden" name="ReferenceNumber" value="#sampleRequest.getReferenceNumber()#">
        <cfinput type="hidden" name="samplerequestid" value="#url.samplerequestid#">

	</cfform>
    
    <cfform method="post" enctype="multipart/form-data">
    	<tr>
        	<th>Description :</th>           
			<td><cfinput type="text" name="description" required="yes" message="Image Description is required" validateat="onsubmit"></td>
    	</tr>    
    	<tr>
        	<th>Upload Image :</th>           
			<td><cfinput type="file" name="image"><cfinput type="submit" name="submit" value="Upload Image"></td>
    	</tr>
      <tr>  
        <th>Image :</th>
        <td><cfoutput><img src="/mochi/uploads/#Style.getStyleID()#/images/4/#images.ThumbnailFile#" /></cfoutput></td>
      </tr>
            
		<cfinput type="hidden" name="entityid" value="#url.samplerequestid#">
	</cfform>

</table>

	
<cfelse>

	<cflocation url="index.cfm">    
    
</cfif>



