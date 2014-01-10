<cfinclude template="../shared/header.cfm"/>


<cfif IsDefined("form.FabricStrikeOffID")>
	
    <cfinvoke  component="mochi.cfc.FabricStrikeOffs.FabricStrikeOff" method="init" returnvariable="FabricStrikeOff">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.FabricStrikeOffs.FabricStrikeOffGateway" method="save">
		<cfinvokeargument name="obj" value="#FabricStrikeOff#"/>
	</cfinvoke>

	<cflocation url="../solidFabrics/index.cfm"/>

<cfelseif IsDefined("url.FabricStrikeOffID")>

	<cfinvoke  component="mochi.cfc.FabricStrikeOffs.FabricStrikeOffGateway" method="getById" returnvariable="FabricStrikeOff">
		<cfinvokeargument name="id" value="#url.FabricStrikeOffID#"/>
	</cfinvoke>

    <cfinvoke  component="mochi.cfc.fabricRequestStatus.FabricRequestStatusGateway" method="getAllAsQuery" returnvariable="fabricRequestStatus">
	</cfinvoke>



	<cfinvoke  component="mochi.cfc.users.UserGateway" method="getAllAsQuery" returnvariable="users">
	</cfinvoke>

    <table width="333" border="1" align="left">

        <cfform method="post">	
              <tr>
                <th width="149" scope="row">Submit By :</th>
                <td width="168">
                    <cfselect name="SubmitBy" query="users" display="FirstName" queryPosition="below" required="yes" message="Submit by is required"
                    		  selected="#FabricStrikeOff.getSubmitBy()#">
                    </cfselect>
                
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Submit Date :</th>
                <td width="168"><cfinput type="datefield" name="submitdate" value="#DateFormat(FabricStrikeOff.getSubmitDate(), 'mm/dd/yyyy')#"></td>
              </tr>
              <tr>
                <th width="149" scope="row">Received By :</th>
                <td width="168">
                    <cfselect name="ReceivedBy" query="users" display="FirstName" queryPosition="below" selected="#FabricStrikeOff.getReceivedBy()#">
                        <option value="">Select Name
                    </cfselect>                
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Received Date :</th>
                <td width="168"><cfinput type="datefield" name="receiveddate" value="#DateFormat(FabricStrikeOff.getReceivedDate(), 'mm/dd/yyyy')#"></td>
              </tr>
              <tr>
                <th width="149" scope="row">Approved By :</th>
                <td width="168">
                    <cfselect name="ApprovedBy" query="users" display="FirstName" queryPosition="below" selected="#FabricStrikeOff.getApprovedBy()#">
                        <option value="">Select Name
                    </cfselect>                                
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Approved Date :</th>
                <td width="168"><cfinput type="datefield" name="approveddate" value="#DateFormat(FabricStrikeOff.getApprovedDate(), 'mm/dd/yyyy')#"></td>
              </tr>
              <tr>
                <th scope="row">Comments :</th>
                <td>
                        <cftextarea cols="50%" name="Comments" validateat="onSubmit" value="#FabricStrikeOff.getComments()#"/></td>                        
                </td>
             </tr>
             <tr>
             	<th width="149" scope="row">Status :</th>
                <td width="168">
                	<cfselect name="fabricRequestStatusID" query="fabricRequestStatus" display="Status" value="fabricRequestStatusID" required="yes" queryPosition="below" message="Fabric Status is required" selected="#FabricStrikeOff.getfabricRequestStatusID()#">
                	</cfselect>
                </td>
             </tr>
              <tr>
                <td colspan="2"><cfinput type="submit" name="submit" value="Update Strike Off"></td>	
             </tr>
             
             
		<!--- automatically generated reference number --->
        <cfinput type="hidden" name="StrikeOffSubmit" value="#FabricStrikeOff.getStrikeOffSubmit()#">
    
    
        <!--- default request status value open for newly created request --->
        <cfinput type="hidden" name="FabricRequestID" value="#FabricStrikeOff.getFabricRequestID()#">

        <cfinput type="hidden" name="FabricStrikeOffID" value="#FabricStrikeOff.getFabricStrikeOffID()#">  

    
        <!--- Timestamps --->
        <cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
        <cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
        <cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
        <cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    
             
		</cfform>
    
	</table>


</cfif>