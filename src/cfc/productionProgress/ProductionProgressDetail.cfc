<cfcomponent output="false" alias="mochi.cfc.productionProgress.ProductionProgressDetail">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="ProductionProgressDetailID" type="numeric" default="0">
	<cfproperty name="ProductionProgressID" type="numeric" default="0">
	<cfproperty name="OperationProcessID" type="numeric" default="0">
	<cfproperty name="FinishedDate" type="date" default="">
	<cfproperty name="PlanDate" type="date" default="">
	<cfproperty name="ProductionDetailStatusID" type="numeric" default="0">
	<cfproperty name="Status" type="string" default="">
	<cfproperty name="Comments" type="string" default="">
	<cfproperty name="Revision" type="numeric" default="0">
	<cfproperty name="CreatedBy" type="string" default="">
	<cfproperty name="CreatedDate" type="date" default="">
	<cfproperty name="LastMaintainedBy" type="string" default="">
	<cfproperty name="LastMaintainedDate" type="date" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.ProductionProgressDetailID = 0;
		variables.ProductionProgressID = 0;
		variables.OperationProcessID = 0;
		variables.FinishedDate = "";
		variables.PlanDate = "";
		variables.ProductionDetailStatusID = 0;
		variables.Status = "";
		variables.Comments = "";
		variables.Revision = 0;
		variables.CreatedBy = "";
		variables.CreatedDate = "";
		variables.LastMaintainedBy = "";
		variables.LastMaintainedDate = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="ProductionProgressDetail">
		<cfargument name="stValues" required="false" type="struct">
			<cfif IsDefined("arguments.stValues")>
				<cfset variables.ProductionProgressDetailID=stValues.ProductionProgressDetailID>
				<cfset variables.ProductionProgressID=stValues.ProductionProgressID>
				<cfset variables.OperationProcessID=stValues.OperationProcessID>
				<cfset variables.FinishedDate=stValues.FinishedDate>
				<cfset variables.PlanDate=stValues.PlanDate>
				<cfset variables.ProductionDetailStatusID=stValues.ProductionDetailStatusID>
				<cfset variables.Status=stValues.Status>
				<cfset variables.Comments=stValues.Comments>
				<cfset variables.Revision=stValues.Revision>
				<cfset variables.createdby=stValues.createdby>
				<cfset variables.createddate=stValues.createddate>
				<cfset variables.lastmaintainedby=stValues.lastmaintainedby>
				<cfset variables.lastmaintaineddate=stValues.lastmaintaineddate>
			</cfif>
		<cfreturn this>
	</cffunction>
	<cffunction name="getProductionProgressDetailID" output="false" access="public" returntype="any">
		<cfreturn variables.ProductionProgressDetailID>
	</cffunction>

	<cffunction name="setProductionProgressDetailID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ProductionProgressDetailID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getProductionProgressID" output="false" access="public" returntype="any">
		<cfreturn variables.ProductionProgressID>
	</cffunction>

	<cffunction name="setProductionProgressID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ProductionProgressID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
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

	<cffunction name="getFinishedDate" output="false" access="public" returntype="any">
		<cfreturn variables.FinishedDate>
	</cffunction>

	<cffunction name="setFinishedDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.FinishedDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getPlanDate" output="false" access="public" returntype="any">
		<cfreturn variables.PlanDate>
	</cffunction>

	<cffunction name="setPlanDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PlanDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
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

	<cffunction name="getComments" output="false" access="public" returntype="any">
		<cfreturn variables.Comments>
	</cffunction>

	<cffunction name="setComments" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Comments = arguments.val>
	</cffunction>

	<cffunction name="getRevision" output="false" access="public" returntype="any">
		<cfreturn variables.Revision>
	</cffunction>

	<cffunction name="setRevision" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Revision = arguments.val>
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