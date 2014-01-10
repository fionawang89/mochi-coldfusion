<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.Processid")>
	<!--- Check if result code already exist in the system to avoid duplication --->
	<cfquery name="qProcess" datasource="#application.datasource#">
		SELECT Processid
		FROM Processes
        WHERE Process =  '#form.Process#'
	</cfquery>
	
	<!--- If result code doesnt exists create one --->
	<cfif qProcess.RECORDCOUNT IS 0>
    	
        <cfinvoke  component="mochi.cfc.Processes.Process" method="init" returnvariable="Process">
			<cfinvokeargument name="stValues" value="#form#"/>
		</cfinvoke>

		<cfinvoke  component="mochi.cfc.Processes.ProcessGateway" method="save">
			<cfinvokeargument name="obj" value="#Process#"/>
		</cfinvoke>

	</cfif>
		
    <cflocation url="index.cfm">
	
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>  
    <th width="149" scope="row">Process :</th>
    <td width="168"><cfinput type="text" name="Process" id="Process"></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"></td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create Process"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="Processid" name="Processid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>