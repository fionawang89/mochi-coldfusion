<cfinclude template="../shared/header.cfm">

<cfif IsDefined("url.sizeid")>

	<cfinvoke  component="mochi.cfc.sizes.SizeGateway" method="getById" returnvariable="size">
		<cfinvokeargument name="id" value="#url.sizeid#"/>
	</cfinvoke>


 <table width="333" border="1" align="left">
  <cfoutput>	
      <tr>
        <th width="149" scope="row">Size :</th>
        <td width="168">#size.getSize()#</td>
      </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#size.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#size.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#size.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#size.getLastMaintainedDate()#</td>
	  </tr>
	</cfoutput>
</table>
</cfif>