<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.materials.Material">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	MaterialID, EntityTypeID, MaterialCode, Description, MaterialClassID, MaterialTypeID, 
					MaterialCategoryID, Width, Content, CreatedBy, CreatedDate, 
					LastMaintainedBy, LastMaintainedDate
			from Materials
			where MaterialID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.materials.Material").init();
			obj.setMaterialID(qRead.MaterialID);
			obj.setEntityTypeID(qRead.EntityTypeID);
			obj.setMaterialCode(qRead.MaterialCode);
			obj.setDescription(qRead.Description);
			obj.setMaterialClassID(qRead.MaterialClassID);
			obj.setMaterialTypeID(qRead.MaterialTypeID);
			obj.setMaterialCategoryID(qRead.MaterialCategoryID);
			obj.setWidth(qRead.Width);
			obj.setContent(qRead.Content);
			obj.setCreatedBy(qRead.CreatedBy);
			obj.setCreatedDate(qRead.CreatedDate);
			obj.setLastMaintainedBy(qRead.LastMaintainedBy);
			obj.setLastMaintainedDate(qRead.LastMaintainedDate);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.materials.Material">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getEntityTypeID()>
		<cfset var local2=arguments.bean.getMaterialCode()>
		<cfset var local3=arguments.bean.getDescription()>
		<cfset var local4=arguments.bean.getMaterialClassID()>
		<cfset var local5=arguments.bean.getMaterialTypeID()>
		<cfset var local6=arguments.bean.getMaterialCategoryID()>
		<cfset var local7=arguments.bean.getWidth()>
		<cfset var local8=arguments.bean.getContent()>
		<cfset var local9=arguments.bean.getCreatedBy()>
		<cfset var local10=arguments.bean.getCreatedDate()>
		<cfset var local11=arguments.bean.getLastMaintainedBy()>
		<cfset var local12=arguments.bean.getLastMaintainedDate()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into Materials(EntityTypeID, MaterialCode, Description, MaterialClassID, MaterialTypeID, MaterialCategoryID, Width, Content, CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_INTEGER" null="#iif((local4 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_INTEGER" null="#iif((local5 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_INTEGER" null="#iif((local6 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local10 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local11#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local12#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local12 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select MaterialID
				from Materials
				where EntityTypeID = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and MaterialCode = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				  and Description = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				  and MaterialClassID = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_INTEGER" null="#iif((local4 eq ""), de("yes"), de("no"))#" />
				  and MaterialTypeID = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_INTEGER" null="#iif((local5 eq ""), de("yes"), de("no"))#" />
				  and MaterialCategoryID = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_INTEGER" null="#iif((local6 eq ""), de("yes"), de("no"))#" />
				  and Width = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />
				  and Content = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedBy = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedDate = <cfqueryparam value="#local10#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local10 eq ""), de("yes"), de("no"))#" />
				  and LastMaintainedBy = <cfqueryparam value="#local11#" cfsqltype="CF_SQL_VARCHAR" />
				  and LastMaintainedDate = <cfqueryparam value="#local12#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local12 eq ""), de("yes"), de("no"))#" />
				order by MaterialID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setMaterialID(qGetID.MaterialID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.materials.Material">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update Materials
			set EntityTypeID = <cfqueryparam value="#arguments.bean.getEntityTypeID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getEntityTypeID() eq ""), de("yes"), de("no"))#" />,
				MaterialCode = <cfqueryparam value="#arguments.bean.getMaterialCode()#" cfsqltype="CF_SQL_VARCHAR" />,
				Description = <cfqueryparam value="#arguments.bean.getDescription()#" cfsqltype="CF_SQL_VARCHAR" />,
				MaterialClassID = <cfqueryparam value="#arguments.bean.getMaterialClassID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getMaterialClassID() eq ""), de("yes"), de("no"))#" />,
				MaterialTypeID = <cfqueryparam value="#arguments.bean.getMaterialTypeID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getMaterialTypeID() eq ""), de("yes"), de("no"))#" />,
				MaterialCategoryID = <cfqueryparam value="#arguments.bean.getMaterialCategoryID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getMaterialCategoryID() eq ""), de("yes"), de("no"))#" />,
				Width = <cfqueryparam value="#arguments.bean.getWidth()#" cfsqltype="CF_SQL_VARCHAR" />,
				Content = <cfqueryparam value="#arguments.bean.getContent()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedBy = <cfqueryparam value="#arguments.bean.getCreatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedDate = <cfqueryparam value="#arguments.bean.getCreatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCreatedDate() eq ""), de("yes"), de("no"))#" />,
				LastMaintainedBy = <cfqueryparam value="#arguments.bean.getLastMaintainedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				LastMaintainedDate = <cfqueryparam value="#arguments.bean.getLastMaintainedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getLastMaintainedDate() eq ""), de("yes"), de("no"))#" />
			where MaterialID = <cfqueryparam value="#arguments.bean.getMaterialID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.materials.Material">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from Materials
			where MaterialID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getMaterialID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>