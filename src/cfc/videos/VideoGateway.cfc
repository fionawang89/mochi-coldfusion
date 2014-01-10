<cfcomponent output="false">

	<cffunction name="getById" output="false" access="remote">
		<cfargument name="id" required="true" />
 		<cfreturn createObject("component", "VideoDAO").read(arguments.id)>
	</cffunction>


	<cffunction name="save" output="false" access="remote">
		<cfargument name="obj" required="true" />
 		<cfscript>
			if( obj.getVideoID() eq 0 )
			{
				return createObject("component", "VideoDAO").create(arguments.obj);
			} else {
				return createObject("component", "VideoDAO").update(arguments.obj);
			}
		</cfscript>
	</cffunction>


	<cffunction name="deleteById" output="false" access="remote">
		<cfargument name="id" required="true" />
		<cfset var obj = getById(arguments.id)>
		<cfset createObject("component", "VideoDAO").delete(obj)>
	</cffunction>



	<cffunction name="getAll" output="false" access="remote" returntype="mochi.cfc.videos.Video[]">
		<cfset var qRead="">
		<cfset var obj="">
		<cfset var ret=arrayNew(1)>

		<cfquery name="qRead" datasource="Mochi">
			select VideoID
			from Videos
		</cfquery>

		<cfloop query="qRead">
		<cfscript>
			obj = createObject("component", "VideoDAO").read(qRead.VideoID);
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
			from Videos
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
			from Videos
			where EntityTypeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.entityTypeid#" />
			and EntityID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.entityId#" />
		</cfquery>

		<cfreturn qRead>
	</cffunction>


	<cffunction name="uploadVideo" output="false" access="remote" returntype="string">
		<cfargument name="entitytypeid" type="Numeric" required="true">
		<cfargument name="entityid" type="Numeric" required="true">
		<cfargument name="description" type="String" required="true">
		<cfargument name="video" required="true">
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
            	<cfcase value="2">
                	
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
                
                <!--- if the Entity is not valid --->
                <cfdefaultcase>
                	<cfreturn "Invalid Entity Type">
                </cfdefaultcase>
                
		</cfswitch>

			<cfif NOT DirectoryExists("D:\ColdFusion8\wwwroot\mochi\uploads\#styleid#\videos\#arguments.entitytypeid#\")>
				<cfdirectory action="create" directory="D:\ColdFusion8\wwwroot\mochi\uploads\#styleid#\videos\#arguments.entitytypeid#\">
			</cfif>		
            <cffile action="upload" filefield="video" destination="D:\ColdFusion8\wwwroot\mochi\uploads\#styleid#\videos\#arguments.entitytypeid#\"
				    accept="application/octet-stream" result="fileUpload" nameconflict="overwrite">
            <cfif fileUpload.fileWasSaved>
						
						<!--- create structure information that needs to be saved in the database --->
                        <cfset videoInfo = StructNew()>
                        <cfset videoInfo.videoid = 0> 
                        <cfset videoInfo.entitytypeid = #arguments.entitytypeid#> 
                        <cfset videoInfo.entityid = #arguments.entityid#> 
                        <cfset videoInfo.description = #arguments.description#> 
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
                        
						<cfscript>
							this.save(video);
						</cfscript>
                        
                        <cfreturn "Video was uploaded">            
			<cfelse>
                        <cfreturn "Video upload Failed">			                             
            </cfif>

	</cffunction>


</cfcomponent>