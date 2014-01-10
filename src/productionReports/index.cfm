<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.reportFormat")>

    <cfinvoke  component="mochi.cfc.reports.Report" method="ProductionProgressReport" returnvariable="productionQuery">
    	<cfinvokeargument name="param" value="#form#"/>
	</cfinvoke>

    
	<cfreport template="#form.reportFormat#" format="#form.reportFileType#" query="#productionQuery#"/>

<cfelse>


<cfinvoke  component="mochi.cfc.operations.OperationGateway" method="getAllAsQuery" returnvariable="operations">
</cfinvoke>

<cfinvoke  component="mochi.cfc.productionDetailStatus.ProductionDetailStatusGateway" method="getAllAsQuery" returnvariable="productionDetailStatus">
</cfinvoke>

<cfquery name="qTypes" datasource="#APPLICATION.DATASOURCE#">
	SELECT DISTINCT Type
    FROM ProductionDetailStatus
</cfquery>

<cfquery name="qContractors" datasource="#APPLICATION.DATASOURCE#">
	SELECT DISTINCT Contractor
    FROM ProductionProgressHeader 
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
            	<option value="ProductionProgressReport.cfr">Production Progress Report
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
        	Select Contractor :
        </th>
    	<td>
        	<cfselect name="Contractor" query="qContractors" queryPosition="below" value="Contractor" display="Contractor">
            	<option value="ALL">ALL CONTRACTOR
            </cfselect>
        </td>
    </tr>
	<tr>
    	<th>
        	Select Operation :
        </th>
    	<td>
        	<cfselect name="OperationID" query="operations" queryPosition="below" value="OperationID" display="Operation">
            	<option value="0">ALL OPERATION
            </cfselect>
        </td>
    </tr>
	<tr>
    	<th>
        	Select Status :
        </th>
    	<td>
        	<cfselect name="ProductionDetailStatusID" query="ProductionDetailStatus" queryPosition="below" value="ProductionDetailStatusID" display="Status" multiple="yes">
            	<option value="0">ALL STATUS
            </cfselect>
        </td>
    </tr>
<!---	<tr>
    	<th>
        	Select Type :
        </th>
    	<td>
        	<cfselect name="Type" query="qTypes" queryPosition="below" value="Type" display="Type" multiple="yes">
            	<option value="">ALL TYPES
            </cfselect>
        </td>
    </tr>--->
	<tr>
    	<th>
        	ISSUE DATES :     

        </th>
    </tr>
    <tr>
    	<th>
        	From :
        </th>
        <td>
	        <cfinput type="datefield" name="FromIssueDate">
        </td>
    </tr>
    <tr>
    	<th>
        	To :
        </th>
        <td>
	        <cfinput type="datefield" name="ToIssueDate">
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
        	RECENT UPDATES :     

        </th>
    </tr>
    <tr>
    	<th>
        	From :
        </th>
        <td>
	        <cfinput type="datefield" name="FromLastMaintainedDate">
        </td>
    </tr>
    <tr>
    	<th>
        	To :
        </th>
        <td>
	        <cfinput type="datefield" name="ToLastMaintainedDate">
        </td>
    </tr>
    
	<tr>
    	<td colspan="2" align="center"><cfinput type="submit" name="submit" value="Create Report"><cfinput type="reset" name="reset" value="Reset"></td>
    </tr>

</table>
    
</cfform>

</cfif>