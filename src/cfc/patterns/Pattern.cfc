<cfcomponent output="false" alias="mochi.cfc.patterns.Pattern">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="PatternID" type="numeric" default="0">
	<cfproperty name="FittingID" type="numeric" default="0">
	<cfproperty name="Description" type="string" default="">
	<cfproperty name="DueDate" type="date" default="">
	<cfproperty name="PatternPriorityID" type="numeric" default="0">
	<cfproperty name="PatternStatusID" type="numeric" default="0">
	<cfproperty name="Approved" type="numeric" default="0">
	<cfproperty name="ApprovedBy" type="string" default="">
	<cfproperty name="ApprovedWhen" type="date" default="">
	<cfproperty name="Location" type="string" default="">
	<cfproperty name="URL" type="string" default="">
	<cfproperty name="ContentType" type="string" default="">
	<cfproperty name="File" type="string" default="">
	<cfproperty name="FileName" type="string" default="">
	<cfproperty name="FileExtension" type="string" default="">
	<cfproperty name="FileSize" type="numeric" default="0">
	<cfproperty name="CreatedDate" type="date" default="">
	<cfproperty name="CreatedBy" type="string" default="">
	<cfproperty name="LastMaintainedDate" type="date" default="">
	<cfproperty name="LastMaintainedBy" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.PatternID = 0;
		variables.FittingID = 0;
		variables.Description = "";
		variables.DueDate = "";
		variables.PatternPriorityID = 0;
		variables.PatternStatusID = 0;
		variables.Approved = 0;
		variables.ApprovedBy = "";
		variables.ApprovedWhen = "";
		variables.Location = "";
		variables.URL = "";
		variables.ContentType = "";
		variables.File = "";
		variables.FileName = "";
		variables.FileExtension = "";
		variables.FileSize = 0;
		variables.CreatedDate = "";
		variables.CreatedBy = "";
		variables.LastMaintainedDate = "";
		variables.LastMaintainedBy = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="Pattern">
		<cfargument name="stValues" required="false" type="struct">
			<cfif IsDefined("arguments.stValues")>
				<cfset variables.PatternID=stValues.PatternID>
				<cfset variables.FittingID=stValues.FittingID>
				<cfset variables.Description=stValues.description>
				<cfset variables.DueDate=stValues.DueDate>
				<cfset variables.PatternPriorityID=stValues.PatternPriorityID>
				<cfset variables.PatternStatusID=stValues.PatternStatusID>
				<cfset variables.Approved=stValues.Approved>
				<cfset variables.ApprovedBy=stValues.ApprovedBy>
				<cfset variables.ApprovedWhen=stValues.ApprovedWhen>
				<cfset variables.Location=stValues.location>
				<cfset variables.URL=stValues.url>
				<cfset variables.ContentType=stValues.contenttype>
				<cfset variables.File=stValues.file>
				<cfset variables.FileName=stValues.filename>
				<cfset variables.FileExtension=stValues.fileextension>
				<cfset variables.FileSize=stValues.filesize>
				<cfset variables.createdby=stValues.createdby>
				<cfset variables.createddate=stValues.createddate>
				<cfset variables.lastmaintainedby=stValues.lastmaintainedby>
				<cfset variables.lastmaintaineddate=stValues.lastmaintaineddate>
			</cfif>
		<cfreturn this>		
	</cffunction>
	
	
	<cffunction name="getPatternID" output="false" access="public" returntype="any">
		<cfreturn variables.PatternID>
	</cffunction>

	<cffunction name="setPatternID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PatternID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getFittingID" output="false" access="public" returntype="any">
		<cfreturn variables.FittingID>
	</cffunction>

	<cffunction name="setFittingID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.FittingID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDescription" output="false" access="public" returntype="any">
		<cfreturn variables.Description>
	</cffunction>

	<cffunction name="setDescription" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Description = arguments.val>
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

	<cffunction name="getPatternPriorityID" output="false" access="public" returntype="any">
		<cfreturn variables.PatternPriorityID>
	</cffunction>

	<cffunction name="setPatternPriorityID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PatternPriorityID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPatternStatusID" output="false" access="public" returntype="any">
		<cfreturn variables.PatternStatusID>
	</cffunction>

	<cffunction name="setPatternStatusID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PatternStatusID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getApproved" output="false" access="public" returntype="any">
		<cfreturn variables.Approved>
	</cffunction>

	<cffunction name="setApproved" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Approved = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getApprovedBy" output="false" access="public" returntype="any">
		<cfreturn variables.ApprovedBy>
	</cffunction>

	<cffunction name="setApprovedBy" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ApprovedBy = arguments.val>
	</cffunction>

	<cffunction name="getApprovedWhen" output="false" access="public" returntype="any">
		<cfreturn variables.ApprovedWhen>
	</cffunction>

	<cffunction name="setApprovedWhen" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ApprovedWhen = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getLocation" output="false" access="public" returntype="any">
		<cfreturn variables.Location>
	</cffunction>

	<cffunction name="setLocation" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Location = arguments.val>
	</cffunction>

	<cffunction name="getURL" output="false" access="public" returntype="any">
		<cfreturn variables.URL>
	</cffunction>

	<cffunction name="setURL" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.URL = arguments.val>
	</cffunction>

	<cffunction name="getContentType" output="false" access="public" returntype="any">
		<cfreturn variables.ContentType>
	</cffunction>

	<cffunction name="setContentType" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ContentType = arguments.val>
	</cffunction>

	<cffunction name="getFile" output="false" access="public" returntype="any">
		<cfreturn variables.File>
	</cffunction>

	<cffunction name="setFile" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.File = arguments.val>
	</cffunction>

	<cffunction name="getFileName" output="false" access="public" returntype="any">
		<cfreturn variables.FileName>
	</cffunction>

	<cffunction name="setFileName" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.FileName = arguments.val>
	</cffunction>

	<cffunction name="getFileExtension" output="false" access="public" returntype="any">
		<cfreturn variables.FileExtension>
	</cffunction>

	<cffunction name="setFileExtension" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.FileExtension = arguments.val>
	</cffunction>

	<cffunction name="getFileSize" output="false" access="public" returntype="any">
		<cfreturn variables.FileSize>
	</cffunction>

	<cffunction name="setFileSize" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.FileSize = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
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

	<cffunction name="getCreatedBy" output="false" access="public" returntype="any">
		<cfreturn variables.CreatedBy>
	</cffunction>

	<cffunction name="setCreatedBy" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CreatedBy = arguments.val>
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

	<cffunction name="getLastMaintainedBy" output="false" access="public" returntype="any">
		<cfreturn variables.LastMaintainedBy>
	</cffunction>

	<cffunction name="setLastMaintainedBy" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LastMaintainedBy = arguments.val>
	</cffunction>



</cfcomponent>