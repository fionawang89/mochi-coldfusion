<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.copyrightsStyles.CopyrightStyle">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	CopyrightsStylesID, CopyrightID, StyleID
			from CopyrightsStyles
			where CopyrightsStylesID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.copyrightsStyles.CopyrightStyle").init();
			obj.setCopyrightsStylesID(qRead.CopyrightsStylesID);
			obj.setCopyrightID(qRead.CopyrightID);
			obj.setStyleID(qRead.StyleID);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.copyrightsStyles.CopyrightStyle">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getCopyrightID()>
		<cfset var local2=arguments.bean.getStyleID()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into CopyrightsStyles(CopyrightID, StyleID)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select CopyrightsStylesID
				from CopyrightsStyles
				where CopyrightID = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and StyleID = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				order by CopyrightsStylesID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setCopyrightsStylesID(qGetID.CopyrightsStylesID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.copyrightsStyles.CopyrightStyle">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update CopyrightsStyles
			set CopyrightID = <cfqueryparam value="#arguments.bean.getCopyrightID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getCopyrightID() eq ""), de("yes"), de("no"))#" />,
				StyleID = <cfqueryparam value="#arguments.bean.getStyleID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getStyleID() eq ""), de("yes"), de("no"))#" />
			where CopyrightsStylesID = <cfqueryparam value="#arguments.bean.getCopyrightsStylesID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.copyrightsStyles.CopyrightStyle">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from CopyrightsStyles
			where CopyrightsStylesID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getCopyrightsStylesID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>