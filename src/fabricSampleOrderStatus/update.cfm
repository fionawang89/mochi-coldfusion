<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.FabricSampleOrderStatusid")>
	<cfinvoke  component="mochi.cfc.FabricSampleOrderStatus.FabricSampleOrderStatus" method="init" returnvariable="FabricSampleOrderStatus">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.FabricSampleOrderStatus.FabricSampleOrderStatusGateway" method="save">
		<cfinvokeargument name="obj" value="#FabricSampleOrderStatus#"/>
	</cfinvoke>


    <cflocation url="index.cfm">
    
<cfelseif IsDefined("url.FabricSampleOrderStatusid")>
	<cfinvoke  component="mochi.cfc.FabricSampleOrderStatus.FabricSampleOrderStatusGateway" method="getById" returnvariable="FabricSampleOrderStatus">
		<cfinvokeargument name="id" value="#url.FabricSampleOrderStatusid#"/>
	</cfinvoke>

</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Status :</th>
    <td width="168"><cfinput type="text" name="status" id="status"
            		 value="#FabricSampleOrderStatus.getStatus()#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"
            		 value="#FabricSampleOrderStatus.getDescription()#">
    </td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Category"></td>
  </tr>
</table>
	<cfinput type="hidden" name="FabricSampleOrderStatusid" value="#FabricSampleOrderStatus.getFabricSampleOrderStatusid()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#FabricSampleOrderStatus.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>