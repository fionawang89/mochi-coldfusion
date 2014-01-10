<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.resultCodes.ResultCode">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	ResultCodeID, Code, Description, CreatedBy, CreatedDate, LastMaintainedBy, 
					LastMaintainedDate
			from ResultCodes
			where ResultCodeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.resultCodes.ResultCode").init();
			obj.setResultCodeID(qRead.ResultCodeID);
			obj.setCode(qRead.Code);
			obj.setDescription(qRead.Description);
			obj.setCreatedBy(qRead.CreatedBy);
			obj.setCreatedDate(qRead.CreatedDate);
			obj.setLastMaintainedBy(qRead.LastMaintainedBy);
			obj.setLastMaintainedDate(qRead.LastMaintainedDate);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.resultCodes.ResultCode">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getCode()>
		<cfset var local2=arguments.bean.getDescription()>
		<cfset var local3=arguments.bean.getCreatedBy()>
		<cfset var local4=arguments.bean.getCreatedDate()>
		<cfset var local5=arguments.bean.getLastMaintainedBy()>
		<cfset var local6=arguments.bean.getLastMaintainedDate()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into ResultCodes(Code, Description, CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local4 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local6 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select ResultCodeID
				from ResultCodes
				where Code = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />
				  and Description = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedBy = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedDate = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local4 eq ""), de("yes"), de("no"))#" />
				  and LastMaintainedBy = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />
				  and LastMaintainedDate = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local6 eq ""), de("yes"), de("no"))#" />
				order by ResultCodeID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setResultCodeID(qGetID.ResultCodeID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.resultCodes.ResultCode">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update ResultCodes
			set Code = <cfqueryparam value="#arguments.bean.getCode()#" cfsqltype="CF_SQL_VARCHAR" />,
				Description = <cfqueryparam value="#arguments.bean.getDescription()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedBy = <cfqueryparam value="#arguments.bean.getCreatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedDate = <cfqueryparam value="#arguments.bean.getCreatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCreatedDate() eq ""), de("yes"), de("no"))#" />,
				LastMaintainedBy = <cfqueryparam value="#arguments.bean.getLastMaintainedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				LastMaintainedDate = <cfqueryparam value="#arguments.bean.getLastMaintainedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getLastMaintainedDate() eq ""), de("yes"), de("no"))#" />
			where ResultCodeID = <cfqueryparam value="#arguments.bean.getResultCodeID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.resultCodes.ResultCode">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from ResultCodes
			where ResultCodeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getResultCodeID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>