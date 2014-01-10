<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.OperationProcessId")>

	<cfinvoke  component="mochi.cfc.operationsProcesses.OperationProcessGateway" method="getById" returnvariable="OperationProcess">
		<cfinvokeargument name="id" value="#url.OperationProcessId#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.operations.OperationGateway" method="getById" returnvariable="Operation">
		<cfinvokeargument name="id" value="#OperationProcess.getOperationID()#"/>
	</cfinvoke>

    <cfinvoke  component="mochi.cfc.processes.ProcessGateway" method="getById" returnvariable="Process">
        <cfinvokeargument name="id" value="#OperationProcess.getProcessID()#"/>
    </cfinvoke>

	<cfinvoke  component="mochi.cfc.operations.OperationGateway" method="getById" returnvariable="OperationDependency">
		<cfinvokeargument name="id" value="#OperationProcess.getDependency()#"/>
	</cfinvoke>
   
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Process :</th>
	    <td width="168">#Process.getProcess()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Operation :</th>
	    <td width="168">#Operation.getOperation()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Sequence :</th>
	    <td width="168">#OperationProcess.getSequence()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Dependency :</th>
	    <td width="168">#OperationDependency.getOperation()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Person In-Charge :</th>
	    <td width="168">#OperationDependency.getPersonInCharge()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Percent Days to Finish :</th>
	    <td width="168">#OperationDependency.getPercentDaysToFinish()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#Operation.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#Operation.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#Operation.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#Operation.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>