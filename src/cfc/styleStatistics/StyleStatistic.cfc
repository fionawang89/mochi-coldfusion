<cfcomponent output="false" alias="mochi.cfc.styleStatistics.StyleStatistic">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="StyleStatisticID" type="numeric" default="0">
	<cfproperty name="StyleID" type="numeric" default="0">
	<cfproperty name="SalesUnits" type="numeric" default="0">
	<cfproperty name="SalesAmount" type="numeric" default="0">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.StyleStatisticID = 0;
		variables.StyleID = 0;
		variables.SalesUnits = 0;
		variables.SalesAmount = 0;
	</cfscript>

	<cffunction name="init" output="false" returntype="StyleStatistic">
		<cfargument name="stValues" required="false" type="struct">
			<cfif IsDefined("arguments.stValues")>
				<cfset variables.StyleStatisticID=stValues.StyleStatisticID>
				<cfset variables.StyleID=stValues.StyleID>
				<cfset variables.SalesUnits=stValues.SalesUnits>
				<cfset variables.SalesAmount=stValues.SalesAmount>
			</cfif>
		<cfreturn this>		
	</cffunction>
	
	
	<cffunction name="getStyleStatisticID" output="false" access="public" returntype="any">
		<cfreturn variables.StyleStatisticID>
	</cffunction>

	<cffunction name="setStyleStatisticID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.StyleStatisticID = arguments.val>
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

	<cffunction name="getSalesUnits" output="false" access="public" returntype="any">
		<cfreturn variables.SalesUnits>
	</cffunction>

	<cffunction name="setSalesUnits" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SalesUnits = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSalesAmount" output="false" access="public" returntype="any">
		<cfreturn variables.SalesAmount>
	</cffunction>

	<cffunction name="setSalesAmount" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SalesAmount = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>



</cfcomponent>