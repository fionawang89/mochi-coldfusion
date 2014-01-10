<cfcomponent output="false" alias="mochi.cfc.styleAttributeSearchIndex.StyleAttributeSearchIndex">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="StyleAttributeSearchIndexID" type="numeric" default="0">
	<cfproperty name="StyleID" type="numeric" default="0">
	<cfproperty name="Hits" type="numeric" default="0">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.StyleAttributeSearchIndexID = 0;
		variables.StyleID = 0;
		variables.Hits = 0;
	</cfscript>

	<cffunction name="init" output="false" returntype="StyleAttributeSearchIndex">
		<cfargument name="stValues" required="false" type="struct">
			<cfif IsDefined("arguments.stValues")>
				<cfset variables.StyleAttributeSearchIndexID=stValues.StyleAttributeSearchIndexID>
				<cfset variables.StyleID=stValues.StyleID>
				<cfset variables.Hits=stValues.Hits>
			</cfif>
		<cfreturn this>				
	</cffunction>
	
	<cffunction name="getStyleAttributeSearchIndexID" output="false" access="public" returntype="any">
		<cfreturn variables.StyleAttributeSearchIndexID>
	</cffunction>

	<cffunction name="setStyleAttributeSearchIndexID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.StyleAttributeSearchIndexID = arguments.val>
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

	<cffunction name="getHits" output="false" access="public" returntype="any">
		<cfreturn variables.Hits>
	</cffunction>

	<cffunction name="setHits" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Hits = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>



</cfcomponent>