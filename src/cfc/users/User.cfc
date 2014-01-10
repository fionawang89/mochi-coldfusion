<cfcomponent output="false" alias="mochi.cfc.users.User">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="UserID" type="numeric" default="0">
	<cfproperty name="FirstName" type="string" default="">
	<cfproperty name="LastName" type="string" default="">
	<cfproperty name="Email" type="string" default="">
	<cfproperty name="Password" type="string" default="">
	<cfproperty name="Roles" type="string" default="">
	<cfproperty name="CreatedBy" type="string" default="">
	<cfproperty name="CreatedDate" type="date" default="">
	<cfproperty name="LastMaintainedBy" type="string" default="">
	<cfproperty name="LastMaintainedDate" type="date" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.UserID = 0;
		variables.FirstName = "";
		variables.LastName = "";
		variables.Email = "";
		variables.Password = "";
		variables.Roles = "";
		variables.CreatedBy = "";
		variables.CreatedDate = "";
		variables.LastMaintainedBy = "";
		variables.LastMaintainedDate = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="User">
		<cfargument name="stValues" required="false" type="struct">
			<cfif IsDefined("arguments.stValues")>
				<cfset variables.UserID=stValues.userid>
				<cfset variables.FirstName=stValues.firstname>
				<cfset variables.LastName=stValues.lastname>
				<cfset variables.Email=stValues.email>
				<cfset variables.Password=stValues.password>
				<cfset variables.Roles=stValues.roles>
				<cfset variables.createdby =stValues.createdby>
				<cfset variables.lastmaintainedby=stValues.lastmaintainedby>
			</cfif>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="getUserID" output="false" access="public" returntype="any">
		<cfreturn variables.UserID>
	</cffunction>

	<cffunction name="setUserID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.UserID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getFirstName" output="false" access="public" returntype="any">
		<cfreturn variables.FirstName>
	</cffunction>

	<cffunction name="setFirstName" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.FirstName = arguments.val>
	</cffunction>

	<cffunction name="getLastName" output="false" access="public" returntype="any">
		<cfreturn variables.LastName>
	</cffunction>

	<cffunction name="setLastName" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LastName = arguments.val>
	</cffunction>

	<cffunction name="getEmail" output="false" access="public" returntype="any">
		<cfreturn variables.Email>
	</cffunction>

	<cffunction name="setEmail" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Email = arguments.val>
	</cffunction>

	<cffunction name="getPassword" output="false" access="public" returntype="any">
		<cfreturn variables.Password>
	</cffunction>

	<cffunction name="setPassword" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Password = arguments.val>
	</cffunction>

	<cffunction name="getRoles" output="false" access="public" returntype="any">
		<cfreturn variables.Roles>
	</cffunction>

	<cffunction name="setRoles" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Roles = arguments.val>
	</cffunction>

	<cffunction name="getCreatedBy" output="false" access="public" returntype="any">
		<cfreturn variables.CreatedBy>
	</cffunction>

	<cffunction name="setCreatedBy" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CreatedBy = arguments.val>
	</cffunction>

	<cffunction name="getCreatedDate" output="false" access="public" returntype="any">
		<cfreturn variables.CreatedDate>
	</cffunction>

	<cffunction name="setCreatedDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CreatedDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getLastMaintainedBy" output="false" access="public" returntype="any">
		<cfreturn variables.LastMaintainedBy>
	</cffunction>

	<cffunction name="setLastMaintainedBy" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LastMaintainedBy = arguments.val>
	</cffunction>

	<cffunction name="getLastMaintainedDate" output="false" access="public" returntype="any">
		<cfreturn variables.LastMaintainedDate>
	</cffunction>

	<cffunction name="setLastMaintainedDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.LastMaintainedDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>



</cfcomponent>