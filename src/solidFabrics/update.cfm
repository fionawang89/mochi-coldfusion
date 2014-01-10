<cfinclude template="../shared/header.cfm">

<cfif IsDefined("form.fabricrequestid")>


	<!--- update the fabric request in the database --->
    <cfinvoke  component="mochi.cfc.fabricRequests.FabricRequest" method="init" returnvariable="FabricRequest">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.fabricRequests.FabricRequestGateway" method="save">
		<cfinvokeargument name="obj" value="#FabricRequest#"/>
	</cfinvoke>
                        
	<cflocation url="show.cfm?fabricrequestid=#form.fabricrequestid#">

    
<cfelseif IsDefined("url.fabricrequestid")>

	<cfinvoke  component="mochi.cfc.fabricRequests.FabricRequestGateway" method="getById" returnvariable="FabricRequest">
		<cfinvokeargument name="id" value="#url.fabricrequestid#"/>
	</cfinvoke>


    <cfinvoke  component="mochi.cfc.materials.MaterialGateway" method="getAllAsQuery" returnvariable="fabrics">
	</cfinvoke>

    
    <cfinvoke  component="mochi.cfc.colors.ColorGateway" method="getAllAsQuery" returnvariable="colors">
	</cfinvoke>

    <cfinvoke  component="mochi.cfc.users.UserGateway" method="getAllAsQuery" returnvariable="users">
	</cfinvoke>

    <cfinvoke  component="mochi.cfc.deliveries.DeliveryGateway" method="getAllAsQuery" returnvariable="deliveries">
    </cfinvoke>

    <cfinvoke  component="mochi.cfc.years.YearGateway" method="getAllAsQuery" returnvariable="years">
    </cfinvoke>

	<cfinvoke  component="mochi.cfc.fabricRequestStatus.FabricRequestStatusGateway" method="getAllAsQuery" returnvariable="fabricRequestStatus">
	</cfinvoke>


	<cfinvoke  component="mochi.cfc.fabricRequestTypes.FabricRequestTypeGateway" method="getAllAsQuery" returnvariable="fabricRequestTypes">
	</cfinvoke>

    <cfinvoke  component="mochi.cfc.MaterialCategories.MaterialCategoryGateway" method="getAllAsQuery" returnvariable="fabricCategories">
	</cfinvoke>

    <table width="333" border="1" align="left">
    
    <!--- Form for creating a new fabric request --->
        <cfform method="post"> 
              <tr>
                <th width="149" scope="row">Fabric :</th>
                <td width="168">
                    <cfselect name="FabricID" query="fabrics" value="MaterialID" display="MaterialCode" queryPosition="below" required="yes" message="Fabric is required"
                    		  selected="#FabricRequest.getFabricID()#">
                    </cfselect>
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Colors :</th>
                <td width="168">
                    <cfselect name="ColorID" query="colors" value="ColorID" display="ColorName" queryPosition="below" required="yes" message="Color is required"
                    		  selected="#FabricRequest.getColorID()#">
                    </cfselect>
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Request Type :</th>
                <td width="168">
                    <cfselect name="FabricRequestTypeID" query="FabricRequestTypes" value="FabricRequestTypeID" display="Type" queryPosition="below" required="yes" message="Type is required" selected="#FabricRequest.getFabricRequestTypeID()#">
                        <option value="">Select Type
                    </cfselect>
                </td>
              </tr>
               <tr>
                <th width="149" scope="row">Fabric Category :</th>
                <td width="168">
                    <cfselect name="FabricCategoryID" query="fabricCategories" value="MaterialCategoryID" display="Category" queryPosition="below" required="yes" message="Category is required" selected="#FabricRequest.getFabricCategoryID()#">
                        <option value="">Select Category
                    </cfselect>
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Delivery :</th>
                <td width="168">
            	<cfselect name="DeliveryID" query="deliveries" value="DeliveryID" display="Delivery" queryPosition="below" required="yes" message="Delivery is required"
                		  selected="#FabricRequest.getDeliveryID()#">
                </cfselect>
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Year :</th>
                <td width="168">
                    <cfselect name="YearID" query="years" value="YearID" display="Year" queryPosition="below" required="yes" message="Year is required" selected="#FabricRequest.getYearID()#">
                    </cfselect>
                </td>
              </tr>
              <tr>
                <th scope="row">Pantone Color :</th>
                <td>
                        <cfinput type="text" name="pantonecolor" id="pantonecolor" value="#FabricRequest.getPantoneColor()#">
                </td>
              </tr>
              <tr>
                <th scope="row">Comments :</th>
                <td>
                        <cftextarea cols="50%" required="yes" name="comments" validateat="onSubmit" message="Comments is required" value="#FabricRequest.getComments()#"/>
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Requested By :</th>
                <td width="168">
                    <cfselect name="RequestedBy" query="users" value="FirstName" display="FirstName" queryPosition="below" required="yes" message="Requested by is required"
                    		  selected="#FabricRequest.getRequestedBy()#">
                    </cfselect>
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Requested Date :</th>
                <td width="168">
                    <cfinput type="datefield" required="true" name="requestdate" validateat="onSubmit"
                             value="#DateFormat(FabricRequest.getRequestDate(), 'mm/dd/yyyy')#" message="Request date is required">
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Approved By :</th>
                <td width="168">
                    <cfselect name="ApprovedBy" query="users" value="FirstName" display="FirstName" queryPosition="below" selected="#FabricRequest.getApprovedBy()#">
                        <option value="">Select Name
                    </cfselect>
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Approved Date :</th>
                <td width="168">
                    <cfinput type="datefield" name="approveddate" value="#DateFormat(FabricRequest.getApprovedDate(), 'mm/dd/yyyy')#">
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Received By :</th>
                <td width="168">
                    <cfselect name="ReceivedBy" query="users" value="FirstName" display="FirstName" queryPosition="below" selected="#FabricRequest.getReceivedBy()#">
                        <option value="">Select Name
                    </cfselect>
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Received Date :</th>
                <td width="168">
                    <cfinput type="datefield" name="receiveddate" value="#DateFormat(FabricRequest.getReceivedDate(), 'mm/dd/yyyy')#">
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Status :</th>
                <td width="168">
                    <cfselect name="FabricRequestStatusID" query="fabricRequestStatus" value="FabricRequestStatusID" display="Status" queryPosition="below" required="yes" message="Fabric Request status by is required"
                    		  selected="#FabricRequest.getFabricRequestStatusID()#">
                    </cfselect>
                </td>
              </tr>
              <tr>
                <td colspan="2"><cfinput type="submit" name="submit" value="Update Fabric Request"></td>	
             </tr>
                                                
              
            <!--- automatically generated reference number --->
            <cfinput type="hidden" name="ReferenceNumber" value="#FabricRequest.getReferenceNumber()#">
        
        
            <cfinput type="hidden" name="FabricRequestID" value="#FabricRequest.getFabricRequestId()#">  
        
            <!--- Timestamps --->
            <cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
            <cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
            <cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
            <cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    
                
        </cfform>
        
        
    </table>
        
<cfelse>

	<cflocation url="index.cfm">    

</cfif>

