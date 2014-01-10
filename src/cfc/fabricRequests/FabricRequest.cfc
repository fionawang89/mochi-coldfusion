<cfcomponent output="false" alias="mochi.cfc.fabricRequests.FabricRequest">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="FabricRequestID" type="numeric" default="0">
	<cfproperty name="EntityTypeID" type="numeric" default="0">
	<cfproperty name="ReferenceNumber" type="numeric" default="0">
	<cfproperty name="DeliveryID" type="numeric" default="0">
	<cfproperty name="YearID" type="numeric" default="0">
	<cfproperty name="FabricID" type="numeric" default="0">
	<cfproperty name="ColorID" type="numeric" default="0">
	<cfproperty name="PantoneColor" type="string" default="">
	<cfproperty name="Comments" type="string" default="">
	<cfproperty name="RequestedBy" type="string" default="">
	<cfproperty name="RequestDate" type="date" default="">
	<cfproperty name="ApprovedBy" type="string" default="">
	<cfproperty name="ApprovedDate" type="date" default="">
	<cfproperty name="ReceivedBy" type="string" default="">
	<cfproperty name="ReceivedDate" type="date" default="">
	<cfproperty name="FabricRequestStatusID" type="numeric" default="0">
	<cfproperty name="FabricRequestTypeID" type="numeric" default="0">
	<cfproperty name="FabricCategoryID" type="numeric" default="0">
	<cfproperty name="CreatedBy" type="string" default="">
	<cfproperty name="CreatedDate" type="date" default="">
	<cfproperty name="LastMaintainedBy" type="string" default="">
	<cfproperty name="LastMaintainedDate" type="date" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.FabricRequestID = 0;
		variables.EntityTypeID = 0;
		variables.ReferenceNumber = 0;
		variables.DeliveryID = 0;
		variables.YearID = 0;
		variables.FabricID = 0;
		variables.ColorID = 0;
		variables.PantoneColor = "";
		variables.Comments = "";
		variables.RequestedBy = "";
		variables.RequestDate = "";
		variables.ApprovedBy = "";
		variables.ApprovedDate = "";
		variables.ReceivedBy = "";
		variables.ReceivedDate = "";
		variables.FabricRequestStatusID = 0;
		variables.FabricRequestTypeID = 0;
		variables.FabricCategoryID = 0;
		variables.CreatedBy = "";
		variables.CreatedDate = "";
		variables.LastMaintainedBy = "";
		variables.LastMaintainedDate = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="FabricRequest">
		<cfargument name="stValues" required="false" type="struct">
			<cfif IsDefined("arguments.stValues")>
				<cfset variables.FabricRequestID=stValues.FabricRequestID>
				<cfset variables.EntityTypeID=5>
				<cfset variables.ReferenceNumber=stValues.ReferenceNumber>
				<cfset variables.DeliveryID=stValues.DeliveryID>
				<cfset variables.YearID=stValues.YearID>
				<cfset variables.FabricID=stValues.FabricID>
				<cfset variables.ColorID=stValues.ColorID>
				<cfset variables.Comments=stValues.Comments>				
				<cfset variables.RequestedBy=stValues.RequestedBy>
				<cfset variables.RequestDate=stValues.RequestDate>
				<cfset variables.ApprovedBy=stValues.ApprovedBy>
				<cfset variables.ApprovedDate=stValues.ApprovedDate>
				<cfset variables.ReceivedBy=stValues.ReceivedBy>
				<cfset variables.ReceivedDate=stValues.ReceivedDate>
				<cfset variables.FabricRequestStatusID=stValues.FabricRequestStatusID>
				<cfset variables.FabricRequestTypeID=stValues.FabricRequestTypeID>
				<cfset variables.FabricCategoryID=stValues.FabricCategoryID>
				<cfset variables.CreatedBy=stValues.CreatedBy>
				<cfset variables.CreatedDate=stValues.CreatedDate>
				<cfset variables.LastMaintainedBy=stValues.LastMaintainedBy>
				<cfset variables.LastMaintainedDate=stValues.LastMaintainedDate>
			</cfif>
		<cfreturn this>
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

	<cffunction name="getEntityTypeID" output="false" access="public" returntype="any">
		<cfreturn variables.EntityTypeID>
	</cffunction>

	<cffunction name="setEntityTypeID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.EntityTypeID = arguments.val>
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

	<cffunction name="getDeliveryID" output="false" access="public" returntype="any">
		<cfreturn variables.DeliveryID>
	</cffunction>

	<cffunction name="setDeliveryID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.DeliveryID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getYearID" output="false" access="public" returntype="any">
		<cfreturn variables.YearID>
	</cffunction>

	<cffunction name="setYearID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.YearID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getFabricID" output="false" access="public" returntype="any">
		<cfreturn variables.FabricID>
	</cffunction>

	<cffunction name="setFabricID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.FabricID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getColorID" output="false" access="public" returntype="any">
		<cfreturn variables.ColorID>
	</cffunction>

	<cffunction name="setColorID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ColorID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPantoneColor" output="false" access="public" returntype="any">
		<cfreturn variables.PantoneColor>
	</cffunction>

	<cffunction name="setPantoneColor" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.PantoneColor = arguments.val>
	</cffunction>

	<cffunction name="getComments" output="false" access="public" returntype="any">
		<cfreturn variables.Comments>
	</cffunction>

	<cffunction name="setComments" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Comments = arguments.val>
	</cffunction>

	<cffunction name="getRequestedBy" output="false" access="public" returntype="any">
		<cfreturn variables.RequestedBy>
	</cffunction>

	<cffunction name="setRequestedBy" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.RequestedBy = arguments.val>
	</cffunction>

	<cffunction name="getRequestDate" output="false" access="public" returntype="any">
		<cfreturn variables.RequestDate>
	</cffunction>

	<cffunction name="setRequestDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.RequestDate = arguments.val>
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

	<cffunction name="getFabricRequestStatusID" output="false" access="public" returntype="any">
		<cfreturn variables.FabricRequestStatusID>
	</cffunction>

	<cffunction name="setFabricRequestStatusID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.FabricRequestStatusID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getFabricRequestTypeID" output="false" access="public" returntype="any">
		<cfreturn variables.FabricRequestTypeID>
	</cffunction>

	<cffunction name="setFabricRequestTypeID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.FabricRequestTypeID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getFabricCategoryID" output="false" access="public" returntype="any">
		<cfreturn variables.FabricCategoryID>
	</cffunction>

	<cffunction name="setFabricCategoryID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.FabricCategoryID = arguments.val>
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