<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.collection")>
	<!--- Check if collection already exist in the system to avoid duplication --->
 	
	<cfquery name="qcollection" datasource="#application.datasource#">
		SELECT collectionID
        FROM collections
        WHERE collection =  '#form.collection#'
	</cfquery>
	
	<!--- If collection doesnt exists create one --->
	<cfif qcollection.RECORDCOUNT IS 0>
    	<cfinvoke  component="mochi.cfc.collections.collection" method="init" returnvariable="collection">
     	   <cfinvokeargument name="stValues" value="#form#"/>
		</cfinvoke>

		<cfinvoke  component="mochi.cfc.collections.collectionGateway" method="save">
			<cfinvokeargument name="obj" value="#collection#"/>
		</cfinvoke>
		
	</cfif>
		
    <cflocation url="index.cfm">
	
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>  
    <th width="149" scope="row">Collection :</th>
    <td width="168"><cfinput type="text" name="collection" id="collection" required="yes" validateat="onsubmit"></td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create collection"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="collectionid" name="collectionid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>