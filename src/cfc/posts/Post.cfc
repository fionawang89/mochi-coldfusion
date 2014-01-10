<cfcomponent output="false" alias="mochi.cfc.posts.Post">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="PostID" type="numeric" default="0">
	<cfproperty name="Subject" type="string" default="">
	<cfproperty name="Post" type="string" default="">
	<cfproperty name="Done" type="numeric" default="0">
	<cfproperty name="CreatedBy" type="string" default="">
	<cfproperty name="CreatedDate" type="date" default="">
	<cfproperty name="LastMaintainedBy" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.PostID = 0;
		variables.Subject = "";
		variables.Post = "";
		variables.Done = 0;
		variables.CreatedBy = "";
		variables.CreatedDate = "";
		variables.LastMaintainedBy = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="Post">
		<cfargument name="stValues" required="false" type="struct">
			<cfif IsDefined("arguments.stValues")>
				<cfset variables.PostID=stValues.PostID>
				<cfset variables.Subject =stValues.Subject>
				<cfset variables.Post =stValues.Post>
				<cfset variables.Done =stValues.Done>
				<cfset variables.createdby=stValues.createdby>
				<cfset variables.createddate=stValues.createddate>
				<cfset variables.lastmaintainedby=stValues.lastmaintainedby>
				<cfset variables.lastmaintaineddate=stValues.lastmaintaineddate>
			</cfif>
			<cfreturn this>
	</cffunction>
	
	
	<cffunction name="getPostID" output="false" access="public" returntype="any">
		<cfreturn variables.PostID>
	</cffunction>

	<cffunction name="setPostID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PostID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSubject" output="false" access="public" returntype="any">
		<cfreturn variables.Subject>
	</cffunction>

	<cffunction name="setSubject" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Subject = arguments.val>
	</cffunction>

	<cffunction name="getPost" output="false" access="public" returntype="any">
		<cfreturn variables.Post>
	</cffunction>

	<cffunction name="setPost" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Post = arguments.val>
	</cffunction>

	<cffunction name="getDone" output="false" access="public" returntype="any">
		<cfreturn variables.Done>
	</cffunction>

	<cffunction name="setDone" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Done = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
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



</cfcomponent>