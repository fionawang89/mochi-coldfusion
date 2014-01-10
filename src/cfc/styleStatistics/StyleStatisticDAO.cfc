<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.styleStatistics.StyleStatistic">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	StyleStatisticID, StyleID, SalesUnits, SalesAmount
			from StyleStatistics
			where StyleStatisticID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.styleStatistics.StyleStatistic").init();
			obj.setStyleStatisticID(qRead.StyleStatisticID);
			obj.setStyleID(qRead.StyleID);
			obj.setSalesUnits(qRead.SalesUnits);
			obj.setSalesAmount(qRead.SalesAmount);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.styleStatistics.StyleStatistic">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getStyleID()>
		<cfset var local2=arguments.bean.getSalesUnits()>
		<cfset var local3=arguments.bean.getSalesAmount()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into StyleStatistics(StyleID, SalesUnits, SalesAmount)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_INTEGER" null="#iif((local3 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select StyleStatisticID
				from StyleStatistics
				where StyleID = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and SalesUnits = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				  and SalesAmount = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_INTEGER" null="#iif((local3 eq ""), de("yes"), de("no"))#" />
				order by StyleStatisticID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setStyleStatisticID(qGetID.StyleStatisticID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.styleStatistics.StyleStatistic">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update StyleStatistics
			set StyleID = <cfqueryparam value="#arguments.bean.getStyleID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getStyleID() eq ""), de("yes"), de("no"))#" />,
				SalesUnits = <cfqueryparam value="#arguments.bean.getSalesUnits()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getSalesUnits() eq ""), de("yes"), de("no"))#" />,
				SalesAmount = <cfqueryparam value="#arguments.bean.getSalesAmount()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getSalesAmount() eq ""), de("yes"), de("no"))#" />
			where StyleStatisticID = <cfqueryparam value="#arguments.bean.getStyleStatisticID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.styleStatistics.StyleStatistic">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from StyleStatistics
			where StyleStatisticID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getStyleStatisticID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>