<cfcomponent output="false" alias="mochi.cfc.fabricLabDips.FabricLabDip">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="FabricLabDipID" type="numeric" default="0">
	<cfproperty name="FabricRequestID" type="numeric" default="0">
	<cfproperty name="LabDipSubmit" type="numeric" default="0">
	<cfproperty name="SubmitBy" type="string" default="">
	<cfproperty name="SubmitDate" type="date" default="">
	<cfproperty name="ReceivedBy" type="string" default="">
	<cfproperty name="ReceivedDate" type="date" default="">
	<cfproperty name="ApprovedBy" type="string" default="">
	<cfproperty name="ApprovedDate" type="date" default="">
	<cfproperty name="FabricLabDipStatusID" type="numeric" default="0">
	<cfproperty name="Comments" type="string" default="">
	<cfproperty name="CreatedBy" type="string" default="">
	<cfproperty name="CreatedDate" type="date" default="">
	<cfproperty name="LastMaintainedBy" type="string" default="">
	<cfproperty name="LastMaintainedDate" type="date" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.FabricLabDipID = 0;
		variables.FabricRequestID = 0;
		variables.LabDipSubmit = 0;
		variables.SubmitBy = "";
		variables.SubmitDate = "";
		variables.ReceivedBy = "";
		variables.ReceivedDate = "";
		variables.ApprovedBy = "";
		variables.ApprovedDate = "";
		variables.FabricLabDipStatusID = 0;
		variables.Comments = "";
		variables.CreatedBy = "";
		variables.CreatedDate = "";
		variables.LastMaintainedBy = "";
		variables.LastMaintainedDate = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="FabricLabDip">
		<cfargument name="stValues" required="false" type="struct">
			<cfif IsDefined("arguments.stValues")>
				<cfset variables.FabricLabDipID=stValues.FabricLabDipID>
				<cfset variables.FabricRequestID=stValues.FabricRequestID>
				<cfset variables.LabDipSubmit=stValues.LabDipSubmit>
				<cfset variables.SubmitBy=stValues.SubmitBy>
				<cfset variables.SubmitDate=stValues.SubmitDate>
				<cfset variables.ReceivedBy =stValues.ReceivedBy>
				<cfset variables.ReceivedDate=stValues.ReceivedDate>				
				<cfset variables.ApprovedBy=stValues.ApprovedBy>				
				<cfset variables.ApprovedDate=stValues.ApprovedDate>				
				<cfset variables.FabricLabDipStatusID=stValues.FabricLabDipStatusID>
				<cfset variables.Comments=stValues.Comments>
				<cfset variables.CreatedBy=stValues.CreatedBy>
				<cfset variables.CreatedDate=stValues.CreatedDate>
				<cfset variables.LastMaintainedBy=stValues.LastMaintainedBy>
				<cfset variables.LastMaintainedDate=stValues.LastMaintainedDate>
			</cfif>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="getFabricLabDipID" output="false" access="public" returntype="any">
		<cfreturn variables.FabricLabDipID>
	</cffunction>

	<cffunction name="setFabricLabDipID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.FabricLabDipID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getFabricRequestID" output="false" access="public" returntype="any">
		<cfreturn variables.FabricRequestID>
	</cffunction>

	<cffunction name="setFabricRequestID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.FabricRequestID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLabDipSubmit" output="false" access="public" returntype="any">
		<cfreturn variables.LabDipSubmit>
	</cffunction>

	<cffunction name="setLabDipSubmit" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.LabDipSubmit = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSubmitBy" output="false" access="public" returntype="any">
		<cfreturn variables.SubmitBy>
	</cffunction>

	<cffunction name="setSubmitBy" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SubmitBy = arguments.val>
	</cffunction>

	<cffunction name="getSubmitDate" output="false" access="public" returntype="any">
		<cfreturn variables.SubmitDate>
	</cffunction>

	<cffunction name="setSubmitDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SubmitDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getReceivedBy" output="false" access="public" returntype="any">
		<cfreturn variables.ReceivedBy>
	</cffunction>

	<cffunction name="setReceivedBy" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ReceivedBy = arguments.val>
	</cffunction>

	<cffunction name="getReceivedDate" output="false" access="public" returntype="any">
		<cfreturn variables.ReceivedDate>
	</cffunction>

	<cffunction name="setReceivedDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ReceivedDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getApprovedBy" output="false" access="public" returntype="any">
		<cfreturn variables.ApprovedBy>
	</cffunction>

	<cffunction name="setApprovedBy" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ApprovedBy = arguments.val>
	</cffunction>

	<cffunction name="getApprovedDate" output="false" access="public" returntype="any">
		<cfreturn variables.ApprovedDate>
	</cffunction>

	<cffunction name="setApprovedDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ApprovedDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getFabricLabDipStatusID" output="false" access="public" returntype="any">
		<cfreturn variables.FabricLabDipStatusID>
	</cffunction>

	<cffunction name="setFabricLabDipStatusID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.FabricLabDipStatusID = arguments.val>
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