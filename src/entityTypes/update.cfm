<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.entitytypeid")>

	<cfinvoke  component="mochi.cfc.EntityTypes.EntityType" method="init" returnvariable="EntityType">
    	<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>
	
    <cfinvoke  component="mochi.cfc.EntityTypes.EntityTypeGateway" method="save">
		<cfinvokeargument name="obj" value="#EntityType#"/>
	</cfinvoke>

    <cflocation url="index.cfm">
    
<cfelseif IsDefined("url.entitytypeid")>

	<cfinvoke  component="mochi.cfc.EntityTypes.EntityTypeGateway" method="getById" returnvariable="EntityType">
		<cfinvokeargument name="id" value="#url.entitytypeid#"/>
	</cfinvoke>

</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Entity Type :</th>
    <td width="168"><cfinput type="text" name="EntityType" id="EntityType"
            		 value="#EntityType.getEntityType()#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"
            		 value="#EntityType.getDescription()#">
    </td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Entity Type"></td>
  </tr>
</table>
	<cfinput type="hidden" name="entitytypeid" value="#EntityType.getentitytypeid()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#EntityType.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>