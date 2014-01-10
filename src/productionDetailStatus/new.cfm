<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.productionDetailStatusid")>
	<!--- Check if result code already exist in the system to avoid duplication --->
	<cfquery name="qproductionDetailStatus" datasource="#application.datasource#">
		SELECT productionDetailStatusID
        FROM productionDetailStatus
        WHERE Status =  '#TRIM(form.status)#'
	</cfquery>
	
	<!--- If result code doesnt exists create one --->
	<cfif qproductionDetailStatus.RECORDCOUNT IS 0>
    
    	<cfinvoke  component="mochi.cfc.productionDetailStatus.productionDetailStatus" method="init" returnvariable="productionDetailStatus">
        	<cfinvokeargument name="stValues" value="#form#"/>
		</cfinvoke>

		<cfinvoke  component="mochi.cfc.productionDetailStatus.productionDetailStatusGateway" method="save">
			<cfinvokeargument name="obj" value="#productionDetailStatus#"/>
		</cfinvoke>


	</cfif>
		
    <cflocation url="index.cfm">
	
</cfif>

<cfinvoke  component="mochi.cfc.operations.OperationGateway" method="getAllAsQuery" returnvariable="operations">
</cfinvoke>


<cfform>

<table width="333" border="1" align="left">
  <tr>  
    <th>Status :</th>
    <td><cfinput type="text" name="status" id="status" required="yes" message="Status information is required"></td>
  </tr>
  <tr>
    <th>Status Code :</th>
    <td><cfinput type="text" name="statuscode" id="statuscode" required="yes" message="Status Code information is required"></td>
  </tr>
  <tr>  
    <th>Description :</th>
    <td><cfinput type="text" name="description" id="description"></td>
  </tr>
  <tr>
  	<th>Operation :</th>
    <td>
    	<cfselect name="OperationID" query="operations" value="OperationID" display="Operation" required="yes" message="Operation information is required" queryPosition="below">
    		<option value="">SELECT AN OPERATION
    	</cfselect>
    </td>
  </tr>
  <tr>
  	<th>Type :</th>
  	<td>
 		<cfselect name="Type" required="yes" message="Type information is required">
        	<option value="">SELECT TYPE
            <option value="I">Issue</option>
            <option value="E">Exception</option>
            <option value="P">Pending</option>
       	</cfselect>
	</td>        
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create Status"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="productionDetailStatusid" name="productionDetailStatusid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>