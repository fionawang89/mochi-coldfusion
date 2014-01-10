<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.yearid")>
	<cfinvoke  component="mochi.cfc.years.year" method="init" returnvariable="year">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.years.yearGateway" method="save">
		<cfinvokeargument name="obj" value="#year#"/>
	</cfinvoke>


    <cflocation url="index.cfm">
    
<cfelseif IsDefined("url.yearid")>
	<cfinvoke  component="mochi.cfc.years.yearGateway" method="getById" returnvariable="year">
		<cfinvokeargument name="id" value="#url.yearid#"/>
	</cfinvoke>

</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">year :</th>
    <td width="168"><cfinput type="text" name="year" id="year"
            		 value="#year.getyear()#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"
            		 value="#year.getDescription()#">
    </td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update year"></td>
  </tr>
</table>
	<cfinput type="hidden" name="yearid" value="#year.getyearid()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#year.getCreatedBy()#">  
	<cfinput type="hidden" name="createddate" value="#year.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>