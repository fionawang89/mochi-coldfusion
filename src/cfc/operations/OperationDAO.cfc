<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.operations.Operation">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	OperationID, Operation, OperationCode, Description, RequireDocument, CreatedBy, 
					CreatedDate, LastMaintainedBy, LastMaintainedDate
			from Operations
			where OperationID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.operations.Operation").init();
			obj.setOperationID(qRead.OperationID);
			obj.setOperation(qRead.Operation);
			obj.setOperationCode(qRead.OperationCode);
			obj.setDescription(qRead.Description);
			obj.setRequireDocument(qRead.RequireDocument);
			obj.setCreatedBy(qRead.CreatedBy);
			obj.setCreatedDate(qRead.CreatedDate);
			obj.setLastMaintainedBy(qRead.LastMaintainedBy);
			obj.setLastMaintainedDate(qRead.LastMaintainedDate);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.operations.Operation">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getOperation()>
		<cfset var local2=arguments.bean.getOperationCode()>
		<cfset var local3=arguments.bean.getDescription()>
		<cfset var local4=arguments.bean.getRequireDocument()>
		<cfset var local5=arguments.bean.getCreatedBy()>
		<cfset var local6=arguments.bean.getCreatedDate()>
		<cfset var local7=arguments.bean.getLastMaintainedBy()>
		<cfset var local8=arguments.bean.getLastMaintainedDate()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into Operations(Operation, OperationCode, Description, RequireDocument, CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_BIT" null="#iif((local4 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local6 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local8 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select OperationID
				from Operations
				where Operation = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />
				  and OperationCode = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				  and Description = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				  and RequireDocument = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_BIT" null="#iif((local4 eq ""), de("yes"), de("no"))#" />
				  and CreatedBy = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedDate = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local6 eq ""), de("yes"), de("no"))#" />
				  and LastMaintainedBy = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />
				  and LastMaintainedDate = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local8 eq ""), de("yes"), de("no"))#" />
				order by OperationID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setOperationID(qGetID.OperationID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.operations.Operation">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update Operations
			set Operation = <cfqueryparam value="#arguments.bean.getOperation()#" cfsqltype="CF_SQL_VARCHAR" />,
				OperationCode = <cfqueryparam value="#arguments.bean.getOperationCode()#" cfsqltype="CF_SQL_VARCHAR" />,
				Description = <cfqueryparam value="#arguments.bean.getDescription()#" cfsqltype="CF_SQL_VARCHAR" />,
				RequireDocument = <cfqueryparam value="#arguments.bean.getRequireDocument()#" cfsqltype="CF_SQL_BIT" null="#iif((arguments.bean.getRequireDocument() eq ""), de("yes"), de("no"))#" />,
				CreatedBy = <cfqueryparam value="#arguments.bean.getCreatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedDate = <cfqueryparam value="#arguments.bean.getCreatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCreatedDate() eq ""), de("yes"), de("no"))#" />,
				LastMaintainedBy = <cfqueryparam value="#arguments.bean.getLastMaintainedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				LastMaintainedDate = <cfqueryparam value="#arguments.bean.getLastMaintainedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getLastMaintainedDate() eq ""), de("yes"), de("no"))#" />
			where OperationID = <cfqueryparam value="#arguments.bean.getOperationID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.operations.Operation">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from Operations
			where OperationID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getOperationID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>