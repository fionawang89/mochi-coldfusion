<cfcomponent output="false" alias="mochi.cfc.sampleRequests.SampleRequest">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="SampleRequestID" type="numeric" default="0">
	<cfproperty name="ReferenceNumber" type="numeric" default="0">
	<cfproperty name="CollectionID" type="numeric" default="0">
	<cfproperty name="SampleTypeID" type="numeric" default="0">
	<cfproperty name="StyleID" type="numeric" default="0">
	<cfproperty name="ColorID" type="numeric" default="0">
	<cfproperty name="SizeID" type="numeric" default="0">
	<cfproperty name="Customer" type="string" default="">
	<cfproperty name="Quantity" type="numeric" default="0">
	<cfproperty name="Comments" type="string" default="">
	<cfproperty name="RequestedBy" type="string" default="">
	<cfproperty name="RequestedFor" type="string" default="">
	<cfproperty name="RequestDate" type="date" default="">
	<cfproperty name="DueDate" type="date" default="">
	<cfproperty name="PatternDueDate" type="date" default="">
	<cfproperty name="DeadlineToContractor" type="date" default="">
	<cfproperty name="ReceivedDate" type="date" default="">
	<cfproperty name="RequestStatusID" type="numeric" default="0">
	<cfproperty name="MakeIn" type="string" default="">
	<cfproperty name="RequestSubmitted" type="numeric" default="0">
	<cfproperty name="ContractorID" type="numeric" default="0">
	<cfproperty name="HasOrder" type="numeric" default="0">
	<cfproperty name="YearID" type="numeric" default="0">
	<cfproperty name="DeliveryID" type="numeric" default="0">
	<cfproperty name="CancellationDate" type="date" default="">
	<cfproperty name="CancelledBy" type="string" default="">
	<cfproperty name="Beading" type="numeric" default="0">
	<cfproperty name="BeadingStartDate" type="date" default="">
	<cfproperty name="BeadingDueDate" type="date" default="">
	<cfproperty name="FabricTrim" type="numeric" default="0">
	<cfproperty name="FabricTrimStartDate" type="date" default="">
	<cfproperty name="FabricTrimDueDate" type="date" default="">
	<cfproperty name="CounterSample" type="numeric" default="0">
	<cfproperty name="CounterSampleStartDate" type="date" default="">
	<cfproperty name="CounterSampleDueDate" type="date" default="">
	<cfproperty name="CreatedBy" type="string" default="">
	<cfproperty name="CreatedDate" type="date" default="">
	<cfproperty name="LastMaintainedBy" type="string" default="">
	<cfproperty name="LastMaintainedDate" type="date" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.SampleRequestID = 0;
		variables.ReferenceNumber = 0;
		variables.CollectionID = 0;
		variables.SampleTypeID = 0;
		variables.StyleID = 0;
		variables.ColorID = 0;
		variables.SizeID = 0;
		variables.Customer = "";
		variables.Quantity = 0;
		variables.Comments = "";
		variables.RequestedBy = "";
		variables.RequestedFor = "";
		variables.RequestDate = "";
		variables.DueDate = "";
		variables.PatternDueDate = "";
		variables.DeadlineToContractor = "";
		variables.ReceivedDate = "";
		variables.RequestStatusID = 0;
		variables.MakeIn = "";
		variables.RequestSubmitted = 0;
		variables.ContractorID = 0;
		variables.HasOrder = 0;
		variables.YearID = 0;
		variables.DeliveryID = 0;
		variables.CancellationDate = "";
		variables.CancelledBy = "";
		variables.Beading = 0;
		variables.BeadingStartDate = "";
		variables.BeadingDueDate = "";
		variables.FabricTrim = 0;
		variables.FabricTrimStartDate = "";
		variables.FabricTrimDueDate = "";
		variables.CounterSample = 0;
		variables.CounterSampleStartDate = "";
		variables.CounterSampleDueDate = "";
		variables.CreatedBy = "";
		variables.CreatedDate = "";
		variables.LastMaintainedBy = "";
		variables.LastMaintainedDate = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="SampleRequest">
		<cfargument name="stValues" required="false" type="struct">
			<cfif IsDefined("arguments.stValues")>
				<cfset variables.SampleRequestID=stValues.SampleRequestID>
				<cfset variables.ReferenceNumber=stValues.ReferenceNumber>
				<cfset variables.CollectionID=stValues.CollectionID>
				<cfset variables.SampleTypeID=stValues.SampleTypeID>
				<cfset variables.StyleID=stValues.StyleID>
				<cfset variables.ColorID =stValues.ColorID>
				<cfset variables.Customer=stValues.Customer>				
				<cfset variables.SizeID=stValues.SizeID>				
				<cfset variables.Quantity=stValues.Quantity>				
				<cfset variables.hasOrder=stValues.hasOrder>				
				<cfset variables.Comments=stValues.Comments>
				<cfset variables.RequestedBy=stValues.RequestedBy>
				<cfset variables.RequestedFor=stValues.RequestedFor>
				<cfset variables.RequestDate=stValues.RequestDate>
				<cfset variables.DueDate=stValues.DueDate>
				<cfset variables.PatternDueDate=stValues.PatternDueDate>
				<cfset variables.DeadlineToContractor=stValues.DeadlineToContractor>
				<cfset variables.ReceivedDate=stValues.ReceivedDate>
				<cfset variables.RequestStatusID=stValues.RequestStatusID>
				<cfset variables.MakeIn=stValues.MakeIn>
				<cfset variables.RequestSubmitted=stValues.RequestSubmitted>
				<cfset variables.ContractorID=stValues.ContractorID>
				<cfset variables.YearID=stValues.YearID>
				<cfset variables.DeliveryID=stValues.DeliveryID>
				<cfset variables.CancellationDate=stValues.CancellationDate>
				<cfset variables.CancelledBy=stValues.CancelledBy>
				<cfset variables.Beading=stValues.Beading>				
				<cfset variables.BeadingStartDate=stValues.BeadingStartDate>
				<cfset variables.BeadingDueDate=stValues.BeadingDueDate>
				<cfset variables.FabricTrim=stValues.FabricTrim>				
				<cfset variables.FabricTrimStartDate=stValues.FabricTrimStartDate>
				<cfset variables.FabricTrimDueDate=stValues.FabricTrimDueDate>
				<cfset variables.CounterSample=stValues.CounterSample>				
				<cfset variables.CounterSampleStartDate=stValues.CounterSampleStartDate>
				<cfset variables.CounterSampleDueDate=stValues.CounterSampleDueDate>				
				<cfset variables.CreatedBy=stValues.CreatedBy>
				<cfset variables.CreatedDate=stValues.CreatedDate>
				<cfset variables.LastMaintainedBy=stValues.LastMaintainedBy>
				<cfset variables.LastMaintainedDate=stValues.LastMaintainedDate>
			</cfif>
		<cfreturn this>
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

	<cffunction name="getCollectionID" output="false" access="public" returntype="any">
		<cfreturn variables.CollectionID>
	</cffunction>

	<cffunction name="setCollectionID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CollectionID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSampleTypeID" output="false" access="public" returntype="any">
		<cfreturn variables.SampleTypeID>
	</cffunction>

	<cffunction name="setSampleTypeID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SampleTypeID = arguments.val>
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

	<cffunction name="getSizeID" output="false" access="public" returntype="any">
		<cfreturn variables.SizeID>
	</cffunction>

	<cffunction name="setSizeID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SizeID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCustomer" output="false" access="public" returntype="any">
		<cfreturn variables.Customer>
	</cffunction>

	<cffunction name="setCustomer" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Customer = arguments.val>
	</cffunction>

	<cffunction name="getQuantity" output="false" access="public" returntype="any">
		<cfreturn variables.Quantity>
	</cffunction>

	<cffunction name="setQuantity" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Quantity = arguments.val>
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

	<cffunction name="getRequestedBy" output="false" access="public" returntype="any">
		<cfreturn variables.RequestedBy>
	</cffunction>

	<cffunction name="setRequestedBy" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.RequestedBy = arguments.val>
	</cffunction>

	<cffunction name="getRequestedFor" output="false" access="public" returntype="any">
		<cfreturn variables.RequestedFor>
	</cffunction>

	<cffunction name="setRequestedFor" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.RequestedFor = arguments.val>
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

	<cffunction name="getPatternDueDate" output="false" access="public" returntype="any">
		<cfreturn variables.PatternDueDate>
	</cffunction>

	<cffunction name="setPatternDueDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PatternDueDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getDeadlineToContractor" output="false" access="public" returntype="any">
		<cfreturn variables.DeadlineToContractor>
	</cffunction>

	<cffunction name="setDeadlineToContractor" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.DeadlineToContractor = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
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

	<cffunction name="getRequestStatusID" output="false" access="public" returntype="any">
		<cfreturn variables.RequestStatusID>
	</cffunction>

	<cffunction name="setRequestStatusID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.RequestStatusID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getMakeIn" output="false" access="public" returntype="any">
		<cfreturn variables.MakeIn>
	</cffunction>

	<cffunction name="setMakeIn" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.MakeIn = arguments.val>
	</cffunction>

	<cffunction name="getRequestSubmitted" output="false" access="public" returntype="any">
		<cfreturn variables.RequestSubmitted>
	</cffunction>

	<cffunction name="setRequestSubmitted" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.RequestSubmitted = arguments.val>
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

	<cffunction name="getHasOrder" output="false" access="public" returntype="any">
		<cfreturn variables.HasOrder>
	</cffunction>

	<cffunction name="setHasOrder" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.HasOrder = arguments.val>
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

	<cffunction name="getCancellationDate" output="false" access="public" returntype="any">
		<cfreturn variables.CancellationDate>
	</cffunction>

	<cffunction name="setCancellationDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CancellationDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getCancelledBy" output="false" access="public" returntype="any">
		<cfreturn variables.CancelledBy>
	</cffunction>

	<cffunction name="setCancelledBy" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CancelledBy = arguments.val>
	</cffunction>

	<cffunction name="getBeading" output="false" access="public" returntype="any">
		<cfreturn variables.Beading>
	</cffunction>

	<cffunction name="setBeading" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Beading = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getBeadingStartDate" output="false" access="public" returntype="any">
		<cfreturn variables.BeadingStartDate>
	</cffunction>

	<cffunction name="setBeadingStartDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.BeadingStartDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getBeadingDueDate" output="false" access="public" returntype="any">
		<cfreturn variables.BeadingDueDate>
	</cffunction>

	<cffunction name="setBeadingDueDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.BeadingDueDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getFabricTrim" output="false" access="public" returntype="any">
		<cfreturn variables.FabricTrim>
	</cffunction>

	<cffunction name="setFabricTrim" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.FabricTrim = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getFabricTrimStartDate" output="false" access="public" returntype="any">
		<cfreturn variables.FabricTrimStartDate>
	</cffunction>

	<cffunction name="setFabricTrimStartDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.FabricTrimStartDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getFabricTrimDueDate" output="false" access="public" returntype="any">
		<cfreturn variables.FabricTrimDueDate>
	</cffunction>

	<cffunction name="setFabricTrimDueDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.FabricTrimDueDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getCounterSample" output="false" access="public" returntype="any">
		<cfreturn variables.CounterSample>
	</cffunction>

	<cffunction name="setCounterSample" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CounterSample = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCounterSampleStartDate" output="false" access="public" returntype="any">
		<cfreturn variables.CounterSampleStartDate>
	</cffunction>

	<cffunction name="setCounterSampleStartDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CounterSampleStartDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getCounterSampleDueDate" output="false" access="public" returntype="any">
		<cfreturn variables.CounterSampleDueDate>
	</cffunction>

	<cffunction name="setCounterSampleDueDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CounterSampleDueDate = arguments.val>
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