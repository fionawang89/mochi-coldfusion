<cfcomponent output="false" alias="mochi.cfc.productionDetailStatus.ProductionDetailStatus">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="ProductionDetailStatusID" type="numeric" default="0">
	<cfproperty name="Status" type="string" default="">
	<cfproperty name="StatusCode" type="string" default="">
	<cfproperty name="Description" type="string" default="">
	<cfproperty name="OperationID" type="numeric" default="0">
	<cfproperty name="Type" type="string" default="">
	<cfproperty name="CreatedBy" type="string" default="">
	<cfproperty name="CreatedDate" type="date" default="">
	<cfproperty name="LastMaintainedBy" type="string" default="">
	<cfproperty name="LastMaintainedDate" type="date" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.ProductionDetailStatusID = 0;
		variables.Status = "";
		variables.StatusCode = "";
		variables.Description = "";
		variables.OperationID = 0;
		variables.Type = "";
		variables.CreatedBy = "";
		variables.CreatedDate = "";
		variables.LastMaintainedBy = "";
		variables.LastMaintainedDate = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="ProductionDetailStatus">
		<cfargument name="stValues" required="false" type="struct">
			<cfif IsDefined("arguments.stValues")>
				<cfset variables.ProductionDetailStatusID=stValues.ProductionDetailStatusID>
				<cfset variables.Status=stValues.Status>
				<cfset variables.StatusCode=stValues.StatusCode>
				<cfset variables.Description=stValues.description>
				<cfset variables.OperationID=stValues.OperationID>
				<cfset variables.Type=stValues.Type>
				<cfset variables.createdby=stValues.createdby>
				<cfset variables.createddate=stValues.createddate>
				<cfset variables.lastmaintainedby=stValues.lastmaintainedby>
				<cfset variables.lastmaintaineddate=stValues.lastmaintaineddate>
			</cfif>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="getProductionDetailStatusID" output="false" access="public" returntype="any">
		<cfreturn variables.ProductionDetailStatusID>
	</cffunction>

	<cffunction name="setProductionDetailStatusID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ProductionDetailStatusID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getStatus" output="false" access="public" returntype="any">
		<cfreturn variables.Status>
	</cffunction>

	<cffunction name="setStatus" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Status = arguments.val>
	</cffunction>

	<cffunction name="getStatusCode" output="false" access="public" returntype="any">
		<cfreturn variables.StatusCode>
	</cffunction>

	<cffunction name="setStatusCode" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.StatusCode = arguments.val>
	</cffunction>

	<cffunction name="getDescription" output="false" access="public" returntype="any">
		<cfreturn variables.Description>
	</cffunction>

	<cffunction name="setDescription" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Description = arguments.val>
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

	<cffunction name="getType" output="false" access="public" returntype="any">
		<cfreturn variables.Type>
	</cffunction>

	<cffunction name="setType" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Type = arguments.val>
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