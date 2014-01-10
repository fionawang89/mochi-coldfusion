<cfinclude template="../shared/header.cfm"/>

<!--- This is the pattern  --->	
<cfif IsDefined("url.fittingid")>

        <cfif StructKeyExists(form, "pattern") and len(Trim(form.pattern))>
        
			<cfinvoke  component="mochi.cfc.fittings.FittingGateway" method="getById" returnvariable="fitting">
				<cfinvokeargument name="id" value="#url.fittingid#"/>
			</cfinvoke>

			
        
        	<cfinvoke  component="mochi.cfc.styles.StyleGateway" method="getById" returnvariable="Style">
				<cfinvokeargument name="id" value="#Fitting.getStyleID()#"/>
			</cfinvoke>
	
        
			<cfif NOT DirectoryExists("D:\ColdFusion8\wwwroot\mochi\uploads\#Style.getStyleName()#\patterns\")>
				<cfdirectory action="create" directory="D:\ColdFusion8\wwwroot\mochi\uploads\#Style.getStyleName()#\patterns\">
			</cfif>		
            <cffile action="upload" filefield="pattern" destination="D:\ColdFusion8\wwwroot\mochi\uploads\#Style.getStyleName()#\patterns\" 
				    result="fileUpload" nameconflict="makeunique">
            <cfif fileUpload.fileWasSaved>
						
                        <cfset patternInfo = StructNew()>


						<cfif #form.approved# IS 1>
							<cfset patternInfo.ApprovedBy = #GetAuthUser()#>
	                        <cfset patternInfo.ApprovedWhen = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
	                    <cfelse>
							<cfset patternInfo.ApprovedBy = "">
	                        <cfset patternInfo.ApprovedWhen = "">	                    	     							
						</cfif>	
						
						<!--- create structure information that needs to be saved in the database --->
                        <cfset patternInfo.patternid = 0> 
                        <cfset patternInfo.fittingid = #form.fittingid#> 
                        <cfset patternInfo.description = #form.description#> 
                        <cfset patternInfo.duedate = #form.duedate#> 
                        <cfset patternInfo.patternpriorityid = #form.patternpriorityid#> 
                        <cfset patternInfo.patternstatusid = #form.patternstatusid#> 
                        <cfset patternInfo.Approved = #form.Approved#> 
                        <cfset patternInfo.location = #fileupload.serverdirectory#>                     
                        <cfset patternInfo.url = #fileupload.serverdirectory#>                     
                        <cfset patternInfo.contenttype = #fileupload.contenttype#>                     
                        <cfset patternInfo.file = #fileupload.serverfile #>                     
                        <cfset patternInfo.filename = #fileupload.serverfilename#>                     
                        <cfset patternInfo.fileextension = #fileupload.serverfileext#>                     
                        <cfset patternInfo.filesize = #fileupload.filesize#>        				
                        <cfset patternInfo.createdby = #GetAuthUser()#>
                        <cfset patternInfo.createddate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>	
                        <cfset patternInfo.lastmaintainedby = #GetAuthUser()#>
                        <cfset patternInfo.lastmaintaineddate = #DateFormat(CreateODBCDate(Now()), 'm/d/yyyy')# & ' ' & #TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#>
                               
    
    					<cfinvoke  component="mochi.cfc.patterns.pattern" method="init" returnvariable="pattern">
							<cfinvokeargument name="stValues" value="#patternInfo#"/>                            
						</cfinvoke>
                        
						<cfinvoke  component="mochi.cfc.patterns.patternGateway" method="save">
							<cfinvokeargument name="obj" value="#pattern#"/>
						</cfinvoke>


                        
                        <cflocation url="../fittings/show.cfm?fittingid=#form.fittingid#">          
                             
            </cfif>
        <cfelseif IsDefined("url.fittingid")>
        
        	<cfinvoke  component="mochi.cfc.patternPriorities.PatternPriorityGateway" method="getAllAsQuery" returnvariable="patternPriorities">
			</cfinvoke>

        
			<cfinvoke  component="mochi.cfc.patternStatus.PatternStatusGateway" method="getAllAsQuery" returnvariable="patternStatus">
			</cfinvoke>

        
        	<cfform method="post" enctype="multipart/form-data">
                <table>
                	<tr>
                    	<th>Enter description of pattern :</th>
                        <td><cfinput type="text" name="description" required="true" message="Pattern comment is required"></td>
                    </tr>
                	<tr>
                    	<th>Due Date :</th>
                        <td><cfinput type="datefield" name="duedate"></td>
                    </tr>
                	<tr>
                    	<th>Pattern Priority :</th>
                        <td>
                        <cfselect query="patternPriorities" name="patternPriorityID" queryPosition="below" value="PatternPriorityID" display="PriorityCode">
                        	<option value="0">Select Priority
                        </cfselect>
                        </td>
                    </tr>
                	<tr>
                    	<th>Pattern Status :</th>
                        <td>
                        <cfselect query="patternStatus" name="PatternStatusID" queryPosition="below" value="PatternStatusID" display="Status">
                        	<option value="0">Select Pattern Status
                        </cfselect>
                        </td>
                    </tr>
                	<tr>
                    	<th>Approved :</th>
                        <td>
                        	<cfinput type="radio" Id="approved" name="approved" value="1">Approved
                            <cfinput type="radio" Id="approved" name="approved" value="0" Checked="true">Not Approved
                        </td>
                    </tr>
                	<tr>
                    	<th>upload pattern :</th>
                        <td><cfinput type="file" name="pattern" required="true" message="Pattern file is required"></td>
                    </tr>
                </table>

                    <cfinput type="submit" value="Send Pattern" name="Submit">
                    
                    <cfinput type="hidden" value="#url.fittingid#" name="fittingid">

                </cfform>
                
        <cfelse>
        
        	<cflocation url="../fitting/index.cfm">        
            
        </cfif>
</cfif>