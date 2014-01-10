<cfinclude template="../shared/header.cfm"/>


<cfinvoke  component="mochi.cfc.vendors.VendorGateway" method="getAllAsQuery" returnvariable="vendors">
</cfinvoke>

		

<cfif vendors.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 
	<table border="1">
    	<tr>
        	<th>Vendor</th>
            <th>Contact Name</th>
        	<th>Telephone</th>
            <th>Fax</th>
            <th>E-Mail Address</th>
        	<th>Address</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="vendors">
        <tr>
          <td>#vendors.Vendor#</td>          
          <td>#vendors.ContactName#</td>          
          <td>#vendors.TelephoneNumber#</td>          
          <td>#vendors.FaxNumber#</td>          
          <td>#vendors.EMail#</td>          
          <td>#vendors.Address#</td>          
          <td><a href="update.cfm?VendorID=#vendors.VendorID#">Edit</a></td>

          <td><a href="delete.cfm?VendorID=#vendors.VendorID#">Delete</a></td>
          <td><a href="show.cfm?VendorID=#vendors.VendorID#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Vendor</a>