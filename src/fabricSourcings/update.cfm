<cfinclude template="../shared/header.cfm"/>


<cfif IsDefined("form.FabricSourcingID")>
	
	<cfinvoke  component="mochi.cfc.FabricSourcings.FabricSourcing" method="init" returnvariable="FabricSourcing">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.FabricSourcings.FabricSourcingGateway" method="save">
		<cfinvokeargument name="obj" value="#FabricSourcing#"/>
	</cfinvoke>

	

	<cflocation url="../solidFabrics/index.cfm">

    
<cfelseif IsDefined("url.FabricSourcingID")>

	<cfinvoke  component="mochi.cfc.FabricSourcings.FabricSourcingGateway" method="getById" returnvariable="FabricSourcing">
		<cfinvokeargument name="id" value="#url.FabricSourcingID#"/>
	</cfinvoke>

	
	<cfinvoke  component="mochi.cfc.vendors.VendorGateway" method="getAllAsQuery" returnvariable="vendors">
	</cfinvoke>


	<cfinvoke  component="mochi.cfc.users.UserGateway" method="getAllAsQuery" returnvariable="users">
	</cfinvoke>


    <table width="333" border="1" align="left">

        <cfform method="post">	
              <tr>
                <th width="149" scope="row">Vendor :</th>
                <td width="168">
                    <cfselect name="VendorID" query="vendors" value="VendorID" display="Vendor" queryPosition="below" required="yes" message="vendor is required" selected="#FabricSourcing.getVendorID()#">
                    </cfselect>
                
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Requested By :</th>
                <td width="168">
                    <cfselect name="RequestedBy" query="users" value="FirstName" display="FirstName" queryPosition="below" required="yes" message="requested by is required" selected="#FabricSourcing.getRequestedBy()#">
                        <option value="">Select Requested By
                    </cfselect>
                
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Request Date :</th>
                <td width="168"><cfinput type="datefield" name="requestdate" value="#DateFormat(FabricSourcing.getRequestDate(), 'mm/dd/yyyy')#"></td>
              </tr>
              <tr>
                <th scope="row">Minimum :</th>
                <td>
                        <cfinput type="text" name="minimum" id="minimum" value="#FabricSourcing.getMinimum()#">
                </td>
              </tr>
              <tr>
                <th scope="row">USD Price :</th>
                <td>
                        <cfinput type="text" name="usdPrice" id="usdPrice" value="#FabricSourcing.getUSDPrice()#">
                </td>
              </tr>
              <tr>
                <th scope="row">RMB Price :</th>
                <td>
                        <cfinput type="text" name="rmbPrice" id="rmbPrice" value="#FabricSourcing.getRMBPrice()#">
                </td>
              </tr>
              <tr>
                <th scope="row">Comments :</th>
                <td>
                        <cftextarea cols="50%" name="Comments" validateat="onSubmit" required="yes" message="comments is required" value="#FabricSourcing.getComments()#"/>
                </td>
             </tr>
              <tr>
                <td colspan="2"><cfinput type="submit" name="submit" value="Update Fabric Source"></td>	
             </tr>
             
             
    

        <cfinput type="hidden" name="FabricSourcingID" value="#url.FabricSourcingID#">  

        <cfinput type="hidden" name="FabricRequestID" value="#FabricSourcing.getfabricrequestid()#">  
    
        <!--- Timestamps --->
        <cfinput type="hidden" name="createdby" value="#FabricSourcing.getCreatedBy()#">  
        <cfinput type="hidden" name="createddate" value="#FabricSourcing.getCreatedDate()#">  
        <cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
        <cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    
             
		</cfform>
    
	</table>


</cfif>