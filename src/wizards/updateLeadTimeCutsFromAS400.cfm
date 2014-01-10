
<!---<cfinvoke  component="mochi.cfc.wizards.Wizard" method="updateCuttingTicketLeadTimes" returnvariable="status">
</cfinvoke>	

<cfdump var="#status#"/>--->


        
		<!--- get all open import cutting ticket in as400 that doesnt have a lead time yet --->		
           <cfquery name="qOpenImportCuts" datasource="AS400">
					SELECT CONO8Q, JBNO8Q, PRCD8Q, CRCD8Q, DUDT8Q, CMDT8Q, CRDT8Q, TLIS8Q, STCD8Q,  DATE(SUBSTR(VARCHAR(JOBSUM0.ISDT8Q),1,4) ||'-'||  SUBSTR(VARCHAR(JOBSUM0.ISDT8Q),5,2)  ||'-'|| SUBSTR(VARCHAR(JOBSUM0.ISDT8Q),7,2)) AS ISSUEDATE
                    FROM VPSFILES.JOBSUM0 AS JOBSUM0 
                    WHERE (CONO8Q = 1) AND (STCD8Q = 'ISS') 
                    AND ((DUDT8Q > 20100531) OR (ISDT8Q > 20100431))
                    AND (ODIH8Q = 0)
           </cfquery>
        
        	<cfdump var="#qOpenImportCuts#"/>
        
        <!--- get the cost sheet information of the style of the cutting ticket just get the fabric material information only--->		
        <cfloop query="qOpenImportCuts">
        	
            <cfset leadDays = 0/>
            <cfset type = ""/>
            <cfset fabricCode = ""/>
            <cfset fabricColor = ""/>
            <cfset fabricStock = 0/>
            <cfset PO = ""/>
            <cfset PODueDate = ""/>
            
           <cfquery name="qCostSheet" datasource="AS400">
				SELECT CSTMTL0.PRCDE3, CSTMTL0.CRCDE3, CSTMTL0.VRNOE3, CSTMTL0.MTCDE3, CSTMTL0.MTCRE3, CSTMTL0.QNTYE3, CSTMTL0.AJQTE3, MTRLMS0.DYLT3R, MTRLMS0.DYLT3R   
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
   	         
				
				
				<!--- first check if the cut  was already  made in company 2 --->
                <cfquery name="qCompany2Cut" datasource="AS400">
                	SELECT CSPO4E 
                    FROM VPSFILES.ORDDTL0 AS ORDDTL0 WHERE (LNST4E <> 'C') AND (INLN4E <> 'Y') 
                    AND (CONO4E = 2) AND (CSNO4E = 1) AND (JBRF4E <> '') 
                    AND (CSPO4E = '#qOpenImportCuts.JBNO8Q#')                
                </cfquery>
				
                <!--- if the cut was already created in company 2 for this one we dont need to subtract the fabric requirement again --->
                <cfif qCompany2Cut.RECORDCOUNT NEQ 0>
                	<cfset fabricRequirement = 0>            	
                </cfif>
                
                
                <!--- get fabric stock availablility --->
                <cfset fabricStock = NumberFormat(qFabricAvailability.ONHAND, '0.0000') - (NumberFormat(qFabricAvailability.REQUIREMENTS, '0.0000') + fabricRequirement)/>
                
				<!--- if we have don't have fabric in stock --->                                               
                <cfif fabricStock LT 0> 
					
                    <!--- check if we have open POs --->					                
                    <cfif (NumberFormat(qFabricAvailability.AVAILABLE,'0.00') - fabricRequirement) GT 0>
                    	<cfquery name="qPO" datasource="AS400">
                            SELECT MAX(PORDTL0.ORNOH0) AS PO, DATE(SUBSTR(VARCHAR(MAX(DUDTH0)),1,4) ||'-'||  SUBSTR(VARCHAR(MAX(DUDTH0)),5,2)  ||'-'|| SUBSTR(VARCHAR(MAX(DUDTH0)),7,2)) AS PODATE
                            FROM VPSFILES.PORDTL0 AS PORDTL0 
                            WHERE (CONOH0 = 2) AND (MTCDH0 = '#qCostSheet.MTCDE3#') AND (CRCDH0 = '#qCostSheet.MTCRE3#')
                        </cfquery>
                        
                        <cfset days = DateDiff("d", #qOpenImportCuts.ISSUEDATE#, #qPO.PODATE#)>
						<cfoutput>
                        	<p>material : #qCostSheet.MTCDE3#  #qCostSheet.MTCRE3#</p>
                            <p>issue date : #qOpenImportCuts.ISSUEDATE#</p>
                            <p>PO date : #qPO.PODATE#</p>
			              	<p>diff days : #days#"</p>
                            <p>fabric stock : #fabricStock#</p>
            			</cfoutput> 

                        <cfif days GT leadDays>
                        	<cfset type = "PO: "/>
                            <cfset fabricCode = '#qCostSheet.MTCDE3#'/>
                            <cfset fabricColor = '#qCostSheet.MTCRE3#'/>
                            <cfset fabricStock = #fabricStock#/>
                            <cfset PO = '#qPO.PO#'/>
                            <cfset PODueDate = '#DateFormat(qPO.PODATE, "mm/dd/yy")#'/>
                        	<cfset leadDays = days/>
                        </cfif>
                    <!--- if we dont have open POs check the time it will take to order the fabric --->
					<cfelse>
                    	                        
						<cfoutput>
                           <p>material : #qCostSheet.MTCDE3#  #qCostSheet.MTCRE3#</p>
                           <p>issue date : #qOpenImportCuts.ISSUEDATE#</p>
                           <p>PO days : #qCostSheet.DYLT3R#</p>
                           <p>fabric stock : #fabricStock#</p>
                        </cfoutput> 
                        
                        
                        
							<!--- if this is a  fabric just add the lead time --->
                            <cfif qCostSheet.DYLT3R GT leadDays>
                                <cfset type = "ST: "/>
                                <cfset fabricCode = '#qCostSheet.MTCDE3#'/>
                                <cfset fabricColor = '#qCostSheet.MTCRE3#'/>
                                <cfset fabricStock = #fabricStock#/>
                                <cfset leadDays = qCostSheet.DYLT3R/>
                            <!--- if there was no lead time for ordering the fabric add it to the comment --->    
                            <cfelse>
<!---                                <cfset type = "NL: "/>
                                <cfset fabricCode = '#qCostSheet.MTCDE3#'/>
                                <cfset fabricColor = '#qCostSheet.MTCRE3#'/>
                                <cfset fabricStock = #fabricStock#/>
--->                            </cfif>                
					</cfif>                    
                </cfif>
                	
                </cfloop>		
                		
           <cfelse>          
           		<!--- no cost sheet in company 2!!--->           
           </cfif>
			
           <!--- once the lead time has been determined add 30 days for sewing, trimming, beading, etc... ---> 
            <cfset leadDays += 30>
            
            <!--- get the suggested cancel date then --->
            <cfset leadDate = DateAdd("d", #leadDays#,#qOpenImportCuts.ISSUEDATE#)/>
            <cfset as400LeadDate = #DateFormat(leadDate, "YYYYMMDD")#/>
            <cfoutput>
	             <p><b>lead days : #leadDays#</b></p>
	             <p><b>lead date : #leadDate#</b></p>
	             <p><b>as400 date : #as400LeadDate#</b></p>
            </cfoutput> 
            
            <cfquery datasource="AS400">
                UPDATE VPSFILES.JOBSUM0 
                SET ODIH8Q = #as400LeadDate#,
                VL018Q = '#Trim(type)#', 
                VL028Q = '#Mid(Trim(fabricCode),1,10)#', 
                VL038Q = '#Trim(fabricColor)#', 
                VL048Q = '#Mid(Trim(fabricStock),1,10)#', 
                VL058Q = '#Trim(PO)#', 
                VL068Q = '#Trim(PODueDate)#' 
                WHERE (CONO8Q =1) AND (JBNO8Q = #qOpenImportCuts.JBNO8Q#) AND (PRCD8Q = '#qOpenImportCuts.PRCD8Q#') AND  (CRCD8Q = '#qOpenImportCuts.CRCD8Q#')
            </cfquery>            

        </cfloop>
        <!--- save the lead time in as400 --->
        
        
