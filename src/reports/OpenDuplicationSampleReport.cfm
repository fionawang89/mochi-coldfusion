<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.reportFormat")>

	<cfinvoke component="mochi.cfc.reports.Report" method="OpenDuplicationSamplesReportQuery" returnvariable="myQuery">
    </cfinvoke>
    
	<cfreport template="#form.reportFormat#" format="#form.reportFileType#" query="#MyQuery#"/>


<cfelse>


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
                        <option value="ProductionPatternReportWithCommentsV2.cfr">Pattern Status Chart W/ Comments
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
                <td colspan="2" align="center"><cfinput type="submit" name="submit" value="Create Report"><cfinput type="reset" name="reset" value="Reset"></td>
            </tr>
        
        </table>
            
        </cfform>
        

</cfif>