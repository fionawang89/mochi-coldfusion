<cfinclude template="../shared/header.cfm">

<cfif IsDefined("url.fabricrequestid")>

 
	<cfinvoke  component="mochi.cfc.fabricRequests.FabricRequestGateway" method="getById" returnvariable="FabricRequest">
		<cfinvokeargument name="id" value="#url.fabricrequestid#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.materials.MaterialGateway" method="getById" returnvariable="Fabric">
		<cfinvokeargument name="id" value="#FabricRequest.getFabricID()#"/>
	</cfinvoke>
    
    <cfinvoke  component="mochi.cfc.colors.ColorGateway" method="getById" returnvariable="Color">
		<cfinvokeargument name="id" value="#FabricRequest.getColorID()#"/>
	</cfinvoke>

    
    <cfinvoke  component="mochi.cfc.fabricRequestStatus.FabricRequestStatusGateway" method="getById" returnvariable="FabricRequestStatus">
		<cfinvokeargument name="id" value="#FabricRequest.getFabricRequestID()#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.fabricRequestTypes.FabricRequestTypeGateway" method="getById" returnvariable="FabricRequestType">
		<cfinvokeargument name="id" value="#FabricRequest.getFabricRequestTypeID()#"/>
	</cfinvoke>
    
    <cfinvoke  component="mochi.cfc.MaterialCategories.MaterialCategoryGateway" method="getById" returnvariable="FabricCategory">
	<cfinvokeargument name="id" value="#FabricRequest.getFabricCategoryID()#"/>
</cfinvoke>




	<cfquery name="qImage" datasource="#APPLICATION.DATASOURCE#">
    	SELECT ThumbnailFile
        FROM Images
        WHERE EntityTypeID = 5
        AND EntityID = #FabricRequest.getFabricRequestID()#    
    </cfquery>
    
 <table width="333" border="1" align="left">
  <cfoutput>	
      <tr>  
        <th width="149" scope="row">Image :</th>
        <td width="168"><img src="/mochi/uploads/materials/#FabricRequest.getFabricRequestID()#/images/#qImage.ThumbnailFile#" /></td>
      </tr>
      <tr>  
        <th width="149" scope="row">Fabric Code :</th>
        <td width="168">#Fabric.getMaterialCode()#</td>
      </tr>
	  <tr>
	    <th scope="row">Color :</th>
	    <td>#Color.getColorName()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Type :</th>
	    <td>#FabricRequestType.getType()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Fabric Category :</th>
	    <td>#FabricCategory.getCategory()#</td>
	  </tr>
      <tr>
        <th scope="row">Description :</th>
        <td>#Fabric.getDescription()#</td>
      </tr>
	  <tr>
	    <th scope="row">Comments :</th>
	    <td>#FabricRequest.getComments()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Requested By :</th>
	    <td>#FabricRequest.getRequestedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Request Date :</th>
	    <td>#DateFormat(FabricRequest.getRequestDate(), 'full')#</td>
	  </tr>
	  <tr>
	    <th scope="row">Approved By :</th>
	    <td>#FabricRequest.getApprovedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Approved Date :</th>
	    <td>#DateFormat(FabricRequest.getApprovedDate(), 'full')#</td>
	  </tr>
	  <tr>
	    <th scope="row">Received By :</th>
	    <td>#FabricRequest.getReceivedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Received Date :</th>
	    <td>#DateFormat(FabricRequest.getReceivedDate(), 'full')#</td>
	  </tr>
	  <tr>
	    <th scope="row">Status :</th>
	    <td>#FabricRequestStatus.getStatus()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created By :</th>
	    <td>#FabricRequest.getCreatedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Created Date :</th>
	    <td>#FabricRequest.getCreatedDate()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained By :</th>
	    <td>#FabricRequest.getLastMaintainedBy()#</td>
	  </tr>
	  <tr>
	    <th scope="row">Last Maintained Date :</th>
	    <td>#FabricRequest.getLastMaintainedDate()#</td>
	  </tr>
	</cfoutput>
    <tr>
    	<td colspan="2" align="center"><a href="index.cfm">Fabrics</a></td>
    </tr>
</table>
</cfif>