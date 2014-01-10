<cfinclude template="../shared/header.cfm"/>

<cfinvoke  component="mochi.cfc.posts.PostGateway" method="getAllAsQuery" returnvariable="posts">
</cfinvoke>



<cfif posts.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 

	<table border="1">
        
		<cfoutput query="posts">			
        
        <tr>
        	<td>#posts.CreatedDate#</td>
        </tr>
        <tr>
        	<th>#posts.Subject#</th>
        </tr>
        <tr>
        	<td width="100%">#posts.Post#</td>
        </tr>
        <tr>
        	<td width="100%" align="right">#posts.Done#</td>
        </tr>
			
        <tr>
        </cfoutput>
        
     </table>
</cfif>   

<a href="new.cfm">Create New Post</a>