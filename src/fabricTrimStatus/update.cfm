<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.FabricTrimStatusid")>
	
    <cfdump var="#form#">
    
	<cfinvoke  component="mochi.cfc.FabricTrimStatus.FabricTrimStatus" method="init" returnvariable="FabricTrimStatus">
    	<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.FabricTrimStatus.FabricTrimStatusGateway" method="save">
		<cfinvokeargument name="obj" value="#FabricTrimStatus#"/>
	</cfinvoke>

	<cflocation url="index.cfm">
    
<cfelseif IsDefined("url.FabricTrimStatusid")>

	<cfinvoke  component="mochi.cfc.FabricTrimStatus.FabricTrimStatusGateway" method="getById" returnvariable="FabricTrimStatus"> 
		<cfinvokeargument name="id" value="#url.FabricTrimStatusid#"/>
	</cfinvoke>

</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Status :</th>
    <td width="168"><cfinput type="text" name="status" id="status"
            		 value="#FabricTrimStatus.getStatus()#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"
            		 value="#FabricTrimStatus.getDescription()#">
    </td>
  </tr>
  <tr>
	<th>Type</th>  	
    <td>
    	<cfselect name="type" required="yes" message="Type information is required"
        		  selected="#FabricTrimStatus.getType()#">
        	<option value="A">Approved
            <option value="P">Pending
        </cfselect>
    </td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Pattern Status"></td>
  </tr>
</table>
	<cfinput type="hidden" name="FabricTrimStatusid" value="#FabricTrimStatus.getFabricTrimStatusid()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#FabricTrimStatus.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>