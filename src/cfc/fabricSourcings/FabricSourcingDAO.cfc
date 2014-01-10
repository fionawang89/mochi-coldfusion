<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.fabricSourcings.FabricSourcing">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	FabricSourcingID, FabricRequestID, VendorID, RequestedBy, RequestDate, Minimum, 
					USDPrice, RMBPrice, Comments, CreatedBy, CreatedDate, 
					LastMaintainedBy, LastMaintainedDate
			from FabricSourcings
			where FabricSourcingID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.fabricSourcings.FabricSourcing").init();
			obj.setFabricSourcingID(qRead.FabricSourcingID);
			obj.setFabricRequestID(qRead.FabricRequestID);
			obj.setVendorID(qRead.VendorID);
			obj.setRequestedBy(qRead.RequestedBy);
			obj.setRequestDate(qRead.RequestDate);
			obj.setMinimum(qRead.Minimum);
			obj.setUSDPrice(qRead.USDPrice);
			obj.setRMBPrice(qRead.RMBPrice);
			obj.setComments(qRead.Comments);
			obj.setCreatedBy(qRead.CreatedBy);
			obj.setCreatedDate(qRead.CreatedDate);
			obj.setLastMaintainedBy(qRead.LastMaintainedBy);
			obj.setLastMaintainedDate(qRead.LastMaintainedDate);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.fabricSourcings.FabricSourcing">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getFabricRequestID()>
		<cfset var local2=arguments.bean.getVendorID()>
		<cfset var local3=arguments.bean.getRequestedBy()>
		<cfset var local4=arguments.bean.getRequestDate()>
		<cfset var local5=arguments.bean.getMinimum()>
		<cfset var local6=arguments.bean.getUSDPrice()>
		<cfset var local7=arguments.bean.getRMBPrice()>
		<cfset var local8=arguments.bean.getComments()>
		<cfset var local9=arguments.bean.getCreatedBy()>
		<cfset var local10=arguments.bean.getCreatedDate()>
		<cfset var local11=arguments.bean.getLastMaintainedBy()>
		<cfset var local12=arguments.bean.getLastMaintainedDate()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into FabricSourcings(FabricRequestID, VendorID, RequestedBy, RequestDate, Minimum, USDPrice, RMBPrice, Comments, CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local4 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_DOUBLE" null="#iif((local5 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_DOUBLE" null="#iif((local6 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_DOUBLE" null="#iif((local7 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local10 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local11#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local12#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local12 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select FabricSourcingID
				from FabricSourcings
				where FabricRequestID = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and VendorID = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				  and RequestedBy = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				  and RequestDate = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local4 eq ""), de("yes"), de("no"))#" />
				  and Minimum = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_DOUBLE" null="#iif((local5 eq ""), de("yes"), de("no"))#" />
				  and USDPrice = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_DOUBLE" null="#iif((local6 eq ""), de("yes"), de("no"))#" />
				  and RMBPrice = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_DOUBLE" null="#iif((local7 eq ""), de("yes"), de("no"))#" />
				  and Comments = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedBy = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedDate = <cfqueryparam value="#local10#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local10 eq ""), de("yes"), de("no"))#" />
				  and LastMaintainedBy = <cfqueryparam value="#local11#" cfsqltype="CF_SQL_VARCHAR" />
				  and LastMaintainedDate = <cfqueryparam value="#local12#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local12 eq ""), de("yes"), de("no"))#" />
				order by FabricSourcingID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setFabricSourcingID(qGetID.FabricSourcingID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.fabricSourcings.FabricSourcing">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update FabricSourcings
			set FabricRequestID = <cfqueryparam value="#arguments.bean.getFabricRequestID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getFabricRequestID() eq ""), de("yes"), de("no"))#" />,
				VendorID = <cfqueryparam value="#arguments.bean.getVendorID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getVendorID() eq ""), de("yes"), de("no"))#" />,
				RequestedBy = <cfqueryparam value="#arguments.bean.getRequestedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				RequestDate = <cfqueryparam value="#arguments.bean.getRequestDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getRequestDate() eq ""), de("yes"), de("no"))#" />,
				Minimum = <cfqueryparam value="#arguments.bean.getMinimum()#" cfsqltype="CF_SQL_DOUBLE" null="#iif((arguments.bean.getMinimum() eq ""), de("yes"), de("no"))#" />,
				USDPrice = <cfqueryparam value="#arguments.bean.getUSDPrice()#" cfsqltype="CF_SQL_DOUBLE" null="#iif((arguments.bean.getUSDPrice() eq ""), de("yes"), de("no"))#" />,
				RMBPrice = <cfqueryparam value="#arguments.bean.getRMBPrice()#" cfsqltype="CF_SQL_DOUBLE" null="#iif((arguments.bean.getRMBPrice() eq ""), de("yes"), de("no"))#" />,
				Comments = <cfqueryparam value="#arguments.bean.getComments()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedBy = <cfqueryparam value="#arguments.bean.getCreatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedDate = <cfqueryparam value="#arguments.bean.getCreatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCreatedDate() eq ""), de("yes"), de("no"))#" />,
				LastMaintainedBy = <cfqueryparam value="#arguments.bean.getLastMaintainedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				LastMaintainedDate = <cfqueryparam value="#arguments.bean.getLastMaintainedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getLastMaintainedDate() eq ""), de("yes"), de("no"))#" />
			where FabricSourcingID = <cfqueryparam value="#arguments.bean.getFabricSourcingID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.fabricSourcings.FabricSourcing">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from FabricSourcings
			where FabricSourcingID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getFabricSourcingID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>