<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.FabricSampleOrderStatusid")>
	<cfinvoke  component="mochi.cfc.FabricSampleOrderStatus.FabricSampleOrderStatusGateway" method="getById" returnvariable="FabricSampleOrderStatus">
		<cfinvokeargument name="id" value="#url.FabricSampleOrderStatusid#"/>
	</cfinvoke>


	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Code :</th>
	    <td width="168">#FabricSampleOrderStatus.getStatus()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Description :</th>
	    <td width="168">#FabricSampleOrderStatus.getDescription()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#FabricSampleOrderStatus.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#FabricSampleOrderStatus.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#FabricSampleOrderStatus.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#FabricSampleOrderStatus.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>