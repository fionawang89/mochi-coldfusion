<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.FabricLabDipStatusid")>
	<cfinvoke  component="mochi.cfc.FabricLabDipStatus.FabricLabDipStatusGateway" method="getById" returnvariable="FabricLabDipStatus">
		<cfinvokeargument name="id" value="#url.FabricLabDipStatusid#"/>
	</cfinvoke>


	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Code :</th>
	    <td width="168">#FabricLabDipStatus.getStatus()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Description :</th>
	    <td width="168">#FabricLabDipStatus.getDescription()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#FabricLabDipStatus.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#FabricLabDipStatus.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#FabricLabDipStatus.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#FabricLabDipStatus.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>