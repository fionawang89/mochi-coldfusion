<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.CounterSampleStatusid")>

	<cfinvoke  component="mochi.cfc.CounterSampleStatus.CounterSampleStatusGateway" method="getById" returnvariable="CounterSampleStatus">
		<cfinvokeargument name="id" value="#url.CounterSampleStatusid#"/>
	</cfinvoke>



	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Status :</th>
	    <td width="168">#CounterSampleStatus.getStatus()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Description :</th>
	    <td width="168">#CounterSampleStatus.getDescription()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Type :</th>
	    <td width="168">#CounterSampleStatus.getType()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#CounterSampleStatus.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#CounterSampleStatus.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#CounterSampleStatus.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#CounterSampleStatus.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>