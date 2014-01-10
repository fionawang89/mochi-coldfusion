<cfinclude template="../shared/header.cfm">

<cfif IsDefined("form.Artworkid")>



	<!--- save Artwork in the database --->
	<cfinvoke  component="mochi.cfc.Artworks.Artwork" method="init" returnvariable="Artwork">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>
                        
	<cfinvoke component="mochi.cfc.Artworks.ArtworkGateway" method="save" returnvariable="savedArtwork"> 
		<cfinvokeargument name="obj" value="#Artwork#"/>
	</cfinvoke>
                        
	<cflocation url="show.cfm?Artworkid=#form.Artworkid#">

<cfelseif IsDefined("form.image")>
    
	<!--- Check if an image for this Artwork already exist there should only be one image and delete it --->
    <cfquery name="qImage" datasource="#APPLICATION.DATASOURCE#">
    	DELETE 
        FROM Images
        WHERE EntityTypeID = 6
        AND   EntityID = #form.entityid#
    </cfquery>

	<!--- Save the image in the database --->
    <cfinvoke  component="mochi.cfc.images.ImageGateway" method="uploadImageForArtworks">
        <cfinvokeargument name="entityid" value="#form.entityid#"/>
        <cfinvokeargument name="description" value="#form.description#"/>
        <cfinvokeargument name="image" value="#form.image#"/>
	</cfinvoke>
    
	<cflocation url="show.cfm?Artworkid=#form.entityid#">
    
<cfelseif IsDefined("url.Artworkid")>

	<cfinvoke component="mochi.cfc.Artworks.ArtworkGateway" method="getById" returnvariable="Artwork"> 
		<cfinvokeargument name="id" value="#url.Artworkid#"/>
	</cfinvoke>

<table width="333" border="1" align="left">


    <cfform method="post" enctype="multipart/form-data">
    
      <tr>
        <th width="149" scope="row">Artwork Name :</th>
        <td width="168"><cfinput name="Artworkname" type="text" required="yes" message="Artwork name is required" 
                         value="#Artwork.getArtworkName()#">
        </td>
      </tr>
      <tr>
        <th scope="row">Description :</th>
        <td><cfinput type="text" name="description" id="description"
                         value="#Artwork.getDescription()#"></td>
      </tr>
      <tr>
        <td colspan="2" align="right"><cfinput type="submit" name="submit" value="Update Artwork"></td>
      </tr>
      
    
        <cfinput type="hidden" name="Artworkid" value="#Artwork.getArtworkID()#">
    
        <!--- Timestamps --->
        <cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
        <cfinput type="hidden" name="createddate" value="#Artwork.getCreatedDate()#">
        <cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
        <cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    
    
    </cfform>

	<cfform method="post" enctype="multipart/form-data">
		
        <tr>
			<th>Description :</th>           
			<td><cfinput type="text" required="yes" message="Description is required" name="description" validateat="onsubmit"></td>
		</tr>    
		<tr>
			<th>Upload Image :</th>           
			<td><cfinput type="file" name="image" required="yes" message="Image is required" validateat="onsubmit"><cfinput type="submit" name="submit" value="Upload Image"></td>
		</tr>    
		<cfinput type="hidden" name="entityid" value="#url.Artworkid#">
        
	</cfform>
	<tr>
    	<td colspan="2"><a href="new.cfm">Create New Artwork</a></td>
    </tr>
</table>

<cfelse>

	<cflocation url="index.cfm">    

</cfif>
