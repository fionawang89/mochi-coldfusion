<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.productionProgress.ProductionProgressDetail">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	ProductionProgressDetailID, ProductionProgressID, OperationProcessID, FinishedDate, PlanDate, ProductionDetailStatusID, 
					Status, Comments, Revision, CreatedBy, CreatedDate, 
					LastMaintainedBy, LastMaintainedDate
			from ProductionProgressDetail
			where ProductionProgressDetailID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.productionProgress.ProductionProgressDetail").init();
			obj.setProductionProgressDetailID(qRead.ProductionProgressDetailID);
			obj.setProductionProgressID(qRead.ProductionProgressID);
			obj.setOperationProcessID(qRead.OperationProcessID);
			obj.setFinishedDate(qRead.FinishedDate);
			obj.setPlanDate(qRead.PlanDate);
			obj.setProductionDetailStatusID(qRead.ProductionDetailStatusID);
			obj.setStatus(qRead.Status);
			obj.setComments(qRead.Comments);
			obj.setRevision(qRead.Revision);
			obj.setCreatedBy(qRead.CreatedBy);
			obj.setCreatedDate(qRead.CreatedDate);
			obj.setLastMaintainedBy(qRead.LastMaintainedBy);
			obj.setLastMaintainedDate(qRead.LastMaintainedDate);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.productionProgress.ProductionProgressDetail">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getProductionProgressID()>
		<cfset var local2=arguments.bean.getOperationProcessID()>
		<cfset var local3=arguments.bean.getFinishedDate()>
		<cfset var local4=arguments.bean.getPlanDate()>
		<cfset var local5=arguments.bean.getProductionDetailStatusID()>
		<cfset var local6=arguments.bean.getStatus()>
		<cfset var local7=arguments.bean.getComments()>
		<cfset var local8=arguments.bean.getRevision()>
		<cfset var local9=arguments.bean.getCreatedBy()>
		<cfset var local10=arguments.bean.getCreatedDate()>
		<cfset var local11=arguments.bean.getLastMaintainedBy()>
		<cfset var local12=arguments.bean.getLastMaintainedDate()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into ProductionProgressDetail(ProductionProgressID, OperationProcessID, FinishedDate, PlanDate, ProductionDetailStatusID, Status, Comments, Revision, CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local3 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local4 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_INTEGER" null="#iif((local5 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_LONGVARCHAR" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_INTEGER" null="#iif((local8 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local10 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local11#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local12#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local12 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select ProductionProgressDetailID
				from ProductionProgressDetail
				where ProductionProgressID = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and OperationProcessID = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				  and FinishedDate = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local3 eq ""), de("yes"), de("no"))#" />
				  and PlanDate = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local4 eq ""), de("yes"), de("no"))#" />
				  and ProductionDetailStatusID = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_INTEGER" null="#iif((local5 eq ""), de("yes"), de("no"))#" />
				  and Status = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />
				  and Comments = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_LONGVARCHAR" />
				  and Revision = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_INTEGER" null="#iif((local8 eq ""), de("yes"), de("no"))#" />
				  and CreatedBy = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedDate = <cfqueryparam value="#local10#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local10 eq ""), de("yes"), de("no"))#" />
				  and LastMaintainedBy = <cfqueryparam value="#local11#" cfsqltype="CF_SQL_VARCHAR" />
				  and LastMaintainedDate = <cfqueryparam value="#local12#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local12 eq ""), de("yes"), de("no"))#" />
				order by ProductionProgressDetailID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setProductionProgressDetailID(qGetID.ProductionProgressDetailID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.productionProgress.ProductionProgressDetail">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update ProductionProgressDetail
			set ProductionProgressID = <cfqueryparam value="#arguments.bean.getProductionProgressID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getProductionProgressID() eq ""), de("yes"), de("no"))#" />,
				OperationProcessID = <cfqueryparam value="#arguments.bean.getOperationProcessID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getOperationProcessID() eq ""), de("yes"), de("no"))#" />,
				FinishedDate = <cfqueryparam value="#arguments.bean.getFinishedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getFinishedDate() eq ""), de("yes"), de("no"))#" />,
				PlanDate = <cfqueryparam value="#arguments.bean.getPlanDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getPlanDate() eq ""), de("yes"), de("no"))#" />,
				ProductionDetailStatusID = <cfqueryparam value="#arguments.bean.getProductionDetailStatusID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getProductionDetailStatusID() eq ""), de("yes"), de("no"))#" />,
				Status = <cfqueryparam value="#arguments.bean.getStatus()#" cfsqltype="CF_SQL_VARCHAR" />,
				Comments = <cfqueryparam value="#arguments.bean.getComments()#" cfsqltype="CF_SQL_LONGVARCHAR" />,
				Revision = <cfqueryparam value="#arguments.bean.getRevision()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getRevision() eq ""), de("yes"), de("no"))#" />,
				CreatedBy = <cfqueryparam value="#arguments.bean.getCreatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedDate = <cfqueryparam value="#arguments.bean.getCreatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCreatedDate() eq ""), de("yes"), de("no"))#" />,
				LastMaintainedBy = <cfqueryparam value="#arguments.bean.getLastMaintainedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				LastMaintainedDate = <cfqueryparam value="#arguments.bean.getLastMaintainedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getLastMaintainedDate() eq ""), de("yes"), de("no"))#" />
			where ProductionProgressDetailID = <cfqueryparam value="#arguments.bean.getProductionProgressDetailID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.productionProgress.ProductionProgressDetail">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from ProductionProgressDetail
			where ProductionProgressDetailID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getProductionProgressDetailID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>