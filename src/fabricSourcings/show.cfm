<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.FabricSampleOrderID")>

	<cfinvoke component="mochi.cfc.FabricSampleOrders.FabricSampleOrderGateway" method="getById" returnvariable="FabricSampleOrder"> 
		<cfinvokeargument name="id" value="#url.FabricSampleOrderid#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.vendors.VendorGateway" method="getById" returnvariable="vendor">
		<cfinvokeargument name="id" value="#FabricSampleOrder.getVendorID()#"/>
	</cfinvoke>


	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Vendor :</th>
	    <td width="168">#vendor.getVendor()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Requested by :</th>
	    <td width="168">#FabricSampleOrder.getRequestedBy()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Requested Date :</th>
	    <td width="168">#DateFormat(FabricSampleOrder.getRequestDate(), 'mm/dd/yyyy')#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Sample Yardage :</th>
	    <td width="168">#FabricSampleOrder.getMinimum()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">USD Price :</th>
	    <td width="168">#FabricSampleOrder.getUSDPrice()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">RMB Price :</th>
	    <td width="168">#FabricSampleOrder.getRMBPrice()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Comments :</th>
	    <td width="168">#FabricSampleOrder.getComments()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#FabricSampleOrder.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#FabricSampleOrder.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#FabricSampleOrder.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#FabricSampleOrder.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>