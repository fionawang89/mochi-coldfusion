<cfif IsDefined("form.styleid")>

<cfinvoke  component="mochi.cfc.wizards.Wizard" method="updateStyleColorDeliveryDate" returnvariable="updateStyleColorDeliveryDateRet">
	<cfinvokeargument name="StyleID" value="#form.StyleID#"/>
	<cfinvokeargument name="ColorID" value="#form.ColorID#"/>
	<cfinvokeargument name="DeliveryID" value="#form.DeliveryID#"/>
</cfinvoke>


</cfif>



<cfinvoke 
 component="mochi.cfc.styles.StyleGateway"
 method="getAllAsQuery"
 returnvariable="styles">
</cfinvoke>


<cfinvoke 
 component="mochi.cfc.colors.ColorGateway"
 method="getAllAsQuery"
 returnvariable="colors">
</cfinvoke>


<cfinvoke 
 component="mochi.cfc.deliveries.DeliveryGateway"
 method="getAllAsQuery"
 returnvariable="deliveries">
</cfinvoke>


<cfform method="post">
<table>
	<tr>
    	<th>Style :</th>
        <td>
        	<cfselect id="styleid" name="styleid" query="styles" value="StyleID" display="StyleName" queryPosition="below"
            		  required="yes" message="Style Number is required">
            	<option value="">Select Style
            </cfselect>         
        </td>
    </tr>
	<tr>
    	<th>Color : </th>
        <td>
        	<cfselect id="colorid" name="colorid" query="colors" value="ColorID" display="ColorName" queryPosition="below"
            		  required="yes" message="Color is required">
            	<option value="">Select Color
            </cfselect>         
        </td>
    </tr>
    <tr>
    	<th>Delivery :</th>
        <td>
        	<cfselect id="deliveryid" name="deliveryid" query="deliveries" value="deliveryid" display="Delivery" queryPosition="below"
            		  required="yes" message="Delivery is required">
            	<option value="">Select Delivery
            </cfselect> 
        </td>
    </tr>
	  <tr>
		<td colspan="2"><cfinput type="submit" name="submit" value="Update Sample Request"></td>	
	 </tr>    
</table>
</cfform>