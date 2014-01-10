<!--- this is the images upload file --->

<cfif IsDefined("url.entityid") AND IsDefined("url.entitytypeid")>

        <cfif StructKeyExists(form, "image") and len(Trim(form.image))>
        	
            <cfswitch expression="#form.entitypeid#">
            	
                <!--- if the Entity is a Sample --->
            	<cfcase value="1">
                	
                    <cfinvoke  component="mochi.cfc.sampleRequests.SampleRequestGateway" method="getById" returnvariable="SampleRequest">
							<cfinvokeargument name="id" value="#form.entityid#"/>
					</cfinvoke>

					<cfset styleid = #SampleRequest.getStyleID()#>
                    
                </cfcase>
                
                <!--- if the Entity is a Style --->
            	<cfcase value="2">
                	
					<cfinvoke  component="mochi.cfc.styles.StyleGateway" method="getById" returnvariable="Style">
						<cfinvokeargument name="id" value="#form.entityid#"/>
					</cfinvoke>

					<cfset styleid = #Style.getStyleID()#>
                    
                </cfcase>
                
                <!--- if the Entity is a Fitting --->
            	<cfcase value="3">
                	
                    <cfinvoke  component="mochi.fx.fittings.FittingGateway" method="getById" returnvariable="Fitting">
						<cfinvokeargument name="id" value="#form.entityid#"/>
					</cfinvoke>

					<cfset styleid = #Fitting.getStyleID()#>
                    
                </cfcase>
                
                <!--- if the Entity is not valid --->
                <cfdefaultcase>
                	<cflocation url="../index.cfm">
                </cfdefaultcase>
                
            </cfswitch>
            
        
        	<!--- check if the upload destination directory exist if not create it --->
			<cfif NOT DirectoryExists("D:\ColdFusion8\wwwroot\mochi\uploads\#styleid#\#form.entitytypeid#\images\")>
				<cfdirectory action="create" directory="D:\ColdFusion8\wwwroot\mochi\uploads\#styleid#\#form.entitytypeid#\images\">
			</cfif>
            
            
            <cffile action="upload" filefield="image" result="fileUpload" nameconflict="overwrite"
					destination="D:\ColdFusion8\wwwroot\mochi\uploads\#styleid#\#form.entitytypeid#\images\">
            <cfif fileUpload.fileWasSaved>
                <cfif IsImageFile("#fileUpload.serverdirectory & '\' & fileUpload.serverfile#")>
                    <cfimage action="read" source="#fileUpload.serverdirectory#\#fileUpload.serverfile#" name="uploadedImage">            
                    <cfimage action="read" source="#fileUpload.serverdirectory#\#fileUpload.serverfile#" name="thumbnail">
                    <cfif ImageGetHeight(thumbnail) gt 800 or ImageGetHeight(thumbnail) gt 800>
                        <cffile action="delete" file="#fileUpload.serverDirectory#/#fileUpload.serverFile#">
                        <cfoutput>
                            <p>
                            The image you uploaded was too large. It must be less than 800 pixels wide and 
                            800 pixels high. Your image was #ImageGetWidth(thumbnail)# pixels wide and #ImageGetHeight(thumbnail)# 
                            pixels high.
                            </p>
                        </cfoutput>
                    <cfelse>
                        <cfset ImageScaleToFit(thumbnail, 150, 150, "bilinear")>
                        <cfset newImageName = fileUpload.serverDirectory & "/" &
                                fileUpload.serverFilename & "_thumbnail." & 
                                fileUpload.serverFileExt>
                        <cfimage source="#thumbnail#" action="write" destination="#newImageName#" overwrite="yes">
				
						
						<!--- create structure information that needs to be saved in the database --->
                        <cfset imageInfo = StructNew()>
                        <cfset imageInfo.imageid = 0> 
                        <cfset imageInfo.entitytypeid = #form.entitytypeid#> 
                        <cfset imageInfo.entityid = #form.entityid#> 
                        <cfset imageInfo.description = #form.description#> 
                        <cfset imageInfo.location = #fileupload.serverdirectory#>                     
                        <cfset imageInfo.url = #fileupload.serverdirectory#>                     
                        <cfset imageInfo.contenttype = #fileupload.contenttype#>                     
                        <cfset imageInfo.file = #fileupload.serverfile #>                     
                        <cfset imageInfo.filename = #fileupload.serverfilename#>                     
                        <cfset imageInfo.fileextension = #fileupload.serverfileext#>                     
                        <cfset imageInfo.height = #uploadedImage.height#>                     
                        <cfset imageInfo.width = #uploadedImage.width#>      
                        <cfset imageInfo.filesize = #fileupload.filesize#>        
                        <cfset imageInfo.thumbnailfile = fileUpload.serverFilename & "_thumbnail." & fileUpload.serverFileExt>
                        <cfset imageInfo.thumbnailfilename = fileUpload.serverFilename & "_thumbnail">
                        <cfset imageInfo.thumbnailheight = #thumbnail.height#>
                        <cfset imageInfo.thumbnailwidth = #thumbnail.width#>
                        <cfset imageInfo.createdby = #GetAuthUser()#>
						<cfset imageInfo.createddate=#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
                        <cfset imageInfo.lastmaintainedby = #GetAuthUser()#>
						<cfset imageInfo.lastmaintaineddate=#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>

						<cfinvoke  component="mochi.cfc.images.Image" method="init" returnvariable="Image">
							<cfinvokeargument name="stValues" value="#imageInfo#"/>
                        </cfinvoke>

				                               
					    <cfinvoke  component="mochi.cfc.images.ImageGateway" method="save">
							<cfinvokeargument name="obj" value="#Image#"/>
						</cfinvoke>
                        
                        <cflocation url="../fittings/show.cfm?fittingid=#form.fittingid#">            
                              
                    </cfif>
                <cfelse>
                    <cffile action="delete" file="#fileUpload.serverDirectory#/#fileUpload.serverFile#">
                    <cfoutput>
                        <p>
                        The file you uploaded, #fileUpload.clientFile#, was not a valid image.
                        </p>
                    </cfoutput>
                </cfif>
            </cfif>
        <cfelse>

                <cfform method="post" enctype="multipart/form-data">
                	<table>
                    	<tr>
		                    <th>Enter description of image :</th>
                            <td><cfinput type="text" name="description" required="true" message="Image description is required"></td>
                         <tr>   
                        <tr>
                        	<th>Please upload an image :</th>
                            <td><cfinput type="file" name="image" required="true" message="Image File is required" validateat="onsubmit"></td>
                        </tr>
                    </table>
                    
                    <cfinput type="submit" value="Send Image" name="Submit">
                    <cfinput type="hidden" value="#url.entityid#" name="entityid">
                    <cfinput type="hidden" value="#url.entitytypeid#" name="entitytypeid">
                </cfform>
        </cfif>
	</cfif>
