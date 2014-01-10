<cfcomponent output="false" alias="mochi.cfc.fabricSourcings.FabricSourcing">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="FabricSourcingID" type="numeric" default="0">
	<cfproperty name="FabricRequestID" type="numeric" default="0">
	<cfproperty name="VendorID" type="numeric" default="0">
	<cfproperty name="RequestedBy" type="string" default="">
	<cfproperty name="RequestDate" type="date" default="">
	<cfproperty name="Minimum" type="numeric" default="0">
	<cfproperty name="USDPrice" type="numeric" default="0">
	<cfproperty name="RMBPrice" type="numeric" default="0">
	<cfproperty name="Comments" type="string" default="">
	<cfproperty name="CreatedBy" type="string" default="">
	<cfproperty name="CreatedDate" type="date" default="">
	<cfproperty name="LastMaintainedBy" type="string" default="">
	<cfproperty name="LastMaintainedDate" type="date" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.FabricSourcingID = 0;
		variables.FabricRequestID = 0;
		variables.VendorID = 0;
		variables.RequestedBy = "";
		variables.RequestDate = "";
		variables.Minimum = 0;
		variables.USDPrice = 0;
		variables.RMBPrice = 0;
		variables.Comments = "";
		variables.CreatedBy = "";
		variables.CreatedDate = "";
		variables.LastMaintainedBy = "";
		variables.LastMaintainedDate = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="FabricSourcing">
		<cfargument name="stValues" required="false" type="struct">
			<cfif IsDefined("arguments.stValues")>
				<cfset variables.FabricSourcingID=stValues.FabricSourcingID>
				<cfset variables.FabricRequestID=stValues.FabricRequestID>
				<cfset variables.VendorID=stValues.VendorID>
				<cfset variables.RequestedBy=stValues.RequestedBy>
				<cfset variables.RequestDate=stValues.RequestDate>
				<cfset variables.Minimum=stValues.Minimum>
				<cfset variables.USDPrice=stValues.USDPrice>
				<cfset variables.RMBPrice=stValues.RMBPrice>
				<cfset variables.Comments=stValues.Comments>				
				<cfset variables.CreatedBy=stValues.CreatedBy>
				<cfset variables.CreatedDate=stValues.CreatedDate>
				<cfset variables.LastMaintainedBy=stValues.LastMaintainedBy>
				<cfset variables.LastMaintainedDate=stValues.LastMaintainedDate>
			</cfif>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="getFabricSourcingID" output="false" access="public" returntype="any">
		<cfreturn variables.FabricSourcingID>
	</cffunction>

	<cffunction name="setFabricSourcingID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.FabricSourcingID = arguments.val>
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

	<cffunction name="getVendorID" output="false" access="public" returntype="any">
		<cfreturn variables.VendorID>
	</cffunction>

	<cffunction name="setVendorID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.VendorID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
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

	<cffunction name="getMinimum" output="false" access="public" returntype="any">
		<cfreturn variables.Minimum>
	</cffunction>

	<cffunction name="setMinimum" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Minimum = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getUSDPrice" output="false" access="public" returntype="any">
		<cfreturn variables.USDPrice>
	</cffunction>

	<cffunction name="setUSDPrice" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.USDPrice = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getRMBPrice" output="false" access="public" returntype="any">
		<cfreturn variables.RMBPrice>
	</cffunction>

	<cffunction name="setRMBPrice" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.RMBPrice = arguments.val>
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