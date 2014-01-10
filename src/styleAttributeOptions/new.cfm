<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.attributevalue")>
	<!--- Check if StyleAttributeOption already exist in the system to avoid duplication --->
	<cfquery name="qStyleAttributeOption" datasource="#application.datasource#">
		SELECT StyleAttributeOptionID
		FROM StyleAttributeOptions
		WHERE AttributeValue =  '#form.attributevalue#'
		AND   StyleAttributeID = #form.StyleAttributeID#
	</cfquery>
	
	<!--- If StyleAttributeOption doesnt exists create one --->
	<cfif qStyleAttributeOption.RECORDCOUNT IS 0>
		<cfset StyleAttributeOption=CreateObject("component", "mochi.cfc.StyleAttributeOptions.StyleAttributeOption").init(form)>
		<cfinvoke component="mochi.cfc.StyleAttributeOptions.StyleAttributeOptionGateway" method="save" > 
			<cfinvokeargument name="obj" value="#StyleAttributeOption#"/>
		</cfinvoke>
	</cfif>
		
    <cflocation url="index.cfm">
	
</cfif>

<cfinvoke  component="mochi.cfc.styleAttributes.StyleAttributeGateway" method="getAllAsQuery" returnvariable="styleAttributes">
</cfinvoke>


<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Attribute Value :</th>
    <td width="168"><cfinput type="text" name="attributevalue" id="attributevalue">
    </td>
  </tr>
  <tr>
    <th scope="row">Description :</th>
    <td><cfinput type="text" name="description" id="description"></td>
  </tr>
  <tr>
    <th scope="row">Style Attribute :</th>
    <td>
    	<cfselect name="StyleAttributeID" query="styleAttributes" queryPosition="below" value="StyleAttributeID" display="AttributeName" required="yes" message="Style Attribute is required">
        	<option value="0">Select Style Attribute
        </cfselect>
    </td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create Style Attribute Option"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="StyleAttributeOptionid" name="StyleAttributeOptionid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>