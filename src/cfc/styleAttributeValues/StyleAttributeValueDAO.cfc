<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.styleAttributeValues.StyleAttributeValue">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	StyleAttributeValueID, StyleAttributeOptionID, StyleID
			from StyleAttributeValues
			where StyleAttributeValueID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.styleAttributeValues.StyleAttributeValue").init();
			obj.setStyleAttributeValueID(qRead.StyleAttributeValueID);
			obj.setStyleAttributeOptionID(qRead.StyleAttributeOptionID);
			obj.setStyleID(qRead.StyleID);
			return obj;
		</cfscript>
	</cffunction>


	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.styleAttributeValues.StyleAttributeValue">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getStyleAttributeOptionID()>
		<cfset var local2=arguments.bean.getStyleID()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into StyleAttributeValues(StyleAttributeOptionID, StyleID)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select StyleAttributeValueID
				from StyleAttributeValues
				where StyleAttributeOptionID = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and StyleID = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				order by StyleAttributeValueID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setStyleAttributeValueID(qGetID.StyleAttributeValueID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.styleAttributeValues.StyleAttributeValue">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update StyleAttributeValues
			set StyleAttributeOptionID = <cfqueryparam value="#arguments.bean.getStyleAttributeOptionID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getStyleAttributeOptionID() eq ""), de("yes"), de("no"))#" />,
				StyleID = <cfqueryparam value="#arguments.bean.getStyleID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getStyleID() eq ""), de("yes"), de("no"))#" />
			where StyleAttributeValueID = <cfqueryparam value="#arguments.bean.getStyleAttributeValueID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.styleAttributeValues.StyleAttributeValue">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from StyleAttributeValues
			where StyleAttributeValueID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getStyleAttributeValueID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>