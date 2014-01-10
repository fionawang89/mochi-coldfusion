<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.patternstatusid")>
	
    <cfdump var="#form#">
    
	<cfinvoke  component="mochi.cfc.patternStatus.PatternStatus" method="init" returnvariable="patternStatus">
    	<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.patternStatus.PatternStatusGateway" method="save">
		<cfinvokeargument name="obj" value="#patternStatus#"/>
	</cfinvoke>

	<cflocation url="index.cfm">
    
<cfelseif IsDefined("url.patternstatusid")>

	<cfinvoke  component="mochi.cfc.patternStatus.PatternStatusGateway" method="getById" returnvariable="patternStatus"> 
		<cfinvokeargument name="id" value="#url.patternstatusid#"/>
	</cfinvoke>

</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Status :</th>
    <td width="168"><cfinput type="text" name="status" id="status"
            		 value="#patternStatus.getStatus()#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"
            		 value="#patternStatus.getDescription()#">
    </td>
  </tr>
  <tr>
	<th>Type</th>  	
    <td>
    	<cfselect name="type" required="yes" message="Type information is required"
        		  selected="#patternStatus.getType()#">
        	<option value="A">Approved
            <option value="P">Pending
        </cfselect>
    </td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Pattern Status"></td>
  </tr>
</table>
	<cfinput type="hidden" name="patternstatusid" value="#patternStatus.getpatternstatusid()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#patternStatus.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>