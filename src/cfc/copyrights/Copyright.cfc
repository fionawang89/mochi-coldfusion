<cfcomponent output="false" alias="mochi.cfc.copyrights.Copyright">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="CopyrightID" type="numeric" default="0">
	<cfproperty name="CopyrightAuthorID" type="numeric" default="0">
	<cfproperty name="TitleOfWork" type="string" default="">
	<cfproperty name="Description" type="string" default="">
	<cfproperty name="Transfer" type="string" default="">
	<cfproperty name="YearOfCreation" type="date" default="">
	<cfproperty name="PublicationDate" type="date" default="">
	<cfproperty name="PriorRegistration" type="string" default="">
	<cfproperty name="ApplicationDate" type="date" default="">
	<cfproperty name="ApprovedDate" type="date" default="">
	<cfproperty name="RegistrationNumber" type="string" default="">
	<cfproperty name="CopyrightApplicationStatusID" type="numeric" default="0">
	<cfproperty name="CreatedBy" type="string" default="">
	<cfproperty name="CreatedDate" type="date" default="">
	<cfproperty name="LastMaintainedBy" type="string" default="">
	<cfproperty name="LastMaintainedDate" type="date" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.CopyrightID = 0;
		variables.CopyrightAuthorID = 0;
		variables.TitleOfWork = "";
		variables.Description = "";
		variables.Transfer = "";
		variables.YearOfCreation = "";
		variables.PublicationDate = "";
		variables.PriorRegistration = "";
		variables.ApplicationDate = "";
		variables.ApprovedDate = "";
		variables.RegistrationNumber = "";
		variables.CopyrightApplicationStatusID = 0;
		variables.CreatedBy = "";
		variables.CreatedDate = "";
		variables.LastMaintainedBy = "";
		variables.LastMaintainedDate = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="Copyright">
		<cfargument name="stValues" required="false" type="struct">
			<cfif IsDefined("arguments.stValues")>
				<cfset variables.CopyrightID = stValues.CopyrightID>
				<cfset variables.CopyrightAuthorID = stValues.CopyrightAuthorID>
				<cfset variables.TitleOfWork = stValues.TitleOfWork>
				<cfset variables.Description = stValues.Description>
				<cfset variables.Transfer = stValues.Transfer>
				<cfset variables.YearOfCreation = stValues.YearOfCreation>
				<cfset variables.PublicationDate = stValues.PublicationDate>
				<cfset variables.PriorRegistration = stValues.PriorRegistration>
				<cfset variables.ApplicationDate = stValues.ApplicationDate>
				<cfset variables.ApprovedDate = stValues.ApprovedDate>
				<cfset variables.RegistrationNumber = stValues.RegistrationNumber>
				<cfset variables.CopyrightApplicationStatusID = stValues.CopyrightApplicationStatusID>
				<cfset variables.CreatedBy = stValues.CreatedBy>
				<cfset variables.CreatedDate = stValues.CreatedDate>
				<cfset variables.LastMaintainedBy = stValues.LastMaintainedBy>
				<cfset variables.LastMaintainedDate = stValues.LastMaintainedDate>
			</cfif>
			<cfreturn this>
	</cffunction>
	<cffunction name="getCopyrightID" output="false" access="public" returntype="any">
		<cfreturn variables.CopyrightID>
	</cffunction>

	<cffunction name="setCopyrightID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CopyrightID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCopyrightAuthorID" output="false" access="public" returntype="any">
		<cfreturn variables.CopyrightAuthorID>
	</cffunction>

	<cffunction name="setCopyrightAuthorID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CopyrightAuthorID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTitleOfWork" output="false" access="public" returntype="any">
		<cfreturn variables.TitleOfWork>
	</cffunction>

	<cffunction name="setTitleOfWork" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.TitleOfWork = arguments.val>
	</cffunction>

	<cffunction name="getDescription" output="false" access="public" returntype="any">
		<cfreturn variables.Description>
	</cffunction>

	<cffunction name="setDescription" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Description = arguments.val>
	</cffunction>

	<cffunction name="getTransfer" output="false" access="public" returntype="any">
		<cfreturn variables.Transfer>
	</cffunction>

	<cffunction name="setTransfer" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Transfer = arguments.val>
	</cffunction>

	<cffunction name="getYearOfCreation" output="false" access="public" returntype="any">
		<cfreturn variables.YearOfCreation>
	</cffunction>

	<cffunction name="setYearOfCreation" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.YearOfCreation = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getPublicationDate" output="false" access="public" returntype="any">
		<cfreturn variables.PublicationDate>
	</cffunction>

	<cffunction name="setPublicationDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PublicationDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getPriorRegistration" output="false" access="public" returntype="any">
		<cfreturn variables.PriorRegistration>
	</cffunction>

	<cffunction name="setPriorRegistration" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.PriorRegistration = arguments.val>
	</cffunction>

	<cffunction name="getApplicationDate" output="false" access="public" returntype="any">
		<cfreturn variables.ApplicationDate>
	</cffunction>

	<cffunction name="setApplicationDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ApplicationDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
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

	<cffunction name="getRegistrationNumber" output="false" access="public" returntype="any">
		<cfreturn variables.RegistrationNumber>
	</cffunction>

	<cffunction name="setRegistrationNumber" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.RegistrationNumber = arguments.val>
	</cffunction>

	<cffunction name="getCopyrightApplicationStatusID" output="false" access="public" returntype="any">
		<cfreturn variables.CopyrightApplicationStatusID>
	</cffunction>

	<cffunction name="setCopyrightApplicationStatusID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CopyrightApplicationStatusID = arguments.val>
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