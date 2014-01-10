<cfinclude template="../shared/header.cfm"/>

<cfinvoke  component="mochi.cfc.CopyrightAuthors.CopyrightAuthorGateway" method="getAllAsQuery" returnvariable="CopyrightAuthors">
</cfinvoke>


		

<cfif CopyrightAuthors.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 

	<table border="1">
    	<tr>
        	<th>Copyright Author</th>
        	<th>Citizenship</th>
        	<th>Date of Birth</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="CopyrightAuthors">			
			
        <tr>
          <td>#CopyrightAuthors.Author#</td>          
          <td>#CopyrightAuthors.Citizenship#</td>          
          <td>#CopyrightAuthors.DateOfBirth#</td>          
          <td><a href="update.cfm?CopyrightAuthorID=#CopyrightAuthors.CopyrightAuthorID#">Edit</a></td>

          <td><a href="delete.cfm?CopyrightAuthorID=#CopyrightAuthors.CopyrightAuthorID#">Delete</a></td>
          <td><a href="show.cfm?CopyrightAuthorID=#CopyrightAuthors.CopyrightAuthorID#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Code</a>