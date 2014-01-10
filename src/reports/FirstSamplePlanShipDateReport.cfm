<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.reportFormat")>

	<cfinvoke component="mochi.cfc.reports.Report" method="FirstSamplesPlanShipDateReportQuery" returnvariable="myQuery">
    	<cfinvokeargument name="param" value="#form#"/>
    </cfinvoke>

	<cfreport template="#form.reportFormat#" format="#form.reportFileType#" query="#MyQuery#"/>


<cfelse>

    <cfinvoke  component="mochi.cfc.sampleTypes.SampleTypeGateway" method="getAllAsQuery" returnvariable="sampleTypes">
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
                    <select name="reportFormat">
                        <option value="PackingList.cfr">Packing List
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
                <td colspan="2" align="center"><cfinput type="submit" name="submit" value="Create Report"><cfinput type="reset" name="reset" value="Reset"></td>
            </tr>
        
        </table>
            
        </cfform>
        

</cfif>