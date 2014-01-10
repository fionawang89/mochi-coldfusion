<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.FabricStrikeOffid")>
	<cfinvoke component="mochi.cfc.FabricStrikeOffs.FabricStrikeOffGateway" method="getById" returnvariable="FabricStrikeOff"> 
		<cfinvokeargument name="id" value="#url.FabricStrikeOffid#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.FabricStrikeOffStatus.FabricStrikeOffStatusGateway" method="getById" returnvariable="FabricStrikeOffStatus">
		<cfinvokeargument name="id" value="#FabricStrikeOff.getFabricStrikeOffStatusID()#"/>
	</cfinvoke>

	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Lab Dip Submit :</th>
	    <td width="168">#FabricStrikeOff.getLabDipSubmit()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Submitted by :</th>
	    <td width="168">#FabricStrikeOff.getSubmitBy()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Submit Date :</th>
	    <td width="168">#DateFormat(FabricStrikeOff.getSubmitDate(), 'mm/dd/yyyy')#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Received by :</th>
	    <td width="168">#FabricStrikeOff.getReceivedBy()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Received Date :</th>
	    <td width="168">#DateFormat(FabricStrikeOff.getReceivedDate(), 'mm/dd/yyyy')#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Approved by :</th>
	    <td width="168">#FabricStrikeOff.getApprovedBy()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Approved Date :</th>
	    <td width="168">#DateFormat(FabricStrikeOff.getApprovedDate(), 'mm/dd/yyyy')#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Status :</th>
	    <td width="168">#FabricStrikeOffStatus.getStatus()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Comments :</th>
	    <td width="168">#FabricStrikeOff.getComments()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#FabricStrikeOff.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#FabricStrikeOff.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#FabricStrikeOff.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#FabricStrikeOff.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>