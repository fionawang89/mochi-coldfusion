<cfinclude template="../shared/header.cfm"/>

<!--- Maintain filtering variables at session level --->
<cfparam name="SESSION.artworkInfo.artworkID" type="string"default="">

<!--- if the user is submitting the "filter" form --->
<cfif IsDefined("FORM.artworkID")>
	<cfset SESSION.artworkInfo.artworkID = FORM.artworkID>
</cfif>

<cfinvoke  component="mochi.cfc.artworks.artworkGateway" method="getAllAsQuery" returnvariable="artworksList">
</cfinvoke>


<cfquery name="artworks" datasource="#APPLICATION.dataSource#">
    SELECT Artworks.ArtworkID, Artworks.ArtworkName, Artworks.Description, Images.ThumbnailFile
    FROM Artworks LEFT JOIN Images ON (Artworks.EntityTypeID = Images.EntityTypeID) AND (Artworks.ArtworkID = Images.EntityID) 
    WHERE 0=0 
    <!--- if the user provided a filter string for the artwork --->
    <cfif SESSION.artworkInfo.artworkID IS NOT "">
    	AND artworks.artworkID = #SESSION.artworkInfo.artworkID#    		
    </cfif>
    
    ORDER BY ArtworkName ASC
    
</cfquery>

<!--- Number of rows to display per Next/Back page --->
<cfset rowsPerPage = 10>
<!--- What row to start at? Assume first by default --->
<cfparam name="URL.startRow" default="1" type="numeric">
<!--- Allow for Show All parameter in the URL --->
<cfparam name="URL.showAll" type="boolean" default="No">

<!--- We know the total number of rows from query --->
<cfset totalRows = artworks.recordCount>

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
            	<a href="new.cfm">Create New artwork</a>
            </td>
        </tr>
    	<tr>
        	<td colspan="10">
            	<cfinclude template="../shared/NextNIncludeBackNext.cfm">
            </td>
        </tr>
    	<tr>
        	<th>artwork :</th>
        	<th>
            	<cfselect name="artworkID" query="artworksList" queryPosition="below" value="artworkID" display="artworkName" selected="#SESSION.artworkInfo.artworkID#">
                	<option value="">ALL ARTWORKS
            	</cfselect>
            </th>
            <th colspan="9" align="left"><cfinput type="submit" name="submit" value="Apply"></th>
        </tr>
    	<tr>
        	<th>Image</th>
        	<th>Artwork Name</th>
            <th>Description</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>


<cfif artworks.RecordCount IS 0>
	<tr>
    	<th colspan="7">No Data was returned</th>    
    </tr>
<cfelse> 
	<cfloop query="artworks" startrow="#URL.startRow#" endrow="#endRow#">
        <cfoutput>
        <tr>
          <td><img src="/mochi/uploads/artworks/#artworks.artworkID#/images/#artworks.ThumbnailFile#" /></td>
          <td>#artworks.artworkName#</td>
          <td>#artworks.Description#</td>
          <td><a href="update.cfm?artworkid=#artworks.artworkID#">Edit</a></td>
          <td><a href="delete.cfm?artworkid=#artworks.artworkID#">Delete</a></td>
          <td><a href="show.cfm?artworkid=#artworks.artworkID#">View</a></td>
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

