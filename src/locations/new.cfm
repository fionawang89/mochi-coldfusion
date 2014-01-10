<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.location")>
	<!--- Check if location already exist in the system to avoid duplication --->
 	
	<cfquery name="qLocation" datasource="#application.datasource#">
		SELECT LocationID
        FROM Locations
        WHERE Location =  '#form.location#'
	</cfquery>
	
	<!--- If location doesnt exists create one --->
	<cfif qLocation.RECORDCOUNT IS 0>
    	<cfinvoke  component="mochi.cfc.locations.Location" method="init" returnvariable="location">
     	   <cfinvokeargument name="stValues" value="#form#"/>
		</cfinvoke>

		<cfinvoke  component="mochi.cfc.locations.LocationGateway" method="save">
			<cfinvokeargument name="obj" value="#location#"/>
		</cfinvoke>
		
	</cfif>
		
    <cflocation url="index.cfm">
	
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>  
    <th width="149" scope="row">Location :</th>
    <td width="168"><cfinput type="text" name="location" id="location" required="yes" validateat="onsubmit"></td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create Location"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="locationid" name="locationid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>