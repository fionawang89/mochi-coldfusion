<cfinclude template="../shared/header.cfm"/>

<!--- Maintain filtering variables at session level --->
<cfparam name="SESSION.styleInfo.styleID" type="string"default="">

<!--- if the user is submitting the "filter" form --->
<cfif IsDefined("FORM.styleID")>
	<cfset SESSION.styleInfo.styleID = FORM.styleID>
</cfif>

<cfinvoke  component="mochi.cfc.styles.StyleGateway" method="getAllAsQuery" returnvariable="stylesList">
</cfinvoke>


<cfquery name="styles" datasource="#APPLICATION.dataSource#">
    SELECT DISTINCT Styles.StyleID, Styles.StyleName, Styles.Description, Styles.CreatedBy, Styles.ProductionTeamLeader, Styles.ProductionPatternMaker, Styles.FirstPatternMaker, Styles.CreatedDate, Styles.LastMaintainedBy, Styles.LastMaintainedDate, Images.ThumbnailFile, Styles.PatternDifficulty 
    FROM Styles LEFT JOIN Images ON (Styles.EntityTypeID = Images.EntityTypeID) AND (Styles.StyleID = Images.EntityID)
    WHERE 0=0 
    <!--- if the user provided a filter string for the style --->
    <cfif SESSION.styleInfo.styleID IS NOT "">
    	AND Styles.StyleID = #SESSION.styleInfo.styleID#    		
    </cfif>
    
    ORDER BY StyleName ASC
    
</cfquery>

<!--- Number of rows to display per Next/Back page --->
<cfset rowsPerPage = 10>
<!--- What row to start at? Assume first by default --->
<cfparam name="URL.startRow" default="1" type="numeric">
<!--- Allow for Show All parameter in the URL --->
<cfparam name="URL.showAll" type="boolean" default="No">

<!--- We know the total number of rows from query --->
<cfset totalRows = Styles.recordCount>

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
        	<td colspan="10">
            	<a href="new.cfm">Create New Style</a>
            </td>
        </tr>
    	<tr>
        	<td colspan="10">
            	<cfinclude template="../shared/NextNIncludeBackNext.cfm">
            </td>
        </tr>
    	<tr>
        	<th>Style :</th>
        	<th>
            	<cfselect name="styleID" query="stylesList" queryPosition="below" value="StyleID" display="StyleName" selected="#SESSION.styleInfo.styleID#">
                	<option value="">ALL STYLES
            	</cfselect>
            </th>
            <th colspan="9" align="left"><cfinput type="submit" name="submit" value="Apply"></th>
        </tr>
    	<tr>
        	<th>Image</th>
        	<th>Style Name</th>
            <th>Description</th>
        	<th>Team Leader</th>
        	<th>First Pattern Maker</th>
            <th>Production Pattern Maker</th>
            <th>Pattern Difficulty</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        	<th>&nbsp;</th>            
        </tr>


<cfif styles.RecordCount IS 0>
	<tr>
    	<th colspan="7">No Data was returned</th>    
    </tr>
<cfelse> 
	<cfloop query="styles" startrow="#URL.startRow#" endrow="#endRow#">
        <cfoutput>
        <tr>
          <td><img src="/mochi/uploads/#styles.StyleID#/images/2/#styles.ThumbnailFile#" /></td>
          <td>#styles.StyleName#</td>
          <td>#styles.Description#</td>
          <td>#styles.ProductionTeamLeader#</td>
          <td>#styles.FirstPatternMaker#</td>
          <td>#styles.ProductionPatternMaker#</td>
          <td>#styles.PatternDifficulty#</td>
          <td><a href="update.cfm?styleid=#styles.StyleID#">Edit</a></td>
          <td><a href="delete.cfm?styleid=#styles.StyleID#">Delete</a></td>
          <td><a href="show.cfm?styleid=#styles.StyleID#">View</a></td>
          <td><a href="../sampleRequests/new.cfm?styleid=#styles.StyleID#">Request</a></td>
        </tr>        
        </cfoutput>
	</cfloop>        
        <tr>
        	<td colspan="9" align="right">
            	<cfif not URL.showAll and totalRows gt rowsPerPage>
                	Page <cfinclude template="../shared/NextNIncludePageLinks.cfm">
                </cfif>
            </td> 
        </tr>
</cfif>   

    </table>
</cfform>



