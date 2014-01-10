<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.posts.Post">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	PostID, Subject, Post, Done, CreatedBy, CreatedDate, 
					LastMaintainedBy
			from Posts
			where PostID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.posts.Post").init();
			obj.setPostID(qRead.PostID);
			obj.setSubject(qRead.Subject);
			obj.setPost(qRead.Post);
			obj.setDone(qRead.Done);
			obj.setCreatedBy(qRead.CreatedBy);
			obj.setCreatedDate(qRead.CreatedDate);
			obj.setLastMaintainedBy(qRead.LastMaintainedBy);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.posts.Post">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getSubject()>
		<cfset var local2=arguments.bean.getPost()>
		<cfset var local3=arguments.bean.getDone()>
		<cfset var local4=arguments.bean.getCreatedBy()>
		<cfset var local5=arguments.bean.getCreatedDate()>
		<cfset var local6=arguments.bean.getLastMaintainedBy()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into Posts(Subject, Post, Done, CreatedBy, CreatedDate, LastMaintainedBy)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_LONGVARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_BIT" null="#iif((local3 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local5 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select PostID
				from Posts
				where Subject = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />
				  and Post = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_LONGVARCHAR" />
				  and Done = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_BIT" null="#iif((local3 eq ""), de("yes"), de("no"))#" />
				  and CreatedBy = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedDate = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local5 eq ""), de("yes"), de("no"))#" />
				  and LastMaintainedBy = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />
				order by PostID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setPostID(qGetID.PostID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.posts.Post">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update Posts
			set Subject = <cfqueryparam value="#arguments.bean.getSubject()#" cfsqltype="CF_SQL_VARCHAR" />,
				Post = <cfqueryparam value="#arguments.bean.getPost()#" cfsqltype="CF_SQL_LONGVARCHAR" />,
				Done = <cfqueryparam value="#arguments.bean.getDone()#" cfsqltype="CF_SQL_BIT" null="#iif((arguments.bean.getDone() eq ""), de("yes"), de("no"))#" />,
				CreatedBy = <cfqueryparam value="#arguments.bean.getCreatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedDate = <cfqueryparam value="#arguments.bean.getCreatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCreatedDate() eq ""), de("yes"), de("no"))#" />,
				LastMaintainedBy = <cfqueryparam value="#arguments.bean.getLastMaintainedBy()#" cfsqltype="CF_SQL_VARCHAR" />
			where PostID = <cfqueryparam value="#arguments.bean.getPostID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.posts.Post">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from Posts
			where PostID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getPostID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>