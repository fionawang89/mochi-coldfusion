<cfinclude template="../shared/header.cfm">

<cfif IsDefined("form.styleid")>
	<cfset style=CreateObject("component", "mochi.cfc.styles.Style").init(form)>
	<cfinvoke component="mochi.cfc.styles.StyleGateway" method="save"> 
		<cfinvokeargument name="obj" value="#style#"/>
	</cfinvoke>
	<cflocation url="show.cfm?styleid=#form.styleid#">
<cfelseif IsDefined("url.styleid")>
	<cfinvoke component="mochi.cfc.styles.StyleGateway" method="getById" returnvariable="style"> 
		<cfinvokeargument name="id" value="#url.styleid#"/>
	</cfinvoke>
<cfelse>
	<cflocation url="index.cfm">    
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Style Name :</th>
    <td width="168"><cfinput type="text" name="stylename" id="stylename"
            		 value="#style.getStyleName()#">
    </td>
  </tr>
  <tr>
    <th scope="row">Description :</th>
    <td><cfinput type="text" name="description" id="description"
        			 value="#style.getDescription()#"></td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Style"></td>
  </tr>
</table>
  

	<cfinput type="hidden" name="styleid" value="#style.getStyleID()#">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#style.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>