<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.sampleProgress.SampleProgress">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	SampleProgressID, SampleRequestID, ReferenceNumber, Comments, RequestReceived, RequestReceivedBy, 
					RequestReceivedDate, PlanDate, PatternStatusID, AssignedDate, FinishedDate, 
					StartDate, ApprovedDate, BeadingStatusID, BeadingUpdatedDate, BeadingUpdatedBy, 
					BeadingApprovedDate, BeadingApprovedBy, FabricTrimStatusID, FabricTrimUpdatedDate, FabricTrimUpdatedBy, 
					FabricTrimApprovedDate, FabricTrimApprovedBy, CounterSampleStatusID, CounterSampleUpdatedDate, CounterSampleUpdatedBy, 
					CounterSampleApprovedDate, CounterSampleApprovedBy, CreatedBy, CreatedDate, LastMaintainedBy, 
					LastMaintainedDate
			from SampleProgress
			where SampleProgressID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.sampleProgress.SampleProgress").init();
			obj.setSampleProgressID(qRead.SampleProgressID);
			obj.setSampleRequestID(qRead.SampleRequestID);
			obj.setReferenceNumber(qRead.ReferenceNumber);
			obj.setComments(qRead.Comments);
			obj.setRequestReceived(qRead.RequestReceived);
			obj.setRequestReceivedBy(qRead.RequestReceivedBy);
			obj.setRequestReceivedDate(qRead.RequestReceivedDate);
			obj.setPlanDate(qRead.PlanDate);
			obj.setPatternStatusID(qRead.PatternStatusID);
			obj.setAssignedDate(qRead.AssignedDate);
			obj.setFinishedDate(qRead.FinishedDate);
			obj.setStartDate(qRead.StartDate);
			obj.setApprovedDate(qRead.ApprovedDate);
			obj.setBeadingStatusID(qRead.BeadingStatusID);
			obj.setBeadingUpdatedDate(qRead.BeadingUpdatedDate);
			obj.setBeadingUpdatedBy(qRead.BeadingUpdatedBy);
			obj.setBeadingApprovedDate(qRead.BeadingApprovedDate);
			obj.setBeadingApprovedBy(qRead.BeadingApprovedBy);
			obj.setFabricTrimStatusID(qRead.FabricTrimStatusID);
			obj.setFabricTrimUpdatedDate(qRead.FabricTrimUpdatedDate);
			obj.setFabricTrimUpdatedBy(qRead.FabricTrimUpdatedBy);
			obj.setFabricTrimApprovedDate(qRead.FabricTrimApprovedDate);
			obj.setFabricTrimApprovedBy(qRead.FabricTrimApprovedBy);
			obj.setCounterSampleStatusID(qRead.CounterSampleStatusID);
			obj.setCounterSampleUpdatedDate(qRead.CounterSampleUpdatedDate);
			obj.setCounterSampleUpdatedBy(qRead.CounterSampleUpdatedBy);
			obj.setCounterSampleApprovedDate(qRead.CounterSampleApprovedDate);
			obj.setCounterSampleApprovedBy(qRead.CounterSampleApprovedBy);
			obj.setCreatedBy(qRead.CreatedBy);
			obj.setCreatedDate(qRead.CreatedDate);
			obj.setLastMaintainedBy(qRead.LastMaintainedBy);
			obj.setLastMaintainedDate(qRead.LastMaintainedDate);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.sampleProgress.SampleProgress">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getSampleRequestID()>
		<cfset var local2=arguments.bean.getReferenceNumber()>
		<cfset var local3=arguments.bean.getComments()>
		<cfset var local4=arguments.bean.getRequestReceived()>
		<cfset var local5=arguments.bean.getRequestReceivedBy()>
		<cfset var local6=arguments.bean.getRequestReceivedDate()>
		<cfset var local7=arguments.bean.getPlanDate()>
		<cfset var local8=arguments.bean.getPatternStatusID()>
		<cfset var local9=arguments.bean.getAssignedDate()>
		<cfset var local10=arguments.bean.getFinishedDate()>
		<cfset var local11=arguments.bean.getStartDate()>
		<cfset var local12=arguments.bean.getApprovedDate()>
		<cfset var local13=arguments.bean.getBeadingStatusID()>
		<cfset var local14=arguments.bean.getBeadingUpdatedDate()>
		<cfset var local15=arguments.bean.getBeadingUpdatedBy()>
		<cfset var local16=arguments.bean.getBeadingApprovedDate()>
		<cfset var local17=arguments.bean.getBeadingApprovedBy()>
		<cfset var local18=arguments.bean.getFabricTrimStatusID()>
		<cfset var local19=arguments.bean.getFabricTrimUpdatedDate()>
		<cfset var local20=arguments.bean.getFabricTrimUpdatedBy()>
		<cfset var local21=arguments.bean.getFabricTrimApprovedDate()>
		<cfset var local22=arguments.bean.getFabricTrimApprovedBy()>
		<cfset var local23=arguments.bean.getCounterSampleStatusID()>
		<cfset var local24=arguments.bean.getCounterSampleUpdatedDate()>
		<cfset var local25=arguments.bean.getCounterSampleUpdatedBy()>
		<cfset var local26=arguments.bean.getCounterSampleApprovedDate()>
		<cfset var local27=arguments.bean.getCounterSampleApprovedBy()>
		<cfset var local28=arguments.bean.getCreatedBy()>
		<cfset var local29=arguments.bean.getCreatedDate()>
		<cfset var local30=arguments.bean.getLastMaintainedBy()>
		<cfset var local31=arguments.bean.getLastMaintainedDate()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into SampleProgress(SampleRequestID, ReferenceNumber, Comments, RequestReceived, RequestReceivedBy, RequestReceivedDate, PlanDate, PatternStatusID, AssignedDate, FinishedDate, StartDate, ApprovedDate, BeadingStatusID, BeadingUpdatedDate, BeadingUpdatedBy, BeadingApprovedDate, BeadingApprovedBy, FabricTrimStatusID, FabricTrimUpdatedDate, FabricTrimUpdatedBy, FabricTrimApprovedDate, FabricTrimApprovedBy, CounterSampleStatusID, CounterSampleUpdatedDate, CounterSampleUpdatedBy, CounterSampleApprovedDate, CounterSampleApprovedBy, CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_LONGVARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_BIT" null="#iif((local4 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local6 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local7 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_INTEGER" null="#iif((local8 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local9 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local10 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local11#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local11 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local12#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local12 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local13#" cfsqltype="CF_SQL_INTEGER" null="#iif((local13 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local14#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local14 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local15#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local16#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local16 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local17#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local18#" cfsqltype="CF_SQL_INTEGER" null="#iif((local18 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local19#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local19 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local20#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local21#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local21 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local22#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local23#" cfsqltype="CF_SQL_INTEGER" null="#iif((local23 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local24#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local24 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local25#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local26#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local26 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local27#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local28#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local29#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local29 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local30#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local31#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local31 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select SampleProgressID
				from SampleProgress
				where SampleRequestID = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and ReferenceNumber = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				  and Comments = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_LONGVARCHAR" />
				  and RequestReceived = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_BIT" null="#iif((local4 eq ""), de("yes"), de("no"))#" />
				  and RequestReceivedBy = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />
				  and RequestReceivedDate = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local6 eq ""), de("yes"), de("no"))#" />
				  and PlanDate = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local7 eq ""), de("yes"), de("no"))#" />
				  and PatternStatusID = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_INTEGER" null="#iif((local8 eq ""), de("yes"), de("no"))#" />
				  and AssignedDate = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local9 eq ""), de("yes"), de("no"))#" />
				  and FinishedDate = <cfqueryparam value="#local10#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local10 eq ""), de("yes"), de("no"))#" />
				  and StartDate = <cfqueryparam value="#local11#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local11 eq ""), de("yes"), de("no"))#" />
				  and ApprovedDate = <cfqueryparam value="#local12#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local12 eq ""), de("yes"), de("no"))#" />
				  and BeadingStatusID = <cfqueryparam value="#local13#" cfsqltype="CF_SQL_INTEGER" null="#iif((local13 eq ""), de("yes"), de("no"))#" />
				  and BeadingUpdatedDate = <cfqueryparam value="#local14#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local14 eq ""), de("yes"), de("no"))#" />
				  and BeadingUpdatedBy = <cfqueryparam value="#local15#" cfsqltype="CF_SQL_VARCHAR" />
				  and BeadingApprovedDate = <cfqueryparam value="#local16#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local16 eq ""), de("yes"), de("no"))#" />
				  and BeadingApprovedBy = <cfqueryparam value="#local17#" cfsqltype="CF_SQL_VARCHAR" />
				  and FabricTrimStatusID = <cfqueryparam value="#local18#" cfsqltype="CF_SQL_INTEGER" null="#iif((local18 eq ""), de("yes"), de("no"))#" />
				  and FabricTrimUpdatedDate = <cfqueryparam value="#local19#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local19 eq ""), de("yes"), de("no"))#" />
				  and FabricTrimUpdatedBy = <cfqueryparam value="#local20#" cfsqltype="CF_SQL_VARCHAR" />
				  and FabricTrimApprovedDate = <cfqueryparam value="#local21#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local21 eq ""), de("yes"), de("no"))#" />
				  and FabricTrimApprovedBy = <cfqueryparam value="#local22#" cfsqltype="CF_SQL_VARCHAR" />
				  and CounterSampleStatusID = <cfqueryparam value="#local23#" cfsqltype="CF_SQL_INTEGER" null="#iif((local23 eq ""), de("yes"), de("no"))#" />
				  and CounterSampleUpdatedDate = <cfqueryparam value="#local24#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local24 eq ""), de("yes"), de("no"))#" />
				  and CounterSampleUpdatedBy = <cfqueryparam value="#local25#" cfsqltype="CF_SQL_VARCHAR" />
				  and CounterSampleApprovedDate = <cfqueryparam value="#local26#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local26 eq ""), de("yes"), de("no"))#" />
				  and CounterSampleApprovedBy = <cfqueryparam value="#local27#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedBy = <cfqueryparam value="#local28#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedDate = <cfqueryparam value="#local29#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local29 eq ""), de("yes"), de("no"))#" />
				  and LastMaintainedBy = <cfqueryparam value="#local30#" cfsqltype="CF_SQL_VARCHAR" />
				  and LastMaintainedDate = <cfqueryparam value="#local31#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local31 eq ""), de("yes"), de("no"))#" />
				order by SampleProgressID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setSampleProgressID(qGetID.SampleProgressID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.sampleProgress.SampleProgress">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update SampleProgress
			set SampleRequestID = <cfqueryparam value="#arguments.bean.getSampleRequestID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getSampleRequestID() eq ""), de("yes"), de("no"))#" />,
				ReferenceNumber = <cfqueryparam value="#arguments.bean.getReferenceNumber()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getReferenceNumber() eq ""), de("yes"), de("no"))#" />,
				Comments = <cfqueryparam value="#arguments.bean.getComments()#" cfsqltype="CF_SQL_LONGVARCHAR" />,
				RequestReceived = <cfqueryparam value="#arguments.bean.getRequestReceived()#" cfsqltype="CF_SQL_BIT" null="#iif((arguments.bean.getRequestReceived() eq ""), de("yes"), de("no"))#" />,
				RequestReceivedBy = <cfqueryparam value="#arguments.bean.getRequestReceivedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				RequestReceivedDate = <cfqueryparam value="#arguments.bean.getRequestReceivedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getRequestReceivedDate() eq ""), de("yes"), de("no"))#" />,
				PlanDate = <cfqueryparam value="#arguments.bean.getPlanDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getPlanDate() eq ""), de("yes"), de("no"))#" />,
				PatternStatusID = <cfqueryparam value="#arguments.bean.getPatternStatusID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getPatternStatusID() eq ""), de("yes"), de("no"))#" />,
				AssignedDate = <cfqueryparam value="#arguments.bean.getAssignedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getAssignedDate() eq ""), de("yes"), de("no"))#" />,
				FinishedDate = <cfqueryparam value="#arguments.bean.getFinishedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getFinishedDate() eq ""), de("yes"), de("no"))#" />,
				StartDate = <cfqueryparam value="#arguments.bean.getStartDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getStartDate() eq ""), de("yes"), de("no"))#" />,
				ApprovedDate = <cfqueryparam value="#arguments.bean.getApprovedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getApprovedDate() eq ""), de("yes"), de("no"))#" />,
				BeadingStatusID = <cfqueryparam value="#arguments.bean.getBeadingStatusID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getBeadingStatusID() eq ""), de("yes"), de("no"))#" />,
				BeadingUpdatedDate = <cfqueryparam value="#arguments.bean.getBeadingUpdatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getBeadingUpdatedDate() eq ""), de("yes"), de("no"))#" />,
				BeadingUpdatedBy = <cfqueryparam value="#arguments.bean.getBeadingUpdatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				BeadingApprovedDate = <cfqueryparam value="#arguments.bean.getBeadingApprovedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getBeadingApprovedDate() eq ""), de("yes"), de("no"))#" />,
				BeadingApprovedBy = <cfqueryparam value="#arguments.bean.getBeadingApprovedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				FabricTrimStatusID = <cfqueryparam value="#arguments.bean.getFabricTrimStatusID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getFabricTrimStatusID() eq ""), de("yes"), de("no"))#" />,
				FabricTrimUpdatedDate = <cfqueryparam value="#arguments.bean.getFabricTrimUpdatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getFabricTrimUpdatedDate() eq ""), de("yes"), de("no"))#" />,
				FabricTrimUpdatedBy = <cfqueryparam value="#arguments.bean.getFabricTrimUpdatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				FabricTrimApprovedDate = <cfqueryparam value="#arguments.bean.getFabricTrimApprovedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getFabricTrimApprovedDate() eq ""), de("yes"), de("no"))#" />,
				FabricTrimApprovedBy = <cfqueryparam value="#arguments.bean.getFabricTrimApprovedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				CounterSampleStatusID = <cfqueryparam value="#arguments.bean.getCounterSampleStatusID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getCounterSampleStatusID() eq ""), de("yes"), de("no"))#" />,
				CounterSampleUpdatedDate = <cfqueryparam value="#arguments.bean.getCounterSampleUpdatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCounterSampleUpdatedDate() eq ""), de("yes"), de("no"))#" />,
				CounterSampleUpdatedBy = <cfqueryparam value="#arguments.bean.getCounterSampleUpdatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				CounterSampleApprovedDate = <cfqueryparam value="#arguments.bean.getCounterSampleApprovedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCounterSampleApprovedDate() eq ""), de("yes"), de("no"))#" />,
				CounterSampleApprovedBy = <cfqueryparam value="#arguments.bean.getCounterSampleApprovedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedBy = <cfqueryparam value="#arguments.bean.getCreatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedDate = <cfqueryparam value="#arguments.bean.getCreatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCreatedDate() eq ""), de("yes"), de("no"))#" />,
				LastMaintainedBy = <cfqueryparam value="#arguments.bean.getLastMaintainedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				LastMaintainedDate = <cfqueryparam value="#arguments.bean.getLastMaintainedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getLastMaintainedDate() eq ""), de("yes"), de("no"))#" />
			where SampleProgressID = <cfqueryparam value="#arguments.bean.getSampleProgressID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.sampleProgress.SampleProgress">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from SampleProgress
			where SampleProgressID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getSampleProgressID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>