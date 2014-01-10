<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.FabricRequestStatusid")>
	<cfinvoke  component="mochi.cfc.FabricRequestStatus.FabricRequestStatusGateway" method="getById" returnvariable="FabricRequestStatus">
		<cfinvokeargument name="id" value="#url.FabricRequestStatusid#"/>
	</cfinvoke>


	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Code :</th>
	    <td width="168">#FabricRequestStatus.getStatus()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Description :</th>
	    <td width="168">#FabricRequestStatus.getDescription()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#FabricRequestStatus.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#FabricRequestStatus.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#FabricRequestStatus.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#FabricRequestStatus.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>