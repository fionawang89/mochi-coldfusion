<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.PatternAttributeid")>
	<!--- Check if pattern status already exist in the system to avoid duplication --->
	<cfquery name="qPatternAttribute" datasource="#application.datasource#">
		SELECT PartName
        FROM PatternAttributes
        WHERE PartName =  '#form.PartName#'
	</cfquery>
	
	<!--- If pattern status doesnt exists create one --->
	<cfif qPatternAttribute.RECORDCOUNT IS 0>
    	<cfinvoke  component="mochi.cfc.PatternAttributes.PatternAttribute" method="init" returnvariable="PatternAttribute">
        	<cfinvokeargument name="stValues" value="#form#"/>
		</cfinvoke>

		<cfinvoke  component="mochi.cfc.PatternAttributes.PatternAttributeGateway" method="save">
			<cfinvokeargument name="obj" value="#PatternAttribute#"/>
		</cfinvoke>

	</cfif>
		
    <cflocation url="index.cfm">
	
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>  
    <th width="149" scope="row">Sort :</th>
    <td width="168"><cfinput type="text" name="sort" id="sort"></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Part Name :</th>
    <td width="168"><cfinput type="text" name="PartName" id="PartName"></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Part Description :</th>
    <td width="168"><cfinput type="text" name="PartDescription" id="PartDescription"></td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create Code"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="PatternAttributeid" name="PatternAttributeid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>