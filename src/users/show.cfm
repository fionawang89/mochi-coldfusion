<cfinclude template="../shared/header.cfm">

<cfif IsDefined("url.userid")>
 <cfinvoke component="mochi.cfc.users.UserGateway" method="getById" returnvariable="user"> 
		<cfinvokeargument name="id" value="#url.userid#"/>
 </cfinvoke>
 <table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">First Name :</th>
    <td width="168"><cfoutput>#user.getFirstName()#</cfoutput></td>
  </tr>
  <tr>
    <th scope="row">Last Name :</th>
    <td><cfoutput>#user.getLastName()#</cfoutput></td>
  </tr>
  <tr>
    <th scope="row">E-Mail Address :</th>
    <td><cfoutput>#user.getEmail()#</cfoutput></td>
  </tr>
  <tr>
    <th scope="row">Roles :</th>
    <td><cfoutput>#user.getRoles()#</cfoutput></td>
  </tr>
</table>
</cfif>