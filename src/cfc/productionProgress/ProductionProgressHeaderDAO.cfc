<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.productionProgress.ProductionProgressHeader">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	ProductionProgressID, CompanyNumber, CutNumber, Style, Color, IssueDate, 
					DueDate, Issued, TotalWorkDays, Contractor, Status, 
					Comments, CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate
					
			from ProductionProgressHeader
			where ProductionProgressID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.productionProgress.ProductionProgressHeader").init();
			obj.setProductionProgressID(qRead.ProductionProgressID);
			obj.setCompanyNumber(qRead.CompanyNumber);
			obj.setCutNumber(qRead.CutNumber);
			obj.setStyle(qRead.Style);
			obj.setColor(qRead.Color);
			obj.setIssueDate(qRead.IssueDate);
			obj.setDueDate(qRead.DueDate);
			obj.setIssued(qRead.Issued);
			obj.setTotalWorkDays(qRead.TotalWorkDays);
			obj.setContractor(qRead.Contractor);
			obj.setStatus(qRead.Status);
			obj.setComments(qRead.Comments);
			obj.setCreatedBy(qRead.CreatedBy);
			obj.setCreatedDate(qRead.CreatedDate);
			obj.setLastMaintainedBy(qRead.LastMaintainedBy);
			obj.setLastMaintainedDate(qRead.LastMaintainedDate);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.productionProgress.ProductionProgressHeader">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getCompanyNumber()>
		<cfset var local2=arguments.bean.getCutNumber()>
		<cfset var local3=arguments.bean.getStyle()>
		<cfset var local4=arguments.bean.getColor()>
		<cfset var local5=arguments.bean.getIssueDate()>
		<cfset var local6=arguments.bean.getDueDate()>
		<cfset var local7=arguments.bean.getIssued()>
		<cfset var local8=arguments.bean.getTotalWorkDays()>
		<cfset var local9=arguments.bean.getContractor()>
		<cfset var local10=arguments.bean.getStatus()>
		<cfset var local11=arguments.bean.getComments()>
		<cfset var local12=arguments.bean.getCreatedBy()>
		<cfset var local13=arguments.bean.getCreatedDate()>
		<cfset var local14=arguments.bean.getLastMaintainedBy()>
		<cfset var local15=arguments.bean.getLastMaintainedDate()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into ProductionProgressHeader(CompanyNumber, CutNumber, Style, Color, IssueDate, DueDate, Issued, TotalWorkDays, Contractor, Status, Comments, CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local5 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local6 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_INTEGER" null="#iif((local7 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_INTEGER" null="#iif((local8 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_INTEGER" null="#iif((local10 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local11#" cfsqltype="CF_SQL_LONGVARCHAR" />,
					<cfqueryparam value="#local12#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local13#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local13 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local14#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local15#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local15 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select ProductionProgressID
				from ProductionProgressHeader
				where CompanyNumber = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and CutNumber = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				  and Style = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				  and Color = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />
				  and IssueDate = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local5 eq ""), de("yes"), de("no"))#" />
				  and DueDate = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local6 eq ""), de("yes"), de("no"))#" />
				  and Issued = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_INTEGER" null="#iif((local7 eq ""), de("yes"), de("no"))#" />
				  and TotalWorkDays = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_INTEGER" null="#iif((local8 eq ""), de("yes"), de("no"))#" />
				  and Contractor = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />
				  and Status = <cfqueryparam value="#local10#" cfsqltype="CF_SQL_INTEGER" null="#iif((local10 eq ""), de("yes"), de("no"))#" />
				  and Comments = <cfqueryparam value="#local11#" cfsqltype="CF_SQL_LONGVARCHAR" />
				  and CreatedBy = <cfqueryparam value="#local12#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedDate = <cfqueryparam value="#local13#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local13 eq ""), de("yes"), de("no"))#" />
				  and LastMaintainedBy = <cfqueryparam value="#local14#" cfsqltype="CF_SQL_VARCHAR" />
				  and LastMaintainedDate = <cfqueryparam value="#local15#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local15 eq ""), de("yes"), de("no"))#" />
				order by ProductionProgressID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setProductionProgressID(qGetID.ProductionProgressID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.productionProgress.ProductionProgressHeader">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update ProductionProgressHeader
			set CompanyNumber = <cfqueryparam value="#arguments.bean.getCompanyNumber()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getCompanyNumber() eq ""), de("yes"), de("no"))#" />,
				CutNumber = <cfqueryparam value="#arguments.bean.getCutNumber()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getCutNumber() eq ""), de("yes"), de("no"))#" />,
				Style = <cfqueryparam value="#arguments.bean.getStyle()#" cfsqltype="CF_SQL_VARCHAR" />,
				Color = <cfqueryparam value="#arguments.bean.getColor()#" cfsqltype="CF_SQL_VARCHAR" />,
				IssueDate = <cfqueryparam value="#arguments.bean.getIssueDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getIssueDate() eq ""), de("yes"), de("no"))#" />,
				DueDate = <cfqueryparam value="#arguments.bean.getDueDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getDueDate() eq ""), de("yes"), de("no"))#" />,
				Issued = <cfqueryparam value="#arguments.bean.getIssued()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getIssued() eq ""), de("yes"), de("no"))#" />,
				TotalWorkDays = <cfqueryparam value="#arguments.bean.getTotalWorkDays()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getTotalWorkDays() eq ""), de("yes"), de("no"))#" />,
				Contractor = <cfqueryparam value="#arguments.bean.getContractor()#" cfsqltype="CF_SQL_VARCHAR" />,
				Status = <cfqueryparam value="#arguments.bean.getStatus()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getStatus() eq ""), de("yes"), de("no"))#" />,
				Comments = <cfqueryparam value="#arguments.bean.getComments()#" cfsqltype="CF_SQL_LONGVARCHAR" />,
				CreatedBy = <cfqueryparam value="#arguments.bean.getCreatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedDate = <cfqueryparam value="#arguments.bean.getCreatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCreatedDate() eq ""), de("yes"), de("no"))#" />,
				LastMaintainedBy = <cfqueryparam value="#arguments.bean.getLastMaintainedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				LastMaintainedDate = <cfqueryparam value="#arguments.bean.getLastMaintainedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getLastMaintainedDate() eq ""), de("yes"), de("no"))#" />
			where ProductionProgressID = <cfqueryparam value="#arguments.bean.getProductionProgressID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.productionProgress.ProductionProgressHeader">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from ProductionProgressHeader
			where ProductionProgressID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getProductionProgressID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>