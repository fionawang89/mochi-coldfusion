<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.CopyrightApplicationStatusid")>
	<cfinvoke  component="mochi.cfc.CopyrightApplicationStatus.CopyrightApplicationStatusGateway" method="getById" returnvariable="CopyrightApplicationStatus">
		<cfinvokeargument name="id" value="#url.CopyrightApplicationStatusid#"/>
	</cfinvoke>


	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Code :</th>
	    <td width="168">#CopyrightApplicationStatus.getStatus()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#CopyrightApplicationStatus.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#CopyrightApplicationStatus.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#CopyrightApplicationStatus.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#CopyrightApplicationStatus.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>