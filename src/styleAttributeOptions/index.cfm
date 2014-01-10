<cfinclude template="../shared/header.cfm"/>

<cfinvoke component="mochi.cfc.StyleAttributeOptions.StyleAttributeOptionGateway" method="getAllAsQuery" returnvariable="StyleAttributeOptionList"/> 
		

<cfif StyleAttributeOptionList.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 
	<table border="1">
    	<tr>
        	<th>Attribute Value</th>
            <th>Description</th>
            <th>Attribute</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>
        <cfoutput query="StyleAttributeOptionList">
        	<cfinvoke component="mochi.cfc.styleAttributes.StyleAttributeGateway" method="getById" returnvariable="StyleAttribute">
				<cfinvokeargument name="id" value="#StyleAttributeOptionList.StyleAttributeID#"/>
			</cfinvoke>
            <tr>
              <td>#StyleAttributeOptionList.AttributeValue#</td>    
              <td>#StyleAttributeOptionList.Description#</td>          
              <td>#StyleAttribute.getAttributeName()#</td>      
              <td><a href="update.cfm?StyleAttributeOptionid=#StyleAttributeOptionList.StyleAttributeOptionID#">Edit</a></td>
              <td><a href="show.cfm?StyleAttributeOptionid=#StyleAttributeOptionList.StyleAttributeOptionID#">View</a></td>
            </tr>        
        </cfoutput>
        </table>
</cfif>   

<a href="new.cfm">Create New Style Attribute Option</a>