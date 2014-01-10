<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.users.User">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	UserID, FirstName, LastName, Email, Password, Roles, 
					CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate
			from Users
			where UserID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.users.User").init();
			obj.setUserID(qRead.UserID);
			obj.setFirstName(qRead.FirstName);
			obj.setLastName(qRead.LastName);
			obj.setEmail(qRead.Email);
			obj.setPassword(qRead.Password);
			obj.setRoles(qRead.Roles);
			obj.setCreatedBy(qRead.CreatedBy);
			obj.setCreatedDate(qRead.CreatedDate);
			obj.setLastMaintainedBy(qRead.LastMaintainedBy);
			obj.setLastMaintainedDate(qRead.LastMaintainedDate);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.users.User">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getFirstName()>
		<cfset var local2=arguments.bean.getLastName()>
		<cfset var local3=arguments.bean.getEmail()>
		<cfset var local4=arguments.bean.getPassword()>
		<cfset var local5=arguments.bean.getRoles()>
		<cfset var local6=arguments.bean.getCreatedBy()>
		<cfset var local7=arguments.bean.getCreatedDate()>
		<cfset var local8=arguments.bean.getLastMaintainedBy()>
		<cfset var local9=arguments.bean.getLastMaintainedDate()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into Users(FirstName, LastName, Email, Password, Roles, CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local7 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local9 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select UserID
				from Users
				where FirstName = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />
				  and LastName = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				  and Email = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				  and Password = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />
				  and Roles = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedBy = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedDate = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local7 eq ""), de("yes"), de("no"))#" />
				  and LastMaintainedBy = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />
				  and LastMaintainedDate = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local9 eq ""), de("yes"), de("no"))#" />
				order by UserID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setUserID(qGetID.UserID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.users.User">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update Users
			set FirstName = <cfqueryparam value="#arguments.bean.getFirstName()#" cfsqltype="CF_SQL_VARCHAR" />,
				LastName = <cfqueryparam value="#arguments.bean.getLastName()#" cfsqltype="CF_SQL_VARCHAR" />,
				Email = <cfqueryparam value="#arguments.bean.getEmail()#" cfsqltype="CF_SQL_VARCHAR" />,
				Password = <cfqueryparam value="#arguments.bean.getPassword()#" cfsqltype="CF_SQL_VARCHAR" />,
				Roles = <cfqueryparam value="#arguments.bean.getRoles()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedBy = <cfqueryparam value="#arguments.bean.getCreatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedDate = <cfqueryparam value="#arguments.bean.getCreatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCreatedDate() eq ""), de("yes"), de("no"))#" />,
				LastMaintainedBy = <cfqueryparam value="#arguments.bean.getLastMaintainedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				LastMaintainedDate = <cfqueryparam value="#arguments.bean.getLastMaintainedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getLastMaintainedDate() eq ""), de("yes"), de("no"))#" />
			where UserID = <cfqueryparam value="#arguments.bean.getUserID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.users.User">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from Users
			where UserID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getUserID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>