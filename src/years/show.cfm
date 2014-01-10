<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.yearid")>
	<cfinvoke  component="mochi.cfc.years.yearGateway" method="getById" returnvariable="year">
		<cfinvokeargument name="id" value="#url.yearid#"/>
	</cfinvoke>


	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Year :</th>
	    <td width="168">#year.getyear()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Description :</th>
	    <td width="168">#year.getDescription()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#year.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#year.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#year.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#year.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>