<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.OperationProcessID")>
    
    	<cfif Not IsDefined("form.Dependency")>
        	<cfset form.Dependency = 0>
        </cfif>
    
		<cfinvoke  component="mochi.cfc.operationsProcesses.OperationProcess" method="init" returnvariable="OperationProcess">
			<cfinvokeargument name="stValues" value="#form#"/>
		</cfinvoke>

		<cfinvoke  component="mochi.cfc.operationsProcesses.OperationProcessGateway" method="save">
			<cfinvokeargument name="obj" value="#OperationProcess#"/>
		</cfinvoke>

    <cflocation url="index.cfm">
	
</cfif>



<cfinvoke  component="mochi.cfc.processes.ProcessGateway" method="getAllAsQuery" returnvariable="processes">
</cfinvoke>

<cfinvoke  component="mochi.cfc.operations.OperationGateway" method="getAllAsQuery" returnvariable="operations">
</cfinvoke>

<cfform>

<table width="333" border="1" align="left">
  <tr>  
    <th width="149" scope="row">Process :</th>
    <td width="168">
    	<cfselect query="processes" name="ProcessID" value="ProcessID" display="Process" required="yes" message="Process is required" queryPosition="below">
        	<option value="">Select Process
        </cfselect>
    </td>
  </tr>
  <tr>  
    <th width="149" scope="row">Operation :</th>
    <td width="168">
    	<cfselect query="operations" name="OperationID" value="OperationID" display="Operation" required="yes" message="Operation is required" queryPosition="below">
        	<option value="">Select Operation
        </cfselect>    	
    </td>
  </tr>
  <tr>  
    <th width="149" scope="row">Sequence :</th>
    <td width="168"><cfinput type="text" name="sequence" id="sequence" validate="integer" required="yes" message="Sequence is required" validateat="onsubmit"></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Dependency :</th>
    <td width="168">
    	<cfselect query="operations" name="Dependency" value="OperationID" display="Operation" queryPosition="below">
        	<option value="0">Select Dependency Operation
        </cfselect>    	    
    </td>
  </tr>
  <tr>  
    <th width="149" scope="row">Person In-Charge :</th>
    <td width="168">
    	<cfinput type="text" name="PersonInCharge" required="yes" message="Person In Charge is required" validateat="onsubmit">
    </td>
  </tr>
      <tr>  
        <th width="149" scope="row">Percent Days To Finish:</th>
        <td width="168">
            <cfinput type="text" name="PercentDaysToFinish" validate="float" required="yes" message="Pecent Days To Finish is required" validateat="onsubmit">
        </td>
      </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create Process"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="OperationProcessID" name="OperationProcessID" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>