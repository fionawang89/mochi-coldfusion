<cfinclude template="../shared/header.cfm">

<cfif IsDefined("form.userid")>
	<cfset user=CreateObject("component", "mochi.cfc.users.User").init(form)>
	<cfinvoke component="mochi.cfc.users.UserGateway" method="save"> 
		<cfinvokeargument name="obj" value="#user#"/>
	</cfinvoke>
	<cflocation url="show.cfm?userid=#form.userid#">
<cfelseif IsDefined("url.userid")>
	<cfinvoke component="mochi.cfc.users.UserGateway" method="getById" returnvariable="user"> 
		<cfinvokeargument name="id" value="#url.userid#"/>
	</cfinvoke>
<cfelse>
	<cflocation url="index.cfm">    
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">First Name :</th>
    <td width="168"><cfinput type="text" name="firstname" id="firstname"
            		 value="#user.getFirstName()#">
    </td>
  </tr>
  <tr>
    <th scope="row">Last Name :</th>
    <td><cfinput type="text" name="lastname" id="lastname"
        			 value="#user.getLastName()#"></td>
  </tr>
  <tr>
    <th scope="row">E-Mail Address :</th>
    <td><cfinput type="text" name="email" id="email"
        			 value="#user.getEmail()#"></td>
  </tr>
  <tr>
    <th scope="row">Password :</th>
    <td><cfinput type="password" name="password" id="password"
        			 value="#user.getPassword()#"></td>
  </tr>
  <tr>
    <th scope="row">Roles :</th>
    <td><cfinput type="text" name="roles" id="roles"
        			 value="#user.getRoles()#"></td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update User"></td>
  </tr>
</table>
  
	<!--- Timestamps for tracking who did what and when --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#user.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    
	<cfinput type="hidden" name="userid" value="#user.getUserID()#">

</cfform>