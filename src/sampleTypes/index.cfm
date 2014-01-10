<cfinclude template="../shared/header.cfm"/>

<cfinvoke  component="mochi.cfc.sampleTypes.SampleTypeGateway" method="getAllAsQuery"
 returnvariable="sampleTypes">
</cfinvoke>


		

<cfif sampleTypes.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 

	<table border="1">
    	<tr>
        	<th>Sample Type</th>
        	<th>Description</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="sampleTypes">			
			
        <tr>
          <td>#sampleTypes.SampleType#</td>          
          <td>#sampleTypes.Description#</td>          
          <td><a href="update.cfm?SampleTypeID=#sampleTypes.SampleTypeID#">Edit</a></td>

          <td><a href="delete.cfm?SampleTypeID=#sampleTypes.SampleTypeID#">Delete</a></td>
          <td><a href="show.cfm?SampleTypeID=#sampleTypes.SampleTypeID#">View</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Sample Type</a>