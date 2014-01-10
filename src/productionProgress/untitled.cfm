<!---<cfquery datasource="#APPLICATION.DATASOURCE#">
	DELETE *
    FROM ProductionProgressHeader
</cfquery>


<cfquery datasource="#APPLICATION.DATASOURCE#">
	DELETE *
    FROM ProductionProgressDetail
</cfquery>
--->

<!---<cfquery datasource="#APPLICATION.DATASOURCE#">
	UPDATE ProductionProgressHeader
	SET Status = 1
</cfquery>--->


<!---<cfquery name="qFinished" datasource="#APPLICATION.DATASOURCE#">
	SELECT ProductionProgressDetailID, FinishedDate
    FROM ProductionProgressDetail
    WHERE ProductionDetailStatusID = 1 
</cfquery>

<cfloop query="qFinished">

    <cfquery datasource="#APPLICATION.DATASOURCE#">
        UPDATE ProductionProgressDetail
        SET Status = <cfqueryparam cfsqltype="cf_sql_char" value="#DateFormat(qFinished.FinishedDate, 'mm/dd/yyyy')#">
        WHERE ProductionProgressDetailID = <cfqueryparam cfsqltype="cf_sql_numeric" value="#qFinished.ProductionProgressDetailID#"> 
    </cfquery>
    
</cfloop>    --->

<!---<cfquery name="qProgressHeaders" datasource="#APPLICATION.DATASOURCE#">
	SELECT  ProductionProgressID
    FROM	ProductionProgressHeader 	
</cfquery>

<cfloop query="qProgressHeaders">

	<cfquery name="qFabricDispatch" datasource="#APPLICATION.DATASOURCE#">
    	SELECT FinishedDate
        FROM   ProductionProgressDetail
        WHERE OperationProcessID = 20
        AND   ProductionProgressID = <cfqueryparam cfsqltype="cf_sql_numeric" value="#qProgressHeaders.ProductionProgressID#">
   </cfquery>

	<cfif qFabricDispatch.FinishedDate IS NOT ''>
    	        
        <cfquery name="qPlanDate" datasource="#APPLICATION.DATASOURCE#">
        	SELECT PlanDate
            FROM ProductionProgressDetail
	        WHERE OperationProcessID = 18
    	    AND   ProductionProgressID = <cfqueryparam cfsqltype="cf_sql_numeric" value="#qProgressHeaders.ProductionProgressID#">
        </cfquery>
    
        
		<cfquery datasource="#APPLICATION.DATASOURCE#">
    		UPDATE ProductionProgressDetail
            SET FinishedDate = <cfqueryparam cfsqltype="cf_sql_date" value="#qPlanDate.PlanDate#">, 
            Status = <cfqueryparam cfsqltype="cf_sql_date" value="#qPlanDate.PlanDate#">,
            ProductionDetailStatusID = <cfqueryparam cfsqltype="cf_sql_numeric" value="1"> 
	        WHERE OperationProcessID = <cfqueryparam cfsqltype="cf_sql_numeric" value="18">
    	    AND   ProductionProgressID = <cfqueryparam cfsqltype="cf_sql_numeric" value="#qProgressHeaders.ProductionProgressID#">    	
        </cfquery>
    
	</cfif>


</cfloop>--->

<!---<cfquery name="qExceptions" datasource="#APPLICATION.DATASOURCE#">
    SELECT ProductionProgressDetail.LastMaintainedDate, ProductionProgressDetail.ProductionProgressDetailID
    FROM ProductionDetailStatus INNER JOIN ProductionProgressDetail ON ProductionDetailStatus.ProductionDetailStatusID = ProductionProgressDetail.ProductionDetailStatusID
    WHERE (((ProductionDetailStatus.Type)="E") AND ((ProductionProgressDetail.FinishedDate) Is ''))
</cfquery>

<cfloop query="qExceptions">
	UPDATE ProductionProgressDetail
    SET FinishedDate = <cfqueryparam cfsqltype="cf_sql_date" value="#DateFormat(qExceptions.LastMaintainedDate, 'mm/dd/yyyy')#">
    WHERE ProductionProgressDetailID = <cfqueryparam cfsqltype="cf_sql_numeric" value="#qExceptions.ProductionProgressDetailID#">
</cfloop>--->

		<!--- First get all open cuts in the chart --->
<!--- This is what i used to update all the reorders in the chart using AS400 --->        
<!---		<table border="1">
		<cfquery name="qReorderedStyle" datasource="AS400">
			SELECT DISTINCT JOBSUM0.PRCD8Q, RJECUTSCONTRACTORS.FLNM5G FROM VPSFILES.JOBSUM0 AS JOBSUM0, VIEWS.RJECUTSCONTRACTORS AS RJECUTSCONTRACTORS WHERE (JOBSUM0.CONO8Q = RJECUTSCONTRACTORS.CONOD4) AND (JOBSUM0.PRCD8Q = RJECUTSCONTRACTORS.PRCDD4) AND (JOBSUM0.JBNO8Q = RJECUTSCONTRACTORS.JBNOD4) AND (JOBSUM0.CRCD8Q = RJECUTSCONTRACTORS.CRCDD4) AND (JOBSUM0.CLSD8Q <> 'Y') 
			INTERSECT
			SELECT DISTINCT JOBSUM0.PRCD8Q, RJECUTSCONTRACTORS.FLNM5G FROM VPSFILES.JOBSUM0 AS JOBSUM0, VIEWS.RJECUTSCONTRACTORS AS RJECUTSCONTRACTORS WHERE (JOBSUM0.CONO8Q = RJECUTSCONTRACTORS.CONOD4) AND (JOBSUM0.PRCD8Q = RJECUTSCONTRACTORS.PRCDD4) AND (JOBSUM0.JBNO8Q = RJECUTSCONTRACTORS.JBNOD4) AND (JOBSUM0.CRCD8Q = RJECUTSCONTRACTORS.CRCDD4) AND (JOBSUM0.CLSD8Q = 'Y')		
		</cfquery>

		<cfloop query="qReorderedStyle">
        
        			<!--- Then Update all the production status of those styles that are re-ordered --->
			<cfquery name="qProductionProgressHeader" datasource="#APPLICATION.DATASOURCE#">
				SELECT ProductionProgressHeader.ProductionProgressID,ProductionProgressHeader.CutNumber, ProductionProgressHeader.Style,ProductionProgressHeader.Color,ProductionProgressHeader.Contractor
				FROM ProductionProgressHeader
				WHERE (((ProductionProgressHeader.Style)= <cfqueryparam  cfsqltype="cf_sql_char" value="#qReorderedStyle.PRCD8Q#"/>) 
				AND ((ProductionProgressHeader.Contractor)= <cfqueryparam  cfsqltype="cf_sql_char" value="#qReorderedStyle.FLNM5G#"/>) 
				AND ((ProductionProgressHeader.Status)=1))
			</cfquery>
			<cfloop query="qProductionProgressHeader">
            		
                    <tr>
                        <th>ID</th>
                        <th>Cut</th>
                        <th>Style</th>
                        <th>Color</th>
                        <th>Contractor</th>
                    </tr>    
                	<tr>
            	<cfoutput>
                    	<td>#qProductionProgressHeader.ProductionProgressID#</td>                    
                    	<td>#qProductionProgressHeader.CutNumber#</td>
                        <td>#qProductionProgressHeader.Style#</td>
                        <td>#qProductionProgressHeader.Color#</td>
                        <td>#qProductionProgressHeader.Contractor#</td>
                </cfoutput>
                    </tr>
                
				<cfquery name="qProductionProgressDetail" datasource="#APPLICATION.DATASOURCE#">
					SELECT ProductionProgressDetail.ProductionProgressDetailID, ProductionProgressDetail.OperationProcessID
					FROM ProductionProgressDetail
					WHERE ProductionProgressDetail.ProductionProgressID= <cfqueryparam  cfsqltype="cf_sql_numeric" value="#qProductionProgressHeader.ProductionProgressID#"/>
					AND ProductionProgressDetail.OperationProcessID IN (23,25,8,7,10,16,26)
				</cfquery>
				
                <tr>
                	<th colspan="5">OPERATIONS</th>
                </tr>
                <tr>
                	<th>ID</th>
                    <th>Operation</th>
                    <th>Person-In-Charge</th>
                </tr>
                <cfloop query="qProductionProgressDetail">
                
                	<cfinvoke  component="mochi.cfc.operationsProcesses.OperationProcessGateway" method="getById" returnvariable="OperationProcess">
						<cfinvokeargument name="id" value="#qProductionProgressDetail.OperationProcessID#"/>
					</cfinvoke>

					<cfinvoke  component="mochi.cfc.operations.OperationGateway" method="getById" returnvariable="Operation">
						<cfinvokeargument name="id" value="#OperationProcess.getOperationID()#"/>
					</cfinvoke>
                	
                
                    <tr>
                    	<cfoutput>
                    	<td>#qProductionProgressDetail.ProductionProgressDetailID#</td>
                    	<td>#Operation.getOperation()#</td>
                    	<td>#OperationProcess.getPersonInCharge()#</td>                    
                        </cfoutput>
                    </tr>
                
                
                </cfloop>
			</cfloop>            
		</cfloop>			
        
</table>
        --->
		
<!--- This was used to update all the sample request that has been cancelled --->
<!---<cfquery name="qCancelledSamples" datasource="#APPLICATION.DATASOURCE#">
    SELECT SampleRequest.SampleRequestID, SampleRequest.LastMaintainedBy, SampleRequest.LastMaintainedDate
    FROM SampleRequest
    WHERE (((SampleRequest.RequestStatusID)=4))
</cfquery>

<cfloop query="qCancelledSamples">
	<cfquery datasource="#APPLICATION.DATASOURCE#">
        UPDATE SampleRequest
        SET CancellationDate = <cfqueryparam cfsqltype="cf_sql_date" value="#DateFormat(qCancelledSamples.LastMaintainedDate, 'mm/dd/yyyy')#">,
            CancelledBy = <cfqueryparam  cfsqltype="cf_sql_char" value="#qCancelledSamples.LastMaintainedBy#"/>
        WHERE SampleRequestID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#qCancelledSamples.sampleRequestID#" /> 
	</cfquery>
</cfloop>
--->

<!---- Update the finished date of all the exception styles --->
<!---<cfquery name="qExceptions" datasource="#APPLICATION.DATASOURCE#">
    SELECT ProductionProgressDetail.ProductionProgressDetailID, ProductionProgressDetail.FinishedDate, ProductionProgressDetail.PlanDate
    FROM ProductionProgressDetail INNER JOIN ProductionDetailStatus ON ProductionProgressDetail.ProductionDetailStatusID = ProductionDetailStatus.ProductionDetailStatusID
    WHERE (((ProductionProgressDetail.OperationProcessID) In (19,10,15)) AND ((ProductionProgressDetail.FinishedDate) Is Null) AND ((ProductionDetailStatus.Type)='E'))
</cfquery>


<cfloop query="qExceptions">

    <cfquery datasource="#APPLICATION.DATASOURCE#">
        UPDATE ProductionProgressDetail
        SET FinishedDate = <cfqueryparam cfsqltype="cf_sql_date" value="#qExceptions.PlanDate#"/>
        WHERE ProductionProgressDetailID = <cfqueryparam cfsqltype="cf_sql_numeric" value="#qExceptions.ProductionProgressDetailID#"/>
    </cfquery>
    
    
</cfloop>    --->


<!--- Update the status of all sample progress to default to not yet prepared --->
<!---<cfquery name="qSampleProgress" datasource="#APPLICATION.DATASOURCE#">
	SELECT SampleProgress.SampleProgressID, SampleProgress.PatternStatusID
	FROM SampleProgress
	WHERE (((SampleProgress.PatternStatusID) Is Null))
</cfquery>

<cfloop query="qSampleProgress">

	<cfquery datasource="#APPLICATION.DATASOURCE#">
    	UPDATE SampleProgress
        SET PatternStatusID = 5
      	WHERE SampleProgressID = <cfqueryparam cfsqltype="cf_sql_numeric" value="#qSampleProgress.SampleProgressID#"/>  
    </cfquery>
    

</cfloop>--->

<!--- This will update all the pattern status inforamtion of all request that has been created before 12/1/08 with Patten Status of Not Prepare Yet --->
<!---<cfquery name="qSampleRequest" datasource="#APPLICATION.DATASOURCE#">
    SELECT SampleRequest.SampleRequestID
    FROM SampleRequest
    WHERE (((SampleRequest.RequestDate)<#12/1/2008#) AND ((SampleRequest.RequestStatusID) In (7,11,10)))
</cfquery>

<cfloop query="qSampleRequest">
	<cfquery datasource="#APPLICATION.DATASOURCE#">
    	UPDATE SampleProgress
        SET PatternStatusID = 2
      	WHERE SampleRequestID = <cfqueryparam cfsqltype="cf_sql_numeric" value="#qSampleRequest.SampleRequestID#"/>  
        AND PatternStatusID = 5
    </cfquery>
</cfloop>--->

<!--- This will update the year information for all sample request --->
<cfquery datasource="#APPLICATION.DATASOURCE#">
	UPDATE SampleRequest
    SET YearID = 2
    WHERE DeliveryID NOT IN (9,10,11,12,13, 1) 
</cfquery>