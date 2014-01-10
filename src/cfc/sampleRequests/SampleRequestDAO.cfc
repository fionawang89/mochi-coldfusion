<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.sampleRequests.SampleRequest">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	SampleRequestID, ReferenceNumber, CollectionID, SampleTypeID, StyleID, ColorID, 
					SizeID, Customer, Quantity, Comments, RequestedBy, 
					RequestedFor, RequestDate, DueDate, PatternDueDate, DeadlineToContractor, 
					ReceivedDate, RequestStatusID, MakeIn, RequestSubmitted, ContractorID, 
					HasOrder, YearID, DeliveryID, CancellationDate, CancelledBy, 
					Beading, BeadingStartDate, BeadingDueDate, FabricTrim, FabricTrimStartDate, 
					FabricTrimDueDate, CounterSample, CounterSampleStartDate, CounterSampleDueDate, CreatedBy, 
					CreatedDate, LastMaintainedBy, LastMaintainedDate
			from SampleRequest
			where SampleRequestID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.sampleRequests.SampleRequest").init();
			obj.setSampleRequestID(qRead.SampleRequestID);
			obj.setReferenceNumber(qRead.ReferenceNumber);
			obj.setCollectionID(qRead.CollectionID);
			obj.setSampleTypeID(qRead.SampleTypeID);
			obj.setStyleID(qRead.StyleID);
			obj.setColorID(qRead.ColorID);
			obj.setSizeID(qRead.SizeID);
			obj.setCustomer(qRead.Customer);
			obj.setQuantity(qRead.Quantity);
			obj.setComments(qRead.Comments);
			obj.setRequestedBy(qRead.RequestedBy);
			obj.setRequestedFor(qRead.RequestedFor);
			obj.setRequestDate(qRead.RequestDate);
			obj.setDueDate(qRead.DueDate);
			obj.setPatternDueDate(qRead.PatternDueDate);
			obj.setDeadlineToContractor(qRead.DeadlineToContractor);
			obj.setReceivedDate(qRead.ReceivedDate);
			obj.setRequestStatusID(qRead.RequestStatusID);
			obj.setMakeIn(qRead.MakeIn);
			obj.setRequestSubmitted(qRead.RequestSubmitted);
			obj.setContractorID(qRead.ContractorID);
			obj.setHasOrder(qRead.HasOrder);
			obj.setYearID(qRead.YearID);
			obj.setDeliveryID(qRead.DeliveryID);
			obj.setCancellationDate(qRead.CancellationDate);
			obj.setCancelledBy(qRead.CancelledBy);
			obj.setBeading(qRead.Beading);
			obj.setBeadingStartDate(qRead.BeadingStartDate);
			obj.setBeadingDueDate(qRead.BeadingDueDate);
			obj.setFabricTrim(qRead.FabricTrim);
			obj.setFabricTrimStartDate(qRead.FabricTrimStartDate);
			obj.setFabricTrimDueDate(qRead.FabricTrimDueDate);
			obj.setCounterSample(qRead.CounterSample);
			obj.setCounterSampleStartDate(qRead.CounterSampleStartDate);
			obj.setCounterSampleDueDate(qRead.CounterSampleDueDate);
			obj.setCreatedBy(qRead.CreatedBy);
			obj.setCreatedDate(qRead.CreatedDate);
			obj.setLastMaintainedBy(qRead.LastMaintainedBy);
			obj.setLastMaintainedDate(qRead.LastMaintainedDate);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.sampleRequests.SampleRequest">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getReferenceNumber()>
		<cfset var local2=arguments.bean.getCollectionID()>
		<cfset var local3=arguments.bean.getSampleTypeID()>
		<cfset var local4=arguments.bean.getStyleID()>
		<cfset var local5=arguments.bean.getColorID()>
		<cfset var local6=arguments.bean.getSizeID()>
		<cfset var local7=arguments.bean.getCustomer()>
		<cfset var local8=arguments.bean.getQuantity()>
		<cfset var local9=arguments.bean.getComments()>
		<cfset var local10=arguments.bean.getRequestedBy()>
		<cfset var local11=arguments.bean.getRequestedFor()>
		<cfset var local12=arguments.bean.getRequestDate()>
		<cfset var local13=arguments.bean.getDueDate()>
		<cfset var local14=arguments.bean.getPatternDueDate()>
		<cfset var local15=arguments.bean.getDeadlineToContractor()>
		<cfset var local16=arguments.bean.getReceivedDate()>
		<cfset var local17=arguments.bean.getRequestStatusID()>
		<cfset var local18=arguments.bean.getMakeIn()>
		<cfset var local19=arguments.bean.getRequestSubmitted()>
		<cfset var local20=arguments.bean.getContractorID()>
		<cfset var local21=arguments.bean.getHasOrder()>
		<cfset var local22=arguments.bean.getYearID()>
		<cfset var local23=arguments.bean.getDeliveryID()>
		<cfset var local24=arguments.bean.getCancellationDate()>
		<cfset var local25=arguments.bean.getCancelledBy()>
		<cfset var local26=arguments.bean.getBeading()>
		<cfset var local27=arguments.bean.getBeadingStartDate()>
		<cfset var local28=arguments.bean.getBeadingDueDate()>
		<cfset var local29=arguments.bean.getFabricTrim()>
		<cfset var local30=arguments.bean.getFabricTrimStartDate()>
		<cfset var local31=arguments.bean.getFabricTrimDueDate()>
		<cfset var local32=arguments.bean.getCounterSample()>
		<cfset var local33=arguments.bean.getCounterSampleStartDate()>
		<cfset var local34=arguments.bean.getCounterSampleDueDate()>
		<cfset var local35=arguments.bean.getCreatedBy()>
		<cfset var local36=arguments.bean.getCreatedDate()>
		<cfset var local37=arguments.bean.getLastMaintainedBy()>
		<cfset var local38=arguments.bean.getLastMaintainedDate()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into SampleRequest(ReferenceNumber, CollectionID, SampleTypeID, StyleID, ColorID, SizeID, Customer, Quantity, Comments, RequestedBy, RequestedFor, RequestDate, DueDate, PatternDueDate, DeadlineToContractor, ReceivedDate, RequestStatusID, MakeIn, RequestSubmitted, ContractorID, HasOrder, YearID, DeliveryID, CancellationDate, CancelledBy, Beading, BeadingStartDate, BeadingDueDate, FabricTrim, FabricTrimStartDate, FabricTrimDueDate, CounterSample, CounterSampleStartDate, CounterSampleDueDate, CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_INTEGER" null="#iif((local3 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_INTEGER" null="#iif((local4 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_INTEGER" null="#iif((local5 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_INTEGER" null="#iif((local6 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local8 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_LONGVARCHAR" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local11#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local12#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local12 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local13#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local13 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local14#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local14 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local15#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local15 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local16#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local16 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local17#" cfsqltype="CF_SQL_INTEGER" null="#iif((local17 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local18#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local19#" cfsqltype="CF_SQL_INTEGER" null="#iif((local19 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local20#" cfsqltype="CF_SQL_INTEGER" null="#iif((local20 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local21#" cfsqltype="CF_SQL_BIT" null="#iif((local21 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local22#" cfsqltype="CF_SQL_INTEGER" null="#iif((local22 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local23#" cfsqltype="CF_SQL_INTEGER" null="#iif((local23 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local24#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local24 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local25#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local26#" cfsqltype="CF_SQL_BIT" null="#iif((local26 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local27#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local27 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local28#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local28 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local29#" cfsqltype="CF_SQL_BIT" null="#iif((local29 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local30#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local30 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local31#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local31 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local32#" cfsqltype="CF_SQL_BIT" null="#iif((local32 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local33#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local33 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local34#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local34 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local35#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local36#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local36 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local37#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local38#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local38 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select SampleRequestID
				from SampleRequest
				where ReferenceNumber = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and CollectionID = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				  and SampleTypeID = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_INTEGER" null="#iif((local3 eq ""), de("yes"), de("no"))#" />
				  and StyleID = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_INTEGER" null="#iif((local4 eq ""), de("yes"), de("no"))#" />
				  and ColorID = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_INTEGER" null="#iif((local5 eq ""), de("yes"), de("no"))#" />
				  and SizeID = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_INTEGER" null="#iif((local6 eq ""), de("yes"), de("no"))#" />
				  and Customer = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />
				  and Quantity = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local8 eq ""), de("yes"), de("no"))#" />
				  and Comments = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_LONGVARCHAR" />
				  and RequestedBy = <cfqueryparam value="#local10#" cfsqltype="CF_SQL_VARCHAR" />
				  and RequestedFor = <cfqueryparam value="#local11#" cfsqltype="CF_SQL_VARCHAR" />
				  and RequestDate = <cfqueryparam value="#local12#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local12 eq ""), de("yes"), de("no"))#" />
				  and DueDate = <cfqueryparam value="#local13#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local13 eq ""), de("yes"), de("no"))#" />
				  and PatternDueDate = <cfqueryparam value="#local14#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local14 eq ""), de("yes"), de("no"))#" />
				  and DeadlineToContractor = <cfqueryparam value="#local15#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local15 eq ""), de("yes"), de("no"))#" />
				  and ReceivedDate = <cfqueryparam value="#local16#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local16 eq ""), de("yes"), de("no"))#" />
				  and RequestStatusID = <cfqueryparam value="#local17#" cfsqltype="CF_SQL_INTEGER" null="#iif((local17 eq ""), de("yes"), de("no"))#" />
				  and MakeIn = <cfqueryparam value="#local18#" cfsqltype="CF_SQL_VARCHAR" />
				  and RequestSubmitted = <cfqueryparam value="#local19#" cfsqltype="CF_SQL_INTEGER" null="#iif((local19 eq ""), de("yes"), de("no"))#" />
				  and ContractorID = <cfqueryparam value="#local20#" cfsqltype="CF_SQL_INTEGER" null="#iif((local20 eq ""), de("yes"), de("no"))#" />
				  and HasOrder = <cfqueryparam value="#local21#" cfsqltype="CF_SQL_BIT" null="#iif((local21 eq ""), de("yes"), de("no"))#" />
				  and YearID = <cfqueryparam value="#local22#" cfsqltype="CF_SQL_INTEGER" null="#iif((local22 eq ""), de("yes"), de("no"))#" />
				  and DeliveryID = <cfqueryparam value="#local23#" cfsqltype="CF_SQL_INTEGER" null="#iif((local23 eq ""), de("yes"), de("no"))#" />
				  and CancellationDate = <cfqueryparam value="#local24#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local24 eq ""), de("yes"), de("no"))#" />
				  and CancelledBy = <cfqueryparam value="#local25#" cfsqltype="CF_SQL_VARCHAR" />
				  and Beading = <cfqueryparam value="#local26#" cfsqltype="CF_SQL_BIT" null="#iif((local26 eq ""), de("yes"), de("no"))#" />
				  and BeadingStartDate = <cfqueryparam value="#local27#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local27 eq ""), de("yes"), de("no"))#" />
				  and BeadingDueDate = <cfqueryparam value="#local28#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local28 eq ""), de("yes"), de("no"))#" />
				  and FabricTrim = <cfqueryparam value="#local29#" cfsqltype="CF_SQL_BIT" null="#iif((local29 eq ""), de("yes"), de("no"))#" />
				  and FabricTrimStartDate = <cfqueryparam value="#local30#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local30 eq ""), de("yes"), de("no"))#" />
				  and FabricTrimDueDate = <cfqueryparam value="#local31#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local31 eq ""), de("yes"), de("no"))#" />
				  and CounterSample = <cfqueryparam value="#local32#" cfsqltype="CF_SQL_BIT" null="#iif((local32 eq ""), de("yes"), de("no"))#" />
				  and CounterSampleStartDate = <cfqueryparam value="#local33#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local33 eq ""), de("yes"), de("no"))#" />
				  and CounterSampleDueDate = <cfqueryparam value="#local34#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local34 eq ""), de("yes"), de("no"))#" />
				  and CreatedBy = <cfqueryparam value="#local35#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedDate = <cfqueryparam value="#local36#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local36 eq ""), de("yes"), de("no"))#" />
				  and LastMaintainedBy = <cfqueryparam value="#local37#" cfsqltype="CF_SQL_VARCHAR" />
				  and LastMaintainedDate = <cfqueryparam value="#local38#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local38 eq ""), de("yes"), de("no"))#" />
				order by SampleRequestID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setSampleRequestID(qGetID.SampleRequestID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.sampleRequests.SampleRequest">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update SampleRequest
			set ReferenceNumber = <cfqueryparam value="#arguments.bean.getReferenceNumber()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getReferenceNumber() eq ""), de("yes"), de("no"))#" />,
				CollectionID = <cfqueryparam value="#arguments.bean.getCollectionID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getCollectionID() eq ""), de("yes"), de("no"))#" />,
				SampleTypeID = <cfqueryparam value="#arguments.bean.getSampleTypeID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getSampleTypeID() eq ""), de("yes"), de("no"))#" />,
				StyleID = <cfqueryparam value="#arguments.bean.getStyleID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getStyleID() eq ""), de("yes"), de("no"))#" />,
				ColorID = <cfqueryparam value="#arguments.bean.getColorID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getColorID() eq ""), de("yes"), de("no"))#" />,
				SizeID = <cfqueryparam value="#arguments.bean.getSizeID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getSizeID() eq ""), de("yes"), de("no"))#" />,
				Customer = <cfqueryparam value="#arguments.bean.getCustomer()#" cfsqltype="CF_SQL_VARCHAR" />,
				Quantity = <cfqueryparam value="#arguments.bean.getQuantity()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getQuantity() eq ""), de("yes"), de("no"))#" />,
				Comments = <cfqueryparam value="#arguments.bean.getComments()#" cfsqltype="CF_SQL_LONGVARCHAR" />,
				RequestedBy = <cfqueryparam value="#arguments.bean.getRequestedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				RequestedFor = <cfqueryparam value="#arguments.bean.getRequestedFor()#" cfsqltype="CF_SQL_VARCHAR" />,
				RequestDate = <cfqueryparam value="#arguments.bean.getRequestDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getRequestDate() eq ""), de("yes"), de("no"))#" />,
				DueDate = <cfqueryparam value="#arguments.bean.getDueDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getDueDate() eq ""), de("yes"), de("no"))#" />,
				PatternDueDate = <cfqueryparam value="#arguments.bean.getPatternDueDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getPatternDueDate() eq ""), de("yes"), de("no"))#" />,
				DeadlineToContractor = <cfqueryparam value="#arguments.bean.getDeadlineToContractor()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getDeadlineToContractor() eq ""), de("yes"), de("no"))#" />,
				ReceivedDate = <cfqueryparam value="#arguments.bean.getReceivedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getReceivedDate() eq ""), de("yes"), de("no"))#" />,
				RequestStatusID = <cfqueryparam value="#arguments.bean.getRequestStatusID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getRequestStatusID() eq ""), de("yes"), de("no"))#" />,
				MakeIn = <cfqueryparam value="#arguments.bean.getMakeIn()#" cfsqltype="CF_SQL_VARCHAR" />,
				RequestSubmitted = <cfqueryparam value="#arguments.bean.getRequestSubmitted()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getRequestSubmitted() eq ""), de("yes"), de("no"))#" />,
				ContractorID = <cfqueryparam value="#arguments.bean.getContractorID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getContractorID() eq ""), de("yes"), de("no"))#" />,
				HasOrder = <cfqueryparam value="#arguments.bean.getHasOrder()#" cfsqltype="CF_SQL_BIT" null="#iif((arguments.bean.getHasOrder() eq ""), de("yes"), de("no"))#" />,
				YearID = <cfqueryparam value="#arguments.bean.getYearID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getYearID() eq ""), de("yes"), de("no"))#" />,
				DeliveryID = <cfqueryparam value="#arguments.bean.getDeliveryID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getDeliveryID() eq ""), de("yes"), de("no"))#" />,
				CancellationDate = <cfqueryparam value="#arguments.bean.getCancellationDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCancellationDate() eq ""), de("yes"), de("no"))#" />,
				CancelledBy = <cfqueryparam value="#arguments.bean.getCancelledBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				Beading = <cfqueryparam value="#arguments.bean.getBeading()#" cfsqltype="CF_SQL_BIT" null="#iif((arguments.bean.getBeading() eq ""), de("yes"), de("no"))#" />,
				BeadingStartDate = <cfqueryparam value="#arguments.bean.getBeadingStartDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getBeadingStartDate() eq ""), de("yes"), de("no"))#" />,
				BeadingDueDate = <cfqueryparam value="#arguments.bean.getBeadingDueDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getBeadingDueDate() eq ""), de("yes"), de("no"))#" />,
				FabricTrim = <cfqueryparam value="#arguments.bean.getFabricTrim()#" cfsqltype="CF_SQL_BIT" null="#iif((arguments.bean.getFabricTrim() eq ""), de("yes"), de("no"))#" />,
				FabricTrimStartDate = <cfqueryparam value="#arguments.bean.getFabricTrimStartDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getFabricTrimStartDate() eq ""), de("yes"), de("no"))#" />,
				FabricTrimDueDate = <cfqueryparam value="#arguments.bean.getFabricTrimDueDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getFabricTrimDueDate() eq ""), de("yes"), de("no"))#" />,
				CounterSample = <cfqueryparam value="#arguments.bean.getCounterSample()#" cfsqltype="CF_SQL_BIT" null="#iif((arguments.bean.getCounterSample() eq ""), de("yes"), de("no"))#" />,
				CounterSampleStartDate = <cfqueryparam value="#arguments.bean.getCounterSampleStartDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCounterSampleStartDate() eq ""), de("yes"), de("no"))#" />,
				CounterSampleDueDate = <cfqueryparam value="#arguments.bean.getCounterSampleDueDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCounterSampleDueDate() eq ""), de("yes"), de("no"))#" />,
				CreatedBy = <cfqueryparam value="#arguments.bean.getCreatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedDate = <cfqueryparam value="#arguments.bean.getCreatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCreatedDate() eq ""), de("yes"), de("no"))#" />,
				LastMaintainedBy = <cfqueryparam value="#arguments.bean.getLastMaintainedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				LastMaintainedDate = <cfqueryparam value="#arguments.bean.getLastMaintainedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getLastMaintainedDate() eq ""), de("yes"), de("no"))#" />
			where SampleRequestID = <cfqueryparam value="#arguments.bean.getSampleRequestID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.sampleRequests.SampleRequest">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from SampleRequest
			where SampleRequestID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getSampleRequestID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>