<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.vendors.Vendor">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	VendorID, Vendor, ContactName, TelephoneNumber, FaxNumber, EMail, 
					Address, CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate
					
			from Vendors
			where VendorID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.vendors.Vendor").init();
			obj.setVendorID(qRead.VendorID);
			obj.setVendor(qRead.Vendor);
			obj.setContactName(qRead.ContactName);
			obj.setTelephoneNumber(qRead.TelephoneNumber);
			obj.setFaxNumber(qRead.FaxNumber);
			obj.setEMail(qRead.EMail);
			obj.setAddress(qRead.Address);
			obj.setCreatedBy(qRead.CreatedBy);
			obj.setCreatedDate(qRead.CreatedDate);
			obj.setLastMaintainedBy(qRead.LastMaintainedBy);
			obj.setLastMaintainedDate(qRead.LastMaintainedDate);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.vendors.Vendor">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getVendor()>
		<cfset var local2=arguments.bean.getContactName()>
		<cfset var local3=arguments.bean.getTelephoneNumber()>
		<cfset var local4=arguments.bean.getFaxNumber()>
		<cfset var local5=arguments.bean.getEMail()>
		<cfset var local6=arguments.bean.getAddress()>
		<cfset var local7=arguments.bean.getCreatedBy()>
		<cfset var local8=arguments.bean.getCreatedDate()>
		<cfset var local9=arguments.bean.getLastMaintainedBy()>
		<cfset var local10=arguments.bean.getLastMaintainedDate()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into Vendors(Vendor, ContactName, TelephoneNumber, FaxNumber, EMail, Address, CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local8 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local10 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select VendorID
				from Vendors
				where Vendor = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />
				  and ContactName = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				  and TelephoneNumber = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				  and FaxNumber = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />
				  and EMail = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />
				  and Address = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedBy = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedDate = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local8 eq ""), de("yes"), de("no"))#" />
				  and LastMaintainedBy = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />
				  and LastMaintainedDate = <cfqueryparam value="#local10#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local10 eq ""), de("yes"), de("no"))#" />
				order by VendorID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setVendorID(qGetID.VendorID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.vendors.Vendor">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update Vendors
			set Vendor = <cfqueryparam value="#arguments.bean.getVendor()#" cfsqltype="CF_SQL_VARCHAR" />,
				ContactName = <cfqueryparam value="#arguments.bean.getContactName()#" cfsqltype="CF_SQL_VARCHAR" />,
				TelephoneNumber = <cfqueryparam value="#arguments.bean.getTelephoneNumber()#" cfsqltype="CF_SQL_VARCHAR" />,
				FaxNumber = <cfqueryparam value="#arguments.bean.getFaxNumber()#" cfsqltype="CF_SQL_VARCHAR" />,
				EMail = <cfqueryparam value="#arguments.bean.getEMail()#" cfsqltype="CF_SQL_VARCHAR" />,
				Address = <cfqueryparam value="#arguments.bean.getAddress()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedBy = <cfqueryparam value="#arguments.bean.getCreatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedDate = <cfqueryparam value="#arguments.bean.getCreatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCreatedDate() eq ""), de("yes"), de("no"))#" />,
				LastMaintainedBy = <cfqueryparam value="#arguments.bean.getLastMaintainedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				LastMaintainedDate = <cfqueryparam value="#arguments.bean.getLastMaintainedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getLastMaintainedDate() eq ""), de("yes"), de("no"))#" />
			where VendorID = <cfqueryparam value="#arguments.bean.getVendorID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.vendors.Vendor">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from Vendors
			where VendorID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getVendorID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>