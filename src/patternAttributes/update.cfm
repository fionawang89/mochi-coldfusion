<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.PatternAttributeid")>
	
    <cfdump var="#form#">
    
	<cfinvoke  component="mochi.cfc.PatternAttributes.PatternAttribute" method="init" returnvariable="PatternAttribute">
    	<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.PatternAttributes.PatternAttributeGateway" method="save">
		<cfinvokeargument name="obj" value="#PatternAttribute#"/>
	</cfinvoke>

	<cflocation url="index.cfm">
    
<cfelseif IsDefined("url.PatternAttributeid")>

	<cfinvoke  component="mochi.cfc.PatternAttributes.PatternAttributeGateway" method="getById" returnvariable="PatternAttribute"> 
		<cfinvokeargument name="id" value="#url.PatternAttributeid#"/>
	</cfinvoke>

</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Sort :</th>
    <td width="168"><cfinput type="text" name="sort" id="sort"
            		 value="#PatternAttribute.getSort()#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Part Name :</th>
    <td width="168"><cfinput type="text" name="partname" id="partname"
            		 value="#PatternAttribute.getPartName()#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Part Description :</th>
    <td width="168"><cfinput type="text" name="partdescription" id="partdescription"
            		 value="#PatternAttribute.getPartDescription()#">
    </td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Pattern Attribute"></td>
  </tr>
</table>
	<cfinput type="hidden" name="PatternAttributeid" value="#PatternAttribute.getPatternAttributeid()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#PatternAttribute.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>