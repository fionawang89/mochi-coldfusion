<cfcomponent output="false" alias="mochi.cfc.sampleProgress.SampleProgress">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="SampleProgressID" type="numeric" default="0">
	<cfproperty name="SampleRequestID" type="numeric" default="0">
	<cfproperty name="ReferenceNumber" type="numeric" default="0">
	<cfproperty name="Comments" type="string" default="">
	<cfproperty name="RequestReceived" type="numeric" default="0">
	<cfproperty name="RequestReceivedBy" type="string" default="">
	<cfproperty name="RequestReceivedDate" type="date" default="">
	<cfproperty name="PlanDate" type="date" default="">
	<cfproperty name="PatternStatusID" type="numeric" default="0">
	<cfproperty name="AssignedDate" type="date" default="">
	<cfproperty name="FinishedDate" type="date" default="">
	<cfproperty name="StartDate" type="date" default="">
	<cfproperty name="ApprovedDate" type="date" default="">
	<cfproperty name="BeadingStatusID" type="numeric" default="0">
	<cfproperty name="BeadingUpdatedDate" type="date" default="">
	<cfproperty name="BeadingUpdatedBy" type="string" default="">
	<cfproperty name="BeadingApprovedDate" type="date" default="">
	<cfproperty name="BeadingApprovedBy" type="string" default="">
	<cfproperty name="FabricTrimStatusID" type="numeric" default="0">
	<cfproperty name="FabricTrimUpdatedDate" type="date" default="">
	<cfproperty name="FabricTrimUpdatedBy" type="string" default="">
	<cfproperty name="FabricTrimApprovedDate" type="date" default="">
	<cfproperty name="FabricTrimApprovedBy" type="string" default="">
	<cfproperty name="CounterSampleStatusID" type="numeric" default="0">
	<cfproperty name="CounterSampleUpdatedDate" type="date" default="">
	<cfproperty name="CounterSampleUpdatedBy" type="string" default="">
	<cfproperty name="CounterSampleApprovedDate" type="date" default="">
	<cfproperty name="CounterSampleApprovedBy" type="string" default="">
	<cfproperty name="CreatedBy" type="string" default="">
	<cfproperty name="CreatedDate" type="date" default="">
	<cfproperty name="LastMaintainedBy" type="string" default="">
	<cfproperty name="LastMaintainedDate" type="date" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.SampleProgressID = 0;
		variables.SampleRequestID = 0;
		variables.ReferenceNumber = 0;
		variables.Comments = "";
		variables.RequestReceived = 0;
		variables.RequestReceivedBy = "";
		variables.RequestReceivedDate = "";
		variables.PlanDate = "";
		variables.PatternStatusID = 0;
		variables.AssignedDate = "";
		variables.FinishedDate = "";
		variables.StartDate = "";
		variables.ApprovedDate = "";
		variables.BeadingStatusID = 0;
		variables.BeadingUpdatedDate = "";
		variables.BeadingUpdatedBy = "";
		variables.BeadingApprovedDate = "";
		variables.BeadingApprovedBy = "";
		variables.FabricTrimStatusID = 0;
		variables.FabricTrimUpdatedDate = "";
		variables.FabricTrimUpdatedBy = "";
		variables.FabricTrimApprovedDate = "";
		variables.FabricTrimApprovedBy = "";
		variables.CounterSampleStatusID = 0;
		variables.CounterSampleUpdatedDate = "";
		variables.CounterSampleUpdatedBy = "";
		variables.CounterSampleApprovedDate = "";
		variables.CounterSampleApprovedBy = "";
		variables.CreatedBy = "";
		variables.CreatedDate = "";
		variables.LastMaintainedBy = "";
		variables.LastMaintainedDate = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="SampleProgress">
		<cfargument name="stValues" required="false" type="struct">
			<cfif IsDefined("arguments.stValues")>
				<cfset variables.SampleProgressID=stValues.SampleProgressID>
				<cfset variables.SampleRequestID=stValues.SampleRequestID>
				<cfset variables.ReferenceNumber=stValues.ReferenceNumber>
				<cfset variables.Comments =stValues.Comments>
				<cfset variables.RequestReceived =stValues.RequestReceived>
				<cfset variables.RequestReceivedBy =stValues.RequestReceivedBy>
				<cfset variables.RequestReceivedDate =stValues.RequestReceivedDate>
				<cfset variables.PlanDate=stValues.PlanDate>				
				<cfset variables.PatternStatusID=stValues.PatternStatusID>				
				<cfset variables.AssignedDate=stValues.AssignedDate>
				<cfset variables.FinishedDate=stValues.FinishedDate>
				<cfset variables.StartDate=stValues.StartDate>
				<cfset variables.ApprovedDate=stValues.ApprovedDate>				
				<cfset variables.BeadingStatusID=stValues.BeadingStatusID>				
				<cfset variables.BeadingUpdatedDate=stValues.BeadingUpdatedDate>
				<cfset variables.BeadingUpdatedBy=stValues.BeadingUpdatedBy>
				<cfset variables.BeadingApprovedDate=stValues.BeadingApprovedDate>
				<cfset variables.BeadingApprovedBy=stValues.BeadingApprovedBy>
				<cfset variables.FabricTrimStatusID=stValues.FabricTrimStatusID>				
				<cfset variables.FabricTrimUpdatedDate=stValues.FabricTrimUpdatedDate>
				<cfset variables.FabricTrimUpdatedBy=stValues.FabricTrimUpdatedBy>
				<cfset variables.FabricTrimApprovedDate=stValues.FabricTrimApprovedDate>
				<cfset variables.FabricTrimApprovedBy=stValues.FabricTrimApprovedBy>
				<cfset variables.CounterSampleStatusID=stValues.CounterSampleStatusID>				
				<cfset variables.CounterSampleUpdatedDate=stValues.CounterSampleUpdatedDate>
				<cfset variables.CounterSampleUpdatedBy=stValues.CounterSampleUpdatedBy>
				<cfset variables.CounterSampleApprovedDate=stValues.CounterSampleApprovedDate>
				<cfset variables.CounterSampleApprovedBy=stValues.CounterSampleApprovedBy>								
				<cfset variables.CreatedBy=stValues.CreatedBy>
				<cfset variables.CreatedDate=stValues.CreatedDate>
				<cfset variables.LastMaintainedBy=stValues.LastMaintainedBy>
				<cfset variables.LastMaintainedDate=stValues.LastMaintainedDate>
			</cfif>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="getSampleProgressID" output="false" access="public" returntype="any">
		<cfreturn variables.SampleProgressID>
	</cffunction>

	<cffunction name="setSampleProgressID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SampleProgressID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSampleRequestID" output="false" access="public" returntype="any">
		<cfreturn variables.SampleRequestID>
	</cffunction>

	<cffunction name="setSampleRequestID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SampleRequestID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getReferenceNumber" output="false" access="public" returntype="any">
		<cfreturn variables.ReferenceNumber>
	</cffunction>

	<cffunction name="setReferenceNumber" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ReferenceNumber = arguments.val>
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

	<cffunction name="getRequestReceived" output="false" access="public" returntype="any">
		<cfreturn variables.RequestReceived>
	</cffunction>

	<cffunction name="setRequestReceived" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.RequestReceived = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getRequestReceivedBy" output="false" access="public" returntype="any">
		<cfreturn variables.RequestReceivedBy>
	</cffunction>

	<cffunction name="setRequestReceivedBy" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.RequestReceivedBy = arguments.val>
	</cffunction>

	<cffunction name="getRequestReceivedDate" output="false" access="public" returntype="any">
		<cfreturn variables.RequestReceivedDate>
	</cffunction>

	<cffunction name="setRequestReceivedDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.RequestReceivedDate = arguments.val>
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

	<cffunction name="getAssignedDate" output="false" access="public" returntype="any">
		<cfreturn variables.AssignedDate>
	</cffunction>

	<cffunction name="setAssignedDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AssignedDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
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

	<cffunction name="getStartDate" output="false" access="public" returntype="any">
		<cfreturn variables.StartDate>
	</cffunction>

	<cffunction name="setStartDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.StartDate = arguments.val>
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

	<cffunction name="getBeadingStatusID" output="false" access="public" returntype="any">
		<cfreturn variables.BeadingStatusID>
	</cffunction>

	<cffunction name="setBeadingStatusID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.BeadingStatusID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getBeadingUpdatedDate" output="false" access="public" returntype="any">
		<cfreturn variables.BeadingUpdatedDate>
	</cffunction>

	<cffunction name="setBeadingUpdatedDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.BeadingUpdatedDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getBeadingUpdatedBy" output="false" access="public" returntype="any">
		<cfreturn variables.BeadingUpdatedBy>
	</cffunction>

	<cffunction name="setBeadingUpdatedBy" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.BeadingUpdatedBy = arguments.val>
	</cffunction>

	<cffunction name="getBeadingApprovedDate" output="false" access="public" returntype="any">
		<cfreturn variables.BeadingApprovedDate>
	</cffunction>

	<cffunction name="setBeadingApprovedDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.BeadingApprovedDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getBeadingApprovedBy" output="false" access="public" returntype="any">
		<cfreturn variables.BeadingApprovedBy>
	</cffunction>

	<cffunction name="setBeadingApprovedBy" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.BeadingApprovedBy = arguments.val>
	</cffunction>

	<cffunction name="getFabricTrimStatusID" output="false" access="public" returntype="any">
		<cfreturn variables.FabricTrimStatusID>
	</cffunction>

	<cffunction name="setFabricTrimStatusID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.FabricTrimStatusID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getFabricTrimUpdatedDate" output="false" access="public" returntype="any">
		<cfreturn variables.FabricTrimUpdatedDate>
	</cffunction>

	<cffunction name="setFabricTrimUpdatedDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.FabricTrimUpdatedDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getFabricTrimUpdatedBy" output="false" access="public" returntype="any">
		<cfreturn variables.FabricTrimUpdatedBy>
	</cffunction>

	<cffunction name="setFabricTrimUpdatedBy" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.FabricTrimUpdatedBy = arguments.val>
	</cffunction>

	<cffunction name="getFabricTrimApprovedDate" output="false" access="public" returntype="any">
		<cfreturn variables.FabricTrimApprovedDate>
	</cffunction>

	<cffunction name="setFabricTrimApprovedDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.FabricTrimApprovedDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getFabricTrimApprovedBy" output="false" access="public" returntype="any">
		<cfreturn variables.FabricTrimApprovedBy>
	</cffunction>

	<cffunction name="setFabricTrimApprovedBy" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.FabricTrimApprovedBy = arguments.val>
	</cffunction>

	<cffunction name="getCounterSampleStatusID" output="false" access="public" returntype="any">
		<cfreturn variables.CounterSampleStatusID>
	</cffunction>

	<cffunction name="setCounterSampleStatusID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CounterSampleStatusID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCounterSampleUpdatedDate" output="false" access="public" returntype="any">
		<cfreturn variables.CounterSampleUpdatedDate>
	</cffunction>

	<cffunction name="setCounterSampleUpdatedDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CounterSampleUpdatedDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getCounterSampleUpdatedBy" output="false" access="public" returntype="any">
		<cfreturn variables.CounterSampleUpdatedBy>
	</cffunction>

	<cffunction name="setCounterSampleUpdatedBy" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CounterSampleUpdatedBy = arguments.val>
	</cffunction>

	<cffunction name="getCounterSampleApprovedDate" output="false" access="public" returntype="any">
		<cfreturn variables.CounterSampleApprovedDate>
	</cffunction>

	<cffunction name="setCounterSampleApprovedDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CounterSampleApprovedDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getCounterSampleApprovedBy" output="false" access="public" returntype="any">
		<cfreturn variables.CounterSampleApprovedBy>
	</cffunction>

	<cffunction name="setCounterSampleApprovedBy" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CounterSampleApprovedBy = arguments.val>
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