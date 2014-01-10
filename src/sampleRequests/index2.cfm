<cfinclude template="../shared/header.cfm"/>

<cfinvoke  component="mochi.cfc.sampleRequests.SampleRequestGateway" method="getAllAsQuery" returnvariable="sampleRequests">
</cfinvoke>



<cfif sampleRequests.RecordCount IS 0>
	<h4>No Request Data was returned</h4>
<cfelse> 

<cfform>

	<cfgrid format="html" name="requestGrid" query="sampleRequests" pagesize="1">
    </cfgrid>
    
</cfform>    

	<table border="1">
    	<tr>
        	<th>Reference #</th>
            <th>Style Number</th>
            <th>Color</th>
	        <th>Size</th>
    	    <th>Quantity</th>
    	    <th>Collection</th>
    	    <th>Sample Type</th>
    	    <th>Comments</th>
        	<th>Requested By</th>            
	       	<th>Requested For</th>            
	        <th>Request Date</th>
	        <th>Due Date</th>
			<th>Status</th>   
            <th colspan="4">Links</th>         
        </tr>
        <cfoutput query="sampleRequests">
			
            <cfinvoke  component="mochi.cfc.styles.StyleGateway" method="getById" returnvariable="Style">
				<cfinvokeargument name="id" value="#sampleRequests.StyleID#"/>
			</cfinvoke>

			<cfinvoke  component="mochi.cfc.colors.ColorGateway" method="getById" returnvariable="Color">
				<cfinvokeargument name="id" value="#sampleRequests.ColorID#"/>
			</cfinvoke>
            
            <cfinvoke  component="mochi.cfc.sizes.SizeGateway" method="getById" returnvariable="Size">
				<cfinvokeargument name="id" value="#sampleRequests.SizeID#"/>
			</cfinvoke>


			<cfinvoke  component="mochi.cfc.collections.CollectionGateway" method="getById" returnvariable="Collection">
				<cfinvokeargument name="id" value="#sampleRequests.CollectionID#"/>
			</cfinvoke>

			<cfinvoke  component="mochi.cfc.sampleTypes.SampleTypeGateway" method="getById" returnvariable="SampleType">
				<cfinvokeargument name="id" value="#sampleRequests.SampleTypeID#"/>
			</cfinvoke>


            <cfinvoke  component="mochi.cfc.locations.LocationGateway" method="getById" returnvariable="RequestedByLocation">
				<cfinvokeargument name="id" value="#sampleRequests.RequestedBy#"/>
			</cfinvoke>

            <cfinvoke  component="mochi.cfc.locations.LocationGateway" method="getById" returnvariable="RequestedForLocation">
				<cfinvokeargument name="id" value="#sampleRequests.RequestedFor#"/>
			</cfinvoke>
            
            
             <cfinvoke  component="mochi.cfc.requestStatus.RequestStatusGateway" method="getById" returnvariable="RequestStatus">
				<cfinvokeargument name="id" value="#sampleRequests.RequestStatusID#"/>
			</cfinvoke>			 
		
        <cfset class = IIF(sampleRequests.currentRow mod 2 eq 0, "'DataA'", "'DataB'")>	 
			 
        <tr>
          <td class="#class#">#sampleRequests.ReferenceNumber#</td>
          <td class="#class#">#Style.getStyleName()#</td>
          <td class="#class#">#Color.getColorName()#</td>
          <td class="#class#">#Size.getSize()#</td>
          <td class="#class#">#sampleRequests.Quantity#</td>
          <td class="#class#">#Collection.getCollection()#</td>
          <td class="#class#">#SampleType.getSampleType()#</td>
          <td class="#class#">#sampleRequests.Comments#</td>
          <td class="#class#">#RequestedByLocation.getLocation()#</td>
          <td class="#class#">#RequestedForLocation.getLocation()#</td>
          <td class="#class#">#DateFormat(sampleRequests.RequestDate, 'm/d/yyyy')#</td>
          <td class="#class#">#DateFormat(sampleRequests.DueDate, 'm/d/yyyy')#</td>
          <td class="#class#">#RequestStatus.getStatus()#</td>
          <td class="#class#"><a href="update.cfm?SampleRequestID=#sampleRequests.SampleRequestID#">Edit</a></td>
          <td class="#class#"><a href="delete.cfm?SampleRequestID=#sampleRequests.SampleRequestID#">Delete</a></td>
          <td class="#class#"><a href="show.cfm?SampleRequestID=#sampleRequests.SampleRequestID#">View</a></td>
          <td class="#class#"><a href="../sampleProgress/update.cfm?SampleRequestID=#sampleRequests.SampleRequestID#">Update Progress</a></td>
        </tr>        
        </cfoutput>
        </table>
</cfif>   
<a href="new.cfm">Create New Request</a>
