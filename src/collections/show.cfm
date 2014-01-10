<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.collectionid")>

	<cfinvoke  component="mochi.cfc.collections.CollectionGateway" method="getById" returnvariable="collection">
		<cfinvokeargument name="id" value="#url.collectionid#"/>
	</cfinvoke>

 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Code :</th>
	    <td width="168">#collection.getcollection()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#collection.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#collection.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#collection.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#collection.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>