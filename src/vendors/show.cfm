<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.Vendorid")>
	<cfinvoke component="mochi.cfc.Vendors.VendorGateway" method="getById" returnvariable="Vendor"> 
		<cfinvokeargument name="id" value="#url.Vendorid#"/>
	</cfinvoke>



	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Vendor :</th>
	    <td width="168">#Vendor.getVendor()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Contact Name :</th>
	    <td>#Vendor.getContactName()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Telephone :</th>
	    <td>#Vendor.getTelephoneNumber()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Fax :</th>
	    <td>#Vendor.getFaxNumber()#</td>
	  </tr>
	  <tr>
	    <th scope="row">E-Mail :</th>
	    <td>#Vendor.getEMail()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Address :</th>
	    <td>#Vendor.getAddress()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#Vendor.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#Vendor.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#Vendor.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#Vendor.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>