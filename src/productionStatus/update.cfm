<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.Productionstatusid")>
	<cfinvoke  component="mochi.cfc.ProductionStatus.ProductionStatus" method="init" returnvariable="ProductionStatus">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.ProductionStatus.ProductionStatusGateway" method="save">
		<cfinvokeargument name="obj" value="#ProductionStatus#"/>
	</cfinvoke>


    <cflocation url="index.cfm">
    
<cfelseif IsDefined("url.Productionstatusid")>
	<cfinvoke  component="mochi.cfc.ProductionStatus.ProductionStatusGateway" method="getById" returnvariable="ProductionStatus">
		<cfinvokeargument name="id" value="#url.Productionstatusid#"/>
	</cfinvoke>

</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Status :</th>
    <td width="168"><cfinput type="text" name="status" id="status"
            		 value="#ProductionStatus.getStatus()#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"
            		 value="#ProductionStatus.getDescription()#">
    </td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Category"></td>
  </tr>
</table>
	<cfinput type="hidden" name="Productionstatusid" value="#ProductionStatus.getProductionstatusid()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#ProductionStatus.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>