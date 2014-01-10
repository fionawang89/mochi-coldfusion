<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.post")>

		<cfinvoke  component="mochi.cfc.posts.Post" method="init" returnvariable="post">
			<cfinvokeargument name="stValues" value="#form#"/>
		</cfinvoke>

		<cfinvoke  component="mochi.cfc.posts.PostGateway" method="save">
			<cfinvokeargument name="obj" value="#post#"/>
		</cfinvoke>

		
    <cflocation url="index.cfm">
	
</cfif>

<cfform>

<table width="100%" border="1" align="left">
  <tr>  
    <th width="175" scope="row">Subject :</th>
    <td width="168"><cfinput type="text" name="subject" id="subject"></td>
  </tr>
  <tr>  
    <th width="175" scope="row">Post :</th>
    <td width="168"><cftextarea cols="100%" rows="5" name="post"></cftextarea></td>
  </tr>
  <tr>  
    <th width="175" scope="row">Done? :</th>
    <td width="168">
		<cfinput type="radio" name="done" value="1">Yes
        <cfinput type="radio" name="done" value="0">No    
    </td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Post"></td>
  </tr>
</table>
  
<cfinput type="hidden" id="postid" name="postid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>