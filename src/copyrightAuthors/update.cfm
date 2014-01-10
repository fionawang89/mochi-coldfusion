<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.CopyrightAuthorid")>
	<cfinvoke  component="mochi.cfc.CopyrightAuthors.CopyrightAuthor" method="init" returnvariable="CopyrightAuthor">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.CopyrightAuthors.CopyrightAuthorGateway" method="save">
		<cfinvokeargument name="obj" value="#CopyrightAuthor#"/>
	</cfinvoke>


    <cflocation url="index.cfm">
    
<cfelseif IsDefined("url.CopyrightAuthorid")>

	<cfinvoke  component="mochi.cfc.CopyrightAuthors.CopyrightAuthorGateway" method="getById" returnvariable="CopyrightAuthor">
		<cfinvokeargument name="id" value="#url.CopyrightAuthorid#"/>
	</cfinvoke>


</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">CopyrightAuthor :</th>
    <td width="168"><cfinput type="text" name="Author" id="Author"
            		 value="#CopyrightAuthor.getAuthor()#">
    </td>
  </tr>
  <tr>  
    <th width="149" scope="row">Citizenship :</th>
    <td width="168"><cfinput type="text" name="Citizenship" id="Citizenship" value="#CopyrightAuthor.getCitizenship()#" required="yes" validateat="onsubmit"></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Date of Birth :</th>
    <td width="168">		    	
    	<cfinput type="datefield" required="true" name="DateOfBirth" id="DateOfBirth" value="#DateFormat(CopyrightAuthor.getDateOfBirth(), 'm/d/yyyy')#" validateat="onSubmit" message="Date of Birth is required">
	</td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Copyright Author"></td>
  </tr>
</table>
	<cfinput type="hidden" name="CopyrightAuthorid" value="#CopyrightAuthor.getCopyrightAuthorid()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#CopyrightAuthor.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>