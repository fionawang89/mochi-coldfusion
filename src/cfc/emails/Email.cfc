<cfcomponent output="false">
	
	
	<!--- Production Related Emails --->

	<cffunction name="emailLateNotCompletedOperations" returntype="void" output="no" access="public">
		
		<cfquery name="qLateOperations" datasource="#APPLICATION.DATASOURCE#">
			SELECT ProductionProgressHeader.CompanyNumber, ProductionProgressHeader.CutNumber, ProductionProgressHeader.Style, ProductionProgressHeader.Color, ProductionProgressHeader.IssueDate, ProductionProgressHeader.DueDate, ProductionProgressHeader.Issued, ProductionProgressDetail.Comments, ProductionProgressDetail.PlanDate, Operations.Operation, OperationsProcesses.PersonInCharge, ProductionDetailStatus.Status, ProductionDetailStatus.Type
			FROM (((ProductionProgressHeader INNER JOIN ProductionProgressDetail ON ProductionProgressHeader.ProductionProgressID = ProductionProgressDetail.ProductionProgressID) INNER JOIN OperationsProcesses ON ProductionProgressDetail.OperationProcessID = OperationsProcesses.OperationProcessID) INNER JOIN Operations ON OperationsProcesses.OperationID = Operations.OperationID) INNER JOIN ProductionDetailStatus ON ProductionProgressDetail.ProductionDetailStatusID = ProductionDetailStatus.ProductionDetailStatusID
			WHERE (((ProductionProgressDetail.FinishedDate) Is Null) AND ((ProductionProgressHeader.Status)<>2))
			AND ((ProductionProgressDetail.PlanDate) < <cfqueryparam cfsqltype="cf_sql_date" value="#DateFormat(Now(),'mm/dd/yyyy')#">)
			ORDER BY Operations.Operation, ProductionProgressHeader.DueDate  ASC
		</cfquery>
		
			
		<cfmail query="qLateOperations"
			    from="production@tadashishoji.com.cn"
			    failto="ruben@tadashishoji.com"
  				to="ruben@tadashishoji.com"
			    cc="ruben@tadashishoji.com"
  			    type="html"	
			    subject="#qLateOperations.Operation# Past Plan Date "
			    group="Operation">
		
			To #qLateOperations.PersonInCharge#:<br><br>
			<p>
			    &nbsp;Please check the following incomplete operations and enter  your comments in case you cannot finish the operation on time or if there is any problem with it since it's already past plan date. 
			</p>
				<table border="1">
					<tr>
						<th colspan="8">#qLateOperations.Operation#</th>
					</tr>
					<tr>
						<th>Cut</th>
						<th>Style</th>
						<th>Color</th>
						<th>Issue Date</th>
						<th>Due Date</th>
						<th>Issued</th>
						<th>Plan Date</th>
						<th>Status</th>
						<th>Comments</th>
					</tr>
				<cfoutput>
					<cfif qLateOperations.Type IS 'I'>
						<cfset bgcolor='red'>
					<cfelse>
						<cfset bgcolor='white'>	
					</cfif>
					<tr Bgcolor="#bgcolor#">
						<td>#qLateOperations.CutNumber#</td>
						<td>#qLateOperations.Style#</td>
						<td>#qLateOperations.Color#</td>
						<td>#DateFormat(qLateOperations.IssueDate, 'mm/dd/yyyy')#</td>
						<td>#DateFormat(qLateOperations.DueDate, 'mm/dd/yyyy')#</td>
						<td>#qLateOperations.Issued#</td>
						<td>#DateFormat(qLateOperations.PlanDate, 'mm/dd/yyyy')#</td>
						<td>#qLateOperations.Status#</td>
						<td>#qLateOperations.Comments#</td>
					</tr>
				</cfoutput>
				</table>
			
		
		</cfmail>	    
	</cffunction>

	<cffunction name="emailProductionOperationIssue" returntype="void" output="no" access="public">
		<cfargument name="ProductionProgressDetailID" type="Numeric" required="true">
		
		<cfquery name="qProductionOperationIssue" datasource="#APPLICATION.DATASOURCE#">
			SELECT ProductionProgressHeader.CutNumber, ProductionProgressHeader.Style, ProductionProgressHeader.Color,  ProductionProgressDetail.PlanDate, ProductionProgressDetail.Comments, ProductionDetailStatus.Status, ProductionDetailStatus.StatusCode, Operations.Operation, OperationsProcesses.PersonInCharge
			FROM (((ProductionProgressDetail INNER JOIN ProductionProgressHeader ON ProductionProgressDetail.ProductionProgressID = ProductionProgressHeader.ProductionProgressID) INNER JOIN ProductionDetailStatus ON ProductionProgressDetail.ProductionDetailStatusID = ProductionDetailStatus.ProductionDetailStatusID) INNER JOIN Operations ON ProductionDetailStatus.OperationID = Operations.OperationID) INNER JOIN OperationsProcesses ON (Operations.OperationID = OperationsProcesses.OperationID) AND (ProductionProgressDetail.OperationProcessID = OperationsProcesses.OperationProcessID)
			WHERE ProductionProgressDetail.ProductionProgressDetailID = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.ProductionProgressDetailID#">	
		</cfquery>
		
		<cfmail query="qProductionOperationIssue"
			    from="production@tadashishoji.com.cn"
			    failto="ruben@tadashishoji.com"
 				to="selina@tadashishoji.com.cn,judy@tadashishoji.com.cn,victor@tadashishoji.com.cn,conna@tadashishoji.com.cn,julie@tadashishoji.com.cn,baobo@tadashishoji.com.cn,maggie@tadashishoji.com.cn,ivy@tadashishoji.com.cn,ivanka@tadashishoji.com.cn,angelina@tadashishoji.com.cn,daisy@tadashishoji.com.cn,karlo@tadashishoji.com.cn,ethan@tadashishoji.com.cn"
			    cc="pablo@tadashishoji.com,ruben@tadashishoji.com,jane@tadashishoji.com"			    
			    type="html"
			    subject="#qProductionOperationIssue.PersonInCharge# : #qProductionOperationIssue.StatusCode# ISSUE FOR CUT : #qProductionOperationIssue.CutNumber#">
			
			<table border="1">
				<tr>
					<th>Cut</th>
					<th>Style</th>
					<th>Color</th>
					<th>Operation</th>
					<th>Plan Date</th>
				</tr>
				<cfoutput>
					<tr>
							<th>#qProductionOperationIssue.CutNumber#</th>
							<th>#qProductionOperationIssue.Style#</th>
							<th>#qProductionOperationIssue.Color#</th>
							<th>#qProductionOperationIssue.Operation#</th>
							<th>#DateFormat(qProductionOperationIssue.PlanDate, 'mm/dd/yyyy')#</th>
					</tr>
					<tr>
						<th colspan="5">Comments</th>
					</tr>
					<tr>
						<td colspan="5">#qProductionOperationIssue.Comments#</td>		
					</tr>
				</cfoutput>
			</table>
			
		</cfmail>
		
	</cffunction>
	

	<cffunction name="emailProductionOperationUpdate" returntype="void" output="no" access="public">
		<cfargument name="ProductionProgressDetailID" type="Numeric" required="true">
		
		<cfquery name="qProductionOperation" datasource="#APPLICATION.DATASOURCE#">
			SELECT ProductionProgressHeader.CutNumber, ProductionProgressHeader.Style, ProductionProgressHeader.Color, ProductionProgressDetail.PlanDate, ProductionProgressDetail.Comments, Operations.Operation, OperationsProcesses.PersonInCharge
			FROM (ProductionProgressDetail INNER JOIN ProductionProgressHeader ON ProductionProgressDetail.ProductionProgressID = ProductionProgressHeader.ProductionProgressID) INNER JOIN (Operations INNER JOIN OperationsProcesses ON Operations.OperationID = OperationsProcesses.OperationID) ON ProductionProgressDetail.OperationProcessID = OperationsProcesses.OperationProcessID
			WHERE ProductionProgressDetail.ProductionProgressDetailID = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.ProductionProgressDetailID#">	
		</cfquery>
		
		<cfmail query="qProductionOperation"
			    from="production@tadashishoji.com.cn"
			    failto="lu@tadashishoji.com.cn"
 				to="pablo@tadashishoji.com"
			    type="html"
			    subject="#qProductionOperation.PersonInCharge# : UPDATE FOR CUT : #qProductionOperation.CutNumber#">
			
			<table border="1">
				<tr>
					<th>Cut</th>
					<th>Style</th>
					<th>Color</th>
					<th>Operation</th>
					<th>Plan Date</th>
				</tr>
				<cfoutput>
					<tr>
							<th>#qProductionOperation.CutNumber#</th>
							<th>#qProductionOperation.Style#</th>
							<th>#qProductionOperation.Color#</th>
							<th>#qProductionOperation.Operation#</th>
							<th>#DateFormat(qProductionOperation.PlanDate, 'mm/dd/yyyy')#</th>
					</tr>
					<tr>
						<th colspan="5">Comments</th>
					</tr>
					<tr>
						<td colspan="5">#qProductionOperation.Comments#</td>		
					</tr>
				</cfoutput>
			</table>
			
		</cfmail>
		
	</cffunction>


	<!--- Sample Related Emails --->

	<cffunction name="emailNewSampleRequest" returntype="void" output="no" access="public">
		<cfargument name="SampleRequest" type="mochi.cfc.sampleRequests.SampleRequest" required="true">
		
        <cfinvoke  component="mochi.cfc.sampleTypes.SampleTypeGateway" method="getById" returnvariable="SampleType">
			<cfinvokeargument name="id" value="#SampleRequest.getSampleTypeID()#"/>
		</cfinvoke>

        
		<cfinvoke  component="mochi.cfc.styles.StyleGateway" method="getById" returnvariable="Style">
			<cfinvokeargument name="id" value="#SampleRequest.getStyleID()#"/>
		</cfinvoke>
        
        <cfinvoke  component="mochi.cfc.colors.ColorGateway" method="getById" returnvariable="Color">
			<cfinvokeargument name="id" value="#SampleRequest.getColorID()#"/>
		</cfinvoke>

        
        
		<cfmail from="production@tadashishoji.com.cn"
			    failto="lu@tadashishoji.com.cn"
				to="selina@tadashishoji.com.cn, joy@tadashishoji.com.cn, pablo@tadashishoji.com,dawn@tadashishoji.com,agnes@tadashishoji.com.cn,laurenr@tadashishoji.com, delina@tadashishoji.com.cn, lucia@tadashishoji.com.cn" 
			    cc="ruben@tadashishoji.com"
 			    type="html"	
			    subject="NEW #SampleType.getSampleType()# #Style.getStyleName()# Request">
		

        		
		
				<table border="1">
					<tr>
						<th>Reference ##</th>
						<th>Style</th>
						<th>Color</th>
						<th>Make In</th>
						<th>Sample Type</th>
						<th>Request Date</th>
						<th>Request By</th>
						<th>Request For</th>
						<th>Due Date</th>
						<th>Created By</th>
						<th>Comments</th>
					</tr>
				<cfoutput>
					<tr>
						<td>#SampleRequest.getReferenceNumber()#</td>
						<td>#Style.getStyleName()#</td>
						<td>#Color.getColorCode()#</td>
						<td>#SampleRequest.getMakeIn()#</td>
						<td>#SampleType.getSampleType()#</td>
						<td>#DateFormat(SampleRequest.getRequestDate(), 'mm/dd/yyyy')#</td>
						<td>#SampleRequest.getRequestedBy()#</td>
						<td>#SampleRequest.getRequestedFor()#</td>
						<td>#DateFormat(SampleRequest.getDueDate(), 'mm/dd/yyyy')#</td>
						<td>#SampleRequest.getCreatedBy()#</td>
						<td>#SampleRequest.getComments()#</td>
					</tr>
				</cfoutput>
				</table>
					
		</cfmail>	    

	</cffunction>



	<cffunction name="emailCancelledSampleRequest" returntype="void" output="no" access="public">
		<cfargument name="sampleRequestID" required="true">
		<cfargument name="cancellationDate" required="true">
		<cfargument name="cancelledBy" required="true">
		
		<cfquery name="samples" datasource="#APPLICATION.DATASOURCE#">
			SELECT SampleRequest.ReferenceNumber, Styles.StyleName, Colors.ColorCode, SampleRequest.MakeIn, SampleTypes.SampleType, SampleRequest.RequestDate, SampleRequest.DueDate, SampleRequest.Comments 
			FROM (((SampleRequest INNER JOIN Styles ON SampleRequest.StyleID = Styles.StyleID) INNER JOIN Sizes ON SampleRequest.SizeID = Sizes.SizeID) INNER JOIN Colors ON SampleRequest.ColorID = Colors.ColorID) INNER JOIN SampleTypes ON SampleRequest.SampleTypeID = SampleTypes.SampleTypeID
			WHERE (((SampleRequest.SampleRequestID)= <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.sampleRequestID#" /> ));
		</cfquery>

		<cfmail query="samples"
			    from="production@tadashishoji.com.cn"
			    failto="ruben@tadashishoji.com"
				to="selina@tadashishoji.com.cn, joy@tadashishoji.com.cn, pablo@tadashishoji.com,lu@tadashishoji.com.cn,dawn@tadashishoji.com,agnes@tadashishoji.com.cn,laurenr@tadashishoji.com, delina@tadashishoji.com.cn, lucia@tadashishoji.com.cn" 
			    cc="ruben@tadashishoji.com"
 			    type="html"	
			    subject="CANCELLED #samples.SampleType# #samples.StyleName#">
		
				<table border="1">
					<tr>
						<th>Reference ##</th>
						<th>Style</th>
						<th>Color</th>
						<th>Make In</th>
						<th>Sample Type</th>
						<th>Request Date</th>
						<th>Due Date</th>
						<th>Cancellation Date</th>
						<th>Cancelled By</th>
						<th>Comments</th>
					</tr>
				<cfoutput>
					<tr>
						<td>#samples.ReferenceNumber#</td>
						<td>#samples.StyleName#</td>
						<td>#samples.ColorCode#</td>
						<td>#samples.MakeIn#</td>
						<td>#samples.SampleType#</td>
						<td>#DateFormat(samples.RequestDate, 'mm/dd/yyyy')#</td>
						<td>#DateFormat(samples.DueDate, 'mm/dd/yyyy')#</td>
						<td>#DateFormat(arguments.CancellationDate, 'mm/dd/yyyy')#</td>
						<td>#arguments.CancelledBy#</td>
						<td>#samples.Comments#</td>
					</tr>
				</cfoutput>
				</table>
					
		</cfmail>	    

	</cffunction>
	
	
	<cffunction name="emailFirstSampleRequests" returntype="void" output="no" access="public">
	
		<cfquery name="samples" datasource="#APPLICATION.DATASOURCE#">
			SELECT SampleRequest.ReferenceNumber, Styles.StyleName, Colors.ColorCode, Sizes.Size, SampleRequest.MakeIn, SampleTypes.SampleType, SampleRequest.RequestDate, SampleRequest.DueDate, SampleRequest.Comments, Collections.Collection, SampleRequest.RequestSubmitted
			FROM ((((SampleRequest INNER JOIN Styles ON SampleRequest.StyleID = Styles.StyleID) INNER JOIN Sizes ON SampleRequest.SizeID = Sizes.SizeID) INNER JOIN Colors ON SampleRequest.ColorID = Colors.ColorID) INNER JOIN SampleTypes ON SampleRequest.SampleTypeID = SampleTypes.SampleTypeID) INNER JOIN Collections ON SampleRequest.CollectionID = Collections.CollectionID
			WHERE (((SampleRequest.RequestStatusID)=3) AND ((SampleTypes.SampleTypeID)=2));
		</cfquery>

		<cfmail query="samples"
			    from="production@tadashishoji.com.cn"
			    failto="ruben@tadashishoji.com"
				to="selina@tadashishoji.com.cn, delina@tadashishoji.com.cn, lucia@tadashishoji.com.cn"
			    cc="ruben@tadashishoji.com,pablo@tadashishoji.com"
 			    type="html"	
			    subject="OPEN #samples.Collection# 1ST SAMPLE REQUEST"
			    group="Collection">
		
				<table border="1">
					<tr>
						<th colspan="10">#samples.Collection#</th>
					</tr>
					<tr>
						<th>Reference ##</th>
						<th>Style</th>
						<th>Color</th>
						<th>Size</th>
						<th>Make In</th>
						<th>Submit</th>
						<th>Sample Type</th>
						<th>Request Date</th>
						<th>Due Date</th>
						<th>Comments</th>
					</tr>
				<cfoutput>
					<cfif samples.RequestDate EQ DateFormat(Now(),'mm/dd/yyyy')>
						<cfset bgcolor='red'>
					<cfelse>
						<cfset bgcolor='white'>	
					</cfif>
					<tr Bgcolor="#bgcolor#">
						<td>#samples.ReferenceNumber#</td>
						<td>#samples.StyleName#</td>
						<td>#samples.ColorCode#</td>
						<td>#samples.Size#</td>
						<td>#samples.MakeIn#</td>
						<td>#samples.RequestSubmitted#</td>
						<td>#samples.SampleType#</td>
						<td>#DateFormat(samples.RequestDate, 'mm/dd/yyyy')#</td>
						<td>#DateFormat(samples.DueDate, 'mm/dd/yyyy')#</td>
						<td>#samples.Comments#</td>
					</tr>
				</cfoutput>
				</table>
					
		</cfmail>	    

	</cffunction>
	
			
	<cffunction name="emailDuplicationSampleRequests" returntype="void" output="no" access="public">
	
		<cfquery name="samples" datasource="#APPLICATION.DATASOURCE#">
			SELECT SampleRequest.ReferenceNumber, Styles.StyleName, Colors.ColorCode, Sizes.Size, SampleRequest.MakeIn, SampleTypes.SampleType, SampleRequest.RequestDate, SampleRequest.DueDate, SampleRequest.Comments, Collections.Collection, SampleRequest.RequestSubmitted
			FROM ((((SampleRequest INNER JOIN Styles ON SampleRequest.StyleID = Styles.StyleID) INNER JOIN Sizes ON SampleRequest.SizeID = Sizes.SizeID) INNER JOIN Colors ON SampleRequest.ColorID = Colors.ColorID) INNER JOIN SampleTypes ON SampleRequest.SampleTypeID = SampleTypes.SampleTypeID) INNER JOIN Collections ON SampleRequest.CollectionID = Collections.CollectionID
			WHERE (((SampleRequest.RequestStatusID)=3) AND ((SampleTypes.SampleTypeID)=3));
		</cfquery>

		<cfmail query="samples"
			    from="production@tadashishoji.com.cn"
			    failto="ruben@tadashishoji.com"
				to="joy@tadashishoji.com.cn"
			    cc="jbonifacio@tadashishoji.com,dawn@tadashishoji.com,laurenr@tadashishoji.com,pablo@tadashishoji.com,ruben@tadashishoji.com"
 			    type="html"	
			    subject="OPEN #samples.Collection# DUPLICATION SAMPLE REQUEST"
			    group="Collection">
		
				<table border="1">
					<tr>
						<th colspan="10">#samples.Collection#</th>
					</tr>
					<tr>
						<th>Reference ##</th>
						<th>Style</th>
						<th>Color</th>
						<th>Size</th>
						<th>Make In</th>
						<th>Submit</th>
						<th>Sample Type</th>
						<th>Request Date</th>
						<th>Due Date</th>
						<th>Comments</th>
					</tr>
				<cfoutput>
					<cfif samples.RequestDate EQ DateFormat(Now(),'mm/dd/yyyy')>
						<cfset bgcolor='red'>
					<cfelse>
						<cfset bgcolor='white'>	
					</cfif>
					<tr Bgcolor="#bgcolor#">
						<td>#samples.ReferenceNumber#</td>
						<td>#samples.StyleName#</td>
						<td>#samples.ColorCode#</td>
						<td>#samples.Size#</td>
						<td>#samples.MakeIn#</td>
						<td>#samples.RequestSubmitted#</td>
						<td>#samples.SampleType#</td>
						<td>#DateFormat(samples.RequestDate, 'mm/dd/yyyy')#</td>
						<td>#DateFormat(samples.DueDate, 'mm/dd/yyyy')#</td>
						<td>#samples.Comments#</td>
					</tr>
				</cfoutput>
				</table>
					
		</cfmail>	    

	</cffunction>
		
	<cffunction name="emailProductionSampleRequests" returntype="void" output="no" access="public">
	
		<cfquery name="samples" datasource="#APPLICATION.DATASOURCE#">
            SELECT SampleRequest.ReferenceNumber, Styles.StyleName, Colors.ColorCode, Sizes.Size, SampleRequest.MakeIn, SampleTypes.SampleType, SampleRequest.RequestDate, SampleRequest.DueDate, SampleRequest.Comments, Collections.Collection, SampleRequest.RequestSubmitted
            FROM (((((SampleRequest INNER JOIN Styles ON SampleRequest.StyleID = Styles.StyleID) INNER JOIN Sizes ON SampleRequest.SizeID = Sizes.SizeID) INNER JOIN Colors ON SampleRequest.ColorID = Colors.ColorID) INNER JOIN SampleTypes ON SampleRequest.SampleTypeID = SampleTypes.SampleTypeID) INNER JOIN Collections ON SampleRequest.CollectionID = Collections.CollectionID) LEFT JOIN SampleProgress ON SampleRequest.SampleRequestID = SampleProgress.SampleRequestID
            WHERE (((SampleRequest.RequestStatusID)=3) AND ((SampleTypes.SampleTypeID)=4) AND ((SampleProgress.PatternStatusID) In (3,5)))
		</cfquery>

		<cfmail query="samples"
			    from="production@tadashishoji.com.cn"
			    failto="ruben@tadashishoji.com"
				to="selina@tadashishoji.com.cn, laurenr@tadashishoji.com, delina@tadashishoji.com.cn, lucia@tadashishoji.com.cn"
			    cc="ruben@tadashishoji.com,pablo@tadashishoji.com"
 			    type="html"	
			    subject="OPEN #samples.Collection# PRODUCTION SAMPLE REQUEST"
			    group="Collection">
		
				<table border="1">
					<tr>
						<th colspan="10">#samples.Collection#</th>
					</tr>
					<tr>
						<th>Reference ##</th>
						<th>Style</th>
						<th>Color</th>
						<th>Size</th>
						<th>Make In</th>
						<th>Submit</th>
						<th>Sample Type</th>
						<th>Request Date</th>
						<th>Due Date</th>
						<th>Comments</th>
					</tr>
				<cfoutput>
					<cfif samples.RequestDate EQ DateFormat(Now(),'mm/dd/yyyy')>
						<cfset bgcolor='red'>
					<cfelse>
						<cfset bgcolor='white'>	
					</cfif>
					<tr Bgcolor="#bgcolor#">
						<td>#samples.ReferenceNumber#</td>
						<td>#samples.StyleName#</td>
						<td>#samples.ColorCode#</td>
						<td>#samples.Size#</td>
						<td>#samples.MakeIn#</td>
						<td>#samples.RequestSubmitted#</td>
						<td>#samples.SampleType#</td>
						<td>#DateFormat(samples.RequestDate, 'mm/dd/yyyy')#</td>
						<td>#DateFormat(samples.DueDate, 'mm/dd/yyyy')#</td>
						<td>#samples.Comments#</td>
					</tr>
				</cfoutput>
				</table>
					
		</cfmail>	    

	</cffunction>

	<cffunction name="emailJapanSampleRequests" returntype="void" output="no" access="public">
	
		<cfquery name="samples" datasource="#APPLICATION.DATASOURCE#">
			SELECT SampleRequest.ReferenceNumber, Styles.StyleName, Colors.ColorCode, Sizes.Size, SampleRequest.MakeIn, SampleTypes.SampleType, SampleRequest.RequestDate, SampleRequest.DueDate, SampleRequest.Comments, Collections.Collection, SampleRequest.RequestSubmitted
			FROM ((((SampleRequest INNER JOIN Styles ON SampleRequest.StyleID = Styles.StyleID) INNER JOIN Sizes ON SampleRequest.SizeID = Sizes.SizeID) INNER JOIN Colors ON SampleRequest.ColorID = Colors.ColorID) INNER JOIN SampleTypes ON SampleRequest.SampleTypeID = SampleTypes.SampleTypeID) INNER JOIN Collections ON SampleRequest.CollectionID = Collections.CollectionID
			WHERE (((SampleRequest.RequestStatusID)=3) AND ((SampleTypes.SampleTypeID)=7));
		</cfquery>

		<cfmail query="samples"
			    from="production@tadashishoji.com.cn"
			    failto="ruben@tadashishoji.com"
				to="joy@tadashishoji.com.cn"
			    cc="ruben@tadashishoji.com,pablo@tadashishoji.com"
 			    type="html"	
			    subject="OPEN #samples.Collection# JAPAN SAMPLE REQUEST"
			    group="Collection">
		
				<table border="1">
					<tr>
						<th colspan="10">#samples.Collection#</th>
					</tr>
					<tr>
						<th>Reference ##</th>
						<th>Style</th>
						<th>Color</th>
						<th>Size</th>
						<th>Make In</th>
						<th>Submit</th>
						<th>Sample Type</th>
						<th>Request Date</th>
						<th>Due Date</th>
						<th>Comments</th>
					</tr>
				<cfoutput>
					<cfif samples.RequestDate EQ DateFormat(Now(),'mm/dd/yyyy')>
						<cfset bgcolor='red'>
					<cfelse>
						<cfset bgcolor='white'>	
					</cfif>
					<tr Bgcolor="#bgcolor#">
						<td>#samples.ReferenceNumber#</td>
						<td>#samples.StyleName#</td>
						<td>#samples.ColorCode#</td>
						<td>#samples.Size#</td>
						<td>#samples.MakeIn#</td>
						<td>#samples.RequestSubmitted#</td>
						<td>#samples.SampleType#</td>
						<td>#DateFormat(samples.RequestDate, 'mm/dd/yyyy')#</td>
						<td>#DateFormat(samples.DueDate, 'mm/dd/yyyy')#</td>
						<td>#samples.Comments#</td>
					</tr>
				</cfoutput>
				</table>
					
		</cfmail>	    

	</cffunction>

	<cffunction name="emailSpecialOrderSampleRequests" returntype="void" output="no" access="public">
	
		<cfquery name="samples" datasource="#APPLICATION.DATASOURCE#">
			SELECT SampleRequest.ReferenceNumber, Styles.StyleName, Colors.ColorCode, Sizes.Size, SampleRequest.MakeIn, SampleTypes.SampleType, SampleRequest.RequestDate, SampleRequest.DueDate, SampleRequest.Comments, Collections.Collection, SampleRequest.RequestSubmitted
			FROM ((((SampleRequest INNER JOIN Styles ON SampleRequest.StyleID = Styles.StyleID) INNER JOIN Sizes ON SampleRequest.SizeID = Sizes.SizeID) INNER JOIN Colors ON SampleRequest.ColorID = Colors.ColorID) INNER JOIN SampleTypes ON SampleRequest.SampleTypeID = SampleTypes.SampleTypeID) INNER JOIN Collections ON SampleRequest.CollectionID = Collections.CollectionID
			WHERE (((SampleRequest.RequestStatusID)=3) AND ((SampleTypes.SampleTypeID)=7));
		</cfquery>

		<cfmail query="samples"
			    from="production@tadashishoji.com.cn"
			    failto="ruben@tadashishoji.com"
				to="joy@tadashishoji.com.cn"
 			    cc="ruben@tadashishoji.com,pablo@tadashishoji.com"
 			    type="html"	
			    subject="OPEN #samples.Collection# SPECIAL ORDER SAMPLE REQUEST"
			    group="Collection">
		
				<table border="1">
					<tr>
						<th colspan="10">#samples.Collection#</th>
					</tr>
					<tr>
						<th>Reference ##</th>
						<th>Style</th>
						<th>Color</th>
						<th>Size</th>
						<th>Make In</th>
						<th>Submit</th>
						<th>Sample Type</th>
						<th>Request Date</th>
						<th>Due Date</th>
						<th>Comments</th>
					</tr>
				<cfoutput>
					<cfif samples.RequestDate EQ DateFormat(Now(),'mm/dd/yyyy')>
						<cfset bgcolor='red'>
					<cfelse>
						<cfset bgcolor='white'>	
					</cfif>
					<tr Bgcolor="#bgcolor#">
						<td>#samples.ReferenceNumber#</td>
						<td>#samples.StyleName#</td>
						<td>#samples.ColorCode#</td>
						<td>#samples.Size#</td>
						<td>#samples.MakeIn#</td>
						<td>#samples.RequestSubmitted#</td>
						<td>#samples.SampleType#</td>
						<td>#DateFormat(samples.RequestDate, 'mm/dd/yyyy')#</td>
						<td>#DateFormat(samples.DueDate, 'mm/dd/yyyy')#</td>
						<td>#samples.Comments#</td>
					</tr>
				</cfoutput>
				</table>
					
		</cfmail>	    

	</cffunction>				


	<cffunction name="emailSampleStatusChangeByDate"  returntype="void" output="no" access="public">
		<cfargument name="fromLastMaintainedDate" type="date" required="true">
		<cfargument name="toLastMaintainedDate" type="date" required="true">
	
		<cfquery name="qSamples" datasource="#APPLICATION.DATASOURCE#">
            SELECT SampleRequest.SampleRequestID, Styles.StyleName, SampleTypes.SampleType, Styles.ProductionTeamLeader, Styles.ProductionPatternMaker, Styles.FirstPatternMaker, RequestStatus.Status, SampleRequest.Comments, SampleRequest.LastMaintainedBy, SampleRequest.LastMaintainedDate, PatternStatus.Status AS PatternStatus 
            FROM ((((SampleRequest INNER JOIN Styles ON SampleRequest.StyleID = Styles.StyleID) INNER JOIN SampleTypes ON SampleRequest.SampleTypeID = SampleTypes.SampleTypeID) INNER JOIN RequestStatus ON SampleRequest.RequestStatusID = RequestStatus.RequestStatusID) LEFT JOIN SampleProgress ON SampleRequest.SampleRequestID = SampleProgress.SampleRequestID) LEFT JOIN PatternStatus ON SampleProgress.PatternStatusID = PatternStatus.PatternStatusID
			WHERE SampleRequest.LastMaintainedDate > <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.fromLastMaintainedDate#"/>
			AND SampleRequest.LastMaintainedDate < <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.toLastMaintainedDate#"/>
            ORDER BY SampleTypes.SampleType, SampleRequest.LastMaintainedDate ASC
		</cfquery>

		<cfmail query="qSamples" 
			    from="production@tadashishoji.com.cn" 
			    failto="ruben@tadashishoji.com" 
				to="joy@tadashishoji.com.cn, selina@tadashishoji.com.cn,pablo@tadashishoji.com,laurenr@tadashishoji.com" 
                cc="ruben@tadashishoji.com"
 			    type="html"	
			    subject="SAMPLE STATUS CHANGE">

				<table border="1">
					<tr>
						<th>Style</th>
						<th>Sample Type</th>
						<th>Sample Status</th>
						<th>Pattern Status</th>
						<th>Team Leader</th>
						<th>Production Patternmaker</th>
						<th>Updated By</th>
						<th>Updated Date</th>
						<th>Comments</th>
					</tr>
				<cfoutput>
					<tr>
						<td><a href="http://10.32.32.31:8500/mochi/sampleRequests/show.cfm?SampleRequestID=#qSamples.SampleRequestID#">#qSamples.StyleName#</a></td>
						<td>#qSamples.SampleType#</td>
						<td>#qSamples.Status#</td>
						<td>#qSamples.PatternStatus#</td>
						<td>#qSamples.ProductionTeamLeader#</td>
						<td>#qSamples.ProductionPatternMaker#</td>
						<td>#qSamples.LastMaintainedBy#</td>
						<td>#qSamples.LastMaintainedDate#</td>
						<td>#qSamples.Comments#</td>
					</tr>
				</cfoutput>
				</table>
			
        </cfmail>

	</cffunction>
	

</cfcomponent>