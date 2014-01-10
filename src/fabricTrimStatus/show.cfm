<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.FabricTrimStatusid")>

	<cfinvoke  component="mochi.cfc.FabricTrimStatus.FabricTrimStatusGateway" method="getById" returnvariable="FabricTrimStatus">
		<cfinvokeargument name="id" value="#url.FabricTrimStatusid#"/>
	</cfinvoke>



	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Status :</th>
	    <td width="168">#FabricTrimStatus.getStatus()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Description :</th>
	    <td width="168">#FabricTrimStatus.getDescription()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Type :</th>
	    <td width="168">#FabricTrimStatus.getType()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#FabricTrimStatus.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#FabricTrimStatus.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#FabricTrimStatus.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#FabricTrimStatus.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>