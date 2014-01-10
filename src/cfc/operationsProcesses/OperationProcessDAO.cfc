<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.operationsProcesses.OperationProcess">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	OperationProcessID, ProcessID, OperationID, Sequence, Dependency, PersonInCharge, 
					PercentDaysToFinish, CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate
					
			from OperationsProcesses
			where OperationProcessID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.operationsProcesses.OperationProcess").init();
			obj.setOperationProcessID(qRead.OperationProcessID);
			obj.setProcessID(qRead.ProcessID);
			obj.setOperationID(qRead.OperationID);
			obj.setSequence(qRead.Sequence);
			obj.setDependency(qRead.Dependency);
			obj.setPersonInCharge(qRead.PersonInCharge);
			obj.setPercentDaysToFinish(qRead.PercentDaysToFinish);
			obj.setCreatedBy(qRead.CreatedBy);
			obj.setCreatedDate(qRead.CreatedDate);
			obj.setLastMaintainedBy(qRead.LastMaintainedBy);
			obj.setLastMaintainedDate(qRead.LastMaintainedDate);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.operationsProcesses.OperationProcess">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getProcessID()>
		<cfset var local2=arguments.bean.getOperationID()>
		<cfset var local3=arguments.bean.getSequence()>
		<cfset var local4=arguments.bean.getDependency()>
		<cfset var local5=arguments.bean.getPersonInCharge()>
		<cfset var local6=arguments.bean.getPercentDaysToFinish()>
		<cfset var local7=arguments.bean.getCreatedBy()>
		<cfset var local8=arguments.bean.getCreatedDate()>
		<cfset var local9=arguments.bean.getLastMaintainedBy()>
		<cfset var local10=arguments.bean.getLastMaintainedDate()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into OperationsProcesses(ProcessID, OperationID, Sequence, Dependency, PersonInCharge, PercentDaysToFinish, CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_INTEGER" null="#iif((local3 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_INTEGER" null="#iif((local4 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_REAL" null="#iif((local6 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local8 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local10 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select OperationProcessID
				from OperationsProcesses
				where ProcessID = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and OperationID = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				  and Sequence = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_INTEGER" null="#iif((local3 eq ""), de("yes"), de("no"))#" />
				  and Dependency = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_INTEGER" null="#iif((local4 eq ""), de("yes"), de("no"))#" />
				  and PersonInCharge = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />
				  and PercentDaysToFinish = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_REAL" null="#iif((local6 eq ""), de("yes"), de("no"))#" />
				  and CreatedBy = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedDate = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local8 eq ""), de("yes"), de("no"))#" />
				  and LastMaintainedBy = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />
				  and LastMaintainedDate = <cfqueryparam value="#local10#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local10 eq ""), de("yes"), de("no"))#" />
				order by OperationProcessID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setOperationProcessID(qGetID.OperationProcessID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.operationsProcesses.OperationProcess">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update OperationsProcesses
			set ProcessID = <cfqueryparam value="#arguments.bean.getProcessID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getProcessID() eq ""), de("yes"), de("no"))#" />,
				OperationID = <cfqueryparam value="#arguments.bean.getOperationID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getOperationID() eq ""), de("yes"), de("no"))#" />,
				Sequence = <cfqueryparam value="#arguments.bean.getSequence()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getSequence() eq ""), de("yes"), de("no"))#" />,
				Dependency = <cfqueryparam value="#arguments.bean.getDependency()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getDependency() eq ""), de("yes"), de("no"))#" />,
				PersonInCharge = <cfqueryparam value="#arguments.bean.getPersonInCharge()#" cfsqltype="CF_SQL_VARCHAR" />,
				PercentDaysToFinish = <cfqueryparam value="#arguments.bean.getPercentDaysToFinish()#" cfsqltype="CF_SQL_REAL" null="#iif((arguments.bean.getPercentDaysToFinish() eq ""), de("yes"), de("no"))#" />,
				CreatedBy = <cfqueryparam value="#arguments.bean.getCreatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedDate = <cfqueryparam value="#arguments.bean.getCreatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCreatedDate() eq ""), de("yes"), de("no"))#" />,
				LastMaintainedBy = <cfqueryparam value="#arguments.bean.getLastMaintainedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				LastMaintainedDate = <cfqueryparam value="#arguments.bean.getLastMaintainedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getLastMaintainedDate() eq ""), de("yes"), de("no"))#" />
			where OperationProcessID = <cfqueryparam value="#arguments.bean.getOperationProcessID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.operationsProcesses.OperationProcess">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from OperationsProcesses
			where OperationProcessID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getOperationProcessID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>