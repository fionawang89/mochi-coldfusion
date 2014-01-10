<cfif IsDefined("form.comment")>

	<cfinvoke  component="mochi.cfc.imageComments.ImageComment" method="init" returnvariable="ImageComment">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.imageComments.ImageCommentGateway" method="save">
		<cfinvokeargument name="obj" value="#ImageComment#"/>
	</cfinvoke>

    <cflocation url="../Fittings/show.cfm?fittingid=#form.fittingid#"/>
    
<cfelseif IsDefined("url.ImageId") AND IsDefined("url.fittingid")>

    <cfform>
    
    <table width="400" border="1" align="left">
      <tr>
        <th width="111" height="103" scope="row">Comment :</th>
        <td width="273"><cftextarea name="comment" id="comment" width="150" height="400"></cftextarea></td>
      </tr>
    </table>
    <cfinput type="hidden" name="ImageCommentID" value="0">
    <cfinput type="hidden" name="ImageId" value="#url.imageid#">
    <cfinput type="hidden" name="fittingid" value="#url.fittingid#">
    <cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
    <cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">  
    <cfinput type="submit" name="submit" value="Create Image Comment">
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
    
    </cfform>    
    
<cfelse>

	<cflocation url="../fittings/index.cfm">
    
</cfif>


