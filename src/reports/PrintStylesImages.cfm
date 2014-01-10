<cfif IsDefined("form.styles")>


	<cfquery name="qStyles" datasource="#APPLICATION.DATASOURCE#">
        SELECT Styles.StyleID, Styles.StyleName, Styles.Description, Images.File, Images.ThumbnailFile
        FROM Styles LEFT JOIN Images ON (Styles.EntityTypeID = Images.EntityTypeID) AND (Styles.StyleID = Images.EntityID)
        WHERE Styles.StyleID In (#form.styles#)  
    </cfquery>

	<cfreport template="StylesImages.cfr" format="PDF" query="#qStyles#" />


</cfif>




<cfinvoke  component="mochi.cfc.styles.StyleGateway" method="getAllAsQuery" returnvariable="styles">
</cfinvoke>

<cfform>
<table height="100%">
	<tr height="100%">
    	<th>Select Styles</th>
        <td height="100%">
        	<cfselect height="100%" name="styles" query="styles" display="StyleName" value="StyleID" required="yes" message="Style is required" multiple="yes"/>        
        </td>
    </tr>
    <tr>
    	<td colspan="2">
        	<cfinput type="submit" name="submit" value="Submit"/>
        </td>
    </tr>

</table>


</cfform>