<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.copyrights.Copyright">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	CopyrightID, CopyrightAuthorID, TitleOfWork, Description, Transfer, YearOfCreation, 
					PublicationDate, PriorRegistration, ApplicationDate, ApprovedDate, RegistrationNumber, 
					CopyrightApplicationStatusID, CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate
					
			from Copyrights
			where CopyrightID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.copyrights.Copyright").init();
			obj.setCopyrightID(qRead.CopyrightID);
			obj.setCopyrightAuthorID(qRead.CopyrightAuthorID);
			obj.setTitleOfWork(qRead.TitleOfWork);
			obj.setDescription(qRead.Description);
			obj.setTransfer(qRead.Transfer);
			obj.setYearOfCreation(qRead.YearOfCreation);
			obj.setPublicationDate(qRead.PublicationDate);
			obj.setPriorRegistration(qRead.PriorRegistration);
			obj.setApplicationDate(qRead.ApplicationDate);
			obj.setApprovedDate(qRead.ApprovedDate);
			obj.setRegistrationNumber(qRead.RegistrationNumber);
			obj.setCopyrightApplicationStatusID(qRead.CopyrightApplicationStatusID);
			obj.setCreatedBy(qRead.CreatedBy);
			obj.setCreatedDate(qRead.CreatedDate);
			obj.setLastMaintainedBy(qRead.LastMaintainedBy);
			obj.setLastMaintainedDate(qRead.LastMaintainedDate);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.copyrights.Copyright">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getCopyrightAuthorID()>
		<cfset var local2=arguments.bean.getTitleOfWork()>
		<cfset var local3=arguments.bean.getDescription()>
		<cfset var local4=arguments.bean.getTransfer()>
		<cfset var local5=arguments.bean.getYearOfCreation()>
		<cfset var local6=arguments.bean.getPublicationDate()>
		<cfset var local7=arguments.bean.getPriorRegistration()>
		<cfset var local8=arguments.bean.getApplicationDate()>
		<cfset var local9=arguments.bean.getApprovedDate()>
		<cfset var local10=arguments.bean.getRegistrationNumber()>
		<cfset var local11=arguments.bean.getCopyrightApplicationStatusID()>
		<cfset var local12=arguments.bean.getCreatedBy()>
		<cfset var local13=arguments.bean.getCreatedDate()>
		<cfset var local14=arguments.bean.getLastMaintainedBy()>
		<cfset var local15=arguments.bean.getLastMaintainedDate()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into Copyrights(CopyrightAuthorID, TitleOfWork, Description, Transfer, YearOfCreation, PublicationDate, PriorRegistration, ApplicationDate, ApprovedDate, RegistrationNumber, CopyrightApplicationStatusID, CreatedBy, CreatedDate, LastMaintainedBy, LastMaintainedDate)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local5 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local6 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local8 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local9 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local11#" cfsqltype="CF_SQL_INTEGER" null="#iif((local11 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local12#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local13#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local13 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local14#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local15#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local15 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select CopyrightID
				from Copyrights
				where CopyrightAuthorID = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and TitleOfWork = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				  and Description = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				  and Transfer = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />
				  and YearOfCreation = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local5 eq ""), de("yes"), de("no"))#" />
				  and PublicationDate = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local6 eq ""), de("yes"), de("no"))#" />
				  and PriorRegistration = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />
				  and ApplicationDate = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local8 eq ""), de("yes"), de("no"))#" />
				  and ApprovedDate = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local9 eq ""), de("yes"), de("no"))#" />
				  and RegistrationNumber = <cfqueryparam value="#local10#" cfsqltype="CF_SQL_VARCHAR" />
				  and CopyrightApplicationStatusID = <cfqueryparam value="#local11#" cfsqltype="CF_SQL_INTEGER" null="#iif((local11 eq ""), de("yes"), de("no"))#" />
				  and CreatedBy = <cfqueryparam value="#local12#" cfsqltype="CF_SQL_VARCHAR" />
				  and CreatedDate = <cfqueryparam value="#local13#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local13 eq ""), de("yes"), de("no"))#" />
				  and LastMaintainedBy = <cfqueryparam value="#local14#" cfsqltype="CF_SQL_VARCHAR" />
				  and LastMaintainedDate = <cfqueryparam value="#local15#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local15 eq ""), de("yes"), de("no"))#" />
				order by CopyrightID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setCopyrightID(qGetID.CopyrightID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.copyrights.Copyright">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update Copyrights
			set CopyrightAuthorID = <cfqueryparam value="#arguments.bean.getCopyrightAuthorID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getCopyrightAuthorID() eq ""), de("yes"), de("no"))#" />,
				TitleOfWork = <cfqueryparam value="#arguments.bean.getTitleOfWork()#" cfsqltype="CF_SQL_VARCHAR" />,
				Description = <cfqueryparam value="#arguments.bean.getDescription()#" cfsqltype="CF_SQL_VARCHAR" />,
				Transfer = <cfqueryparam value="#arguments.bean.getTransfer()#" cfsqltype="CF_SQL_VARCHAR" />,
				YearOfCreation = <cfqueryparam value="#arguments.bean.getYearOfCreation()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getYearOfCreation() eq ""), de("yes"), de("no"))#" />,
				PublicationDate = <cfqueryparam value="#arguments.bean.getPublicationDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getPublicationDate() eq ""), de("yes"), de("no"))#" />,
				PriorRegistration = <cfqueryparam value="#arguments.bean.getPriorRegistration()#" cfsqltype="CF_SQL_VARCHAR" />,
				ApplicationDate = <cfqueryparam value="#arguments.bean.getApplicationDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getApplicationDate() eq ""), de("yes"), de("no"))#" />,
				ApprovedDate = <cfqueryparam value="#arguments.bean.getApprovedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getApprovedDate() eq ""), de("yes"), de("no"))#" />,
				RegistrationNumber = <cfqueryparam value="#arguments.bean.getRegistrationNumber()#" cfsqltype="CF_SQL_VARCHAR" />,
				CopyrightApplicationStatusID = <cfqueryparam value="#arguments.bean.getCopyrightApplicationStatusID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getCopyrightApplicationStatusID() eq ""), de("yes"), de("no"))#" />,
				CreatedBy = <cfqueryparam value="#arguments.bean.getCreatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				CreatedDate = <cfqueryparam value="#arguments.bean.getCreatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCreatedDate() eq ""), de("yes"), de("no"))#" />,
				LastMaintainedBy = <cfqueryparam value="#arguments.bean.getLastMaintainedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				LastMaintainedDate = <cfqueryparam value="#arguments.bean.getLastMaintainedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getLastMaintainedDate() eq ""), de("yes"), de("no"))#" />
			where CopyrightID = <cfqueryparam value="#arguments.bean.getCopyrightID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.copyrights.Copyright">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from Copyrights
			where CopyrightID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getCopyrightID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>