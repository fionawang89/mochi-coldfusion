<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.fabricLabDipid")>
	<cfinvoke component="mochi.cfc.fabricLabDips.fabricLabDipGateway" method="getById" returnvariable="fabricLabDip"> 
		<cfinvokeargument name="id" value="#url.fabricLabDipid#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.fabricLabDipStatus.fabricLabDipStatusGateway" method="getById" returnvariable="fabricLabDipStatus">
		<cfinvokeargument name="id" value="#fabricLabDip.getFabricLabDipStatusID()#"/>
	</cfinvoke>

	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Lab Dip Submit :</th>
	    <td width="168">#fabricLabDip.getLabDipSubmit()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Submitted by :</th>
	    <td width="168">#fabricLabDip.getSubmitBy()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Submit Date :</th>
	    <td width="168">#DateFormat(fabricLabDip.getSubmitDate(), 'mm/dd/yyyy')#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Received by :</th>
	    <td width="168">#fabricLabDip.getReceivedBy()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Received Date :</th>
	    <td width="168">#DateFormat(fabricLabDip.getReceivedDate(), 'mm/dd/yyyy')#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Approved by :</th>
	    <td width="168">#fabricLabDip.getApprovedBy()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Approved Date :</th>
	    <td width="168">#DateFormat(fabricLabDip.getApprovedDate(), 'mm/dd/yyyy')#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Status :</th>
	    <td width="168">#fabricLabDipStatus.getStatus()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Comments :</th>
	    <td width="168">#fabricLabDip.getComments()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#fabricLabDip.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#fabricLabDip.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#fabricLabDip.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#fabricLabDip.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>