<cfcomponent output="false" alias="mochi.cfc.sampleShipments.SampleShipment">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="SampleShipmentID" type="numeric" default="0">
	<cfproperty name="SampleRequestID" type="numeric" default="0">
	<cfproperty name="ReferenceNumber" type="numeric" default="0">
	<cfproperty name="Comments" type="string" default="">
	<cfproperty name="AttentionTo" type="string" default="">
	<cfproperty name="Sender" type="string" default="">
	<cfproperty name="BeforeShipmentStatus" type="numeric" default="0">
	<cfproperty name="ShippedDate" type="date" default="">
	<cfproperty name="ShippedVia" type="string" default="">
	<cfproperty name="TrackingNumber" type="string" default="">
	<cfproperty name="ShipmentStatus" type="string" default="">
	<cfproperty name="ReceivedBy" type="string" default="">
	<cfproperty name="ReceivedDate" type="date" default="">
	<cfproperty name="ShipFrom" type="string" default="">
	<cfproperty name="ShipTo" type="string" default="">
	<cfproperty name="CreatedBy" type="string" default="">
	<cfproperty name="CreatedDate" type="date" default="">
	<cfproperty name="LastMaintainedBy" type="string" default="">
	<cfproperty name="LastMaintainedDate" type="date" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.SampleShipmentID = 0;
		variables.SampleRequestID = 0;
		variables.ReferenceNumber = 0;
		variables.Comments = "";
		variables.AttentionTo = "";
		variables.Sender = "";
		variables.BeforeShipmentStatus = 0;
		variables.ShippedDate = "";
		variables.ShippedVia = "";
		variables.TrackingNumber = "";
		variables.ShipmentStatus = "";
		variables.ReceivedBy = "";
		variables.ReceivedDate = "";
		variables.ShipFrom = "";
		variables.ShipTo = "";
		variables.CreatedBy = "";
		variables.CreatedDate = "";
		variables.LastMaintainedBy = "";
		variables.LastMaintainedDate = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="SampleShipment">
		<cfargument name="stValues" required="false" type="struct">
			<cfif IsDefined("arguments.stValues")>
				<cfset variables.SampleShipmentID=stValues.SampleShipmentID>
				<cfset variables.SampleRequestID=stValues.SampleRequestID>
				<cfset variables.ReferenceNumber=stValues.ReferenceNumber>
				<cfset variables.Comments =stValues.Comments>
				<cfset variables.AttentionTo=stValues.AttentionTo>
				<cfset variables.Sender =stValues.Sender>
				<cfset variables.BeforeShipmentStatus =stValues.BeforeShipmentStatus>
				<cfset variables.ShippedDate =stValues.ShippedDate>
				<cfset variables.ShippedVia =stValues.ShippedVia>
				<cfset variables.TrackingNumber=stValues.TrackingNumber>				
				<cfset variables.ShipmentStatus=stValues.ShipmentStatus>				
				<cfset variables.ReceivedBy=stValues.ReceivedBy>				
				<cfset variables.ReceivedDate=stValues.ReceivedDate>				
				<cfset variables.ShipFrom=stValues.ShipFrom>				
				<cfset variables.ShipTo=stValues.ShipTo>				
				<cfset variables.CreatedBy=stValues.CreatedBy>
				<cfset variables.CreatedDate=stValues.CreatedDate>
				<cfset variables.LastMaintainedBy=stValues.LastMaintainedBy>
				<cfset variables.LastMaintainedDate=stValues.LastMaintainedDate>
			</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<cffunction name="getSampleShipmentID" output="false" access="public" returntype="any">
		<cfreturn variables.SampleShipmentID>
	</cffunction>

	<cffunction name="setSampleShipmentID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SampleShipmentID = arguments.val>
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

	<cffunction name="getAttentionTo" output="false" access="public" returntype="any">
		<cfreturn variables.AttentionTo>
	</cffunction>

	<cffunction name="setAttentionTo" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.AttentionTo = arguments.val>
	</cffunction>

	<cffunction name="getSender" output="false" access="public" returntype="any">
		<cfreturn variables.Sender>
	</cffunction>

	<cffunction name="setSender" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Sender = arguments.val>
	</cffunction>

	<cffunction name="getBeforeShipmentStatus" output="false" access="public" returntype="any">
		<cfreturn variables.BeforeShipmentStatus>
	</cffunction>

	<cffunction name="setBeforeShipmentStatus" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.BeforeShipmentStatus = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getShippedDate" output="false" access="public" returntype="any">
		<cfreturn variables.ShippedDate>
	</cffunction>

	<cffunction name="setShippedDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ShippedDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getShippedVia" output="false" access="public" returntype="any">
		<cfreturn variables.ShippedVia>
	</cffunction>

	<cffunction name="setShippedVia" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ShippedVia = arguments.val>
	</cffunction>

	<cffunction name="getTrackingNumber" output="false" access="public" returntype="any">
		<cfreturn variables.TrackingNumber>
	</cffunction>

	<cffunction name="setTrackingNumber" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.TrackingNumber = arguments.val>
	</cffunction>

	<cffunction name="getShipmentStatus" output="false" access="public" returntype="any">
		<cfreturn variables.ShipmentStatus>
	</cffunction>

	<cffunction name="setShipmentStatus" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ShipmentStatus = arguments.val>
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

	<cffunction name="getShipFrom" output="false" access="public" returntype="any">
		<cfreturn variables.ShipFrom>
	</cffunction>

	<cffunction name="setShipFrom" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ShipFrom = arguments.val>
	</cffunction>

	<cffunction name="getShipTo" output="false" access="public" returntype="any">
		<cfreturn variables.ShipTo>
	</cffunction>

	<cffunction name="setShipTo" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ShipTo = arguments.val>
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