<cfcomponent output="false" alias="mochi.cfc.styles.Style">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="StyleID" type="numeric" default="0">
	<cfproperty name="EntityTypeID" type="numeric" default="0">
	<cfproperty name="StyleName" type="string" default="">
	<cfproperty name="Description" type="string" default="">
	<cfproperty name="ProductionTeamLeader" type="string" default="">
	<cfproperty name="ProductionPatternMaker" type="string" default="">
	<cfproperty name="FirstPatternMaker" type="string" default="">
	<cfproperty name="CareInformation" type="string" default="">
	<cfproperty name="PatternDifficulty" type="string" default="">
	<cfproperty name="PatternReference" type="string" default="">
	<cfproperty name="CreatedBy" type="string" default="">
	<cfproperty name="CreatedDate" type="date" default="">
	<cfproperty name="LastMaintainedBy" type="string" default="">
	<cfproperty name="LastMaintainedDate" type="date" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.StyleID = 0;
		variables.EntityTypeID = 0;
		variables.StyleName = "";
		variables.Description = "";
		variables.ProductionTeamLeader = "";
		variables.ProductionPatternMaker = "";
		variables.FirstPatternMaker = "";
		variables.CareInformation = "";
		variables.PatternDifficulty = "";
		variables.PatternReference = "";
		variables.CreatedBy = "";
		variables.CreatedDate = "";
		variables.LastMaintainedBy = "";
		variables.LastMaintainedDate = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="Style">
		<cfargument name="stValues" required="false" type="struct">
			<cfif IsDefined("arguments.stValues")>
				<cfset variables.StyleID=stValues.StyleID>
				<cfset variables.EntityTypeID=2>
				<cfset variables.StyleName=stValues.StyleName>
				<cfset variables.Description=stValues.Description>
				<cfset variables.ProductionTeamLeader=stValues.ProductionTeamLeader>
				<cfset variables.ProductionPatternMaker=stValues.ProductionPatternMaker>
				<cfset variables.FirstPatternMaker=stValues.FirstPatternMaker>
				<cfset variables.CareInformation=stValues.CareInformation>
				<cfset variables.PatternDifficulty=stValues.PatternDifficulty>
				<cfset variables.PatternReference=stValues.PatternReference>
				<cfset variables.CreatedBy=stValues.CreatedBy>
				<cfset variables.CreatedDate=stValues.CreatedDate>
				<cfset variables.LastMaintainedBy=stValues.LastMaintainedBy>
				<cfset variables.LastMaintainedDate=stValues.LastMaintainedDate>
			</cfif>
		<cfreturn this>	
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

	<cffunction name="getEntityTypeID" output="false" access="public" returntype="any">
		<cfreturn variables.EntityTypeID>
	</cffunction>

	<cffunction name="setEntityTypeID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.EntityTypeID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getStyleName" output="false" access="public" returntype="any">
		<cfreturn variables.StyleName>
	</cffunction>

	<cffunction name="setStyleName" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.StyleName = arguments.val>
	</cffunction>

	<cffunction name="getDescription" output="false" access="public" returntype="any">
		<cfreturn variables.Description>
	</cffunction>

	<cffunction name="setDescription" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Description = arguments.val>
	</cffunction>

	<cffunction name="getProductionTeamLeader" output="false" access="public" returntype="any">
		<cfreturn variables.ProductionTeamLeader>
	</cffunction>

	<cffunction name="setProductionTeamLeader" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ProductionTeamLeader = arguments.val>
	</cffunction>

	<cffunction name="getProductionPatternMaker" output="false" access="public" returntype="any">
		<cfreturn variables.ProductionPatternMaker>
	</cffunction>

	<cffunction name="setProductionPatternMaker" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ProductionPatternMaker = arguments.val>
	</cffunction>

	<cffunction name="getFirstPatternMaker" output="false" access="public" returntype="any">
		<cfreturn variables.FirstPatternMaker>
	</cffunction>

	<cffunction name="setFirstPatternMaker" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.FirstPatternMaker = arguments.val>
	</cffunction>

	<cffunction name="getCareInformation" output="false" access="public" returntype="any">
		<cfreturn variables.CareInformation>
	</cffunction>

	<cffunction name="setCareInformation" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CareInformation = arguments.val>
	</cffunction>

	<cffunction name="getPatternDifficulty" output="false" access="public" returntype="any">
		<cfreturn variables.PatternDifficulty>
	</cffunction>

	<cffunction name="setPatternDifficulty" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.PatternDifficulty = arguments.val>
	</cffunction>

	<cffunction name="getPatternReference" output="false" access="public" returntype="any">
		<cfreturn variables.PatternReference>
	</cffunction>

	<cffunction name="setPatternReference" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.PatternReference = arguments.val>
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