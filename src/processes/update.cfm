<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.Processid")>

	<cfinvoke  component="mochi.cfc.Processes.Process" method="init" returnvariable="Process">
    	<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.Processes.ProcessGateway" method="save">
		<cfinvokeargument name="obj" value="#Process#"/>
	</cfinvoke>


    <cflocation url="index.cfm">
    
<cfelseif IsDefined("url.Processid")>

	<cfinvoke  component="mochi.cfc.Processes.ProcessGateway" method="getById" returnvariable="Process">
		<cfinvokeargument name="id" value="#url.Processid#"/>
	</cfinvoke>

</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Process :</th>
    <td width="168"><cfinput type="text" name="Process" id="Process"
            		 value="#Process.getProcess()#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"
            		 value="#Process.getDescription()#">
    </td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Process"></td>
  </tr>
</table>
	<cfinput type="hidden" name="Processid" value="#Process.getProcessid()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#Process.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>