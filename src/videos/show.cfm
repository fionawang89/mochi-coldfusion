<cfif IsDefined("url.videoid") AND IsDefined("url.entityid")>

	<cfinvoke  component="mochi.cfc.videos.VideoGateway" method="getById" returnvariable="Video">
		<cfinvokeargument name="id" value="#url.videoid#"/>
	</cfinvoke>

	

    <cfswitch expression="#Video.getEntityTypeid()#">
        <!--- if the Entity is a Sample --->
        <cfcase value="1">
                        
            <cfinvoke  component="mochi.cfc.sampleRequests.SampleRequestGateway" method="getById" returnvariable="SampleRequest">
                <cfinvokeargument name="id" value="#url.entityid#"/>
            </cfinvoke>
    
            <cfset styleid = #SampleRequest.getStyleID()#>
                        
        </cfcase>
                    
        <!--- if the Entity is a Style --->
        <cfcase value="2">
                        
            <cfinvoke  component="mochi.cfc.styles.StyleGateway" method="getById" returnvariable="Style">
                <cfinvokeargument name="id" value="#url.entityid#"/>
            </cfinvoke>
    
            <cfset styleid = #Style.getStyleID()#>
                        
        </cfcase>
                    
        <!--- if the Entity is a Fitting --->
        <cfcase value="3">
                        
            <cfinvoke  component="mochi.fx.fittings.FittingGateway" method="getById" returnvariable="Fitting">
                <cfinvokeargument name="id" value="#url.entityid#"/>
            </cfinvoke>
    
            <cfset styleid = #Fitting.getStyleID()#>
                        
        </cfcase>
    
                    <!--- if the Entity is not valid --->
        <cfdefaultcase>
            <cfreturn "Invalid Entity Type">
        </cfdefaultcase>
                    
    </cfswitch>


	<cfoutput>
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Untitled Document</title>
	<script type="text/javascript" src="../assets/swfobject.js"></script>
	<script type="text/javascript">
		var flashvars = { config: "{videoFile: '../uploads/#styleid#/videos/#Video.getEntityTypeID()#/#Video.getFile()#'}"};
		swfobject.embedSWF("../assets/FlowPlayerLight.swf", "myContent", "640", "480", "9.0.0", "../assets/expressInstall.swf", flashvars);
	</script>
	</head>
	<body>
			<h1>#Video.getDescription()#</h1>
			<div id="myContent">
				<h1>Video Not Found</h1>
				<p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" /></a></p>
			</div>
	
	</body>
	</html>
	</cfoutput>
</cfif>