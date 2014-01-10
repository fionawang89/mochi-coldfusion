<cfcomponent output="false" alias="mochi.cfc.fabricSampleOrders.FabricSampleOrder">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="FabricSampleOrderID" type="numeric" default="0">
	<cfproperty name="VendorID" type="numeric" default="0">
	<cfproperty name="FabricRequestID" type="numeric" default="0">
	<cfproperty name="OrderedBy" type="string" default="">
	<cfproperty name="OrderDate" type="date" default="">
	<cfproperty name="EstimateShipDate" type="date" default="">
	<cfproperty name="SampleYardage" type="numeric" default="0">
	<cfproperty name="CostPerYard" type="numeric" default="0">
	<cfproperty name="TotalCost" type="numeric" default="0">
	<cfproperty name="CostCurrency" type="string" default="">
	<cfproperty name="ReceivedBy" type="string" default="">
	<cfproperty name="ReceivedDate" type="date" default="">
	<cfproperty name="ReceivedQuantity" type="numeric" default="0">
	<cfproperty name="CancelledBy" type="string" default="">
	<cfproperty name="CancelledDate" type="date" default="">
	<cfproperty name="Comments" type="string" default="">
	<cfproperty name="FabricSampleOrderStatusID" type="numeric" default="0">
	<cfproperty name="CreatedBy" type="string" default="">
	<cfproperty name="CreatedDate" type="date" default="">
	<cfproperty name="LastMaintainedBy" type="string" default="">
	<cfproperty name="LastMaintainedDate" type="date" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.FabricSampleOrderID = 0;
		variables.VendorID = 0;
		variables.FabricRequestID = 0;
		variables.OrderedBy = "";
		variables.OrderDate = "";
		variables.EstimateShipDate = "";
		variables.SampleYardage = 0;
		variables.CostPerYard = 0;
		variables.TotalCost = 0;
		variables.CostCurrency = "";
		variables.ReceivedBy = "";
		variables.ReceivedDate = "";
		variables.ReceivedQuantity = 0;
		variables.CancelledBy = "";
		variables.CancelledDate = "";
		variables.Comments = "";
		variables.FabricSampleOrderStatusID = 0;
		variables.CreatedBy = "";
		variables.CreatedDate = "";
		variables.LastMaintainedBy = "";
		variables.LastMaintainedDate = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="FabricSampleOrder">
		<cfargument name="stValues" required="false" type="struct">
			<cfif IsDefined("arguments.stValues")>
				<cfset variables.FabricSampleOrderID=stValues.FabricSampleOrderID>
				<cfset variables.VendorID=stValues.VendorID>
				<cfset variables.FabricRequestID=stValues.FabricRequestID>
				<cfset variables.OrderedBy=stValues.OrderedBy>
				<cfset variables.OrderDate=stValues.OrderDate>
				<cfset variables.EstimateShipDate=stValues.EstimateShipDate>
				<cfset variables.SampleYardage =stValues.SampleYardage>
				<cfset variables.CostPerYard=stValues.CostPerYard>				
				<cfset variables.TotalCost=stValues.TotalCost>				
				<cfset variables.CostCurrency=stValues.CostCurrency>				
				<cfset variables.ReceivedBy=stValues.ReceivedBy>				
				<cfset variables.ReceivedDate=stValues.ReceivedDate>
				<cfset variables.ReceivedQuantity=stValues.ReceivedQuantity>
				<cfset variables.CancelledBy=stValues.CancelledBy>
				<cfset variables.CancelledDate=stValues.CancelledDate>
				<cfset variables.Comments=stValues.Comments>
				<cfset variables.FabricSampleOrderStatusID=stValues.FabricSampleOrderStatusID>
				<cfset variables.CreatedBy=stValues.CreatedBy>
				<cfset variables.CreatedDate=stValues.CreatedDate>
				<cfset variables.LastMaintainedBy=stValues.LastMaintainedBy>
				<cfset variables.LastMaintainedDate=stValues.LastMaintainedDate>
			</cfif>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="getFabricSampleOrderID" output="false" access="public" returntype="any">
		<cfreturn variables.FabricSampleOrderID>
	</cffunction>

	<cffunction name="setFabricSampleOrderID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.FabricSampleOrderID = arguments.val>
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

	<cffunction name="getOrderedBy" output="false" access="public" returntype="any">
		<cfreturn variables.OrderedBy>
	</cffunction>

	<cffunction name="setOrderedBy" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.OrderedBy = arguments.val>
	</cffunction>

	<cffunction name="getOrderDate" output="false" access="public" returntype="any">
		<cfreturn variables.OrderDate>
	</cffunction>

	<cffunction name="setOrderDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.OrderDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getEstimateShipDate" output="false" access="public" returntype="any">
		<cfreturn variables.EstimateShipDate>
	</cffunction>

	<cffunction name="setEstimateShipDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.EstimateShipDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getSampleYardage" output="false" access="public" returntype="any">
		<cfreturn variables.SampleYardage>
	</cffunction>

	<cffunction name="setSampleYardage" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SampleYardage = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCostPerYard" output="false" access="public" returntype="any">
		<cfreturn variables.CostPerYard>
	</cffunction>

	<cffunction name="setCostPerYard" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CostPerYard = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTotalCost" output="false" access="public" returntype="any">
		<cfreturn variables.TotalCost>
	</cffunction>

	<cffunction name="setTotalCost" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TotalCost = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCostCurrency" output="false" access="public" returntype="any">
		<cfreturn variables.CostCurrency>
	</cffunction>

	<cffunction name="setCostCurrency" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CostCurrency = arguments.val>
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

	<cffunction name="getReceivedQuantity" output="false" access="public" returntype="any">
		<cfreturn variables.ReceivedQuantity>
	</cffunction>

	<cffunction name="setReceivedQuantity" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ReceivedQuantity = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCancelledBy" output="false" access="public" returntype="any">
		<cfreturn variables.CancelledBy>
	</cffunction>

	<cffunction name="setCancelledBy" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CancelledBy = arguments.val>
	</cffunction>

	<cffunction name="getCancelledDate" output="false" access="public" returntype="any">
		<cfreturn variables.CancelledDate>
	</cffunction>

	<cffunction name="setCancelledDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CancelledDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getComments" output="false" access="public" returntype="any">
		<cfreturn variables.Comments>
	</cffunction>

	<cffunction name="setComments" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Comments = arguments.val>
	</cffunction>

	<cffunction name="getFabricSampleOrderStatusID" output="false" access="public" returntype="any">
		<cfreturn variables.FabricSampleOrderStatusID>
	</cffunction>

	<cffunction name="setFabricSampleOrderStatusID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.FabricSampleOrderStatusID = arguments.val>
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