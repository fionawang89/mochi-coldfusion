<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.productionStatusid")>
	<cfinvoke  component="mochi.cfc.productionStatus.productionStatusGateway" method="getById" returnvariable="productionStatus">
		<cfinvokeargument name="id" value="#url.productionStatusid#"/>
	</cfinvoke>


	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Code :</th>
	    <td width="168">#productionStatus.getStatus()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Description :</th>
	    <td width="168">#productionStatus.getDescription()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#productionStatus.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#productionStatus.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#productionStatus.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#productionStatus.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>