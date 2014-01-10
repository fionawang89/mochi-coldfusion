<!---<cfset  date1= Now()>
<cfset  date2 = Now() + 60 >
<cfset  date3 = Now() + .35>
<cfset date4 = date2 - date1>
<cfset date5 = date1 + (61 * .35)>
<cfset date6 = date1 + 0>
<cfset date7 = date2 - date1>
<cfset n = DateDiff('d', CreateDate(2008,9,9), Now())>
<cfoutput>
	#DateFormat(date1, 'mm/dd/yyyy')#<br />
	#DateFormat(date2, 'mm/dd/yyyy')#<br />    
	#DateFormat(date3, 'mm/dd/yyyy')#<br />    
	#date4#<br />    
	#DateFormat(date5, 'mm/dd/yyyy')#<br />        
	#DateFormat(date6, 'mm/dd/yyyy')#<br />
	#date7#<br />    
	#n#<br />    
	#DateDiff('d', Now (), CreateDate(2008,8, 21))#<br/>    
</cfoutput>
--->
<!--- Query used to update the plan dates --->
<!---<cfquery name="qHeaders" datasource="mochi">
	SELECT *
    FROM ProductionProgressHeader	
</cfquery>

<cfloop query="qHeaders">

	<cfquery name="qDetails" datasource="mochi">
    	SELECT *
        FROM ProductionProgressDetail    
        WHERE ProductionProgressID = #qHeaders.ProductionProgressID# 
    </cfquery>
    
    <cfloop query="qDetails">
    	
        <cfinvoke  component="mochi.cfc.operationsProcesses.OperationProcessGateway" method="getById" returnvariable="OperationProcess">
			<cfinvokeargument name="id" value="#qDetails.OperationProcessID#"/>
		</cfinvoke>

		<cfset generatedPlanDate = #qHeaders.IssueDate# + (#qHeaders.TotalWorkDays# * #OperationProcess.getPercentDaysToFinish()#)>
        
		<cfquery datasource="mochi">
        	UPDATE ProductionProgressDetail
            SET PlanDate = #generatedPlanDate# 
			WHERE ProductionProgressDetailID = #qDetails.ProductionProgressDetailID#        
        </cfquery>
        
    </cfloop>
    
</cfloop>--->
<!--- Query used to add the qc plan dates --->
<!---<cfquery name="qHeaders" datasource="mochi">
	SELECT *
    FROM ProductionProgressHeader	
</cfquery>


<cfloop query="qHeaders">

				<cfloop query="qOperationsProcesses">
					<!--- Create a struct to enter in the ProductionProgressDetail Table --->
					<cfset ppd = StructNew()>
		            <cfset ppd.ProductionProgressDetailID = 0>
		            <cfset ppd.ProductionProgressID = ProductionProgressHeader.ProductionProgressID>
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

--->
<!--- <cfquery  datasource="#APPLICATION.DATASOURCE#">
	UPDATE SampleRequest
	SET DeliveryID = 1
</cfquery>
 --->
 
<!---<cfquery  datasource="#APPLICATION.DATASOURCE#">
	UPDATE FabricRequest
	SET FabricRequestTypeID = 1
</cfquery>
--->

<!---
<cfquery  datasource="#APPLICATION.DATASOURCE#">
	UPDATE FabricRequest
	SET FabricCategoryID = 1
</cfquery>
--->

<!---<cfquery name="qShipments"  datasource="#APPLICATION.DATASOURCE#">
    SELECT SampleRequest.SampleRequestID, SampleShipments.ShippedDate, SampleShipments.ReceivedBy, SampleShipments.ReceivedDate, SampleShipments.SampleShipmentID
    FROM SampleRequest INNER JOIN SampleShipments ON SampleRequest.SampleRequestID = SampleShipments.SampleRequestID
    WHERE (((SampleRequest.RequestStatusID)=5) AND ((SampleShipments.ShippedDate)  < <cfqueryparam cfsqltype="cf_sql_date" value="6/1/2009" />));
    
</cfquery>


	<cfloop query="qShipments">
   
   	<cftransaction> 	
        <cfquery datasource="#APPLICATION.DATASOURCE#">
        	UPDATE SampleRequest
            RequestStatusID = <cfqueryparam value="8" cfsqltype="CF_SQL_INTEGER"/>,
			LastMaintainedBy = <cfqueryparam value="Ruben" cfsqltype="CF_SQL_VARCHAR" />,
			LastMaintainedDate = <cfqueryparam value="#CreateODBCDateTime(Now())#" cfsqltype="CF_SQL_TIMESTAMP" />
			where SampleRequestID = <cfqueryparam value="#qShipments.SampleRequestID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfquery datasource="#APPLICATION.DATASOURCE#">
        	UPDATE SampleShipments
			ReceivedBy = "Ruben",
			ReceivedDate = "#DateAdd('d', 5, qShipments.ShippedDate)#" cfsqltype="CF_SQL_TIMESTAMP",
			LastMaintainedBy = <cfqueryparam value="Ruben" cfsqltype="CF_SQL_VARCHAR" />,
			LastMaintainedDate = <cfqueryparam value="#CreateODBCDateTime(Now())#" cfsqltype="CF_SQL_TIMESTAMP" />
			where SampleShipmentID = <cfqueryparam value="#qShipments.SampleShipmentID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
     </cftransaction>
     
    </cfloop>

    <cfdump var="#qShipments#">--->

<!---
<cfquery name="qShipments"  datasource="#APPLICATION.DATASOURCE#">
    SELECT SampleRequest.SampleRequestID, SampleShipments.ShippedDate, SampleShipments.ReceivedBy, SampleShipments.ReceivedDate, SampleShipments.SampleShipmentID
    FROM SampleRequest INNER JOIN SampleShipments ON SampleRequest.SampleRequestID = SampleShipments.SampleRequestID
    WHERE (((SampleRequest.RequestStatusID)=5) AND ((SampleShipments.ShippedDate)  < <cfqueryparam cfsqltype="cf_sql_date" value="6/1/2009" />))
    
</cfquery>


	<cfloop query="qShipments">      		
    	
        <cfinvoke  component="mochi.cfc.sampleRequests.SampleRequestGateway" method="getById" returnvariable="SampleRequest">
			<cfinvokeargument name="id" value="#qShipments.SampleRequestID#"/>
		</cfinvoke>

		<cfscript>
			SampleRequest.setRequestStatusID(8);
			SampleRequest.setLastMaintainedBy("Ruben");
			SampleRequest.setLastMaintainedDate(DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt'));		
		</cfscript>
    
    	<cfinvoke  component="mochi.cfc.sampleRequests.SampleRequestGateway" method="save">
			<cfinvokeargument name="obj" value="#SampleRequest#"/>
		</cfinvoke>

    
    
    
    	<cfinvoke  component="mochi.cfc.sampleShipments.SampleShipmentGateway" method="getById" returnvariable="SampleShipment">
			<cfinvokeargument name="id" value="#qShipments.SampleShipmentID#"/>
		</cfinvoke>

		<cfscript>
			SampleShipment.setReceivedBy("Ruben");
			SampleShipment.setReceivedDate(DateFormat(DateAdd('d', 5, SampleShipment.getShippedDate()), 'mm/dd/yyyy'));
			SampleShipment.setLastMaintainedBy("Ruben");
			SampleShipment.setLastMaintainedDate(DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt'));		
		</cfscript>
    
    	<cfinvoke  component="mochi.cfc.sampleShipments.SampleShipmentGateway" method="save">
			<cfinvokeargument name="obj" value="#SampleShipment#"/>
		</cfinvoke>


    </cfloop>

    <cfdump var="#qShipments#">
--->
<!---<cfif IsDefined('form.creditMemoNumber') AND IsDefined('form.creditMemoDate')>
	<cfset var creditMemoDate = 0>
	<cfset var creditMemoNumber = 0>

    <cfquery datasource="AS400">
        UPDATE CRMDTL0
        SET CRMDTL0.CMDTJ8 = <cfqueryparam cfsqltype="cf_sql_decimal" value="#creditMemoDate#"/>
        WHERE CRMDTL0.CMNOJ8 = <cfqueryparam cfsqltype="cf_sql_decimal" value="creditMemoNumber"/>
    </cfquery>

    <cfquery datasource="AS400">
        UPDATE CRMHDR0.CMNOJ7
        SET CRMHDR0.CMDTJ7 = <cfqueryparam cfsqltype="cf_sql_decimal" value="#creditMemoDate#"/>
        WHERE CRMHDR0.CMNOJ7 = <cfqueryparam cfsqltype="cf_sql_decimal" value="creditMemoNumber"/>
    </cfquery>
   
   	<cfquery name="creditMemos" datasource="AS400">
        SELECT CRMDTL0.CMNOJ8, CRMDTL0.CMDTJ8, CRMHDR0.CMNOJ7, CRMHDR0.CMDTJ7 
        FROM VPSFILES.CRMDTL0 AS CRMDTL0, VPSFILES.CRMHDR0 AS CRMHDR0 
        WHERE (CRMDTL0.CONOJ8 = CRMHDR0.CONOJ7) AND (CRMDTL0.CMNOJ8 = CRMHDR0.CMNOJ7)
    </cfquery>
    
    <cfdump var="#creditMemos#"/>
</cfif>

<cfform method="post">
	<table>
    	<tr>
        	<th>Credit Memo Number :</th>
            <td><cfinput name="creditMemoNumber" required="yes" type="text"/></td>
        </tr>
    	<tr>
        	<th>Credit Memo Date :</th>
            <td><cfinput name="creditMemoDate" required="yes" type="text"/></td>
        </tr>
        <tr>
        	<td colspan="2"><cfinput type="submit" name="Update" value="Update Creadit Memo"/></td>
        </tr>    
    </table>
</cfform> --->

<!---<cfquery datasource="mochi">
	UPDATE SampleRequest
    SET ColorID = 231
    WHERE ColorID = 251
</cfquery>--->


<!---<cfquery datasource="as400">
    UPDATE VPSFILES.ORDHDR0 
    SET ORTP2Y = 'PRD'
    WHERE (CSPO2Y LIKE '%VEGAS%') 
    AND (ORTP2Y <> 'PRD') AND (CSNO2Y IN(20408,10408)) AND (ORDT2Y >= 20090101) AND (CONO2Y <> 2)
</cfquery>--->



<cfquery name="qReorders" datasource="AS400">
	SELECT CSNO4E,PRCD4E, CRCD4E, MIN(CRDT4E) AS CREATEDATE 
    FROM VPSFILES.ORDDTL0 AS ORDDTL0, VPSFILES.CUSTMS0 AS CUSTMS0 
    WHERE (ORDDTL0.CONO4E = CUSTMS0.CONO2S) AND (CUSTMS0.CSNO2S = ORDDTL0.CSNO4E) 
    AND (CONO4E = 1) AND (CRDT4E > 20090201) 
    AND (LNST4E <> 'C') AND (CUSTMS0.CLCD2S ='DEP')
    GROUP BY CSNO4E,PRCD4E, CRCD4E
</cfquery>

<cfloop query="qReorders">
	<cfquery datasource="AS400" timeout="99999">
        UPDATE VPSFILES.ORDDTL0 AS ORDDTL0
        SET EDR44E = 'REORDER' 
        WHERE CSNO4E = #qReorders.CSNO4E# 
        AND PRCD4E  = '#qReorders.PRCD4E#'
        AND CRCD4E = '#qReorders.CRCD4E#'
        AND CRDT4E > #qReorders.CREATEDATE#
        AND (CONO4E = 1) AND (CRDT4E BETWEEN 20090101 AND 20091231) AND (LNST4E <> 'C')
    </cfquery>    
</cfloop>


