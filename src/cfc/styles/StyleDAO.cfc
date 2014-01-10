<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.styles.Style">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	StyleID, EntityTypeID, StyleName, Description, ProductionTeamLeader, ProductionPatternMaker, 
					FirstPatternMaker, CareInformation, PatternDifficulty, PatternReference, CreatedBy, 
					CreatedDate, LastMaintainedBy, LastMaintainedDate
			from Styles
			where StyleID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.styles.Style").init();
			obj.setStyleID(qRead.StyleID);
			obj.setEntityTypeID(qRead.EntityTypeID);
			obj.setStyleName(qRead.StyleName);
			obj.setDescription(qRead.Description);
			obj.setProductionTeamLeader(qRead.ProductionTeamLeader);
			obj.setProductionPatternMaker(qRead.ProductionPatternMaker);
			obj.setFirstPatternMaker(qRead.FirstPatternMaker);
			obj.setCareInformation(qRead.CareInformation);
			obj.setPatternDifficulty(qRead.PatternDifficulty);
			obj.setPatternReference(qRead.PatternReference);
			obj.setCreatedBy(qRead.CreatedBy);
			obj.setCreatedDate(qRead.CreatedDate);
			obj.setLastMaintainedBy(qRead.LastMaintainedBy);
			obj.setLastMaintainedDate(qRead.LastMaintainedDate);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.styles.Style">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getEntityTypeID()>
		<cfset var local2=arguments.bean.getStyleName()>
		<cfset var local3=arguments.bean.getDescription()>
		<cfset var local4=arguments.bean.getProductionTeamLeader()>
		<cfset var local5=arguments.bean.getProductionPatternMaker()>
		<cfset var local6=arguments.bean.getFirstPatternMaker()>
		<cfset var local7=arguments.bean.getCareInformation()>
		<cfset var local8=arguments.bean.getPatternDifficulty()>
		<cfset var local9=arguments.bean.getPatternReference()>
		<cfset var local10=arguments.bean.getCreatedBy()>
		<cfset var local11=arguments.bean.getCreatedDate()>
		<cfset var local12=arguments.bean.getLastMaintainedBy()>
		<cfset var local13=arguments.bean.getLastMaintainedDate()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into Styles(EntityTypeID, StyleName, Description, ProductionTeamLeader, ProductionPatternMaker, FirstPatternMaker, CareInformation, PatternDifficulty, PatternReference, CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_LONGVARCHAR" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local11#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local11 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local12#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local13#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local13 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select StyleID
				from Styles
				where EntityTypeID = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and StyleName = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				  and Description = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				  and ProductionTeamLeader = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />
				  and ProductionPatternMaker = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />
				  and FirstPatternMaker = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />
				  and CareInformation = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_LONGVARCHAR" />
				  and PatternDifficulty = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />
				  and PatternReference = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedBy = <cfqueryparam value="#local10#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedDate = <cfqueryparam value="#local11#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local11 eq ""), de("yes"), de("no"))#" />
				  and LastMaintainedBy = <cfqueryparam value="#local12#" cfsqltype="CF_SQL_VARCHAR" />
				  and LastMaintainedDate = <cfqueryparam value="#local13#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local13 eq ""), de("yes"), de("no"))#" />
				order by StyleID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setStyleID(qGetID.StyleID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.styles.Style">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update Styles
			set EntityTypeID = <cfqueryparam value="#arguments.bean.getEntityTypeID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getEntityTypeID() eq ""), de("yes"), de("no"))#" />,
				StyleName = <cfqueryparam value="#arguments.bean.getStyleName()#" cfsqltype="CF_SQL_VARCHAR" />,
				Description = <cfqueryparam value="#arguments.bean.getDescription()#" cfsqltype="CF_SQL_VARCHAR" />,
				ProductionTeamLeader = <cfqueryparam value="#arguments.bean.getProductionTeamLeader()#" cfsqltype="CF_SQL_VARCHAR" />,
				ProductionPatternMaker = <cfqueryparam value="#arguments.bean.getProductionPatternMaker()#" cfsqltype="CF_SQL_VARCHAR" />,
				FirstPatternMaker = <cfqueryparam value="#arguments.bean.getFirstPatternMaker()#" cfsqltype="CF_SQL_VARCHAR" />,
				CareInformation = <cfqueryparam value="#arguments.bean.getCareInformation()#" cfsqltype="CF_SQL_LONGVARCHAR" />,
				PatternDifficulty = <cfqueryparam value="#arguments.bean.getPatternDifficulty()#" cfsqltype="CF_SQL_VARCHAR" />,
				PatternReference = <cfqueryparam value="#arguments.bean.getPatternReference()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedBy = <cfqueryparam value="#arguments.bean.getCreatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedDate = <cfqueryparam value="#arguments.bean.getCreatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCreatedDate() eq ""), de("yes"), de("no"))#" />,
				LastMaintainedBy = <cfqueryparam value="#arguments.bean.getLastMaintainedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				LastMaintainedDate = <cfqueryparam value="#arguments.bean.getLastMaintainedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getLastMaintainedDate() eq ""), de("yes"), de("no"))#" />
			where StyleID = <cfqueryparam value="#arguments.bean.getStyleID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.styles.Style">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from Styles
			where StyleID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getStyleID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>