<cfcomponent output="false"  alias="mochi.cfc.reports.Report">
	
	<cffunction name="ReportQuery" returntype="query" output="no" access="public">
		<cfargument name="param" type="struct" required="false">
		<cfset var MyQuery="">
		<!---
			ProductionStatusChartTadashi.cfr expects the query passed into it to contain the following column names:
				Field: ImageFile             DataType: String
				Field: StyleName             DataType: String
				Field: ProductionTeamLeader  DataType: String
				Field: ProductionPatternMaker  DataType: String
				Field: FirstPatternMaker     DataType: String
				Field: ShippedDate           DataType: Time Stamp
				Field: DeadlineToContractor  DataType: Time Stamp
				Field: Quantity              DataType: Short
				Field: Customer              DataType: String
				Field: DueDate               DataType: Time Stamp
				Field: Comments              DataType: String
		--->

		<cfquery name="MyQuery" datasource="#Application.datasource#">			
			SELECT DISTINCT Styles.StyleID, Styles.StyleName, Styles.ProductionTeamLeader, Styles.ProductionPatternMaker, Styles.FirstPatternMaker, SampleProgress.RequestReceivedDate, SampleProgress.Comments AS ProgressComments, SampleShipments.AttentionTo, SampleShipments.Sender, SampleShipments.ShippedDate, SampleShipments.TrackingNumber, SampleRequest.ReferenceNumber, SampleRequest.RequestedBy, SampleRequest.RequestedFor, SampleRequest.RequestDate, SampleRequest.DeadlineToContractor, SampleRequest.Quantity, SampleRequest.Customer, SampleRequest.DueDate, SampleRequest.PatternDueDate, SampleRequest.SampleTypeID,SampleRequest.Comments, SampleRequest.HasOrder, SampleRequest.MakeIn, SampleRequest.RequestSubmitted, SampleTypes.SampleType, Colors.ColorName, Sizes.Size, Images.File, Images.ThumbnailFile, RequestStatus.Status, SampleShipments.ShipTo, Deliveries.Delivery, Images_1.File AS FileShipment, Images_1.ThumbnailFile AS ThumbnailFileShipment, SampleRequest.CancellationDate, SampleRequest.CancelledBy, PatternStatus.Status AS PatternStatus, SampleProgress.AssignedDate, SampleProgress.FinishedDate, SampleProgress.StartDate, SampleProgress.PlanDate 
			FROM (((((((((((SampleRequest INNER JOIN Styles ON SampleRequest.StyleID = Styles.StyleID) INNER JOIN SampleTypes ON SampleRequest.SampleTypeID = SampleTypes.SampleTypeID) INNER JOIN Colors ON SampleRequest.ColorID = Colors.ColorID) INNER JOIN Sizes ON SampleRequest.SizeID = Sizes.SizeID) INNER JOIN RequestStatus ON SampleRequest.RequestStatusID = RequestStatus.RequestStatusID) LEFT JOIN SampleProgress ON SampleRequest.SampleRequestID = SampleProgress.SampleRequestID) LEFT JOIN SampleShipments ON SampleRequest.SampleRequestID = SampleShipments.SampleRequestID) LEFT JOIN Images ON (Styles.EntityTypeID = Images.EntityTypeID) AND (Styles.StyleID = Images.EntityID)) INNER JOIN Deliveries ON SampleRequest.DeliveryID = Deliveries.DeliveryID) LEFT JOIN Images AS Images_1 ON (SampleShipments.EntityID = Images_1.EntityTypeID) AND (SampleShipments.SampleRequestID = Images_1.EntityID)) INNER JOIN Collections ON SampleRequest.CollectionID = Collections.CollectionID) LEFT JOIN PatternStatus ON SampleProgress.PatternStatusID = PatternStatus.PatternStatusID
			WHERE 0 = 0
			  
			<cfif structKeyExists(arguments.param, "CollectionID") AND #arguments.param.CollectionID# IS NOT 0>
				AND Collections.CollectionID IN (#arguments.param.CollectionID#)  
			</cfif>  
			
			<cfif structKeyExists(arguments.param, "SampleType") AND #arguments.param.Sampletype# IS NOT 0>
				AND SampleTypes.SampleTypeID IN (#arguments.param.Sampletype#)  
			</cfif>  
			
			<cfif structKeyExists(arguments.param, "DeliveryID") AND #arguments.param.DeliveryID# IS NOT ''>
				AND Deliveries.DeliveryID  = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.param.DeliveryID#"/> 
			</cfif>
			
			<cfif structKeyExists(arguments.param, "YearID") AND #arguments.param.YearID# IS NOT ''>
				AND SampleRequest.YearID  = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.param.YearID#"/> 
			</cfif>
			
			<cfif structKeyExists(arguments.param, "makeIn") AND #arguments.param.makeIn# IS NOT ''>
				AND SampleRequest.MakeIn LIKE '%' & <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.param.makeIn#"/> & '%'
			</cfif>
			
			<cfif structKeyExists(arguments.param, "styleNumber")>
				AND Styles.StyleName LIKE '%' & <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.param.styleNumber#"/> & '%'
			</cfif>
			
			<cfif structKeyExists(arguments.param, "ShipFrom") AND #arguments.param.ShipFrom# IS NOT 0>
				AND SampleShipments.ShipFrom LIKE '%' & <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.param.ShipFrom#"/> & '%' 
			</cfif>  
			
			<cfif structKeyExists(arguments.param, "ShipTo") AND #arguments.param.ShipTo# IS NOT 0>
				AND SampleShipments.ShipTo LIKE '%' & <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.param.ShipTo#"/> & '%' 
			</cfif>  
			
			<cfif structKeyExists(arguments.param, "RequestedBy") AND #arguments.param.RequestedBy# IS NOT 0>
				AND SampleRequest.RequestedBy LIKE '%' & <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.param.RequestedBy#"/> & '%' 
			</cfif>  

			<cfif structKeyExists(arguments.param, "RequestedFor") AND #arguments.param.RequestedFor# IS NOT 0>
				AND SampleRequest.RequestedFor LIKE '%' & <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.param.RequestedFor#"/> & '%' 
			</cfif>  

			<cfif structKeyExists(arguments.param, "FromRequestDate") AND #arguments.param.FromRequestDate# IS NOT ''>
				AND SampleRequest.RequestDate >= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.FromRequestDate#"/> 
			</cfif>  
			  
			<cfif structKeyExists(arguments.param, "ToRequestDate") AND #arguments.param.ToRequestDate# IS NOT ''>
				AND SampleRequest.RequestDate <= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.ToRequestDate#"/> 
			</cfif>  
			  
			<cfif structKeyExists(arguments.param, "FromDueDate") AND #arguments.param.FromDueDate# IS NOT ''>
				AND SampleRequest.DueDate >= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.FromDueDate#"/> 
			</cfif>  
			  
			<cfif structKeyExists(arguments.param, "ToDueDate") AND #arguments.param.ToDueDate# IS NOT ''>
				AND SampleRequest.DueDate <= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.ToDueDate#"/> 
			</cfif>  
			  
			<cfif structKeyExists(arguments.param, "FromPatternDueDate") AND #arguments.param.FromPatternDueDate# IS NOT ''>
				AND SampleRequest.PatternDueDate >= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.FromPatternDueDate#"/> 
			</cfif>  

			<cfif structKeyExists(arguments.param, "ToPatternDueDate") AND #arguments.param.ToPatternDueDate# IS NOT ''>
				AND SampleRequest.PatternDueDate <= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.ToPatternDueDate#"/> 
			</cfif>  

			<cfif structKeyExists(arguments.param, "DeadlineToContractorDate") AND #arguments.param.DeadlineToContractorDate# IS NOT ''>
				AND SampleRequest.DeadlineToContractorDate = <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.DeadlineToContractorDate#"/> 
			</cfif>
			  
			<cfif structKeyExists(arguments.param, "FromReceivedDate") AND #arguments.param.FromReceivedDate# IS NOT ''>
				AND SampleRequest.ReceivedDate >= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.FromReceivedDate#"/> 
			</cfif>
			  
			<cfif structKeyExists(arguments.param, "ToReceivedDate") AND #arguments.param.ToReceivedDate# IS NOT ''>
				AND SampleRequest.ReceivedDate <= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.ToReceivedDate#"/> 
			</cfif>
			  
			<cfif structKeyExists(arguments.param, "RequestStatus") AND #arguments.param.RequestStatus# IS NOT 0>
				AND SampleRequest.RequestStatusID IN (#arguments.param.RequestStatus#) 
			</cfif>  
			  
			<cfif structKeyExists(arguments.param, "PatternStatus") AND #arguments.param.PatternStatus# IS NOT 0>
				AND PatternStatus.PatternStatusID IN (#arguments.param.PatternStatus#) 
			</cfif>  
			  
			<cfif structKeyExists(arguments.param, "FromShipmentDate") AND #arguments.param.FromShipmentDate# IS NOT ''>
				AND SampleShipments.ShippedDate >= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.FromShipmentDate#"/> 
			</cfif>
			  
			<cfif structKeyExists(arguments.param, "ToShipmentDate") AND #arguments.param.ToShipmentDate# IS NOT ''>
				AND SampleShipments.ShippedDate <= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.ToShipmentDate#"/> 
			</cfif>			  		

			<cfif structKeyExists(arguments.param, "FromPlanShipDate") AND #arguments.param.FromPlanShipDate# IS NOT ''>
				AND SampleProgress.PlanDate >= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.FromPlanShipDate#"/> 
			</cfif>
			  
			<cfif structKeyExists(arguments.param, "ToPlanShipDate") AND #arguments.param.ToPlanShipDate# IS NOT ''>
				AND SampleProgress.PlanDate <= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.ToPlanShipDate#"/> 
			</cfif>			  		

			<cfif structKeyExists(arguments.param, "FromCancellationDate") AND #arguments.param.FromCancellationDate# IS NOT ''>
				AND SampleRequest.CancellationDate >= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.FromCancellationDate#"/> 
			</cfif>
			  
			<cfif structKeyExists(arguments.param, "ToCancellationDate") AND #arguments.param.ToCancellationDate# IS NOT ''>
				AND SampleRequest.CancellationDate <= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.ToCancellationDate#"/> 
			</cfif>
						  		
			<cfif structKeyExists(arguments.param, "FromPatternApprovedDate") AND #arguments.param.FromPatternApprovedDate# IS NOT ''>
				AND SampleProgress.ApprovedDate >= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.FromPatternApprovedDate#"/> 
			</cfif>  


			<cfif structKeyExists(arguments.param, "ToPatternApprovedDate") AND #arguments.param.ToPatternApprovedDate# IS NOT ''>
				AND SampleProgress.ApprovedDate <= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.ToPatternApprovedDate#"/> 
			</cfif>  
			  
			<cfif structKeyExists(arguments.param, "FromProgressLastMaintainedDate") AND #arguments.param.FromProgressLastMaintainedDate# IS NOT ''>
				AND SampleProgress.LastMaintainedDate >= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.FromProgressLastMaintainedDate#"/> 
			</cfif>  


			<cfif structKeyExists(arguments.param, "ToProgressLastMaintainedDate") AND #arguments.param.ToProgressLastMaintainedDate# IS NOT ''>
				AND SampleProgress.LastMaintainedDate <= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.ToProgressLastMaintainedDate#"/> 
			</cfif>  
			  
			<cfif structKeyExists(arguments.param, "OrderBy") AND #arguments.param.OrderBy# IS NOT ''>
				<cfif arguments.param.OrderBy EQ 'Delivery'>
					ORDER BY  Deliveries.Delivery, SampleTypes.SampleType 
				</cfif>
			<cfelse>
			  	ORDER BY  Styles.ProductionTeamLeader, Styles.ProductionPatternMaker, Deliveries.Delivery				 
			</cfif>			  		
			  		
		</cfquery>
		
		<cfreturn MyQuery>
	</cffunction>



	<cffunction name="FirstSamplesReportQuery" returntype="query" output="no" access="public">
		<cfargument name="param" type="struct" required="false">
		<cfset var MyQuery="">
		<!---
			ProductionStatusChartTadashi.cfr expects the query passed into it to contain the following column names:
				Field: ImageFile             DataType: String
				Field: StyleName             DataType: String
				Field: ProductionTeamLeader  DataType: String
				Field: ProductionPatternMaker  DataType: String
				Field: FirstPatternMaker     DataType: String
				Field: ShippedDate           DataType: Time Stamp
				Field: DeadlineToContractor  DataType: Time Stamp
				Field: Quantity              DataType: Short
				Field: Customer              DataType: String
				Field: DueDate               DataType: Time Stamp
				Field: Comments              DataType: String
		--->

		<cfquery name="MyQuery" datasource="#Application.datasource#">			
			SELECT DISTINCT Styles.StyleID, Styles.StyleName, Styles.ProductionTeamLeader, Styles.ProductionPatternMaker, Styles.FirstPatternMaker, Styles.PatternReference, SampleProgress.RequestReceivedDate, SampleProgress.Comments AS ProgressComments, SampleShipments.AttentionTo, SampleShipments.Sender, SampleShipments.ShippedDate, SampleShipments.TrackingNumber, SampleRequest.ReferenceNumber, SampleRequest.RequestedBy, SampleRequest.RequestedFor, SampleRequest.RequestDate, SampleRequest.DeadlineToContractor, SampleRequest.Quantity, SampleRequest.Customer, SampleRequest.DueDate, SampleRequest.PatternDueDate, SampleRequest.SampleTypeID, SampleRequest.Comments, SampleRequest.HasOrder, SampleRequest.MakeIn, SampleRequest.RequestSubmitted, SampleTypes.SampleType, Colors.ColorName, Sizes.Size, Images.File, Images.ThumbnailFile, RequestStatus.Status, SampleShipments.ShipTo, Deliveries.DeliveryID, Deliveries.Delivery, Images_1.File AS FileShipment, Images_1.ThumbnailFile AS ThumbnailFileShipment, SampleRequest.CancellationDate, SampleRequest.CancelledBy, PatternStatus.Status AS PatternStatus, SampleProgress.AssignedDate, SampleProgress.FinishedDate, SampleProgress.StartDate, Years.Year
			FROM ((((((((((((SampleRequest INNER JOIN Styles ON SampleRequest.StyleID = Styles.StyleID) INNER JOIN SampleTypes ON SampleRequest.SampleTypeID = SampleTypes.SampleTypeID) INNER JOIN Colors ON SampleRequest.ColorID = Colors.ColorID) INNER JOIN Sizes ON SampleRequest.SizeID = Sizes.SizeID) INNER JOIN RequestStatus ON SampleRequest.RequestStatusID = RequestStatus.RequestStatusID) LEFT JOIN SampleProgress ON SampleRequest.SampleRequestID = SampleProgress.SampleRequestID) LEFT JOIN SampleShipments ON SampleRequest.SampleRequestID = SampleShipments.SampleRequestID) LEFT JOIN Images ON (Styles.StyleID = Images.EntityID) AND (Styles.EntityTypeID = Images.EntityTypeID)) INNER JOIN Deliveries ON SampleRequest.DeliveryID = Deliveries.DeliveryID) LEFT JOIN Images AS Images_1 ON (SampleShipments.SampleRequestID = Images_1.EntityID) AND (SampleShipments.EntityID = Images_1.EntityTypeID)) INNER JOIN Collections ON SampleRequest.CollectionID = Collections.CollectionID) LEFT JOIN PatternStatus ON SampleProgress.PatternStatusID = PatternStatus.PatternStatusID) LEFT JOIN Years ON SampleRequest.YearID = Years.YearID
			WHERE 0 = 0
			  
			<cfif structKeyExists(arguments.param, "CollectionID") AND #arguments.param.CollectionID# IS NOT 0>
				AND Collections.CollectionID IN (#arguments.param.CollectionID#)  
			</cfif>  
			
			<cfif structKeyExists(arguments.param, "SampleType") AND #arguments.param.Sampletype# IS NOT 0>
				AND SampleTypes.SampleTypeID IN (#arguments.param.Sampletype#)  
			</cfif>  
			
			<cfif structKeyExists(arguments.param, "DeliveryID") AND #arguments.param.DeliveryID# IS NOT ''>
				AND Deliveries.DeliveryID  = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.param.DeliveryID#"/> 
			</cfif>
			
			<cfif structKeyExists(arguments.param, "YearID") AND #arguments.param.YearID# IS NOT ''>
				AND SampleRequest.YearID  = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.param.YearID#"/> 
			</cfif>
			
			<cfif structKeyExists(arguments.param, "makeIn") AND #arguments.param.makeIn# IS NOT ''>
				AND SampleRequest.MakeIn LIKE '%' & <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.param.makeIn#"/> & '%'
			</cfif>
			
			<cfif structKeyExists(arguments.param, "styleNumber")>
				AND Styles.StyleName LIKE '%' & <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.param.styleNumber#"/> & '%'
			</cfif>
			
			<cfif structKeyExists(arguments.param, "ShipFrom") AND #arguments.param.ShipFrom# IS NOT 0>
				AND SampleShipments.ShipFrom LIKE '%' & <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.param.ShipFrom#"/> & '%' 
			</cfif>  
			
			<cfif structKeyExists(arguments.param, "ShipTo") AND #arguments.param.ShipTo# IS NOT 0>
				AND SampleShipments.ShipTo LIKE '%' & <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.param.ShipTo#"/> & '%' 
			</cfif>  
			
			<cfif structKeyExists(arguments.param, "RequestedBy") AND #arguments.param.RequestedBy# IS NOT 0>
				AND SampleRequest.RequestedBy LIKE '%' & <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.param.RequestedBy#"/> & '%' 
			</cfif>  

			<cfif structKeyExists(arguments.param, "RequestedFor") AND #arguments.param.RequestedFor# IS NOT 0>
				AND SampleRequest.RequestedFor LIKE '%' & <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.param.RequestedFor#"/> & '%' 
			</cfif>  

			<cfif structKeyExists(arguments.param, "FromRequestDate") AND #arguments.param.FromRequestDate# IS NOT ''>
				AND SampleRequest.RequestDate >= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.FromRequestDate#"/> 
			</cfif>  
			  
			<cfif structKeyExists(arguments.param, "ToRequestDate") AND #arguments.param.ToRequestDate# IS NOT ''>
				AND SampleRequest.RequestDate <= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.ToRequestDate#"/> 
			</cfif>  
			  
			<cfif structKeyExists(arguments.param, "FromDueDate") AND #arguments.param.FromDueDate# IS NOT ''>
				AND SampleRequest.DueDate >= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.FromDueDate#"/> 
			</cfif>  
			  
			<cfif structKeyExists(arguments.param, "ToDueDate") AND #arguments.param.ToDueDate# IS NOT ''>
				AND SampleRequest.DueDate <= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.ToDueDate#"/> 
			</cfif>  
			  
			<cfif structKeyExists(arguments.param, "FromPatternDueDate") AND #arguments.param.FromPatternDueDate# IS NOT ''>
				AND SampleRequest.PatternDueDate >= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.FromPatternDueDate#"/> 
			</cfif>  

			<cfif structKeyExists(arguments.param, "ToPatternDueDate") AND #arguments.param.ToPatternDueDate# IS NOT ''>
				AND SampleRequest.PatternDueDate <= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.ToPatternDueDate#"/> 
			</cfif>  

			<cfif structKeyExists(arguments.param, "DeadlineToContractorDate") AND #arguments.param.DeadlineToContractorDate# IS NOT ''>
				AND SampleRequest.DeadlineToContractorDate = <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.DeadlineToContractorDate#"/> 
			</cfif>
			  
			<cfif structKeyExists(arguments.param, "FromReceivedDate") AND #arguments.param.FromReceivedDate# IS NOT ''>
				AND SampleRequest.ReceivedDate >= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.FromReceivedDate#"/> 
			</cfif>
			  
			<cfif structKeyExists(arguments.param, "ToReceivedDate") AND #arguments.param.ToReceivedDate# IS NOT ''>
				AND SampleRequest.ReceivedDate <= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.ToReceivedDate#"/> 
			</cfif>
			  
			<cfif structKeyExists(arguments.param, "RequestStatus") AND #arguments.param.RequestStatus# IS NOT 0>
				AND SampleRequest.RequestStatusID IN (#arguments.param.RequestStatus#) 
			</cfif>  
			  
			<cfif structKeyExists(arguments.param, "PatternStatus") AND #arguments.param.PatternStatus# IS NOT 0>
				AND PatternStatus.PatternStatusID IN (#arguments.param.PatternStatus#) 
			</cfif>  
			  
			<cfif structKeyExists(arguments.param, "FromShipmentDate") AND #arguments.param.FromShipmentDate# IS NOT ''>
				AND SampleShipments.ShippedDate >= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.FromShipmentDate#"/> 
			</cfif>
			  
			<cfif structKeyExists(arguments.param, "ToShipmentDate") AND #arguments.param.ToShipmentDate# IS NOT ''>
				AND SampleShipments.ShippedDate <= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.ToShipmentDate#"/> 
			</cfif>			  		

			<cfif structKeyExists(arguments.param, "FromCancellationDate") AND #arguments.param.FromCancellationDate# IS NOT ''>
				AND SampleRequest.CancellationDate >= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.FromCancellationDate#"/> 
			</cfif>
			  
			<cfif structKeyExists(arguments.param, "ToCancellationDate") AND #arguments.param.ToCancellationDate# IS NOT ''>
				AND SampleRequest.CancellationDate <= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.ToCancellationDate#"/> 
			</cfif>
						  		
			<cfif structKeyExists(arguments.param, "FromPatternApprovedDate") AND #arguments.param.FromPatternApprovedDate# IS NOT ''>
				AND SampleProgress.ApprovedDate >= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.FromPatternApprovedDate#"/> 
			</cfif>  


			<cfif structKeyExists(arguments.param, "ToPatternApprovedDate") AND #arguments.param.ToPatternApprovedDate# IS NOT ''>
				AND SampleProgress.ApprovedDate <= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.ToPatternApprovedDate#"/> 
			</cfif>  
			  
			<cfif structKeyExists(arguments.param, "FromProgressLastMaintainedDate") AND #arguments.param.FromProgressLastMaintainedDate# IS NOT ''>
				AND SampleProgress.LastMaintainedDate >= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.FromProgressLastMaintainedDate#"/> 
			</cfif>  


			<cfif structKeyExists(arguments.param, "ToProgressLastMaintainedDate") AND #arguments.param.ToProgressLastMaintainedDate# IS NOT ''>
				AND SampleProgress.LastMaintainedDate <= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.ToProgressLastMaintainedDate#"/> 
			</cfif>  
			  
			<cfif structKeyExists(arguments.param, "OrderBy") AND #arguments.param.OrderBy# IS NOT ''>
				<cfif arguments.param.OrderBy EQ 'Delivery'>
					ORDER BY  Deliveries.Delivery, SampleTypes.SampleType 
				</cfif>
			<cfelse>
			  	ORDER BY  Styles.ProductionTeamLeader, Styles.FirstPatternMaker, Deliveries.DeliveryID ASC				 
			</cfif>			  		
			  		
		</cfquery>
		
		<cfreturn MyQuery>
	</cffunction>

	
	<cffunction name="PerformanceReportQuery" returntype="query" output="no" access="public">
		<cfargument name="param" type="struct" required="false">
	
			<cfquery name="MyQuery" datasource="#Application.datasource#">			
				SELECT Styles.StyleName, SampleProgress.AssignedDate, SampleProgress.FinishedDate, SampleProgress.StartDate, SampleProgress.ApprovedDate, SampleTypes.SampleType, SampleRequest.RequestDate, Styles.ProductionTeamLeader, IIf(SampleTypes.SampleTypeID=4,Styles.ProductionPatternMaker,Styles.FirstPatternMaker) AS PatternMaker, Styles.StyleID, Styles.PatternDifficulty, PatternStatus.Status, Images.ThumbnailFile, SampleRequest.PatternDueDate, SampleRequest.HasOrder, SampleProgress.Comments AS ProgressComments, SampleRequest.Comments  
				FROM ((Styles INNER JOIN (SampleTypes INNER JOIN (SampleProgress INNER JOIN SampleRequest ON SampleProgress.SampleRequestID = SampleRequest.SampleRequestID) ON SampleTypes.SampleTypeID = SampleRequest.SampleTypeID) ON Styles.StyleID = SampleRequest.StyleID) INNER JOIN PatternStatus ON SampleProgress.PatternStatusID = PatternStatus.PatternStatusID) INNER JOIN Images ON (Styles.EntityTypeID = Images.EntityTypeID) AND (Styles.StyleID = Images.EntityID)
				WHERE 0 = 0
				
				<cfif structKeyExists(arguments.param, "SampleType") AND #arguments.param.Sampletype# IS NOT 0>
					AND SampleTypes.SampleTypeID IN (#arguments.param.Sampletype#)  
				</cfif>  
	
				<cfif structKeyExists(arguments.param, "PatternStatus") AND #arguments.param.PatternStatus# IS NOT 0>
					AND SampleProgress.PatternStatusID IN (#arguments.param.PatternStatus#)  
				</cfif>  
	
				<cfif structKeyExists(arguments.param, "RequestStatus") AND #arguments.param.RequestStatus# IS NOT 0>
					AND SampleRequest.RequestStatusID IN (#arguments.param.RequestStatus#)  
				</cfif>  
	
				<cfif structKeyExists(arguments.param, "FromRequestDate") AND #arguments.param.FromRequestDate# IS NOT ''>
					AND SampleRequest.RequestDate >= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.FromRequestDate#"/> 
				</cfif>  
				  
				<cfif structKeyExists(arguments.param, "ToRequestDate") AND #arguments.param.ToRequestDate# IS NOT ''>
					AND SampleRequest.RequestDate <= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.ToRequestDate#"/> 
				</cfif>  

				<cfif structKeyExists(arguments.param, "FromFinishedDate") AND #arguments.param.FromFinishedDate# IS NOT ''>
					AND SampleProgress.FinishedDate >= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.FromFinishedDate#"/> 
				</cfif>  
				  
				<cfif structKeyExists(arguments.param, "ToFinishedDate") AND #arguments.param.ToFinishedDate# IS NOT ''>
					AND SampleProgress.FinishedDate <= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.ToFinishedDate#"/> 
				</cfif>  

				<cfif structKeyExists(arguments.param, "FromApprovedDate") AND #arguments.param.FromApprovedDate# IS NOT ''>
					AND SampleProgress.ApprovedDate >= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.FromApprovedDate#"/> 
				</cfif>  
				  
				<cfif structKeyExists(arguments.param, "ToApprovedDate") AND #arguments.param.ToApprovedDate# IS NOT ''>
					AND SampleProgress.ApprovedDate <= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.ToApprovedDate#"/> 
				</cfif>  


				ORDER BY Styles.ProductionTeamLeader, IIf(SampleTypes.SampleTypeID=4,Styles.ProductionPatternMaker,Styles.FirstPatternMaker), SampleTypes.SampleType
							  
			</cfquery>
			
			<cfreturn MyQuery>
			
	</cffunction>


	<cffunction name="ProductionProgressReport" returntype="query" output="no" access="public">
		<cfargument name="param" type="struct" required="false">
		<cfset var productionProgressQuery = "">
		
		<cfquery name="productionProgressQuery" datasource="mochi">
			SELECT    ProductionProgressHeader.CompanyNumber, ProductionProgressHeader.CutNumber, ProductionProgressHeader.Style, 
					  ProductionProgressHeader.Color, ProductionProgressHeader.IssueDate, ProductionProgressHeader.DueDate, ProductionProgressHeader.Issued, ProductionProgressHeader.Contractor, Processes.Process, 
					  OperationsProcesses.PersonInCharge, Operations.Operation, ProductionProgressDetail.PlanDate, ProductionProgressDetail.FinishedDate, ProductionProgressDetail.Comments, ProductionDetailStatus.Status
			FROM      ProductionProgressDetail, ProductionProgressHeader, OperationsProcesses, Operations, Processes, ProductionDetailStatus  
			WHERE     OperationsProcesses.OperationID = Operations.OperationID
			  AND     ProductionProgressHeader.ProductionProgressID = ProductionProgressDetail.ProductionProgressID
			  AND     ProductionProgressDetail.OperationProcessID = OperationsProcesses.OperationProcessID
			  AND     Processes.ProcessID = OperationsProcesses.ProcessID
			  AND     ProductionDetailStatus.ProductionDetailStatusID = ProductionProgressDetail.ProductionDetailStatusID 

			<cfif structKeyExists(arguments.param, "OperationID") AND #arguments.param.OperationID# IS NOT 0>
				AND Operations.OperationID = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.param.OperationID#"/> 
			</cfif>  

			<cfif structKeyExists(arguments.param, "ProductionDetailStatusID")AND #arguments.param.ProductionDetailStatusID# IS NOT 0>
				AND ProductionProgressDetail.ProductionDetailStatusID IN (#arguments.param.ProductionDetailStatusID#) 
			</cfif>  

			<cfif structKeyExists(arguments.param, "Type")AND #arguments.param.Type# IS NOT ''>
				AND ProductionDetailStatus.Type IN (#arguments.param.Type#)
			</cfif>  

			<cfif structKeyExists(arguments.param, "FromIssueDate") AND #arguments.param.FromIssueDate# IS NOT ''>
				AND ProductionProgressHeader.IssueDate >= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.FromIssueDate#"/> 
			</cfif>  

			<cfif structKeyExists(arguments.param, "ToIssueDate") AND #arguments.param.ToIssueDate# IS NOT ''>
				AND ProductionProgressHeader.IssueDate <= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.ToIssueDate#"/> 
			</cfif>  
			  
			<cfif structKeyExists(arguments.param, "FromDueDate") AND #arguments.param.FromDueDate# IS NOT ''>
				AND ProductionProgressHeader.DueDate >= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.FromDueDate#"/> 
			</cfif>  

			<cfif structKeyExists(arguments.param, "ToDueDate") AND #arguments.param.ToDueDate# IS NOT ''>
				AND ProductionProgressHeader.DueDate <= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.ToDueDate#"/> 
			</cfif>  
			  
			<cfif structKeyExists(arguments.param, "FromLastMaintainedDate") AND #arguments.param.FromLastMaintainedDate# IS NOT ''>
				AND ProductionProgressHeader.LastMaintainedDate >= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.FromLastMaintainedDate#"/> 
			</cfif>  

			<cfif structKeyExists(arguments.param, "ToLastMaintainedDate") AND #arguments.param.ToLastMaintainedDate# IS NOT ''>
				AND SampleProgress.LastMaintainedDate <= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.ToLastMaintainedDate#"/> 
			</cfif>  
			  
			<cfif structKeyExists(arguments.param, "Contractor")AND #arguments.param.Contractor# IS NOT 'ALL'>
				AND ProductionProgressHeader.Contractor = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.param.Contractor#"/> 
			</cfif>  

				AND ProductionProgressHeader.Status = 1
				
			ORDER BY   OperationsProcesses.Sequence, Operations.Operation, ProductionProgressHeader.DueDate, ProductionProgressDetail.PlanDate ASC
					
		</cfquery>
		
		
		<cfreturn productionProgressQuery>
		
	</cffunction>
	
	
	<cffunction name="StyleDeliveryReport" returntype="query" output="no" access="public">
		<cfargument name="param" type="struct" required="false">
		
		<cfset var StyleDelivery="">

		<cfquery name="qStyleDelivery" datasource="Mochi">

			SELECT DISTINCT Styles.StyleName, SampleRequest.RequestDate, SampleRequest.PatternDueDate, SampleRequest.DueDate, SampleRequest.DeadlineToContractor, SampleRequest.Customer, RequestStatus.Status, SampleTypes.SampleType, Deliveries.Delivery, Styles.ProductionTeamLeader, Styles.ProductionPatternMaker, Styles.FirstPatternMaker, Images.ThumbnailFile, Images.File, Styles.StyleID, SampleTypes.SampleTypeID, Colors.ColorCode
			FROM (((((SampleRequest INNER JOIN SampleTypes ON SampleRequest.SampleTypeID = SampleTypes.SampleTypeID) INNER JOIN Deliveries ON SampleRequest.DeliveryID = Deliveries.DeliveryID) INNER JOIN RequestStatus ON SampleRequest.RequestStatusID = RequestStatus.RequestStatusID) INNER JOIN Styles ON SampleRequest.StyleID = Styles.StyleID) LEFT JOIN Images ON (Styles.EntityTypeID = Images.EntityTypeID) AND (Styles.StyleID = Images.EntityID)) INNER JOIN Colors ON SampleRequest.ColorID = Colors.ColorID
			WHERE (((SampleTypes.SampleTypeID) IN (3,4)))
			
			<cfif structKeyExists(arguments.param, "RequestStatus") AND #arguments.param.RequestStatus# IS NOT 0>
				AND SampleRequest.RequestStatusID IN (#arguments.param.RequestStatus#) 
			</cfif>  
			  
			<cfif structKeyExists(arguments.param, "YearID") AND #arguments.param.YearID# IS NOT ''>
				AND SampleRequest.YearID  = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.param.YearID#"/> 
			</cfif>
			
			<cfif structKeyExists(arguments.param, "Delivery") AND #arguments.param.Delivery# IS NOT ''>
				AND Deliveries.DeliveryID  IN (#arguments.param.Delivery#)  
			</cfif>

			<cfif structKeyExists(arguments.param, "Collection") AND #arguments.param.Collection# IS NOT ''>
				AND SampleRequest.CollectionID  IN (#arguments.param.Collection#)  
			</cfif>
			
			<cfif structKeyExists(arguments.param, "SampleType") AND #arguments.param.Sampletype# IS NOT 0>
				AND SampleTypes.SampleTypeID IN (#arguments.param.Sampletype#)  
			</cfif>  
			
			
			UNION
			
			SELECT DISTINCT Styles.StyleName, SampleRequest.RequestDate, SampleRequest.PatternDueDate, SampleRequest.DueDate, SampleRequest.DeadlineToContractor, SampleRequest.Customer, RequestStatus.Status, SampleTypes.SampleType, Deliveries.Delivery, Styles.ProductionTeamLeader, Styles.ProductionPatternMaker, Styles.FirstPatternMaker, Images.ThumbnailFile, Images.File, Styles.StyleID, SampleTypes.SampleTypeID, Colors.ColorCode
			FROM (((((SampleRequest INNER JOIN SampleTypes ON SampleRequest.SampleTypeID = SampleTypes.SampleTypeID) INNER JOIN Deliveries ON SampleRequest.DeliveryID = Deliveries.DeliveryID) INNER JOIN RequestStatus ON SampleRequest.RequestStatusID = RequestStatus.RequestStatusID) INNER JOIN Styles ON SampleRequest.StyleID = Styles.StyleID) LEFT JOIN Images ON (Styles.StyleID = Images.EntityID) AND (Styles.EntityTypeID = Images.EntityTypeID)) INNER JOIN Colors ON SampleRequest.ColorID = Colors.ColorID
			WHERE (((SampleTypes.SampleTypeID)= 2) 
			
			<cfif structKeyExists(arguments.param, "RequestStatus") AND #arguments.param.RequestStatus# IS NOT 0>
				AND SampleRequest.RequestStatusID IN (#arguments.param.RequestStatus#) 
			</cfif>  
			  
			<cfif structKeyExists(arguments.param, "YearID") AND #arguments.param.YearID# IS NOT ''>
				AND SampleRequest.YearID  = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.param.YearID#"/> 
			</cfif>
			
			<cfif structKeyExists(arguments.param, "Delivery") AND #arguments.param.Delivery# IS NOT ''>
				AND Deliveries.DeliveryID  IN (#arguments.param.Delivery#)  
			</cfif>
								
			<cfif structKeyExists(arguments.param, "Collection") AND #arguments.param.Collection# IS NOT ''>
				AND SampleRequest.CollectionID  IN (#arguments.param.Collection#)  
			</cfif>

			<cfif structKeyExists(arguments.param, "SampleType") AND #arguments.param.Sampletype# IS NOT 0>
				AND SampleTypes.SampleTypeID IN (#arguments.param.Sampletype#)  
			</cfif>
			  
			AND ((Styles.StyleID) Not In (SELECT Styles.StyleID 
			FROM (((SampleRequest INNER JOIN SampleTypes ON SampleRequest.SampleTypeID = SampleTypes.SampleTypeID) INNER JOIN Deliveries ON SampleRequest.DeliveryID = Deliveries.DeliveryID) INNER JOIN RequestStatus ON SampleRequest.RequestStatusID = RequestStatus.RequestStatusID) INNER JOIN Styles ON SampleRequest.StyleID = Styles.StyleID
			WHERE (((SampleTypes.SampleTypeID)=4) AND ((RequestStatus.RequestStatusID) In (3,5,7,8,10,11))))))

			ORDER BY Delivery
			
		</cfquery>
		
		<cfreturn qStyleDelivery>
		
	</cffunction>



	<!--- this report was request by ewing 8/4 --->
	<cffunction name="FirstSamplesCustomReportQuery" returntype="query" output="no" access="public">
		<cfargument name="param" type="struct" required="false">
		<cfset var MyQuery="">

		<cfquery name="MyQuery" datasource="#Application.datasource#">			
			SELECT DISTINCT Styles.StyleID, Styles.StyleName, Styles.ProductionTeamLeader, Styles.ProductionPatternMaker, Styles.FirstPatternMaker, Styles.PatternReference, SampleProgress.RequestReceivedDate, SampleProgress.Comments AS ProgressComments, SampleShipments.AttentionTo, SampleShipments.Sender, SampleShipments.ShippedDate, SampleShipments.TrackingNumber, SampleRequest.ReferenceNumber, SampleRequest.RequestedBy, SampleRequest.RequestedFor, SampleRequest.RequestDate, SampleRequest.DeadlineToContractor, SampleRequest.Quantity, SampleRequest.Customer, SampleRequest.DueDate, SampleRequest.PatternDueDate, SampleRequest.SampleTypeID, SampleRequest.Comments, SampleRequest.HasOrder, SampleRequest.MakeIn, SampleRequest.RequestSubmitted, SampleTypes.SampleType, Colors.ColorName, Sizes.Size, Images.File, Images.ThumbnailFile, RequestStatus.Status, SampleShipments.ShipTo, Deliveries.DeliveryID, Deliveries.Delivery, Images_1.File AS FileShipment, Images_1.ThumbnailFile AS ThumbnailFileShipment, SampleRequest.CancellationDate, SampleRequest.CancelledBy, PatternStatus.Status AS PatternStatus, SampleProgress.AssignedDate, SampleProgress.FinishedDate, SampleProgress.StartDate, Years.Year
			FROM ((((((((((((SampleRequest INNER JOIN Styles ON SampleRequest.StyleID = Styles.StyleID) INNER JOIN SampleTypes ON SampleRequest.SampleTypeID = SampleTypes.SampleTypeID) INNER JOIN Colors ON SampleRequest.ColorID = Colors.ColorID) INNER JOIN Sizes ON SampleRequest.SizeID = Sizes.SizeID) INNER JOIN RequestStatus ON SampleRequest.RequestStatusID = RequestStatus.RequestStatusID) LEFT JOIN SampleProgress ON SampleRequest.SampleRequestID = SampleProgress.SampleRequestID) LEFT JOIN SampleShipments ON SampleRequest.SampleRequestID = SampleShipments.SampleRequestID) LEFT JOIN Images ON (Styles.StyleID = Images.EntityID) AND (Styles.EntityTypeID = Images.EntityTypeID)) INNER JOIN Deliveries ON SampleRequest.DeliveryID = Deliveries.DeliveryID) LEFT JOIN Images AS Images_1 ON (SampleShipments.SampleRequestID = Images_1.EntityID) AND (SampleShipments.EntityID = Images_1.EntityTypeID)) INNER JOIN Collections ON SampleRequest.CollectionID = Collections.CollectionID) LEFT JOIN PatternStatus ON SampleProgress.PatternStatusID = PatternStatus.PatternStatusID) LEFT JOIN Years ON SampleRequest.YearID = Years.YearID
			WHERE SampleTypes.SampleTypeID = 2 AND SampleRequest.RequestStatusID = 3 AND PatternStatus.PatternStatusID IN (3,5)
			  
			<cfif structKeyExists(arguments.param, "makeIn") AND #arguments.param.makeIn# IS NOT ''>
				AND SampleRequest.MakeIn LIKE '%' & <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.param.makeIn#"/> & '%'
			</cfif>
			
			  
			 ORDER BY  Styles.ProductionTeamLeader, Styles.FirstPatternMaker, Deliveries.DeliveryID ASC
			  					 
		</cfquery>
		
		<cfreturn MyQuery>
	</cffunction>

	
	<!--- this report was request by ewing 8/4 --->
	<cffunction name="FirstSamplesPlanShipDateReportQuery" returntype="query" output="no" access="public">
		<cfargument name="param" type="struct" required="false">
		<cfset var MyQuery="">

		<cfquery name="MyQuery" datasource="#Application.datasource#">			
			SELECT DISTINCT Styles.StyleID, Styles.StyleName, Styles.ProductionTeamLeader, Styles.ProductionPatternMaker, Styles.FirstPatternMaker, SampleProgress.RequestReceivedDate, SampleProgress.Comments AS ProgressComments, SampleShipments.AttentionTo, SampleShipments.Sender, SampleShipments.ShippedDate, SampleShipments.TrackingNumber, SampleRequest.ReferenceNumber, SampleRequest.RequestedBy, SampleRequest.RequestedFor, SampleRequest.RequestDate, SampleRequest.DeadlineToContractor, SampleRequest.Quantity, SampleRequest.Customer, SampleRequest.DueDate, SampleRequest.PatternDueDate, SampleRequest.SampleTypeID,SampleRequest.Comments, SampleRequest.HasOrder, SampleRequest.MakeIn, SampleRequest.RequestSubmitted, SampleTypes.SampleType, Colors.ColorName, Sizes.Size, Images.File, Images.ThumbnailFile, RequestStatus.Status, SampleShipments.ShipTo, Deliveries.Delivery, Images_1.File AS FileShipment, Images_1.ThumbnailFile AS ThumbnailFileShipment, SampleRequest.CancellationDate, SampleRequest.CancelledBy, PatternStatus.Status AS PatternStatus, SampleProgress.AssignedDate, SampleProgress.FinishedDate, SampleProgress.StartDate, SampleProgress.PlanDate 
			FROM (((((((((((SampleRequest INNER JOIN Styles ON SampleRequest.StyleID = Styles.StyleID) INNER JOIN SampleTypes ON SampleRequest.SampleTypeID = SampleTypes.SampleTypeID) INNER JOIN Colors ON SampleRequest.ColorID = Colors.ColorID) INNER JOIN Sizes ON SampleRequest.SizeID = Sizes.SizeID) INNER JOIN RequestStatus ON SampleRequest.RequestStatusID = RequestStatus.RequestStatusID) LEFT JOIN SampleProgress ON SampleRequest.SampleRequestID = SampleProgress.SampleRequestID) LEFT JOIN SampleShipments ON SampleRequest.SampleRequestID = SampleShipments.SampleRequestID) LEFT JOIN Images ON (Styles.EntityTypeID = Images.EntityTypeID) AND (Styles.StyleID = Images.EntityID)) INNER JOIN Deliveries ON SampleRequest.DeliveryID = Deliveries.DeliveryID) LEFT JOIN Images AS Images_1 ON (SampleShipments.EntityID = Images_1.EntityTypeID) AND (SampleShipments.SampleRequestID = Images_1.EntityID)) INNER JOIN Collections ON SampleRequest.CollectionID = Collections.CollectionID) LEFT JOIN PatternStatus ON SampleProgress.PatternStatusID = PatternStatus.PatternStatusID
			WHERE SampleRequest.RequestStatusID = 3 AND PatternStatus.PatternStatusID IN (3,5)
			AND SampleRequest.MakeIn LIKE '%CHINA%'
			  
			<cfif structKeyExists(arguments.param, "SampleType") AND #arguments.param.Sampletype# IS NOT 0>
				AND SampleTypes.SampleTypeID IN (#arguments.param.Sampletype#)  
			</cfif>
			  
			<cfif structKeyExists(arguments.param, "FromPlanShipDate") AND #arguments.param.FromPlanShipDate# IS NOT ''>
				AND SampleProgress.PlanDate >= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.FromPlanShipDate#"/> 
			</cfif>
			  
			<cfif structKeyExists(arguments.param, "SampleType") AND #arguments.param.Sampletype# IS NOT 0>
				AND SampleTypes.SampleTypeID IN (#arguments.param.Sampletype#)  
			</cfif>  
			
			<cfif structKeyExists(arguments.param, "ToPlanShipDate") AND #arguments.param.ToPlanShipDate# IS NOT ''>
				AND SampleProgress.PlanDate <= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.ToPlanShipDate#"/> 
			</cfif>			  		
			
			ORDER BY  Styles.ProductionTeamLeader, Styles.ProductionPatternMaker, Deliveries.Delivery  					 
		</cfquery>
		
		<cfreturn MyQuery>
	</cffunction>

	<!--- this report was request by selena 8/4 --->
	<cffunction name="OpenProductionSamplesReportQuery" returntype="query" output="no" access="public">
		<cfargument name="param" type="struct" required="false">
		<cfset var MyQuery="">

		<cfquery name="MyQuery" datasource="#Application.datasource#">			
            SELECT DISTINCT Styles.StyleID, Styles.StyleName, Styles.ProductionTeamLeader, Styles.ProductionPatternMaker, Styles.FirstPatternMaker, SampleProgress.RequestReceivedDate, SampleProgress.Comments AS ProgressComments, SampleShipments.AttentionTo, SampleShipments.Sender, SampleShipments.ShippedDate, SampleShipments.TrackingNumber, SampleRequest.ReferenceNumber, SampleRequest.RequestedBy, SampleRequest.RequestedFor, SampleRequest.RequestDate, SampleRequest.DeadlineToContractor, SampleRequest.Quantity, SampleRequest.Customer, SampleRequest.DueDate, SampleRequest.PatternDueDate, SampleRequest.SampleTypeID,SampleRequest.Comments, SampleRequest.HasOrder, SampleRequest.MakeIn, SampleRequest.RequestSubmitted, SampleTypes.SampleType, Colors.ColorName, Sizes.Size, Images.File, Images.ThumbnailFile, RequestStatus.Status, SampleShipments.ShipTo, Deliveries.Delivery, Images_1.File AS FileShipment, Images_1.ThumbnailFile AS ThumbnailFileShipment, SampleRequest.CancellationDate, SampleRequest.CancelledBy, PatternStatus.Status AS PatternStatus, SampleProgress.AssignedDate, SampleProgress.FinishedDate, SampleProgress.StartDate, SampleProgress.PlanDate, SampleRequest.Beading, SampleRequest.BeadingStartDate, SampleRequest.BeadingDueDate, SampleRequest.FabricTrim, SampleRequest.FabricTrimStartDate, SampleRequest.FabricTrimDueDate, SampleRequest.CounterSample, SampleRequest.CounterSampleStartDate, SampleRequest.CounterSampleDueDate, SampleProgress.CounterSampleStatusID, PatternStatus.PatternStatusID
               FROM (((((((((((SampleRequest INNER JOIN Styles ON SampleRequest.StyleID = Styles.StyleID) INNER JOIN SampleTypes ON SampleRequest.SampleTypeID = SampleTypes.SampleTypeID) INNER JOIN Colors ON SampleRequest.ColorID = Colors.ColorID) INNER JOIN Sizes ON SampleRequest.SizeID = Sizes.SizeID) INNER JOIN RequestStatus ON SampleRequest.RequestStatusID = RequestStatus.RequestStatusID) LEFT JOIN SampleProgress ON SampleRequest.SampleRequestID = SampleProgress.SampleRequestID) LEFT JOIN SampleShipments ON SampleRequest.SampleRequestID = SampleShipments.SampleRequestID) LEFT JOIN Images ON (Styles.EntityTypeID = Images.EntityTypeID) AND (Styles.StyleID = Images.EntityID)) INNER JOIN Deliveries ON SampleRequest.DeliveryID = Deliveries.DeliveryID) LEFT JOIN Images AS Images_1 ON (SampleShipments.EntityID = Images_1.EntityTypeID) AND (SampleShipments.SampleRequestID = Images_1.EntityID)) INNER JOIN Collections ON SampleRequest.CollectionID = Collections.CollectionID) LEFT JOIN PatternStatus ON SampleProgress.PatternStatusID = PatternStatus.PatternStatusID
               WHERE SampleTypes.SampleTypeID = 4 AND SampleRequest.RequestStatusID IN (3,5,8) AND (SampleProgress.CounterSampleStatusID NOT IN (3) OR SampleProgress.CounterSampleStatusID IS NULL)
               ORDER BY  Styles.ProductionTeamLeader, Styles.ProductionPatternMaker, Deliveries.Delivery
      		</cfquery>
		
		<cfreturn MyQuery>
	</cffunction>

	<!--- this report was request by selena 8/4 --->
	<cffunction name="OpenJapanSamplesReportQuery" returntype="query" output="no" access="public">
		<cfargument name="param" type="struct" required="false">
		<cfset var MyQuery="">

		<cfquery name="MyQuery" datasource="#Application.datasource#">			
			SELECT DISTINCT Styles.StyleID, Styles.StyleName, Styles.ProductionTeamLeader, Styles.ProductionPatternMaker, Styles.FirstPatternMaker, SampleProgress.RequestReceivedDate, SampleProgress.Comments AS ProgressComments, SampleShipments.AttentionTo, SampleShipments.Sender, SampleShipments.ShippedDate, SampleShipments.TrackingNumber, SampleRequest.ReferenceNumber, SampleRequest.RequestedBy, SampleRequest.RequestedFor, SampleRequest.RequestDate, SampleRequest.DeadlineToContractor, SampleRequest.Quantity, SampleRequest.Customer, SampleRequest.DueDate, SampleRequest.PatternDueDate, SampleRequest.SampleTypeID,SampleRequest.Comments, SampleRequest.HasOrder, SampleRequest.MakeIn, SampleRequest.RequestSubmitted, SampleTypes.SampleType, Colors.ColorName, Sizes.Size, Images.File, Images.ThumbnailFile, RequestStatus.Status, SampleShipments.ShipTo, Deliveries.Delivery, Images_1.File AS FileShipment, Images_1.ThumbnailFile AS ThumbnailFileShipment, SampleRequest.CancellationDate, SampleRequest.CancelledBy, PatternStatus.Status AS PatternStatus, SampleProgress.AssignedDate, SampleProgress.FinishedDate, SampleProgress.StartDate, SampleProgress.PlanDate 
			FROM (((((((((((SampleRequest INNER JOIN Styles ON SampleRequest.StyleID = Styles.StyleID) INNER JOIN SampleTypes ON SampleRequest.SampleTypeID = SampleTypes.SampleTypeID) INNER JOIN Colors ON SampleRequest.ColorID = Colors.ColorID) INNER JOIN Sizes ON SampleRequest.SizeID = Sizes.SizeID) INNER JOIN RequestStatus ON SampleRequest.RequestStatusID = RequestStatus.RequestStatusID) LEFT JOIN SampleProgress ON SampleRequest.SampleRequestID = SampleProgress.SampleRequestID) LEFT JOIN SampleShipments ON SampleRequest.SampleRequestID = SampleShipments.SampleRequestID) LEFT JOIN Images ON (Styles.EntityTypeID = Images.EntityTypeID) AND (Styles.StyleID = Images.EntityID)) INNER JOIN Deliveries ON SampleRequest.DeliveryID = Deliveries.DeliveryID) LEFT JOIN Images AS Images_1 ON (SampleShipments.EntityID = Images_1.EntityTypeID) AND (SampleShipments.SampleRequestID = Images_1.EntityID)) INNER JOIN Collections ON SampleRequest.CollectionID = Collections.CollectionID) LEFT JOIN PatternStatus ON SampleProgress.PatternStatusID = PatternStatus.PatternStatusID
			WHERE SampleTypes.SampleTypeID = 7 AND SampleRequest.RequestStatusID IN (3,5,8) AND PatternStatus.PatternStatusID IN (3,5)
			ORDER BY  Styles.ProductionTeamLeader, Styles.ProductionPatternMaker, Deliveries.Delivery				 
		</cfquery>
		
		<cfreturn MyQuery>
	</cffunction>

	<cffunction name="OpenDuplicationSamplesReportQuery" returntype="query" output="no" access="public">
		<cfset var MyQuery="">

		<cfquery name="MyQuery" datasource="#Application.datasource#">			
			SELECT DISTINCT Styles.StyleID, Styles.StyleName, Styles.ProductionTeamLeader, Styles.ProductionPatternMaker, Styles.FirstPatternMaker, SampleProgress.RequestReceivedDate, SampleProgress.Comments AS ProgressComments, SampleShipments.AttentionTo, SampleShipments.Sender, SampleShipments.ShippedDate, SampleShipments.TrackingNumber, SampleRequest.ReferenceNumber, SampleRequest.RequestedBy, SampleRequest.RequestedFor, SampleRequest.RequestDate, SampleRequest.DeadlineToContractor, SampleRequest.Quantity, SampleRequest.Customer, SampleRequest.DueDate, SampleRequest.PatternDueDate, SampleRequest.SampleTypeID,SampleRequest.Comments, SampleRequest.HasOrder, SampleRequest.MakeIn, SampleRequest.RequestSubmitted, SampleTypes.SampleType, Colors.ColorName, Sizes.Size, Images.File, Images.ThumbnailFile, RequestStatus.Status, SampleShipments.ShipTo, Deliveries.Delivery, Images_1.File AS FileShipment, Images_1.ThumbnailFile AS ThumbnailFileShipment, SampleRequest.CancellationDate, SampleRequest.CancelledBy, PatternStatus.Status AS PatternStatus, SampleProgress.AssignedDate, SampleProgress.FinishedDate, SampleProgress.StartDate, SampleProgress.PlanDate 
			FROM (((((((((((SampleRequest INNER JOIN Styles ON SampleRequest.StyleID = Styles.StyleID) INNER JOIN SampleTypes ON SampleRequest.SampleTypeID = SampleTypes.SampleTypeID) INNER JOIN Colors ON SampleRequest.ColorID = Colors.ColorID) INNER JOIN Sizes ON SampleRequest.SizeID = Sizes.SizeID) INNER JOIN RequestStatus ON SampleRequest.RequestStatusID = RequestStatus.RequestStatusID) LEFT JOIN SampleProgress ON SampleRequest.SampleRequestID = SampleProgress.SampleRequestID) LEFT JOIN SampleShipments ON SampleRequest.SampleRequestID = SampleShipments.SampleRequestID) LEFT JOIN Images ON (Styles.EntityTypeID = Images.EntityTypeID) AND (Styles.StyleID = Images.EntityID)) INNER JOIN Deliveries ON SampleRequest.DeliveryID = Deliveries.DeliveryID) LEFT JOIN Images AS Images_1 ON (SampleShipments.EntityID = Images_1.EntityTypeID) AND (SampleShipments.SampleRequestID = Images_1.EntityID)) INNER JOIN Collections ON SampleRequest.CollectionID = Collections.CollectionID) LEFT JOIN PatternStatus ON SampleProgress.PatternStatusID = PatternStatus.PatternStatusID
			WHERE SampleTypes.SampleTypeID = 3 AND SampleRequest.RequestStatusID = 3 
			ORDER BY  Styles.ProductionTeamLeader, Styles.ProductionPatternMaker, Deliveries.Delivery				 
		</cfquery>
		
		<cfreturn MyQuery>
	</cffunction>




	<!--- this report is for the copyright application --->
	<cffunction name="getStylesInProductionByDate">
		<cfargument name="param" type="struct" required="false">	

		<cfset var MyQuery="">

		<cfquery name="MyQuery" datasource="#Application.datasource#">	
			SELECT DISTINCT Styles.StyleID
			FROM (SampleTypes INNER JOIN SampleRequest ON SampleTypes.SampleTypeID = SampleRequest.SampleTypeID) 
			INNER JOIN Styles ON SampleRequest.StyleID = Styles.StyleID
			WHERE (SampleRequest.SampleTypeID=4) 
		
			<cfif structKeyExists(arguments.param, "FromSamplesCreateDate") AND #arguments.param.FromSamplesCreateDate# IS NOT ''>
				AND SampleRequest.CreatedDate >= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.FromSamplesCreateDate#"/> 
			</cfif>  

			<cfif structKeyExists(arguments.param, "ToSamplesCreateDate") AND #arguments.param.ToSamplesCreateDate# IS NOT ''>
				AND SampleRequest.CreatedDate <= <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.param.ToSamplesCreateDate#"/> 
			</cfif>  
		
		</cfquery>
		
		<cfreturn MyQuery>
			
	</cffunction>

	<cffunction name="StylesForCopyrightQuery">
		<cfargument name="styles" type="query" required="true">	
		
		<cfquery name="MyQuery" datasource="#Application.datasource#">	
			SELECT Styles.StyleName, Styles.Description, Styles.CreatedDate AS StyleCreatedDate, 
			SampleTypes.SampleType, SampleRequest.CreatedDate AS SampleRequestCreatedDate,  Images.ThumbnailFile, 
			Images.File, Images_1.File AS StyleFile, Images_1.ThumbnailFile AS StyleThumbnailFile 
			FROM (((Styles INNER JOIN SampleRequest ON Styles.StyleID = SampleRequest.StyleID) 
			INNER JOIN SampleTypes ON SampleRequest.SampleTypeID = SampleTypes.SampleTypeID)
			LEFT JOIN Images ON SampleRequest.SampleRequestID = Images.EntityID) 
			LEFT JOIN Images AS Images_1 ON (Styles.StyleID = Images_1.EntityID) AND (Styles.EntityTypeID = Images_1.EntityTypeID)			
			WHERE (SampleRequest.StyleID IN (#ValueList(arguments.styles.StyleID, ',')#))
			ORDER BY  StyleName, SampleType			
		</cfquery>
		
		<cfreturn MyQuery>
		
	</cffunction>		


	<cffunction name="copyrightApplicationReportQuery" returntype="query" output="no" access="public">
		<cfargument name="param" type="struct" required="false">

		<cfquery name="qCopyright" datasource="#Application.datasource#">
			SELECT Copyrights.CopyrightID, Copyrights.TitleOfWork, Copyrights.Description, Copyrights.YearOfCreation, 
			Copyrights.PublicationDate, Copyrights.PriorRegistration, Copyrights.ApplicationDate, Copyrights.ApprovedDate, 
			Styles.StyleName, Styles.Description AS StyleDescription, Images.File, Images.ThumbnailFile, CopyrightAuthors.Author, 
			CopyrightAuthors.Citizenship, CopyrightAuthors.DateOfBirth, Styles.StyleID, Images_1.File AS StyleFile 
			FROM ((((Styles INNER JOIN CopyrightsStyles ON Styles.StyleID = CopyrightsStyles.StyleID) 
			INNER JOIN Copyrights ON CopyrightsStyles.CopyrightID = Copyrights.CopyrightID) 
			LEFT JOIN Images ON Styles.StyleID = Images.EntityID) 
			INNER JOIN CopyrightAuthors ON Copyrights.CopyrightAuthorID = CopyrightAuthors.CopyrightAuthorID) 
			LEFT JOIN Images AS Images_1 ON (Styles.EntityTypeID = Images_1.EntityTypeID) AND (Styles.StyleID = Images_1.EntityID)
			WHERE 0 = 0
			
			<cfif structKeyExists(arguments.param, "CopyrightID") AND #arguments.param.CopyrightID# IS NOT ''>
				AND Copyrights.CopyrightID  = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.param.CopyrightID#"/> 
			</cfif>
						  				
		</cfquery>
	
		<cfreturn qCopyright>
		
	</cffunction>
    
    
	<cffunction name="getSimilarPatternsQuery" returntype="query" output="no" access="public">
    	<cfargument name="param" >
        
        <!--- delete all from the StyleAttributeSearchIndex table --->
        <cfquery datasource="#APPLICATION.DATASOURCE#">
        	DELETE FROM
            StyleAttributeSearchIndex
        </cfquery>
        
        <!--- query the number of hits per style  --->
        <cfquery name="qStyleIDs" datasource="#Application.datasource#">
            SELECT StyleAttributeValues.StyleID, COUNT(StyleAttributeValues.StyleAttributeOptionID) AS hits
            FROM StyleAttributeValues
            WHERE 0 = 0 
			<cfif structKeyExists(arguments.param, "StyleAttributeOptionID") AND arguments.param.StyleAttributeOptionID NEQ ''>
                AND StyleAttributeValues.StyleAttributeOptionID IN (#arguments.param.StyleAttributeOptionID#) 
            </cfif>            
            GROUP BY StyleAttributeValues.StyleID
        </cfquery>
        
        <cfloop query="qStyleIDs">
        
	    	  <!--- create the StyleAttributeSearchIndex based on the number of hits --->
	          
			<cfset styleAttributeSearchStruct={StyleAttributeSearchIndexID=0,StyleID=#qStyleIDs.StyleID#, Hits=#qStyleIDs.hits#}>
              
            <cfinvoke  component="mochi.cfc.styleAttributeSearchIndex.StyleAttributeSearchIndex" method="init" returnvariable="StyleAttributeSearchIndex">
                <cfinvokeargument name="stValues" value="#styleAttributeSearchStruct#"/>
            </cfinvoke>
                                
            <cfinvoke component="mochi.cfc.styleAttributeSearchIndex.StyleAttributeSearchIndexGateway" method="save" returnvariable="savedStyleAttributeSearchIndex"> 
                <cfinvokeargument name="obj" value="#StyleAttributeSearchIndex#"/>
            </cfinvoke>
	
        
        </cfloop>
        
        
        <cfquery name="qSimilarPatterns" datasource="#Application.datasource#">
            SELECT DISTINCT Styles.StyleName,
                   Styles.StyleID,
                   StyleAttributes.AttributeName,
                   StyleAttributeOptions.AttributeValue,
                   Images.Location,
                   Images.File,
                   StyleAttributeValues.StyleAttributeOptionID,
                   StyleStatistics.SalesUnits,
                   StyleAttributeSearchIndex.Hits,
					<cfif structKeyExists(arguments.param, "StyleAttributeOptionID") AND arguments.param.StyleAttributeOptionID NEQ ''>
	                   IIF(StyleAttributeValues.StyleAttributeOptionID IN (#arguments.param.StyleAttributeOptionID#), StyleAttributeOptions.AttributeValue + '***', StyleAttributeOptions.AttributeValue) as AttributeValues                       
                   <cfelse>
						StyleAttributeOptions.AttributeValue as AttributeValues 		    
				   </cfif>
            FROM Images
            INNER JOIN (((((StyleAttributes
                          INNER JOIN StyleAttributeOptions ON StyleAttributes.StyleAttributeID = StyleAttributeOptions.StyleAttributeID)
                
                         INNER JOIN StyleAttributeValues ON StyleAttributeOptions.StyleAttributeOptionID = StyleAttributeValues.StyleAttributeOptionID)
                        INNER JOIN Styles ON StyleAttributeValues.StyleID = Styles.StyleID) 
                        INNER JOIN StyleAttributeSearchIndex ON StyleAttributeSearchIndex.StyleID = Styles.StyleID)
                        LEFT JOIN StyleStatistics ON StyleStatistics.StyleID = Styles.StyleID)
                        
                        ON (Images.EntityID = Styles.StyleID)
              
            AND (Images.EntityTypeID = Styles.EntityTypeID) 
	        WHERE 0 = 0         
            <cfif qStyleIDs.RECORDCOUNT NEQ 0>
            	AND Styles.StyleID IN (#ValueList(qStyleIDs.StyleID, ",")#) 
            </cfif>                        
			ORDER BY StyleAttributeSearchIndex.Hits DESC 
        </cfquery>

        <cfreturn qSimilarPatterns>
        
    </cffunction>
    
    
</cfcomponent>