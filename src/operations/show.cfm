<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.Operationid")>

	<cfinvoke  component="mochi.cfc.Operations.OperationGateway" method="getById" returnvariable="Operation">
		<cfinvokeargument name="id" value="#url.Operationid#"/>
	</cfinvoke>


	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Operation Code :</th>
	    <td width="168">#Operation.getOperationCode()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Operation :</th>
	    <td width="168">#Operation.getOperation()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Description :</th>
	    <td width="168">#Operation.getDescription()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Document Required :</th>
	    <td width="168">#Operation.getRequireDocument()#</td>
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