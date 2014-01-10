<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.collectionid")>
	<cfinvoke  component="mochi.cfc.collections.Collection" method="init" returnvariable="collection">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.collections.CollectionGateway" method="save">
		<cfinvokeargument name="obj" value="#collection#"/>
	</cfinvoke>

    <cflocation url="index.cfm">
    
<cfelseif IsDefined("url.collectionid")>

	<cfinvoke  component="mochi.cfc.collections.CollectionGateway" method="getById" returnvariable="collection">
		<cfinvokeargument name="id" value="#url.collectionid#"/>
	</cfinvoke>


</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Collection :</th>
    <td width="168"><cfinput type="text" name="collection" id="collection"
            		 value="#collection.getcollection()#">
    </td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Collection"></td>
  </tr>
</table>
	<cfinput type="hidden" name="collectionid" value="#collection.getcollectionid()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#collection.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>