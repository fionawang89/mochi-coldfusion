<cfcomponent output="false">

	<cffunction name="getById" output="false" access="remote">
		<cfargument name="id" required="true" />
 		<cfreturn createObject("component", "ImageDAO").read(arguments.id)>
	</cffunction>

	<cffunction name="getByEntity" output="false" access="remote">
		<cfargument name="entitytypeid" required="true" />
		<cfargument name="entityid" required="true" />
		
		<cfset var qRead="">

		<cfquery name="qRead" datasource="Mochi">
			select ImageID 
			from Images
			where EntityTypeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.entityTypeid#" />
			and EntityID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.entityId#" />
		</cfquery>
		
		<cfif qRead.RECORDCOUNT IS 0>			
			<cfset imageid = 0>
		<cfelse>
			<cfset imageid = qRead.ImageID>			
		</cfif>			
		
 		<cfreturn createObject("component", "ImageDAO").read(imageid)>

	</cffunction>


	<cffunction name="save" output="false" access="remote">
		<cfargument name="obj" required="true" />
 		<cfscript>
			if( obj.getImageID() eq 0 )
			{
				return createObject("component", "ImageDAO").create(arguments.obj);
			} else {
				return createObject("component", "ImageDAO").update(arguments.obj);
			}
		</cfscript>
	</cffunction>


	<cffunction name="deleteById" output="false" access="remote">
		<cfargument name="id" required="true" />
		<cfset var obj = getById(arguments.id)>
		<cfset createObject("component", "ImageDAO").delete(obj)>
	</cffunction>



	<cffunction name="getAll" output="false" access="remote" returntype="mochi.cfc.images.Image[]">
		<cfset var qRead="">
		<cfset var obj="">
		<cfset var ret=arrayNew(1)>

		<cfquery name="qRead" datasource="Mochi">
			select ImageID
			from Images
		</cfquery>

		<cfloop query="qRead">
		<cfscript>
			obj = createObject("component", "ImageDAO").read(qRead.ImageID);
			ArrayAppend(ret, obj);
		</cfscript>
		</cfloop>
		<cfreturn ret>
	</cffunction>



	<cffunction name="getAllAsQuery" output="false" access="remote" returntype="query">
		<cfargument name="fieldlist" default="*" hint="List of columns to be returned in the query.">

		<cfset var qRead="">

		<cfquery name="qRead" datasource="Mochi">
			select #arguments.fieldList#
			from Images
		</cfquery>

		<cfreturn qRead>
	</cffunction>


	<cffunction name="getAllAsQueryByEntity" output="false" access="remote" returntype="query">
		<cfargument name="entityTypeid" required="true">
		<cfargument name="entityId" required="true">
		<cfargument name="fieldlist" default="*" hint="List of columns to be returned in the query.">

		<cfset var qRead="">

		<cfquery name="qRead" datasource="Mochi">
			select #arguments.fieldList#
			from Images
			where EntityTypeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.entityTypeid#" />
			and EntityID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.entityId#" />
		</cfquery>

		<cfreturn qRead>
	</cffunction>


	<cffunction name="uploadImage" output="false" access="remote" returntype="string">
		<cfargument name="entitytypeid" type="Numeric" required="true">
		<cfargument name="entityid" type="Numeric" required="true">
		<cfargument name="description" type="String" required="true">
		<cfargument name="image" required="true">
		
		<!--- Check the Entity Type here --->
		<cfswitch expression="#arguments.entitytypeid#">
            	
                <!--- if the Entity is a Sample --->
        		<cfcase value="1">
                	
                    <cfinvoke  component="mochi.cfc.sampleRequests.SampleRequestGateway" method="getById" returnvariable="SampleRequest">
							<cfinvokeargument name="id" value="#arguments.entityid#"/>
					</cfinvoke>

					<cfset styleid = #SampleRequest.getStyleID()#>
                    
                </cfcase>
                
                <!--- if the Entity is a Style --->
            	<cfcase value="2;7" delimiters=";">
                	
					<cfinvoke  component="mochi.cfc.styles.StyleGateway" method="getById" returnvariable="Style">
						<cfinvokeargument name="id" value="#arguments.entityid#"/>
					</cfinvoke>

					<cfset styleid = #Style.getStyleID()#>
                    
                </cfcase>
                
                <!--- if the Entity is a Fitting --->
            	<cfcase value="3">
                	
                    <cfinvoke  component="mochi.fx.fittings.FittingGateway" method="getById" returnvariable="Fitting">
						<cfinvokeargument name="id" value="#arguments.entityid#"/>
					</cfinvoke>

					<cfset styleid = #Fitting.getStyleID()#>
                    
                </cfcase>
                
        		<cfcase value="4">
                	
                    <cfinvoke  component="mochi.cfc.sampleRequests.SampleRequestGateway" method="getById" returnvariable="SampleRequest">
							<cfinvokeargument name="id" value="#arguments.entityid#"/>
					</cfinvoke>

					<cfset styleid = #SampleRequest.getStyleID()#>
                    
                </cfcase>
				
                <!--- if the Entity is not valid --->
                <cfdefaultcase>
                	<cfreturn "Invalid Entity Type">
                </cfdefaultcase>
                
		</cfswitch>
		
		        
        <!--- check if the upload destination directory exist if not create it --->
		<cfif NOT DirectoryExists("#ExpandPath('/mochi')#\uploads\#styleid#\images\#arguments.entitytypeid#\")>
			<cfdirectory action="create" directory="#ExpandPath('/mochi')#\uploads\#styleid#\images\#arguments.entitytypeid#\">
		</cfif>
            
            
        <cffile action="upload" filefield="image" result="fileUpload" nameconflict="overwrite"
			    accept="image/jpeg, image/*" destination="#ExpandPath('/mochi')#\uploads\#styleid#\images\#arguments.entitytypeid#\">
				
        <cfif fileUpload.fileWasSaved>
        	<cfif IsImageFile("#fileUpload.serverdirectory & '\' & fileUpload.serverfile#")>
        		<cfimage action="read" source="#fileUpload.serverdirectory#\#fileUpload.serverfile#" name="uploadedImage">            
                <cfimage action="read" source="#fileUpload.serverdirectory#\#fileUpload.serverfile#" name="thumbnail">
                <cfif ImageGetHeight(thumbnail) gt 800 or ImageGetHeight(thumbnail) gt 800>
                <cffile action="delete" file="#fileUpload.serverDirectory#/#fileUpload.serverFile#">
                <cfreturn   "The image you uploaded was too large. It must be less than 800 pixels wide and 
                            800 pixels high. Your image was #ImageGetWidth(thumbnail)# pixels wide and #ImageGetHeight(thumbnail)# 
                            pixels high.">
			<cfelse>
            	<cfset ImageScaleToFit(thumbnail, 150, 150, "bilinear")>
                <cfset newImageName = fileUpload.serverDirectory & "/" &
                fileUpload.serverFilename & "_thumbnail." & 
                fileUpload.serverFileExt>
                <cfimage source="#thumbnail#" action="write" destination="#newImageName#" overwrite="yes">
				
						
					<!--- create structure information that needs to be saved in the database --->
                    <cfset imageInfo = StructNew()>
                    <cfset imageInfo.imageid = 0> 
                    <cfset imageInfo.entitytypeid = #arguments.entitytypeid#> 
                    <cfset imageInfo.entityid = #arguments.entityid#> 
                    <cfset imageInfo.description = #arguments.description#> 
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

				    <cfscript>
				    	this.save(Image);
				    </cfscript>                           
                        
                    <cfreturn "Image uploaded">          
                 </cfif>
			<cfelse>
				<cffile action="delete" file="#fileUpload.serverDirectory#/#fileUpload.serverFile#">
                <cfreturn "The file you uploaded, #fileUpload.clientFile#, was not a valid image.">
            </cfif>
			
		</cfif>
		

	</cffunction>



	<cffunction name="uploadImageForMaterials" output="false" access="remote" returntype="string">
		<cfargument name="entityid" type="Numeric" required="true">
		<cfargument name="description" type="String" required="true">
		<cfargument name="image" required="true">
		
		
		        
        <!--- check if the upload destination directory exist if not create it --->
		<cfif NOT DirectoryExists("#ExpandPath('/mochi')#\uploads\materials\#entityid#\images\")>
			<cfdirectory action="create" directory="#ExpandPath('/mochi')#\uploads\materials\#entityid#\images\">
		</cfif>
            
        <cftry>    
	        <cffile action="upload" filefield="image" result="fileUpload" nameconflict="overwrite"
				    accept="image/jpeg, image/*" destination="#ExpandPath('/mochi')#\uploads\materials\#entityid#\images\">
		<cfcatch>
					<cfreturn "The file you uploaded was not a valid image.">			
		</cfcatch>		    
		</cftry>

			
        <cfif fileUpload.fileWasSaved>		
        	<cfif IsImageFile("#fileUpload.serverdirectory & '\' & fileUpload.serverfile#")>
	            <cfimage action="read" source="#fileUpload.serverdirectory#\#fileUpload.serverfile#" name="uploadedImage">            
	            <cfimage action="read" source="#fileUpload.serverdirectory#\#fileUpload.serverfile#" name="thumbnail">
	            <cfif ImageGetHeight(thumbnail) gt 800 or ImageGetHeight(thumbnail) gt 800>
	                <cffile action="delete" file="#fileUpload.serverDirectory#/#fileUpload.serverFile#">
	                <cfreturn   "The image you uploaded was too large. It must be less than 800 pixels wide and 
	                        800 pixels high. Your image was #ImageGetWidth(thumbnail)# pixels wide and #ImageGetHeight(thumbnail)# 
	                        pixels high.">
	            <cfelse>
	                <cfset ImageScaleToFit(thumbnail, 100, 100, "bilinear")>
	                <cfset newImageName = fileUpload.serverDirectory & "/" &
	                fileUpload.serverFilename & "_thumbnail." & 
	                fileUpload.serverFileExt>
	                <cfimage source="#thumbnail#" action="write" destination="#newImageName#" overwrite="yes">
	            
	                    
	                <!--- create structure information that needs to be saved in the database --->
	                <cfset imageInfo = StructNew()>
	                <cfset imageInfo.imageid = 0> 
	                <cfset imageInfo.entitytypeid = 5> 
	                <cfset imageInfo.entityid = #arguments.entityid#> 
	                <cfset imageInfo.description = #arguments.description#> 
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
	
	                <cfscript>
	                    this.save(Image);
	                </cfscript>                           
	                    
	                <cfreturn "Image uploaded">    
	        	</cfif>              
			<cfelse>
				<cffile action="delete" file="#fileUpload.serverDirectory#/#fileUpload.serverFile#">
                <cfreturn "The file you uploaded, #fileUpload.clientFile#, was not a valid image.">
             </cfif>			
		</cfif>		
	</cffunction>
	

	<cffunction name="uploadImageForArtworks" output="false" access="remote" returntype="string">
		<cfargument name="entityid" type="Numeric" required="true">
		<cfargument name="description" type="String" required="true">
		<cfargument name="image" required="true">
		
		
		        
        <!--- check if the upload destination directory exist if not create it --->
		<cfif NOT DirectoryExists("#ExpandPath('/mochi')#\uploads\artworks\#entityid#\images\")>
			<cfdirectory action="create" directory="#ExpandPath('/mochi')#\uploads\artworks\#entityid#\images\">
		</cfif>
            
            
        <cffile action="upload" filefield="image" result="fileUpload" nameconflict="overwrite"
			    accept="image/jpeg, image/*" destination="#ExpandPath('/mochi')#\uploads\artworks\#entityid#\images\">
				
        <cfif fileUpload.fileWasSaved>
		
		
        	<cfif IsImageFile("#fileUpload.serverdirectory & '\' & fileUpload.serverfile#")>
        		<cfimage action="read" source="#fileUpload.serverdirectory#\#fileUpload.serverfile#" name="uploadedImage">            
                <cfimage action="read" source="#fileUpload.serverdirectory#\#fileUpload.serverfile#" name="thumbnail">
				
                <cfif ImageGetHeight(thumbnail) gt 800 or ImageGetHeight(thumbnail) gt 800>
	                <cffile action="delete" file="#fileUpload.serverDirectory#/#fileUpload.serverFile#">
	                <cfreturn   "The image you uploaded was too large. It must be less than 800 pixels wide and 
	                            800 pixels high. Your image was #ImageGetWidth(thumbnail)# pixels wide and #ImageGetHeight(thumbnail)# 
	                            pixels high.">
				<cfelse>
	            	<cfset ImageScaleToFit(thumbnail, 100, 100, "bilinear")>
	                <cfset newImageName = fileUpload.serverDirectory & "/" &
	                fileUpload.serverFilename & "_thumbnail." & 
	                fileUpload.serverFileExt>
	                <cfimage source="#thumbnail#" action="write" destination="#newImageName#" overwrite="yes">
					
							
						<!--- create structure information that needs to be saved in the database --->
	                    <cfset imageInfo = StructNew()>
	                    <cfset imageInfo.imageid = 0> 
	                    <cfset imageInfo.entitytypeid = 6> 
	                    <cfset imageInfo.entityid = #arguments.entityid#> 
	                    <cfset imageInfo.description = #arguments.description#> 
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
	
					    <cfscript>
					    	this.save(Image);
					    </cfscript>                           
	                        
	                    <cfreturn "Image uploaded">          
	                 </cfif>
	                 
			<cfelse>
				<cffile action="delete" file="#fileUpload.serverDirectory#/#fileUpload.serverFile#">
                <cfreturn "The file you uploaded, #fileUpload.clientFile#, was not a valid image.">
            </cfif>
			
		</cfif>
		

	</cffunction>


</cfcomponent>