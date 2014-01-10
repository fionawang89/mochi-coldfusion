<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.contractor")>
	<!--- Check if pattern maker already exist in the system to avoid duplication --->
	<cfquery name="qContractor" datasource="#application.datasource#">
		SELECT ContractorID
		FROM Contractors
		WHERE Contractor =  '#form.contractor#'
	</cfquery>
	
	<!--- If patternmaker doesnt exists create one --->
	<cfif qContractor.RECORDCOUNT IS 0>
		<cfset contractor=CreateObject("component", "mochi.cfc.contractors.Contractor").init(form)>
		<cfinvoke component="mochi.cfc.contractors.ContractorGateway" method="save" > 
			<cfinvokeargument name="obj" value="#contractor#"/>
		</cfinvoke>
	</cfif>
		
    <cflocation url="index.cfm">
	
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Contractor :</th>
    <td width="168"><cfinput type="text" name="contractor" id="contractor">
    </td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create Contractor"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="contractorid" name="contractorid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>