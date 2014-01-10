<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.contractorid")>
	<cfset contractor=CreateObject("component", "mochi.cfc.contractors.Contractor").init(form)>
	<cfinvoke component="mochi.cfc.contractors.ContractorGateway" method="save" > 
		<cfinvokeargument name="obj" value="#contractor#"/>
	</cfinvoke>
    <cflocation url="index.cfm">
<cfelseif IsDefined("url.contractorid")>
	<cfinvoke component="mochi.cfc.contractors.ContractorGateway" method="getById" returnvariable="contractor"> 
		<cfinvokeargument name="id" value="#url.contractorid#"/>
	</cfinvoke>
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Contractor :</th>
    <td width="168"><cfinput type="text" name="contractor" id="contractor"
            		 value="#contractor.getContractor()#">
    </td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Contractor"></td>
  </tr>
</table>
	<cfinput type="hidden" name="contractorid" value="#contractor.getContractorID()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#contractor.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>