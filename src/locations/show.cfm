<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.locationid")>
	<cfinvoke  component="mochi.cfc.locations.LocationGateway" method="getById" returnvariable="location">
		<cfinvokeargument name="id" value="#url.locationid#"/>
	</cfinvoke>

	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Code :</th>
	    <td width="168">#location.getLocation()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#location.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#location.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#location.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#location.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>