<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.productionDetailStatusid")>
	<cfinvoke  component="mochi.cfc.productionDetailStatus.productionDetailStatus" method="init" returnvariable="productionDetailStatus">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.productionDetailStatus.productionDetailStatusGateway" method="save">
		<cfinvokeargument name="obj" value="#productionDetailStatus#"/>
	</cfinvoke>


    <cflocation url="index.cfm">
    
<cfelseif IsDefined("url.productionDetailStatusid")>

	<cfinvoke  component="mochi.cfc.productionDetailStatus.productionDetailStatusGateway" method="getById" returnvariable="productionDetailStatus">
		<cfinvokeargument name="id" value="#url.productionDetailStatusid#"/>
	</cfinvoke>
    
    <cfinvoke  component="mochi.cfc.operations.OperationGateway" method="getAllAsQuery" returnvariable="operations">
	</cfinvoke>

        
</cfif>

<cfform>

<table>
  <tr>
    <th>Status :</th>
    <td><cfinput type="text" name="status" id="status"
            		 value="#productionDetailStatus.getStatus()#"
                     required="yes" message="Status Information is required">
    </td>
  </tr>
  <tr>
    <th>Status Code :</th>
    <td><cfinput type="text" name="statuscode" id="statuscode"
            		 value="#productionDetailStatus.getStatusCode()#"
                     required="yes" message="Status Code Information is required">
    </td>
  </tr>
  <tr>
    <th>Description :</th>
    <td><cfinput type="text" name="description" id="description"
            		 value="#productionDetailStatus.getDescription()#">
    </td>
  </tr>
  <tr>
  	<th>Operation :</th>
    <td>
    	<cfselect name="OperationID" query="operations" value="OperationID" display="Operation" required="yes" message="Operation information is required" queryPosition="below"
        	      selected="#productionDetailStatus.getOperationID()#">
    	</cfselect>
    </td>
  </tr>
  <tr>
  	<th>Type :</th>
  	<td>
 		<cfselect name="Type" required="yes" message="Type information is required">
            <option value="I" <cfif productionDetailStatus.getType() EQ 'I'>selected="selected"</cfif> >Issue</option>
            <option value="E" <cfif productionDetailStatus.getType() EQ 'E'>selected="selected"</cfif> >Exception</option>	
            <option value="P" <cfif productionDetailStatus.getType() EQ 'P'>selected="selected"</cfif> >Pancake</option>	
        </cfselect>
	</td>        
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Category"></td>
  </tr>
</table>
	<cfinput type="hidden" name="productionDetailStatusid" value="#productionDetailStatus.getproductionDetailStatusid()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#productionDetailStatus.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>