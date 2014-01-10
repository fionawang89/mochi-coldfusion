<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.yearid")>
	<!--- Check if result code already exist in the system to avoid duplication --->
	<cfquery name="qyear" datasource="#application.datasource#">
		SELECT yearID
        FROM years
        WHERE year =  '#TRIM(form.year)#'
	</cfquery>
	
	<!--- If result code doesnt exists create one --->
	<cfif qyear.RECORDCOUNT IS 0>
    
    	<cfinvoke  component="mochi.cfc.years.year" method="init" returnvariable="year">
        	<cfinvokeargument name="stValues" value="#form#"/>
		</cfinvoke>

		<cfinvoke  component="mochi.cfc.years.yearGateway" method="save">
			<cfinvokeargument name="obj" value="#year#"/>
		</cfinvoke>


	</cfif>
		
    <cflocation url="index.cfm">
	
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>  
    <th width="149" scope="row">year :</th>
    <td width="168"><cfinput type="text" name="year" id="year"></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"></td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create year"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="yearid" name="yearid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>