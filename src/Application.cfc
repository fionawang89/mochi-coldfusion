<cfcomponent>

	<!--- Turn on session management --->
	<cfset this.sessionManagement=true>
    <cfset this.sessionTimeout=#CreateTimeSpan(0,0,30,0)#>
        
	<cffunction name="onRequestStart" access="public" returntype="void">

    	<cfscript>
			SetEncoding("form","utf-8");
			SetEncoding("url","utf-8"); 
		</cfscript>


		<cfif NOT IsDefined("application.datasource") OR application.datasource NEQ "Mochi">
        	<!--- datasource --->
        	<cfset application.datasource="Mochi">
        </cfif>

		<cflogin>

			<cfif IsDefined("form.email")>
            	<cfquery datasource="#application.datasource#"
                	name="qUser">
                    SELECT * FROM Users
                    WHERE Email = '#form.email#' AND
                    	Password = '#form.password#'
                </cfquery>
                <cfif qUser.RecordCount IS 1>
                	<cfloginuser name="#qUser.FirstName# #qUser.LastName#"
                    	password="#form.password#"
                        roles="#qUser.Roles#">
                <cfelse>
                    <cfinclude template="login/loginform.cfm">
                    <cfabort>
                </cfif>
            <cfelse>
                <cfinclude template="login/loginform.cfm">
                <cfabort>
            </cfif>

            
        </cflogin>

        
	</cffunction>
</cfcomponent>