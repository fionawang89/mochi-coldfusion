<cfinclude template="../shared/header.cfm">

<cfif IsDefined("url.styleid")>

 <cfquery name="style" datasource="#APPLICATION.DATASOURCE#">
 	SELECT Styles.StyleID, Styles.StyleName, Styles.Description, Styles.CreatedBy, 
    	   Styles.ProductionTeamLeader, Styles.ProductionPatternMaker, Styles.FirstPatternMaker, Styles.PatternDifficulty, Styles.PatternReference, Styles.CareInformation,     
    	   Styles.CreatedDate, Styles.LastMaintainedBy, Styles.LastMaintainedDate, Images.ThumbnailFile 
	FROM Styles 
    LEFT OUTER JOIN Images ON Styles.StyleID = Images.EntityID 
    AND Styles.EntityTypeID = Images.EntityTypeID
	WHERE StyleID = #url.styleid#
 </cfquery>
 
 <!--- get the sample requests for this style --->	
 <cfquery name="qSampleRequest" datasource="#APPLICATION.DATASOURCE#">
    SELECT SampleRequest.SampleRequestID, SampleRequest.RequestDate, SampleRequest.DueDate, SampleTypes.SampleType, Years.Year, RequestStatus.Status, Deliveries.Delivery
    FROM (((SampleRequest INNER JOIN SampleTypes ON SampleRequest.SampleTypeID = SampleTypes.SampleTypeID) INNER JOIN RequestStatus ON SampleRequest.RequestStatusID = RequestStatus.RequestStatusID) INNER JOIN Deliveries ON SampleRequest.DeliveryID = Deliveries.DeliveryID) INNER JOIN Years ON SampleRequest.YearID = Years.YearID
    WHERE (((SampleRequest.StyleID)= #url.styleid#));
 </cfquery>
 
  <!--- get the additional images for this style --->	
 <cfquery name="styleImages" datasource="#APPLICATION.DATASOURCE#">
 	SELECT Images.ThumbnailFile 
	FROM Images 
	WHERE Images.EntityID = #url.styleid#
    AND Images.EntityTypeID = 7
 </cfquery>
 
  <cfinvoke component="mochi.cfc.styleAttributes.StyleAttributeGateway" method="getAllAsQuery" returnvariable="styleAttributes"> 
  </cfinvoke>


 
<div>
 <table width="333" border="1" align="left">
  <cfoutput>	
  <tr>  
    <th width="149" scope="row">Image :</th>
    <td width="168"><img src="/mochi/uploads/#style.StyleID#/images/2/#style.ThumbnailFile#" /></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Style Name :</th>
    <td width="168">#style.StyleName#</td>
  </tr>
  <tr>
    <th scope="row">Description :</th>
    <td>#style.Description#</td>
  </tr>
  <tr>  
    <th width="149" scope="row">Production Team Leader :</th>
    <td width="168">#style.ProductionTeamLeader#</td>
  </tr>
  <tr>
    <th scope="row">First Pattern Maker :</th>
    <td>#style.FirstPatternMaker#</td>
  </tr>
  <tr>
    <th scope="row">Production Pattern Maker :</th>
    <td>#style.ProductionPatternMaker#</td>
  </tr>  
  <tr>
    <th scope="row">Care Information :</th>
    <td>#style.CareInformation#</td>
  </tr>  
  <tr>
    <th scope="row">Pattern Difficulty :</th>
    <td>#style.PatternDifficulty#</td>
  </tr>  
  <tr>
    <th scope="row">Style Reference :</th>
    <td>#style.PatternReference#</td>
  </tr>  
  <tr>
	<th scope="row">Created By :</th>
	<td>#style.CreatedBy#</td>
  </tr>
  <tr>
	<th scope="row">Created Date :</th>
	<td>#style.CreatedDate#</td>
  </tr>
  <tr>
	<th scope="row">Last Maintained By :</th>
    <td>#style.LastMaintainedBy#</td>
  </tr>
  <tr>
	<th scope="row">Last Maintained Date :</th>
	<td>#style.LastMaintainedDate#</td>
  </tr>
  
  <!--- Style Attributes Form --->
  <cfloop query="styleAttributes">
  
    <!--- get the StyleAttributeValue by StyleAttributeID and StyleID --->
    <cfquery datasource="#APPLICATION.DATASOURCE#" name="qStyleAttributeOptions">
      SELECT StyleAttributeOptions.AttributeValue
      FROM StyleAttributes INNER JOIN (StyleAttributeValues 
      INNER JOIN StyleAttributeOptions ON StyleAttributeValues.StyleAttributeOptionID = StyleAttributeOptions.StyleAttributeOptionID)
       ON StyleAttributes.StyleAttributeID = StyleAttributeOptions.StyleAttributeID
      WHERE (((StyleAttributes.StyleAttributeID)= #styleAttributes.StyleAttributeID#) AND ((StyleAttributeValues.StyleID)=#style.StyleID#))      
    </cfquery>
          
      <tr>
        <th scope="row">#styleAttributes.AttributeName#</th>  
        <td>#qStyleAttributeOptions.AttributeValue#</td>
      </tr>
  </cfloop>    
  
  <tr>
    <td><a href="new.cfm">Create New Style</a></td>
    <td><a href="../sampleRequests/new.cfm?styleid=#Style.StyleID#">Create New Sample Request</a></td>
  </tr>
  </cfoutput>    
  
    
</table>
</div>
<div>
<table>
	<tr>
    	<th colspan="7">Sample Request for this style</th>
    </tr>
    <tr>
    	<th>Sample Type</th>
    	<th>Request Date</th>
    	<th>Due Date</th>
    	<th>Delivery</th>
    	<th>Year</th>
    	<th>Status</th>
    	<th>Progress</th>
    </tr>    
    
	<cfoutput query="qSampleRequest">
    	<tr>
        	<td>#qSampleRequest.SampleType#</td>
        	<td>#DateFormat(qSampleRequest.RequestDate, 'mm/dd/yyyy')#</td>
        	<td>#DateFormat(qSampleRequest.DueDate, 'mm/dd/yyyy')#</td>
        	<td>#qSampleRequest.Delivery#</td>
        	<td>#qSampleRequest.Year#</td>
        	<td>#qSampleRequest.Status#</td>
        	<td><a href="../sampleProgress/update.cfm?SampleRequestID=#qSampleRequest.SampleRequestID#">Progress</a></td>
        </tr>
    </cfoutput>
    

</table>
</div>
<div>
	<cfoutput query="styleImages">
    	<tr>
        	<td><img src="/mochi/uploads/#style.StyleID#/images/7/#styleImages.ThumbnailFile#" /></td>
        </tr>   
    </cfoutput>
</div>
</cfif>
