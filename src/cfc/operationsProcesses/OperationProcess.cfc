<cfcomponent output="false" alias="mochi.cfc.operationsProcesses.OperationProcess">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="OperationProcessID" type="numeric" default="0">
	<cfproperty name="ProcessID" type="numeric" default="0">
	<cfproperty name="OperationID" type="numeric" default="0">
	<cfproperty name="Sequence" type="numeric" default="0">
	<cfproperty name="Dependency" type="numeric" default="0">
	<cfproperty name="PersonInCharge" type="string" default="">
	<cfproperty name="PercentDaysToFinish" type="numeric" default="0">
	<cfproperty name="CreatedBy" type="string" default="">
	<cfproperty name="CreatedDate" type="date" default="">
	<cfproperty name="LastMaintainedBy" type="string" default="">
	<cfproperty name="LastMaintainedDate" type="date" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.OperationProcessID = 0;
		variables.ProcessID = 0;
		variables.OperationID = 0;
		variables.Sequence = 0;
		variables.Dependency = 0;
		variables.PersonInCharge = "";
		variables.PercentDaysToFinish = 0;
		variables.CreatedBy = "";
		variables.CreatedDate = "";
		variables.LastMaintainedBy = "";
		variables.LastMaintainedDate = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="OperationProcess">
		<cfargument name="stValues" required="false" type="struct">
			<cfif IsDefined("arguments.stValues")>
				<cfset variables.OperationProcessID=stValues.OperationProcessID>
				<cfset variables.ProcessID=stValues.ProcessID>
				<cfset variables.OperationID=stValues.OperationID>
				<cfset variables.Sequence=stValues.Sequence>
				<cfset variables.Dependency=stValues.Dependency>
				<cfset variables.PersonInCharge=stValues.PersonInCharge>
				<cfset variables.PercentDaysToFinish=stValues.PercentDaysToFinish>
				<cfset variables.createdby=stValues.createdby>
				<cfset variables.createddate=stValues.createddate>
				<cfset variables.lastmaintainedby=stValues.lastmaintainedby>
				<cfset variables.lastmaintaineddate=stValues.lastmaintaineddate>
			</cfif>
			<cfreturn this>
	</cffunction>
	
	
	<cffunction name="getOperationProcessID" output="false" access="public" returntype="any">
		<cfreturn variables.OperationProcessID>
	</cffunction>

	<cffunction name="setOperationProcessID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.OperationProcessID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getProcessID" output="false" access="public" returntype="any">
		<cfreturn variables.ProcessID>
	</cffunction>

	<cffunction name="setProcessID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ProcessID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getOperationID" output="false" access="public" returntype="any">
		<cfreturn variables.OperationID>
	</cffunction>

	<cffunction name="setOperationID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.OperationID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSequence" output="false" access="public" returntype="any">
		<cfreturn variables.Sequence>
	</cffunction>

	<cffunction name="setSequence" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Sequence = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDependency" output="false" access="public" returntype="any">
		<cfreturn variables.Dependency>
	</cffunction>

	<cffunction name="setDependency" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Dependency = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPersonInCharge" output="false" access="public" returntype="any">
		<cfreturn variables.PersonInCharge>
	</cffunction>

	<cffunction name="setPersonInCharge" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.PersonInCharge = arguments.val>
	</cffunction>

	<cffunction name="getPercentDaysToFinish" output="false" access="public" returntype="any">
		<cfreturn variables.PercentDaysToFinish>
	</cffunction>

	<cffunction name="setPercentDaysToFinish" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PercentDaysToFinish = arguments.val>
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