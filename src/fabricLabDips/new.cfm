<cfinclude template="../shared/header.cfm"/>


<cfif IsDefined("form.FabricLabDipID")>
	
    <cfinvoke  component="mochi.cfc.fabricLabDips.FabricLabDip" method="init" returnvariable="FabricLabDip">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<!--- update all previous lab dips to not approved which is 4 --->
    <cfquery datasource="#APPLICATION.DATASOURCE#">
    	UPDATE FabricLabDips
        SET FabricLabDipStatusID = 4
        WHERE FabricRequestID = #form.FabricRequestID#
        AND FabricLabDipStatusID <> 5 <!--- don't update if the lab dip was cancelled --->
    </cfquery>
    
	<cfinvoke  component="mochi.cfc.fabricLabDips.FabricLabDipGateway" method="save">
		<cfinvokeargument name="obj" value="#FabricLabDip#"/>
	</cfinvoke>


	<cflocation url="../solidFabrics/index.cfm">

<cfelseif IsDefined("url.fabricrequestid")>

	<cfquery name="qLabDipSubmit" datasource="#APPLICATION.DATASOURCE#">
    	SELECT Count(FabricRequestID) AS MaxLabDipSubmit
		FROM FabricLabDips
        WHERE FabricRequestID = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.fabricrequestid#"/>
    </cfquery>
	
	<cfif qLabDipSubmit.MaxLabDipSubmit IS NOT ''>
        <cfset labDipSubmit = qLabDipSubmit.MaxLabDipSubmit + 1>
    <cfelse>
        <cfset labDipSubmit = 1>        
    </cfif>
    

	<cfinvoke  component="mochi.cfc.users.UserGateway" method="getAllAsQuery" returnvariable="users">
	</cfinvoke>

    <table width="333" border="1" align="left">

        <cfform method="post">	
              <tr>
                <th width="149" scope="row">Submit By :</th>
                <td width="168">
                    <cfselect name="SubmitBy" query="users" value="FirstName" display="FirstName" queryPosition="below" required="yes" message="Submit by is required">
                        <option value="">Select Name
                    </cfselect>
                
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Submit Date :</th>
                <td width="168"><cfinput type="datefield" name="submitdate" value="#Now()#"></td>
              </tr>
              <tr>
                <th width="149" scope="row">Received By :</th>
                <td width="168">
                    <cfselect name="ReceivedBy" query="users" value="FirstName" display="FirstName" queryPosition="below" >
                        <option value="">Select Name
                    </cfselect>                
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Received Date :</th>
                <td width="168"><cfinput type="datefield" name="receiveddate"></td>
              </tr>
              <tr>
                <th width="149" scope="row">Approved By :</th>
                <td width="168">
                    <cfselect name="ApprovedBy" query="users" value="FirstName" display="FirstName" queryPosition="below" >
                        <option value="">Select Name
                    </cfselect>                                
                </td>
              </tr>
              <tr>
                <th width="149" scope="row">Approved Date :</th>
                <td width="168"><cfinput type="datefield" name="approveddate"></td>
              </tr>
              <tr>
                <th scope="row">Comments :</th>
                <td>
                        <cftextarea cols="50%" name="Comments" validateat="onSubmit" required="yes" message="comments is required">                        
                        </cftextarea>
                </td>
             </tr>
              <tr>
                <td colspan="2"><cfinput type="submit" name="submit" value="Add Lab Dip"></td>	
             </tr>
             
             
		<!--- automatically generated reference number --->
        <cfinput type="hidden" name="LabDipSubmit" value="#labDipSubmit#">
    
    
        <!--- default request status value open for newly created request --->
        <cfinput type="hidden" name="FabricLabDipStatusID" value="1">

        <cfinput type="hidden" name="FabricLabDipID" value="0">  

        <cfinput type="hidden" name="FabricRequestID" value="#url.fabricrequestid#">  
    
        <!--- Timestamps --->
        <cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
        <cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
        <cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
        <cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    
             
		</cfform>
    
	</table>


</cfif>