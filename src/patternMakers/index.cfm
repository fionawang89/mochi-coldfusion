<cfinclude template="../shared/header.cfm"/>

<cfinvoke component="mochi.cfc.patternMakers.PatternMakerGateway" method="getAllAsQuery" returnvariable="patternMakerList"/> 
		

<cfif patternMakerList.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 
	<table border="1">
    	<tr>
        	<th>First Name</th>
            <th>Last Name</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="PatternMakerList">
        <tr>
          <td>#patternMakerList.FirstName#</td>          
          <td>#patternMakerList.LastName#</td>          
          <td><a href="update.cfm?PatternMakerid=#PatternMakerList.PatternMakerID#">Edit</a></td>
          <td><a href="show.cfm?PatternMakerid=#PatternMakerList.PatternMakerID#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Pattern Maker</a>