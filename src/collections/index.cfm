<cfinclude template="../shared/header.cfm"/>

<cfinvoke  component="mochi.cfc.collections.CollectionGateway" method="getAllAsQuery" returnvariable="collections">
</cfinvoke>


		

<cfif collections.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 

	<table border="1">
    	<tr>
        	<th>Collection</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="collections">			
			
        <tr>
          <td>#collections.Collection#</td>          
          <td><a href="update.cfm?CollectionID=#collections.CollectionID#">Edit</a></td>

          <td><a href="delete.cfm?CollectionID=#collections.CollectionID#">Delete</a></td>
          <td><a href="show.cfm?CollectionID=#collections.CollectionID#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Collection</a>