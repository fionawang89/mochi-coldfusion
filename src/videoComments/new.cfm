<cfif IsDefined("form.comment")>

	<cfinvoke  component="mochi.cfc.videoComments.VideoComment" method="init" returnvariable="videoComment">
    	<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.videoComments.VideoCommentGateway" method="save">
		<cfinvokeargument name="obj" value="#videoComment#"/>
	</cfinvoke>

    <cflocation url="../Fittings/show.cfm?fittingid=#form.fittingid#"/>
    
<cfelseif IsDefined("url.Videoid") AND IsDefined("url.fittingid")>

    <cfform>
    
    <table width="400" border="1" align="left">
      <tr>
        <th width="111" height="103" scope="row">Comment :</th>
        <td width="273"><cftextarea name="comment" id="comment" width="150" height="400"></cftextarea></td>
      </tr>
    </table>
    <cfinput type="hidden" name="VideoCommentID" value="0">
    <cfinput type="hidden" name="Videoid" value="#url.videoid#">
    <cfinput type="hidden" name="fittingid" value="#url.fittingid#">
    <cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
    <cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">  
    <cfinput type="submit" name="submit" value="Create VideoComment">
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
    
    </cfform>    
    
<cfelse>

	<cflocation url="../fittings/index.cfm">
    
</cfif>


