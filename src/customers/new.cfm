<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.Customer")>
	<!--- Check if customer already exist in the system to avoid duplication --->
	<cfquery name="qCustomer" datasource="#application.datasource#">
		SELECT CustomerID
		FROM Customers
		WHERE Customer =  '#form.Customer#'
	</cfquery>
	
	<!--- If customer doesnt exists create one --->
	<cfif qCustomer.RECORDCOUNT IS 0>
		<cfset Customer=CreateObject("component", "mochi.cfc.Customers.Customer").init(form)>
		<cfinvoke component="mochi.cfc.Customers.CustomerGateway" method="save" > 
			<cfinvokeargument name="obj" value="#Customer#"/>
		</cfinvoke>
	</cfif>
		
    <cflocation url="index.cfm">
	
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Customer :</th>
    <td width="168"><cfinput type="text" name="Customer" id="Customer">
    </td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create Customer"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="Customerid" name="Customerid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>