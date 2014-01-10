<!--- This is the video  --->	
<cfif IsDefined("url.fittingid")>

        <cfif StructKeyExists(form, "video") and len(Trim(form.video))>
        
			<cfinvoke  component="mochi.cfc.fittings.FittingGateway" method="getById" returnvariable="fitting">
				<cfinvokeargument name="id" value="#url.fittingid#"/>
			</cfinvoke>

			
        
        	<cfinvoke  component="mochi.cfc.styles.StyleGateway" method="getById" returnvariable="Style">
				<cfinvokeargument name="id" value="#Fitting.getStyleID()#"/>
			</cfinvoke>
	
        
			<cfif NOT DirectoryExists("D:\ColdFusion8\wwwroot\mochi\uploads\#Style.getStyleName()#\videos\")>
				<cfdirectory action="create" directory="D:\ColdFusion8\wwwroot\mochi\uploads\#Style.getStyleName()#\videos\">
			</cfif>		
            <cffile action="upload" filefield="video" destination="D:\ColdFusion8\wwwroot\mochi\uploads\#Style.getStyleName()#\videos\"
					result="fileUpload" nameconflict="overwrite">
            <cfif fileUpload.fileWasSaved>
						
						<!--- create structure information that needs to be saved in the database --->
                        <cfset videoInfo = StructNew()>
                        <cfset videoInfo.videoid = 0> 
                        <cfset videoInfo.fittingid = #form.fittingid#> 
                        <cfset videoInfo.description = #form.description#> 
                        <cfset videoInfo.location = #fileupload.serverdirectory#>                     
                        <cfset videoInfo.url = #fileupload.serverdirectory#>                     
                        <cfset videoInfo.contenttype = #fileupload.contenttype#>                     
                        <cfset videoInfo.file = #fileupload.serverfile #>                     
                        <cfset videoInfo.filename = #fileupload.serverfilename#>                     
                        <cfset videoInfo.fileextension = #fileupload.serverfileext#>                     
                        <cfset videoInfo.filesize = #fileupload.filesize#>        				
                        <cfset videoInfo.createdby = #GetAuthUser()#>
                        <cfset videoInfo.createddate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>	
                        <cfset videoInfo.lastmaintainedby = #GetAuthUser()#>
                        <cfset videoInfo.lastmaintaineddate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
                               
    
    					<cfinvoke  component="mochi.cfc.videos.Video" method="init" returnvariable="video">
							<cfinvokeargument name="stValues" value="#videoInfo#"/>                            
						</cfinvoke>
                        
						<cfinvoke  component="mochi.cfc.videos.VideoGateway" method="save">
							<cfinvokeargument name="obj" value="#video#"/>
						</cfinvoke>


                        
                        <cflocation url="../fittings/show.cfm?fittingid=#form.fittingid#">            
                             
            </cfif>
        <cfelseif IsDefined("url.fittingid")>
        
                <cfform method="post" enctype="multipart/form-data">
					<cfformgroup type="vbox">
                    	<cfformitem type="text">
		                    Enter description of video:                        	
                        </cfformitem>
                        <cfinput type="text" name="description" required="true" message="Video description is required">
                    </cfformgroup>
					 <cfformgroup type="vbox">
                     	<cfformitem type="text">
		                    Please upload an video:                        
                        </cfformitem>
                         <cfinput type="file" name="video" required="true" message="Video file is required">
                     </cfformgroup>
                    <cfinput type="submit" value="Send video" name="Submit">
                    <cfinput type="hidden" value="#url.fittingid#" name="fittingid">
                </cfform>
                
        <cfelse>
        
        	<cflocation url="../fitting/index.cfm">        
            
        </cfif>
</cfif>