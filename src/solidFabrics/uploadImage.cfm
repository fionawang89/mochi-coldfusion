<cfinclude template="../shared/header.cfm">

<cfif IsDefined("form.image")>

	<!--- Check if an image for this style already exist there should only be one image and delete it --->
    <cfquery name="qImage" datasource="#APPLICATION.DATASOURCE#">
    	DELETE 
        FROM Images
        WHERE EntityTypeID = 5
        AND   EntityID = #form.entityid#
    </cfquery>

	<!--- Save the image in the database --->
    <cfinvoke  component="mochi.cfc.images.ImageGateway" method="uploadImageForMaterials" returnvariable="fileUpload">
		<cfinvokeargument name="entityid" value="#form.entityid#"/>
		<cfinvokeargument name="description" value="#form.description#"/>
		<cfinvokeargument name="image" value="#form.image#"/>
	</cfinvoke>

	
    
    
	<cflocation url="index.cfm">

	

<cfelseif IsDefined("url.fabricrequestid")>

	
	
    <table>
    
        <cfform method="post" enctype="multipart/form-data">
            
            <tr>
                <th>Description :</th>           
                <td><cfinput type="text" name="description" validateat="onsubmit"></td>
            </tr>    
            <tr>
                <th>Upload Image :</th>           
                <td><cfinput type="file" name="image" required="yes" message="Image is required" validateat="onsubmit"><cfinput type="submit" name="submit" value="Upload Image"></td>
            </tr>    
            <cfinput type="hidden" name="entityid" value="#url.fabricrequestid#">
            
        </cfform>
    
    </table>



</cfif>