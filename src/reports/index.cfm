<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.reportFormat")>

	<cfinvoke component="mochi.cfc.reports.Report" method="ReportQuery" returnvariable="myQuery">
    	<cfinvokeargument name="param" value="#form#"/>
    </cfinvoke>
    
	<cfreport template="#form.reportFormat#" format="#form.reportFileType#" query="#MyQuery#"/>


<cfelse>


<cfinvoke  component="mochi.cfc.sampleTypes.SampleTypeGateway" method="getAllAsQuery" returnvariable="sampleTypes">
</cfinvoke>

<cfinvoke  component="mochi.cfc.locations.LocationGateway" method="getAllAsQuery" returnvariable="locations">
</cfinvoke>

<cfinvoke  component="mochi.cfc.requestStatus.RequestStatusGateway" method="getAllAsQuery" returnvariable="requestStatus">
</cfinvoke>

<cfinvoke  component="mochi.cfc.deliveries.DeliveryGateway" method="getAllAsQuery" returnvariable="deliveries">
</cfinvoke>

<cfinvoke  component="mochi.cfc.years.YearGateway" method="getAllAsQuery" returnvariable="years">
</cfinvoke>


<cfinvoke  component="mochi.cfc.collections.CollectionGateway" method="getAllAsQuery" returnvariable="collections">
</cfinvoke>

<cfinvoke 
 component="mochi.cfc.patternStatus.PatternStatusGateway" method="getAllAsQuery"
 returnvariable="patternStatus">
</cfinvoke>




<cfquery name="makeInLocations" datasource="#APPLICATION.DATASOURCE#">
	SELECT DISTINCT MakeIn
	FROM SampleRequest        
</cfquery>


        <cfform method="post">
        <table>
            <tr>
                <th colspan="2">CREATE REPORT</th>
            </tr>
            <tr>
                <th>
                    Select Report Format :
                </th>
                <td>
                    <select name="reportFormat">
                        <option value="PackingList.cfr">Packing List
                        <option value="PackingListTadashi.cfr">Packing List Tadashi
                        <option value="ProductionStatusChartv4.cfr">Production Status Chart
                        <option value="ProductionPatternReport.cfr">Pattern Status Chart
                        <option value="ProductionPatternReportWithCommentsV2.cfr">Pattern Status Chart W/ Comments
                        <option value="ProductionPatternProgressReport.cfr">Pattern Status Progress Chart
                        <option value="SampleOrdersByDeliveryV3.cfr">Sample Orders By Delivery
                        <option value="SampleOrdersList.cfr">Sample Order List
                        <option value="SampleOrders.cfr">Sample Order
                    </select>
                </td>
            </tr>
            <tr>
                <th>
                    Select File Output Type :
                </th>
                <td>
                    <select name="reportFileType">
                        <option value="pdf">PDF
                        <option value="excel">Excel
                        <option value="flashpaper">Flashpaper
                        <option value="rtf">Word
                    </select>
                </td>
            </tr>
            <tr>
                <th>
                    Select Collection :
                </th>
                <td>
                    <cfselect name="CollectionID" query="collections" queryPosition="below" value="CollectionID" display="Collection" multiple="yes">
                        <option value="0">ALL COLLECTION
                    </cfselect>
                </td>
            </tr>
            <tr>
                <th>
                    Select Sample Type :
                </th>
                <td>
                    <cfselect name="SampleType" query="sampleTypes" queryPosition="below" value="SampleTypeID" display="SampleType" multiple="yes">
                        <option value="0">ALL SAMPLE TYPE
                    </cfselect>
                </td>
            </tr>
            <tr>
                <th>
                    Select Delivery :
                </th>
                <td>
                    <cfselect name="DeliveryID" query="deliveries" queryPosition="below" value="DeliveryID" display="Delivery">
                        <option value="">ALL DELIVERIES
                    </cfselect>
                </td>
            </tr>    
            <tr>
                <th>
                    Select Year :
                </th>
                <td>
                    <cfselect name="YearID" query="years" queryPosition="below" value="YearID" display="Year">
                        <option value="">ALL YEARS
                    </cfselect>
                </td>
            </tr>    
            <tr>
                <th>
                    Select Make In :
                </th>
                <td>
                    <cfselect name="makeIn" query="makeInLocations" queryPosition="below" value="MakeIn" display="MakeIn">
                        <option value="">ALL LOCATIONS
                    </cfselect>
                </td>
            </tr>    
            <tr>
                <th>
                    Style Number :
                </th>
                <td>
                    <cfinput type="text" name="styleNumber"> 
                </td>
            </tr>
            <tr>
                <th>
                    Customer :
                </th>
                <td>
                    <cfinput type="text" name="customer"> 
                </td>
            </tr>
            <tr>
                <th>
                    Ship To :
                </th>
                <td>
                    <cfselect name="ShipTo" query="locations" queryPosition="below" value="Location" display="Location">
                        <option value="0">ALL LOCATIONS
                    </cfselect>
                </td>
            </tr>
            <tr>
                <th>
                    Ship From :
                </th>
                <td>
                    <cfselect name="ShipFrom" query="locations" queryPosition="below" value="Location" display="Location">
                        <option value="0">ALL LOCATIONS
                    </cfselect>
                </td>
            </tr>
            <tr>
                <th>
                    Requested By :
                </th>
                <td>
                    <cfselect name="RequestedBy" query="locations" queryPosition="below" value="Location" display="Location">
                        <option value="0">ALL LOCATIONS
                    </cfselect>
                </td>
            </tr>
            <tr>
                <th>
                    Requested For :
                </th>
                <td>
                    <cfselect name="RequestedFor" query="locations" queryPosition="below" value="Location" display="Location">
                        <option value="0">ALL LOCATIONS
                    </cfselect>
                </td>
            </tr>
            <tr>
                <th>
                    REQUEST DATES :     
        
                </th>
            </tr>
            <tr>
                <th>
                    From :
                </th>
                <td>
                    <cfinput type="datefield" name="FromRequestDate">
                </td>
            </tr>
            <tr>
                <th>
                    To :
                </th>
                <td>
                    <cfinput type="datefield" name="ToRequestDate">
                </td>
            </tr>
            <tr>
                <th>
                    DUE DATES :
                </th>
            </tr>
            <tr>
                <th>
                    From :
                </th>
                <td>
                    <cfinput type="datefield" name="FromDueDate">
                </td>
            </tr>
            <tr>
                <th>
                    To :
                </th>
                <td>
                    <cfinput type="datefield" name="ToDueDate">
                </td>
            </tr>
            <tr>
                <th>
                    PATTERN DUE DATES :
                </th>
            </tr>
            <tr>
                <th>
                    From :
                </th>
                <td>
                    <cfinput type="datefield" name="FromPatternDueDate">
                </td>
            </tr>
            <tr>
                <th>
                    To :
                </th>
                <td>
                    <cfinput type="datefield" name="ToPatternDueDate">
                </td>
            </tr>
            <tr>
                <th>
                    Deadline to Contractor Date :
                </th>
                <td>
                    <cfinput type="datefield" name="DeadlineToContractorDate">
                </td>
            </tr>
            <tr>
                <th>
                    RECEIVED DATE :
                </th>
            </tr>
            <tr>
                <th>
                    From :
                </th>
                <td>
                    <cfinput type="datefield" name="FromReceivedDate">
                </td>
            </tr>
            <tr>
                <th>
                    To :
                </th>
                <td>
                    <cfinput type="datefield" name="ToReceivedDate">
                </td>
            </tr>
            <tr>
                <th>
                    SHIPMENT DATES :
                </th>
            </tr>
            <tr>
                <th>
                    From :
                </th>
                <td>
                    <cfinput type="datefield" name="FromShipmentDate">
                </td>
            </tr>
            <tr>
                <th>
                    To :
                </th>
                <td>
                    <cfinput type="datefield" name="ToShipmentDate">
                </td>
            </tr>
            <tr>
                <th>
                    PLAN SHIP DATES :
                </th>
            </tr>
            <tr>
                <th>
                    From :
                </th>
                <td>
                    <cfinput type="datefield" name="FromPlanShipDate">
                </td>
            </tr>
            <tr>
                <th>
                    To :
                </th>
                <td>
                    <cfinput type="datefield" name="ToPlanShipDate">
                </td>
            </tr>
            <tr>
                <th>
                    CANCELLATION DATES :
                </th>
            </tr>
            <tr>
                <th>
                    From :
                </th>
                <td>
                    <cfinput type="datefield" name="FromCancellationDate">
                </td>
            </tr>
            <tr>
                <th>
                    To :
                </th>
                <td>
                    <cfinput type="datefield" name="ToCancellationDate">
                </td>
            </tr>
            <tr>
                <th>
                    PATTERN APPROVED UPDATES :     
        
                </th>
            </tr>
            <tr>
                <th>
                    From :
                </th>
                <td>
                    <cfinput type="datefield" name="FromPatternApprovedDate">
                </td>
            </tr>
            <tr>
                <th>
                    To :
                </th>
                <td>
                    <cfinput type="datefield" name="ToPatternApprovedDate">
                </td>
            </tr>
            <tr>
                <th>
                    RECENT PROGRESS UPDATES :     
        
                </th>
            </tr>
            <tr>
                <th>
                    From :
                </th>
                <td>
                    <cfinput type="datefield" name="FromProgressLastMaintainedDate">
                </td>
            </tr>
            <tr>
                <th>
                    To :
                </th>
                <td>
                    <cfinput type="datefield" name="ToProgressLastMaintainedDate">
                </td>
            </tr>
            <tr>
                <th>
                    Sample Status :
                </th>
                <td>
                    <cfselect name="RequestStatus" query="requestStatus" queryPosition="below" value="RequestStatusID" display="Status" multiple="yes">
                    </cfselect>
                </td>
            </tr>
            <tr>
                <th>
                    Pattern Status :
                </th>
                <td>
                    <cfselect name="PatternStatus" query="patternStatus" queryPosition="below" value="PatternStatusID" display="Status" multiple="yes">
                    </cfselect>
                </td>
            </tr>
            <tr>
                <th>
                    Select Order By :
                </th>
                <td>
                    <select name="OrderBy">
                        <option value="">SELECT ORDER BY
                        <option value="Delivery">Delivery
                        <option value="SampleRequest.RequestDate">Request Date
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center"><cfinput type="submit" name="submit" value="Create Report"><cfinput type="reset" name="reset" value="Reset"></td>
            </tr>
        
        </table>
            
        </cfform>
        

</cfif>