<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.styleAttributeSearchIndex.StyleAttributeSearchIndex">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	StyleAttributeSearchIndexID, StyleID, Hits
			from StyleAttributeSearchIndex
			where StyleAttributeSearchIndexID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.styleAttributeSearchIndex.StyleAttributeSearchIndex").init();
			obj.setStyleAttributeSearchIndexID(qRead.StyleAttributeSearchIndexID);
			obj.setStyleID(qRead.StyleID);
			obj.setHits(qRead.Hits);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.styleAttributeSearchIndex.StyleAttributeSearchIndex">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getStyleID()>
		<cfset var local2=arguments.bean.getHits()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into StyleAttributeSearchIndex(StyleID, Hits)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select StyleAttributeSearchIndexID
				from StyleAttributeSearchIndex
				where StyleID = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and Hits = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				order by StyleAttributeSearchIndexID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setStyleAttributeSearchIndexID(qGetID.StyleAttributeSearchIndexID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.styleAttributeSearchIndex.StyleAttributeSearchIndex">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update StyleAttributeSearchIndex
			set StyleID = <cfqueryparam value="#arguments.bean.getStyleID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getStyleID() eq ""), de("yes"), de("no"))#" />,
				Hits = <cfqueryparam value="#arguments.bean.getHits()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getHits() eq ""), de("yes"), de("no"))#" />
			where StyleAttributeSearchIndexID = <cfqueryparam value="#arguments.bean.getStyleAttributeSearchIndexID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.styleAttributeSearchIndex.StyleAttributeSearchIndex">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from StyleAttributeSearchIndex
			where StyleAttributeSearchIndexID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getStyleAttributeSearchIndexID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>