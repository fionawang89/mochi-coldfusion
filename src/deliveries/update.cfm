<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.deliveryid")>
	<cfinvoke  component="mochi.cfc.deliveries.Delivery" method="init" returnvariable="Delivery">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.deliveries.DeliveryGateway" method="save">
		<cfinvokeargument name="obj" value="#Delivery#"/>
	</cfinvoke>


    <cflocation url="index.cfm">
    
<cfelseif IsDefined("url.deliveryid")>
	<cfinvoke  component="mochi.cfc.deliveries.DeliveryGateway" method="getById" returnvariable="Delivery">
		<cfinvokeargument name="id" value="#url.deliveryid#"/>
	</cfinvoke>

</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Delivery :</th>
    <td width="168"><cfinput type="text" name="delivery" id="delivery"
            		 value="#Delivery.getDelivery()#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"
            		 value="#Delivery.getDescription()#">
    </td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Delivery"></td>
  </tr>
</table>
	<cfinput type="hidden" name="deliveryid" value="#Delivery.getdeliveryid()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#Delivery.getCreatedBy()#">  
	<cfinput type="hidden" name="createddate" value="#Delivery.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>