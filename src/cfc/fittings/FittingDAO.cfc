<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.fittings.Fitting">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="Mochi">
			select 	FittingID, StyleID, SampleCategoryID, PatternMakerID, CutNumber, DueDate, 
					LocationID, ContractorID, Fitter, FittingDate, ResultCodeID, 
					PatternStatusID, Comments, CreatedDate, CreatedBy, LastMaintainedDate, 
					LastMaintainedBy
			from Fittings
			where FittingID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.fittings.Fitting").init();
			obj.setFittingID(qRead.FittingID);
			obj.setStyleID(qRead.StyleID);
			obj.setSampleCategoryID(qRead.SampleCategoryID);
			obj.setPatternMakerID(qRead.PatternMakerID);
			obj.setCutNumber(qRead.CutNumber);
			obj.setDueDate(qRead.DueDate);
			obj.setLocationID(qRead.LocationID);
			obj.setContractorID(qRead.ContractorID);
			obj.setFitter(qRead.Fitter);
			obj.setFittingDate(qRead.FittingDate);
			obj.setResultCodeID(qRead.ResultCodeID);
			obj.setPatternStatusID(qRead.PatternStatusID);
			obj.setComments(qRead.Comments);
			obj.setCreatedDate(qRead.CreatedDate);
			obj.setCreatedBy(qRead.CreatedBy);
			obj.setLastMaintainedDate(qRead.LastMaintainedDate);
			obj.setLastMaintainedBy(qRead.LastMaintainedBy);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.fittings.Fitting">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getStyleID()>
		<cfset var local2=arguments.bean.getSampleCategoryID()>
		<cfset var local3=arguments.bean.getPatternMakerID()>
		<cfset var local4=arguments.bean.getCutNumber()>
		<cfset var local5=arguments.bean.getDueDate()>
		<cfset var local6=arguments.bean.getLocationID()>
		<cfset var local7=arguments.bean.getContractorID()>
		<cfset var local8=arguments.bean.getFitter()>
		<cfset var local9=arguments.bean.getFittingDate()>
		<cfset var local10=arguments.bean.getResultCodeID()>
		<cfset var local11=arguments.bean.getPatternStatusID()>
		<cfset var local12=arguments.bean.getComments()>
		<cfset var local13=arguments.bean.getCreatedDate()>
		<cfset var local14=arguments.bean.getCreatedBy()>
		<cfset var local15=arguments.bean.getLastMaintainedDate()>
		<cfset var local16=arguments.bean.getLastMaintainedBy()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="Mochi">
				insert into Fittings(StyleID, SampleCategoryID, PatternMakerID, CutNumber, DueDate, LocationID, ContractorID, Fitter, FittingDate, ResultCodeID, PatternStatusID, Comments, CreatedDate, CreatedBy, LastMaintainedDate, LastMaintainedBy)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_INTEGER" null="#iif((local3 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_INTEGER" null="#iif((local4 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local5 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_INTEGER" null="#iif((local6 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_INTEGER" null="#iif((local7 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local9 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_INTEGER" null="#iif((local10 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local11#" cfsqltype="CF_SQL_INTEGER" null="#iif((local11 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local12#" cfsqltype="CF_SQL_LONGVARCHAR" />,
					<cfqueryparam value="#local13#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local13 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local14#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local15#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local15 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local16#" cfsqltype="CF_SQL_VARCHAR" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="Mochi">
				select FittingID
				from Fittings
				where StyleID = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and SampleCategoryID = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				  and PatternMakerID = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_INTEGER" null="#iif((local3 eq ""), de("yes"), de("no"))#" />
				  and CutNumber = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_INTEGER" null="#iif((local4 eq ""), de("yes"), de("no"))#" />
				  and DueDate = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local5 eq ""), de("yes"), de("no"))#" />
				  and LocationID = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_INTEGER" null="#iif((local6 eq ""), de("yes"), de("no"))#" />
				  and ContractorID = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_INTEGER" null="#iif((local7 eq ""), de("yes"), de("no"))#" />
				  and Fitter = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />
				  and FittingDate = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local9 eq ""), de("yes"), de("no"))#" />
				  and ResultCodeID = <cfqueryparam value="#local10#" cfsqltype="CF_SQL_INTEGER" null="#iif((local10 eq ""), de("yes"), de("no"))#" />
				  and PatternStatusID = <cfqueryparam value="#local11#" cfsqltype="CF_SQL_INTEGER" null="#iif((local11 eq ""), de("yes"), de("no"))#" />
				  and Comments = <cfqueryparam value="#local12#" cfsqltype="CF_SQL_LONGVARCHAR" />
				  and CreatedDate = <cfqueryparam value="#local13#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local13 eq ""), de("yes"), de("no"))#" />
				  and CreatedBy = <cfqueryparam value="#local14#" cfsqltype="CF_SQL_VARCHAR" />
				  and LastMaintainedDate = <cfqueryparam value="#local15#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local15 eq ""), de("yes"), de("no"))#" />
				  and LastMaintainedBy = <cfqueryparam value="#local16#" cfsqltype="CF_SQL_VARCHAR" />
				order by FittingID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setFittingID(qGetID.FittingID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.fittings.Fitting">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="Mochi" result="status">
			update Fittings
			set StyleID = <cfqueryparam value="#arguments.bean.getStyleID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getStyleID() eq ""), de("yes"), de("no"))#" />,
				SampleCategoryID = <cfqueryparam value="#arguments.bean.getSampleCategoryID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getSampleCategoryID() eq ""), de("yes"), de("no"))#" />,
				PatternMakerID = <cfqueryparam value="#arguments.bean.getPatternMakerID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getPatternMakerID() eq ""), de("yes"), de("no"))#" />,
				CutNumber = <cfqueryparam value="#arguments.bean.getCutNumber()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getCutNumber() eq ""), de("yes"), de("no"))#" />,
				DueDate = <cfqueryparam value="#arguments.bean.getDueDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getDueDate() eq ""), de("yes"), de("no"))#" />,
				LocationID = <cfqueryparam value="#arguments.bean.getLocationID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getLocationID() eq ""), de("yes"), de("no"))#" />,
				ContractorID = <cfqueryparam value="#arguments.bean.getContractorID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getContractorID() eq ""), de("yes"), de("no"))#" />,
				Fitter = <cfqueryparam value="#arguments.bean.getFitter()#" cfsqltype="CF_SQL_VARCHAR" />,
				FittingDate = <cfqueryparam value="#arguments.bean.getFittingDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getFittingDate() eq ""), de("yes"), de("no"))#" />,
				ResultCodeID = <cfqueryparam value="#arguments.bean.getResultCodeID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getResultCodeID() eq ""), de("yes"), de("no"))#" />,
				PatternStatusID = <cfqueryparam value="#arguments.bean.getPatternStatusID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getPatternStatusID() eq ""), de("yes"), de("no"))#" />,
				Comments = <cfqueryparam value="#arguments.bean.getComments()#" cfsqltype="CF_SQL_LONGVARCHAR" />,
				CreatedDate = <cfqueryparam value="#arguments.bean.getCreatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getCreatedDate() eq ""), de("yes"), de("no"))#" />,
				CreatedBy = <cfqueryparam value="#arguments.bean.getCreatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				LastMaintainedDate = <cfqueryparam value="#arguments.bean.getLastMaintainedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getLastMaintainedDate() eq ""), de("yes"), de("no"))#" />,
				LastMaintainedBy = <cfqueryparam value="#arguments.bean.getLastMaintainedBy()#" cfsqltype="CF_SQL_VARCHAR" />
			where FittingID = <cfqueryparam value="#arguments.bean.getFittingID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.fittings.Fitting">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="Mochi" result="status">
			delete
			from Fittings
			where FittingID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getFittingID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>