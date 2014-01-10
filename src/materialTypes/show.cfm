<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.MaterialTypeid")>

	<cfinvoke  component="mochi.cfc.MaterialTypes.MaterialTypeGateway" method="getById" returnvariable="MaterialType">
		<cfinvokeargument name="id" value="#url.MaterialTypeid#"/>
	</cfinvoke>



	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Material Type :</th>
	    <td width="168">#MaterialType.getMaterialType()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Description :</th>
	    <td width="168">#MaterialType.getDescription()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#MaterialType.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#MaterialType.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#MaterialType.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#MaterialType.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>