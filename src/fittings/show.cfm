<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("url.fittingid")>
	<cfinvoke  component="mochi.cfc.fittings.FittingGateway" method="getById" returnvariable="fitting">
		<cfinvokeargument name="id" value="#url.fittingid#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.styles.StyleGateway" method="getById" returnvariable="Style">
		<cfinvokeargument name="id" value="#fitting.getStyleID()#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.sampleCategories.SampleCategoryGateway" method="getById" returnvariable="Category">
		<cfinvokeargument name="id" value="#fitting.getSampleCategoryID()#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.patternMakers.PatternMakerGateway" method="getById" returnvariable="PatternMaker">
		<cfinvokeargument name="id" value="#fitting.getPatternMakerID()#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.locations.LocationGateway" method="getById" returnvariable="Location">
		<cfinvokeargument name="id" value="#fitting.getLocationID()#"/>
	</cfinvoke>
    
    <cfinvoke  component="mochi.cfc.contractors.ContractorGateway" method="getById" returnvariable="Contractor">
		<cfinvokeargument name="id" value="#fitting.getContractorID()#"/>
	</cfinvoke>

    
    <cfinvoke  component="mochi.cfc.resultCodes.ResultCodeGateway" method="getById" returnvariable="ResultCode">
		<cfinvokeargument name="id" value="#fitting.getResultCodeID()#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.patternStatus.PatternStatusGateway" method="getById" returnvariable="PatternStatus">
		<cfinvokeargument name="id" value="#fitting.getPatternStatusID()#"/>
	</cfinvoke>

	<!--- Fitting Comments --->
	<cfinvoke  component="mochi.cfc.fittingComments.FittingCommentGateway" method="getAllAsQueryByFittingID" returnvariable="FittingComments">
		<cfinvokeargument name="id" value="#fitting.getFittingID()#"/>
	</cfinvoke>

	<!--- Videos --->
	<cfinvoke  component="mochi.cfc.videos.VideoGateway" method="getAllAsQueryByFittingID" returnvariable="Videos">
		<cfinvokeargument name="id" value="#fitting.getFittingID()#"/>
	</cfinvoke>

	<!--- Images --->
	<cfinvoke  component="mochi.cfc.images.ImageGateway" method="getAllAsQueryByEntityID" returnvariable="Images">
		<cfinvokeargument name="id" value="#fitting.getFittingID()#"/>
	</cfinvoke>

	<!--- Patterns --->
	<cfinvoke  component="mochi.cfc.patterns.PatternGateway" method="getAllAsQueryByFittingID" returnvariable="Patterns">
		<cfinvokeargument name="id" value="#fitting.getFittingID()#"/>
	</cfinvoke>
    
    
    
 <table width="333" border="1" align="left">
 <cfoutput>	
	  <tr>
	    <th width="149" scope="row">Style :</th>
	    <td width="168" colspan="3">#Style.getStyleName()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Category :</th>
	    <td width="168" colspan="3">#Category.getCategory()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Pattern Maker :</th>
	    <td width="168" colspan="3">#PatternMaker.getFirstName()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Cut Number :</th>
	    <td width="168" colspan="3">#fitting.getCutNumber()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Location :</th>
	    <td width="168" colspan="3">#Location.getLocation()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Contractor :</th>
	    <td width="168" colspan="3">#Contractor.getContractor()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Fitter :</th>
	    <td width="168" colspan="3">#fitting.getFitter()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Fitting Date :</th>
	    <td width="168" colspan="3">#DateFormat(fitting.getFittingDate(), "full")#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Result :</th>
	    <td width="168" colspan="3">#ResultCode.getCode()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Pattern Status :</th>
	    <td width="168" colspan="3">#PatternStatus.getStatus()#</td>
	  </tr>
	  <tr>
	    <th width="149" scope="row">Fit Comments :</th>
	    <td width="168" colspan="3">#fitting.getComments()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td colspan="3">#fitting.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td colspan="3">#fitting.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td colspan="3">#fitting.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td colspan="3">#fitting.getLastMaintainedDate()#</td>
	  </tr>
      <tr>
        <td><a href="../fittingcomments/new.cfm?fittingid=#fitting.getFittingID()#">Add Comment</a></td>
        <td><a href="../videos/new.cfm?fittingid=#fitting.getFittingID()#">Add Video</a></td>
        <td><a href="../images/new.cfm?fittingid=#fitting.getFittingID()#">Add Image</a></td>
        <td><a href="../patterns/new.cfm?fittingid=#fitting.getFittingID()#">Add Pattern</a></td>
      </tr>
 </cfoutput>
  
  <!--- This is where the comments will go --->
	  <tr>
	    <th scope="row" colspan="4">Comments :</th>
	  </tr>  
  <cfoutput query="FittingComments">
	  <tr>
	    <th scope="row">#FittingComments.CreatedBy# :</th>
	    <td colspan="3">#FittingComments.Comment#</td>
	  </tr>  
  </cfoutput>
  
  
  <!--- This is where the videos should go --->
	  <tr>
	    <th scope="row" colspan="4">Videos :</th>
	  </tr>  
  <cfoutput query="Videos">
       <tr>
         <td colspan="4"><a href="../videos/show.cfm?videoid=#Videos.VideoID#">#Videos.Description#</a></td>    
       </tr>
       <tr>
         <td colspan="4"><a href="../videoComments/new.cfm?videoid=#Videos.VideoID#&fittingid=#Fitting.getFittingID()#">Add Comment</a></td>    
       </tr>
       <tr>
         <th colspan="4">Comments</th>
       </tr>
       
       <!--- This is where the video comments should go --->

		<cfinvoke  component="mochi.cfc.videoComments.VideoCommentGateway" method="getAllAsQueryByVideoID" returnvariable="videoComments">
			<cfinvokeargument name="id" value="#Videos.VideoID#"/>
		</cfinvoke>

		<cfloop query="videoComments">
            <tr>
                <td colspan="4">#comment#</td>
            </tr>
        </cfloop>    

 </cfoutput>

  <!--- This is where the images should go --->
	  <tr>
	    <th scope="row" colspan="4">Images :</th>
	  </tr>  
  <cfoutput query="Images">
      <tr>
         <td colspan="4"><a href="/mochi/uploads/#Style.getStyleName()#/images/#Images.File#"><img src="/mochi/uploads/#Style.getStyleName()#/images/#Images.ThumbnailFile#" /></a></td>    
      </tr>
       <tr>
         <td colspan="4">#Images.Description#</td>    
       </tr>
       <tr>
         <td colspan="4"><a href="../imageComments/new.cfm?imageid=#Images.ImageID#&fittingid=#Fitting.getFittingID()#">Add Comment</a></td>    
       </tr>
       <tr>
         <th colspan="4">Comments</th>
       </tr>
       
       <!--- This is where the image comments should go --->
       
       <cfinvoke  component="mochi.cfc.imageComments.ImageCommentGateway" method="getAllAsQueryByImageID" returnvariable="imageComments">
			<cfinvokeargument name="id" value="#Images.ImageID#"/>
	   </cfinvoke>

		<cfloop query="imageComments">
            <tr>
                <td colspan="4">#comment#</td>
            </tr>
        </cfloop>    

       
    
	 </cfoutput>
  
  <!--- This is where the patterns should go --->
	  <tr>
	    <th scope="row" colspan="4">Patterns :</th>
	  </tr>  
	  <tr>
	  	<th>FileName</th>
	  	<th>Pattern Status</th>
	  	<th>Comments</th>	  	
	  	<th>Create Date</th>	  	
	  </tr>

	<cfoutput query="Patterns">
		
		<cfif Patterns.PatternStatusID IS NOT 0>
			
			<cfinvoke component="mochi.cfc.patternStatus.PatternStatusGateway" method="getById" returnvariable="PatternStatus">
				<cfinvokeargument name="id" value="Patterns.PatternStatusID">
			</cfinvoke>
			
			<cfset patternStatus = #PatternStatus.Status#>
			
		<cfelse>
			<cfset patternStatus = 'No Status'>
		</cfif>		
		
		<tr>
			<td><a href="/mochi/uploads/#Style.getStyleName()#/patterns/#Patterns.File#">#Patterns.File#</a></td>
			<td>#patternStatus#</td>
			<td>#Patterns.Description#</td>
			<td>#DateFormat(Patterns.CreatedDate, 'full')#</td>
		</tr>
		
		
  
	</cfoutput>
	
</table>
</cfif>