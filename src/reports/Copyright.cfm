<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.reportFormat")>

	<cfinvoke component="mochi.cfc.reports.Report" method="copyrightApplicationReportQuery" returnvariable="qCopyright">
    	<cfinvokeargument name="param" value="#form#"/>
    </cfinvoke>

	<cfreport template="#form.reportFormat#" format="#form.reportFileType#" query="#qCopyright#"/>
	
<cfelse>

	
    <cfinvoke  component="mochi.cfc.Copyrights.CopyrightGateway" method="getAllAsQuery" returnvariable="copyrightsQuery">
	</cfinvoke>

    
        <cfform method="post">
        <table>
            <tr>
                <th colspan="2">COPYRIGHT APPLICATION REPORT</th>
            </tr>
            <tr>
                <th>
                    Select Report Format :
                </th>
                <td>
                    <select name="reportFormat">
                        <option value="CopyrightApplication.cfr">Copyright Application Report
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
                    COPYRIGHT TITLE OF  WORK :             
                </th>
            	<td>
                    <cfselect name="CopyrightID" query="copyrightsQuery" queryPosition="below" value="CopyrightID" display="TitleOfWork">
                        <option value="">SELECT TITLE OF WORK
                    </cfselect>                	
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center"><cfinput type="submit" name="submit" value="Create Report"><cfinput type="reset" name="reset" value="Reset"></td>
            </tr>
        
        </table>
            
        </cfform>
        

</cfif>