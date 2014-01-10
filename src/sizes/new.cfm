<cfinclude template="../shared/header.cfm">

<cfif IsDefined("form.Size")>

	<cfquery name="qSize" datasource="#application.datasource#">
		SELECT SizeID
		FROM Sizes
		WHERE Size = '#form.size#'
	</cfquery>
	
	<cfif qSize.RecordCount IS 0>	
    
    	<cfinvoke  component="mochi.cfc.sizes.Size" method="init" returnvariable="size">
        	<cfinvokeargument name="stValues" value="#form#"/>
		</cfinvoke>
	
		<cfinvoke  component="mochi.cfc.sizes.SizeGateway" method="save">
			<cfinvokeargument name="obj" value="#size#"/>
		</cfinvoke>


	</cfif>
		
	<cflocation url="index.cfm">
	
</cfif>

<cfform method="post">
	<table width="333" border="1" align="left">
	  <tr>
	    <th width="149" scope="row">Size :</th>
	    <td width="168">
		    	<cfinput required="true" type="text" name="size" id="size" validateat="onSubmit"
		    			 message="Size is required">
	    </td>
	  </tr>
	  <tr>
		<td colspan="2"><cfinput type="submit" name="submit" value="Create Size"></td>	
	 </tr>
	</table>
	  
	<cfinput type="hidden" name="sizeid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    
	  	
</cfform>
	
