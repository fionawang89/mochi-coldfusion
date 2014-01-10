<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.patterns.Pattern">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	PatternID, FittingID, Description, DueDate, PatternPriorityID, PatternStatusID, 
					Approved, ApprovedBy, ApprovedWhen, Location, URL, 
					ContentType, File, FileName, FileExtension, FileSize, 
					CreatedDate, CreatedBy, LastMaintainedDate, LastMaintainedBy
			from Patterns
			where PatternID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.patterns.Pattern").init();
			obj.setPatternID(qRead.PatternID);
			obj.setFittingID(qRead.FittingID);
			obj.setDescription(qRead.Description);
			obj.setDueDate(qRead.DueDate);
			obj.setPatternPriorityID(qRead.PatternPriorityID);
			obj.setPatternStatusID(qRead.PatternStatusID);
			obj.setApproved(qRead.Approved);
			obj.setApprovedBy(qRead.ApprovedBy);
			obj.setApprovedWhen(qRead.ApprovedWhen);
			obj.setLocation(qRead.Location);
			obj.setURL(qRead.URL);
			obj.setContentType(qRead.ContentType);
			obj.setFile(qRead.File);
			obj.setFileName(qRead.FileName);
			obj.setFileExtension(qRead.FileExtension);
			obj.setFileSize(qRead.FileSize);
			obj.setCreatedDate(qRead.CreatedDate);
			obj.setCreatedBy(qRead.CreatedBy);
			obj.setLastMaintainedDate(qRead.LastMaintainedDate);
			obj.setLastMaintainedBy(qRead.LastMaintainedBy);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.patterns.Pattern">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getFittingID()>
		<cfset var local2=arguments.bean.getDescription()>
		<cfset var local3=arguments.bean.getDueDate()>
		<cfset var local4=arguments.bean.getPatternPriorityID()>
		<cfset var local5=arguments.bean.getPatternStatusID()>
		<cfset var local6=arguments.bean.getApproved()>
		<cfset var local7=arguments.bean.getApprovedBy()>
		<cfset var local8=arguments.bean.getApprovedWhen()>
		<cfset var local9=arguments.bean.getLocation()>
		<cfset var local10=arguments.bean.getURL()>
		<cfset var local11=arguments.bean.getContentType()>
		<cfset var local12=arguments.bean.getFile()>
		<cfset var local13=arguments.bean.getFileName()>
		<cfset var local14=arguments.bean.getFileExtension()>
		<cfset var local15=arguments.bean.getFileSize()>
		<cfset var local16=arguments.bean.getCreatedDate()>
		<cfset var local17=arguments.bean.getCreatedBy()>
		<cfset var local18=arguments.bean.getLastMaintainedDate()>
		<cfset var local19=arguments.bean.getLastMaintainedBy()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into Patterns(FittingID, Description, DueDate, PatternPriorityID, PatternStatusID, Approved, ApprovedBy, ApprovedWhen, Location, URL, ContentType, File, FileName, FileExtension, FileSize, CreatedDate, CreatedBy, LastMaintainedDate, LastMaintainedBy)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local3 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_INTEGER" null="#iif((local4 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_INTEGER" null="#iif((local5 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_BIT" null="#iif((local6 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local8 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local11#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local12#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local13#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local14#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local15#" cfsqltype="CF_SQL_INTEGER" null="#iif((local15 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local16#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local16 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local17#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local18#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local18 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local19#" cfsqltype="CF_SQL_VARCHAR" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select PatternID
				from Patterns
				where FittingID = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and Description = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				  and DueDate = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local3 eq ""), de("yes"), de("no"))#" />
				  and PatternPriorityID = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_INTEGER" null="#iif((local4 eq ""), de("yes"), de("no"))#" />
				  and PatternStatusID = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_INTEGER" null="#iif((local5 eq ""), de("yes"), de("no"))#" />
				  and Approved = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_BIT" null="#iif((local6 eq ""), de("yes"), de("no"))#" />
				  and ApprovedBy = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />
				  and ApprovedWhen = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local8 eq ""), de("yes"), de("no"))#" />
				  and Location = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />
				  and URL = <cfqueryparam value="#local10#" cfsqltype="CF_SQL_VARCHAR" />
				  and ContentType = <cfqueryparam value="#local11#" cfsqltype="CF_SQL_VARCHAR" />
				  and File = <cfqueryparam value="#local12#" cfsqltype="CF_SQL_VARCHAR" />
				  and FileName = <cfqueryparam value="#local13#" cfsqltype="CF_SQL_VARCHAR" />
				  and FileExtension = <cfqueryparam value="#local14#" cfsqltype="CF_SQL_VARCHAR" />
				  and FileSize = <cfqueryparam value="#local15#" cfsqltype="CF_SQL_INTEGER" null="#iif((local15 eq ""), de("yes"), de("no"))#" />
				  and CreatedDate = <cfqueryparam value="#local16#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local16 eq ""), de("yes"), de("no"))#" />
				  and CreatedBy = <cfqueryparam value="#local17#" cfsqltype="CF_SQL_VARCHAR" />
				  and LastMaintainedDate = <cfqueryparam value="#local18#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local18 eq ""), de("yes"), de("no"))#" />
				  and LastMaintainedBy = <cfqueryparam value="#local19#" cfsqltype="CF_SQL_VARCHAR" />
				order by PatternID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setPatternID(qGetID.PatternID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.patterns.Pattern">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update Patterns
			set FittingID = <cfqueryparam value="#arguments.bean.getFittingID()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getFittingID() eq ""), de("yes"), de("no"))#" />,
				Description = <cfqueryparam value="#arguments.bean.getDescription()#" cfsqltype="CF_SQL_VARCHAR" />,
				DueDate = <cfqueryparam value="#arguments.bean.getDueDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getDueDate() eq ""), de("yes"), de("no"))#" />,
				PatternPriorityID = <cfqueryparam value="#arguments.bean.getPatternPriorityID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getPatternPriorityID() eq ""), de("yes"), de("no"))#" />,
				PatternStatusID = <cfqueryparam value="#arguments.bean.getPatternStatusID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getPatternStatusID() eq ""), de("yes"), de("no"))#" />,
				Approved = <cfqueryparam value="#arguments.bean.getApproved()#" cfsqltype="CF_SQL_BIT" null="#iif((arguments.bean.getApproved() eq ""), de("yes"), de("no"))#" />,
				ApprovedBy = <cfqueryparam value="#arguments.bean.getApprovedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				ApprovedWhen = <cfqueryparam value="#arguments.bean.getApprovedWhen()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getApprovedWhen() eq ""), de("yes"), de("no"))#" />,
				Location = <cfqueryparam value="#arguments.bean.getLocation()#" cfsqltype="CF_SQL_VARCHAR" />,
				URL = <cfqueryparam value="#arguments.bean.getURL()#" cfsqltype="CF_SQL_VARCHAR" />,
				ContentType = <cfqueryparam value="#arguments.bean.getContentType()#" cfsqltype="CF_SQL_VARCHAR" />,
				File = <cfqueryparam value="#arguments.bean.getFile()#" cfsqltype="CF_SQL_VARCHAR" />,
				FileName = <cfqueryparam value="#arguments.bean.getFileName()#" cfsqltype="CF_SQL_VARCHAR" />,
				FileExtension = <cfqueryparam value="#arguments.bean.getFileExtension()#" cfsqltype="CF_SQL_VARCHAR" />,
				FileSize = <cfqueryparam value="#arguments.bean.getFileSize()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getFileSize() eq ""), de("yes"), de("no"))#" />,
				CreatedDate = <cfqueryparam value="#arguments.bean.getCreatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCreatedDate() eq ""), de("yes"), de("no"))#" />,
				CreatedBy = <cfqueryparam value="#arguments.bean.getCreatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				LastMaintainedDate = <cfqueryparam value="#arguments.bean.getLastMaintainedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getLastMaintainedDate() eq ""), de("yes"), de("no"))#" />,
				LastMaintainedBy = <cfqueryparam value="#arguments.bean.getLastMaintainedBy()#" cfsqltype="CF_SQL_VARCHAR" />
			where PatternID = <cfqueryparam value="#arguments.bean.getPatternID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.patterns.Pattern">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from Patterns
			where PatternID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getPatternID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>