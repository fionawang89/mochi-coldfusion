<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.reportFormat")>

	<cfinvoke component="mochi.cfc.reports.Report" method="FirstSamplesCustomReportQuery" returnvariable="myQuery">
    	<cfinvokeargument name="param" value="#form#"/>
    </cfinvoke>
    
	<cfreport template="#form.reportFormat#" format="#form.reportFileType#" query="#MyQuery#"/>


<cfelse>


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
                        <option value="FirstSamplePatternReport.cfr">First Pattern Status Chart
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
                    Select Make In :
                </th>
                <td>
                    <cfselect name="makeIn" query="makeInLocations" queryPosition="below" value="MakeIn" display="MakeIn">
                        <option value="">ALL LOCATIONS
                    </cfselect>
                </td>
            </tr>    
            <tr>
                <td colspan="2" align="center"><cfinput type="submit" name="submit" value="Create Report"><cfinput type="reset" name="reset" value="Reset"></td>
            </tr>
        
        </table>
            
        </cfform>
        

</cfif>