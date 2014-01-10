<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.resultcodeid")>
	<cfinvoke  component="mochi.cfc.resultCodes.ResultCode" method="init" returnvariable="resultCode">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>


    <cfinvoke  component="mochi.cfc.resultCodes.ResultCodeGateway" method="save">
		<cfinvokeargument name="obj" value="#resultCode#"/>
	</cfinvoke>

    <cflocation url="index.cfm">
    
<cfelseif IsDefined("url.resultcodeid")>
	<cfinvoke  component="mochi.cfc.resultCodes.ResultCodeGateway" method="getById" returnvariable="resultCode">
		<cfinvokeargument name="id" value="#url.resultcodeid#"/>
	</cfinvoke>

</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Code :</th>
    <td width="168"><cfinput type="text" name="code" id="code"
            		 value="#resultCode.getCode()#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"
            		 value="#resultCode.getDescription()#">
    </td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Category"></td>
  </tr>
</table>
	<cfinput type="hidden" name="resultcodeid" value="#resultCode.getResultCodeID()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#resultCode.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>