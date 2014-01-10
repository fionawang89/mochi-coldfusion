<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.PatternMakerid")>
	<cfset patternMaker=CreateObject("component", "mochi.cfc.patternMakers.PatternMaker").init(form)>
	<cfinvoke component="mochi.cfc.patternMakers.PatternMakerGateway" method="save" > 
		<cfinvokeargument name="obj" value="#patternMaker#"/>
	</cfinvoke>
    <cflocation url="index.cfm">
<cfelseif IsDefined("url.patternmakerid")>
	
    <cfinvoke component="mochi.cfc.patternMakers.PatternMakerGateway" method="getById" returnvariable="PatternMaker"> 
		<cfinvokeargument name="id" value="#url.patternmakerid#"/>
	</cfinvoke>
    
    <cfinvoke  component="mochi.cfc.locations.LocationGateway" method="getAllAsQuery" returnvariable="locations">
	</cfinvoke>

    
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">First Name :</th>
    <td width="168"><cfinput type="text" name="firstname" id="firstname"
            		 value="#PatternMaker.getFirstName()#">
    </td>
  </tr>
  <tr>
    <th scope="row">Last Name :</th>
    <td><cfinput type="text" name="lastname" id="lastname"
        			 value="#PatternMaker.getLastName()#"></td>
  </tr>
  <tr>
    <th scope="row">Location :</th>
    <td>
    	<cfselect name="LocationID" query="locations" queryPosition="below" value="LocationID" display="Location" required="yes" message="Location is required"
        		  selected="#PatternMaker.getLocationID()#">
        	<option value="0">Select Location
        </cfselect>
    </td>
  </tr>  
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update PatternMaker"></td>
  </tr>
</table>
	<cfinput type="hidden" name="PatternMakerid" value="#PatternMaker.getPatternMakerID()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#PatternMaker.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>