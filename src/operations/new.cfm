<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.Operationid")>
	<!--- Check if result code already exist in the system to avoid duplication --->
	<cfquery name="qOperation" datasource="#application.datasource#">
		SELECT OperationID
		FROM Operations
        WHERE OperationCode =  '#form.Operationcode#'
	</cfquery>
	
	<!--- If result code doesnt exists create one --->
	<cfif qOperation.RECORDCOUNT IS 0>
    
		<cfif IsDefined("form.requiredocument")>
            <cfset form.requiredocument=1/>
        <cfelse>
            <cfset form.requiredocument=0 />
        </cfif>

        
        <cfinvoke  component="mochi.cfc.Operations.Operation" method="init" returnvariable="Operation">
			<cfinvokeargument name="stValues" value="#form#"/>
		</cfinvoke>

		<cfinvoke  component="mochi.cfc.Operations.OperationGateway" method="save">
			<cfinvokeargument name="obj" value="#Operation#"/>
		</cfinvoke>

	</cfif>
		
    <cflocation url="index.cfm">
	
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>  
    <th width="149" scope="row">Operation Code :</th>
    <td width="168"><cfinput type="text" name="Operationcode" id="Operationcode"></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Operation :</th>
    <td width="168"><cfinput type="text" name="Operation" id="Operation"></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Document Required :</th>
    <td width="168"><cfinput name="requiredocument" type="checkbox"></td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create Operation"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="Operationid" name="Operationid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>