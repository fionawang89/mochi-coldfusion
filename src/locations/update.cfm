<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.locationid")>
	<cfinvoke  component="mochi.cfc.locations.Location" method="init" returnvariable="location">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.locations.LocationGateway" method="save">
		<cfinvokeargument name="obj" value="#location#"/>
	</cfinvoke>


    <cflocation url="index.cfm">
    
<cfelseif IsDefined("url.locationid")>

	<cfinvoke  component="mochi.cfc.locations.LocationGateway" method="getById" returnvariable="location">
		<cfinvokeargument name="id" value="#url.locationid#"/>
	</cfinvoke>


</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Location :</th>
    <td width="168"><cfinput type="text" name="location" id="location"
            		 value="#location.getLocation()#">
    </td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Location"></td>
  </tr>
</table>
	<cfinput type="hidden" name="locationid" value="#location.getlocationid()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#location.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>