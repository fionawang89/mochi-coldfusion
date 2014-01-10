<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.contractorid")>
	<cfinvoke component="mochi.cfc.contractors.ContractorGateway" method="getById" returnvariable="contractor"> 
		<cfinvokeargument name="id" value="#url.contractorid#"/>
	</cfinvoke>

	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Contractor :</th>
	    <td width="168">#contractor.getContractor()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#contractor.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#contractor.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#contractor.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#contractor.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>