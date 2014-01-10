<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.vendor")>
	<!--- Check if pattern maker already exist in the system to avoid duplication --->
	<cfquery name="qVendor" datasource="#application.datasource#">
		SELECT Vendor
		FROM Vendors
		WHERE Vendor =  '#form.vendor#'
	</cfquery>
	
	<!--- If Vendor doesnt exists create one --->
	<cfif qVendor.RECORDCOUNT IS 0>
		<cfset Vendor=CreateObject("component", "mochi.cfc.Vendors.Vendor").init(form)>
		<cfinvoke component="mochi.cfc.Vendors.VendorGateway" method="save" > 
			<cfinvokeargument name="obj" value="#Vendor#"/>
		</cfinvoke>
	</cfif>
		
    <cflocation url="index.cfm">
	
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Vendor :</th>
    <td width="168"><cfinput type="text" name="vendor" id="vendor" required="yes" message="Vendor information is required">
    </td>
  </tr>
  <tr>
    <th scope="row">Contact Name :</th>
    <td><cfinput type="text" name="contactname" id="contactname"></td>
  </tr>
  <tr>
    <th scope="row">Telephone Number :</th>
    <td><cfinput type="text" name="telephonenumber" id="telephonenumber"></td>
  </tr>
  <tr>
    <th scope="row">Fax Number :</th>
    <td><cfinput type="text" name="faxnumber" id="faxnumber"></td>
  </tr>
  <tr>
    <th scope="row">E-Mail Address :</th>
    <td><cfinput type="text" name="email" id="email" validate="email" validateat="onsubmit" message="Invalid email address"></td>
  </tr>
  <tr>
    <th scope="row">Address :</th>
    <td><cfinput type="text" name="address" id="address"></td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create Vendor"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="VendorID" name="VendorID" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>