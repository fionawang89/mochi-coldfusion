<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.FabricLabDipStatusid")>
	<cfinvoke  component="mochi.cfc.FabricLabDipStatus.FabricLabDipStatus" method="init" returnvariable="FabricLabDipStatus">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.FabricLabDipStatus.FabricLabDipStatusGateway" method="save">
		<cfinvokeargument name="obj" value="#FabricLabDipStatus#"/>
	</cfinvoke>


    <cflocation url="index.cfm">
    
<cfelseif IsDefined("url.FabricLabDipStatusid")>
	<cfinvoke  component="mochi.cfc.FabricLabDipStatus.FabricLabDipStatusGateway" method="getById" returnvariable="FabricLabDipStatus">
		<cfinvokeargument name="id" value="#url.FabricLabDipStatusid#"/>
	</cfinvoke>

</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Status :</th>
    <td width="168"><cfinput type="text" name="status" id="status"
            		 value="#FabricLabDipStatus.getStatus()#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"
            		 value="#FabricLabDipStatus.getDescription()#">
    </td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Category"></td>
  </tr>
</table>
	<cfinput type="hidden" name="FabricLabDipStatusid" value="#FabricLabDipStatus.getFabricLabDipStatusid()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#FabricLabDipStatus.getCreatedBy()#">  
	<cfinput type="hidden" name="createddate" value="#FabricLabDipStatus.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>