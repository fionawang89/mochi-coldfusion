<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.resultcodeid")>
	<cfinvoke  component="mochi.cfc.resultCodes.ResultCodeGateway" method="getById" returnvariable="resultCode">
		<cfinvokeargument name="id" value="#url.resultcodeid#"/>
	</cfinvoke>


	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Code :</th>
	    <td width="168">#resultCode.getCode()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Description :</th>
	    <td width="168">#resultCode.getDescription()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#resultCode.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#resultCode.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#resultCode.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#resultCode.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>