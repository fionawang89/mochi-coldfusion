<cfcomponent output="false" alias="mochi.cfc.styleAttributeValues.StyleAttributeValue">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="StyleAttributeValueID" type="numeric" default="0">
	<cfproperty name="StyleAttributeOptionID" type="numeric" default="0">
	<cfproperty name="StyleID" type="numeric" default="0">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.StyleAttributeValueID = 0;
		variables.StyleAttributeOptionID = 0;
		variables.StyleID = 0;
	</cfscript>

	<cffunction name="init" output="false" returntype="StyleAttributeValue">
		<cfargument name="stValues" required="false" type="struct">
			<cfif IsDefined("arguments.stValues")>
				<cfset variables.StyleAttributeValueID=stValues.StyleAttributeValueID>
				<cfset variables.StyleAttributeOptionID=stValues.StyleAttributeOptionID>
				<cfset variables.StyleID=stValues.StyleID>
			</cfif>
		<cfreturn this>		
	</cffunction>
	
	<cffunction name="getStyleAttributeValueID" output="false" access="public" returntype="any">
		<cfreturn variables.StyleAttributeValueID>
	</cffunction>

	<cffunction name="setStyleAttributeValueID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.StyleAttributeValueID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getStyleAttributeOptionID" output="false" access="public" returntype="any">
		<cfreturn variables.StyleAttributeOptionID>
	</cffunction>

	<cffunction name="setStyleAttributeOptionID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.StyleAttributeOptionID = arguments.val>
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