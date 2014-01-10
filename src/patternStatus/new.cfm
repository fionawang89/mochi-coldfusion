<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.patternstatusid")>
	<!--- Check if pattern status already exist in the system to avoid duplication --->
	<cfquery name="qPatternStatus" datasource="#application.datasource#">
		SELECT Status
        FROM PatternStatus
        WHERE Status =  '#form.status#'
	</cfquery>
	
	<!--- If pattern status doesnt exists create one --->
	<cfif qPatternStatus.RECORDCOUNT IS 0>
    	<cfinvoke  component="mochi.cfc.patternStatus.PatternStatus" method="init" returnvariable="patternStatus">
        	<cfinvokeargument name="stValues" value="#form#"/>
		</cfinvoke>

		<cfinvoke  component="mochi.cfc.patternStatus.PatternStatusGateway" method="save">
			<cfinvokeargument name="obj" value="#patternStatus#"/>
		</cfinvoke>

	</cfif>
		
    <cflocation url="index.cfm">
	
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>  
    <th width="149" scope="row">Code :</th>
    <td width="168"><cfinput type="text" name="status" id="status"></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"></td>
  </tr>
  <tr>
	<th>Type</th>  	
    <td>
    	<cfselect name="type" required="yes" message="Type information is required">
        	<option value="A">Approved
            <option value="P">Pending
        </cfselect>
    </td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create Code"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="patternstatusid" name="patternstatusid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>