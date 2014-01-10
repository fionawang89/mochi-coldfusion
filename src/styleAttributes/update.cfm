<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.StyleAttributeid")>
	<cfset StyleAttribute=CreateObject("component", "mochi.cfc.StyleAttributes.StyleAttribute").init(form)>
	<cfinvoke component="mochi.cfc.StyleAttributes.StyleAttributeGateway" method="save" > 
		<cfinvokeargument name="obj" value="#StyleAttribute#"/>
	</cfinvoke>
    <cflocation url="index.cfm">
<cfelseif IsDefined("url.StyleAttributeid")>
	
    <cfinvoke component="mochi.cfc.StyleAttributes.StyleAttributeGateway" method="getById" returnvariable="StyleAttribute"> 
		<cfinvokeargument name="id" value="#url.StyleAttributeid#"/>
	</cfinvoke>
    
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Attribute Name:</th>
    <td width="168"><cfinput type="text" name="AttributeName" id="AttributeName"
            		 value="#StyleAttribute.getAttributeName()#">
    </td>
  </tr>
  <tr>
    <th scope="row">Description :</th>
    <td><cfinput type="text" name="description" id="description"
        			 value="#StyleAttribute.getDescription()#"></td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update StyleAttribute"></td>
  </tr>
</table>
	<cfinput type="hidden" name="StyleAttributeid" value="#StyleAttribute.getStyleAttributeID()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#StyleAttribute.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>