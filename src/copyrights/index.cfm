<cfinclude template="../shared/header.cfm"/>

<cfinvoke  component="mochi.cfc.Copyrights.CopyrightGateway" method="getAllAsQuery" returnvariable="Copyrights">
</cfinvoke>
		

<cfif Copyrights.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 

	<table border="1">
    	<tr>
        	<th>Author</th>
	        <th>Title of Work</th>
        	<th>Date of Birth</th>            
        	<th>Transfer</th>            
            <th>Year of Creation</th>
            <th>Publication Date</th>
            <th>Application Date</th>
            <th>Approved Date</th>
            <th>Registration Number</th>
            <th>Status</th>
        </tr>
        <cfoutput query="Copyrights">			

        	<!--- cfc components --->
    
            <cfinvoke  component="mochi.cfc.copyrightAuthors.CopyrightAuthorGateway" method="getById" returnvariable="CopyrightAuthor">
				<cfinvokeargument name="id" value="#Copyrights.CopyrightAuthorID#"/>
			</cfinvoke>

			<cfinvoke  component="mochi.cfc.copyrightApplicationStatus.CopyrightApplicationStatusGateway" method="getById" returnvariable="CopyrightApplicationStatus">
				<cfinvokeargument name="id" value="#Copyrights.CopyrightApplicationStatusID#"/>
			</cfinvoke>
			
            <tr>
              <td>#CopyrightAuthor.getAuthor()#</td>          
              <td>#Copyrights.TitleOfWork#</td>
              <td>#Copyrights.Description#</td>
              <td>#Copyrights.Transfer#</td>
              <td>#DateFormat(Copyrights.YearOfCreation, 'yyyy')#</td>
              <td>#DateFormat(Copyrights.PublicationDate)#</td>
              <td>#DateFormat(Copyrights.ApplicationDate)#</td>
              <td>#Copyrights.ApprovedDate#</td>
              <td>#Copyrights.RegistrationNumber#</td>
              <td>#CopyrightApplicationStatus.getStatus()#</td>
              <td><a href="update.cfm?CopyrightID=#Copyrights.CopyrightID#">Edit</a></td>
              <!--- don't apply this if the copyright is already registered --->
              <td><cfif Copyrights.CopyrightApplicationStatusID NEQ 2><a href="apply.cfm?CopyrightID=#Copyrights.CopyrightID#">Apply</a><cfelse>Registered</cfif></td>
              <td><a href="delete.cfm?CopyrightID=#Copyrights.CopyrightID#">Delete</a></td>
              <td><a href="show.cfm?CopyrightID=#Copyrights.CopyrightID#">View</a></td>
            </tr>        
            </cfoutput>
            </table>
</cfif>   

<a href="new.cfm">Create New Copyright</a>