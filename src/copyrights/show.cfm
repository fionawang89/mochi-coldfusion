<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.customerid")>
	<cfinvoke component="mochi.cfc.customers.customerGateway" method="getById" returnvariable="customer"> 
		<cfinvokeargument name="id" value="#url.customerid#"/>
	</cfinvoke>

	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">customer :</th>
	    <td width="168">#customer.getcustomer()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#customer.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#customer.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#customer.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#customer.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>