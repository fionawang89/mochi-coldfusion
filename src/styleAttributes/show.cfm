<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.StyleAttributeid")>
	<cfinvoke component="mochi.cfc.StyleAttributes.StyleAttributeGateway" method="getById" returnvariable="StyleAttribute"> 
		<cfinvokeargument name="id" value="#url.StyleAttributeid#"/>
	</cfinvoke>

    	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Attribute Name :</th>
	    <td width="168">#StyleAttribute.getAttributeName()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Description :</th>
	    <td>#StyleAttribute.getDescription()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#StyleAttribute.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#StyleAttribute.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#StyleAttribute.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#StyleAttribute.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>

</cfif>