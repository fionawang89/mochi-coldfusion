<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.styleAttributeOptions.StyleAttributeOption">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	StyleAttributeOptionID, StyleAttributeID, AttributeValue, Description, CreatedBy, CreatedDate, 
					LastMaintainedBy, LastMaintainedDate
			from StyleAttributeOptions
			where StyleAttributeOptionID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.styleAttributeOptions.StyleAttributeOption").init();
			obj.setStyleAttributeOptionID(qRead.StyleAttributeOptionID);
			obj.setStyleAttributeID(qRead.StyleAttributeID);
			obj.setAttributeValue(qRead.AttributeValue);
			obj.setDescription(qRead.Description);
			obj.setCreatedBy(qRead.CreatedBy);
			obj.setCreatedDate(qRead.CreatedDate);
			obj.setLastMaintainedBy(qRead.LastMaintainedBy);
			obj.setLastMaintainedDate(qRead.LastMaintainedDate);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.styleAttributeOptions.StyleAttributeOption">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getStyleAttributeID()>
		<cfset var local2=arguments.bean.getAttributeValue()>
		<cfset var local3=arguments.bean.getDescription()>
		<cfset var local4=arguments.bean.getCreatedBy()>
		<cfset var local5=arguments.bean.getCreatedDate()>
		<cfset var local6=arguments.bean.getLastMaintainedBy()>
		<cfset var local7=arguments.bean.getLastMaintainedDate()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into StyleAttributeOptions(StyleAttributeID, AttributeValue, Description, CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local5 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local7 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select StyleAttributeOptionID
				from StyleAttributeOptions
				where StyleAttributeID = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and AttributeValue = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				  and Description = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedBy = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedDate = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local5 eq ""), de("yes"), de("no"))#" />
				  and LastMaintainedBy = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />
				  and LastMaintainedDate = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local7 eq ""), de("yes"), de("no"))#" />
				order by StyleAttributeOptionID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setStyleAttributeOptionID(qGetID.StyleAttributeOptionID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.styleAttributeOptions.StyleAttributeOption">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update StyleAttributeOptions
			set StyleAttributeID = <cfqueryparam value="#arguments.bean.getStyleAttributeID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getStyleAttributeID() eq ""), de("yes"), de("no"))#" />,
				AttributeValue = <cfqueryparam value="#arguments.bean.getAttributeValue()#" cfsqltype="CF_SQL_VARCHAR" />,
				Description = <cfqueryparam value="#arguments.bean.getDescription()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedBy = <cfqueryparam value="#arguments.bean.getCreatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedDate = <cfqueryparam value="#arguments.bean.getCreatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCreatedDate() eq ""), de("yes"), de("no"))#" />,
				LastMaintainedBy = <cfqueryparam value="#arguments.bean.getLastMaintainedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				LastMaintainedDate = <cfqueryparam value="#arguments.bean.getLastMaintainedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getLastMaintainedDate() eq ""), de("yes"), de("no"))#" />
			where StyleAttributeOptionID = <cfqueryparam value="#arguments.bean.getStyleAttributeOptionID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.styleAttributeOptions.StyleAttributeOption">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from StyleAttributeOptions
			where StyleAttributeOptionID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getStyleAttributeOptionID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>