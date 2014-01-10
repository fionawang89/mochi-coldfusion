<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.CustomerID")>
	<cfset Customer=CreateObject("component", "mochi.cfc.Customers.Customer").init(form)>
	<cfinvoke component="mochi.cfc.Customers.CustomerGateway" method="save" > 
		<cfinvokeargument name="obj" value="#Customer#"/>
	</cfinvoke>
    <cflocation url="index.cfm">
<cfelseif IsDefined("url.CustomerID")>
	<cfinvoke component="mochi.cfc.Customers.CustomerGateway" method="getById" returnvariable="Customer"> 
		<cfinvokeargument name="id" value="#url.CustomerID#"/>
	</cfinvoke>
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Customer :</th>
    <td width="168"><cfinput type="text" name="Customer" id="Customer"
            		 value="#Customer.getCustomer()#">
    </td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Customer"></td>
  </tr>
</table>
	<cfinput type="hidden" name="CustomerID" value="#Customer.getCustomerID()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#Customer.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>