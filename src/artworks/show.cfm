<cfinclude template="../shared/header.cfm">

<cfif IsDefined("url.Artworkid")>

 <cfquery name="Artwork" datasource="#APPLICATION.DATASOURCE#">
    SELECT Artworks.ArtworkID, Artworks.ArtworkName, Artworks.Description, Images.ThumbnailFile, Artworks.CreatedBy, Artworks.CreatedDate, Artworks.LastMaintainedBy, Artworks.LastMaintainedDate
    FROM Artworks LEFT JOIN Images ON (Artworks.EntityTypeID = Images.EntityTypeID) AND (Artworks.ArtworkID = Images.EntityID)
	WHERE Artworks.ArtworkID = #url.Artworkid#
 </cfquery>
 


 <table width="333" border="1" align="left">
  <cfoutput>	
  <tr>  
    <th width="149" scope="row">Image :</th>
    <td width="168"><img src="/mochi/uploads/artworks/#Artwork.ArtworkID#/images/#Artwork.ThumbnailFile#" /></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Artwork Name :</th>
    <td width="168">#Artwork.ArtworkName#</td>
  </tr>
  <tr>
    <th scope="row">Description :</th>
    <td>#Artwork.Description#</td>
  </tr>
  <tr>
	<th scope="row">Created By :</th>
	<td>#Artwork.CreatedBy#</td>
  </tr>
  <tr>
	<th scope="row">Created Date :</th>
	<td>#Artwork.CreatedDate#</td>
  </tr>
  <tr>
	<th scope="row">Last Maintained By :</th>
    <td>#Artwork.LastMaintainedBy#</td>
  </tr>
  <tr>
	<th scope="row">Last Maintained Date :</th>
	<td>#Artwork.LastMaintainedDate#</td>
  </tr>
  </cfoutput>
</table>
</cfif>