<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.patternstatusid")>

	<cfinvoke  component="mochi.cfc.patternStatus.PatternStatusGateway" method="getById" returnvariable="patternStatus">
		<cfinvokeargument name="id" value="#url.patternstatusid#"/>
	</cfinvoke>



	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Status :</th>
	    <td width="168">#patternStatus.getStatus()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Description :</th>
	    <td width="168">#patternStatus.getDescription()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Type :</th>
	    <td width="168">#patternStatus.getType()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#patternStatus.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#patternStatus.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#patternStatus.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#patternStatus.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>