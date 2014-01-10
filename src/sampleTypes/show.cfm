<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.sampletypeid")>

	<cfinvoke  component="mochi.cfc.sampleTypes.SampleTypeGateway" method="getById" returnvariable="sampleType">
		<cfinvokeargument name="id" value="#url.sampletypeid#"/>
	</cfinvoke>



	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Sample Type :</th>
	    <td width="168">#sampleType.getsampleType()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Description :</th>
	    <td width="168">#sampleType.getDescription()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#sampleType.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#sampleType.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#sampleType.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#sampleType.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>