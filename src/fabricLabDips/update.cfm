<cfinclude template="../shared/header.cfm"/>


<cfif IsDefined("form.FabricLabDipID")>
	
    <cfinvoke  component="mochi.cfc.fabricLabDips.FabricLabDip" method="init" returnvariable="FabricLabDip">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.fabricLabDips.FabricLabDipGateway" method="save">
		<cfinvokeargument name="obj" value="#FabricLabDip#"/>
	</cfinvoke>

	<cflocation url="../solidFabrics/index.cfm">

<cfelseif IsDefined("url.FabricLabDipID")>

	<cfinvoke  component="mochi.cfc.fabricLabDips.FabricLabDipGateway" method="getById" returnvariable="FabricLabDip">
		<cfinvokeargument name="id" value="#url.FabricLabDipID#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.fabricLabDipStatus.fabricLabDipStatusGateway" method="getAllAsQuery" returnvariable="fabricLabDipStatus">
	</cfinvoke>


	<cfinvoke  component="mochi.cfc.users.UserGateway" method="getAllAsQuery" returnvariable="users">
	</cfinvoke>

    <table width="333" border="1" align="left">

        <cfform method="post">	
              <tr>
                <th width="149" scope="row">Submit By :</th>
                <td width="168">
                    <cfselect name="SubmitBy" query="users" display="FirstName" queryPosition="below" required="yes" message="Submit by is required"
                    		  selected="#FabricLabDip.getSubmitBy()#">
                    </cfselect>
                
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Submit Date :</th>
                <td width="168"><cfinput type="datefield" name="submitdate" value="#DateFormat(FabricLabDip.getSubmitDate(), 'mm/dd/yyyy')#"></td>
              </tr>
              <tr>
                <th width="149" scope="row">Received By :</th>
                <td width="168">
                    <cfselect name="ReceivedBy" query="users" display="FirstName" queryPosition="below" selected="#FabricLabDip.getReceivedBy()#">
                        <option value="">Select Name
                    </cfselect>                
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Received Date :</th>
                <td width="168"><cfinput type="datefield" name="receiveddate" value="#DateFormat(FabricLabDip.getReceivedDate(), 'mm/dd/yyyy')#"></td>
              </tr>
              <tr>
                <th width="149" scope="row">Approved By :</th>
                <td width="168">
                    <cfselect name="ApprovedBy" query="users" display="FirstName" queryPosition="below" selected="#FabricLabDip.getApprovedBy()#">
                        <option value="">Select Name
                    </cfselect>                                
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Approved Date :</th>
                <td width="168"><cfinput type="datefield" name="approveddate" value="#DateFormat(FabricLabDip.getApprovedDate(), 'mm/dd/yyyy')#"></td>
              </tr>
              <tr>
                <th scope="row">Comments :</th>
                <td>
                        <cftextarea cols="50%" name="Comments" validateat="onSubmit" value="#FabricLabDip.getComments()#"/></td>                        
                </td>
             </tr>
             <tr>
             	<th width="149" scope="row">Status :</th>
                <td width="168">
                	<cfselect name="FabricLabDipStatusID" query="fabricLabDipStatus" display="Status" value="FabricLabDipStatusID" required="yes" queryPosition="below" message="Fabric Lab Dip Status is required" selected="#FabricLabDip.getFabricLabDipStatusID()#">
                	</cfselect>
                </td>
             </tr>
              <tr>
                <td colspan="2"><cfinput type="submit" name="submit" value="Update Lab Dip"></td>	
             </tr>
             
             
		<!--- automatically generated reference number --->
        <cfinput type="hidden" name="LabDipSubmit" value="#FabricLabDip.getLabDipSubmit()#">
    
    
        <!--- default request status value open for newly created request --->
        <cfinput type="hidden" name="FabricRequestStatusID" value="1">
        <cfinput type="hidden" name="FabricRequestID" value="#FabricLabDip.getFabricRequestID()#">

        <cfinput type="hidden" name="FabricLabDipID" value="#FabricLabDip.getFabricLabDipID()#">  

    
        <!--- Timestamps --->
        <cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
        <cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
        <cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
        <cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    
             
		</cfform>
    
	</table>


</cfif>