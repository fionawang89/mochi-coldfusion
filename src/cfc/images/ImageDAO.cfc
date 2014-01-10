<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.images.Image">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	ImageID, EntityTypeID, EntityID, Description, Location, URL, 
					ContentType, File, FileName, FileExtension, Height, 
					Width, FileSize, ThumbnailFile, ThumbnailFileName, ThumbnailHeight, 
					ThumbnailWidth, CreatedDate, CreatedBy, LastMaintainedDate, LastMaintainedBy
					
			from Images
			where ImageID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.images.Image").init();
			obj.setImageID(qRead.ImageID);
			obj.setEntityTypeID(qRead.EntityTypeID);
			obj.setEntityID(qRead.EntityID);
			obj.setDescription(qRead.Description);
			obj.setLocation(qRead.Location);
			obj.setURL(qRead.URL);
			obj.setContentType(qRead.ContentType);
			obj.setFile(qRead.File);
			obj.setFileName(qRead.FileName);
			obj.setFileExtension(qRead.FileExtension);
			obj.setHeight(qRead.Height);
			obj.setWidth(qRead.Width);
			obj.setFileSize(qRead.FileSize);
			obj.setThumbnailFile(qRead.ThumbnailFile);
			obj.setThumbnailFileName(qRead.ThumbnailFileName);
			obj.setThumbnailHeight(qRead.ThumbnailHeight);
			obj.setThumbnailWidth(qRead.ThumbnailWidth);
			obj.setCreatedDate(qRead.CreatedDate);
			obj.setCreatedBy(qRead.CreatedBy);
			obj.setLastMaintainedDate(qRead.LastMaintainedDate);
			obj.setLastMaintainedBy(qRead.LastMaintainedBy);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.images.Image">
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
		<cfset var local10=arguments.bean.getHeight()>
		<cfset var local11=arguments.bean.getWidth()>
		<cfset var local12=arguments.bean.getFileSize()>
		<cfset var local13=arguments.bean.getThumbnailFile()>
		<cfset var local14=arguments.bean.getThumbnailFileName()>
		<cfset var local15=arguments.bean.getThumbnailHeight()>
		<cfset var local16=arguments.bean.getThumbnailWidth()>
		<cfset var local17=arguments.bean.getCreatedDate()>
		<cfset var local18=arguments.bean.getCreatedBy()>
		<cfset var local19=arguments.bean.getLastMaintainedDate()>
		<cfset var local20=arguments.bean.getLastMaintainedBy()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into Images(EntityTypeID, EntityID, Description, Location, URL, ContentType, File, FileName, FileExtension, Height, Width, FileSize, ThumbnailFile, ThumbnailFileName, ThumbnailHeight, ThumbnailWidth, CreatedDate, CreatedBy, LastMaintainedDate, LastMaintainedBy)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local10 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local11#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local11 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local12#" cfsqltype="CF_SQL_INTEGER" null="#iif((local12 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local13#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local14#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local15#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local15 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local16#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local16 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local17#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local17 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local18#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local19#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local19 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local20#" cfsqltype="CF_SQL_VARCHAR" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select ImageID
				from Images
				where EntityTypeID = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and EntityID = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				  and Description = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				  and Location = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />
				  and URL = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />
				  and ContentType = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />
				  and File = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />
				  and FileName = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />
				  and FileExtension = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />
				  and Height = <cfqueryparam value="#local10#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local10 eq ""), de("yes"), de("no"))#" />
				  and Width = <cfqueryparam value="#local11#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local11 eq ""), de("yes"), de("no"))#" />
				  and FileSize = <cfqueryparam value="#local12#" cfsqltype="CF_SQL_INTEGER" null="#iif((local12 eq ""), de("yes"), de("no"))#" />
				  and ThumbnailFile = <cfqueryparam value="#local13#" cfsqltype="CF_SQL_VARCHAR" />
				  and ThumbnailFileName = <cfqueryparam value="#local14#" cfsqltype="CF_SQL_VARCHAR" />
				  and ThumbnailHeight = <cfqueryparam value="#local15#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local15 eq ""), de("yes"), de("no"))#" />
				  and ThumbnailWidth = <cfqueryparam value="#local16#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local16 eq ""), de("yes"), de("no"))#" />
				  and CreatedDate = <cfqueryparam value="#local17#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local17 eq ""), de("yes"), de("no"))#" />
				  and CreatedBy = <cfqueryparam value="#local18#" cfsqltype="CF_SQL_VARCHAR" />
				  and LastMaintainedDate = <cfqueryparam value="#local19#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local19 eq ""), de("yes"), de("no"))#" />
				  and LastMaintainedBy = <cfqueryparam value="#local20#" cfsqltype="CF_SQL_VARCHAR" />
				order by ImageID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setImageID(qGetID.ImageID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.images.Image">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update Images
			set EntityTypeID = <cfqueryparam value="#arguments.bean.getEntityTypeID()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getEntityTypeID() eq ""), de("yes"), de("no"))#" />,
				EntityID = <cfqueryparam value="#arguments.bean.getEntityID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getEntityID() eq ""), de("yes"), de("no"))#" />,
				Description = <cfqueryparam value="#arguments.bean.getDescription()#" cfsqltype="CF_SQL_VARCHAR" />,
				Location = <cfqueryparam value="#arguments.bean.getLocation()#" cfsqltype="CF_SQL_VARCHAR" />,
				URL = <cfqueryparam value="#arguments.bean.getURL()#" cfsqltype="CF_SQL_VARCHAR" />,
				ContentType = <cfqueryparam value="#arguments.bean.getContentType()#" cfsqltype="CF_SQL_VARCHAR" />,
				File = <cfqueryparam value="#arguments.bean.getFile()#" cfsqltype="CF_SQL_VARCHAR" />,
				FileName = <cfqueryparam value="#arguments.bean.getFileName()#" cfsqltype="CF_SQL_VARCHAR" />,
				FileExtension = <cfqueryparam value="#arguments.bean.getFileExtension()#" cfsqltype="CF_SQL_VARCHAR" />,
				Height = <cfqueryparam value="#arguments.bean.getHeight()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getHeight() eq ""), de("yes"), de("no"))#" />,
				Width = <cfqueryparam value="#arguments.bean.getWidth()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getWidth() eq ""), de("yes"), de("no"))#" />,
				FileSize = <cfqueryparam value="#arguments.bean.getFileSize()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getFileSize() eq ""), de("yes"), de("no"))#" />,
				ThumbnailFile = <cfqueryparam value="#arguments.bean.getThumbnailFile()#" cfsqltype="CF_SQL_VARCHAR" />,
				ThumbnailFileName = <cfqueryparam value="#arguments.bean.getThumbnailFileName()#" cfsqltype="CF_SQL_VARCHAR" />,
				ThumbnailHeight = <cfqueryparam value="#arguments.bean.getThumbnailHeight()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getThumbnailHeight() eq ""), de("yes"), de("no"))#" />,
				ThumbnailWidth = <cfqueryparam value="#arguments.bean.getThumbnailWidth()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getThumbnailWidth() eq ""), de("yes"), de("no"))#" />,
				CreatedDate = <cfqueryparam value="#arguments.bean.getCreatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCreatedDate() eq ""), de("yes"), de("no"))#" />,
				CreatedBy = <cfqueryparam value="#arguments.bean.getCreatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				LastMaintainedDate = <cfqueryparam value="#arguments.bean.getLastMaintainedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getLastMaintainedDate() eq ""), de("yes"), de("no"))#" />,
				LastMaintainedBy = <cfqueryparam value="#arguments.bean.getLastMaintainedBy()#" cfsqltype="CF_SQL_VARCHAR" />
			where ImageID = <cfqueryparam value="#arguments.bean.getImageID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.images.Image">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from Images
			where ImageID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getImageID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>