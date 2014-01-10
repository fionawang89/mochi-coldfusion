<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.Vendorid")>
	<cfset Vendor=CreateObject("component", "mochi.cfc.Vendors.Vendor").init(form)>
	<cfinvoke component="mochi.cfc.Vendors.VendorGateway" method="save" > 
		<cfinvokeargument name="obj" value="#Vendor#"/>
	</cfinvoke>
    <cflocation url="index.cfm">
<cfelseif IsDefined("url.Vendorid")>
	
    <cfinvoke component="mochi.cfc.Vendors.VendorGateway" method="getById" returnvariable="Vendor"> 
		<cfinvokeargument name="id" value="#url.Vendorid#"/>
	</cfinvoke>

    
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Vendor :</th>
    <td width="168"><cfinput type="text" name="vendor" id="vendor"
    				 required="yes" message="Vendor information is required"  
            		 value="#Vendor.getVendor()#">
    </td>
  </tr>
  <tr>
    <th scope="row">Contact Name :</th>
    <td><cfinput type="text" name="contactname" id="contactname"
        			 value="#Vendor.getContactName()#"></td>
  </tr>
  <tr>
    <th scope="row">Telephone :</th>
    <td><cfinput type="text" name="telephonenumber" id="telephonenumber"
        			 value="#Vendor.getTelephoneNumber()#"></td>
  </tr>
  <tr>
    <th scope="row">Fax :</th>
    <td><cfinput type="text" name="faxnumber" id="faxnumber"
        			 value="#Vendor.getFaxNumber()#"></td>
  </tr>
  <tr>
    <th scope="row">E-Mail Address :</th>
    <td><cfinput type="text" name="email" id="email" validate="email" message="Invalid E-Mail Address"
        			 value="#Vendor.getEMail()#"></td>
  </tr>
  <tr>
    <th scope="row">Address :</th>
    <td><cfinput type="text" name="address" id="address"
        			 value="#Vendor.getAddress()#"></td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Vendor"></td>
  </tr>
</table>
	<cfinput type="hidden" name="Vendorid" value="#Vendor.getVendorID()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#Vendor.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>