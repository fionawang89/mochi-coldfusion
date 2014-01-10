<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.patternpriorityid")>

	<cfinvoke  component="mochi.cfc.patternPriorities.PatternPriorityGateway" method="getById" returnvariable="patternPriority">
		<cfinvokeargument name="id" value="#url.patternpriorityid#"/>
	</cfinvoke>

	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Code :</th>
	    <td width="168">#patternPriority.getPriorityCode()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Description :</th>
	    <td width="168">#patternPriority.getDescription()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#patternPriority.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#patternPriority.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#patternPriority.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#patternPriority.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>