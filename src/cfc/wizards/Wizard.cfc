<cfcomponent output="false">

	<cffunction name="updateOpenProductionSamplesFromAS400" returntype="String" output="no" access="public">
	

		<cfquery name="qOpenProductionSamples" datasource="#APPLICATION.DATASOURCE#">
			SELECT DISTINCT SampleRequest.StyleID AS StyleID, Styles.StyleName AS StyleName 
			FROM SampleRequest INNER JOIN Styles ON SampleRequest.StyleID = Styles.StyleID
			WHERE (((SampleRequest.SampleTypeID)=4) AND ((SampleRequest.RequestStatusID)=3));
		</cfquery>
		
		
		<cfloop query="qOpenProductionSamples">
					
			<cfquery name="qCutFirstCancelDate" datasource="AS400">
				SELECT DATE(SUBSTR(CHAR(MIN(DUDT8Q)),5,2) ||'/'|| SUBSTR(CHAR(MIN(DUDT8Q)),7,2) ||'/'|| SUBSTR(CHAR(MIN(DUDT8Q)),1,4)) AS CutCancelDate,
					   DATE(SUBSTR(CHAR(MIN(ISDT8Q)),5,2) ||'/'|| SUBSTR(CHAR(MIN(ISDT8Q)),7,2) ||'/'|| SUBSTR(CHAR(MIN(ISDT8Q)),1,4)) AS CutIssueDate  
				FROM VPSFILES.JOBSUM0 AS JOBSUM0 
				WHERE (PRCD8Q = '#qOpenProductionSamples.StyleName#')	AND (CONO8Q = 1)	
			</cfquery>
					
			<cfif qCutFirstCancelDate.RECORDCOUNT GT 0 AND qCutFirstCancelDate.CutCancelDate IS NOT ''>

				<cfset patternDueDate = qCutFirstCancelDate.CutIssueDate + ((qCutFirstCancelDate.CutCancelDate - qCutFirstCancelDate.CutIssueDate) * .35)>					
				<cfset deadlineToContractor = patternDueDate + 5>
				<cfset counterSampleDueDate = deadlineToContractor + 10>
										
				<cfquery name="qUpdateProductionSamples" datasource="#APPLICATION.DATASOURCE#">
					UPDATE SampleRequest 
					SET DueDate = <cfqueryparam cfsqltype="cf_sql_date" value="#qCutFirstCancelDate.CutCanceldate#"/>, 
		            	DeadlineToContractor = <cfqueryparam cfsqltype="cf_sql_date" value="#deadlineToContractor#"/>,
		                PatternDueDate = <cfqueryparam cfsqltype="cf_sql_date" value="#patternDueDate#"/>,
		                CounterSampleDueDate = <cfqueryparam cfsqltype="cf_sql_date" value="#counterSampleDueDate#"/>  
		    		WHERE	(SampleRequest.StyleID = <cfqueryparam cfsqltype="cf_sql_numeric" value="#qOpenProductionSamples.StyleID#"/>)
					AND 	(SampleRequest.SampleTypeID =4 )
					AND 	(SampleRequest.RequestStatusID =3)										
				</cfquery>
					
			</cfif>
					
		</cfloop>		
		
		<cfreturn "SUCCESS">
		
	</cffunction>

	<cffunction name="updateOpenProductionSamplesDateWithoutCuts" returntype="String" output="no" access="public">
	
		<!--- First get all the production samples without order --->
		<cfquery name="qProdSamples" datasource="Mochi">
			SELECT DISTINCT SampleRequest.SampleRequestID, SampleRequest.RequestDate, SampleRequest.DueDate 
			FROM SampleRequest 
			WHERE (((SampleRequest.SampleTypeID)=4) AND ((SampleRequest.RequestStatusID)=3))
			AND  (SampleRequest.HasOrder = 0)		
		</cfquery>
		
		<cfloop query="qProdSamples">
			
				<!--- formula to generate pattern due date and deadline to contractor --->
				<cfset patternDueDate = qProdSamples.RequestDate + ((qProdSamples.DueDate - qProdSamples.RequestDate) * .35)>					
				<cfset deadlineToContractor = patternDueDate + 5>
		
				<!--- update all production samples date --->
				<cfquery datasource="Mochi">
					UPDATE SampleRequest 
					SET DeadlineToContractor = <cfqueryparam cfsqltype="cf_sql_date" value="#deadlineToContractor#"/>,
		                PatternDueDate = <cfqueryparam cfsqltype="cf_sql_date" value="#patternDueDate#"/> 
		    		WHERE	(SampleRequest.SampleRequestID = <cfqueryparam cfsqltype="cf_sql_numeric" value="#qProdSamples.SampleRequestID#"/>)
					AND 	(SampleRequest.SampleTypeID =4 )
					AND 	(SampleRequest.RequestStatusID =3)																		
				</cfquery>
								
		</cfloop>

		<cfreturn "SUCCESS">
					
	</cffunction>

	

	<cffunction name="updateOpenProductionSamplesHasOrderFromAS400" returntype="String" output="no" access="public">
	

		<cfquery name="qOpenProductionSamples" datasource="#APPLICATION.DATASOURCE#">
        	<!--- added because query taking much longer without the pattern status 6/8/2010--->
            SELECT DISTINCT Styles.StyleID, Styles.StyleName
            FROM ((SampleRequest INNER JOIN SampleProgress ON SampleRequest.SampleRequestID = SampleProgress.SampleRequestID) INNER JOIN Styles ON SampleRequest.StyleID = Styles.StyleID) INNER JOIN PatternStatus ON SampleProgress.PatternStatusID = PatternStatus.PatternStatusID
            WHERE (((PatternStatus.Type)='P') AND ((SampleRequest.SampleTypeID)=4)) AND ((SampleRequest.RequestStatusID) NOT IN (4,7,9));
<!---
			SELECT DISTINCT SampleRequest.StyleID AS StyleID, Styles.StyleName AS StyleName 
			FROM SampleRequest INNER JOIN Styles ON SampleRequest.StyleID = Styles.StyleID
			WHERE (((SampleRequest.SampleTypeID)=4) AND ((SampleRequest.RequestStatusID) NOT IN (4,7,9)));
--->		
		</cfquery>
		
		
		<cfloop query="qOpenProductionSamples">
					
			<cfquery name="qProductionSampleOrderCount" datasource="AS400">
				SELECT COUNT(*) AS TotalOrders
				FROM VPSFILES.JOBSUM0 AS JOBSUM0 
				WHERE (PRCD8Q = <cfqueryparam  cfsqltype="cf_sql_char" value="#qOpenProductionSamples.StyleName#"/>)
                AND (CONO8Q = 1) 
			</cfquery>
					
			<cfif qProductionSampleOrderCount.TotalOrders GT 0>
				
				<!--- Update the has order if there is an order --->	
				<cfquery datasource="#APPLICATION.DATASOURCE#">
					UPDATE SampleRequest 
					SET HasOrder = 1 
		    		WHERE	(SampleRequest.StyleID = <cfqueryparam cfsqltype="cf_sql_numeric" value="#qOpenProductionSamples.StyleID#"/>)
					AND 	(SampleRequest.SampleTypeID =4 )
					AND 	(SampleRequest.RequestStatusID NOT IN (4,7,9))										
				</cfquery>
				
			<cfelse>

				<!--- Update the has order to 0 if there no order --->	
				<cfquery datasource="#APPLICATION.DATASOURCE#">
					UPDATE SampleRequest 
					SET HasOrder = 0
		    		WHERE	(SampleRequest.StyleID = <cfqueryparam cfsqltype="cf_sql_numeric" value="#qOpenProductionSamples.StyleID#"/>)
					AND 	(SampleRequest.SampleTypeID =4 )
					AND 	(SampleRequest.RequestStatusID NOT IN (4,7,9))										
				</cfquery>
								
			</cfif>
					
		</cfloop>		
		
		<cfreturn "SUCCESS">
		
	</cffunction>


	<cffunction name="getOpenCutsFromAS400" returntype="String" output="no" access="public">
	
		<!--- Get All the Open Cuts From AS400 by date --->
		<cfquery name="qOpenCuts" datasource="AS400">
			SELECT JOBSUM0.CONO8Q as CompanyNumber, JOBSUM0.JBNO8Q as CutNumber, JOBSUM0.PRCD8Q as Style, 
				   JOBSUM0.CRCD8Q as Color,  
				   DATE(SUBSTR(CHAR(JOBSUM0.CRDT8Q),5,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.CRDT8Q),7,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.CRDT8Q),1,4)) AS IssueDate,  
				   DATE(SUBSTR(CHAR(JOBSUM0.DUDT8Q),5,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.DUDT8Q),7,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.DUDT8Q),1,4)) AS DueDate, 
			JOBSUM0.TLIS8Q as Issued, RJECUTSCONTRACTORS.FLNM5G as Contractor 
			FROM VPSFILES.JOBSUM0 AS JOBSUM0, VIEWS.RJECUTSCONTRACTORS AS RJECUTSCONTRACTORS 
			WHERE (JOBSUM0.CONO8Q = RJECUTSCONTRACTORS.CONOD4) AND (JOBSUM0.PRCD8Q = RJECUTSCONTRACTORS.PRCDD4)
		 	 AND (JOBSUM0.JBNO8Q = RJECUTSCONTRACTORS.JBNOD4) AND (JOBSUM0.CRCD8Q = RJECUTSCONTRACTORS.CRCDD4) 
		 	 AND (JOBSUM0.CLSD8Q <> 'Y') AND (JOBSUM0.PDTP8Q = 'IMP') AND (JOBSUM0.CONO8Q = 2) 
		</cfquery>
		
		<cfloop query="qOpenCuts">
    
            <!--- Create a Struct to populate the ProductionProgressHeader Table --->
            <cfset pph = StructNew()>
            <cfset pph.ProductionProgressID = 0>
            <cfset pph.CompanyNumber = qOpenCuts.CompanyNumber>
            <cfset pph.CutNumber = qOpenCuts.CutNumber>
            <cfset pph.Style = qOpenCuts.Style>
            <cfset pph.Color = qOpenCuts.Color>
            <cfset pph.IssueDate = qOpenCuts.IssueDate>
            <cfset pph.DueDate = qOpenCuts.DueDate>
            <cfset pph.Issued = qOpenCuts.Issued>
			<cfset pph.TotalWorkDays = qOpenCuts.DueDate - qOpenCuts.IssueDate>
            <cfset pph.Contractor = qOpenCuts.Contractor>
            <cfset pph.Status = ''>
            <cfset pph.Comments = ''>
            <cfset pph.CreatedBy = 'AS400'>
            <cfset pph.CreatedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
            <cfset pph.LastMaintainedBy = 'AS400'>
            <cfset pph.LastMaintainedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
            
            <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressHeader" method="init" returnvariable="productionProgressHeader">
            	<cfinvokeargument name="stValues" value="#pph#">
			</cfinvoke>
            
            <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressHeaderGateway" method="save">
				<cfinvokeargument name="obj" value="#productionProgressHeader#"/>
			</cfinvoke>

			<!--- Check if the cut is a reorder or a new style ---->
			<cfquery name="qCheckCut" datasource="AS400">		
				SELECT COUNT(*) as Ordered 
				FROM VPSFILES.JOBSUM0 AS JOBSUM0 
				WHERE (PRCD8Q = <cfqueryparam  cfsqltype="cf_sql_char" value="#qOpenCuts.Style#"/>) 
				AND (CLSD8Q = 'Y')			
			</cfquery>

			<!--- get the recent ProductionProgressID ---->
			<cfquery name="qProductionProgressID" datasource="#APPLICATION.DATASOURCE#">
				SELECT MAX(ProductionProgressHeader.ProductionProgressID) AS ProductionProgressID
				FROM ProductionProgressHeader			
			</cfquery>
			
			<!--- do this if the cut is a re order ---->
			<cfif qCheckCut.Ordered GT 0>
			
				<!--- use the primary key 1 of the reorder process in the OperationsProcesses table --->
				<cfquery name="qOperationsProcesses" datasource="#APPLICATION.DATASOURCE#">
					SELECT OperationProcessID, PercentDaysToFinish
					FROM OperationsProcesses
					WHERE ProcessID = <cfqueryparam cfsqltype="cf_sql_integer" value="1"/>
					ORDER BY Sequence
				</cfquery>
			
			<!--- do this if the cut is a new order ---->
			<cfelse>	

				<!--- use the primary key 2 of the new order process in the OperationsProcesses table --->
				<cfquery name="qOperationsProcesses" datasource="#APPLICATION.DATASOURCE#">
					SELECT OperationProcessID, PercentDaysToFinish 
					FROM OperationsProcesses
					WHERE ProcessID = <cfqueryparam cfsqltype="cf_sql_integer" value="2"/>
					ORDER BY Sequence
				</cfquery>

			</cfif>
				
				<cfloop query="qOperationsProcesses">
					<!--- Create a struct to enter in the ProductionProgressDetail Table --->
					<cfset ppd = StructNew()>
		            <cfset ppd.ProductionProgressDetailID = 0>
		            <cfset ppd.ProductionProgressID = qProductionProgressID.ProductionProgressID>
		            <cfset ppd.OperationProcessID = qOperationsProcesses.OperationProcessID>
		            <cfset ppd.FinishedDate = ''>
		            <cfset ppd.PlanDate = pph.IssueDate + (pph.TotalWorkDays * qOperationsProcesses.PercentDaysToFinish)>
		            <cfset ppd.Status = ''>
		            <cfset ppd.Comments = ''>
		            <cfset ppd.CreatedBy = 'AS400'>
		            <cfset ppd.CreatedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
            		<cfset ppd.LastMaintainedBy = 'AS400'>
            		<cfset ppd.LastMaintainedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
			
					<!--- Enter struct in the ProductionProgressDetail Table --->
					<cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressDetail" method="init" returnvariable="ProductionProgressDetail">
                    	<cfinvokeargument name="stValues" value="#ppd#">
					</cfinvoke>
                    
                    <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressDetailGateway" method="save">
						<cfinvokeargument name="obj" value="#ProductionProgressDetail#"/>
					</cfinvoke>
									
				</cfloop>
					
			
		</cfloop>		
		
		<cfreturn "SUCCESS">
		
	</cffunction>


<!--- OLD  getNewOpenCutsInCompanyOneFromAS400 Function 
	<cffunction name="getNewOpenCutsInCompanyOneFromAS400" returntype="String" output="no" access="public">
	

		<!--- First get the maximun cut number for company one in the Production Progress Header File --->
		<cfquery name="qMaxCutNumber" datasource="Mochi">
			SELECT MAX(CutNumber) AS MaxCutNumber
			FROM ProductionProgressHeader
			WHERE (CompanyNumber = 1)
			
		</cfquery>
		
		<!--- Get All the Open Cuts From AS400 by date --->
		<cfquery name="qOpenCuts" datasource="AS400">
			SELECT JOBSUM0.CONO8Q as CompanyNumber, JOBSUM0.JBNO8Q as CutNumber, JOBSUM0.PRCD8Q as Style, 
				   JOBSUM0.CRCD8Q as Color,  
				   DATE(SUBSTR(CHAR(JOBSUM0.CRDT8Q),5,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.CRDT8Q),7,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.CRDT8Q),1,4)) AS IssueDate,  
				   DATE(SUBSTR(CHAR(JOBSUM0.DUDT8Q),5,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.DUDT8Q),7,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.DUDT8Q),1,4)) AS DueDate, 
			JOBSUM0.TLIS8Q as Issued, RJECUTSCONTRACTORS.FLNM5G as Contractor 
			FROM VPSFILES.JOBSUM0 AS JOBSUM0, VIEWS.RJECUTSCONTRACTORS AS RJECUTSCONTRACTORS 
			WHERE (JOBSUM0.CONO8Q = RJECUTSCONTRACTORS.CONOD4) AND (JOBSUM0.PRCD8Q = RJECUTSCONTRACTORS.PRCDD4)
		 	 AND (JOBSUM0.JBNO8Q = RJECUTSCONTRACTORS.JBNOD4) AND (JOBSUM0.CRCD8Q = RJECUTSCONTRACTORS.CRCDD4) 
		 	 AND (JOBSUM0.CLSD8Q <> 'Y') AND (JOBSUM0.PDTP8Q = 'IMP') AND (JOBSUM0.JBNO8Q > #qMaxCutNumber.MaxCutNumber#) 
		 	 AND (JOBSUM0.CONO8Q = 1)
		</cfquery>
		
		<cfloop query="qOpenCuts">
    
            <!--- Create a Struct to populate the ProductionProgressHeader Table --->
            <cfset pph = StructNew()>
            <cfset pph.ProductionProgressID = 0>
            <cfset pph.CompanyNumber = qOpenCuts.CompanyNumber>
            <cfset pph.CutNumber = qOpenCuts.CutNumber>
            <cfset pph.Style = qOpenCuts.Style>
            <cfset pph.Color = qOpenCuts.Color>
            <cfset pph.IssueDate = qOpenCuts.IssueDate>
            <cfset pph.DueDate = qOpenCuts.DueDate>
            <cfset pph.Issued = qOpenCuts.Issued>
			<cfset pph.TotalWorkDays = qOpenCuts.DueDate - qOpenCuts.IssueDate>
            <cfset pph.Contractor = qOpenCuts.Contractor>
            <cfset pph.Status = 1>
            <cfset pph.Comments = ''>
            <cfset pph.CreatedBy = 'AS400'>
            <cfset pph.CreatedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
            <cfset pph.LastMaintainedBy = 'AS400'>
            <cfset pph.LastMaintainedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
            
            <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressHeader" method="init" returnvariable="productionProgressHeader">
            	<cfinvokeargument name="stValues" value="#pph#">
			</cfinvoke>
            
            <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressHeaderGateway" method="save">
				<cfinvokeargument name="obj" value="#productionProgressHeader#"/>
			</cfinvoke>

			<!--- Check if the cut is a reorder or a new style ---->
			<cfquery name="qCheckCut" datasource="AS400">		
				SELECT COUNT(*) as Ordered 
				FROM VPSFILES.JOBSUM0 AS JOBSUM0 
				WHERE (PRCD8Q = <cfqueryparam  cfsqltype="cf_sql_char" value="#qOpenCuts.Style#"/>) 
				AND (CLSD8Q = 'Y')			
			</cfquery>

			<!--- get the recent ProductionProgressID ---->
			<cfquery name="qProductionProgressID" datasource="#APPLICATION.DATASOURCE#">
				SELECT MAX(ProductionProgressHeader.ProductionProgressID) AS ProductionProgressID
				FROM ProductionProgressHeader			
			</cfquery>
			
			<!--- do this if the cut is a re order ---->
			<cfif qCheckCut.Ordered GT 0>
			
				<!--- use the primary key 1 of the reorder process in the OperationsProcesses table --->
				<cfquery name="qOperationsProcesses" datasource="#APPLICATION.DATASOURCE#">
					SELECT OperationProcessID, PercentDaysToFinish
					FROM OperationsProcesses
					WHERE ProcessID = <cfqueryparam cfsqltype="cf_sql_integer" value="1"/>
					ORDER BY Sequence
				</cfquery>
			
			<!--- do this if the cut is a new order ---->
			<cfelse>	

				<!--- use the primary key 2 of the new order process in the OperationsProcesses table --->
				<cfquery name="qOperationsProcesses" datasource="#APPLICATION.DATASOURCE#">
					SELECT OperationProcessID, PercentDaysToFinish 
					FROM OperationsProcesses
					WHERE ProcessID = <cfqueryparam cfsqltype="cf_sql_integer" value="2"/>
					ORDER BY Sequence
				</cfquery>

			</cfif>
				
				<cfloop query="qOperationsProcesses">
					<!--- Create a struct to enter in the ProductionProgressDetail Table --->
					<cfset ppd = StructNew()>
		            <cfset ppd.ProductionProgressDetailID = 0>
		            <cfset ppd.ProductionProgressID = qProductionProgressID.ProductionProgressID>
		            <cfset ppd.OperationProcessID = qOperationsProcesses.OperationProcessID>
		            <cfset ppd.FinishedDate = ''>
		            <cfset ppd.PlanDate = pph.IssueDate + (pph.TotalWorkDays * qOperationsProcesses.PercentDaysToFinish)>
		            <cfset ppd.ProductionDetailStatusID = 3>
		            <cfset ppd.Status = ''>
		            <cfset ppd.Comments = ''>
		            <cfset ppd.Revision = 0>		            
		            <cfset ppd.CreatedBy = 'AS400'>
		            <cfset ppd.CreatedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
            		<cfset ppd.LastMaintainedBy = 'AS400'>
            		<cfset ppd.LastMaintainedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
			
					<!--- Enter struct in the ProductionProgressDetail Table --->
					<cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressDetail" method="init" returnvariable="ProductionProgressDetail">
                    	<cfinvokeargument name="stValues" value="#ppd#">
					</cfinvoke>
                    
                    <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressDetailGateway" method="save">
						<cfinvokeargument name="obj" value="#ProductionProgressDetail#"/>
					</cfinvoke>
									
				</cfloop>
					
			
		</cfloop>		
		
		<cfreturn "SUCCESS">
		
	</cffunction>
 --->
<!--- OLD getNewOpenCutsInCompanyThreeFromAS400 
	<cffunction name="getNewOpenCutsInCompanyThreeFromAS400" returntype="String" output="no" access="public">
	

		<!--- First get the maximun cut number for company one in the Production Progress Header File --->
		<cfquery name="qMaxCutNumber" datasource="Mochi">
			SELECT MAX(CutNumber) AS MaxCutNumber
			FROM ProductionProgressHeader
			WHERE (CompanyNumber = 3)
			
		</cfquery>
		
		<!--- Get All the Open Cuts From AS400 by date --->
		<cfquery name="qOpenCuts" datasource="AS400">
			SELECT JOBSUM0.CONO8Q as CompanyNumber, JOBSUM0.JBNO8Q as CutNumber, JOBSUM0.PRCD8Q as Style, 
				   JOBSUM0.CRCD8Q as Color,  
				   DATE(SUBSTR(CHAR(JOBSUM0.CRDT8Q),5,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.CRDT8Q),7,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.CRDT8Q),1,4)) AS IssueDate,  
				   DATE(SUBSTR(CHAR(JOBSUM0.DUDT8Q),5,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.DUDT8Q),7,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.DUDT8Q),1,4)) AS DueDate, 
			JOBSUM0.TLIS8Q as Issued, RJECUTSCONTRACTORS.FLNM5G as Contractor 
			FROM VPSFILES.JOBSUM0 AS JOBSUM0, VIEWS.RJECUTSCONTRACTORS AS RJECUTSCONTRACTORS 
			WHERE (JOBSUM0.CONO8Q = RJECUTSCONTRACTORS.CONOD4) AND (JOBSUM0.PRCD8Q = RJECUTSCONTRACTORS.PRCDD4)
		 	 AND (JOBSUM0.JBNO8Q = RJECUTSCONTRACTORS.JBNOD4) AND (JOBSUM0.CRCD8Q = RJECUTSCONTRACTORS.CRCDD4) 
		 	 AND (JOBSUM0.CLSD8Q <> 'Y') AND (JOBSUM0.PDTP8Q = 'IMP') AND (JOBSUM0.JBNO8Q > #qMaxCutNumber.MaxCutNumber#) 
		 	 AND (JOBSUM0.CONO8Q = 3)
		</cfquery>
		
		<cfloop query="qOpenCuts">
    
            <!--- Create a Struct to populate the ProductionProgressHeader Table --->
            <cfset pph = StructNew()>
            <cfset pph.ProductionProgressID = 0>
            <cfset pph.CompanyNumber = qOpenCuts.CompanyNumber>
            <cfset pph.CutNumber = qOpenCuts.CutNumber>
            <cfset pph.Style = qOpenCuts.Style>
            <cfset pph.Color = qOpenCuts.Color>
            <cfset pph.IssueDate = qOpenCuts.IssueDate>
            <cfset pph.DueDate = qOpenCuts.DueDate>
            <cfset pph.Issued = qOpenCuts.Issued>
			<cfset pph.TotalWorkDays = qOpenCuts.DueDate - qOpenCuts.IssueDate>
            <cfset pph.Contractor = qOpenCuts.Contractor>
            <cfset pph.Status = 1>
            <cfset pph.Comments = ''>
            <cfset pph.CreatedBy = 'AS400'>
            <cfset pph.CreatedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
            <cfset pph.LastMaintainedBy = 'AS400'>
            <cfset pph.LastMaintainedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
            
            <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressHeader" method="init" returnvariable="productionProgressHeader">
            	<cfinvokeargument name="stValues" value="#pph#">
			</cfinvoke>
            
            <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressHeaderGateway" method="save">
				<cfinvokeargument name="obj" value="#productionProgressHeader#"/>
			</cfinvoke>

			<!--- Check if the cut is a reorder or a new style ---->
			<cfquery name="qCheckCut" datasource="AS400">		
				SELECT COUNT(*) as Ordered 
				FROM VPSFILES.JOBSUM0 AS JOBSUM0 
				WHERE (PRCD8Q = <cfqueryparam  cfsqltype="cf_sql_char" value="#qOpenCuts.Style#"/>) 
				AND (CLSD8Q = 'Y')			
			</cfquery>

			<!--- get the recent ProductionProgressID ---->
			<cfquery name="qProductionProgressID" datasource="#APPLICATION.DATASOURCE#">
				SELECT MAX(ProductionProgressHeader.ProductionProgressID) AS ProductionProgressID
				FROM ProductionProgressHeader			
			</cfquery>
			
			<!--- do this if the cut is a re order ---->
			<cfif qCheckCut.Ordered GT 0>
			
				<!--- use the primary key 1 of the reorder process in the OperationsProcesses table --->
				<cfquery name="qOperationsProcesses" datasource="#APPLICATION.DATASOURCE#">
					SELECT OperationProcessID, PercentDaysToFinish 
					FROM OperationsProcesses
					WHERE ProcessID = <cfqueryparam cfsqltype="cf_sql_integer" value="1"/>
					ORDER BY Sequence
				</cfquery>
			
			<!--- do this if the cut is a new order ---->
			<cfelse>	

				<!--- use the primary key 2 of the new order process in the OperationsProcesses table --->
				<cfquery name="qOperationsProcesses" datasource="#APPLICATION.DATASOURCE#">
					SELECT OperationProcessID, PercentDaysToFinish
					FROM OperationsProcesses
					WHERE ProcessID = <cfqueryparam cfsqltype="cf_sql_integer" value="2"/>
					ORDER BY Sequence
				</cfquery>

			</cfif>
				
				<cfloop query="qOperationsProcesses">
					
					
					<!--- Create a struct to enter in the ProductionProgressDetail Table --->
					<cfset ppd = StructNew()>
		            <cfset ppd.ProductionProgressDetailID = 0>
		            <cfset ppd.ProductionProgressID = qProductionProgressID.ProductionProgressID>
		            <cfset ppd.OperationProcessID = qOperationsProcesses.OperationProcessID>
		            <cfset ppd.FinishedDate = ''>
		            <cfset ppd.PlanDate = pph.IssueDate + (pph.TotalWorkDays * qOperationsProcesses.PercentDaysToFinish)>
					<cfset ppd.ProductionDetailStatusID = 3>
		            <cfset ppd.Status = ''>
		            <cfset ppd.Comments = ''>
		            <cfset ppd.Revision = 0>		            
		            <cfset ppd.CreatedBy = 'AS400'>
		            <cfset ppd.CreatedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
            		<cfset ppd.LastMaintainedBy = 'AS400'>
            		<cfset ppd.LastMaintainedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
			
					<!--- Enter struct in the ProductionProgressDetail Table --->
					<cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressDetail" method="init" returnvariable="ProductionProgressDetail">
                    	<cfinvokeargument name="stValues" value="#ppd#">
					</cfinvoke>
                    
                    <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressDetailGateway" method="save">
						<cfinvokeargument name="obj" value="#ProductionProgressDetail#"/>
					</cfinvoke>
									
				</cfloop>
					
			
		</cfloop>		
		
		<cfreturn "SUCCESS">
		
	</cffunction>
 --->

	<cffunction name="updateContractorsFromAS400" returntype="String" output="no" access="public">
	
		<!--- First get all the open cuts in the chart  --->
		<cfquery name="qOpenChartCuts" datasource="Mochi">
			SELECT DISTINCT CompanyNumber, CutNumber 
			FROM ProductionProgressHeader
			WHERE Status = 1
		</cfquery>
	
		<!--- Loop over the open cuts to update the information one by one --->
		<cfloop query="qOpenChartCuts">
			
			<cfquery name="qContractor" datasource="AS400" timeout="1000">
				SELECT DISTINCT RJECUTSCONTRACTORS.FLNM5G as Contractor 
				FROM VPSFILES.JOBSUM0 AS JOBSUM0, VIEWS.RJECUTSCONTRACTORS AS RJECUTSCONTRACTORS 
				WHERE (JOBSUM0.CONO8Q = RJECUTSCONTRACTORS.CONOD4) AND (JOBSUM0.PRCD8Q = RJECUTSCONTRACTORS.PRCDD4)
			 	 AND (JOBSUM0.JBNO8Q = RJECUTSCONTRACTORS.JBNOD4) AND (JOBSUM0.CRCD8Q = RJECUTSCONTRACTORS.CRCDD4) 
			 	 AND (JOBSUM0.JBNO8Q = <cfqueryparam cfsqltype="cf_sql_numeric" value="#qOpenChartCuts.CutNumber#"> ) 
			 	 AND (JOBSUM0.CONO8Q = <cfqueryparam cfsqltype="cf_sql_numeric" value="#qOpenChartCuts.CompanyNumber#"> ) 
			</cfquery>
			
			<!--- only update the cut if the contractor is not an empty string --->
			<cfif qContractor.Contractor IS NOT ''>
							
				<!--- then update the open chart cut with the contractor information from AS400 --->
				<cfquery datasource="Mochi"> 
					UPDATE ProductionProgressHeader
					SET Contractor = <cfqueryparam cfsqltype="cf_sql_char" value="#qContractor.Contractor#">  
					WHERE CompanyNumber = <cfqueryparam cfsqltype="cf_sql_numeric" value="#qOpenChartCuts.CompanyNumber#">  
					AND   CutNumber = <cfqueryparam cfsqltype="cf_sql_numeric" value="#qOpenChartCuts.CutNumber#"> 
				</cfquery>
				
			</cfif>
									
		</cfloop>
				
		<cfreturn "SUCCESS">
		
	</cffunction>


	<cffunction name="closeOpenCutsFromAS400" returntype="string" output="no" access="public">
			
		<!--- First get all the open cuts in the chart  --->
		<cfquery name="qOpenChartCuts" datasource="Mochi">
			SELECT DISTINCT ProductionProgressID, CompanyNumber, CutNumber, Style, Color 
			FROM ProductionProgressHeader
			WHERE Status = 1
		</cfquery>
		
		<!--- Loop over the open cuts to update the information one by one --->
		<cfloop query="qOpenChartCuts">
			
			<cfquery name="qCutClosed" datasource="AS400">
				SELECT DISTINCT JOBSUM0.CLSD8Q as Closed 
				FROM VPSFILES.JOBSUM0 AS JOBSUM0  				  
			 	WHERE (JOBSUM0.JBNO8Q = <cfqueryparam cfsqltype="cf_sql_numeric" value="#qOpenChartCuts.CutNumber#"> ) 
			 	 AND (JOBSUM0.CONO8Q = <cfqueryparam cfsqltype="cf_sql_numeric" value="#qOpenChartCuts.CompanyNumber#"> )
			 	 AND (JOBSUM0.PRCD8Q = <cfqueryparam cfsqltype="cf_sql_char" value="#qOpenChartCuts.Style#"> )
			 	 AND (JOBSUM0.CRCD8Q = <cfqueryparam cfsqltype="cf_sql_char" value="#qOpenChartCuts.Color#"> ) 
			</cfquery>
			
			<!--- only update the cut if the status is closed --->
			<cfif (Trim(qCutClosed.Closed).EqualsIgnoreCase('Y')) OR qCutClosed.RECORDCOUNT EQ 0>
							
				<!--- then update the open chart cut with the status 2 information from AS400 --->
				<cfquery datasource="Mochi"> 
					UPDATE ProductionProgressHeader
					SET Status = <cfqueryparam cfsqltype="cf_sql_numeric" value="2">  
					WHERE ProductionProgressID = <cfqueryparam cfsqltype="cf_sql_numeric" value="#qOpenChartCuts.ProductionProgressID#">  
				</cfquery>
			
			</cfif>
									
		</cfloop>
		
		<cfreturn "SUCCESS">	
	
	</cffunction>




	<cffunction name="getNewOpenCutsInCompanyOneFromAS400" returntype="String" output="no" access="public">
	

		<!--- First get the maximun cut number for company one in the Production Progress Header File --->
		<cfquery name="qMaxCutNumber" datasource="Mochi">
			SELECT MAX(CutNumber) AS MaxCutNumber
			FROM ProductionProgressHeader
			WHERE (CompanyNumber = 1)
			
		</cfquery>
		
		<!--- Get All the Open Cuts From AS400 by date --->
		<cfquery name="qOpenCuts" datasource="AS400">
			SELECT JOBSUM0.CONO8Q as CompanyNumber, JOBSUM0.JBNO8Q as CutNumber, JOBSUM0.PRCD8Q as Style, 
				   JOBSUM0.CRCD8Q as Color,  
				   DATE(SUBSTR(CHAR(JOBSUM0.CRDT8Q),5,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.CRDT8Q),7,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.CRDT8Q),1,4)) AS IssueDate,  
				   DATE(SUBSTR(CHAR(JOBSUM0.DUDT8Q),5,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.DUDT8Q),7,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.DUDT8Q),1,4)) AS DueDate, 
			JOBSUM0.TLIS8Q as Issued, RJECUTSCONTRACTORS.FLNM5G as Contractor 
			FROM VPSFILES.JOBSUM0 AS JOBSUM0, VIEWS.RJECUTSCONTRACTORS AS RJECUTSCONTRACTORS 
			WHERE (JOBSUM0.CONO8Q = RJECUTSCONTRACTORS.CONOD4) AND (JOBSUM0.PRCD8Q = RJECUTSCONTRACTORS.PRCDD4)
		 	 AND (JOBSUM0.JBNO8Q = RJECUTSCONTRACTORS.JBNOD4) AND (JOBSUM0.CRCD8Q = RJECUTSCONTRACTORS.CRCDD4) 
		 	 AND (JOBSUM0.CLSD8Q <> 'Y') AND (JOBSUM0.PDTP8Q = 'IMP') AND (JOBSUM0.JBNO8Q > #qMaxCutNumber.MaxCutNumber#) 
		 	 AND (JOBSUM0.CONO8Q = 1)
		</cfquery>
		
		<cfloop query="qOpenCuts">
    
            <!--- Create a Struct to populate the ProductionProgressHeader Table --->
            <cfset pph = StructNew()>
            <cfset pph.ProductionProgressID = 0>
            <cfset pph.CompanyNumber = qOpenCuts.CompanyNumber>
            <cfset pph.CutNumber = qOpenCuts.CutNumber>
            <cfset pph.Style = qOpenCuts.Style>
            <cfset pph.Color = qOpenCuts.Color>
            <cfset pph.IssueDate = qOpenCuts.IssueDate>
            <cfset pph.DueDate = qOpenCuts.DueDate>
            <cfset pph.Issued = qOpenCuts.Issued>
			<cfset pph.TotalWorkDays = qOpenCuts.DueDate - qOpenCuts.IssueDate>
            <cfset pph.Contractor = qOpenCuts.Contractor>
            <cfset pph.Status = 1>
            <cfset pph.Comments = ''>
            <cfset pph.CreatedBy = 'AS400'>
            <cfset pph.CreatedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
            <cfset pph.LastMaintainedBy = 'AS400'>
            <cfset pph.LastMaintainedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
            
            <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressHeader" method="init" returnvariable="productionProgressHeader">
            	<cfinvokeargument name="stValues" value="#pph#">
			</cfinvoke>
            
            <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressHeaderGateway" method="save">
				<cfinvokeargument name="obj" value="#productionProgressHeader#"/>
			</cfinvoke>

			<!--- get the recent ProductionProgressID ---->
			<cfquery name="qProductionProgressID" datasource="#APPLICATION.DATASOURCE#">
				SELECT MAX(ProductionProgressHeader.ProductionProgressID) AS ProductionProgressID
				FROM ProductionProgressHeader			
			</cfquery>
			
			<!--- use the primary key 2 of the new order process in the OperationsProcesses table --->
			<cfquery name="qOperationsProcesses" datasource="#APPLICATION.DATASOURCE#">
				SELECT OperationProcessID, PercentDaysToFinish 
				FROM OperationsProcesses
				WHERE ProcessID = <cfqueryparam cfsqltype="cf_sql_integer" value="2"/>
				ORDER BY Sequence
			</cfquery>

				
				<cfloop query="qOperationsProcesses">
					<!--- Create a struct to enter in the ProductionProgressDetail Table --->
					<cfset ppd = StructNew()>
		            <cfset ppd.ProductionProgressDetailID = 0>
		            <cfset ppd.ProductionProgressID = qProductionProgressID.ProductionProgressID>
		            <cfset ppd.OperationProcessID = qOperationsProcesses.OperationProcessID>
		            <cfset ppd.FinishedDate = ''>
		            <cfset ppd.PlanDate = pph.IssueDate + (pph.TotalWorkDays * qOperationsProcesses.PercentDaysToFinish)>
		            <cfset ppd.ProductionDetailStatusID = 3>
		            <cfset ppd.Status = ''>
		            <cfset ppd.Comments = ''>
		            <cfset ppd.Revision = 0>		            
		            <cfset ppd.CreatedBy = 'AS400'>
		            <cfset ppd.CreatedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
            		<cfset ppd.LastMaintainedBy = 'AS400'>
            		<cfset ppd.LastMaintainedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
			
					<!--- Enter struct in the ProductionProgressDetail Table --->
					<cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressDetail" method="init" returnvariable="ProductionProgressDetail">
                    	<cfinvokeargument name="stValues" value="#ppd#">
					</cfinvoke>
                    
                    <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressDetailGateway" method="save">
						<cfinvokeargument name="obj" value="#ProductionProgressDetail#"/>
					</cfinvoke>
									
				</cfloop>
					
			
		</cfloop>		
		
		<cfreturn "SUCCESS">
		
	</cffunction>


	<cffunction name="getNewOpenCutsInCompanyThreeFromAS400" returntype="String" output="no" access="public">
	

		<!--- First get the maximun cut number for company one in the Production Progress Header File --->
		<cfquery name="qMaxCutNumber" datasource="Mochi">
			SELECT MAX(CutNumber) AS MaxCutNumber
			FROM ProductionProgressHeader
			WHERE (CompanyNumber = 3)
			
		</cfquery>
		
		<!--- Get All the Open Cuts From AS400 by date --->
		<cfquery name="qOpenCuts" datasource="AS400">
			SELECT JOBSUM0.CONO8Q as CompanyNumber, JOBSUM0.JBNO8Q as CutNumber, JOBSUM0.PRCD8Q as Style, 
				   JOBSUM0.CRCD8Q as Color,  
				   DATE(SUBSTR(CHAR(JOBSUM0.CRDT8Q),5,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.CRDT8Q),7,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.CRDT8Q),1,4)) AS IssueDate,  
				   DATE(SUBSTR(CHAR(JOBSUM0.DUDT8Q),5,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.DUDT8Q),7,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.DUDT8Q),1,4)) AS DueDate, 
			JOBSUM0.TLIS8Q as Issued, RJECUTSCONTRACTORS.FLNM5G as Contractor 
			FROM VPSFILES.JOBSUM0 AS JOBSUM0, VIEWS.RJECUTSCONTRACTORS AS RJECUTSCONTRACTORS 
			WHERE (JOBSUM0.CONO8Q = RJECUTSCONTRACTORS.CONOD4) AND (JOBSUM0.PRCD8Q = RJECUTSCONTRACTORS.PRCDD4)
		 	 AND (JOBSUM0.JBNO8Q = RJECUTSCONTRACTORS.JBNOD4) AND (JOBSUM0.CRCD8Q = RJECUTSCONTRACTORS.CRCDD4) 
		 	 AND (JOBSUM0.CLSD8Q <> 'Y') AND (JOBSUM0.PDTP8Q = 'IMP') AND (JOBSUM0.JBNO8Q > #qMaxCutNumber.MaxCutNumber#) 
		 	 AND (JOBSUM0.CONO8Q = 3)
		</cfquery>
		
		<cfloop query="qOpenCuts">
    
            <!--- Create a Struct to populate the ProductionProgressHeader Table --->
            <cfset pph = StructNew()>
            <cfset pph.ProductionProgressID = 0>
            <cfset pph.CompanyNumber = qOpenCuts.CompanyNumber>
            <cfset pph.CutNumber = qOpenCuts.CutNumber>
            <cfset pph.Style = qOpenCuts.Style>
            <cfset pph.Color = qOpenCuts.Color>
            <cfset pph.IssueDate = qOpenCuts.IssueDate>
            <cfset pph.DueDate = qOpenCuts.DueDate>
            <cfset pph.Issued = qOpenCuts.Issued>
			<cfset pph.TotalWorkDays = qOpenCuts.DueDate - qOpenCuts.IssueDate>
            <cfset pph.Contractor = qOpenCuts.Contractor>
            <cfset pph.Status = 1>
            <cfset pph.Comments = ''>
            <cfset pph.CreatedBy = 'AS400'>
            <cfset pph.CreatedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
            <cfset pph.LastMaintainedBy = 'AS400'>
            <cfset pph.LastMaintainedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
            
            <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressHeader" method="init" returnvariable="productionProgressHeader">
            	<cfinvokeargument name="stValues" value="#pph#">
			</cfinvoke>
            
            <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressHeaderGateway" method="save">
				<cfinvokeargument name="obj" value="#productionProgressHeader#"/>
			</cfinvoke>

			<!--- get the recent ProductionProgressID ---->
			<cfquery name="qProductionProgressID" datasource="#APPLICATION.DATASOURCE#">
				SELECT MAX(ProductionProgressHeader.ProductionProgressID) AS ProductionProgressID
				FROM ProductionProgressHeader			
			</cfquery>
			
			<!--- Check if the cut is a reorder or a new style ---->
			<cfquery name="qCheckCut" datasource="AS400">		
				SELECT COUNT(*) as Ordered 
				FROM VPSFILES.JOBSUM0 AS JOBSUM0 
				WHERE (PRCD8Q = <cfqueryparam  cfsqltype="cf_sql_char" value="#qOpenCuts.Style#"/>) 
				AND (CLSD8Q = 'Y')			
			</cfquery>

			<!--- get the recent ProductionProgressID ---->
			<cfquery name="qProductionProgressID" datasource="#APPLICATION.DATASOURCE#">
				SELECT MAX(ProductionProgressHeader.ProductionProgressID) AS ProductionProgressID
				FROM ProductionProgressHeader			
			</cfquery>
			

			<!--- use the primary key 2 of the new order process in the OperationsProcesses table --->
			<cfquery name="qOperationsProcesses" datasource="#APPLICATION.DATASOURCE#">
				SELECT OperationProcessID, PercentDaysToFinish
				FROM OperationsProcesses
				WHERE ProcessID = <cfqueryparam cfsqltype="cf_sql_integer" value="2"/>
				ORDER BY Sequence
			</cfquery>

				<cfloop query="qOperationsProcesses">
					
					
					<!--- Create a struct to enter in the ProductionProgressDetail Table --->
					<cfset ppd = StructNew()>
		            <cfset ppd.ProductionProgressDetailID = 0>
		            <cfset ppd.ProductionProgressID = qProductionProgressID.ProductionProgressID>
		            <cfset ppd.OperationProcessID = qOperationsProcesses.OperationProcessID>
		            <cfset ppd.FinishedDate = ''>
		            <cfset ppd.PlanDate = pph.IssueDate + (pph.TotalWorkDays * qOperationsProcesses.PercentDaysToFinish)>
					<cfset ppd.ProductionDetailStatusID = 3>
		            <cfset ppd.Status = ''>
		            <cfset ppd.Comments = ''>
		            <cfset ppd.Revision = 0>		            
		            <cfset ppd.CreatedBy = 'AS400'>
		            <cfset ppd.CreatedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
            		<cfset ppd.LastMaintainedBy = 'AS400'>
            		<cfset ppd.LastMaintainedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
			
					<!--- Enter struct in the ProductionProgressDetail Table --->
					<cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressDetail" method="init" returnvariable="ProductionProgressDetail">
                    	<cfinvokeargument name="stValues" value="#ppd#">
					</cfinvoke>
                    
                    <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressDetailGateway" method="save">
						<cfinvokeargument name="obj" value="#ProductionProgressDetail#"/>
					</cfinvoke>
									
				</cfloop>
					
			
		</cfloop>		
		
		<cfreturn "SUCCESS">
		
	</cffunction>
	
	
	<cffunction name="getNewOpenCutsInCompanyTwoFromAS400" returntype="String" output="no" access="public">
	

		<!--- First get the maximun cut number for company one in the Production Progress Header File --->
		<cfquery name="qMaxCutNumber" datasource="Mochi">
			SELECT MAX(CutNumber) AS MaxCutNumber
			FROM ProductionProgressHeader
			WHERE (CompanyNumber = 2)
			
		</cfquery>
		
		<!--- Get All the Open Cuts From AS400 by date --->
		<cfquery name="qOpenCuts" datasource="AS400">
			SELECT JOBSUM0.CONO8Q as CompanyNumber, JOBSUM0.JBNO8Q as CutNumber, JOBSUM0.PRCD8Q as Style, 
				   JOBSUM0.CRCD8Q as Color,  
				   DATE(SUBSTR(CHAR(JOBSUM0.CRDT8Q),5,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.CRDT8Q),7,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.CRDT8Q),1,4)) AS IssueDate,  
				   DATE(SUBSTR(CHAR(JOBSUM0.DUDT8Q),5,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.DUDT8Q),7,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.DUDT8Q),1,4)) AS DueDate, 
			JOBSUM0.TLIS8Q as Issued, RJECUTSCONTRACTORS.FLNM5G as Contractor 
			FROM VPSFILES.JOBSUM0 AS JOBSUM0, VIEWS.RJECUTSCONTRACTORS AS RJECUTSCONTRACTORS 
			WHERE (JOBSUM0.CONO8Q = RJECUTSCONTRACTORS.CONOD4) AND (JOBSUM0.PRCD8Q = RJECUTSCONTRACTORS.PRCDD4)
		 	 AND (JOBSUM0.JBNO8Q = RJECUTSCONTRACTORS.JBNOD4) AND (JOBSUM0.CRCD8Q = RJECUTSCONTRACTORS.CRCDD4) 
		 	 AND (JOBSUM0.CLSD8Q <> 'Y') AND (JOBSUM0.PDTP8Q = 'IMP') AND (JOBSUM0.JBNO8Q > #qMaxCutNumber.MaxCutNumber#) 
		 	 AND (JOBSUM0.CONO8Q = 3)
		</cfquery>
		
		<cfloop query="qOpenCuts">
    
            <!--- Create a Struct to populate the ProductionProgressHeader Table --->
            <cfset pph = StructNew()>
            <cfset pph.ProductionProgressID = 0>
            <cfset pph.CompanyNumber = qOpenCuts.CompanyNumber>
            <cfset pph.CutNumber = qOpenCuts.CutNumber>
            <cfset pph.Style = qOpenCuts.Style>
            <cfset pph.Color = qOpenCuts.Color>
            <cfset pph.IssueDate = qOpenCuts.IssueDate>
            <cfset pph.DueDate = qOpenCuts.DueDate>
            <cfset pph.Issued = qOpenCuts.Issued>
			<cfset pph.TotalWorkDays = qOpenCuts.DueDate - qOpenCuts.IssueDate>
            <cfset pph.Contractor = qOpenCuts.Contractor>
            <cfset pph.Status = 1>
            <cfset pph.Comments = ''>
            <cfset pph.CreatedBy = 'AS400'>
            <cfset pph.CreatedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
            <cfset pph.LastMaintainedBy = 'AS400'>
            <cfset pph.LastMaintainedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
            
            <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressHeader" method="init" returnvariable="productionProgressHeader">
            	<cfinvokeargument name="stValues" value="#pph#">
			</cfinvoke>
            
            <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressHeaderGateway" method="save">
				<cfinvokeargument name="obj" value="#productionProgressHeader#"/>
			</cfinvoke>

			<!--- get the recent ProductionProgressID ---->
			<cfquery name="qProductionProgressID" datasource="#APPLICATION.DATASOURCE#">
				SELECT MAX(ProductionProgressHeader.ProductionProgressID) AS ProductionProgressID
				FROM ProductionProgressHeader			
			</cfquery>
			
			<!--- Check if the cut is a reorder or a new style ---->
			<cfquery name="qCheckCut" datasource="AS400">		
				SELECT COUNT(*) as Ordered 
				FROM VPSFILES.JOBSUM0 AS JOBSUM0 
				WHERE (PRCD8Q = <cfqueryparam  cfsqltype="cf_sql_char" value="#qOpenCuts.Style#"/>) 
				AND (CLSD8Q = 'Y')			
			</cfquery>

			<!--- get the recent ProductionProgressID ---->
			<cfquery name="qProductionProgressID" datasource="#APPLICATION.DATASOURCE#">
				SELECT MAX(ProductionProgressHeader.ProductionProgressID) AS ProductionProgressID
				FROM ProductionProgressHeader			
			</cfquery>
			

			<!--- use the primary key 2 of the new order process in the OperationsProcesses table --->
			<cfquery name="qOperationsProcesses" datasource="#APPLICATION.DATASOURCE#">
				SELECT OperationProcessID, PercentDaysToFinish
				FROM OperationsProcesses
				WHERE ProcessID = <cfqueryparam cfsqltype="cf_sql_integer" value="2"/>
				ORDER BY Sequence
			</cfquery>

				<cfloop query="qOperationsProcesses">
					
					
					<!--- Create a struct to enter in the ProductionProgressDetail Table --->
					<cfset ppd = StructNew()>
		            <cfset ppd.ProductionProgressDetailID = 0>
		            <cfset ppd.ProductionProgressID = qProductionProgressID.ProductionProgressID>
		            <cfset ppd.OperationProcessID = qOperationsProcesses.OperationProcessID>
		            <cfset ppd.FinishedDate = ''>
		            <cfset ppd.PlanDate = pph.IssueDate + (pph.TotalWorkDays * qOperationsProcesses.PercentDaysToFinish)>
					<cfset ppd.ProductionDetailStatusID = 3>
		            <cfset ppd.Status = ''>
		            <cfset ppd.Comments = ''>
		            <cfset ppd.Revision = 0>		            
		            <cfset ppd.CreatedBy = 'AS400'>
		            <cfset ppd.CreatedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
            		<cfset ppd.LastMaintainedBy = 'AS400'>
            		<cfset ppd.LastMaintainedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
			
					<!--- Enter struct in the ProductionProgressDetail Table --->
					<cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressDetail" method="init" returnvariable="ProductionProgressDetail">
                    	<cfinvokeargument name="stValues" value="#ppd#">
					</cfinvoke>
                    
                    <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressDetailGateway" method="save">
						<cfinvokeargument name="obj" value="#ProductionProgressDetail#"/>
					</cfinvoke>
									
				</cfloop>
					
			
		</cfloop>		
		
		<cfreturn "SUCCESS">
		
	</cffunction>
	
	<cffunction name="updateReordersInTheChart" returntype="String" output="no" access="public">
	
		<!--- First get all open cuts in the as400 and check all the reorders --->
		<cfquery name="qReorderedStyle" datasource="as400">
			SELECT DISTINCT JOBSUM0.PRCD8Q, RJECUTSCONTRACTORS.FLNM5G FROM VPSFILES.JOBSUM0 AS JOBSUM0, VIEWS.RJECUTSCONTRACTORS AS RJECUTSCONTRACTORS WHERE (JOBSUM0.CONO8Q = RJECUTSCONTRACTORS.CONOD4) AND (JOBSUM0.PRCD8Q = RJECUTSCONTRACTORS.PRCDD4) AND (JOBSUM0.JBNO8Q = RJECUTSCONTRACTORS.JBNOD4) AND (JOBSUM0.CRCD8Q = RJECUTSCONTRACTORS.CRCDD4) AND (JOBSUM0.CLSD8Q <> 'Y') 
			INTERSECT
			SELECT DISTINCT JOBSUM0.PRCD8Q, RJECUTSCONTRACTORS.FLNM5G FROM VPSFILES.JOBSUM0 AS JOBSUM0, VIEWS.RJECUTSCONTRACTORS AS RJECUTSCONTRACTORS WHERE (JOBSUM0.CONO8Q = RJECUTSCONTRACTORS.CONOD4) AND (JOBSUM0.PRCD8Q = RJECUTSCONTRACTORS.PRCDD4) AND (JOBSUM0.JBNO8Q = RJECUTSCONTRACTORS.JBNOD4) AND (JOBSUM0.CRCD8Q = RJECUTSCONTRACTORS.CRCDD4) AND (JOBSUM0.CLSD8Q = 'Y')		
		</cfquery>		

		<cfloop query="qReorderedStyle">
		
			<!--- Then Update all the production status of those styles that are re-ordered --->
			<cfquery name="qProductionProgressHeader" datasource="#APPLICATION.DATASOURCE#">
				SELECT ProductionProgressHeader.ProductionProgressID
				FROM ProductionProgressHeader
				WHERE (((ProductionProgressHeader.Style)= <cfqueryparam  cfsqltype="cf_sql_char" value="#qReorderedStyle.PRCD8Q#"/>) 
				AND ((ProductionProgressHeader.Contractor)= <cfqueryparam  cfsqltype="cf_sql_char" value="#qReorderedStyle.FLNM5G#"/>) 
				AND ((ProductionProgressHeader.Status)=1))
			</cfquery>
			
			<cfloop query="qProductionProgressHeader">
				
				<cfquery name="qProductionProgressDetail" datasource="#APPLICATION.DATASOURCE#">
					SELECT ProductionProgressDetail.ProductionProgressDetailID
					FROM ProductionProgressDetail
					WHERE ProductionProgressDetail.ProductionProgressID= <cfqueryparam  cfsqltype="cf_sql_numeric" value="#qProductionProgressHeader.ProductionProgressID#"/>
					AND ProductionProgressDetail.OperationProcessID IN (23,25,8,7,10,16,26)
				</cfquery>

				<cfloop query="qProductionProgressDetail">
					
					<cfquery datasource="#APPLICATION.DATASOURCE#">
						UPDATE ProductionProgressDetail
						SET Status = 'REORDER', FinishedDate = <cfqueryparam  cfsqltype="cf_sql_numeric" value="#DateFormat(Now(), 'mm/dd/yyyy')#"/>,
						    ProductionDetailStatusID = 58
						WHERE ProductionProgressDetailID = #qProductionProgressDetail.ProductionProgressDetailID#
					</cfquery>
					
				</cfloop>
												
			</cfloop>
				
		</cfloop>
			
	</cffunction>
	

	<!--- to re-upload a cut in the chart --->
	<cffunction name="reuploadCutInCompanyOneFromAS400" returntype="String" output="no" access="public">
		<cfargument name="cut" required="true">


		<!--- Delete the cut from the chart first --->
		<cfquery name="qProgressHeaderID" datasource="#APPLICATION.DATASOURCE#">
				SELECT ProductionProgressHeader.ProductionProgressID
				FROM ProductionProgressHeader
				WHERE ProductionProgressHeader.CutNumber = <cfqueryparam cfsqltype="CF_SQL_NUMERIC" value="#arguments.cut#" />		
		</cfquery>
		
        <cfif qProgressHeaderID.RECORDCOUNT GT 0>
            <cfloop query="qProgressHeaderID">
                <cfquery datasource="#APPLICATION.DATASOURCE#">
                    DELETE FROM ProductionProgressDetail
                    WHERE ProductionProgressDetail.ProductionProgressID = #qProgressHeaderID.ProductionProgressID#
                </cfquery>		
        
                <cfquery datasource="#APPLICATION.DATASOURCE#">
                    DELETE FROM ProductionProgressHeader
                    WHERE ProductionProgressHeader.ProductionProgressID = #qProgressHeaderID.ProductionProgressID#
                </cfquery>		
			</cfloop>
		</cfif>                            
				
		<!--- Get All the Open Cuts From AS400 by date --->
		<cfquery name="qOpenCuts" datasource="AS400">
			SELECT JOBSUM0.CONO8Q as CompanyNumber, JOBSUM0.JBNO8Q as CutNumber, JOBSUM0.PRCD8Q as Style, 
				   JOBSUM0.CRCD8Q as Color,  
				   DATE(SUBSTR(CHAR(JOBSUM0.CRDT8Q),5,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.CRDT8Q),7,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.CRDT8Q),1,4)) AS IssueDate,  
				   DATE(SUBSTR(CHAR(JOBSUM0.DUDT8Q),5,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.DUDT8Q),7,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.DUDT8Q),1,4)) AS DueDate, 
			JOBSUM0.TLIS8Q as Issued, RJECUTSCONTRACTORS.FLNM5G as Contractor 
			FROM VPSFILES.JOBSUM0 AS JOBSUM0, VIEWS.RJECUTSCONTRACTORS AS RJECUTSCONTRACTORS 
			WHERE (JOBSUM0.CONO8Q = RJECUTSCONTRACTORS.CONOD4) AND (JOBSUM0.PRCD8Q = RJECUTSCONTRACTORS.PRCDD4)
		 	 AND (JOBSUM0.JBNO8Q = RJECUTSCONTRACTORS.JBNOD4) AND (JOBSUM0.CRCD8Q = RJECUTSCONTRACTORS.CRCDD4) 
		 	 AND (JOBSUM0.CLSD8Q <> 'Y') AND (JOBSUM0.PDTP8Q = 'IMP') AND (JOBSUM0.JBNO8Q = <cfqueryparam cfsqltype="CF_SQL_NUMERIC" value="#arguments.cut#" />) 
		 	 AND (JOBSUM0.CONO8Q = 1)
		</cfquery>
		
		<cfloop query="qOpenCuts">
    
            <!--- Create a Struct to populate the ProductionProgressHeader Table --->
            <cfset pph = StructNew()>
            <cfset pph.ProductionProgressID = 0>
            <cfset pph.CompanyNumber = qOpenCuts.CompanyNumber>
            <cfset pph.CutNumber = qOpenCuts.CutNumber>
            <cfset pph.Style = qOpenCuts.Style>
            <cfset pph.Color = qOpenCuts.Color>
            <cfset pph.IssueDate = qOpenCuts.IssueDate>
            <cfset pph.DueDate = qOpenCuts.DueDate>
            <cfset pph.Issued = qOpenCuts.Issued>
			<cfset pph.TotalWorkDays = qOpenCuts.DueDate - qOpenCuts.IssueDate>
            <cfset pph.Contractor = qOpenCuts.Contractor>
            <cfset pph.Status = 1>
            <cfset pph.Comments = ''>
            <cfset pph.CreatedBy = 'AS400'>
            <cfset pph.CreatedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
            <cfset pph.LastMaintainedBy = 'AS400'>
            <cfset pph.LastMaintainedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
            
            <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressHeader" method="init" returnvariable="productionProgressHeader">
            	<cfinvokeargument name="stValues" value="#pph#">
			</cfinvoke>
            
            <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressHeaderGateway" method="save">
				<cfinvokeargument name="obj" value="#productionProgressHeader#"/>
			</cfinvoke>

			<!--- get the recent ProductionProgressID ---->
			<cfquery name="qProductionProgressID" datasource="#APPLICATION.DATASOURCE#">
				SELECT MAX(ProductionProgressHeader.ProductionProgressID) AS ProductionProgressID
				FROM ProductionProgressHeader			
			</cfquery>
			
			<!--- use the primary key 2 of the new order process in the OperationsProcesses table --->
			<cfquery name="qOperationsProcesses" datasource="#APPLICATION.DATASOURCE#">
				SELECT OperationProcessID, PercentDaysToFinish 
				FROM OperationsProcesses
				WHERE ProcessID = <cfqueryparam cfsqltype="cf_sql_integer" value="2"/>
				ORDER BY Sequence
			</cfquery>

				
				<cfloop query="qOperationsProcesses">
					<!--- Create a struct to enter in the ProductionProgressDetail Table --->
					<cfset ppd = StructNew()>
		            <cfset ppd.ProductionProgressDetailID = 0>
		            <cfset ppd.ProductionProgressID = qProductionProgressID.ProductionProgressID>
		            <cfset ppd.OperationProcessID = qOperationsProcesses.OperationProcessID>
		            <cfset ppd.FinishedDate = ''>
		            <cfset ppd.PlanDate = pph.IssueDate + (pph.TotalWorkDays * qOperationsProcesses.PercentDaysToFinish)>
		            <cfset ppd.ProductionDetailStatusID = 3>
		            <cfset ppd.Status = ''>
		            <cfset ppd.Comments = ''>
		            <cfset ppd.Revision = 0>		            
		            <cfset ppd.CreatedBy = 'AS400'>
		            <cfset ppd.CreatedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
            		<cfset ppd.LastMaintainedBy = 'AS400'>
            		<cfset ppd.LastMaintainedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
			
					<!--- Enter struct in the ProductionProgressDetail Table --->
					<cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressDetail" method="init" returnvariable="ProductionProgressDetail">
                    	<cfinvokeargument name="stValues" value="#ppd#">
					</cfinvoke>
                    
                    <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressDetailGateway" method="save">
						<cfinvokeargument name="obj" value="#ProductionProgressDetail#"/>
					</cfinvoke>
									
				</cfloop>
					
			
		</cfloop>		
		
		<cfreturn "SUCCESS">
		
	</cffunction>

	<!--- to re-upload a cut in the chart from company three --->
	<cffunction name="reuploadCutInCompanyThreeFromAS400" returntype="String" output="no" access="public">
		<cfargument name="cut" required="true">


		<!--- Delete the cut from the chart first --->
		<cfquery name="qProgressHeaderID" datasource="#APPLICATION.DATASOURCE#">
				SELECT ProductionProgressHeader.ProductionProgressID
				FROM ProductionProgressHeader
				WHERE ProductionProgressHeader.CutNumber = <cfqueryparam cfsqltype="CF_SQL_NUMERIC" value="#arguments.cut#" />		
		</cfquery>
		
        <cfif qProgressHeaderID.RECORDCOUNT GT 0>
            <cfloop query="qProgressHeaderID">
                <cfquery datasource="#APPLICATION.DATASOURCE#">
                    DELETE FROM ProductionProgressDetail
                    WHERE ProductionProgressDetail.ProductionProgressID = #qProgressHeaderID.ProductionProgressID#
                </cfquery>		
        
                <cfquery datasource="#APPLICATION.DATASOURCE#">
                    DELETE FROM ProductionProgressHeader
                    WHERE ProductionProgressHeader.ProductionProgressID = #qProgressHeaderID.ProductionProgressID#
                </cfquery>		
            </cfloop>
        </cfif>
        				
		<!--- Get All the Open Cuts From AS400 by date --->
		<cfquery name="qOpenCuts" datasource="AS400">
			SELECT JOBSUM0.CONO8Q as CompanyNumber, JOBSUM0.JBNO8Q as CutNumber, JOBSUM0.PRCD8Q as Style, 
				   JOBSUM0.CRCD8Q as Color,  
				   DATE(SUBSTR(CHAR(JOBSUM0.CRDT8Q),5,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.CRDT8Q),7,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.CRDT8Q),1,4)) AS IssueDate,  
				   DATE(SUBSTR(CHAR(JOBSUM0.DUDT8Q),5,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.DUDT8Q),7,2) ||'/'|| SUBSTR(CHAR(JOBSUM0.DUDT8Q),1,4)) AS DueDate, 
			JOBSUM0.TLIS8Q as Issued, RJECUTSCONTRACTORS.FLNM5G as Contractor 
			FROM VPSFILES.JOBSUM0 AS JOBSUM0, VIEWS.RJECUTSCONTRACTORS AS RJECUTSCONTRACTORS 
			WHERE (JOBSUM0.CONO8Q = RJECUTSCONTRACTORS.CONOD4) AND (JOBSUM0.PRCD8Q = RJECUTSCONTRACTORS.PRCDD4)
		 	 AND (JOBSUM0.JBNO8Q = RJECUTSCONTRACTORS.JBNOD4) AND (JOBSUM0.CRCD8Q = RJECUTSCONTRACTORS.CRCDD4) 
		 	 AND (JOBSUM0.CLSD8Q <> 'Y') AND (JOBSUM0.PDTP8Q = 'IMP') AND (JOBSUM0.JBNO8Q = <cfqueryparam cfsqltype="CF_SQL_NUMERIC" value="#arguments.cut#" />) 
		 	 AND (JOBSUM0.CONO8Q = 3)
		</cfquery>
		
		<cfloop query="qOpenCuts">
    
            <!--- Create a Struct to populate the ProductionProgressHeader Table --->
            <cfset pph = StructNew()>
            <cfset pph.ProductionProgressID = 0>
            <cfset pph.CompanyNumber = qOpenCuts.CompanyNumber>
            <cfset pph.CutNumber = qOpenCuts.CutNumber>
            <cfset pph.Style = qOpenCuts.Style>
            <cfset pph.Color = qOpenCuts.Color>
            <cfset pph.IssueDate = qOpenCuts.IssueDate>
            <cfset pph.DueDate = qOpenCuts.DueDate>
            <cfset pph.Issued = qOpenCuts.Issued>
			<cfset pph.TotalWorkDays = qOpenCuts.DueDate - qOpenCuts.IssueDate>
            <cfset pph.Contractor = qOpenCuts.Contractor>
            <cfset pph.Status = 1>
            <cfset pph.Comments = ''>
            <cfset pph.CreatedBy = 'AS400'>
            <cfset pph.CreatedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
            <cfset pph.LastMaintainedBy = 'AS400'>
            <cfset pph.LastMaintainedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
            
            <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressHeader" method="init" returnvariable="productionProgressHeader">
            	<cfinvokeargument name="stValues" value="#pph#">
			</cfinvoke>
            
            <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressHeaderGateway" method="save">
				<cfinvokeargument name="obj" value="#productionProgressHeader#"/>
			</cfinvoke>

			<!--- get the recent ProductionProgressID ---->
			<cfquery name="qProductionProgressID" datasource="#APPLICATION.DATASOURCE#">
				SELECT MAX(ProductionProgressHeader.ProductionProgressID) AS ProductionProgressID
				FROM ProductionProgressHeader			
			</cfquery>
			
			<!--- use the primary key 2 of the new order process in the OperationsProcesses table --->
			<cfquery name="qOperationsProcesses" datasource="#APPLICATION.DATASOURCE#">
				SELECT OperationProcessID, PercentDaysToFinish 
				FROM OperationsProcesses
				WHERE ProcessID = <cfqueryparam cfsqltype="cf_sql_integer" value="2"/>
				ORDER BY Sequence
			</cfquery>

				
				<cfloop query="qOperationsProcesses">
					<!--- Create a struct to enter in the ProductionProgressDetail Table --->
					<cfset ppd = StructNew()>
		            <cfset ppd.ProductionProgressDetailID = 0>
		            <cfset ppd.ProductionProgressID = qProductionProgressID.ProductionProgressID>
		            <cfset ppd.OperationProcessID = qOperationsProcesses.OperationProcessID>
		            <cfset ppd.FinishedDate = ''>
		            <cfset ppd.PlanDate = pph.IssueDate + (pph.TotalWorkDays * qOperationsProcesses.PercentDaysToFinish)>
		            <cfset ppd.ProductionDetailStatusID = 3>
		            <cfset ppd.Status = ''>
		            <cfset ppd.Comments = ''>
		            <cfset ppd.Revision = 0>		            
		            <cfset ppd.CreatedBy = 'AS400'>
		            <cfset ppd.CreatedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
            		<cfset ppd.LastMaintainedBy = 'AS400'>
            		<cfset ppd.LastMaintainedDate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
			
					<!--- Enter struct in the ProductionProgressDetail Table --->
					<cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressDetail" method="init" returnvariable="ProductionProgressDetail">
                    	<cfinvokeargument name="stValues" value="#ppd#">
					</cfinvoke>
                    
                    <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressDetailGateway" method="save">
						<cfinvokeargument name="obj" value="#ProductionProgressDetail#"/>
					</cfinvoke>
									
				</cfloop>
					
			
		</cfloop>		
		
		<cfreturn "SUCCESS">
		
	</cffunction>
	
	<cffunction name="updateStyleColorDeliveryDate" returntype="String" output="no" access="public">
		<cfargument name="StyleID" required="true">
		<cfargument name="ColorID" required="true">
		<cfargument name="DeliveryID" required="true">

		<cfquery datasource="#APPLICATION.DATASOURCE#">
			UPDATE SampleRequest
			SET DeliveryID  = <cfqueryparam cfsqltype="CF_SQL_NUMERIC" value="#arguments.DeliveryID#" />
			WHERE StyleID = <cfqueryparam cfsqltype="CF_SQL_NUMERIC" value="#arguments.StyleID#" />
			AND   ColorID = <cfqueryparam cfsqltype="CF_SQL_NUMERIC" value="#arguments.ColorID#" />
		</cfquery>

	</cffunction>			


	<cffunction name="updateColorDeliveryDate" returntype="String" output="no" access="public">
		<cfargument name="ColorID" required="true">
		<cfargument name="DeliveryID" required="true">

		<cfquery datasource="#APPLICATION.DATASOURCE#">
			UPDATE SampleRequest
			SET DeliveryID  = <cfqueryparam cfsqltype="CF_SQL_NUMERIC" value="#arguments.DeliveryID#" />
			WHERE   ColorID = <cfqueryparam cfsqltype="CF_SQL_NUMERIC" value="#arguments.ColorID#" />
		</cfquery>

		<cfreturn "SUCCESS">
        
	</cffunction>		
	
	
    <!--- This will update all the styles with beading in the program --->
    <cffunction name="updateStylesWithBeading" returntype="string" output="no" access="public">
           
           <cfquery name="qBeadingStyles" datasource="AS400">
                SELECT DISTINCT PRHDMS0.PRCD3K AS StyleName
                FROM VPSFILES.PRHDMS0 AS PRHDMS0, VPSFILES.JOBSUM0 AS JOBSUM0 
                WHERE (PRHDMS0.CONO3K = JOBSUM0.CONO8Q) AND (PRHDMS0.PRCD3K = JOBSUM0.PRCD8Q) 
                AND (SCCD3K <> 'BEA') AND (JOBSUM0.CLSD8Q <> 'Y')           
           </cfquery>

			<cfloop query="qBeadingStyles">
            	
				<!--- First look for the Production Progress IDs with that style --->
                <cfquery name="qProductionProgressHeader" datasource="#APPLICATION.DATASOURCE#">
					SELECT ProductionProgressHeader.ProductionProgressID, ProductionProgressHeader.CreatedDate
					FROM ProductionProgressHeader
					WHERE ProductionProgressHeader.Style = '#qBeadingStyles.StyleName#' 
					AND ProductionProgressHeader.Status = 1
                </cfquery>

				<cfloop query="qProductionProgressHeader">			
                
                	<!--- Then update the all the beading operation with the completion --->
                    <cfquery datasource="#APPLICATION.DATASOURCE#">
                        UPDATE ProductionProgressDetail
                        SET FinishedDate = <cfqueryparam cfsqltype="cf_sql_date" value="#DateFormat(qProductionProgressHeader.CreatedDate, 'mm/dd/yyyy')#"/>,
                            ProductionDetailStatusID = <cfqueryparam cfsqltype="cf_sql_numeric" value="54"/>,
							Status = 'NOBEADS'	 				
                        WHERE OperationProcessID  IN (19,10,15)
                        AND (ProductionProgressDetail.FinishedDate Is Null)
                        AND (ProductionProgressID = <cfqueryparam cfsqltype="cf_sql_numeric" value="#qProductionProgressHeader.ProductionProgressID#"/>)
                    </cfquery>
                    
                </cfloop>
                
            </cfloop>
            
            <cfreturn "SUCCESS">
                       
    </cffunction>
    
	 <!--- This will update all the styles with beading in the program --->
    <cffunction name="updateTadashiRetailStorePrice" returntype="string" output="no" access="public">    



		
        <cfquery datasource="AS400">
            UPDATE VPSFILES.ORDDTL0 
            SET EDSP4E = ((SLPR4E * 2) + 10)
            WHERE (CSNO4E IN (10408, 20408)) AND (LNST4E <> 'C') AND (INLN4E <> 'Y')
        </cfquery>

    	
    </cffunction>    

    <cffunction name="updateCuttingTicketLeadTimes" returntype="struct" output="no" access="public">
    
        
        
		<!--- get all open import cutting ticket in as400 that doesnt have a lead time yet --->		
           <cfquery name="qOpenImportCuts" datasource="AS400">
					SELECT CONO8Q, JBNO8Q, PRCD8Q, CRCD8Q, DUDT8Q, CMDT8Q, CRDT8Q, TLIS8Q, STCD8Q,  DATE(SUBSTR(VARCHAR(JOBSUM0.ISDT8Q),1,4) ||'-'||  SUBSTR(VARCHAR(JOBSUM0.ISDT8Q),5,2)  ||'-'|| SUBSTR(VARCHAR(JOBSUM0.ISDT8Q),7,2)) AS ISSUEDATE
                    FROM VPSFILES.JOBSUM0 AS JOBSUM0 
                    WHERE (CONO8Q = 1) AND (STCD8Q = 'ISS') AND ((CRDT8Q > 20100421) OR (DUDT8Q > 20100531)) AND              
           </cfquery>
        
        
        <!--- get the cost sheet information of the style of the cutting ticket just get the fabric material information only--->		
        <cfloop query="qOpenImportCuts">
        	
            <cfset leadDays = 0>
            
           <cfquery name="qCostSheet" datasource="AS400">
				SELECT CSTMTL0.PRCDE3, CSTMTL0.CRCDE3, CSTMTL0.VRNOE3, CSTMTL0.MTCDE3, CSTMTL0.MTCRE3, CSTMTL0.QNTYE3, CSTMTL0.AJQTE3, MTRLMS0.DYLT3R 
                FROM VPSFILES.CSTMTL0 AS CSTMTL0, VPSFILES.MTRLMS0 AS MTRLMS0 
                WHERE (CSTMTL0.CONOE3 = MTRLMS0.CONO3R) AND (CSTMTL0.MTCDE3 = MTRLMS0.MTCD3R) AND (CSTMTL0.CONOE3 = 2)  AND (CSTMTL0.VRNOE3 = 1) 
                AND (MTRLMS0.CLCD3R = 'FAB') AND (CSTMTL0.PRCDE3 = '#qOpenImportCuts.PRCD8Q#') AND (CSTMTL0.CRCDE3 = '#qOpenImportCuts.CRCD8Q#')          
           </cfquery>
           
           <!--- get the material requirement of the cost sheet --->
           <!--- check if there  was a cost sheet ---> 
           <cfif qCostSheet.RECORDCOUNT GT 0>
				<!--- get the fabric information and requirement --->
                <cfloop query="qCostSheet">
                	<!--- get this cutting ticket requirement --->
                	<cfset fabricRequirement = qOpenImportCuts.TLIS8Q * qCostSheet.AJQTE3 * 1.015>
                
					<!--- check fabric availability --->		
                    <cfquery name="qFabricAvailability" datasource="AS400">
SELECT JOBMTL0.MTCDE9, JOBMTL0.MTCRE9,  
		DECIMAL(SUM(((JOBMTL0.AJQTE9 * ((JOBSUM0.IS018Q + JOBSUM0.IS028Q + JOBSUM0.IS038Q + JOBSUM0.IS048Q + JOBSUM0.IS058Q) -  (JOBSCD0.QC01D4 + JOBSCD0.QC02D4 + JOBSCD0.QC03D4 + JOBSCD0.QC04D4 + JOBSCD0.QC05D4))) + ((JOBMTL0.AJQTE9 * 1.03) * ((JOBSUM0.IS068Q + JOBSUM0.IS078Q + JOBSUM0.IS088Q + JOBSUM0.IS098Q + JOBSUM0.IS108Q + JOBSUM0.IS118Q + JOBSUM0.IS128Q) - (JOBSCD0.QC06D4 + JOBSCD0.QC07D4 + JOBSCD0.QC08D4 + JOBSCD0.QC09D4 + JOBSCD0.QC10D4 + JOBSCD0.QC11D4 + JOBSCD0.QC12D4))))),8,2) AS REQUIREMENTS, 
			DECIMAL(AVG(MTLAVL0.OHQTF1),8,2) AS ONHAND, 
			DECIMAL(AVG(MTLAVL0.POQTF1),8,2) AS PO,
			DECIMAL((AVG(MTLAVL0.OHQTF1) + AVG(MTLAVL0.POQTF1)) - SUM(((JOBMTL0.AJQTE9 * ((JOBSUM0.IS018Q + JOBSUM0.IS028Q + JOBSUM0.IS038Q + JOBSUM0.IS048Q + JOBSUM0.IS058Q) -  (JOBSCD0.QC01D4 + JOBSCD0.QC02D4 + JOBSCD0.QC03D4 + JOBSCD0.QC04D4 + JOBSCD0.QC05D4))) + ((JOBMTL0.AJQTE9 * 1.03) * ((JOBSUM0.IS068Q + JOBSUM0.IS078Q + JOBSUM0.IS088Q + JOBSUM0.IS098Q + JOBSUM0.IS108Q + JOBSUM0.IS118Q + JOBSUM0.IS128Q) - (JOBSCD0.QC06D4 + JOBSCD0.QC07D4 + JOBSCD0.QC08D4 + JOBSCD0.QC09D4 + JOBSCD0.QC10D4 + JOBSCD0.QC11D4 + JOBSCD0.QC12D4))))),8,2) AS AVAILABLE, 
            SUM(JOBMTL0.MDQTE9)AS DISPATCHED, MTRLMS0.CLCD3R 
            FROM S1077DBF.VPSFILES.JOBMTL0 AS JOBMTL0 JOIN S1077DBF.VPSFILES.JOBSUM0 AS JOBSUM0 ON 
			(JOBMTL0.CONOE9 = JOBSUM0.CONO8Q) AND (JOBMTL0.PRCDE9 = JOBSUM0.PRCD8Q) 
			AND (JOBMTL0.JBNOE9 = JOBSUM0.JBNO8Q) AND (JOBMTL0.CRCDE9 = JOBSUM0.CRCD8Q)  
JOIN S1077DBF.VPSFILES.JOBSCD0 AS JOBSCD0 ON (JOBMTL0.CONOE9 = JOBSCD0.CONOD4) AND (JOBMTL0.JBNOE9 = JOBSCD0.JBNOD4) AND (JOBMTL0.PRCDE9 = JOBSCD0.PRCDD4) AND (JOBMTL0.CRCDE9 = JOBSCD0.CRCDD4) AND (JOBMTL0.OPSQE9 = JOBSCD0.SQNOD4)
			LEFT JOIN S1077DBF.VPSFILES.MTLAVL0 AS MTLAVL0 ON  (JOBMTL0.CONOE9 = MTLAVL0.CONOF1) 
			AND (JOBMTL0.MTCDE9 = MTLAVL0.MTCDF1) AND (JOBMTL0.MTCRE9 = MTLAVL0.CRCDF1) 
			JOIN S1077DBF.VPSFILES.MTRLMS0 AS MTRLMS0 ON (MTLAVL0.CONOF1 = MTRLMS0.CONO3R) 
			AND (MTLAVL0.MTCDF1 = MTRLMS0.MTCD3R) 
			WHERE (JOBMTL0.CONOE9 = 2) AND  (JOBMTL0.MTCDE9 = '#qCostSheet.MTCDE3#') AND (JOBMTL0.MTCRE9 = '#qCostSheet.MTCRE3#')
			GROUP BY JOBMTL0.MTCDE9, JOBMTL0.MTCRE9, MTRLMS0.CLCD3R
    	        </cfquery>
   	         
				<!--- if we have don't have fabric in stock --->
                <cfif (qFabricAvailability.ONHAND - (qFabricAvailability.REQUIREMENTS + fabricRequirement)) LT 0> 
					
                    <!--- check if we have open POs --->					                
                    <cfif qFabricAvailability.AVAILABLE - fabricRequirement GT 0>
                    	<cfquery name="qPO" datasource="AS400">
                            SELECT DATE(SUBSTR(VARCHAR(MAX(DUDTH0)),1,4) ||'-'||  SUBSTR(VARCHAR(MAX(DUDTH0)),5,2)  ||'-'|| SUBSTR(VARCHAR(MAX(DUDTH0)),7,2)) AS PODATE
                            FROM VPSFILES.PORDTL0 AS PORDTL0 
                            WHERE (CONOH0 = 2) AND (MTCDH0 = '#qCostSheet.MTCDE3#') AND (CRCDH0 = '#qCostSheet.MTCRE3#')
                        </cfquery>
                        
                        <cfset days = DateDiff("d", #qPO.PODATE#,#qOpenImportCuts.ISSUEDATE#)>
                        <cfset variables.structVar.diffDays = #days#/>
                        <cfif days GT leadDays>
                        	<cfset leadDays = days/>
                        </cfif>
                    </cfif>
                 <!--- if there is no fabric available compute the fabric material ordering lead day --->               	
                <cfelse>
					<cfif qCostSheet.DYLT3R GT leadDays>
                    	<cfset leadDays = qCostSheet.DYLT3R/>
					</cfif>                
                </cfif>
			<!--- if we dont have the fabric in stock compute the lead time for the fabric and add it to the lead time--->
                	
                </cfloop>				
           <cfelse>          
           		<!--- no cost sheet in company 2!!--->           
           </cfif>
			
             <cfset variables.structVar.leadDays=#leadDays#/>
             

        </cfloop>
        <!--- save the lead time in as400 --->
        
        
	</cffunction>    

	<cffunction name="updateContractorInformationInCutSummary" returntype="string" output="no" access="public">
    
    	<cfquery name="qJobSummary" datasource="as400">
        		SELECT JBNO8Q 
                FROM VPSFILES.JOBSUM0 AS JOBSUM0 
                WHERE (ASCN8Q = 0) AND (CONO8Q = 1) AND (PDTP8Q = 'IMP') 
                AND (DUDT8Q >= 20091201)
        </cfquery>
        
        
        <cfloop query="qJobSummary">
        	
            <cfquery name="qJobSchedule" datasource="as400">
	            SELECT CTNOD4 
                FROM VPSFILES.JOBSCD0 AS JOBSCD0 
                WHERE (JBNOD4 = #qJobSummary.JBNO8Q#) 
                AND (CONOD4 = 1) AND (OPCDD4 = 'ISS')
            </cfquery>

			  <!--- if there is a contractor number update the job summary --->      
            <cfif qJobSchedule.RECORDCOUNT NEQ 0 AND qJobSchedule.CTNOD4 NEQ 0>  
            
                <cfquery datasource="as400">
    				UPDATE VPSFILES.JOBSUM0 
                    SET ASCN8Q = #qJobSchedule.CTNOD4#
                    WHERE (CONO8Q = 1) AND (JBNO8Q = #qJobSummary.JBNO8Q#)
                </cfquery>
                
        	</cfif>
        
        </cfloop>
        
    </cffunction>

	<!--- this is the actual function who will be entering the rows in AS400 --->
	<cffunction name="insertRowIntoSelling" returntype="void" output="no" access="public">
    	<cfargument name="Selling" required="yes">
        
        <!--- convert empty strings to 0 --->
        <cfset Selling.SHIPPED = NumberFormat( Selling.SHIPPED, "0")>
        <cfset Selling.OPEN = NumberFormat( Selling.OPEN, "0")>
        <cfset Selling.EOH = NumberFormat( Selling.EOH, "0")>
    
    	<cfif Selling.SHIPPED EQ 0>
        	<!--- if the shipped amount is zero then all this should be zero --->
        	<cfset Selling.WTD = 0>
        	<cfset Selling.WKONHAND = 0>
        	<cfset Selling.WKSELLTHRU = 0>
            <cfset Selling.STD = 0>	        
        	<cfset Selling.SHIPPED = 0>
            <cfset Selling.STDSELLTHRU = 0>
        <cfelse>
        	<cfif Selling.EOH EQ 0>
	            <!--- if EOH is not specified set it the same value as SHIPPED to avoid division by zero error --->
				<cfset Selling.EOH = Selling.SHIPPED>	                               
            </cfif>    
            <!--- STD computation --->
			<cfset Selling.STD = Selling.SHIPPED - Selling.EOH>	        
            <!--- computer sell thru information here --->
            <cfset Selling.STDSELLTHRU = Selling.STD/Selling.SHIPPED>            
            
			<!--- set WKONHAND variable --->
            <cfset Selling.WKONHAND = Selling.WTD + Selling.EOH>
            
            <!--- check if WKONHAND is equals to zero to avoid zero by division error when computing WKSELLTHRU --->
			<cfif Selling.WKONHAND NEQ 0>
                <cfset Selling.WKSELLTHRU = Selling.WTD/Selling.WKONHAND>
            <cfelse>    
                <cfset Selling.WKSELLTHRU = 0>
            </cfif>    
            
        </cfif>

		<!--- check for OPEN orders set to zero if there's none --->
    	<cfif Selling.OPEN EQ 0>
        	<cfset Selling.OPEN = 0>
        </cfif>                
      
        <!--- check for OPEN orders and SHIPPED to infput the correct comment --->
        <cfif Selling.OPEN EQ 0 AND Selling.SHIPPED EQ 0>
        	<cfset Selling.COMMENT = 'NOT ORDERED'>
        <cfelse>
        	<cfset Selling.COMMENT = 'ORDERED'>            
        </cfif>
      
        <cfquery datasource="as400">	                    
            INSERT INTO VIEWS.SELLING 
            VALUES (#Selling.CSNO#, '#Selling.CUSTOMER#', '#Selling.TYPE#', #Selling.WTD#, #Selling.WKONHAND#, #Selling.WKSELLTHRU#, #Selling.STD#, #Selling.SHIPPED#, #Selling.STDSELLTHRU#, #Selling.OPEN#, '#Selling.STYLE#', '#Selling.COLOR#', '#Selling.COMMENT#')
        </cfquery>
    
    </cffunction>

	<!--- this will create the selling report based on the order type REP --->
	<cffunction name="createSellingTable" returntype="void" output="no" access="public">
    
    	<!--- first delete all the information in the selling table --->
        <cfquery datasource="as400">
        	DELETE FROM VIEWS.SELLING    
        </cfquery>
        
    
    	<cfquery name="qWeeklyOrderReport" datasource="as400">
        		SELECT ORDDTL0.CSNO4E, ORDDTL0.CSSN4E, ORDDTL0.SHNO4E, 
                ORDDTL0.PRCD4E, ORDDTL0.CRCD4E, ORDDTL0.UNIT4E,  ORDDTL0.EDSP4E 
                FROM VPSFILES.ORDDTL0 AS ORDDTL0, VPSFILES.ORDHDR0 AS ORDHDR0 
                WHERE (ORDDTL0.CONO4E = ORDHDR0.CONO2Y) AND (ORDHDR0.ORNO2Y = ORDDTL0.ORNO4E) 
                AND (ORDHDR0.CONO2Y = 1) AND (ORDHDR0.ORTP2Y = 'REP')
        </cfquery>
        
        
        <cfloop query="qWeeklyOrderReport">
        
        	<!--- loop to check each customer information in the system to process it further --->	
            <!--- if it's nordstrom check if it's direct or store --->
			<!--- BEGIN nordstrom condition --->            
            <cfif qWeeklyOrderReport.CSNO4E EQ 3>
				<!--- check the ship to information is it direct or regular --->
                <cfif qWeeklyOrderReport.SHNO4E EQ 808>
                
                	
                	<!--- check nordstrom direct open orders --->
                    <cfquery name="qNordstromDirect" datasource="as400">
                    	SELECT SUM(ORDDTL0.UNIT4E) AS OPEN, ORDDTL0.CSNO4E 
                        FROM VPSFILES.ORDDTL0 AS ORDDTL0, VPSFILES.ORDHDR0 AS ORDHDR0 
                        WHERE (ORDDTL0.CONO4E = ORDHDR0.CONO2Y) AND (ORDHDR0.ORNO2Y = ORDDTL0.ORNO4E) 
                        AND (ORDHDR0.CONO2Y = 1) AND (ORDHDR0.ORTP2Y <> 'REP') AND (ORDDTL0.PRCD4E = '#qWeeklyOrderReport.PRCD4E#') 
                        AND (ORDDTL0.CSNO4E = #qWeeklyOrderReport.CSNO4E#) 
                        AND (ORDDTL0.LNST4E <> 'C') AND (ORDDTL0.SHNO4E = 808)  
                        GROUP BY ORDDTL0.CSNO4E                    
                    </cfquery>
                    
                    
					<!--- check nordstrom direct shipped orders --->
                    <cfquery name="qNordstromDirectShipped" datasource="as400">
	                    SELECT SUM(INVDTL0.UNIT5Z) AS SHIPPED, INVDTL0.CSNO5Z 
                        FROM VPSFILES.INVDTL0 AS INVDTL0, VPSFILES.INVHDR0 AS INVHDR0 
                        WHERE (INVDTL0.CONO5Z = INVHDR0.CONO6A) AND (INVDTL0.INNO5Z = INVHDR0.INNO6A) AND (INVDTL0.CONO5Z = 1) 
                        AND (INVHDR0.INTS6A NOT IN ('C','R')) AND (INVDTL0.PRCD5Z = '#qWeeklyOrderReport.PRCD4E#') 
                        AND (INVDTL0.CSNO5Z = #qWeeklyOrderReport.CSNO4E#) AND (INVHDR0.SHNO6A = 808) 
                        GROUP BY INVDTL0.CSNO5Z
                    </cfquery>

                    <!--- set variables --->
                    <cfset Selling = StructNew()>
                    <cfset Selling.CSNO = #qWeeklyOrderReport.CSNO4E#>
                    <cfset Selling.CUSTOMER = 'NORDSTROM DIRECT'>
                    <cfset Selling.TYPE = 'ONLINE'>
                    <cfset Selling.WTD =  #qWeeklyOrderReport.UNIT4E#>
                    <cfset Selling.EOH = #qWeeklyOrderReport.EDSP4E#>
	                <cfset Selling.SHIPPED = #qNordstromDirectShipped.SHIPPED# >
                    <cfset Selling.OPEN = #qNordstromDirect.OPEN#>
                    <cfset Selling.STYLE = #qWeeklyOrderReport.PRCD4E#>
                    <cfset Selling.COLOR = 'ASSRT'>
                    
					<!--- invoke the save to database function here --->
                    <cfset insertRowIntoSelling(Selling)/>              
                          
                <!--- it's a regular store if there is no ship to information --->
                <cfelse>
                
                	<!--- query nordstrom order --->
                    <cfquery name="qNordstromStore" datasource="as400">
                    	SELECT SUM(ORDDTL0.UNIT4E) AS OPEN,  ORDDTL0.CSNO4E 
                        FROM VPSFILES.ORDDTL0 AS ORDDTL0, VPSFILES.ORDHDR0 AS ORDHDR0 
                        WHERE (ORDDTL0.CONO4E = ORDHDR0.CONO2Y) AND (ORDHDR0.ORNO2Y = ORDDTL0.ORNO4E) 
                        AND (ORDHDR0.CONO2Y = 1) AND (ORDHDR0.ORTP2Y <> 'REP') AND (ORDDTL0.PRCD4E = '#qWeeklyOrderReport.PRCD4E#') 
                        AND (ORDDTL0.CSNO4E = #qWeeklyOrderReport.CSNO4E#) 
                        AND (ORDDTL0.LNST4E <> 'C') AND (ORDDTL0.SHNO4E <> 808)  
                        GROUP BY ORDDTL0.CSNO4E                    
                    </cfquery>
                    
					<!--- check nordstrom store shipped orders --->
                    <cfquery name="qNordstromStoreShipped" datasource="as400">
	                    SELECT SUM(INVDTL0.UNIT5Z) AS SHIPPED, INVDTL0.CSNO5Z 
                        FROM VPSFILES.INVDTL0 AS INVDTL0, VPSFILES.INVHDR0 AS INVHDR0 
                        WHERE (INVDTL0.CONO5Z = INVHDR0.CONO6A) AND (INVDTL0.INNO5Z = INVHDR0.INNO6A) AND (INVDTL0.CONO5Z = 1) 
                        AND (INVHDR0.INTS6A NOT IN ('C','R')) AND (INVDTL0.PRCD5Z = '#qWeeklyOrderReport.PRCD4E#') 
                        AND (INVDTL0.CSNO5Z = #qWeeklyOrderReport.CSNO4E#)  AND (INVHDR0.SHNO6A <> 808)
                        GROUP BY INVDTL0.CSNO5Z
                    </cfquery>
                    
                    
                    <!--- set variables --->
                    <cfset Selling = StructNew()>
                    <cfset Selling.CSNO = #qWeeklyOrderReport.CSNO4E#>
                    <cfset Selling.CUSTOMER = #qWeeklyOrderReport.CSSN4E#>
                    <cfset Selling.TYPE = 'STORE'>
                    <cfset Selling.WTD =  #qWeeklyOrderReport.UNIT4E#>
                    <cfset Selling.EOH = #qWeeklyOrderReport.EDSP4E#>
	                <cfset Selling.SHIPPED = #qNordstromStoreShipped.SHIPPED# >
                    <cfset Selling.OPEN = #qNordstromStore.OPEN#>
                    <cfset Selling.STYLE = #qWeeklyOrderReport.PRCD4E#>
                    <cfset Selling.COLOR = 'ASSRT'>
                    
					<!--- invoke the save to database function here --->
                    <cfset insertRowIntoSelling(Selling)/>              
                </cfif>
                <!--- END nordstrom condition --->
            <cfelseif qWeeklyOrderReport.CSNO4E EQ 121>
				<!--- BEGIN saks condition --->
				<!--- check to see if the order is online --->
				<cfif qWeeklyOrderReport.SHNO4E EQ 689>
                	
                    <cfquery name="qSaksDirect" datasource="as400">
                    	SELECT SUM(ORDDTL0.UNIT4E) AS OPEN, ORDDTL0.CSNO4E 
                        FROM VPSFILES.ORDDTL0 AS ORDDTL0, VPSFILES.ORDHDR0 AS ORDHDR0 
                        WHERE (ORDDTL0.CONO4E = ORDHDR0.CONO2Y) AND (ORDHDR0.ORNO2Y = ORDDTL0.ORNO4E) 
                        AND (ORDHDR0.CONO2Y = 1) AND (ORDHDR0.ORTP2Y <> 'REP') AND (ORDDTL0.PRCD4E = '#qWeeklyOrderReport.PRCD4E#') 
                        AND (ORDDTL0.CRCD4E = '#qWeeklyOrderReport.CRCD4E#') AND (ORDDTL0.CSNO4E = #qWeeklyOrderReport.CSNO4E#) 
                        AND (ORDDTL0.LNST4E <> 'C') AND (ORDDTL0.SHNO4E = 689)  
                        GROUP BY ORDDTL0.CSNO4E                    
                    </cfquery>
                    
                    
					<!--- check saks direct shipped orders --->
                    <cfquery name="qSaksDirectShipped" datasource="as400">
	                    SELECT SUM(INVDTL0.UNIT5Z) AS SHIPPED, INVDTL0.CSNO5Z 
                        FROM VPSFILES.INVDTL0 AS INVDTL0, VPSFILES.INVHDR0 AS INVHDR0 
                        WHERE (INVDTL0.CONO5Z = INVHDR0.CONO6A) AND (INVDTL0.INNO5Z = INVHDR0.INNO6A) AND (INVDTL0.CONO5Z = 1) 
                        AND (INVHDR0.INTS6A NOT IN ('C','R')) AND (INVDTL0.PRCD5Z = '#qWeeklyOrderReport.PRCD4E#') 
                        AND (INVDTL0.CRCD5Z = '#qWeeklyOrderReport.CRCD4E#') AND (INVDTL0.CSNO5Z = #qWeeklyOrderReport.CSNO4E#) 
                        AND (INVHDR0.SHNO6A = 689)
                        GROUP BY INVDTL0.CSNO5Z
                    </cfquery>
                    
                    <!--- set variables --->
                    <cfset Selling = StructNew()>
                    <cfset Selling.CSNO = #qWeeklyOrderReport.CSNO4E#>
                    <cfset Selling.CUSTOMER = 'SAKS DIRECT'>
                    <cfset Selling.TYPE = 'ONLINE'>
                    <cfset Selling.WTD =  #qWeeklyOrderReport.UNIT4E#>
                    <cfset Selling.EOH = #qWeeklyOrderReport.EDSP4E#>
	                <cfset Selling.SHIPPED = #qSaksDirectShipped.SHIPPED# >
                    <cfset Selling.OPEN = #qSaksDirect.OPEN#>
                    <cfset Selling.STYLE = #qWeeklyOrderReport.PRCD4E#>
                    <cfset Selling.COLOR = #qWeeklyOrderReport.CRCD4E#>
                    
					<!--- invoke the save to database function here --->
                    <cfset insertRowIntoSelling(Selling)/>              
                    
                <!--- it's a regular store if there is no ship to information --->
				<cfelse>

                    <cfquery name="qSaksStore" datasource="as400">
                    	SELECT SUM(ORDDTL0.UNIT4E) AS OPEN, SUM(ORDDTL0.TLCO4E) AS SHIPPED, ORDDTL0.CSNO4E 
                        FROM VPSFILES.ORDDTL0 AS ORDDTL0, VPSFILES.ORDHDR0 AS ORDHDR0 
                        WHERE (ORDDTL0.CONO4E = ORDHDR0.CONO2Y) AND (ORDHDR0.ORNO2Y = ORDDTL0.ORNO4E) 
                        AND (ORDHDR0.CONO2Y = 1) AND (ORDHDR0.ORTP2Y <> 'REP') AND (ORDDTL0.PRCD4E = '#qWeeklyOrderReport.PRCD4E#') 
                        AND (ORDDTL0.CRCD4E = '#qWeeklyOrderReport.CRCD4E#') AND (ORDDTL0.CSNO4E = #qWeeklyOrderReport.CSNO4E#) 
                        AND (ORDDTL0.LNST4E <> 'C') AND (ORDDTL0.SHNO4E <> 689)  
                        GROUP BY ORDDTL0.CSNO4E                    
                    </cfquery>

					<!--- check saks direct shipped orders --->
                    <cfquery name="qSaksStoreShipped" datasource="as400">
	                    SELECT SUM(INVDTL0.UNIT5Z) AS SHIPPED, INVDTL0.CSNO5Z 
                        FROM VPSFILES.INVDTL0 AS INVDTL0, VPSFILES.INVHDR0 AS INVHDR0 
                        WHERE (INVDTL0.CONO5Z = INVHDR0.CONO6A) AND (INVDTL0.INNO5Z = INVHDR0.INNO6A) AND (INVDTL0.CONO5Z = 1) 
                        AND (INVHDR0.INTS6A NOT IN ('C','R')) AND (INVDTL0.PRCD5Z = '#qWeeklyOrderReport.PRCD4E#') 
                        AND (INVDTL0.CRCD5Z = '#qWeeklyOrderReport.CRCD4E#') AND (INVDTL0.CSNO5Z = #qWeeklyOrderReport.CSNO4E#) 
                        AND (INVHDR0.SHNO6A <> 689)
                        GROUP BY INVDTL0.CSNO5Z
                    </cfquery>
                                        
                    <!--- set variables --->
                    <cfset Selling = StructNew()>
                    <cfset Selling.CSNO = #qWeeklyOrderReport.CSNO4E#>
                    <cfset Selling.CUSTOMER = #qWeeklyOrderReport.CSSN4E#>
                    <cfset Selling.TYPE = 'STORE'>
                    <cfset Selling.WTD =  #qWeeklyOrderReport.UNIT4E#>
                    <cfset Selling.EOH = #qWeeklyOrderReport.EDSP4E#>
	                <cfset Selling.SHIPPED = #qSaksStoreShipped.SHIPPED# >
                    <cfset Selling.OPEN = #qSaksStore.OPEN#>
                    <cfset Selling.STYLE = #qWeeklyOrderReport.PRCD4E#>
                    <cfset Selling.COLOR = #qWeeklyOrderReport.CRCD4E#>
                    
					<!--- invoke the save to database function here --->
                    <cfset insertRowIntoSelling(Selling)/>              
                    				
				</cfif>
				<!--- END saks condition --->
             
             <!--- for the other  --->
             <cfelse>
                
                <cfquery name="qOtherMajors" datasource="as400">
                    SELECT SUM(ORDDTL0.UNIT4E) AS OPEN, ORDDTL0.CSNO4E 
                    FROM VPSFILES.ORDDTL0 AS ORDDTL0, VPSFILES.ORDHDR0 AS ORDHDR0 
                    WHERE (ORDDTL0.CONO4E = ORDHDR0.CONO2Y) AND (ORDHDR0.ORNO2Y = ORDDTL0.ORNO4E) 
                    AND (ORDHDR0.CONO2Y = 1) AND (ORDHDR0.ORTP2Y <> 'REP') AND (ORDDTL0.PRCD4E = '#qWeeklyOrderReport.PRCD4E#') 
                    AND (ORDDTL0.CRCD4E = '#qWeeklyOrderReport.CRCD4E#') AND (ORDDTL0.CSNO4E = #qWeeklyOrderReport.CSNO4E#) 
                    AND (ORDDTL0.LNST4E <> 'C')   
                    GROUP BY ORDDTL0.CSNO4E                    
                </cfquery>
                
                
				<!--- check other major stores shipped orders --->
                <cfquery name="qOtherMajorsShipped" datasource="as400">
                    SELECT SUM(INVDTL0.UNIT5Z) AS SHIPPED, INVDTL0.CSNO5Z 
                    FROM VPSFILES.INVDTL0 AS INVDTL0, VPSFILES.INVHDR0 AS INVHDR0 
                    WHERE (INVDTL0.CONO5Z = INVHDR0.CONO6A) AND (INVDTL0.INNO5Z = INVHDR0.INNO6A) AND (INVDTL0.CONO5Z = 1) 
                    AND (INVHDR0.INTS6A NOT IN ('C','R')) AND (INVDTL0.PRCD5Z = '#qWeeklyOrderReport.PRCD4E#') 
                    AND (INVDTL0.CRCD5Z = '#qWeeklyOrderReport.CRCD4E#') AND (INVDTL0.CSNO5Z = #qWeeklyOrderReport.CSNO4E#) 
                    GROUP BY INVDTL0.CSNO5Z
                </cfquery>                
                
				<!--- set variables --->
                <cfset Selling = StructNew()>
                <cfset Selling.CSNO = #qWeeklyOrderReport.CSNO4E#>
                <cfset Selling.CUSTOMER = #qWeeklyOrderReport.CSSN4E#>
                <cfset Selling.TYPE = 'STORE'>
                <cfset Selling.WTD =  #qWeeklyOrderReport.UNIT4E#>
                <cfset Selling.EOH = #qWeeklyOrderReport.EDSP4E#>
                <cfset Selling.SHIPPED = #qOtherMajorsShipped.SHIPPED# >
                <cfset Selling.OPEN = #qOtherMajors.OPEN#>
                <cfset Selling.STYLE = #qWeeklyOrderReport.PRCD4E#>
                <cfset Selling.COLOR = #qWeeklyOrderReport.CRCD4E#>
                
                <!--- invoke the save to database function here --->
                <cfset insertRowIntoSelling(Selling)/>        
                                      
        	</cfif>
            
        </cfloop>
        <!--- END qWeeklyOrderReport loop --->
    </cffunction>
    
	<!--- this will add to the selling table the styles that wasn't on the other major stores to balance it out --->
	<cffunction name="createNordstromSellingCheck" returntype="void" output="no" access="public">
		
        <!--- query all the style in the weekly report that's not in Nordstrom --->
        <cfquery name="qNoNordstromStyles" datasource="as400">
			SELECT DISTINCT ORDDTL0.PRCD4E FROM VPSFILES.ORDDTL0 AS ORDDTL0, VPSFILES.ORDHDR0 AS ORDHDR0 
            WHERE (ORDDTL0.CONO4E = ORDHDR0.CONO2Y) AND (ORDHDR0.ORNO2Y = ORDDTL0.ORNO4E) 
            AND (ORDHDR0.CONO2Y = 1) AND (ORDHDR0.ORTP2Y = 'REP') 
		    AND ORDDTL0.PRCD4E NOT IN (SELECT DISTINCT ORDDTL0.PRCD4E FROM VPSFILES.ORDDTL0 AS ORDDTL0, VPSFILES.ORDHDR0 AS ORDHDR0 
            WHERE (ORDDTL0.CONO4E = ORDHDR0.CONO2Y) AND (ORDHDR0.ORNO2Y = ORDDTL0.ORNO4E) 
            AND (ORDHDR0.CONO2Y = 1) AND (ORDHDR0.ORTP2Y = 'REP') AND (ORDDTL0.CSNO4E = 3)) 
        </cfquery>
    
    	<!--- query nordstrom account information for the nodrstom name to be inserted in the selling table --->
    	<cfquery name="qNordstromCustomerInfo" datasource="as400">
	        SELECT  SHNM2S FROM VPSFILES.CUSTMS0 AS CUSTMS0 WHERE (CSNO2S = 3) AND (CONO2S = 1)
        </cfquery>
        
    	<cfloop query="qNoNordstromStyles">
        
        	<!--- check Nordstrom Direct First --->
             <cfquery name="qNordstromDirect" datasource="as400">
                SELECT SUM(ORDDTL0.UNIT4E) AS OPEN, ORDDTL0.CSNO4E 
                FROM VPSFILES.ORDDTL0 AS ORDDTL0, VPSFILES.ORDHDR0 AS ORDHDR0 
                WHERE (ORDDTL0.CONO4E = ORDHDR0.CONO2Y) AND (ORDHDR0.ORNO2Y = ORDDTL0.ORNO4E) 
                AND (ORDHDR0.CONO2Y = 1) AND (ORDHDR0.ORTP2Y <> 'REP') AND (ORDDTL0.PRCD4E = '#qNoNordstromStyles.PRCD4E#') 
                AND (ORDDTL0.CSNO4E = 3) 
                AND (ORDDTL0.LNST4E <> 'C') AND (ORDDTL0.SHNO4E = 808)  
                GROUP BY ORDDTL0.CSNO4E                    
            </cfquery>
            
            
			<!--- check Nordstrom Direct shipped orders --->
            <cfquery name="qNordstromDirectShipped" datasource="as400">
                SELECT SUM(INVDTL0.UNIT5Z) AS SHIPPED, INVDTL0.CSNO5Z 
                FROM VPSFILES.INVDTL0 AS INVDTL0, VPSFILES.INVHDR0 AS INVHDR0 
                WHERE (INVDTL0.CONO5Z = INVHDR0.CONO6A) AND (INVDTL0.INNO5Z = INVHDR0.INNO6A) AND (INVDTL0.CONO5Z = 1) 
                AND (INVHDR0.INTS6A NOT IN ('C','R')) AND (INVDTL0.PRCD5Z = '#qNoNordstromStyles.PRCD4E#') 
                AND (INVDTL0.CSNO5Z = 3) AND (INVHDR0.SHNO6A = 808)
                GROUP BY INVDTL0.CSNO5Z
            </cfquery>                

           
			<!--- set variables --->
            <cfset Selling = StructNew()>
            <cfset Selling.CSNO = 3>
            <cfset Selling.CUSTOMER = 'NORDSTROM DIRECT'>
            <cfset Selling.TYPE = 'ONLINE'>
            <cfset Selling.WTD =  0>
            <cfset Selling.EOH = 0>
            <cfset Selling.SHIPPED = #qNordstromDirectShipped.SHIPPED# >
            <cfset Selling.OPEN = #qNordstromDirect.OPEN#>
            <cfset Selling.STYLE = #qNoNordstromStyles.PRCD4E#>
            <cfset Selling.COLOR = 'ASSRT'>
            
            <!--- invoke the save to database function here --->
            <cfset insertRowIntoSelling(Selling)/>        

        	<!--- check Nordstrom Store Second --->
             <cfquery name="qNordstromStore" datasource="as400">
                SELECT SUM(ORDDTL0.UNIT4E) AS OPEN, SUM(ORDDTL0.TLCO4E) AS SHIPPED, ORDDTL0.CSNO4E 
                FROM VPSFILES.ORDDTL0 AS ORDDTL0, VPSFILES.ORDHDR0 AS ORDHDR0 
                WHERE (ORDDTL0.CONO4E = ORDHDR0.CONO2Y) AND (ORDHDR0.ORNO2Y = ORDDTL0.ORNO4E) 
                AND (ORDHDR0.CONO2Y = 1) AND (ORDHDR0.ORTP2Y <> 'REP') AND (ORDDTL0.PRCD4E = '#qNoNordstromStyles.PRCD4E#') 
                AND (ORDDTL0.CSNO4E = 3) 
                AND (ORDDTL0.LNST4E <> 'C') AND (ORDDTL0.SHNO4E <> 808)  
                GROUP BY ORDDTL0.CSNO4E                    
            </cfquery>
            
			<!--- check Nordstrom Store shipped orders --->
            <cfquery name="qNordstromStoreShipped" datasource="as400">
                SELECT SUM(INVDTL0.UNIT5Z) AS SHIPPED, INVDTL0.CSNO5Z 
                FROM VPSFILES.INVDTL0 AS INVDTL0, VPSFILES.INVHDR0 AS INVHDR0 
                WHERE (INVDTL0.CONO5Z = INVHDR0.CONO6A) AND (INVDTL0.INNO5Z = INVHDR0.INNO6A) AND (INVDTL0.CONO5Z = 1) 
                AND (INVHDR0.INTS6A NOT IN ('C','R')) AND (INVDTL0.PRCD5Z = '#qNoNordstromStyles.PRCD4E#') 
                AND (INVDTL0.CSNO5Z = 3) AND (INVHDR0.SHNO6A <> 808)
                GROUP BY INVDTL0.CSNO5Z
            </cfquery>                
            
			<!--- set variables --->
            <cfset Selling = StructNew()>
            <cfset Selling.CSNO = 3>
            <cfset Selling.CUSTOMER = #qNordstromCustomerInfo.SHNM2S#>
            <cfset Selling.TYPE = 'STORE'>
            <cfset Selling.WTD =  0>
            <cfset Selling.EOH = 0>
            <cfset Selling.SHIPPED = #qNordstromStoreShipped.SHIPPED# >
            <cfset Selling.OPEN = #qNordstromStore.OPEN#>
            <cfset Selling.STYLE = #qNoNordstromStyles.PRCD4E#>
            <cfset Selling.COLOR = 'ASSRT'>
            
            <!--- invoke the save to database function here --->
            <cfset insertRowIntoSelling(Selling)/>        

        </cfloop>
        
        
    </cffunction>



	<!--- this will add to the selling table the styles that wasn't on Saks weekly selling report to balance it out --->
	<cffunction name="createSaksSellingCheck" returntype="void" output="no" access="public">

        <!--- query all the style in the weekly report that's not in Saks --->
        <cfquery name="qNoSaksStyles" datasource="as400">
			SELECT DISTINCT ORDDTL0.PRCD4E FROM VPSFILES.ORDDTL0 AS ORDDTL0, VPSFILES.ORDHDR0 AS ORDHDR0 
            WHERE (ORDDTL0.CONO4E = ORDHDR0.CONO2Y) AND (ORDHDR0.ORNO2Y = ORDDTL0.ORNO4E) 
            AND (ORDHDR0.CONO2Y = 1) AND (ORDHDR0.ORTP2Y = 'REP') 
		    AND ORDDTL0.PRCD4E NOT IN (SELECT DISTINCT ORDDTL0.PRCD4E FROM VPSFILES.ORDDTL0 AS ORDDTL0, VPSFILES.ORDHDR0 AS ORDHDR0 
            WHERE (ORDDTL0.CONO4E = ORDHDR0.CONO2Y) AND (ORDHDR0.ORNO2Y = ORDDTL0.ORNO4E) 
            AND (ORDHDR0.CONO2Y = 1) AND (ORDHDR0.ORTP2Y = 'REP') AND (ORDDTL0.CSNO4E = 121)) 
        </cfquery>
    
    	<!--- query saks account information for the nodrstom name to be inserted in the selling table --->
    	<cfquery name="qSaksCustomerInfo" datasource="as400">
	        SELECT  SHNM2S FROM VPSFILES.CUSTMS0 AS CUSTMS0 WHERE (CSNO2S = 121) AND (CONO2S = 1)
        </cfquery>
    
    	<!--- Query the database for all orders against saks and saks direct for that style --->
        <cfloop query="qNoSaksStyles">
        	
            <!--- do saks direct first --->
             <cfquery name="qSaksDirect" datasource="as400">
                SELECT SUM(ORDDTL0.UNIT4E) AS OPEN, ORDDTL0.CRCD4E  
                FROM VPSFILES.ORDDTL0 AS ORDDTL0, VPSFILES.ORDHDR0 AS ORDHDR0 
                WHERE (ORDDTL0.CONO4E = ORDHDR0.CONO2Y) AND (ORDHDR0.ORNO2Y = ORDDTL0.ORNO4E) 
                AND (ORDHDR0.CONO2Y = 1) AND (ORDHDR0.ORTP2Y <> 'REP') AND (ORDDTL0.PRCD4E = '#qNoSaksStyles.PRCD4E#') 
                AND (ORDDTL0.CSNO4E = 121) 
                AND (ORDDTL0.LNST4E <> 'C') AND (ORDDTL0.SHNO4E = 689)  
                GROUP BY ORDDTL0.CRCD4E                     
            </cfquery>
            
            <!--- If there is loop over it to check the shipped and ordered style information by style and color enter in the selling table --->
            <cfif qSaksDirect.RECORDCOUNT GT 0>
  
                <!--- do saks Store shipped orders --->
                <cfquery name="qSaksDirectShipped" datasource="as400">
                    SELECT SUM(INVDTL0.UNIT5Z) AS SHIPPED, INVDTL0.CSNO5Z 
                    FROM VPSFILES.INVDTL0 AS INVDTL0, VPSFILES.INVHDR0 AS INVHDR0 
                    WHERE (INVDTL0.CONO5Z = INVHDR0.CONO6A) AND (INVDTL0.INNO5Z = INVHDR0.INNO6A) AND (INVDTL0.CONO5Z = 1) 
                    AND (INVHDR0.INTS6A NOT IN ('C','R')) AND (INVDTL0.PRCD5Z = '#qNoSaksStyles.PRCD4E#') 
                    AND (INVDTL0.CRCD5Z = '#qSaksDirect.CRCD4E#') AND (INVDTL0.CSNO5Z = 121) AND (INVHDR0.SHNO6A = 689)
                    GROUP BY INVDTL0.CSNO5Z
                </cfquery>                
            
                <cfloop query="qSaksDirect">

					<!--- set variables --->
                    <cfset Selling = StructNew()>
                    <cfset Selling.CSNO = 121>
                    <cfset Selling.CUSTOMER = 'SAKS DIRECT'>
                    <cfset Selling.TYPE = 'ONLINE'>
                    <cfset Selling.WTD =  0>
                    <cfset Selling.EOH = 0>
                    <cfset Selling.SHIPPED = #qSaksDirectShipped.SHIPPED# >
                    <cfset Selling.OPEN = #qSaksDirect.OPEN#>
                    <cfset Selling.STYLE = #qNoSaksStyles.PRCD4E#>
                    <cfset Selling.COLOR = #qSaksDirect.CRCD4E#>
                    
                    <!--- invoke the save to database function here --->
                    <cfset insertRowIntoSelling(Selling)/>                        	
                
                </cfloop>
                
           <cfelse>  
               <!--- If there is no result create a zero information in the selling table --->
                    <cfset Selling = StructNew()>
                    <cfset Selling.CSNO = 121>
                    <cfset Selling.CUSTOMER = 'SAKS DIRECT'>
                    <cfset Selling.TYPE = 'ONLINE'>
                    <cfset Selling.WTD =  0>
                    <cfset Selling.EOH = 0>
                    <cfset Selling.SHIPPED = 0>
                    <cfset Selling.OPEN = 0>
                    <cfset Selling.STYLE = #qNoSaksStyles.PRCD4E#>
                    <cfset Selling.COLOR = 'ASSRT'>                
                    
                    <!--- invoke the save to database function here --->
                    <cfset insertRowIntoSelling(Selling)/>                        	
           </cfif>
           


            <!--- do saks store next --->
             <cfquery name="qSaksStore" datasource="as400">
                SELECT SUM(ORDDTL0.UNIT4E) AS OPEN, SUM(ORDDTL0.TLCO4E) AS SHIPPED, ORDDTL0.CRCD4E  
                FROM VPSFILES.ORDDTL0 AS ORDDTL0, VPSFILES.ORDHDR0 AS ORDHDR0 
                WHERE (ORDDTL0.CONO4E = ORDHDR0.CONO2Y) AND (ORDHDR0.ORNO2Y = ORDDTL0.ORNO4E) 
                AND (ORDHDR0.CONO2Y = 1) AND (ORDHDR0.ORTP2Y <> 'REP') AND (ORDDTL0.PRCD4E = '#qNoSaksStyles.PRCD4E#') 
                AND (ORDDTL0.CSNO4E = 121) 
                AND (ORDDTL0.LNST4E <> 'C') AND (ORDDTL0.SHNO4E <> 689)  
                GROUP BY ORDDTL0.CRCD4E                     
            </cfquery>
            
            <!--- If there is loop over it to check the shipped and ordered style information by style and color enter in the selling table --->
            <cfif qSaksStore.RECORDCOUNT GT 0>
            
                <cfloop query="qSaksStore">
                
					<!--- do saks Store shipped orders --->
                    <cfquery name="qSaksStoreShipped" datasource="as400">
                        SELECT SUM(INVDTL0.UNIT5Z) AS SHIPPED, INVDTL0.CSNO5Z 
                        FROM VPSFILES.INVDTL0 AS INVDTL0, VPSFILES.INVHDR0 AS INVHDR0 
                        WHERE (INVDTL0.CONO5Z = INVHDR0.CONO6A) AND (INVDTL0.INNO5Z = INVHDR0.INNO6A) AND (INVDTL0.CONO5Z = 1) 
                        AND (INVHDR0.INTS6A NOT IN ('C','R')) AND (INVDTL0.PRCD5Z = '#qNoSaksStyles.PRCD4E#') 
                        AND (INVDTL0.CRCD5Z = '#qSaksStore.CRCD4E#') AND (INVDTL0.CSNO5Z = 121) AND (INVHDR0.SHNO6A <> 689)
                        GROUP BY INVDTL0.CSNO5Z
                    </cfquery>                
                

					<!--- set variables --->
                    <cfset Selling = StructNew()>
                    <cfset Selling.CSNO = 121>
                    <cfset Selling.CUSTOMER = #qSaksCustomerInfo.SHNM2S#>
                    <cfset Selling.TYPE = 'STORE'>
                    <cfset Selling.WTD =  0>
                    <cfset Selling.EOH = 0>
                    <cfset Selling.SHIPPED = #qSaksStoreShipped.SHIPPED# >
                    <cfset Selling.OPEN = #qSaksStore.OPEN#>
                    <cfset Selling.STYLE = #qNoSaksStyles.PRCD4E#>
                    <cfset Selling.COLOR = #qSaksStore.CRCD4E#>
                    
                    <!--- invoke the save to database function here --->
                    <cfset insertRowIntoSelling(Selling)/>                        	
                
                </cfloop>
                
           <cfelse>  
               <!--- If there is no result create a zero information in the selling table --->
                    <cfset Selling = StructNew()>
                    <cfset Selling.CSNO = 121>
                    <cfset Selling.CUSTOMER = #qSaksCustomerInfo.SHNM2S#>
                    <cfset Selling.TYPE = 'STORE'>
                    <cfset Selling.WTD =  0>
                    <cfset Selling.EOH = 0>
                    <cfset Selling.SHIPPED = 0>
                    <cfset Selling.OPEN = 0>
                    <cfset Selling.STYLE = #qNoSaksStyles.PRCD4E#>
                    <cfset Selling.COLOR = 'ASSRT'>                
                    
                    <!--- invoke the save to database function here --->
                    <cfset insertRowIntoSelling(Selling)/>                        	
           </cfif>
        
        </cfloop>
        
    </cffunction>




	<!--- this will add to the selling table the styles that wasn't on other Major Stores except Saks and Nordstrom  --->
	<cffunction name="createOtherMajorsSellingCheck" returntype="void" output="no" access="public">

		<!--- query all major stores account first in the weekly selling report group --->
        <cfquery name="qOtherMajorStores" datasource="as400">
			SELECT DISTINCT ORDDTL0.CSNO4E, ORDDTL0.CSSN4E  
            FROM VPSFILES.ORDDTL0 AS ORDDTL0, VPSFILES.ORDHDR0 AS ORDHDR0 
            WHERE (ORDDTL0.CONO4E = ORDHDR0.CONO2Y) AND (ORDHDR0.ORNO2Y = ORDDTL0.ORNO4E) 
            AND (ORDHDR0.CONO2Y = 1) AND (ORDHDR0.ORTP2Y = 'REP') AND (ORDDTL0.CSNO4E NOT IN (3,121))
        </cfquery>
	
    	<cfloop query="qOtherMajorStores">
	
			<!--- query all the style in the weekly report that's not in the other major stores --->
            <cfquery name="qNoOtherMajorsStyles" datasource="as400">
                SELECT DISTINCT ORDDTL0.PRCD4E FROM VPSFILES.ORDDTL0 AS ORDDTL0, VPSFILES.ORDHDR0 AS ORDHDR0 
                WHERE (ORDDTL0.CONO4E = ORDHDR0.CONO2Y) AND (ORDHDR0.ORNO2Y = ORDDTL0.ORNO4E) 
                AND (ORDHDR0.CONO2Y = 1) AND (ORDHDR0.ORTP2Y = 'REP') 
                AND ORDDTL0.PRCD4E NOT IN (SELECT DISTINCT ORDDTL0.PRCD4E FROM VPSFILES.ORDDTL0 AS ORDDTL0, VPSFILES.ORDHDR0 AS ORDHDR0 
                WHERE (ORDDTL0.CONO4E = ORDHDR0.CONO2Y) AND (ORDHDR0.ORNO2Y = ORDDTL0.ORNO4E) 
                AND (ORDHDR0.CONO2Y = 1) AND (ORDHDR0.ORTP2Y = 'REP') AND (ORDDTL0.CSNO4E = #qOtherMajorStores.CSNO4E#)) 
            </cfquery>
        
            <!--- Query the database for all orders against all major stores except saks and nordstrom for that style --->
            <cfloop query="qNoOtherMajorsStyles">
                
                 <cfquery name="qOtherMajors" datasource="as400">
                    SELECT SUM(ORDDTL0.UNIT4E) AS OPEN, SUM(ORDDTL0.TLCO4E) AS SHIPPED, ORDDTL0.CRCD4E  
                    FROM VPSFILES.ORDDTL0 AS ORDDTL0, VPSFILES.ORDHDR0 AS ORDHDR0 
                    WHERE (ORDDTL0.CONO4E = ORDHDR0.CONO2Y) AND (ORDHDR0.ORNO2Y = ORDDTL0.ORNO4E) 
                    AND (ORDHDR0.CONO2Y = 1) AND (ORDHDR0.ORTP2Y <> 'REP') AND (ORDDTL0.PRCD4E = '#qNoOtherMajorsStyles.PRCD4E#') 
                    AND (ORDDTL0.CSNO4E = #qOtherMajorStores.CSNO4E#) 
                    AND (ORDDTL0.LNST4E <> 'C') 
                    GROUP BY ORDDTL0.CRCD4E                     
                </cfquery>
                
                <!--- If there is loop over it to check the shipped and ordered style information by style and color enter in the selling table --->
                <cfif qOtherMajors.RECORDCOUNT GT 0>

					<!--- do other major stores shipped orders --->
                    <cfquery name="qOtherMajorsShipped" datasource="as400">
                        SELECT SUM(INVDTL0.UNIT5Z) AS SHIPPED, INVDTL0.CSNO5Z 
                        FROM VPSFILES.INVDTL0 AS INVDTL0, VPSFILES.INVHDR0 AS INVHDR0 
                        WHERE (INVDTL0.CONO5Z = INVHDR0.CONO6A) AND (INVDTL0.INNO5Z = INVHDR0.INNO6A) AND (INVDTL0.CONO5Z = 1) 
                        AND (INVHDR0.INTS6A NOT IN ('C','R')) AND (INVDTL0.PRCD5Z = '#qNoOtherMajorsStyles.PRCD4E#') 
                        AND (INVDTL0.CRCD5Z = '#qOtherMajors.CRCD4E#') AND (INVDTL0.CSNO5Z = #qOtherMajorStores.CSNO4E#) 
                        GROUP BY INVDTL0.CSNO5Z
                    </cfquery>                
                
                    <cfloop query="qOtherMajors">
    
                        <!--- set variables --->
                        <cfset Selling = StructNew()>
                        <cfset Selling.CSNO = #qOtherMajorStores.CSNO4E#>
                        <cfset Selling.CUSTOMER = #qOtherMajorStores.CSSN4E#>
                        <cfset Selling.TYPE = 'STORE'>
                        <cfset Selling.WTD =  0>
                        <cfset Selling.EOH = 0>
                        <cfset Selling.SHIPPED = #qOtherMajorsShipped.SHIPPED# >
                        <cfset Selling.OPEN = #qOtherMajors.OPEN#>
                        <cfset Selling.STYLE = #qNoOtherMajorsStyles.PRCD4E#>
                        <cfset Selling.COLOR = #qOtherMajors.CRCD4E#>
                        
                        <!--- invoke the save to database function here --->
                        <cfset insertRowIntoSelling(Selling)/>                        	
                    
                    </cfloop>
                    
               <cfelse>  
                   <!--- If there is no result create a zero information in the selling table --->
                        <cfset Selling = StructNew()>
                        <cfset Selling.CSNO = #qOtherMajorStores.CSNO4E#>
                        <cfset Selling.CUSTOMER = #qOtherMajorStores.CSSN4E#>
                        <cfset Selling.TYPE = 'STORE'>
                        <cfset Selling.WTD =  0>
                        <cfset Selling.EOH = 0>
                        <cfset Selling.SHIPPED = 0>
                        <cfset Selling.OPEN = 0>
                        <cfset Selling.STYLE = #qNoOtherMajorsStyles.PRCD4E#>
                        <cfset Selling.COLOR = 'ASSRT'>                
                        
                        <!--- invoke the save to database function here --->
                        <cfset insertRowIntoSelling(Selling)/>                        	
               </cfif>
                       
            </cfloop>
        
        </cfloop>
        
    </cffunction>


	<!--- this function will check for other colors if the have reordered a particular style in a different color --->
    <cffunction name="createOtherMajorsSellingColorCheck" returntype="void" output="no" access="public">
    	
		<!--- query all major stores account first in the weekly selling report group --->
        <cfquery name="qOtherMajorStores" datasource="as400">
			SELECT DISTINCT ORDDTL0.CSNO4E, ORDDTL0.CSSN4E, ORDDTL0.PRCD4E 
            FROM VPSFILES.ORDDTL0 AS ORDDTL0, VPSFILES.ORDHDR0 AS ORDHDR0 
            WHERE (ORDDTL0.CONO4E = ORDHDR0.CONO2Y) AND (ORDHDR0.ORNO2Y = ORDDTL0.ORNO4E) 
            AND (ORDHDR0.CONO2Y = 1) AND (ORDHDR0.ORTP2Y = 'REP') AND (ORDDTL0.CSNO4E NOT IN (3,121))
        </cfquery>
        
        <!--- loop and look for style orders that are not in the REP order type but was re ordered in a different color --->
        <cfloop query="qOtherMajorStores">
        	
            
            <!--- select all the colors of this product that's not in the order in the order rep --->
            <cfquery name="qOtherMajorStoreColors" datasource="as400">
            	SELECT DISTINCT ORDDTL0.CRCD4E 
                FROM VPSFILES.ORDDTL0 AS ORDDTL0, VPSFILES.ORDHDR0 AS ORDHDR0 
                WHERE (ORDDTL0.CONO4E = ORDHDR0.CONO2Y) AND (ORDHDR0.ORNO2Y = ORDDTL0.ORNO4E) 
                AND (ORDHDR0.CONO2Y = 1) AND (ORDHDR0.ORTP2Y <> 'REP') 
                AND (ORDDTL0.PRCD4E = '#qOtherMajorStores.PRCD4E#') 
                AND (ORDDTL0.CSNO4E = #qOtherMajorStores.CSNO4E#) 
                AND ORDDTL0.CRCD4E NOT IN (SELECT DISTINCT ORDDTL0.CRCD4E FROM VPSFILES.ORDDTL0 AS ORDDTL0, VPSFILES.ORDHDR0 AS ORDHDR0 
                WHERE (ORDDTL0.CONO4E = ORDHDR0.CONO2Y) AND (ORDHDR0.ORNO2Y = ORDDTL0.ORNO4E) 
                AND (ORDHDR0.CONO2Y = 1) AND (ORDHDR0.ORTP2Y = 'REP') 
                AND (ORDDTL0.PRCD4E = '#qOtherMajorStores.PRCD4E#') 
                AND (ORDDTL0.CSNO4E = #qOtherMajorStores.CSNO4E#)) 
            </cfquery>
                      	
            <cfloop query="qOtherMajorStoreColors">            
                                          
				  <!--- check if there are any open orders --->
                   <cfquery name="qOtherMajorStylesOpen" datasource="as400">
                      SELECT SUM(ORDDTL0.UNIT4E) AS OPEN, ORDDTL0.CRCD4E  
                      FROM VPSFILES.ORDDTL0 AS ORDDTL0, VPSFILES.ORDHDR0 AS ORDHDR0 
                      WHERE (ORDDTL0.CONO4E = ORDHDR0.CONO2Y) AND (ORDHDR0.ORNO2Y = ORDDTL0.ORNO4E) 
                      AND (ORDHDR0.CONO2Y = 1) AND (ORDHDR0.ORTP2Y <> 'REP') 
                      AND (ORDDTL0.PRCD4E = '#qOtherMajorStores.PRCD4E#') AND (ORDDTL0.CRCD4E = '#qOtherMajorStoreColors.CRCD4E#')
                      AND (ORDDTL0.CSNO4E = #qOtherMajorStores.CSNO4E#) 
                      AND (ORDDTL0.LNST4E <> 'C') 
                      GROUP BY ORDDTL0.CRCD4E                     
                  </cfquery>
                  
                  <!--- check if there any shipped orders --->
                  <cfquery name="qOtherMajorStylesShipped" datasource="as400">
                      SELECT SUM(INVDTL0.UNIT5Z) AS SHIPPED, INVDTL0.CSNO5Z 
                      FROM VPSFILES.INVDTL0 AS INVDTL0, VPSFILES.INVHDR0 AS INVHDR0 
                      WHERE (INVDTL0.CONO5Z = INVHDR0.CONO6A) AND (INVDTL0.INNO5Z = INVHDR0.INNO6A) AND (INVDTL0.CONO5Z = 1) 
                      AND (INVHDR0.INTS6A NOT IN ('C','R')) 
                      AND (INVDTL0.PRCD5Z = '#qOtherMajorStores.PRCD4E#') AND (INVDTL0.CRCD5Z = '#qOtherMajorStoreColors.CRCD4E#') 
                      AND (INVDTL0.CSNO5Z = #qOtherMajorStores.CSNO4E#) 
                      GROUP BY INVDTL0.CSNO5Z                
                  </cfquery>                
                  
                  <!--- set variables --->
                  <cfset Selling = StructNew()>
                  <cfset Selling.CSNO = #qOtherMajorStores.CSNO4E#>
                  <cfset Selling.CUSTOMER = #qOtherMajorStores.CSSN4E#>
                  <cfset Selling.TYPE = 'STORE'>
                  <cfset Selling.WTD =  0>
                  <cfset Selling.EOH = 0>
                  <cfset Selling.SHIPPED = #qOtherMajorStylesShipped.SHIPPED# >
                  <cfset Selling.OPEN = #qOtherMajorStylesOpen.OPEN#>
                  <cfset Selling.STYLE = #qOtherMajorStores.PRCD4E#>
                  <cfset Selling.COLOR = #qOtherMajorStoreColors.CRCD4E#>
                  
                  <!--- invoke the save to database function here --->
                  <cfset insertRowIntoSelling(Selling)/>                        	
                            
             
        	</cfloop>
            
        </cfloop>
                        
    </cffunction>
    
    <cffunction name="updateNordstromOrderTypes" returntype="void" output="no" access="public">
    
    	<!---
        <cfquery name="qPromos" datasource="as400">
			SELECT INVHDR0.INNO6A 
            FROM VPSFILES.INVHDR0 AS INVHDR0 
            WHERE (INVHDR0.CONO6A = 1) AND (INVHDR0.CSNO6A = 3) 
            AND (INVHDR0.INDT6A BETWEEN 20120101 AND 20131231) 
            AND (INVHDR0.EDR16A LIKE '%RP%') AND (INVHDR0.SRCD6A <> 'PRO')
        </cfquery>                
        
        <cfloop query="qPromos">
            <cfquery name="qUpdatePromos" datasource="as400">
                UPDATE VPSFILES.INVHDR0 
                SET SRCD6A = 'PRO'
                WHERE INNO6A = (#qPromos.INNO6A#) AND (CONO6A = 1)
                AND (CSNO6A = 3)
            </cfquery>
		</cfloop>
        --->
        
		<cfquery name="qRegulars" datasource="as400">
			SELECT INVHDR0.INNO6A 
            FROM VPSFILES.INVHDR0 AS INVHDR0 
            WHERE (INVHDR0.CONO6A = 1) AND (INVHDR0.CSNO6A = 3) 
            AND (INVHDR0.INDT6A BETWEEN 20120101 AND 20131231) 
            AND (INVHDR0.SRCD6A <> 'PRO')
        </cfquery>                

        <cfloop query="qRegulars">
            <cfquery name="qUpdateRegulars" datasource="as400">
                UPDATE VPSFILES.INVHDR0 
                SET SRCD6A = 'REG'
                WHERE INNO6A = (#qRegulars.INNO6A#) AND (CONO6A = 1)
                AND (CSNO6A = 3)
            </cfquery>
		</cfloop>
        
	</cffunction>



    <cffunction name="refreshSalesStatistics" returntype="void" output="no" access="public">	
        		
    
    	<!--- query styles sales information from AS400 --->        
        <cfquery name="qAS400StyleSales" datasource="as400">
                SELECT INVDTL0.PRCD5Z, SUM(INVDTL0.UNIT5Z) AS UNITS , SUM(INVDTL0.INPR5Z) AS AMOUNT
                FROM VPSFILES.INVHDR0 AS INVHDR0, VPSFILES.INVDTL0 AS INVDTL0 
                WHERE (INVHDR0.CONO6A = INVDTL0.CONO5Z) AND (INVDTL0.INNO5Z = INVHDR0.INNO6A) 
                AND (INVHDR0.CONO6A = 1) AND (INVHDR0.INTS6A = 'S') AND (INVHDR0.DVNO6A = 1) 
                AND (INVHDR0.INDT6A >= 20110101) GROUP BY INVDTL0.PRCD5Z 
                HAVING (SUM(INVDTL0.UNIT5Z)  >= 100) 
                ORDER BY SUM(INVDTL0.UNIT5Z) DESC        
        </cfquery>

		<cfloop query="qAS400StyleSales">
    	<!--- get the StyleID of the style in mochi --->        
        
        	<cfquery name="qStyle" datasource="#APPLICATION.DATASOURCE#">
                SELECT DISTINCT Styles.StyleID
                FROM Styles
                WHERE (((Styles.StyleName)='#qAS400StyleSales.PRCD5Z#'))
            </cfquery>
            
			<!--- if there is a style record update it  --->
            <cfif qStyle.RECORDCOUNT IS NOT 0>
            
            	<cfquery name="qStyleStatistics" datasource="#APPLICATION.DATASOURCE#">
            		SELECT StyleStatistics.StyleStatisticID
                    FROM StyleStatistics
                    WHERE (((StyleStatistics.StyleID)=#qStyle.StyleID#))
            	</cfquery>
                
                <cfif qStyleStatistics.RECORDCOUNT IS 0>
                	<cfset varStyleStatisticID = 0>
                <cfelse>
                	<cfset varStyleStatisticID = qStyleStatistics.StyleStatisticID>                    
                </cfif>                
                
				<!--- check if the statistics already exist for the style then update it else create it --->
                <cfset styleStatisticsStruct={StyleStatisticID=#varStyleStatisticID#,StyleID=#qStyle.StyleID#,SalesUnits=#qAS400StyleSales.UNITS#, SalesAmount=#qAS400StyleSales.AMOUNT#}>
                
                <cfinvoke  component="mochi.cfc.styleStatistics.StyleStatistic" method="init" returnvariable="styleStatistic">
                    <cfinvokeargument name="stValues" value="#styleStatisticsStruct#"/>
                </cfinvoke>
                
                <cfinvoke component="mochi.cfc.styleStatistics.StyleStatisticGateway" method="save" returnvariable="savedStyleStatistic"> 
                    <cfinvokeargument name="obj" value="#styleStatistic#"/>
                </cfinvoke>
            
            </cfif>
            
		</cfloop>
		
	</cffunction>




</cfcomponent>


