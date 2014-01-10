<cfinclude template="../shared/header.cfm"/>

<cfinvoke  component="mochi.cfc.sizes.SizeGateway" method="getAllAsQuery" returnvariable="sizes">
</cfinvoke>


<cfif sizes.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 
	<table border="1">
    	<tr>
        	<th>Size</th>
	        <th>&nbsp;</th>
        </tr>
        <cfoutput query="sizes">
        <tr>
          <td>#sizes.Size#</td>
          <td><a href="show.cfm?sizeid=#sizes.sizeid#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Size</a>
