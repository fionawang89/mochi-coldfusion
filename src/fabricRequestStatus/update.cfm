<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.FabricRequestStatusid")>
	<cfinvoke  component="mochi.cfc.FabricRequestStatus.FabricRequestStatus" method="init" returnvariable="FabricRequestStatus">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.FabricRequestStatus.FabricRequestStatusGateway" method="save">
		<cfinvokeargument name="obj" value="#FabricRequestStatus#"/>
	</cfinvoke>


    <cflocation url="index.cfm">
    
<cfelseif IsDefined("url.FabricRequestStatusid")>
	<cfinvoke  component="mochi.cfc.FabricRequestStatus.FabricRequestStatusGateway" method="getById" returnvariable="FabricRequestStatus">
		<cfinvokeargument name="id" value="#url.FabricRequestStatusid#"/>
	</cfinvoke>

</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Status :</th>
    <td width="168"><cfinput type="text" name="status" id="status"
            		 value="#FabricRequestStatus.getStatus()#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"
            		 value="#FabricRequestStatus.getDescription()#">
    </td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Category"></td>
  </tr>
</table>
	<cfinput type="hidden" name="FabricRequestStatusid" value="#FabricRequestStatus.getFabricRequestStatusid()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#FabricRequestStatus.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>