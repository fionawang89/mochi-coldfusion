<cfinclude template="../shared/header.cfm"/>

<cfif IsUserInRole("admin")>
	<cfif IsDefined("form.userid")>
        <cfinvoke component="tracker.components.users.UserGateway" method="deleteById"> 
                <cfinvokeargument name="id" value="#form.userid#"/>
        </cfinvoke>
        <cflocation url="index.cfm">
    <cfelseif IsDefined("url.userid")>
        <cfinvoke component="tracker.components.users.UserGateway" method="getById" returnvariable="user"> 
                <cfinvokeargument name="id" value="#url.userid#"/>
        </cfinvoke>
    <cfelse>
        <cflocation url="index.cfm">
    </cfif>
    
    <cfform>
    
        <cfoutput>Are you sure you want to delete #user.getFirstName()# #user.getLastName()#?</cfoutput>		
        
         <cfinput type="hidden" name="userid" value="#user.getUserID()#">
         <cfinput type="submit" name="submit" value="Delete User">
    
    </cfform>
<cfelse>
	<h4>Access Denied</h4>
</cfif>