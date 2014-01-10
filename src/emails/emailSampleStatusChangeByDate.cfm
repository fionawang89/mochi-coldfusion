<cfif IsDefined("form.FromLastMaintainedDate")>

	<cfinvoke  component="mochi.cfc.emails.Email" method="emailSampleStatusChangeByDate">
		<cfinvokeargument name="fromLastMaintainedDate" value="#form.FromLastMaintainedDate#"/>
		<cfinvokeargument name="toLastMaintainedDate" value="#form.ToLastMaintainedDate#"/>
	</cfinvoke>

	<cflocation url="index.cfm">
</cfif>

<table>
    <cfform method="post">
        <tr>
        	<th>Enter From Date :</th>
            <td><cfinput type="datefield" name="FromLastMaintainedDate"/></td>            
        </tr>
        <tr>
        	<th>Enter To Date :</th>
            <td><cfinput type="datefield" name="ToLastMaintainedDate"/></td>            
        </tr>
        <tr>
        	<td colspan="2"><cfinput name="submit" type="submit" value="Submit"/></td>
        </tr>
    </cfform>
</table>

