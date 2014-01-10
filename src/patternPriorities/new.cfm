<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.prioritycode")>
	<!--- Check if pattern status already exist in the system to avoid duplication --->
	<cfquery name="qPatternPriority" datasource="#application.datasource#">
		SELECT PatternPriorityID
        FROM PatternPriorities
        WHERE PriorityCode =  '#form.prioritycode#'
	</cfquery>
	
	<!--- If pattern status doesnt exists create one --->
	<cfif qPatternPriority.RECORDCOUNT IS 0>

    	<cfinvoke  component="mochi.cfc.patternPriorities.PatternPriority" method="init" returnvariable="patternPriority">
        	<cfinvokeargument name="stValues" value="#form#"/>
		</cfinvoke>
       
    	<cfinvoke  component="mochi.cfc.patternPriorities.PatternPriorityGateway" method="save">
			<cfinvokeargument name="obj" value="#patternPriority#"/>
		</cfinvoke>

	</cfif>
		
    <cflocation url="index.cfm">
	
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>  
    <th width="149" scope="row">Priority Code :</th>
    <td width="168"><cfinput type="text" name="prioritycode" id="prioritycode"></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"></td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create Priority Code"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="patternpriorityid" name="patternpriorityid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>