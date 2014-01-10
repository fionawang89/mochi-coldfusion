<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.MaterialTypeid")>
	
    <cfinvoke  component="mochi.cfc.MaterialTypes.MaterialType" method="init" returnvariable="MaterialType">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.MaterialTypes.MaterialTypeGateway" method="save">
		<cfinvokeargument name="obj" value="#MaterialType#"/>
	</cfinvoke>

    <cflocation url="index.cfm">
    
<cfelseif IsDefined("url.MaterialTypeid")>

	<cfinvoke  component="mochi.cfc.MaterialTypes.MaterialTypeGateway" method="getById" returnvariable="MaterialType"> 
		<cfinvokeargument name="id" value="#url.MaterialTypeid#"/>
	</cfinvoke>

</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Material Type :</th>
    <td width="168"><cfinput type="text" name="MaterialType" id="MaterialType"
            		 value="#MaterialType.getMaterialType()#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"
            		 value="#MaterialType.getDescription()#">
    </td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Material Type"></td>
  </tr>
</table>
	<cfinput type="hidden" name="MaterialTypeid" value="#MaterialType.getMaterialTypeid()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#MaterialType.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>