<cfinclude template="../shared/header.cfm">

<cfif IsDefined("form.samplerequestid")>

    <!--- if the request received create the RequestRecievedBy and RequestReceivedDate fields --->
	<cfif IsDefined("form.RequestReceived")>
    	<cfset form.RequestReceived=1/>
    	<cfset form.RequestReceivedBy="#GetAuthUser()#"/>
        <cfset form.RequestReceivedDate="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#" />
    <cfelse>
    	<cfset form.RequestReceived=0 />
    	<cfset form.RequestReceivedBy="" />
        <cfset form.RequestReceivedDate="" />        
	</cfif>

	<!--- check the pattern status type --->
    <cfinvoke  component="mochi.cfc.patternStatus.PatternStatusGateway" method="getById" returnvariable="PatternStatus">
		<cfinvokeargument name="id" value="#form.PatternStatusID#"/>
	</cfinvoke>

    
    
    <cfif PatternStatus.getType() EQ 'A'>
    
    	<cfif form.FinishedDate IS ''>
        	<cfset form.FinishedDate = "#DateFormat(CreateODBCDate(Now()), 'mm/dd/yyyy')#">            
        </cfif>
        
    	<cfif form.ApprovedDate IS ''>
        	<cfset form.ApprovedDate = "#DateFormat(CreateODBCDate(Now()), 'mm/dd/yyyy')#">            
        </cfif>
    
    	<!--- If the pattern status is approved get all the production progress information to be updated --->
        <cfquery name="qPatternApprovedStyles" datasource="#APPLICATION.DATASOURCE#">
        	SELECT ProductionProgressID
            FROM ProductionProgressHeader 
            WHERE Style = <cfqueryparam cfsqltype="cf_sql_char" value="#form.styleName#">        
        </cfquery>
    
    	<!--- Update the production progress detail pattern information with finished status --->
        <cfloop query="qPatternApprovedStyles">
        
        	<cfquery datasource="#APPLICATION.DATASOURCE#">
                UPDATE ProductionProgressDetail
                SET  FinishedDate = <cfqueryparam cfsqltype="cf_sql_date" value="#form.ApprovedDate#">,
                     ProductionDetailStatusID = 1,
                     Status = <cfqueryparam cfsqltype="cf_sql_date" value="#form.ApprovedDate#"> 
                WHERE ProductionProgressID = #qPatternApprovedStyles.ProductionProgressID#
                AND  OperationProcessID = 8                       
			</cfquery>        
            
        </cfloop>
        
    <cfelse>
    
    	<cfif form.FinishedDate NEQ ''>
        	<cfset form.FinishedDate = ''>
        </cfif>
        
    	<cfif form.ApprovedDate NEQ ''>
        	<cfset form.ApprovedDate = ''>
        </cfif>
        
    	<!--- If the pattern status is NOT approved get all the production progress information to be updated --->
        <cfquery name="qPatternApprovedStyles" datasource="#APPLICATION.DATASOURCE#">
        	SELECT ProductionProgressID
            FROM ProductionProgressHeader 
            WHERE Style = <cfqueryparam cfsqltype="cf_sql_char" value="#form.styleName#">        
        </cfquery>
    
    	<!--- Update the production progress detail pattern information of the style with pending status --->
        <cfloop query="qPatternApprovedStyles">
        
        	<cfquery datasource="#APPLICATION.DATASOURCE#">
                UPDATE ProductionProgressDetail
                SET  FinishedDate = NULL,
                     ProductionDetailStatusID = 3,
                     Status = ''
                WHERE ProductionProgressID = #qPatternApprovedStyles.ProductionProgressID#
                AND  OperationProcessID = 8                       
			</cfquery>        
            
        </cfloop>
    </cfif>
    
    
    <!--- check the beading, fabric trim, and counter sample status --->
		
	<!--- check if the beading information was submitted --->
    <cfif IsDefined("form.BeadingStatusID") >
        
        <!--- check the beading status type --->
        <cfinvoke  component="mochi.cfc.beadingStatus.BeadingStatusGateway" method="getById" returnvariable="BeadingStatus">
            <cfinvokeargument name="id" value="#form.BeadingStatusID#"/>
        </cfinvoke>
                    
        <cfif BeadingStatus.getType() EQ 'A'>
            <cfset form.BeadingUpdatedDate = "#DateFormat(CreateODBCDate(Now()), 'mm/dd/yyyy')#">            
            <cfset form.BeadingUpdatedBy = "#GetAuthUser()#">            
            <cfset form.BeadingApprovedDate = "#DateFormat(CreateODBCDate(Now()), 'mm/dd/yyyy')#">            
            <cfset form.BeadingApprovedBy = "#GetAuthUser()#">            
        <cfelse>
            <cfset form.BeadingUpdatedDate = "#DateFormat(CreateODBCDate(Now()), 'mm/dd/yyyy')#">            
            <cfset form.BeadingUpdatedBy = "#GetAuthUser()#">            
            <cfset form.BeadingApprovedDate = "">            
            <cfset form.BeadingApprovedBy = "">                                    
        </cfif>        
    <cfelse>    
		<cfset form.BeadingStatusID = 0>                
		<cfset form.BeadingUpdatedDate = "">            
        <cfset form.BeadingUpdatedBy = "">            
        <cfset form.BeadingApprovedDate = "">            
        <cfset form.BeadingApprovedBy = "">                                            
    </cfif>


	<!--- check if the fabric trim information was submitted --->
    <cfif IsDefined("form.FabricTrimStatusID") >
        
        <!--- check the pattern status type --->
        <cfinvoke  component="mochi.cfc.fabricTrimStatus.FabricTrimStatusGateway" method="getById" returnvariable="FabricTrimStatus">
            <cfinvokeargument name="id" value="#form.FabricTrimStatusID#"/>
        </cfinvoke>
                    
        <cfif FabricTrimStatus.getType() EQ 'A'>
            <cfset form.FabricTrimUpdatedDate = "#DateFormat(CreateODBCDate(Now()), 'mm/dd/yyyy')#">            
            <cfset form.FabricTrimUpdatedBy = "#GetAuthUser()#">            
            <cfset form.FabricTrimApprovedDate = "#DateFormat(CreateODBCDate(Now()), 'mm/dd/yyyy')#">            
            <cfset form.FabricTrimApprovedBy = "#GetAuthUser()#">            
        <cfelse>
            <cfset form.FabricTrimUpdatedDate = "#DateFormat(CreateODBCDate(Now()), 'mm/dd/yyyy')#">            
            <cfset form.FabricTrimUpdatedBy = "#GetAuthUser()#">            
            <cfset form.FabricTrimApprovedDate = "">            
            <cfset form.FabricTrimApprovedBy = "">                                    
        </cfif>
        
    <cfelse>    
		<cfset form.FabricTrimStatusID = 0>                
		<cfset form.FabricTrimUpdatedDate = "">            
        <cfset form.FabricTrimUpdatedBy = "">            
        <cfset form.FabricTrimApprovedDate = "">            
        <cfset form.FabricTrimApprovedBy = "">                                            
    </cfif>


	<!--- check if the fabric trim information was submitted --->
    <cfif IsDefined("form.CounterSampleStatusID") >
        
        <!--- check the pattern status type --->
        <cfinvoke  component="mochi.cfc.counterSampleStatus.CounterSampleStatusGateway" method="getById" returnvariable="CounterSampleStatus">
            <cfinvokeargument name="id" value="#form.CounterSampleStatusID#"/>
        </cfinvoke>
                    
        <cfif CounterSampleStatus.getType() EQ 'A'>
            <cfset form.CounterSampleUpdatedDate = "#DateFormat(CreateODBCDate(Now()), 'mm/dd/yyyy')#">            
            <cfset form.CounterSampleUpdatedBy = "#GetAuthUser()#">            
            <cfset form.CounterSampleApprovedDate = "#DateFormat(CreateODBCDate(Now()), 'mm/dd/yyyy')#">            
            <cfset form.CounterSampleApprovedBy = "#GetAuthUser()#">            
        <cfelse>
            <cfset form.CounterSampleUpdatedDate = "#DateFormat(CreateODBCDate(Now()), 'mm/dd/yyyy')#">            
            <cfset form.CounterSampleUpdatedBy = "#GetAuthUser()#">            
            <cfset form.CounterSampleApprovedDate = "">            
            <cfset form.CounterSampleApprovedBy = "">                                    
        </cfif>
        
    <cfelse>    
		<cfset form.CounterSampleStatusID = 0>                
		<cfset form.CounterSampleUpdatedDate = "">            
        <cfset form.CounterSampleUpdatedBy = "">            
        <cfset form.CounterSampleApprovedDate = "">            
        <cfset form.CounterSampleApprovedBy = "">                                            
    </cfif>

    <!--- END check the beading, fabric trim, and counter sample status --->
    

	<cfinvoke  component="mochi.cfc.sampleProgress.SampleProgress" method="init" returnvariable="sampleProgress">
		<cfinvokeargument name="stValues" value="#form#"/>
    </cfinvoke>

	<cfinvoke  component="mochi.cfc.sampleProgress.SampleProgressGateway" method="save">
		<cfinvokeargument name="obj" value="#sampleProgress#"/>
	</cfinvoke>


	<cflocation url="/mochi/sampleRequests/show.cfm?samplerequestid=#form.samplerequestid#">
	
    
<cfelseif IsDefined("form.image")>

	<cfinvoke  component="mochi.cfc.images.ImageGateway" method="uploadImage" returnvariable="uploadImageRet">
        <cfinvokeargument name="entitytypeid" value="1"/>
        <cfinvokeargument name="entityid" value="#form.entityid#"/>
        <cfinvokeargument name="description" value="#form.description#"/>
        <cfinvokeargument name="image" value="#form.image#"/>
    </cfinvoke>

	<cflocation url="update.cfm?SampleRequestID=#form.entityid#">    
    
<cfelseif IsDefined("form.video")>

	<cfinvoke  component="mochi.cfc.videos.VideoGateway" method="uploadVideo" returnvariable="uploadVideoRet">
        <cfinvokeargument name="entitytypeid" value="1"/>
        <cfinvokeargument name="entityid" value="#form.entityid#"/>
        <cfinvokeargument name="description" value="#form.description#"/>
        <cfinvokeargument name="video" value="#form.video#"/>
    </cfinvoke>

	<cflocation url="update.cfm?SampleRequestID=#form.entityid#">    
    
<cfelseif IsDefined("url.samplerequestid")>

	<cfinvoke  component="mochi.cfc.sampleRequests.SampleRequestGateway" method="getById" returnvariable="sampleRequest">
		<cfinvokeargument name="id" value="#url.samplerequestid#"/>
	</cfinvoke>

    <cfinvoke  component="mochi.cfc.styles.StyleGateway" method="getById" returnvariable="Style">
		<cfinvokeargument name="id" value="#sampleRequest.getStyleID()#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.colors.ColorGateway" method="getById" returnvariable="Color">
		<cfinvokeargument name="id" value="#sampleRequest.getColorID()#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.sizes.SizeGateway" method="getById" returnvariable="Size">
		<cfinvokeargument name="id" value="#sampleRequest.getSizeID()#"/>
	</cfinvoke>


	<cfinvoke  component="mochi.cfc.sampleProgress.SampleProgressGateway" method="getBySampleRequestId" returnvariable="SampleProgress">
		<cfinvokeargument name="id" value="#url.samplerequestid#"/>                
	</cfinvoke>
    
    <cfinvoke  component="mochi.cfc.patternStatus.PatternStatusGateway" method="getAllAsQuery"
 returnvariable="patternStatus">
	</cfinvoke>
    
    <cfinvoke  component="mochi.cfc.users.UserGateway" method="getAllAsQuery" returnvariable="users">
	</cfinvoke>

    <cfinvoke  component="mochi.cfc.beadingStatus.BeadingStatusGateway" method="getAllAsQuery" returnvariable="beadingStatus">
	</cfinvoke>

    <cfinvoke  component="mochi.cfc.fabricTrimStatus.FabricTrimStatusGateway" method="getAllAsQuery" returnvariable="fabricTrimStatus">
	</cfinvoke>

    <cfinvoke  component="mochi.cfc.counterSampleStatus.CounterSampleStatusGateway" method="getAllAsQuery" returnvariable="counterSampleStatus">
	</cfinvoke>


    
    

    <table width="333" border="1" align="left">

	<cfform method="post">	      
          <tr>
            <th width="149" scope="row">Reference # :</th>
            <td width="168"><cfoutput>#sampleRequest.getReferenceNumber()#</cfoutput></td>
          </tr>
          <tr>
            <th width="149" scope="row">Style # :</th>
            <td width="168"><cfoutput>#Style.getStyleName()#</cfoutput></td>
          </tr>
          <tr>
            <th width="149" scope="row">Color :</th>
            <td width="168"><cfoutput>#Color.getColorName()#</cfoutput></td>
          </tr>
          <tr>
            <th width="149" scope="row">Size :</th>
            <td width="168"><cfoutput>#Size.getSize()#</cfoutput></td>
          </tr>
          <tr>
            <th scope="row">Request Received :</th>
            <td>
            	<cfinput type="checkbox" name="RequestReceived" checked="#IIF(SampleProgress.RequestReceived EQ '', DE(0), DE(1))#" />
            </td>
          </tr>
          <tr>
            <th scope="row">Comments :</th>
            <td>
                    <cftextarea cols="50%" name="Comments" validateat="onSubmit"  value="#SampleProgress.Comments#"/>                      
            </td>
          </tr>
          <tr>
            <th scope="row">Plan Ship Date :</th>
            <td>
                    <cfinput type="datefield" name="PlanDate" id="PlanDate" validateat="onSubmit"
                             value="#DateFormat(SampleProgress.PlanDate, 'm/d/yyyy')#">
            </td>
          </tr>
          <tr>
            <th scope="row">Assigned Date :</th>
            <td>
                    <cfinput type="datefield" name="AssignedDate" id="AssignedDate" validateat="onSubmit"
                             value="#DateFormat(SampleProgress.AssignedDate, 'm/d/yyyy')#">
            </td>
          </tr>
          <tr>
            <th scope="row">Start Date :</th>
            <td>
                    <cfinput type="datefield" name="StartDate" id="StartDate" validateat="onSubmit"
                             value="#DateFormat(SampleProgress.StartDate, 'm/d/yyyy')#">
            </td>
          </tr>
          <tr>
            <th scope="row">Finished Date :</th>
            <td>
                    <cfinput type="datefield" name="FinishedDate" id="FinishedDate" validateat="onSubmit"
                             value="#DateFormat(SampleProgress.FinishedDate, 'm/d/yyyy')#">
            </td>
          </tr>
          <tr>
            <th scope="row">Approved Date :</th>
            <td>
                    <cfinput type="datefield" name="ApprovedDate" id="ApprovedDate" validateat="onSubmit"
                             value="#DateFormat(SampleProgress.ApprovedDate, 'm/d/yyyy')#">
            </td>
          </tr>
          <tr>
            <th scope="row">Pattern Status :</th>
            <td>
            <cfselect query="patternStatus" name="PatternStatusID" value="PatternStatusID" display="Status" selected="#SampleProgress.PatternStatusID#"/>
            </td>
          </tr>
          
          
          
    
			<!--- BEGIN put beading, counter sample, and fabric trim here --->
        
            <cfif sampleRequest.getBeading()>
                <tr>
                    <th>Beading Status :</th>
                    <td>
                        <cfselect query="beadingStatus" name="BeadingStatusID" value="BeadingStatusID" display="Status" selected="#SampleProgress.BeadingStatusID#"/>        
                    </td>
                </tr>
                <tr>
                	<th>Beading Updated By :</th>
                    <td>
                        <cfoutput>#SampleProgress.BeadingUpdatedBy#</cfoutput>                                        
                    </td>
                </tr>
                <tr>
                	<th>Beading Updated Date :</th>
                    <td>
                        <cfoutput>#DateFormat(SampleProgress.BeadingUpdatedDate, 'm/d/yyyy')#</cfoutput>                                        
                    </td>
                </tr>
                <tr>
                	<th>Beading Approved By :</th>
                    <td>
                        <cfoutput>#SampleProgress.BeadingUpdatedBy#</cfoutput>                                        
                    </td>
                </tr>
                <tr>
                	<th>Beading Approved Date :</th>
                    <td>
                        <cfoutput>#DateFormat(SampleProgress.BeadingApprovedDate, 'm/d/yyyy')#</cfoutput>                    
                    </td>
                </tr>
                
            </cfif>



            <cfif sampleRequest.getFabricTrim()>
                <tr>
                    <th>Fabric Trim Status :</th>
                    <td>
                        <cfselect query="fabricTrimStatus" name="FabricTrimStatusID" value="FabricTrimStatusID" display="Status" selected="#SampleProgress.FabricTrimStatusID#"/>        
                    </td>
                </tr>
                <tr>
                	<th>Fabric Trim Updated By :</th>
                    <td>
                        <cfoutput>#SampleProgress.FabricTrimUpdatedBy#</cfoutput>                                        
                    </td>
                </tr>
                <tr>
                	<th>Fabric Trim Updated Date :</th>
                    <td>
                        <cfoutput>#DateFormat(SampleProgress.FabricTrimUpdatedDate, 'm/d/yyyy')#</cfoutput>                                        
                    </td>
                </tr>
                <tr>
                	<th>Fabric Trim Approved By :</th>
                    <td>
                        <cfoutput>#SampleProgress.FabricTrimUpdatedBy#</cfoutput>                                        
                    </td>
                </tr>
                <tr>
                	<th>Fabric Trim Approved Date :</th>
                    <td>
                        <cfoutput>#DateFormat(SampleProgress.FabricTrimApprovedDate, 'm/d/yyyy')#</cfoutput>                    
                    </td>
                </tr>                
            </cfif>





            <cfif sampleRequest.getCounterSample()>
                <tr>
                    <th>Counter Sample Status :</th>
                    <td>
                        <cfselect query="counterSampleStatus" name="CounterSampleStatusID" value="CounterSampleStatusID" display="Status" selected="#SampleProgress.CounterSampleStatusID#"/>        
                    </td>
                </tr>
                <tr>
                	<th>Counter Sample Updated By :</th>
                    <td>
                        <cfoutput>#SampleProgress.CounterSampleUpdatedBy#</cfoutput>                                        
                    </td>
                </tr>
                <tr>
                	<th>Counter Sample Updated Date :</th>
                    <td>
                        <cfoutput>#DateFormat(SampleProgress.CounterSampleUpdatedDate, 'm/d/yyyy')#</cfoutput>                                        
                    </td>
                </tr>
                <tr>
                	<th>Counter Sample Approved By :</th>
                    <td>
                        <cfoutput>#SampleProgress.CounterSampleUpdatedBy#</cfoutput>                                        
                    </td>
                </tr>
                <tr>
                	<th>Counter Sample Approved Date :</th>
                    <td>
                        <cfoutput>#DateFormat(SampleProgress.CounterSampleApprovedDate, 'm/d/yyyy')#</cfoutput>                    
                    </td>
                </tr>                                                
            </cfif>
        
            <!--- END put beading, counter sample, and fabric trim here --->
          
          
          
          
          
          
          
          
          
          
          
          
          <tr>
          	<th>Created By:</th>
            <td><cfoutput>#SampleProgress.CreatedBy#</cfoutput></td>
          </tr>
          <tr>
          	<th>Created Date:</th>
            <td><cfoutput>#DateFormat(SampleProgress.CreatedDate, 'full')#</cfoutput></td>
          </tr>
          <tr>
          	<th>Last Updated By:</th>
            <td><cfoutput>#SampleProgress.LastMaintainedBy#</cfoutput></td>
          </tr>
          <tr>
          	<th>Last Updated Date:</th>
            <td><cfoutput>#DateFormat(SampleProgress.LastMaintainedDate, 'full')#</cfoutput></td>
          </tr>
          
          <tr>
            <td colspan="2" align="right"><cfinput type="submit" name="submit" value="Update Progress"></td>	
         </tr>
    
    	<cfif SampleProgress.SampleProgressID IS ''>
        	<cfset sampleProgressID=0>
        	<cfset createdby = "#GetAuthUser()#">
			<cfset createddate = "#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
        <cfelse>
        	<cfset sampleProgressID="#SampleProgress.SampleProgressID#">
        	<cfset createdby = "#SampleProgress.CreatedBy#">
            <cfset createddate = "#SampleProgress.CreatedDate#">    
		</cfif>
    
        <cfinput type="hidden" name="createdby" value="#createdby#">
        <cfinput type="hidden" name="createddate" value="#createddate#">
        <cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
        <cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
         
         <!--- style name information to update the production progress chart status --->
         <cfinput type="hidden" name="styleName" value="#Style.getStyleName()#">
          
        <cfinput type="hidden" name="SampleProgressID" value="#sampleProgressID#">  	
        <cfinput type="hidden" name="ReferenceNumber" value="#sampleRequest.getReferenceNumber()#">
        <cfinput type="hidden" name="samplerequestid" value="#url.samplerequestid#">

	</cfform>
    
    
	<cfform enctype="multipart/form-data">
    	<tr>
        	<th>Description :</th>           
			<td><cfinput type="text" name="description" required="yes" message="Image Description is required" validateat="onsubmit"></td>
    	</tr>    
    	<tr>
        	<th>Upload Image :</th>           
			<td><cfinput type="file" name="image"><cfinput type="submit" name="submit" value="Upload Image"></td>
    	</tr>    
		<cfinput type="hidden" name="entityid" value="#url.samplerequestid#">
	</cfform>
    
    
	<cfform enctype="multipart/form-data">
    	<tr>
        	<th>Description :</th>           
			<td><cfinput type="text" name="description" required="yes" message="Image Description is required" validateat="onsubmit"></td>
    	</tr>    
    	<tr>
        	<th>Upload Video :</th>           
			<td><cfinput type="file" name="video"><cfinput type="submit" name="submit" value="Upload Video"></td>
    	</tr>    
		<cfinput type="hidden" name="entityid" value="#url.samplerequestid#">
	</cfform>
        </table>

	<cfelse>

	<cflocation url="index.cfm">    
    
</cfif>
