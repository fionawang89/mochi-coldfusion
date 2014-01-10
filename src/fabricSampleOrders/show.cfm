<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.FabricSourcingID")>

	<cfinvoke component="mochi.cfc.fabricSourcings.fabricSourcingGateway" method="getById" returnvariable="fabricSourcing"> 
		<cfinvokeargument name="id" value="#url.fabricSourcingid#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.vendors.VendorGateway" method="getById" returnvariable="vendor">
		<cfinvokeargument name="id" value="#fabricSourcing.getVendorID()#"/>
	</cfinvoke>


	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Vendor :</th>
	    <td width="168">#vendor.getVendor()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Requested by :</th>
	    <td width="168">#fabricSourcing.getRequestedBy()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Requested Date :</th>
	    <td width="168">#DateFormat(fabricSourcing.getRequestDate(), 'mm/dd/yyyy')#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Sample Yardage :</th>
	    <td width="168">#fabricSourcing.getMinimum()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">USD Price :</th>
	    <td width="168">#fabricSourcing.getUSDPrice()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">RMB Price :</th>
	    <td width="168">#fabricSourcing.getRMBPrice()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Comments :</th>
	    <td width="168">#fabricSourcing.getComments()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#fabricSourcing.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#fabricSourcing.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#fabricSourcing.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#fabricSourcing.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>