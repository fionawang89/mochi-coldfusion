<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.requeststatusid")>
	<cfinvoke  component="mochi.cfc.requestStatus.RequestStatus" method="init" returnvariable="requestStatus">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.requestStatus.RequestStatusGateway" method="save">
		<cfinvokeargument name="obj" value="#requestStatus#"/>
	</cfinvoke>


    <cflocation url="index.cfm">
    
<cfelseif IsDefined("url.requeststatusid")>
	<cfinvoke  component="mochi.cfc.requestStatus.requestStatusGateway" method="getById" returnvariable="requestStatus">
		<cfinvokeargument name="id" value="#url.requeststatusid#"/>
	</cfinvoke>

</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Status :</th>
    <td width="168"><cfinput type="text" name="status" id="status"
            		 value="#requestStatus.getStatus()#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"
            		 value="#requestStatus.getDescription()#">
    </td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Category"></td>
  </tr>
</table>
	<cfinput type="hidden" name="requeststatusid" value="#requestStatus.getrequeststatusid()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#requestStatus.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>