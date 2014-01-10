<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.StyleAttributeOptionid")>
	<cfinvoke component="mochi.cfc.StyleAttributeOptions.StyleAttributeOptionGateway" method="getById" returnvariable="StyleAttributeOption"> 
		<cfinvokeargument name="id" value="#url.StyleAttributeOptionid#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.styleAttributes.StyleAttributeGateway" method="getById" returnvariable="StyleAttribute">
		<cfinvokeargument name="id" value="#StyleAttributeOption.getStyleAttributeID()#"/>
	</cfinvoke>

    	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Attribute Value :</th>
	    <td width="168">#StyleAttributeOption.getAttributeValue()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Description :</th>
	    <td>#StyleAttributeOption.getDescription()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Style Attribute :</th>
	    <td>#StyleAttribute.getAttributeName()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#StyleAttributeOption.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#StyleAttributeOption.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#StyleAttributeOption.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#StyleAttributeOption.getLastMaintainedDate()#</td>
	  </tr>
  </cfoutput>
</table>

</cfif>