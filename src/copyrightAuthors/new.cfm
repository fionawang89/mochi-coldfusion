<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.Author")>
	<!--- Check if CopyrightAuthor already exist in the system to avoid duplication --->
 	
	<cfquery name="qCopyrightAuthor" datasource="#application.datasource#">
		SELECT CopyrightAuthorID
        FROM CopyrightAuthors
        WHERE Author =  '#form.Author#'
	</cfquery>
	
	<!--- If CopyrightAuthor doesnt exists create one --->
	<cfif qCopyrightAuthor.RECORDCOUNT IS 0>
    	<cfinvoke  component="mochi.cfc.CopyrightAuthors.CopyrightAuthor" method="init" returnvariable="CopyrightAuthor">
     	   <cfinvokeargument name="stValues" value="#form#"/>
		</cfinvoke>

		<cfinvoke  component="mochi.cfc.CopyrightAuthors.CopyrightAuthorGateway" method="save">
			<cfinvokeargument name="obj" value="#CopyrightAuthor#"/>
		</cfinvoke>
		
	</cfif>
		
    <cflocation url="index.cfm">
	
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>  
    <th width="149" scope="row">Copyright Author :</th>
    <td width="168"><cfinput type="text" name="Author" id="Author" required="yes" validateat="onsubmit"></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Citizenship :</th>
    <td width="168"><cfinput type="text" name="Citizenship" id="Citizenship" required="yes" validateat="onsubmit"></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Date of Birth :</th>
    <td width="168">		    	
    	<cfinput type="datefield" required="true" name="DateOfBirth" id="DateOfBirth" validateat="onSubmit" message="Date of Birth is required">
	</td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create Copyright Author"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="CopyrightAuthorid" name="CopyrightAuthorid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>