<cfcomponent output="false" alias="mochi.cfc.copyrightAuthors.CopyrightAuthor">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="CopyrightAuthorID" type="numeric" default="0">
	<cfproperty name="Author" type="string" default="">
	<cfproperty name="Citizenship" type="string" default="">
	<cfproperty name="DateOfBirth" type="date" default="">
	<cfproperty name="CreatedBy" type="string" default="">
	<cfproperty name="CreatedDate" type="date" default="">
	<cfproperty name="LastMaintainedBy" type="string" default="">
	<cfproperty name="LastMaintainedDate" type="date" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.CopyrightAuthorID = 0;
		variables.Author = "";
		variables.Citizenship = "";
		variables.DateOfBirth = "";
		variables.CreatedBy = "";
		variables.CreatedDate = "";
		variables.LastMaintainedBy = "";
		variables.LastMaintainedDate = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="CopyrightAuthor">
		<cfargument name="stValues" required="false" type="struct">
			<cfif IsDefined("arguments.stValues")>
				<cfset variables.CopyrightAuthorID=stValues.CopyrightAuthorID>
				<cfset variables.Author=stValues.Author>
				<cfset variables.Citizenship=stValues.Citizenship>
				<cfset variables.DateOfBirth=stValues.DateOfBirth>
				<cfset variables.createdby=stValues.createdby>
				<cfset variables.createddate=stValues.createddate>
				<cfset variables.lastmaintainedby=stValues.lastmaintainedby>
				<cfset variables.lastmaintaineddate=stValues.lastmaintaineddate>
			</cfif>
			<cfreturn this>
	</cffunction>
	
	<cffunction name="getCopyrightAuthorID" output="false" access="public" returntype="any">
		<cfreturn variables.CopyrightAuthorID>
	</cffunction>

	<cffunction name="setCopyrightAuthorID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CopyrightAuthorID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAuthor" output="false" access="public" returntype="any">
		<cfreturn variables.Author>
	</cffunction>

	<cffunction name="setAuthor" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Author = arguments.val>
	</cffunction>

	<cffunction name="getCitizenship" output="false" access="public" returntype="any">
		<cfreturn variables.Citizenship>
	</cffunction>

	<cffunction name="setCitizenship" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Citizenship = arguments.val>
	</cffunction>

	<cffunction name="getDateOfBirth" output="false" access="public" returntype="any">
		<cfreturn variables.DateOfBirth>
	</cffunction>

	<cffunction name="setDateOfBirth" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.DateOfBirth = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
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