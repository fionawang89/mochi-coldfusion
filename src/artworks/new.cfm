  <cfinclude template="../shared/header.cfm">

<cfif IsDefined("form.ArtworkName")>


	<cfquery name="qArtwork" datasource="#application.datasource#">
		SELECT ArtworkID
		FROM Artworks 
		WHERE ArtworkName = '#form.ArtworkName#'
	</cfquery>
	
    
	<cfif qArtwork.RecordCount IS 0>	


		<!--- save Artwork info in the database --->
        <cfinvoke  component="mochi.cfc.Artworks.Artwork" method="init" returnvariable="Artwork">
            <cfinvokeargument name="stValues" value="#form#"/>
        </cfinvoke>
                            
        <cfinvoke component="mochi.cfc.Artworks.ArtworkGateway" method="save" returnvariable="savedArtwork"> 
            <cfinvokeargument name="obj" value="#Artwork#"/>
        </cfinvoke>
         
         <cflocation url="update.cfm?Artworkid=#savedArtwork.getArtworkID()#">
         
	</cfif>
    
    
</cfif>


<table width="333" border="1" align="left">

<!--- Form for creating a new Artwork --->
    <cfform method="post"> 
          <tr>
            <th width="149" scope="row">Artwork Name :</th>
            <td width="168">
                    <cfinput required="true" type="text" name="Artworkname" id="Artworkname" validateat="onSubmit"
                             message="Artwork Name is required">
            </td>
          </tr>
          <tr>
            <th scope="row">Description :</th>
            <td>
                    <cfinput type="text" name="description" id="description">
            </td>
          </tr>
          <tr>
            <td colspan="2"><cfinput type="submit" name="submit" value="Create Artwork"></td>	
         </tr>
                                            
          
        <cfinput type="hidden" name="Artworkid" value="0">
        
    
        <!--- Timestamps --->
        <cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
        <cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
        <cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
        <cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    
            
    </cfform>
    
    
</table>
	
