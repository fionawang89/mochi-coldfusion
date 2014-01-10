<cfcomponent output="false" alias="mochi.cfc.sampleTypes.SampleType">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="SampleTypeID" type="numeric" default="0">
	<cfproperty name="SampleType" type="string" default="">
	<cfproperty name="Description" type="string" default="">
	<cfproperty name="CreatedBy" type="string" default="">
	<cfproperty name="CreatedDate" type="date" default="">
	<cfproperty name="LastMaintainedBy" type="string" default="">
	<cfproperty name="LastMaintainedDate" type="date" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.SampleTypeID = 0;
		variables.SampleType = "";
		variables.Description = "";
		variables.CreatedBy = "";
		variables.CreatedDate = "";
		variables.LastMaintainedBy = "";
		variables.LastMaintainedDate = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="SampleType">
		<cfargument name="stValues" required="false" type="struct">
			<cfif IsDefined("arguments.stValues")>
				<cfset variables.SampleTypeID=stValues.SampleTypeID>
				<cfset variables.SampleType=stValues.SampleType>
				<cfset variables.Description=stValues.description>
				<cfset variables.createdby=stValues.createdby>
				<cfset variables.createddate=stValues.createddate>
				<cfset variables.lastmaintainedby=stValues.lastmaintainedby>
				<cfset variables.lastmaintaineddate=stValues.lastmaintaineddate>
			</cfif>
			<cfreturn this>
	</cffunction>
	
	
	<cffunction name="getSampleTypeID" output="false" access="public" returntype="any">
		<cfreturn variables.SampleTypeID>
	</cffunction>

	<cffunction name="setSampleTypeID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SampleTypeID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSampleType" output="false" access="public" returntype="any">
		<cfreturn variables.SampleType>
	</cffunction>

	<cffunction name="setSampleType" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SampleType = arguments.val>
	</cffunction>

	<cffunction name="getDescription" output="false" access="public" returntype="any">
		<cfreturn variables.Description>
	</cffunction>

	<cffunction name="setDescription" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Description = arguments.val>
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