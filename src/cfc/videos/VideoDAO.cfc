<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.videos.Video">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	VideoID, EntityTypeID, EntityID, Description, Location, URL, 
					ContentType, File, FileName, FileExtension, FileSize, 
					CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate
			from Videos
			where VideoID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.videos.Video").init();
			obj.setVideoID(qRead.VideoID);
			obj.setEntityTypeID(qRead.EntityTypeID);
			obj.setEntityID(qRead.EntityID);
			obj.setDescription(qRead.Description);
			obj.setLocation(qRead.Location);
			obj.setURL(qRead.URL);
			obj.setContentType(qRead.ContentType);
			obj.setFile(qRead.File);
			obj.setFileName(qRead.FileName);
			obj.setFileExtension(qRead.FileExtension);
			obj.setFileSize(qRead.FileSize);
			obj.setCreatedBy(qRead.CreatedBy);
			obj.setCreatedDate(qRead.CreatedDate);
			obj.setLastMaintainedBy(qRead.LastMaintainedBy);
			obj.setLastMaintainedDate(qRead.LastMaintainedDate);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.videos.Video">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getEntityTypeID()>
		<cfset var local2=arguments.bean.getEntityID()>
		<cfset var local3=arguments.bean.getDescription()>
		<cfset var local4=arguments.bean.getLocation()>
		<cfset var local5=arguments.bean.getURL()>
		<cfset var local6=arguments.bean.getContentType()>
		<cfset var local7=arguments.bean.getFile()>
		<cfset var local8=arguments.bean.getFileName()>
		<cfset var local9=arguments.bean.getFileExtension()>
		<cfset var local10=arguments.bean.getFileSize()>
		<cfset var local11=arguments.bean.getCreatedBy()>
		<cfset var local12=arguments.bean.getCreatedDate()>
		<cfset var local13=arguments.bean.getLastMaintainedBy()>
		<cfset var local14=arguments.bean.getLastMaintainedDate()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into Videos(EntityTypeID, EntityID, Description, Location, URL, ContentType, File, FileName, FileExtension, FileSize, CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_INTEGER" null="#iif((local10 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local11#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local12#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local12 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local13#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local14#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local14 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select VideoID
				from Videos
				where EntityTypeID = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and EntityID = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				  and Description = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				  and Location = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />
				  and URL = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />
				  and ContentType = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />
				  and File = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />
				  and FileName = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />
				  and FileExtension = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />
				  and FileSize = <cfqueryparam value="#local10#" cfsqltype="CF_SQL_INTEGER" null="#iif((local10 eq ""), de("yes"), de("no"))#" />
				  and CreatedBy = <cfqueryparam value="#local11#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedDate = <cfqueryparam value="#local12#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local12 eq ""), de("yes"), de("no"))#" />
				  and LastMaintainedBy = <cfqueryparam value="#local13#" cfsqltype="CF_SQL_VARCHAR" />
				  and LastMaintainedDate = <cfqueryparam value="#local14#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local14 eq ""), de("yes"), de("no"))#" />
				order by VideoID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setVideoID(qGetID.VideoID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.videos.Video">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update Videos
			set EntityTypeID = <cfqueryparam value="#arguments.bean.getEntityTypeID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getEntityTypeID() eq ""), de("yes"), de("no"))#" />,
				EntityID = <cfqueryparam value="#arguments.bean.getEntityID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getEntityID() eq ""), de("yes"), de("no"))#" />,
				Description = <cfqueryparam value="#arguments.bean.getDescription()#" cfsqltype="CF_SQL_VARCHAR" />,
				Location = <cfqueryparam value="#arguments.bean.getLocation()#" cfsqltype="CF_SQL_VARCHAR" />,
				URL = <cfqueryparam value="#arguments.bean.getURL()#" cfsqltype="CF_SQL_VARCHAR" />,
				ContentType = <cfqueryparam value="#arguments.bean.getContentType()#" cfsqltype="CF_SQL_VARCHAR" />,
				File = <cfqueryparam value="#arguments.bean.getFile()#" cfsqltype="CF_SQL_VARCHAR" />,
				FileName = <cfqueryparam value="#arguments.bean.getFileName()#" cfsqltype="CF_SQL_VARCHAR" />,
				FileExtension = <cfqueryparam value="#arguments.bean.getFileExtension()#" cfsqltype="CF_SQL_VARCHAR" />,
				FileSize = <cfqueryparam value="#arguments.bean.getFileSize()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getFileSize() eq ""), de("yes"), de("no"))#" />,
				CreatedBy = <cfqueryparam value="#arguments.bean.getCreatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedDate = <cfqueryparam value="#arguments.bean.getCreatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCreatedDate() eq ""), de("yes"), de("no"))#" />,
				LastMaintainedBy = <cfqueryparam value="#arguments.bean.getLastMaintainedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				LastMaintainedDate = <cfqueryparam value="#arguments.bean.getLastMaintainedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getLastMaintainedDate() eq ""), de("yes"), de("no"))#" />
			where VideoID = <cfqueryparam value="#arguments.bean.getVideoID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.videos.Video">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from Videos
			where VideoID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getVideoID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>