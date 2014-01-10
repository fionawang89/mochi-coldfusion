<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.fabricRequests.FabricRequest">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	FabricRequestID, EntityTypeID, ReferenceNumber, DeliveryID, YearID, FabricID, 
					ColorID, PantoneColor, Comments, RequestedBy, RequestDate, 
					ApprovedBy, ApprovedDate, ReceivedBy, ReceivedDate, FabricRequestStatusID, 
					FabricRequestTypeID, FabricCategoryID, CreatedBy, CreatedDate, LastMaintainedBy, 
					LastMaintainedDate
			from FabricRequest
			where FabricRequestID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.fabricRequests.FabricRequest").init();
			obj.setFabricRequestID(qRead.FabricRequestID);
			obj.setEntityTypeID(qRead.EntityTypeID);
			obj.setReferenceNumber(qRead.ReferenceNumber);
			obj.setDeliveryID(qRead.DeliveryID);
			obj.setYearID(qRead.YearID);
			obj.setFabricID(qRead.FabricID);
			obj.setColorID(qRead.ColorID);
			obj.setPantoneColor(qRead.PantoneColor);
			obj.setComments(qRead.Comments);
			obj.setRequestedBy(qRead.RequestedBy);
			obj.setRequestDate(qRead.RequestDate);
			obj.setApprovedBy(qRead.ApprovedBy);
			obj.setApprovedDate(qRead.ApprovedDate);
			obj.setReceivedBy(qRead.ReceivedBy);
			obj.setReceivedDate(qRead.ReceivedDate);
			obj.setFabricRequestStatusID(qRead.FabricRequestStatusID);
			obj.setFabricRequestTypeID(qRead.FabricRequestTypeID);
			obj.setFabricCategoryID(qRead.FabricCategoryID);
			obj.setCreatedBy(qRead.CreatedBy);
			obj.setCreatedDate(qRead.CreatedDate);
			obj.setLastMaintainedBy(qRead.LastMaintainedBy);
			obj.setLastMaintainedDate(qRead.LastMaintainedDate);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.fabricRequests.FabricRequest">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getEntityTypeID()>
		<cfset var local2=arguments.bean.getReferenceNumber()>
		<cfset var local3=arguments.bean.getDeliveryID()>
		<cfset var local4=arguments.bean.getYearID()>
		<cfset var local5=arguments.bean.getFabricID()>
		<cfset var local6=arguments.bean.getColorID()>
		<cfset var local7=arguments.bean.getPantoneColor()>
		<cfset var local8=arguments.bean.getComments()>
		<cfset var local9=arguments.bean.getRequestedBy()>
		<cfset var local10=arguments.bean.getRequestDate()>
		<cfset var local11=arguments.bean.getApprovedBy()>
		<cfset var local12=arguments.bean.getApprovedDate()>
		<cfset var local13=arguments.bean.getReceivedBy()>
		<cfset var local14=arguments.bean.getReceivedDate()>
		<cfset var local15=arguments.bean.getFabricRequestStatusID()>
		<cfset var local16=arguments.bean.getFabricRequestTypeID()>
		<cfset var local17=arguments.bean.getFabricCategoryID()>
		<cfset var local18=arguments.bean.getCreatedBy()>
		<cfset var local19=arguments.bean.getCreatedDate()>
		<cfset var local20=arguments.bean.getLastMaintainedBy()>
		<cfset var local21=arguments.bean.getLastMaintainedDate()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into FabricRequest(EntityTypeID, ReferenceNumber, DeliveryID, YearID, FabricID, ColorID, PantoneColor, Comments, RequestedBy, RequestDate, ApprovedBy, ApprovedDate, ReceivedBy, ReceivedDate, FabricRequestStatusID, FabricRequestTypeID, FabricCategoryID, CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_INTEGER" null="#iif((local3 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_INTEGER" null="#iif((local4 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_INTEGER" null="#iif((local5 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_INTEGER" null="#iif((local6 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_LONGVARCHAR" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local10 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local11#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local12#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local12 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local13#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local14#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local14 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local15#" cfsqltype="CF_SQL_INTEGER" null="#iif((local15 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local16#" cfsqltype="CF_SQL_INTEGER" null="#iif((local16 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local17#" cfsqltype="CF_SQL_INTEGER" null="#iif((local17 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local18#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local19#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local19 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local20#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local21#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local21 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select FabricRequestID
				from FabricRequest
				where EntityTypeID = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and ReferenceNumber = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				  and DeliveryID = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_INTEGER" null="#iif((local3 eq ""), de("yes"), de("no"))#" />
				  and YearID = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_INTEGER" null="#iif((local4 eq ""), de("yes"), de("no"))#" />
				  and FabricID = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_INTEGER" null="#iif((local5 eq ""), de("yes"), de("no"))#" />
				  and ColorID = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_INTEGER" null="#iif((local6 eq ""), de("yes"), de("no"))#" />
				  and PantoneColor = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />
				  and Comments = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_LONGVARCHAR" />
				  and RequestedBy = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />
				  and RequestDate = <cfqueryparam value="#local10#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local10 eq ""), de("yes"), de("no"))#" />
				  and ApprovedBy = <cfqueryparam value="#local11#" cfsqltype="CF_SQL_VARCHAR" />
				  and ApprovedDate = <cfqueryparam value="#local12#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local12 eq ""), de("yes"), de("no"))#" />
				  and ReceivedBy = <cfqueryparam value="#local13#" cfsqltype="CF_SQL_VARCHAR" />
				  and ReceivedDate = <cfqueryparam value="#local14#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local14 eq ""), de("yes"), de("no"))#" />
				  and FabricRequestStatusID = <cfqueryparam value="#local15#" cfsqltype="CF_SQL_INTEGER" null="#iif((local15 eq ""), de("yes"), de("no"))#" />
				  and FabricRequestTypeID = <cfqueryparam value="#local16#" cfsqltype="CF_SQL_INTEGER" null="#iif((local16 eq ""), de("yes"), de("no"))#" />
				  and FabricCategoryID = <cfqueryparam value="#local17#" cfsqltype="CF_SQL_INTEGER" null="#iif((local17 eq ""), de("yes"), de("no"))#" />
				  and CreatedBy = <cfqueryparam value="#local18#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedDate = <cfqueryparam value="#local19#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local19 eq ""), de("yes"), de("no"))#" />
				  and LastMaintainedBy = <cfqueryparam value="#local20#" cfsqltype="CF_SQL_VARCHAR" />
				  and LastMaintainedDate = <cfqueryparam value="#local21#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local21 eq ""), de("yes"), de("no"))#" />
				order by FabricRequestID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setFabricRequestID(qGetID.FabricRequestID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.fabricRequests.FabricRequest">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update FabricRequest
			set EntityTypeID = <cfqueryparam value="#arguments.bean.getEntityTypeID()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getEntityTypeID() eq ""), de("yes"), de("no"))#" />,
				ReferenceNumber = <cfqueryparam value="#arguments.bean.getReferenceNumber()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getReferenceNumber() eq ""), de("yes"), de("no"))#" />,
				DeliveryID = <cfqueryparam value="#arguments.bean.getDeliveryID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getDeliveryID() eq ""), de("yes"), de("no"))#" />,
				YearID = <cfqueryparam value="#arguments.bean.getYearID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getYearID() eq ""), de("yes"), de("no"))#" />,
				FabricID = <cfqueryparam value="#arguments.bean.getFabricID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getFabricID() eq ""), de("yes"), de("no"))#" />,
				ColorID = <cfqueryparam value="#arguments.bean.getColorID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getColorID() eq ""), de("yes"), de("no"))#" />,
				PantoneColor = <cfqueryparam value="#arguments.bean.getPantoneColor()#" cfsqltype="CF_SQL_VARCHAR" />,
				Comments = <cfqueryparam value="#arguments.bean.getComments()#" cfsqltype="CF_SQL_LONGVARCHAR" />,
				RequestedBy = <cfqueryparam value="#arguments.bean.getRequestedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				RequestDate = <cfqueryparam value="#arguments.bean.getRequestDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getRequestDate() eq ""), de("yes"), de("no"))#" />,
				ApprovedBy = <cfqueryparam value="#arguments.bean.getApprovedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				ApprovedDate = <cfqueryparam value="#arguments.bean.getApprovedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getApprovedDate() eq ""), de("yes"), de("no"))#" />,
				ReceivedBy = <cfqueryparam value="#arguments.bean.getReceivedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				ReceivedDate = <cfqueryparam value="#arguments.bean.getReceivedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getReceivedDate() eq ""), de("yes"), de("no"))#" />,
				FabricRequestStatusID = <cfqueryparam value="#arguments.bean.getFabricRequestStatusID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getFabricRequestStatusID() eq ""), de("yes"), de("no"))#" />,
				FabricRequestTypeID = <cfqueryparam value="#arguments.bean.getFabricRequestTypeID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getFabricRequestTypeID() eq ""), de("yes"), de("no"))#" />,
				FabricCategoryID = <cfqueryparam value="#arguments.bean.getFabricCategoryID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getFabricCategoryID() eq ""), de("yes"), de("no"))#" />,
				CreatedBy = <cfqueryparam value="#arguments.bean.getCreatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedDate = <cfqueryparam value="#arguments.bean.getCreatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCreatedDate() eq ""), de("yes"), de("no"))#" />,
				LastMaintainedBy = <cfqueryparam value="#arguments.bean.getLastMaintainedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				LastMaintainedDate = <cfqueryparam value="#arguments.bean.getLastMaintainedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getLastMaintainedDate() eq ""), de("yes"), de("no"))#" />
			where FabricRequestID = <cfqueryparam value="#arguments.bean.getFabricRequestID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.fabricRequests.FabricRequest">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from FabricRequest
			where FabricRequestID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getFabricRequestID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>