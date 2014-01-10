<cfcomponent output="false" alias="mochi.cfc.copyrightsStyles.CopyrightStyle">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="CopyrightsStylesID" type="numeric" default="0">
	<cfproperty name="CopyrightID" type="numeric" default="0">
	<cfproperty name="StyleID" type="numeric" default="0">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.CopyrightsStylesID = 0;
		variables.CopyrightID = 0;
		variables.StyleID = 0;
	</cfscript>

	<cffunction name="init" output="false" returntype="CopyrightStyle">
		<cfargument name="stValues" required="true" type="struct">
			<cfif IsDefined("arguments.stValues")>
				<cfset variables.CopyrightsStylesID = stValues.CopyrightsStylesID>
				<cfset variables.CopyrightID = stValues.CopyrightID>
				<cfset variables.StyleID = stValues.StyleID>
			</cfif>
			<cfreturn this>
	</cffunction>
	
	
	<cffunction name="getCopyrightsStylesID" output="false" access="public" returntype="any">
		<cfreturn variables.CopyrightsStylesID>
	</cffunction>

	<cffunction name="setCopyrightsStylesID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CopyrightsStylesID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCopyrightID" output="false" access="public" returntype="any">
		<cfreturn variables.CopyrightID>
	</cffunction>

	<cffunction name="setCopyrightID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CopyrightID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getStyleID" output="false" access="public" returntype="any">
		<cfreturn variables.StyleID>
	</cffunction>

	<cffunction name="setStyleID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.StyleID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>



</cfcomponent>