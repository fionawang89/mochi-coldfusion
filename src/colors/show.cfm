<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.colorid")>

	<cfinvoke  component="mochi.cfc.colors.ColorGateway" method="getById" returnvariable="color">
		<cfinvokeargument name="id" value="#url.colorid#"/>
	</cfinvoke>


	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Color Code :</th>
	    <td width="168">#color.getColorCode()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Color Name :</th>
	    <td width="168">#color.getColorName()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Description :</th>
	    <td width="168">#color.getDescription()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#color.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#color.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#color.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#color.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>
</cfif>