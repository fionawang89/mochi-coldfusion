<cfif IsDefined("form.video")>

	<cfinvoke  component="mochi.cfc.videos.VideoGateway" method="uploadVideo" returnvariable="uploadVideoRet">
		<cfinvokeargument name="entitytypeid" value="1"/>
		<cfinvokeargument name="entityid" value="1"/>
		<cfinvokeargument name="description" value="this is a test"/>
		<cfinvokeargument name="video" value="#form.video#"/>
	</cfinvoke>


<cfelse>    
	<cfform enctype="multipart/form-data">
    	<tr>
        	<th>Description :</th>           
			<td><cfinput type="text" name="description" required="yes" message="Image Description is required" validateat="onsubmit"></td>
    	</tr>    
    	<tr>
        	<th>Upload Video :</th>           
			<td><cfinput type="file" name="video"><cfinput type="submit" name="submit" value="Upload"></td>
    	</tr>    
	</cfform>
</cfif>