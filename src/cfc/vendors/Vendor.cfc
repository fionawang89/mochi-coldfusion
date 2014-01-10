<cfcomponent output="false" alias="mochi.cfc.vendors.Vendor">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="VendorID" type="numeric" default="0">
	<cfproperty name="Vendor" type="string" default="">
	<cfproperty name="ContactName" type="string" default="">
	<cfproperty name="TelephoneNumber" type="string" default="">
	<cfproperty name="FaxNumber" type="string" default="">
	<cfproperty name="EMail" type="string" default="">
	<cfproperty name="Address" type="string" default="">
	<cfproperty name="CreatedBy" type="string" default="">
	<cfproperty name="CreatedDate" type="date" default="">
	<cfproperty name="LastMaintainedBy" type="string" default="">
	<cfproperty name="LastMaintainedDate" type="date" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.VendorID = 0;
		variables.Vendor = "";
		variables.ContactName = "";
		variables.TelephoneNumber = "";
		variables.FaxNumber = "";
		variables.EMail = "";
		variables.Address = "";
		variables.CreatedBy = "";
		variables.CreatedDate = "";
		variables.LastMaintainedBy = "";
		variables.LastMaintainedDate = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="Vendor">
		<cfargument name="stValues" required="false" type="struct">
			<cfif IsDefined("arguments.stValues")>
				<cfset variables.VendorID=stValues.VendorID>
				<cfset variables.Vendor=stValues.Vendor>
				<cfset variables.ContactName=stValues.ContactName>
				<cfset variables.TelephoneNumber=stValues.TelephoneNumber>
				<cfset variables.FaxNumber=stValues.FaxNumber>
				<cfset variables.EMail=stValues.EMail>
				<cfset variables.Address=stValues.Address>
				<cfset variables.createdby=stValues.createdby>
				<cfset variables.createddate=stValues.createddate>
				<cfset variables.lastmaintainedby=stValues.lastmaintainedby>
				<cfset variables.lastmaintaineddate=stValues.lastmaintaineddate>
			</cfif>
		<cfreturn this>		
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

	<cffunction name="getVendor" output="false" access="public" returntype="any">
		<cfreturn variables.Vendor>
	</cffunction>

	<cffunction name="setVendor" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Vendor = arguments.val>
	</cffunction>

	<cffunction name="getContactName" output="false" access="public" returntype="any">
		<cfreturn variables.ContactName>
	</cffunction>

	<cffunction name="setContactName" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ContactName = arguments.val>
	</cffunction>

	<cffunction name="getTelephoneNumber" output="false" access="public" returntype="any">
		<cfreturn variables.TelephoneNumber>
	</cffunction>

	<cffunction name="setTelephoneNumber" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.TelephoneNumber = arguments.val>
	</cffunction>

	<cffunction name="getFaxNumber" output="false" access="public" returntype="any">
		<cfreturn variables.FaxNumber>
	</cffunction>

	<cffunction name="setFaxNumber" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.FaxNumber = arguments.val>
	</cffunction>

	<cffunction name="getEMail" output="false" access="public" returntype="any">
		<cfreturn variables.EMail>
	</cffunction>

	<cffunction name="setEMail" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.EMail = arguments.val>
	</cffunction>

	<cffunction name="getAddress" output="false" access="public" returntype="any">
		<cfreturn variables.Address>
	</cffunction>

	<cffunction name="setAddress" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Address = arguments.val>
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