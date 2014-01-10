<cfinclude template="../shared/header.cfm"/>

<!--- Maintain filtering variables at session level --->
<cfparam name="SESSION.cutInfo.cutNumber" type="string"default="">
<cfparam name="SESSION.cutInfo.style" type="string"default="">
<cfparam name="SESSION.cutInfo.keyword" type="string"default="">
<cfparam name="SESSION.cutInfo.fromDueDate" type="string"default="">
<cfparam name="SESSION.cutInfo.toDueDate" type="string"default="">
<cfparam name="SESSION.cutInfo.fromIssueDate" type="string"default="">
<cfparam name="SESSION.cutInfo.toIssueDate" type="string"default="">
<cfparam name="SESSION.cutInfo.contractor" type="string"default="">

<!--- if the user is submitting the "filter" form --->
<cfif IsDefined("FORM.cutNumber")>
	<cfset SESSION.cutInfo.cutNumber = FORM.cutNumber>
	<cfset SESSION.cutInfo.style = FORM.style>
	<cfset SESSION.cutInfo.keyword = FORM.keyword>
	<cfset SESSION.cutInfo.fromDueDate= FORM.fromDueDate>    
	<cfset SESSION.cutInfo.toDueDate= FORM.toDueDate>    
	<cfset SESSION.cutInfo.fromIssueDate= FORM.fromIssueDate>    
	<cfset SESSION.cutInfo.toIssueDate= FORM.toIssueDate>    
	<cfset SESSION.cutInfo.contractor= FORM.contractor>        
</cfif>

<cfquery name="cuts" datasource="mochi">
	SELECT DISTINCT CutNumber 
    FROM ProductionProgressHeader
    WHERE Status = 1
</cfquery>

<cfquery name="styles" datasource="mochi">
	SELECT DISTINCT Style 
    FROM ProductionProgressHeader
    WHERE Status = 1
</cfquery>

<cfquery name="productionProgressHeaders" datasource="mochi">
	SELECT *
    FROM ProductionProgressHeader
    WHERE Status = 1
    
    <!--- if the user provided a filter string for cut number --->
    <cfif SESSION.cutInfo.cutNumber IS NOT "">
    	AND CutNumber = #SESSION.cutInfo.cutNumber#    		
    </cfif>
    
    <!--- if the user provided a filter string for style --->
    <cfif SESSION.cutInfo.style IS NOT "">
    	AND Style = '#SESSION.cutInfo.style#'    		
    </cfif> 
    
    <!--- if the user provided a filter string for the keyword --->
    <cfif SESSION.cutInfo.keyword IS NOT "">
    	AND Style LIKE '%#SESSION.cutInfo.keyword#%'   
        
        <cfif IsNumeric(SESSION.cutInfo.keyword)>
	        OR  CutNumber = #SESSION.cutInfo.keyword# 		
        </cfif>    
        
    </cfif>
        
    <!--- if the user provided a filter string for the from due month --->
    <cfif SESSION.cutInfo.fromDueDate IS NOT "">
    	AND DueDate >= #CreateODBCDate(SESSION.cutInfo.fromDueDate)#    		
    </cfif>

    <!--- if the user provided a filter string for the to due month --->
    <cfif SESSION.cutInfo.toDueDate IS NOT "">
    	AND DueDate <= #CreateODBCDate(SESSION.cutInfo.toDueDate)#    		
    </cfif>
    
    <!--- if the user provided a filter string for the from due month --->
    <cfif SESSION.cutInfo.fromIssueDate IS NOT "">
    	AND IssueDate >= #CreateODBCDate(SESSION.cutInfo.fromIssueDate)#    		
    </cfif>

    <!--- if the user provided a filter string for the to due month --->
    <cfif SESSION.cutInfo.toIssueDate IS NOT "">
    	AND IssueDate <= #CreateODBCDate(SESSION.cutInfo.toIssueDate)#    		
    </cfif>

    <!--- if the user provided a filter string for the contractor --->
    <cfif SESSION.cutInfo.contractor IS NOT "">
    	AND Contractor = '#SESSION.cutInfo.contractor#'    		
    </cfif>
        
    ORDER BY DueDate, CutNumber ASC
    
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

<cfquery name="contractors" datasource="#APPLICATION.DATASOURCE#">
	SELECT DISTINCT Contractor
    FROM ProductionProgressHeader
    ORDER BY Contractor ASC
</cfquery>

<cfform method="post" action="#CGI.SCRIPT_NAME#">

	<div id="tbl-container">
    
	<table>
    	<thead>
    	<tr>
        	<th colspan="54" class="link">
            	<cfinclude template="../shared/NextNIncludeBackNext.cfm">
            </th>
        </tr>
        </thead>
        <thead>
        <tr>
        	<th class="locked">Cut :</th>
        	<th class="locked">Style :</th>
        	<th class="locked" colspan="2">Contractor :</th>
            <th class="locked">Keyword :</th>
        	<th class="locked" colspan="6">Due Dates :</th>
        	<th class="locked" colspan="6">Issue Dates :</th>            
        </tr>
        <tr>
        	<th class="locked">
            	<cfselect name="cutNumber" query="cuts" queryPosition="below" value="CutNumber" display="CutNumber" selected="#SESSION.cutinfo.CutNumber#">
                	<option value="">ALL CUTS
            	</cfselect>
            </th>    
        	<th class="locked">
            	<cfselect name="style" query="styles" queryPosition="below" value="Style" display="Style" selected="#SESSION.cutinfo.Style#">
                	<option value="">ALL STYLES
                </cfselect>
            </th>    
        	<th class="locked" colspan="2">
            	<cfselect name="contractor" query="contractors" queryPosition="below" value="Contractor" display="Contractor" selected="#SESSION.cutinfo.Contractor#">
                	<option value="">ALL CONTRACTORS
                </cfselect>
            </th>    
            <th><cfinput type="text" name="keyword" value="#SESSION.cutInfo.keyword#"></th>
            <!--- Due Dates --->
            <th class="locked">From :</th>
        	<th class="locked" colspan="2"><cfinput type="datefield" name="fromDueDate" value="#SESSION.cutInfo.fromDueDate#"></th>
            <th class="locked">To :</th>
        	<th class="locked" colspan="2"><cfinput type="datefield" name="toDueDate" value="#SESSION.cutInfo.toDueDate#"></th>
                        
            <!--- Issue Dates --->
            <th class="locked">From :</th>
        	<th class="locked" colspan="2"><cfinput type="datefield" name="fromIssueDate" value="#SESSION.cutInfo.fromIssueDate#"></th>
            <th class="locked">To :</th>
        	<th class="locked" colspan="2"><cfinput type="datefield" name="toIssueDate" value="#SESSION.cutInfo.toIssueDate#"></th>
            
            <th class="locked" rowspan="2"><cfinput type="submit" name="submit" value="Apply"></th>     
        </tr> 
        </thead>
        <thead>   
    	<tr>
        	<th class="locked">Company</th>
            <th class="locked">Cut Number</th>
	        <th class="locked">Style</th>
    	    <th class="locked">Color</th>
        	<th class="locked">Issue Date</th>            
        	<th class="locked">Due Date</th>            
        	<th class="locked">Issued</th>            
        	<th class="locked">Contractor</th>            
        	<!---<th>Status</th>            --->
        	<th>Negotiate Price</th>            
        	<th>Production Pattern</th>            
        	<th>Graded Pattern</th>            
        	<th>Beading Pattern</th>            
        	<th>Fabric Ordered</th>            
        	<th>Fabric Dispatched</th>            
        	<th>Trim Ordered</th>            
        	<th>Trim Dispatched</th>            
        	<th>Beading Dispatched</th>            
        	<th>Tech Pack Spec Sheet</th>            
        	<th>Counter Sample</th>            
        	<th>Quality Control</th>            
        	<th>Shipping</th>            
        </tr>
        </thead>
<cfif productionProgressHeaders.RecordCount IS 0>
	<h4>No Data was returned</h4>
<cfelse> 
		<tbody>
        
        <cfloop query="productionProgressHeaders" startrow="#URL.startRow#" endrow="#endRow#">
        <tr>
          <td class="locked"><cfoutput>#productionProgressHeaders.CompanyNumber#</cfoutput></td>          
          <td class="locked"><cfoutput>#productionProgressHeaders.CutNumber#</cfoutput></td>          
          <td class="locked"><cfoutput>#productionProgressHeaders.Style#</cfoutput></td>          
          <td class="locked"><cfoutput>#productionProgressHeaders.Color#</cfoutput></td>          
          <td class="locked"><cfoutput>#DateFormat(productionProgressHeaders.IssueDate, 'mm/dd/yyyy')#</cfoutput></td>          
          <td class="locked"><cfoutput>#DateFormat(productionProgressHeaders.DueDate, 'mm/dd/yyyy')#</cfoutput></td>          
          <td class="locked"><cfoutput>#productionProgressHeaders.Issued#</cfoutput></td>          
          <td class="locked"><cfoutput>#productionProgressHeaders.Contractor#</cfoutput></td>          
          <!---<td><cfoutput>#productionProgressHeaders.Status#</cfoutput></td>          --->
          
          <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressDetailGateway" method="getAllByProductionProgressID" returnvariable="ProductionProgressDetails">
          	<cfinvokeargument name="id" value="#productionProgressHeaders.ProductionProgressID#">
		  </cfinvoke>

		  <cfset X = 1>

          <cfloop query="ProductionProgressDetails">

				  <cfinvoke  component="mochi.cfc.operationsProcesses.OperationProcessGateway" method="getById" returnvariable="OperationProcess">
                  		<cfinvokeargument name="id" value="#ProductionProgressDetails.OperationProcessID#"/>
				  </cfinvoke>

                  <cfif ProductionProgressDetails.Revision EQ 0>
                  	<cfset class="revisionStyleZero">
                  <cfelseif ProductionProgressDetails.Revision EQ 1>
					<cfset class="revisionStyleOne">
                  <cfelseif ProductionProgressDetails.Revision EQ 2>
					<cfset class="revisionStyleTwo">
                  <cfelse>
					<cfset class="revisionStyleThree">
                  </cfif>
                  

                  <cfoutput><td class="#class#">#DateFormat(ProductionProgressDetails.PlanDate, 'mm/dd/yyyy')#</td></cfoutput>
                  	
				  <cfif OperationProcess.getProcessID() EQ X>
						<td colspan="3" bgcolor="#FFFFFF" align="center"> RE ORDER</td>                  
                 
                  <cfset X = 2>
                        
                  </cfif>
                  

          </cfloop>
		  </tr>        

          <tr>
          
          	<td colspan="8" class="locked"></td>
            
		  <cfset Y = 1>
          
          <cfloop query="ProductionProgressDetails">

				  <cfinvoke  component="mochi.cfc.operationsProcesses.OperationProcessGateway" method="getById" returnvariable="OperationProcess">
                  		<cfinvokeargument name="id" value="#ProductionProgressDetails.OperationProcessID#"/>
				  </cfinvoke>

              	  <cfinvoke  component="mochi.cfc.productionDetailStatus.ProductionDetailStatusGateway" method="getById" returnvariable="ProductionDetailStatus">
					<cfinvokeargument name="id" value="#ProductionProgressDetails.ProductionDetailStatusID#"/>
				  </cfinvoke>
	    	
				  <cfswitch expression="#ProductionDetailStatus.getType()#">
                  	<cfcase value="E">
                    	<cfset class = "Finished">
                    </cfcase>
                  	<cfcase value="I">
                    	<cfset class = "Issue">
                    </cfcase>
                    <cfdefaultcase>                    	
                    	<cfset class = "Pending">
                    </cfdefaultcase>
                  </cfswitch>
                  
                  
                  <cfoutput><td class="#Class#">#ProductionProgressDetails.Status#</td></cfoutput>	         
                  
				  <cfif OperationProcess.getProcessID() EQ Y>
					   <td colspan="3" bgcolor="##00FF66" align="center"> RE ORDER</td>                  
                 
	                  <cfset Y = 2>
                        
                  </cfif>
                  

          </cfloop>
          
          </tr>


		  <cfif not IsUserInRole("reports")>
          
          <tr>
          
          	<td colspan="8" class="locked"></td>
            
          <cfset Z = 1>
            
          <cfloop query="ProductionProgressDetails">

				  <cfinvoke  component="mochi.cfc.operationsProcesses.OperationProcessGateway" method="getById" returnvariable="OperationProcess">
                  		<cfinvokeargument name="id" value="#ProductionProgressDetails.OperationProcessID#"/>
				  </cfinvoke>

                  <td align="center"><cfoutput><a href="update.cfm?ProductionProgressDetailID=#productionProgressDetails.ProductionProgressDetailID#&queryString=#CGI.QUERY_STRING#">#OperationProcess.getPersonInCharge()#</a></cfoutput></td>
                  
				  <cfif OperationProcess.getProcessID() EQ Z>
						<td colspan="3" bgcolor="#FFFFFF" align="center"> RE ORDER</td>                  
                 
                  <cfset Z = 2>
                        
                  </cfif>
                  

          </cfloop>
          
          </tr>
          
		  </cfif>	
          
          </tbody>          
        </cfloop>
        <tr>
        	<td colspan="21" align="right">
            	<cfif not URL.showAll and totalRows gt rowsPerPage>
                	Page <cfinclude template="../shared/NextNIncludePageLinks.cfm">
                </cfif>
            </td> 
        </tr>
	</table> 
    
    </div>   
    
</cfif>       
</cfform>        

