<cfinclude template="../shared/header.cfm"/>

<!--- Maintain filtering variables at session level --->
<cfparam name="SESSION.materialInfo.materialID" type="string"default="">

<!--- if the user is submitting the "filter" form --->
<cfif IsDefined("FORM.MaterialID")>
	<cfset SESSION.materialInfo.materialID = FORM.materialID>
</cfif>

<cfinvoke  component="mochi.cfc.Materials.MaterialGateway" method="getAllAsQuery" returnvariable="MaterialsList">
</cfinvoke>


<cfquery name="Materials" datasource="#APPLICATION.dataSource#">
	SELECT Materials.MaterialID, Materials.MaterialCode, Materials.Description, Materials.Width, Materials.Content, MaterialTypes.MaterialType, MaterialCategories.Category   
	FROM ((Materials INNER JOIN MaterialTypes ON Materials.MaterialTypeID = MaterialTypes.MaterialTypeID) 
    INNER JOIN MaterialCategories ON MaterialCategories.MaterialCategoryID = Materials.MaterialCategoryID)
    WHERE 0=0 
    <!--- if the user provided a filter string for the Material --->
	<cfif SESSION.MaterialInfo.MaterialID IS NOT "">
    	AND Materials.MaterialID = #SESSION.MaterialInfo.MaterialID#    		
    </cfif>
    
    ORDER BY MaterialCode ASC
    
</cfquery>

<!--- Number of rows to display per Next/Back page --->
<cfset rowsPerPage = 10>
<!--- What row to start at? Assume first by default --->
<cfparam name="URL.startRow" default="1" type="numeric">
<!--- Allow for Show All parameter in the URL --->
<cfparam name="URL.showAll" type="boolean" default="No">

<!--- We know the total number of rows from query --->
<cfset totalRows = Materials.recordCount>

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
        	<td colspan="9">
            	<a href="new.cfm">Create New Material</a>
            </td>
        </tr>
    	<tr>
        	<td colspan="9">
            	<cfinclude template="../shared/NextNIncludeBackNext.cfm">
            </td>
        </tr>
    	<tr>
        	<th>Material :</th>
        	<th>
            	<cfselect name="MaterialID" query="MaterialsList" queryPosition="below" value="MaterialID" display="MaterialCode" selected="#SESSION.MaterialInfo.MaterialID#">
                	<option value="">ALL MATERIALS
            	</cfselect>
            </th>
            <th colspan="9" align="right"><cfinput type="submit" name="submit" value="Apply"></th>
        </tr>
    	<tr>
        	<th>Material Code</th>
            <th>Description</th>
        	<th>Width</th>
        	<th>Content</th>
        	<th>Type</th>
        	<th>Category</th>
	        <th>&nbsp;</th>
    	    <th>&nbsp;</th>
        	<th>&nbsp;</th>            
        </tr>


<cfif Materials.RecordCount IS 0>
	<tr>
    	<th colspan="9">No Data was returned</th>    
    </tr>
<cfelse> 
	<cfloop query="Materials" startrow="#URL.startRow#" endrow="#endRow#">
    
        <cfoutput>
        <tr>
          <td>#Materials.MaterialCode#</td>
          <td>#Materials.Description#</td>
          <td>#Materials.Width#</td>
          <td>#Materials.Content#</td>
          <td>#Materials.MaterialType#</td>
          <td>#Materials.Category#</td>
          <td><a href="update.cfm?Materialid=#Materials.MaterialID#">Edit</a></td>
          <td><a href="delete.cfm?Materialid=#Materials.MaterialID#">Delete</a></td>
          <td><a href="show.cfm?Materialid=#Materials.MaterialID#">View</a></td>
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

