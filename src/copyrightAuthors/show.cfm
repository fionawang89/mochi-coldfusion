<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.CopyrightAuthorid")>
	<cfinvoke  component="mochi.cfc.CopyrightAuthors.CopyrightAuthorGateway" method="getById" returnvariable="CopyrightAuthor">
		<cfinvokeargument name="id" value="#url.CopyrightAuthorid#"/>
	</cfinvoke>

	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Code :</th>
	    <td width="168">#CopyrightAuthor.getAuthor()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#CopyrightAuthor.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#CopyrightAuthor.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#CopyrightAuthor.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#CopyrightAuthor.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>