<cfcomponent output="false" alias="mochi.fx.fittings.Fitting">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="FittingID" type="numeric" default="0">
	<cfproperty name="StyleID" type="numeric" default="0">
	<cfproperty name="SampleCategoryID" type="numeric" default="0">
	<cfproperty name="PatternMakerID" type="numeric" default="0">
	<cfproperty name="CutNumber" type="numeric" default="0">
	<cfproperty name="DueDate" type="date" default="">
	<cfproperty name="LocationID" type="numeric" default="0">
	<cfproperty name="ContractorID" type="numeric" default="0">
	<cfproperty name="Fitter" type="string" default="">
	<cfproperty name="FittingDate" type="date" default="">
	<cfproperty name="ResultCodeID" type="numeric" default="0">
	<cfproperty name="PatternStatusID" type="numeric" default="0">
	<cfproperty name="SampleStatusID" type="numeric" default="0">
	<cfproperty name="CreatedDate" type="date" default="">
	<cfproperty name="CreatedBy" type="string" default="">
	<cfproperty name="LastMaintainedDate" type="date" default="">
	<cfproperty name="LastMaintainedBy" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.FittingID = 0;
		variables.StyleID = 0;
		variables.SampleCategoryID = 0;
		variables.PatternMakerID = 0;
		variables.CutNumber = 0;
		variables.DueDate = "";
		variables.LocationID = 0;
		variables.ContractorID = 0;
		variables.Fitter = "";
		variables.FittingDate = "";
		variables.ResultCodeID = 0;
		variables.PatternStatusID = 0;
		variables.SampleStatusID = 0;
		variables.CreatedDate = "";
		variables.CreatedBy = "";
		variables.LastMaintainedDate = "";
		variables.LastMaintainedBy = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="Fitting">
		<cfreturn this>
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

	<cffunction name="getSampleCategoryID" output="false" access="public" returntype="any">
		<cfreturn variables.SampleCategoryID>
	</cffunction>

	<cffunction name="setSampleCategoryID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SampleCategoryID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPatternMakerID" output="false" access="public" returntype="any">
		<cfreturn variables.PatternMakerID>
	</cffunction>

	<cffunction name="setPatternMakerID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PatternMakerID = arguments.val>
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

	<cffunction name="getLocationID" output="false" access="public" returntype="any">
		<cfreturn variables.LocationID>
	</cffunction>

	<cffunction name="setLocationID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.LocationID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getContractorID" output="false" access="public" returntype="any">
		<cfreturn variables.ContractorID>
	</cffunction>

	<cffunction name="setContractorID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ContractorID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getFitter" output="false" access="public" returntype="any">
		<cfreturn variables.Fitter>
	</cffunction>

	<cffunction name="setFitter" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Fitter = arguments.val>
	</cffunction>

	<cffunction name="getFittingDate" output="false" access="public" returntype="any">
		<cfreturn variables.FittingDate>
	</cffunction>

	<cffunction name="setFittingDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.FittingDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getResultCodeID" output="false" access="public" returntype="any">
		<cfreturn variables.ResultCodeID>
	</cffunction>

	<cffunction name="setResultCodeID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ResultCodeID = arguments.val>
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

	<cffunction name="getSampleStatusID" output="false" access="public" returntype="any">
		<cfreturn variables.SampleStatusID>
	</cffunction>

	<cffunction name="setSampleStatusID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SampleStatusID = arguments.val>
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