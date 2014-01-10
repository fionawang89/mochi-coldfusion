<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.patternpriorityid")>

   	<cfinvoke  component="mochi.cfc.patternPriorities.PatternPriority" method="init" returnvariable="patternPriority">
       	<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>
       
   	<cfinvoke  component="mochi.cfc.patternPriorities.PatternPriorityGateway" method="save">
		<cfinvokeargument name="obj" value="#patternPriority#"/>
	</cfinvoke>

    <cflocation url="index.cfm">
    
<cfelseif IsDefined("url.patternpriorityid")>

	<cfinvoke  component="mochi.cfc.patternPriorities.PatternPriorityGateway" method="getById" returnvariable="patternPriority">
		<cfinvokeargument name="id" value="#url.patternpriorityid#"/>
	</cfinvoke>

</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Status :</th>
    <td width="168"><cfinput type="text" name="priorityCode" id="priorityCode"
            		 value="#patternPriority.getPriorityCode()#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"
            		 value="#patternPriority.getDescription()#">
    </td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Pattern Priority"></td>
  </tr>
</table>
	<cfinput type="hidden" name="patternpriorityid" value="#patternPriority.getpatternpriorityid()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#patternPriority.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>