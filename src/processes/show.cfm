<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.Processid")>

	<cfinvoke  component="mochi.cfc.Processes.ProcessGateway" method="getById" returnvariable="Process">
		<cfinvokeargument name="id" value="#url.Processid#"/>
	</cfinvoke>


	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Process :</th>
	    <td width="168">#Process.getProcess()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Description :</th>
	    <td width="168">#Process.getDescription()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#Process.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#Process.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#Process.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#Process.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>