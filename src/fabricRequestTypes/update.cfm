<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.FabricRequestTypeid")>
	<cfinvoke  component="mochi.cfc.FabricRequestTypes.FabricRequestType" method="init" returnvariable="FabricRequestType">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.FabricRequestTypes.FabricRequestTypeGateway" method="save">
		<cfinvokeargument name="obj" value="#FabricRequestType#"/>
	</cfinvoke>


    <cflocation url="index.cfm">
    
<cfelseif IsDefined("url.FabricRequestTypeid")>
	<cfinvoke  component="mochi.cfc.FabricRequestTypes.FabricRequestTypeGateway" method="getById" returnvariable="FabricRequestType">
		<cfinvokeargument name="id" value="#url.FabricRequestTypeid#"/>
	</cfinvoke>

</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Type :</th>
    <td width="168"><cfinput type="text" name="Type" id="Type"
            		 value="#FabricRequestType.getType()#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"
            		 value="#FabricRequestType.getDescription()#">
    </td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Category"></td>
  </tr>
</table>
	<cfinput type="hidden" name="FabricRequestTypeid" value="#FabricRequestType.getFabricRequestTypeid()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#FabricRequestType.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>