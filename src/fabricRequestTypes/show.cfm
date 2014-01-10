<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.FabricRequestTypeid")>
	<cfinvoke  component="mochi.cfc.FabricRequestTypes.FabricRequestTypeGateway" method="getById" returnvariable="FabricRequestType">
		<cfinvokeargument name="id" value="#url.FabricRequestTypeid#"/>
	</cfinvoke>


	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Code :</th>
	    <td width="168">#FabricRequestType.getType()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Description :</th>
	    <td width="168">#FabricRequestType.getDescription()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#FabricRequestType.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#FabricRequestType.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#FabricRequestType.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#FabricRequestType.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>