<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.fabricLabDips.FabricLabDip">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	FabricLabDipID, FabricRequestID, LabDipSubmit, SubmitBy, SubmitDate, ReceivedBy, 
					ReceivedDate, ApprovedBy, ApprovedDate, FabricLabDipStatusID, Comments, 
					CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate
			from FabricLabDips
			where FabricLabDipID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.fabricLabDips.FabricLabDip").init();
			obj.setFabricLabDipID(qRead.FabricLabDipID);
			obj.setFabricRequestID(qRead.FabricRequestID);
			obj.setLabDipSubmit(qRead.LabDipSubmit);
			obj.setSubmitBy(qRead.SubmitBy);
			obj.setSubmitDate(qRead.SubmitDate);
			obj.setReceivedBy(qRead.ReceivedBy);
			obj.setReceivedDate(qRead.ReceivedDate);
			obj.setApprovedBy(qRead.ApprovedBy);
			obj.setApprovedDate(qRead.ApprovedDate);
			obj.setFabricLabDipStatusID(qRead.FabricLabDipStatusID);
			obj.setComments(qRead.Comments);
			obj.setCreatedBy(qRead.CreatedBy);
			obj.setCreatedDate(qRead.CreatedDate);
			obj.setLastMaintainedBy(qRead.LastMaintainedBy);
			obj.setLastMaintainedDate(qRead.LastMaintainedDate);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.fabricLabDips.FabricLabDip">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getFabricRequestID()>
		<cfset var local2=arguments.bean.getLabDipSubmit()>
		<cfset var local3=arguments.bean.getSubmitBy()>
		<cfset var local4=arguments.bean.getSubmitDate()>
		<cfset var local5=arguments.bean.getReceivedBy()>
		<cfset var local6=arguments.bean.getReceivedDate()>
		<cfset var local7=arguments.bean.getApprovedBy()>
		<cfset var local8=arguments.bean.getApprovedDate()>
		<cfset var local9=arguments.bean.getFabricLabDipStatusID()>
		<cfset var local10=arguments.bean.getComments()>
		<cfset var local11=arguments.bean.getCreatedBy()>
		<cfset var local12=arguments.bean.getCreatedDate()>
		<cfset var local13=arguments.bean.getLastMaintainedBy()>
		<cfset var local14=arguments.bean.getLastMaintainedDate()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into FabricLabDips(FabricRequestID, LabDipSubmit, SubmitBy, SubmitDate, ReceivedBy, ReceivedDate, ApprovedBy, ApprovedDate, FabricLabDipStatusID, Comments, CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local4 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local6 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local8 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_INTEGER" null="#iif((local9 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_LONGVARCHAR" />,
					<cfqueryparam value="#local11#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local12#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local12 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local13#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local14#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local14 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select FabricLabDipID
				from FabricLabDips
				where FabricRequestID = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and LabDipSubmit = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				  and SubmitBy = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				  and SubmitDate = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local4 eq ""), de("yes"), de("no"))#" />
				  and ReceivedBy = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />
				  and ReceivedDate = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local6 eq ""), de("yes"), de("no"))#" />
				  and ApprovedBy = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />
				  and ApprovedDate = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local8 eq ""), de("yes"), de("no"))#" />
				  and FabricLabDipStatusID = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_INTEGER" null="#iif((local9 eq ""), de("yes"), de("no"))#" />
				  and Comments = <cfqueryparam value="#local10#" cfsqltype="CF_SQL_LONGVARCHAR" />
				  and CreatedBy = <cfqueryparam value="#local11#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedDate = <cfqueryparam value="#local12#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local12 eq ""), de("yes"), de("no"))#" />
				  and LastMaintainedBy = <cfqueryparam value="#local13#" cfsqltype="CF_SQL_VARCHAR" />
				  and LastMaintainedDate = <cfqueryparam value="#local14#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local14 eq ""), de("yes"), de("no"))#" />
				order by FabricLabDipID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setFabricLabDipID(qGetID.FabricLabDipID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.fabricLabDips.FabricLabDip">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update FabricLabDips
			set FabricRequestID = <cfqueryparam value="#arguments.bean.getFabricRequestID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getFabricRequestID() eq ""), de("yes"), de("no"))#" />,
				LabDipSubmit = <cfqueryparam value="#arguments.bean.getLabDipSubmit()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getLabDipSubmit() eq ""), de("yes"), de("no"))#" />,
				SubmitBy = <cfqueryparam value="#arguments.bean.getSubmitBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				SubmitDate = <cfqueryparam value="#arguments.bean.getSubmitDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getSubmitDate() eq ""), de("yes"), de("no"))#" />,
				ReceivedBy = <cfqueryparam value="#arguments.bean.getReceivedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				ReceivedDate = <cfqueryparam value="#arguments.bean.getReceivedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getReceivedDate() eq ""), de("yes"), de("no"))#" />,
				ApprovedBy = <cfqueryparam value="#arguments.bean.getApprovedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				ApprovedDate = <cfqueryparam value="#arguments.bean.getApprovedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getApprovedDate() eq ""), de("yes"), de("no"))#" />,
				FabricLabDipStatusID = <cfqueryparam value="#arguments.bean.getFabricLabDipStatusID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getFabricLabDipStatusID() eq ""), de("yes"), de("no"))#" />,
				Comments = <cfqueryparam value="#arguments.bean.getComments()#" cfsqltype="CF_SQL_LONGVARCHAR" />,
				CreatedBy = <cfqueryparam value="#arguments.bean.getCreatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedDate = <cfqueryparam value="#arguments.bean.getCreatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCreatedDate() eq ""), de("yes"), de("no"))#" />,
				LastMaintainedBy = <cfqueryparam value="#arguments.bean.getLastMaintainedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				LastMaintainedDate = <cfqueryparam value="#arguments.bean.getLastMaintainedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getLastMaintainedDate() eq ""), de("yes"), de("no"))#" />
			where FabricLabDipID = <cfqueryparam value="#arguments.bean.getFabricLabDipID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.fabricLabDips.FabricLabDip">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from FabricLabDips
			where FabricLabDipID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getFabricLabDipID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>