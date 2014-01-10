<cfinclude template="../shared/header.cfm"/>

<cfinvoke component="mochi.cfc.styleAttributes.StyleAttributeGateway" method="getAllAsQuery" returnvariable="StyleAttributeList"/> 
		

<cfif StyleAttributeList.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 
	<table border="1">
    	<tr>
        	<th>Attribute Name</th>
            <th>Description</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="StyleAttributeList">
        <tr>
          <td>#StyleAttributeList.AttributeName#</td>          
          <td>#StyleAttributeList.Description#</td>          
          <td><a href="update.cfm?StyleAttributeid=#StyleAttributeList.StyleAttributeID#">Edit</a></td>
          <td><a href="show.cfm?StyleAttributeid=#StyleAttributeList.StyleAttributeID#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Style Attribute</a>