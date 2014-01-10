<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.entitytypeid")>

	<cfinvoke  component="mochi.cfc.EntityTypes.EntityTypeGateway" method="getById" returnvariable="EntityType">
		<cfinvokeargument name="id" value="#url.entitytypeid#"/>
	</cfinvoke>


	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Entity Type :</th>
	    <td width="168">#EntityType.getEntityType()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Description :</th>
	    <td width="168">#EntityType.getDescription()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#EntityType.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#EntityType.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#EntityType.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#EntityType.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>