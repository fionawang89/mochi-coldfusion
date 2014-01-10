<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.PatternMakerid")>
	<cfinvoke component="mochi.cfc.patternMakers.PatternMakerGateway" method="getById" returnvariable="PatternMaker"> 
		<cfinvokeargument name="id" value="#url.patternmakerid#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.locations.LocationGateway" method="getById" returnvariable="Location">
		<cfinvokeargument name="id" value="#PatternMaker.getLocationID()#"/>
	</cfinvoke>

	<!--- search for styles with Pattern Maker ID information --->
    
    <cfquery name="qStyles" datasource="mochi">
    	SELECT StyleName 
        FROM Styles 
        WHERE ProductionTeamLeader LIKE '%#PatternMaker.getFirstName()#%' OR FirstPatternMaker LIKE '%#PatternMaker.getFirstName()#%' OR ProductionPatternMaker LIKE '%#PatternMaker.getFirstName()#%'            
        ORDER BY LastMaintainedDate DESC 
    </cfquery>
    	
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">First Name :</th>
	    <td width="168">#PatternMaker.getFirstName()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Name :</th>
	    <td>#PatternMaker.getLastName()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Location :</th>
	    <td>#Location.getLocation()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#PatternMaker.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#PatternMaker.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#PatternMaker.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#PatternMaker.getLastMaintainedDate()#</td>
	  </tr>
      <tr>
      	<td>Styles</td>
        <td>
        	<ul>
				<cfloop query="qStyles">
			    	<li>#qStyles.StyleName#</li>
			    </cfloop>
			</ul>   		     
        </td>
      </tr>
  </cfoutput>
</table>

</cfif>