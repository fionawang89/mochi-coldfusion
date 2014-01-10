<cfinclude template="../shared/header.cfm"/>

<cfinvoke  component="mochi.cfc.fittings.FittingGateway" method="getAllAsQuery" returnvariable="fittings">
</cfinvoke>


<cfif fittings.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse>
	
	<table border="1">
    	<tr>
        	<th>Style</th>
        	<th>Fitting Date</th>
        	<th>Category</th>
        	<th>Cut</th>
        	<th>Fitter</th>
        	<th>Result</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="fittings">
		
        <cfinvoke  component="mochi.cfc.styles.StyleGateway" method="getById" returnvariable="style">
			<cfinvokeargument name="id" value="#fittings.StyleID#"/>
		</cfinvoke>

		<cfinvoke  component="mochi.cfc.sampleCategories.SampleCategoryGateway" method="getById" returnvariable="category">
			<cfinvokeargument name="id" value="#fittings.SampleCategoryID#"/>
		</cfinvoke>
        
        <cfinvoke  component="mochi.cfc.resultCodes.ResultCodeGateway" method="getById" returnvariable="resultCode">
	<cfinvokeargument name="id" value="#fittings.ResultCodeID#"/>
</cfinvoke>

		
        <tr>
          <td>#style.getStyleName()#</td>
          <td>#DateFormat(fittings.FittingDate, 'm/d/yyyy')#</td>          
          <td>#category.getCategory()#</td>          
          <td>#fittings.CutNumber#</td>          
          <td>#fittings.Fitter#</td>          
          <td>#resultCode.getDescription()#</td>          
          <td><a href="update.cfm?fittingid=#fittings.fittingid#">Edit</a></td>
          <td><a href="delete.cfm?fittingid=#fittings.fittingid#">Delete</a></td>
          <td><a href="show.cfm?fittingid=#fittings.fittingid#">View</a></td>
        </tr>        
        </cfoutput>
    </table>
</cfif>

<a href="new.cfm">Create New Fitting</a>
