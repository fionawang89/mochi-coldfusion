<cfcomponent output="false" alias="mochi.cfc.productionProgress.ProductionProgressHeader">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="ProductionProgressID" type="numeric" default="0">
	<cfproperty name="CompanyNumber" type="numeric" default="0">
	<cfproperty name="CutNumber" type="numeric" default="0">
	<cfproperty name="Style" type="string" default="">
	<cfproperty name="Color" type="string" default="">
	<cfproperty name="IssueDate" type="date" default="">
	<cfproperty name="DueDate" type="date" default="">
	<cfproperty name="Issued" type="numeric" default="0">
	<cfproperty name="TotalWorkDays" type="numeric" default="0">
	<cfproperty name="Contractor" type="string" default="">
	<cfproperty name="Status" type="numeric" default="0">
	<cfproperty name="Comments" type="string" default="">
	<cfproperty name="CreatedBy" type="string" default="">
	<cfproperty name="CreatedDate" type="date" default="">
	<cfproperty name="LastMaintainedBy" type="string" default="">
	<cfproperty name="LastMaintainedDate" type="date" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.ProductionProgressID = 0;
		variables.CompanyNumber = 0;
		variables.CutNumber = 0;
		variables.Style = "";
		variables.Color = "";
		variables.IssueDate = "";
		variables.DueDate = "";
		variables.Issued = 0;
		variables.TotalWorkDays = 0;
		variables.Contractor = "";
		variables.Status = 0;
		variables.Comments = "";
		variables.CreatedBy = "";
		variables.CreatedDate = "";
		variables.LastMaintainedBy = "";
		variables.LastMaintainedDate = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="ProductionProgressHeader">
		<cfargument name="stValues" required="false" type="struct">
			<cfif IsDefined("arguments.stValues")>
				<cfset variables.ProductionProgressID=stValues.ProductionProgressID>
				<cfset variables.CompanyNumber=stValues.CompanyNumber>
				<cfset variables.CutNumber=stValues.CutNumber>
				<cfset variables.Style=stValues.Style>
				<cfset variables.Color=stValues.Color>
				<cfset variables.IssueDate=stValues.IssueDate>
				<cfset variables.DueDate=stValues.DueDate>
				<cfset variables.Issued=stValues.Issued>
				<cfset variables.TotalWorkDays=stValues.TotalWorkDays>
				<cfset variables.Contractor=stValues.Contractor>
				<cfset variables.Status=stValues.Status>
				<cfset variables.Comments=stValues.Comments>
				<cfset variables.createdby=stValues.createdby>
				<cfset variables.createddate=stValues.createddate>
				<cfset variables.lastmaintainedby=stValues.lastmaintainedby>
				<cfset variables.lastmaintaineddate=stValues.lastmaintaineddate>
			</cfif>
		<cfreturn this>
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

	<cffunction name="getCompanyNumber" output="false" access="public" returntype="any">
		<cfreturn variables.CompanyNumber>
	</cffunction>

	<cffunction name="setCompanyNumber" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CompanyNumber = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCutNumber" output="false" access="public" returntype="any">
		<cfreturn variables.CutNumber>
	</cffunction>

	<cffunction name="setCutNumber" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CutNumber = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getStyle" output="false" access="public" returntype="any">
		<cfreturn variables.Style>
	</cffunction>

	<cffunction name="setStyle" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Style = arguments.val>
	</cffunction>

	<cffunction name="getColor" output="false" access="public" returntype="any">
		<cfreturn variables.Color>
	</cffunction>

	<cffunction name="setColor" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Color = arguments.val>
	</cffunction>

	<cffunction name="getIssueDate" output="false" access="public" returntype="any">
		<cfreturn variables.IssueDate>
	</cffunction>

	<cffunction name="setIssueDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.IssueDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getDueDate" output="false" access="public" returntype="any">
		<cfreturn variables.DueDate>
	</cffunction>

	<cffunction name="setDueDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.DueDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getIssued" output="false" access="public" returntype="any">
		<cfreturn variables.Issued>
	</cffunction>

	<cffunction name="setIssued" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Issued = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTotalWorkDays" output="false" access="public" returntype="any">
		<cfreturn variables.TotalWorkDays>
	</cffunction>

	<cffunction name="setTotalWorkDays" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TotalWorkDays = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getContractor" output="false" access="public" returntype="any">
		<cfreturn variables.Contractor>
	</cffunction>

	<cffunction name="setContractor" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Contractor = arguments.val>
	</cffunction>

	<cffunction name="getStatus" output="false" access="public" returntype="any">
		<cfreturn variables.Status>
	</cffunction>

	<cffunction name="setStatus" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Status = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getComments" output="false" access="public" returntype="any">
		<cfreturn variables.Comments>
	</cffunction>

	<cffunction name="setComments" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Comments = arguments.val>
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