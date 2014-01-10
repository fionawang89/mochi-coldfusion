<!--- 
 Filename: NextNIncludePageLinks.cfm
 Created by: Nate Weiss (NMW)
 Purpose: Displays Page 1, Page 2... links for record navigation
 Please Note Included by the NextN.cfm templates in this folder
--->

<!--- Simple ÒPageÓ counter, starting at first ÒPageÓ --->
<cfset thisPage = 1>

<!--- Loop thru row numbers, in increments of RowsPerPage --->
<cfloop from="1" to="#totalRows#" step="#rowsPerPage#" index="pageRow">
 
 <!--- Detect whether this ÒPage" currently being viewed --->
 <cfset isCurrentPage = (pageRow gte URL.startRow) and (pageRow lte endRow)>
 
 <!--- If this ÒPage" is current page, show without link --->
 <cfif isCurrentPage>
 <cfoutput><b>#thisPage#</b></cfoutput> 
 <!--- Otherwise, show with link so user can go to page ---> 
 <cfelse>
 <cfoutput>
 <a href="#CGI.script_name#?startRow=#pageRow#">#thisPage#</a>
 </cfoutput> 
 </cfif>

 <!--- Increment ThisPage variable --->
 <cfset thisPage = thisPage + 1>
</cfloop>
