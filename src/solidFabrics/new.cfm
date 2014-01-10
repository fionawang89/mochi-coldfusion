  <cfinclude template="../shared/header.cfm">

<cfif IsDefined("form.FabricID")>


	<cfquery name="qFabricRequest" datasource="#application.datasource#">
		SELECT FabricID
		FROM FabricRequest  
		WHERE FabricID = #form.FabricID#
        AND ColorID = #form.ColorID#
	</cfquery>
	
    
	<cfif qFabricRequest.RecordCount IS 0>	

		<!--- save fabric request in the database --->
        <cfinvoke  component="mochi.cfc.fabricRequests.FabricRequest" method="init" returnvariable="FabricRequest">
            <cfinvokeargument name="stValues" value="#form#"/>
		</cfinvoke>
		
        <cfinvoke  component="mochi.cfc.fabricRequests.FabricRequestGateway" method="save" returnvariable="savedFabricRequest">
			<cfinvokeargument name="obj" value="#FabricRequest#"/>
		</cfinvoke>
         
    	<cflocation url="index.cfm">
        
	</cfif>

</cfif>

<cfquery name="fabrics" datasource="#APPLICATION.DATASOURCE#">
	SELECT MaterialID, MaterialCode
    FROM Materials
    WHERE MaterialTypeID = 1
</cfquery>

<cfinvoke  component="mochi.cfc.colors.ColorGateway" method="getAllAsQuery" returnvariable="colors">
</cfinvoke>

<cfinvoke  component="mochi.cfc.vendors.VendorGateway" method="getAllAsQuery" returnvariable="vendors">
</cfinvoke>

<cfinvoke  component="mochi.cfc.users.UserGateway" method="getAllAsQuery" returnvariable="users">
</cfinvoke>

<cfinvoke  component="mochi.cfc.deliveries.DeliveryGateway" method="getAllAsQuery" returnvariable="deliveries">
</cfinvoke>

<cfinvoke  component="mochi.cfc.years.YearGateway" method="getAllAsQuery" returnvariable="years">
</cfinvoke>

<cfinvoke  component="mochi.cfc.fabricRequestTypes.FabricRequestTypeGateway" method="getAllAsQuery" returnvariable="fabricRequestTypes">
</cfinvoke>

<cfinvoke  component="mochi.cfc.MaterialCategories.MaterialCategoryGateway" method="getAllAsQuery" returnvariable="fabricCategories">
</cfinvoke>


<!--- Create a reference number --->
<cfquery name="qReferenceNumber" datasource="#application.datasource#">
  	SELECT MAX(ReferenceNumber) as MaxReferenceNumber
	FROM FabricRequest
</cfquery>
    
<cfif qReferenceNumber.MaxReferenceNumber IS NOT ''>
   	<cfset referenceNumber = qReferenceNumber.MaxReferenceNumber + 1>
<cfelse>
  	<cfset referenceNumber = 1>        
</cfif>

<table width="333" border="1" align="left">

<!--- Form for creating a new fabric request --->
    <cfform method="post"> 
          <tr>
            <th width="149" scope="row">Fabric :</th>
            <td width="168">
            	<cfselect name="FabricID" query="fabrics" value="MaterialID" display="MaterialCode" queryPosition="below" required="yes" message="Fabric is required">
                	<option value="">Select Fabric
                </cfselect>
            </td>
          </tr>
          <tr>
            <th width="149" scope="row">Colors :</th>
            <td width="168">
            	<cfselect name="ColorID" query="colors" value="ColorID" display="ColorName" queryPosition="below" required="yes" message="Color is required">
                	<option value="">Select Color
                </cfselect>
            </td>
          </tr>
          <tr>
            <th width="149" scope="row">Request Type :</th>
            <td width="168">
            	<cfselect name="FabricRequestTypeID" query="FabricRequestTypes" value="FabricRequestTypeID" display="Type" queryPosition="below" required="yes" message="Type is required">
                	<option value="">Select Type
                </cfselect>
            </td>
          </tr>
		  <tr>
			<th width="149" scope="row">Fabric Category :</th>
			<td width="168">
			  <cfselect name="FabricCategoryID" query="fabricCategories" value="MaterialCategoryID" display="Category" queryPosition="below" required="yes" message="Category is required">
                        <option value="">Select Category
			  </cfselect>
			</td>
		  </tr>
          <tr>
            <th width="149" scope="row">Year :</th>
            <td width="168">
            	<cfselect name="YearID" query="years" value="YearID" display="Year" queryPosition="below" required="yes" message="Year is required">
                	<option value="">Select Year
                </cfselect>
            </td>
          </tr>
          <tr>
            <th width="149" scope="row">Delivery Date :</th>
            <td width="168">
            	<cfselect name="DeliveryID" query="deliveries" value="DeliveryID" display="Delivery" queryPosition="below" required="yes" message="Delivery is required">
                	<option value="">Select Delivery
                </cfselect>
            </td>
          </tr>
          <tr>
            <th scope="row">Pantone Color :</th>
            <td>
                    <cfinput type="text" name="pantonecolor" id="pantonecolor">
            </td>
          </tr>
          <tr>
            <th width="149" scope="row">Vendor :</th>
            <td width="168">
            	<cfselect name="VendorID" query="vendors" value="VendorID" display="Vendor" queryPosition="below" required="yes" message="Vendor is required">
                	<option value="">Select Vendor
                </cfselect>
            </td>
          </tr>
          <tr>
            <th scope="row">Vendor Color Code :</th>
            <td>
                    <cfinput type="text" name="vendorcolorcode" id="vendorcolorcode">
            </td>
          </tr>
          <tr>
            <th scope="row">Sample Yardage :</th>
            <td>
                    <cfinput type="text" name="sampleyardage" id="sampleyardage">
            </td>
          </tr>
          <tr>
            <th scope="row">Price/YD :</th>
            <td>
                    <cfinput type="text" name="priceperyard" id="priceperyard">
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
            <th width="149" scope="row">Requested By :</th>
            <td width="168">
            	<cfselect name="RequestedBy" query="users" value="FirstName" display="FirstName" queryPosition="below" required="yes" message="Requested by is required">
                	<option value="">Select Name
                </cfselect>
            </td>
          </tr>
          <tr>
            <th width="149" scope="row">Requested Date :</th>
            <td width="168">
		    	<cfinput type="datefield" required="true" name="requestdate" validateat="onSubmit"
		    			 value="#Now()#" message="Request date is required">
            </td>
          </tr>
          <tr>
            <th width="149" scope="row">Approved By :</th>
            <td width="168">
            	<cfselect name="ApprovedBy" query="users" value="FirstName" display="FirstName" queryPosition="below">
                	<option value="">Select Name
                </cfselect>
            </td>
          </tr>
          <tr>
            <th width="149" scope="row">Approved Date :</th>
            <td width="168">
		    	<cfinput type="datefield" name="approveddate" >
            </td>
          </tr>
          <tr>
            <th width="149" scope="row">Received By :</th>
            <td width="168">
            	<cfselect name="ReceivedBy" query="users" value="FirstName" display="FirstName" queryPosition="below">
                	<option value="">Select Name
                </cfselect>
            </td>
          </tr>
          <tr>
            <th width="149" scope="row">Received Date :</th>
            <td width="168">
		    	<cfinput type="datefield" name="receiveddate" >
            </td>
          </tr>
          <tr>
            <td colspan="2"><cfinput type="submit" name="submit" value="Create Fabric Request"></td>	
         </tr>
                                            
          
		<!--- automatically generated reference number --->
        <cfinput type="hidden" name="ReferenceNumber" value="#referenceNumber#">
    
    
        <!--- default request status value open for newly created request --->
        <cfinput type="hidden" name="FabricRequestStatusID" value="1">

        
        <cfinput type="hidden" name="FabricRequestID" value="0">  
    
        <!--- Timestamps --->
        <cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
        <cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
        <cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
        <cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    
            
    </cfform>
    
    
</table>
	
