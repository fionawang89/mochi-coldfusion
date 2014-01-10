<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.reportFormat")>

    <cfinvoke  component="mochi.cfc.reports.Report" method="StyleDeliveryReport" returnvariable="StyleDeliveryReportRet">
    	<cfinvokeargument name="param" value="#form#"/>
    
	</cfinvoke>

	<cfreport template="#form.reportFormat#" format="pdf" query="#StyleDeliveryReportRet#"/>


<cfelse>



<cfinvoke  component="mochi.cfc.requestStatus.RequestStatusGateway" method="getAllAsQuery" returnvariable="requestStatus">
</cfinvoke>

<cfinvoke  component="mochi.cfc.years.YearGateway" method="getAllAsQuery" returnvariable="years">
</cfinvoke>

<cfinvoke  component="mochi.cfc.deliveries.DeliveryGateway" method="getAllAsQuery" returnvariable="deliveries">
</cfinvoke>

<cfinvoke  component="mochi.cfc.collections.CollectionGateway" method="getAllAsQuery" returnvariable="collections">
</cfinvoke>

<cfinvoke  component="mochi.cfc.sampleTypes.SampleTypeGateway" method="getAllAsQuery" returnvariable="sampleTypes">
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
                        <option value="StyleDeliveryReport.cfr">Style Delivery
                        <option value="StyleDeliveryBigReport.cfr">Style Delivery (big)
                    </select>
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
                    Select Delivery :
                </th>
                <td>
                    <cfselect name="Delivery" query="deliveries" queryPosition="below" value="DeliveryID" display="Delivery" multiple="yes">
                        
                    </cfselect>
                </td>
            </tr>
            <tr>
                <th>
                    Select Collection :
                </th>
                <td>
                    <cfselect name="Collection" query="collections" queryPosition="below" value="CollectionID" display="Collection" multiple="yes">
                        
                    </cfselect>
                </td>
            </tr>
            <tr>
                <th>
                    Select Sample Type :
                </th>
                <td>
                    <cfselect name="SampleType" query="sampleTypes" queryPosition="below" value="SampleTypeID" display="SampleType" multiple="yes">
                        
                    </cfselect>
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
                <td colspan="2" align="center"><cfinput type="submit" name="submit" value="Create Report"><cfinput type="reset" name="reset" value="Reset"></td>
            </tr>
        
        </table>
            
        </cfform>
        

</cfif>