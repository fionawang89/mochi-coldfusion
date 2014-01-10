<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.colorid")>

	<cfinvoke  component="mochi.cfc.colors.Color" method="init" returnvariable="color">
    	<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>
	
    <cfinvoke  component="mochi.cfc.colors.ColorGateway" method="save">
		<cfinvokeargument name="obj" value="#color#"/>
	</cfinvoke>

    <cflocation url="index.cfm">
    
<cfelseif IsDefined("url.colorid")>

	<cfinvoke  component="mochi.cfc.colors.ColorGateway" method="getById" returnvariable="color">
		<cfinvokeargument name="id" value="#url.colorid#"/>
	</cfinvoke>

</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Color Code :</th>
    <td width="168"><cfinput type="text" name="colorcode" id="colorcode"
            		 value="#color.getColorCode()#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Color Name :</th>
    <td width="168"><cfinput type="text" name="colorname" id="colorname"
            		 value="#color.getColorName()#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"
            		 value="#color.getDescription()#">
    </td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Color"></td>
  </tr>
</table>
	<cfinput type="hidden" name="colorid" value="#color.getcolorid()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#color.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>