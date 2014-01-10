<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.BeadingStatusid")>

	<cfinvoke  component="mochi.cfc.BeadingStatus.BeadingStatusGateway" method="getById" returnvariable="BeadingStatus">
		<cfinvokeargument name="id" value="#url.BeadingStatusid#"/>
	</cfinvoke>



	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Status :</th>
	    <td width="168">#BeadingStatus.getStatus()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Description :</th>
	    <td width="168">#BeadingStatus.getDescription()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Type :</th>
	    <td width="168">#BeadingStatus.getType()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#BeadingStatus.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#BeadingStatus.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#BeadingStatus.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#BeadingStatus.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>