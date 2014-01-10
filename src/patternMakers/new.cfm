<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.firstname")>
	<!--- Check if pattern maker already exist in the system to avoid duplication --->
	<cfquery name="qPatternMaker" datasource="#application.datasource#">
		SELECT PatternMakerID
		FROM PatternMakers
		WHERE FirstName =  '#form.firstname#'
		AND   LastName = '#form.lastname#'
	</cfquery>
	
	<!--- If patternmaker doesnt exists create one --->
	<cfif qPatternMaker.RECORDCOUNT IS 0>
		<cfset patternMaker=CreateObject("component", "mochi.cfc.patternMakers.PatternMaker").init(form)>
		<cfinvoke component="mochi.cfc.patternMakers.PatternMakerGateway" method="save" > 
			<cfinvokeargument name="obj" value="#patternMaker#"/>
		</cfinvoke>
	</cfif>
		
    <cflocation url="index.cfm">
	
</cfif>

<cfinvoke  component="mochi.cfc.locations.LocationGateway" method="getAllAsQuery" returnvariable="locations">
</cfinvoke>


<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">First Name :</th>
    <td width="168"><cfinput type="text" name="firstname" id="firstname">
    </td>
  </tr>
  <tr>
    <th scope="row">Last Name :</th>
    <td><cfinput type="text" name="lastname" id="lastname"></td>
  </tr>
  <tr>
    <th scope="row">Location :</th>
    <td>
    	<cfselect name="LocationID" query="locations" queryPosition="below" value="LocationID" display="Location" required="yes" message="Location is required">
        	<option value="0">Select Location
        </cfselect>
    </td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create PatternMaker"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="patternmakerid" name="patternmakerid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>