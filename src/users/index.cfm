<cfinclude template="../shared/header.cfm"/>

<cfscript>
	userList = CreateObject("component", "mochi.cfc.users.UserGateway").getAllAsQuery();
</cfscript>

<cfif userList.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 
	<table border="1">
    	<tr>
        	<th>First Name</th>
            <th>Last Name</th>
            <th>E-Mail Address</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="userList">
        <tr>
          <td>#userList.FirstName#</td>
          <td>#userList.LastName#</td>
          <td>#userList.Email#</td>
          <td><a href="update.cfm?userid=#userList.UserID#">Edit</a></td>
          <td><a href="delete.cfm?userid=#userList.UserID#">Delete</a></td>
          <td><a href="show.cfm?userid=#userList.UserID#">View</a></td>
        </tr>        
        </cfoutput>
        </table>        
</cfif>   

<a href="new.cfm">Create New User</a>
