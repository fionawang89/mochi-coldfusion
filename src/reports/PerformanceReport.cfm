<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.performanceReportFormat")>

	<cfinvoke component="mochi.cfc.reports.Report" method="PerformanceReportQuery" returnvariable="performanceQuery">
    	<cfinvokeargument name="param" value="#form#"/>
    </cfinvoke>
    
	<cfreport template="#form.performanceReportFormat#" format="pdf" query="#performanceQuery#"/>

<cfelse>


    <cfinvoke  component="mochi.cfc.sampleTypes.SampleTypeGateway" method="getAllAsQuery" returnvariable="sampleTypes">
    </cfinvoke>
    
    <cfinvoke  component="mochi.cfc.requestStatus.RequestStatusGateway" method="getAllAsQuery" returnvariable="requestStatus">
    </cfinvoke>
    
    <cfinvoke component="mochi.cfc.patternStatus.PatternStatusGateway" method="getAllAsQuery" returnvariable="patternStatus">
    </cfinvoke>


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
                        <select name="performanceReportFormat">
                            <option value="PatternPerformanceReport.cfr">Pattern Performance Report
                            <option value="PatternPerformanceReportWithComments.cfr">Pattern Performance Report w/ Comments                                                        
                        </select>
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
                        FINISHED DATES :     
            
                    </th>
                </tr>
                <tr>
                    <th>
                        From :
                    </th>
                    <td>
                        <cfinput type="datefield" name="FromFinishedDate">
                    </td>
                </tr>
                <tr>
                    <th>
                        To :
                    </th>
                    <td>
                        <cfinput type="datefield" name="ToFinishedDate">
                    </td>
                </tr>
                <tr>
                    <th>
                        APPROVED DATES :     
            
                    </th>
                </tr>
                <tr>
                    <th>
                        From :
                    </th>
                    <td>
                        <cfinput type="datefield" name="FromApprovedDate">
                    </td>
                </tr>
                <tr>
                    <th>
                        To :
                    </th>
                    <td>
                        <cfinput type="datefield" name="ToApprovedDate">
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
                    <td colspan="2" align="center"><cfinput type="submit" name="submit" value="Create Report"><cfinput type="reset" name="reset" value="Reset"></td>
                </tr>                
            </table>
            
        </cfform>
        
</cfif>