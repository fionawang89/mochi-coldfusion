<cfinclude template="../shared/header.cfm"/>

<!--- Maintain filtering variables at session level --->
<cfparam name="SESSION.colorInfo.colorID" type="string"default="">

<!--- if the user is submitting the "filter" form --->
<cfif IsDefined("FORM.colorID")>
	<cfset SESSION.colorInfo.colorID = FORM.colorID>
</cfif>

<cfinvoke  component="mochi.cfc.colors.ColorGateway" method="getAllAsQuery"	 returnvariable="colorsList">
</cfinvoke>

<cfquery name="colors" datasource="#APPLICATION.DATASOURCE#">
	SELECT *	
    FROM Colors
    WHERE 0 = 0
    
    <!--- if the user provided a filter string for the color --->
    <cfif SESSION.colorInfo.colorID IS NOT "">
    	AND Colors.ColorID = #SESSION.colorInfo.colorID#    		
    </cfif>
    
    ORDER BY ColorCode ASC
        
</cfquery>
		
<!--- Number of rows to display per Next/Back page --->
<cfset rowsPerPage = 15>
<!--- What row to start at? Assume first by default --->
<cfparam name="URL.startRow" default="1" type="numeric">
<!--- Allow for Show All parameter in the URL --->
<cfparam name="URL.showAll" type="boolean" default="No">

<!--- We know the total number of rows from query --->
<cfset totalRows = Colors.recordCount>

<!--- Show all on the page if showAll passed in the URL --->
<cfif URL.showAll>
	<cfset rowsPerPage = totalRows>
</cfif>

<!--- Last row is 10 rows past the starting row, or --->
<!--- total number of query rows, whichever is less --->
<cfset endRow = min(URL.startRow + rowsPerPage - 1, totalRows)>

<!--- Next button goes to 1 past current end row --->
<cfset startRowNext = endRow + 1>

<!--- Back button goes N rows from start row --->
<cfset startRowBack = URL.startRow - rowsPerPage>

	<cfform method="post" action="#CGI.SCRIPT_NAME#">	
        <table border="1">
            <tr>
                <td colspan="6">
                    <a href="new.cfm">Create New Color</a>
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <cfinclude template="../shared/NextNIncludeBackNext.cfm">
                </td>
            </tr>
            <tr>
                <th>Style :</th>
                <th>
                    <cfselect name="colorID" query="colorsList" queryPosition="below" value="colorID" display="ColorCode" selected="#SESSION.ColorInfo.colorID#">
                        <option value="">ALL COLORS
                    </cfselect>
                </th>
                <th colspan="4"><cfinput type="submit" name="submit" value="Apply"></th>
            </tr>
            <tr>
                <th>Color Code</th>
                <th>Color Name</th>
                <th>Description</th>
                <th>&nbsp;</th>
                <th>&nbsp;</th>
                <th>&nbsp;</th>            
            </tr>


	<cfif colors.RecordCount IS 0>
        <tr>
        	<th colspan="6">No Data was returned</th>        
        </tr>
    <cfelse> 
		<cfloop query="colors" startrow="#URL.startRow#" endrow="#endRow#">
			<cfoutput>						
            <tr>
              <td>#colors.ColorCode#</td>          
              <td>#colors.ColorName#</td>          
              <td>#colors.Description#</td>          
              <td><a href="update.cfm?ColorID=#colors.ColorID#">Edit</a></td>
    
              <td><a href="delete.cfm?ColorID=#colors.ColorID#">Delete</a></td>
              <td><a href="show.cfm?ColorID=#colors.ColorID#">View</a></td>
            </tr>        
            </cfoutput>
      	</cfloop> 
            <tr>
                <td colspan="6" align="right">
                    <cfif not URL.showAll and totalRows gt rowsPerPage>
                        Page <cfinclude template="../shared/NextNIncludePageLinks.cfm">
                    </cfif>
                </td> 
            </tr>        
	</cfif>           
        </table>
	</cfform>        

