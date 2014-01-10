<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.operationid")>


	<cfif IsDefined("form.requiredocument")>
		<cfset form.requiredocument=1/>
	<cfelse>
		<cfset form.requiredocument=0 />
	</cfif>

	<cfinvoke  component="mochi.cfc.operations.Operation" method="init" returnvariable="operation">
    	<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.operations.OperationGateway" method="save">
		<cfinvokeargument name="obj" value="#operation#"/>
	</cfinvoke>


    <cflocation url="index.cfm">
    
<cfelseif IsDefined("url.operationid")>


	<cfinvoke  component="mochi.cfc.Operations.OperationGateway" method="getById" returnvariable="Operation">
		<cfinvokeargument name="id" value="#url.operationid#"/>
	</cfinvoke>

</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Operation Code :</th>
    <td width="168"><cfinput type="text" name="Operationcode" id="Operationcode"
            		 value="#Operation.getOperationCode()#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Operation Name :</th>
    <td width="168"><cfinput type="text" name="Operation" id="Operation"
            		 value="#Operation.getOperation()#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"
            		 value="#Operation.getDescription()#">
    </td>
  </tr>
  <tr>  
    <th width="149" scope="row">Document Required :</th>
    <td width="168"><cfinput name="requiredocument" type="checkbox" checked="#Operation.getRequireDocument()#" /></td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Operation"></td>
  </tr>
</table>
	<cfinput type="hidden" name="operationid" value="#Operation.getoperationid()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#Operation.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>