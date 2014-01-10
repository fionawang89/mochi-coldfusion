<cfinclude template="../shared/header.cfm"/>

<!--- Maintain filtering variables at session level --->
<cfparam name="SESSION.cutInfo.cutNumber" type="string"default="">
<cfparam name="SESSION.cutInfo.style" type="string"default="">
<cfparam name="SESSION.cutInfo.dueMonth" type="string"default="1">

<!--- if the user is submitting the "filter" form --->
<cfif IsDefined("FORM.cutNumber")>
	<cfset SESSION.cutInfo.cutNumber = FORM.cutNumber>
	<cfset SESSION.cutInfo.style = FORM.style>
	<cfset SESSION.cutInfo.dueMonth = FORM.dueMonth>    
</cfif>

<cfquery name="cuts" datasource="mochi">
	SELECT DISTINCT CutNumber 
    FROM ProductionProgressHeader
</cfquery>

<cfquery name="styles" datasource="mochi">
	SELECT DISTINCT Style 
    FROM ProductionProgressHeader
</cfquery>

<cfquery name="productionProgressHeaders" datasource="mochi">
	SELECT *
    FROM ProductionProgressHeader
    WHERE 0=0
    
    <!--- if the user provided a filter string for cut number --->
    <cfif SESSION.cutInfo.cutNumber IS NOT "">
    	AND CutNumber = #SESSION.cutInfo.cutNumber#    		
    </cfif>
    
    <!--- if the user provided a filter string for style --->
    <cfif SESSION.cutInfo.style IS NOT "">
    	AND Style = '#SESSION.cutInfo.style#'    		
    </cfif>
    
    <!--- if the user provided a filter string for month --->
    <cfif SESSION.cutInfo.dueMonth IS NOT "">
    	AND Month(DueDate) = #SESSION.cutInfo.dueMonth#    		
    </cfif>
    
    ORDER BY DueDate ASC
    
</cfquery>

<!--- Number of rows to display per Next/Back page --->
<cfset rowsPerPage = 15>
<!--- What row to start at? Assume first by default --->
<cfparam name="URL.startRow" default="1" type="numeric">
<!--- Allow for Show All parameter in the URL --->
<cfparam name="URL.showAll" type="boolean" default="No">

<!--- We know the total number of rows from query --->
<cfset totalRows = productionProgressHeaders.recordCount>

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

	<div id="tbl-container">
    
	<table border="1">
    	<thead>
    	<tr>
        	<td colspan="54">
            	<cfinclude template="../shared/NextNIncludeBackNext.cfm">
            </td>
        </tr>
        </thead>
        <thead>
        <tr>
        	<th>Cut :</th>
        	<th>
            	<cfselect name="cutNumber" query="cuts" queryPosition="below" value="CutNumber" display="CutNumber" selected="#SESSION.cutinfo.CutNumber#">
                	<option value="">ALL CUTS
            	</cfselect>
            </th>    
        	<th>Style :</th>
        	<th>
            	<cfselect name="style" query="styles" queryPosition="below" value="Style" display="Style" selected="#SESSION.cutinfo.Style#">
                	<option value="">ALL STYLES
                </cfselect>
            </th>    
        	<th>Month :</th>
        	<th>
            	<cfselect name="dueMonth" selected="#SESSION.cutinfo.dueMonth#">
                	<option value="">ALL MONTH
                	<option value="1">JANUARY
                	<option value="2">FEBRUARY
                	<option value="3">MARCH
                	<option value="4">APRIL
                	<option value="5">MAY
                	<option value="6">JUNE
                	<option value="7">JULY
                	<option value="8">AUGUST
                	<option value="9">SEPTEMBER
                	<option value="10">OCTOBER
                	<option value="11">NOVEMBER
                	<option value="12">DECEMBER
                </cfselect>
            </th>    
            <th><cfinput type="submit" name="submit" value="Apply"></th>        
        </tr> 
        </thead>
        <thead>   
    	<tr>
        	<th>Company</th>
            <th>Cut Number</th>
	        <th>Style</th>
    	    <th>Color</th>
        	<th>Issue Date</th>            
        	<th>Due Date</th>            
        	<th>Issued</th>            
        	<th>Contractor</th>            
        	<!---<th>Status</th>            --->
        	<th colspan="3">Production Pattern</th>            
        	<th colspan="3">Graded Pattern</th>            
        	<th colspan="3">Beading Pattern</th>            
        	<th colspan="3">Fabric Ordered</th>            
        	<th colspan="3">Fabric Dispatched</th>            
        	<th colspan="3">Trim Ordered</th>            
        	<th colspan="3">Trim Dispatched</th>            
        	<th colspan="3">Beading Materials Dispatched</th>            
        	<th colspan="3">Tech Pack Spech Sheet</th>            
        	<th colspan="3">Counter Sample</th>            
        	<th colspan="3">Shipping</th>            
        </tr>
        </thead>
        <thead>
        <tr>
        	<th colspan="8">DATES</th>
            
        	<th>Plan </th>                    
        	<th>Finished </th>                    
        	<th></th>                    
            
        	<th>Plan </th>                    
        	<th>Finished </th>                    
        	<th></th>                    
            
        	<th>Plan </th>                    
        	<th>Finished </th>        
        	<th></th>                    
                        
        	<th>Plan </th>                    
        	<th>Finished </th>                    
        	<th></th>                    
            
        	<th>Plan </th>                    
        	<th>Finished </th>                    
        	<th></th>                    
            
        	<th>Plan </th>                    
        	<th>Finished </th>                    
        	<th></th>                    
            
        	<th>Plan </th>                    
        	<th>Finished </th>                    
        	<th></th>                    

        	<th>Plan </th>                    
        	<th>Finished </th>                    
        	<th></th>                    

        	<th>Plan </th>                    
        	<th>Finished </th>                    
        	<th></th>                    

        	<th>Plan </th>                    
        	<th>Finished </th>                    
        	<th></th>                    
            
        	<th>Plan </th>                    
        	<th>Finished </th>                    
        	<th></th>                    
        </tr>
        </thead>
<cfif productionProgressHeaders.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 
        <cfloop query="productionProgressHeaders" startrow="#URL.startRow#" endrow="#endRow#">
        <tr>
          <td><cfoutput>#productionProgressHeaders.CompanyNumber#</cfoutput></td>          
          <td><cfoutput>#productionProgressHeaders.CutNumber#</cfoutput></td>          
          <td><cfoutput>#productionProgressHeaders.Style#</cfoutput></td>          
          <td><cfoutput>#productionProgressHeaders.Color#</cfoutput></td>          
          <td><cfoutput>#DateFormat(productionProgressHeaders.IssueDate, 'mm/dd/yyyy')#</cfoutput></td>          
          <td><cfoutput>#DateFormat(productionProgressHeaders.DueDate, 'mm/dd/yyyy')#</cfoutput></td>          
          <td><cfoutput>#productionProgressHeaders.Issued#</cfoutput></td>          
          <td><cfoutput>#productionProgressHeaders.Contractor#</cfoutput></td>          
          <!---<td><cfoutput>#productionProgressHeaders.Status#</cfoutput></td>          --->
          
          <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressDetailGateway" method="getAllByProductionProgressID" returnvariable="ProductionProgressDetails">
          	<cfinvokeargument name="id" value="#productionProgressHeaders.ProductionProgressID#">
		  </cfinvoke>

		  <cfset X = 1>

          <cfloop query="ProductionProgressDetails">

				  <cfinvoke  component="mochi.cfc.operationsProcesses.OperationProcessGateway" method="getById" returnvariable="OperationProcess">
                  		<cfinvokeargument name="id" value="#ProductionProgressDetails.OperationProcessID#"/>
				  </cfinvoke>

				  <cfinvoke  component="mochi.cfc.operations.OperationGateway" method="getById" returnvariable="Operation">
					<cfinvokeargument name="id" value="#OperationProcess.getOperationID()#"/>
				  </cfinvoke>

                  	
				  <cfif OperationProcess.getProcessID() EQ X>
						<td colspan="9" bgcolor="#00FF00" align="center"> RE ORDER</td>                  
                 
                  <cfset X = 2>
                        
                  </cfif>
                  
		          <!---  Column to check my alignment --->
          		  <!--- <td><cfoutput>#Operation.getOperation()#</cfoutput></td> --->
                  <td><cfoutput>#DateFormat(ProductionProgressDetails.PlanDate, 'mm/dd/yyyy')#</cfoutput></td>
                  <td><cfoutput>#DateFormat(ProductionProgressDetails.FinishedDate, 'mm/dd/yyyy')#</cfoutput></td>	         
                  <td><cfoutput><a href="update.cfm?ProductionProgressDetailID=#productionProgressDetails.ProductionProgressDetailID#">Update</a></cfoutput></td>

          </cfloop>
                    
        </tr>        
        </cfloop>
        <tr>
        	<td colspan="54" align="right">
            	<cfif not URL.showAll and totalRows gt rowsPerPage>
                	Page <cfinclude template="../shared/NextNIncludePageLinks.cfm">
                </cfif>
            </td> 
        </tr>
	</table> 
    
    </div>   
    
</cfif>       
</cfform>        

