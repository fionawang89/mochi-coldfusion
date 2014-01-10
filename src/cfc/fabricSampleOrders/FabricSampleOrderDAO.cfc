<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.fabricSampleOrders.FabricSampleOrder">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	FabricSampleOrderID, VendorID, FabricRequestID, OrderedBy, OrderDate, EstimateShipDate, 
					SampleYardage, CostPerYard, TotalCost, CostCurrency, ReceivedBy, 
					ReceivedDate, ReceivedQuantity, CancelledBy, CancelledDate, Comments, 
					FabricSampleOrderStatusID, CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate
					
			from FabricSampleOrders
			where FabricSampleOrderID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.fabricSampleOrders.FabricSampleOrder").init();
			obj.setFabricSampleOrderID(qRead.FabricSampleOrderID);
			obj.setVendorID(qRead.VendorID);
			obj.setFabricRequestID(qRead.FabricRequestID);
			obj.setOrderedBy(qRead.OrderedBy);
			obj.setOrderDate(qRead.OrderDate);
			obj.setEstimateShipDate(qRead.EstimateShipDate);
			obj.setSampleYardage(qRead.SampleYardage);
			obj.setCostPerYard(qRead.CostPerYard);
			obj.setTotalCost(qRead.TotalCost);
			obj.setCostCurrency(qRead.CostCurrency);
			obj.setReceivedBy(qRead.ReceivedBy);
			obj.setReceivedDate(qRead.ReceivedDate);
			obj.setReceivedQuantity(qRead.ReceivedQuantity);
			obj.setCancelledBy(qRead.CancelledBy);
			obj.setCancelledDate(qRead.CancelledDate);
			obj.setComments(qRead.Comments);
			obj.setFabricSampleOrderStatusID(qRead.FabricSampleOrderStatusID);
			obj.setCreatedBy(qRead.CreatedBy);
			obj.setCreatedDate(qRead.CreatedDate);
			obj.setLastMaintainedBy(qRead.LastMaintainedBy);
			obj.setLastMaintainedDate(qRead.LastMaintainedDate);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.fabricSampleOrders.FabricSampleOrder">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getVendorID()>
		<cfset var local2=arguments.bean.getFabricRequestID()>
		<cfset var local3=arguments.bean.getOrderedBy()>
		<cfset var local4=arguments.bean.getOrderDate()>
		<cfset var local5=arguments.bean.getEstimateShipDate()>
		<cfset var local6=arguments.bean.getSampleYardage()>
		<cfset var local7=arguments.bean.getCostPerYard()>
		<cfset var local8=arguments.bean.getTotalCost()>
		<cfset var local9=arguments.bean.getCostCurrency()>
		<cfset var local10=arguments.bean.getReceivedBy()>
		<cfset var local11=arguments.bean.getReceivedDate()>
		<cfset var local12=arguments.bean.getReceivedQuantity()>
		<cfset var local13=arguments.bean.getCancelledBy()>
		<cfset var local14=arguments.bean.getCancelledDate()>
		<cfset var local15=arguments.bean.getComments()>
		<cfset var local16=arguments.bean.getFabricSampleOrderStatusID()>
		<cfset var local17=arguments.bean.getCreatedBy()>
		<cfset var local18=arguments.bean.getCreatedDate()>
		<cfset var local19=arguments.bean.getLastMaintainedBy()>
		<cfset var local20=arguments.bean.getLastMaintainedDate()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into FabricSampleOrders(VendorID, FabricRequestID, OrderedBy, OrderDate, EstimateShipDate, SampleYardage, CostPerYard, TotalCost, CostCurrency, ReceivedBy, ReceivedDate, ReceivedQuantity, CancelledBy, CancelledDate, Comments, FabricSampleOrderStatusID, CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local4 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local5 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_DOUBLE" null="#iif((local6 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_DOUBLE" null="#iif((local7 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_DOUBLE" null="#iif((local8 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local11#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local11 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local12#" cfsqltype="CF_SQL_DOUBLE" null="#iif((local12 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local13#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local14#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local14 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local15#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local16#" cfsqltype="CF_SQL_INTEGER" null="#iif((local16 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local17#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local18#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local18 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local19#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local20#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local20 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select FabricSampleOrderID
				from FabricSampleOrders
				where VendorID = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and FabricRequestID = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				  and OrderedBy = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				  and OrderDate = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local4 eq ""), de("yes"), de("no"))#" />
				  and EstimateShipDate = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local5 eq ""), de("yes"), de("no"))#" />
				  and SampleYardage = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_DOUBLE" null="#iif((local6 eq ""), de("yes"), de("no"))#" />
				  and CostPerYard = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_DOUBLE" null="#iif((local7 eq ""), de("yes"), de("no"))#" />
				  and TotalCost = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_DOUBLE" null="#iif((local8 eq ""), de("yes"), de("no"))#" />
				  and CostCurrency = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />
				  and ReceivedBy = <cfqueryparam value="#local10#" cfsqltype="CF_SQL_VARCHAR" />
				  and ReceivedDate = <cfqueryparam value="#local11#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local11 eq ""), de("yes"), de("no"))#" />
				  and ReceivedQuantity = <cfqueryparam value="#local12#" cfsqltype="CF_SQL_DOUBLE" null="#iif((local12 eq ""), de("yes"), de("no"))#" />
				  and CancelledBy = <cfqueryparam value="#local13#" cfsqltype="CF_SQL_VARCHAR" />
				  and CancelledDate = <cfqueryparam value="#local14#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local14 eq ""), de("yes"), de("no"))#" />
				  and Comments = <cfqueryparam value="#local15#" cfsqltype="CF_SQL_VARCHAR" />
				  and FabricSampleOrderStatusID = <cfqueryparam value="#local16#" cfsqltype="CF_SQL_INTEGER" null="#iif((local16 eq ""), de("yes"), de("no"))#" />
				  and CreatedBy = <cfqueryparam value="#local17#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedDate = <cfqueryparam value="#local18#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local18 eq ""), de("yes"), de("no"))#" />
				  and LastMaintainedBy = <cfqueryparam value="#local19#" cfsqltype="CF_SQL_VARCHAR" />
				  and LastMaintainedDate = <cfqueryparam value="#local20#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local20 eq ""), de("yes"), de("no"))#" />
				order by FabricSampleOrderID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setFabricSampleOrderID(qGetID.FabricSampleOrderID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.fabricSampleOrders.FabricSampleOrder">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update FabricSampleOrders
			set VendorID = <cfqueryparam value="#arguments.bean.getVendorID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getVendorID() eq ""), de("yes"), de("no"))#" />,
				FabricRequestID = <cfqueryparam value="#arguments.bean.getFabricRequestID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getFabricRequestID() eq ""), de("yes"), de("no"))#" />,
				OrderedBy = <cfqueryparam value="#arguments.bean.getOrderedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				OrderDate = <cfqueryparam value="#arguments.bean.getOrderDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getOrderDate() eq ""), de("yes"), de("no"))#" />,
				EstimateShipDate = <cfqueryparam value="#arguments.bean.getEstimateShipDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getEstimateShipDate() eq ""), de("yes"), de("no"))#" />,
				SampleYardage = <cfqueryparam value="#arguments.bean.getSampleYardage()#" cfsqltype="CF_SQL_DOUBLE" null="#iif((arguments.bean.getSampleYardage() eq ""), de("yes"), de("no"))#" />,
				CostPerYard = <cfqueryparam value="#arguments.bean.getCostPerYard()#" cfsqltype="CF_SQL_DOUBLE" null="#iif((arguments.bean.getCostPerYard() eq ""), de("yes"), de("no"))#" />,
				TotalCost = <cfqueryparam value="#arguments.bean.getTotalCost()#" cfsqltype="CF_SQL_DOUBLE" null="#iif((arguments.bean.getTotalCost() eq ""), de("yes"), de("no"))#" />,
				CostCurrency = <cfqueryparam value="#arguments.bean.getCostCurrency()#" cfsqltype="CF_SQL_VARCHAR" />,
				ReceivedBy = <cfqueryparam value="#arguments.bean.getReceivedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				ReceivedDate = <cfqueryparam value="#arguments.bean.getReceivedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getReceivedDate() eq ""), de("yes"), de("no"))#" />,
				ReceivedQuantity = <cfqueryparam value="#arguments.bean.getReceivedQuantity()#" cfsqltype="CF_SQL_DOUBLE" null="#iif((arguments.bean.getReceivedQuantity() eq ""), de("yes"), de("no"))#" />,
				CancelledBy = <cfqueryparam value="#arguments.bean.getCancelledBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				CancelledDate = <cfqueryparam value="#arguments.bean.getCancelledDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCancelledDate() eq ""), de("yes"), de("no"))#" />,
				Comments = <cfqueryparam value="#arguments.bean.getComments()#" cfsqltype="CF_SQL_VARCHAR" />,
				FabricSampleOrderStatusID = <cfqueryparam value="#arguments.bean.getFabricSampleOrderStatusID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getFabricSampleOrderStatusID() eq ""), de("yes"), de("no"))#" />,
				CreatedBy = <cfqueryparam value="#arguments.bean.getCreatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedDate = <cfqueryparam value="#arguments.bean.getCreatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCreatedDate() eq ""), de("yes"), de("no"))#" />,
				LastMaintainedBy = <cfqueryparam value="#arguments.bean.getLastMaintainedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				LastMaintainedDate = <cfqueryparam value="#arguments.bean.getLastMaintainedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getLastMaintainedDate() eq ""), de("yes"), de("no"))#" />
			where FabricSampleOrderID = <cfqueryparam value="#arguments.bean.getFabricSampleOrderID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.fabricSampleOrders.FabricSampleOrder">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from FabricSampleOrders
			where FabricSampleOrderID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getFabricSampleOrderID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>