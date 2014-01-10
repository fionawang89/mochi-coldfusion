<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.productionDetailStatusid")>

	<cfinvoke  component="mochi.cfc.productionDetailStatus.productionDetailStatusGateway" method="getById" returnvariable="productionDetailStatus">
		<cfinvokeargument name="id" value="#url.productionDetailStatusid#"/>
	</cfinvoke>
    
    <cfinvoke  component="mochi.cfc.operations.OperationGateway" method="getById" returnvariable="Operation">
		<cfinvokeargument name="id" value="#productionDetailStatus.getOperationID()#"/>
	</cfinvoke>



	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Status :</th>
	    <td width="168">#productionDetailStatus.getStatus()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Status Code :</th>
	    <td width="168">#productionDetailStatus.getStatusCode()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Description :</th>
	    <td width="168">#productionDetailStatus.getDescription()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Operation :</th>
	    <td width="168">#Operation.getOperation()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Type :</th>
	    <td width="168">#productionDetailStatus.getType()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#productionDetailStatus.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#productionDetailStatus.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#productionDetailStatus.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#productionDetailStatus.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>