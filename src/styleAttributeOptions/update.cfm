<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.StyleAttributeOptionid")>
	<cfset StyleAttributeOption=CreateObject("component", "mochi.cfc.StyleAttributeOptions.StyleAttributeOption").init(form)>
	<cfinvoke component="mochi.cfc.StyleAttributeOptions.StyleAttributeOptionGateway" method="save" > 
		<cfinvokeargument name="obj" value="#StyleAttributeOption#"/>
	</cfinvoke>
    <cflocation url="index.cfm">
<cfelseif IsDefined("url.StyleAttributeOptionid")>
	
    <cfinvoke component="mochi.cfc.StyleAttributeOptions.StyleAttributeOptionGateway" method="getById" returnvariable="StyleAttributeOption"> 
		<cfinvokeargument name="id" value="#url.StyleAttributeOptionid#"/>
	</cfinvoke>
    

	<cfinvoke  component="mochi.cfc.styleAttributes.StyleAttributeGateway" method="getAllAsQuery" returnvariable="styleAttributes">
	</cfinvoke>

    
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Attribute Value :</th>
    <td width="168"><cfinput type="text" name="attributevalue" id="attributevalue"
            		 value="#StyleAttributeOption.getAttributeValue()#">
    </td>
  </tr>
  <tr>
    <th scope="row">Description :</th>
    <td><cfinput type="text" name="description" id="description"
        			 value="#StyleAttributeOption.getDescription()#"></td>
  </tr>
  <tr>
    <th scope="row">Style Attribute :</th>
    <td>
    	<cfselect name="StyleAttributeID" query="styleAttributes" queryPosition="below" value="StyleAttributeID" display="AttributeName" required="yes" message="Style Attribute is required" selected="#StyleAttributeOption.getStyleAttributeID()#">
        	<option value="0">Select Style Attribute
        </cfselect>
    </td>
  </tr>  
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update StyleAttributeOption"></td>
  </tr>
</table>
	<cfinput type="hidden" name="StyleAttributeOptionid" value="#StyleAttributeOption.getStyleAttributeOptionID()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#StyleAttributeOption.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>