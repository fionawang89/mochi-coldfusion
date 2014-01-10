<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.customers.Customer">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	CustomerID, Customer, CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate
					
			from Customers
			where CustomerID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.customers.Customer").init();
			obj.setCustomerID(qRead.CustomerID);
			obj.setCustomer(qRead.Customer);
			obj.setCreatedBy(qRead.CreatedBy);
			obj.setCreatedDate(qRead.CreatedDate);
			obj.setLastMaintainedBy(qRead.LastMaintainedBy);
			obj.setLastMaintainedDate(qRead.LastMaintainedDate);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.customers.Customer">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getCustomer()>
		<cfset var local2=arguments.bean.getCreatedBy()>
		<cfset var local3=arguments.bean.getCreatedDate()>
		<cfset var local4=arguments.bean.getLastMaintainedBy()>
		<cfset var local5=arguments.bean.getLastMaintainedDate()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into Customers(Customer, CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local3 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local5 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select CustomerID
				from Customers
				where Customer = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedBy = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedDate = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local3 eq ""), de("yes"), de("no"))#" />
				  and LastMaintainedBy = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />
				  and LastMaintainedDate = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local5 eq ""), de("yes"), de("no"))#" />
				order by CustomerID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setCustomerID(qGetID.CustomerID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.customers.Customer">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update Customers
			set Customer = <cfqueryparam value="#arguments.bean.getCustomer()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedBy = <cfqueryparam value="#arguments.bean.getCreatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedDate = <cfqueryparam value="#arguments.bean.getCreatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCreatedDate() eq ""), de("yes"), de("no"))#" />,
				LastMaintainedBy = <cfqueryparam value="#arguments.bean.getLastMaintainedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				LastMaintainedDate = <cfqueryparam value="#arguments.bean.getLastMaintainedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getLastMaintainedDate() eq ""), de("yes"), de("no"))#" />
			where CustomerID = <cfqueryparam value="#arguments.bean.getCustomerID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.customers.Customer">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from Customers
			where CustomerID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getCustomerID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>