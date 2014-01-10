<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.CopyrightApplicationStatusid")>
	<cfinvoke  component="mochi.cfc.CopyrightApplicationStatus.CopyrightApplicationStatus" method="init" returnvariable="CopyrightApplicationStatus">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.CopyrightApplicationStatus.CopyrightApplicationStatusGateway" method="save">
		<cfinvokeargument name="obj" value="#CopyrightApplicationStatus#"/>
	</cfinvoke>


    <cflocation url="index.cfm">
    
<cfelseif IsDefined("url.CopyrightApplicationStatusid")>
	<cfinvoke  component="mochi.cfc.CopyrightApplicationStatus.CopyrightApplicationStatusGateway" method="getById" returnvariable="CopyrightApplicationStatus">
		<cfinvokeargument name="id" value="#url.CopyrightApplicationStatusid#"/>
	</cfinvoke>

</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Status :</th>
    <td width="168"><cfinput type="text" name="status" id="status"
            		 value="#CopyrightApplicationStatus.getStatus()#">
    </td>
  </tr>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Category"></td>
  </tr>
</table>
	<cfinput type="hidden" name="CopyrightApplicationStatusid" value="#CopyrightApplicationStatus.getCopyrightApplicationStatusid()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#CopyrightApplicationStatus.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>