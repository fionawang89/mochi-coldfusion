<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.deliveryid")>
	<!--- Check if result code already exist in the system to avoid duplication --->
	<cfquery name="qDelivery" datasource="#application.datasource#">
		SELECT DeliveryID
        FROM Deliveries
        WHERE Delivery =  '#TRIM(form.delivery)#'
	</cfquery>
	
	<!--- If result code doesnt exists create one --->
	<cfif qDelivery.RECORDCOUNT IS 0>
    
    	<cfinvoke  component="mochi.cfc.deliveries.Delivery" method="init" returnvariable="delivery">
        	<cfinvokeargument name="stValues" value="#form#"/>
		</cfinvoke>

		<cfinvoke  component="mochi.cfc.deliveries.DeliveryGateway" method="save">
			<cfinvokeargument name="obj" value="#delivery#"/>
		</cfinvoke>


	</cfif>
		
    <cflocation url="index.cfm">
	
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>  
    <th width="149" scope="row">Delivery :</th>
    <td width="168"><cfinput type="text" name="delivery" id="delivery"></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"></td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create Delivery"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="deliveryid" name="deliveryid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>