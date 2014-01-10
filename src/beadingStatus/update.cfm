<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.BeadingStatusid")>
	
    <cfdump var="#form#">
    
	<cfinvoke  component="mochi.cfc.BeadingStatus.BeadingStatus" method="init" returnvariable="BeadingStatus">
    	<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.BeadingStatus.BeadingStatusGateway" method="save">
		<cfinvokeargument name="obj" value="#BeadingStatus#"/>
	</cfinvoke>

	<cflocation url="index.cfm">
    
<cfelseif IsDefined("url.BeadingStatusid")>

	<cfinvoke  component="mochi.cfc.BeadingStatus.BeadingStatusGateway" method="getById" returnvariable="BeadingStatus"> 
		<cfinvokeargument name="id" value="#url.BeadingStatusid#"/>
	</cfinvoke>

</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Status :</th>
    <td width="168"><cfinput type="text" name="status" id="status"
            		 value="#BeadingStatus.getStatus()#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"
            		 value="#BeadingStatus.getDescription()#">
    </td>
  </tr>
  <tr>
	<th>Type</th>  	
    <td>
    	<cfselect name="type" required="yes" message="Type information is required"
        		  selected="#BeadingStatus.getType()#">
        	<option value="A">Approved
            <option value="P">Pending
        </cfselect>
    </td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Pattern Status"></td>
  </tr>
</table>
	<cfinput type="hidden" name="BeadingStatusid" value="#BeadingStatus.getBeadingStatusid()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#BeadingStatus.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>