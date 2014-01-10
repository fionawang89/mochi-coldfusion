<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.operationprocessid")>

    
    <cfif Not IsDefined("form.Dependency")>
       	<cfset form.Dependency = 0>
    </cfif>
    
	<cfinvoke  component="mochi.cfc.operationsProcesses.OperationProcess" method="init" returnvariable="operationProcess">
    	<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.operationsProcesses.OperationProcessGateway" method="save">
		<cfinvokeargument name="obj" value="#operationProcess#"/>
	</cfinvoke>

    <cflocation url="index.cfm">
    
<cfelseif IsDefined("url.operationprocessid")>

	<cfinvoke  component="mochi.cfc.operationsProcesses.OperationProcessGateway" method="getById" returnvariable="OperationProcess">
		<cfinvokeargument name="id" value="#url.operationprocessid#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.operations.OperationGateway" method="getAllAsQuery" returnvariable="operations">
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.processes.ProcessGateway" method="getAllAsQuery" returnvariable="processes">
	</cfinvoke>

    <cfform>
    
    <table width="333" border="1" align="left">
      <tr>
        <th width="149" scope="row">Process :</th>
        <td width="168">
	        <cfselect name="ProcessID" query="processes" value="ProcessID" display="Process" selected="#OperationProcess.getProcessID()#"></cfselect>    
        </td>
      </tr>
      <tr>
        <th width="149" scope="row">Operation :</th>
        <td width="168">
	        <cfselect name="OperationID" query="operations" value="OperationID" display="Operation" selected="#OperationProcess.getOperationID()#"></cfselect>    
        </td>
      </tr>
      <tr>
        <th width="149" scope="row">Sequence :</th>
        <td width="168"><cfinput type="text" name="sequence" id="sequence" value="#OperationProcess.getSequence()#" required="yes" message="Sequence is required">
        </td>
      </tr>
      <tr>
        <th width="149" scope="row">Dependency :</th>
        <td width="168">
	        <cfselect name="Dependency" query="operations" value="OperationID" display="Operation" selected="#OperationProcess.getDependency()#" queryPosition="below">
            	<option value="0">Select Dependency
            </cfselect>    
        </td>
      </tr>
      <tr>  
        <th width="149" scope="row">Person In-Charge :</th>
        <td width="168">
            <cfinput type="text" name="PersonInCharge" value="#OperationProcess.getPersonInCharge()#" required="yes" message="Person In Charge is required" validateat="onsubmit">
        </td>
      </tr>
      <tr>  
        <th width="149" scope="row">Percent Days To Finish:</th>
        <td width="168">
            <cfinput type="text" name="PercentDaysToFinish" value="#OperationProcess.getPercentDaysToFinish()#" validate="float" required="yes" message="Pecent Days To Finish is required" validateat="onsubmit">
        </td>
      </tr>
      <tr>
        <td colspan="2"><cfinput type="submit" name="submit" value="Update Process"></td>
      </tr>
    </table>
        <cfinput type="hidden" name="operationprocessid" value="#OperationProcess.getoperationprocessid()#">
    
        <!--- Timestamps  --->
        <cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
        <cfinput type="hidden" name="createddate" value="#OperationProcess.getCreatedDate()#">
        <cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
        <cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    
    
    </cfform>

</cfif>

