<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.fittingcommentid")>

    <cfinvoke component="mochi.cfc.fittingComments.FittingComment" method="init" returnvariable="fittingComment">
        <cfinvokeargument name="stValues" value="#form#"/>
    </cfinvoke>

	<cfinvoke  component="mochi.cfc.fittingComments.FittingCommentGateway" method="save">
		<cfinvokeargument name="obj" value="#fittingComment#"/>
	</cfinvoke>
    
    <cflocation url="../fittings/show.cfm?fittingid=#form.fittingid#"/>

<cfelseif IsDefined("url.fittingid")>	
	
<cfform>

<table height="100%" width="100%" border="1" align="left">
  <tr>
    <th width="100" scope="row">Comment :</th>
    <td width="617"><cftextarea name="comment" cols="100%" rows="10" id="comment"/> 
    </td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create Fitting Comment"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="fittingcommentid" name="fittingcommentid" value="0">
	<cfinput type="hidden" id="fittingid" name="fittingid" value="#url.fittingid#">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>

</cfif>
