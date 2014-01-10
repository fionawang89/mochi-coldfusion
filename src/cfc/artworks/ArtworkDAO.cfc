<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.artworks.Artwork">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	ArtworkID, EntityTypeID, ArtworkName, Description, CreatedBy, CreatedDate, 
					LastMaintainedBy, LastMaintainedDate
			from Artworks
			where ArtworkID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.artworks.Artwork").init();
			obj.setArtworkID(qRead.ArtworkID);
			obj.setEntityTypeID(qRead.EntityTypeID);
			obj.setArtworkName(qRead.ArtworkName);
			obj.setDescription(qRead.Description);
			obj.setCreatedBy(qRead.CreatedBy);
			obj.setCreatedDate(qRead.CreatedDate);
			obj.setLastMaintainedBy(qRead.LastMaintainedBy);
			obj.setLastMaintainedDate(qRead.LastMaintainedDate);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.artworks.Artwork">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getEntityTypeID()>
		<cfset var local2=arguments.bean.getArtworkName()>
		<cfset var local3=arguments.bean.getDescription()>
		<cfset var local4=arguments.bean.getCreatedBy()>
		<cfset var local5=arguments.bean.getCreatedDate()>
		<cfset var local6=arguments.bean.getLastMaintainedBy()>
		<cfset var local7=arguments.bean.getLastMaintainedDate()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into Artworks(EntityTypeID, ArtworkName, Description, CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate)
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
				select ArtworkID
				from Artworks
				where EntityTypeID = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and ArtworkName = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				  and Description = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedBy = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedDate = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local5 eq ""), de("yes"), de("no"))#" />
				  and LastMaintainedBy = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />
				  and LastMaintainedDate = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local7 eq ""), de("yes"), de("no"))#" />
				order by ArtworkID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setArtworkID(qGetID.ArtworkID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.artworks.Artwork">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update Artworks
			set EntityTypeID = <cfqueryparam value="#arguments.bean.getEntityTypeID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getEntityTypeID() eq ""), de("yes"), de("no"))#" />,
				ArtworkName = <cfqueryparam value="#arguments.bean.getArtworkName()#" cfsqltype="CF_SQL_VARCHAR" />,
				Description = <cfqueryparam value="#arguments.bean.getDescription()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedBy = <cfqueryparam value="#arguments.bean.getCreatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedDate = <cfqueryparam value="#arguments.bean.getCreatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCreatedDate() eq ""), de("yes"), de("no"))#" />,
				LastMaintainedBy = <cfqueryparam value="#arguments.bean.getLastMaintainedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				LastMaintainedDate = <cfqueryparam value="#arguments.bean.getLastMaintainedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getLastMaintainedDate() eq ""), de("yes"), de("no"))#" />
			where ArtworkID = <cfqueryparam value="#arguments.bean.getArtworkID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.artworks.Artwork">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from Artworks
			where ArtworkID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getArtworkID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>