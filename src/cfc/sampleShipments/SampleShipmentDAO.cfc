<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.sampleShipments.SampleShipment">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	SampleShipmentID, SampleRequestID, ReferenceNumber, Comments, AttentionTo, Sender, 
					BeforeShipmentStatus, ShippedDate, ShippedVia, TrackingNumber, ShipmentStatus, 
					ReceivedBy, ReceivedDate, ShipFrom, ShipTo, CreatedBy, 
					CreatedDate, LastMaintainedBy, LastMaintainedDate
			from SampleShipments
			where SampleShipmentID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.sampleShipments.SampleShipment").init();
			obj.setSampleShipmentID(qRead.SampleShipmentID);
			obj.setSampleRequestID(qRead.SampleRequestID);
			obj.setReferenceNumber(qRead.ReferenceNumber);
			obj.setComments(qRead.Comments);
			obj.setAttentionTo(qRead.AttentionTo);
			obj.setSender(qRead.Sender);
			obj.setBeforeShipmentStatus(qRead.BeforeShipmentStatus);
			obj.setShippedDate(qRead.ShippedDate);
			obj.setShippedVia(qRead.ShippedVia);
			obj.setTrackingNumber(qRead.TrackingNumber);
			obj.setShipmentStatus(qRead.ShipmentStatus);
			obj.setReceivedBy(qRead.ReceivedBy);
			obj.setReceivedDate(qRead.ReceivedDate);
			obj.setShipFrom(qRead.ShipFrom);
			obj.setShipTo(qRead.ShipTo);
			obj.setCreatedBy(qRead.CreatedBy);
			obj.setCreatedDate(qRead.CreatedDate);
			obj.setLastMaintainedBy(qRead.LastMaintainedBy);
			obj.setLastMaintainedDate(qRead.LastMaintainedDate);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.sampleShipments.SampleShipment">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getSampleRequestID()>
		<cfset var local2=arguments.bean.getReferenceNumber()>
		<cfset var local3=arguments.bean.getComments()>
		<cfset var local4=arguments.bean.getAttentionTo()>
		<cfset var local5=arguments.bean.getSender()>
		<cfset var local6=arguments.bean.getBeforeShipmentStatus()>
		<cfset var local7=arguments.bean.getShippedDate()>
		<cfset var local8=arguments.bean.getShippedVia()>
		<cfset var local9=arguments.bean.getTrackingNumber()>
		<cfset var local10=arguments.bean.getShipmentStatus()>
		<cfset var local11=arguments.bean.getReceivedBy()>
		<cfset var local12=arguments.bean.getReceivedDate()>
		<cfset var local13=arguments.bean.getShipFrom()>
		<cfset var local14=arguments.bean.getShipTo()>
		<cfset var local15=arguments.bean.getCreatedBy()>
		<cfset var local16=arguments.bean.getCreatedDate()>
		<cfset var local17=arguments.bean.getLastMaintainedBy()>
		<cfset var local18=arguments.bean.getLastMaintainedDate()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into SampleShipments(SampleRequestID, ReferenceNumber, Comments, AttentionTo, Sender, BeforeShipmentStatus, ShippedDate, ShippedVia, TrackingNumber, ShipmentStatus, ReceivedBy, ReceivedDate, ShipFrom, ShipTo, CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_LONGVARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_INTEGER" null="#iif((local6 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local7 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local11#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local12#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local12 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local13#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local14#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local15#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local16#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local16 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local17#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local18#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local18 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select SampleShipmentID
				from SampleShipments
				where SampleRequestID = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and ReferenceNumber = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				  and Comments = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_LONGVARCHAR" />
				  and AttentionTo = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />
				  and Sender = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />
				  and BeforeShipmentStatus = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_INTEGER" null="#iif((local6 eq ""), de("yes"), de("no"))#" />
				  and ShippedDate = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local7 eq ""), de("yes"), de("no"))#" />
				  and ShippedVia = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />
				  and TrackingNumber = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />
				  and ShipmentStatus = <cfqueryparam value="#local10#" cfsqltype="CF_SQL_VARCHAR" />
				  and ReceivedBy = <cfqueryparam value="#local11#" cfsqltype="CF_SQL_VARCHAR" />
				  and ReceivedDate = <cfqueryparam value="#local12#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local12 eq ""), de("yes"), de("no"))#" />
				  and ShipFrom = <cfqueryparam value="#local13#" cfsqltype="CF_SQL_VARCHAR" />
				  and ShipTo = <cfqueryparam value="#local14#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedBy = <cfqueryparam value="#local15#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedDate = <cfqueryparam value="#local16#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local16 eq ""), de("yes"), de("no"))#" />
				  and LastMaintainedBy = <cfqueryparam value="#local17#" cfsqltype="CF_SQL_VARCHAR" />
				  and LastMaintainedDate = <cfqueryparam value="#local18#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local18 eq ""), de("yes"), de("no"))#" />
				order by SampleShipmentID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setSampleShipmentID(qGetID.SampleShipmentID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.sampleShipments.SampleShipment">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update SampleShipments
			set SampleRequestID = <cfqueryparam value="#arguments.bean.getSampleRequestID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getSampleRequestID() eq ""), de("yes"), de("no"))#" />,
				ReferenceNumber = <cfqueryparam value="#arguments.bean.getReferenceNumber()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getReferenceNumber() eq ""), de("yes"), de("no"))#" />,
				Comments = <cfqueryparam value="#arguments.bean.getComments()#" cfsqltype="CF_SQL_LONGVARCHAR" />,
				AttentionTo = <cfqueryparam value="#arguments.bean.getAttentionTo()#" cfsqltype="CF_SQL_VARCHAR" />,
				Sender = <cfqueryparam value="#arguments.bean.getSender()#" cfsqltype="CF_SQL_VARCHAR" />,
				BeforeShipmentStatus = <cfqueryparam value="#arguments.bean.getBeforeShipmentStatus()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getBeforeShipmentStatus() eq ""), de("yes"), de("no"))#" />,
				ShippedDate = <cfqueryparam value="#arguments.bean.getShippedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getShippedDate() eq ""), de("yes"), de("no"))#" />,
				ShippedVia = <cfqueryparam value="#arguments.bean.getShippedVia()#" cfsqltype="CF_SQL_VARCHAR" />,
				TrackingNumber = <cfqueryparam value="#arguments.bean.getTrackingNumber()#" cfsqltype="CF_SQL_VARCHAR" />,
				ShipmentStatus = <cfqueryparam value="#arguments.bean.getShipmentStatus()#" cfsqltype="CF_SQL_VARCHAR" />,
				ReceivedBy = <cfqueryparam value="#arguments.bean.getReceivedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				ReceivedDate = <cfqueryparam value="#arguments.bean.getReceivedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getReceivedDate() eq ""), de("yes"), de("no"))#" />,
				ShipFrom = <cfqueryparam value="#arguments.bean.getShipFrom()#" cfsqltype="CF_SQL_VARCHAR" />,
				ShipTo = <cfqueryparam value="#arguments.bean.getShipTo()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedBy = <cfqueryparam value="#arguments.bean.getCreatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedDate = <cfqueryparam value="#arguments.bean.getCreatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCreatedDate() eq ""), de("yes"), de("no"))#" />,
				LastMaintainedBy = <cfqueryparam value="#arguments.bean.getLastMaintainedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				LastMaintainedDate = <cfqueryparam value="#arguments.bean.getLastMaintainedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getLastMaintainedDate() eq ""), de("yes"), de("no"))#" />
			where SampleShipmentID = <cfqueryparam value="#arguments.bean.getSampleShipmentID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.sampleShipments.SampleShipment">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from SampleShipments
			where SampleShipmentID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getSampleShipmentID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>