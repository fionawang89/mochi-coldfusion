<cfinclude template="../shared/header.cfm"/>


<cfinvoke  component="mochi.cfc.PatternAttributes.PatternAttributeGateway" method="getAllAsQuery"
 returnvariable="PatternAttributes">
</cfinvoke>

<cfif PatternAttributes.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 

	<table border="1">
    	<tr>
        	<th>Sort</th>
        	<th>PartName</th>
        	<th>PartDescription</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="PatternAttributes">			
			
        <tr>
          <td>#PatternAttributes.Sort#</td>          
          <td>#PatternAttributes.PartName#</td>
          <td>#PatternAttributes.PartDescription#</td>          
          <td><a href="update.cfm?PatternAttributeid=#PatternAttributes.PatternAttributeid#">Edit</a></td>

          <td><a href="delete.cfm?PatternAttributeid=#PatternAttributes.PatternAttributeid#">Delete</a></td>
          <td><a href="show.cfm?PatternAttributeid=#PatternAttributes.PatternAttributeid#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Pattern Attribute</a>