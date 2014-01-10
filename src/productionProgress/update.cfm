<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.ProductionProgressDetailID")>

	<!--- form Status code here --->
    <cfinvoke  component="mochi.cfc.productionDetailStatus.ProductionDetailStatusGateway" method="getById" returnvariable="ProductionDetailStatus">
		<cfinvokeargument name="id" value="#form.ProductionDetailStatusID#"/>
	</cfinvoke>
	
    <cfset form.status = ProductionDetailStatus.getStatus()>
    
    
    <!--- Check if it's been finished or an exception has been set to properly set the status and finished date --->
	<cfif IsDefined("form.finisheddate") AND form.finisheddate IS NOT ''>        
    	<cfset form.status = form.finisheddate>
        <cfset form.ProductionDetailStatusID = 1>
    <cfelseif form.ProductionDetailStatusID EQ 1 AND form.finisheddate IS ''>    
    	<cfset form.finisheddate = DateFormat(Now(), 'mm/dd/yyyy')>
    	<cfset form.status = DateFormat(Now(), 'mm/dd/yyyy')>        
    <cfelseif Trim(ProductionDetailStatus.getType()) EQ 'E'>
    	<cfset form.finisheddate = DateFormat(Now(), 'mm/dd/yyyy')>
    <cfelse>
        <!--- increase the revision by 1 if this progess is just revised and not finished --->
        <cfset form.Revision = form.Revision + 1>
        <!--- send an email if it was only updated to notify --->
        <cfinvoke  component="mochi.cfc.emails.Email" method="emailProductionOperationUpdate">
			<cfinvokeargument name="ProductionProgressDetailID" value="#form.ProductionProgressDetailID#"/>
		</cfinvoke>
    </cfif>
    
    <!--- If an issue has been entered send an email alert to inform everyone --->
	<cfif Trim(ProductionDetailStatus.getType()) EQ 'I'>
    	<cfinvoke  component="mochi.cfc.emails.Email" method="emailProductionOperationIssue">
			<cfinvokeargument name="ProductionProgressDetailID" value="#form.ProductionProgressDetailID#"/>
		</cfinvoke>
    </cfif>
    

    <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressDetail" method="init" returnvariable="ProductionProgressDetail">
    	<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>


	<cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressDetailGateway" method="save">
		<cfinvokeargument name="obj" value="#ProductionProgressDetail#"/>
	</cfinvoke>

    
    <cflocation url="index.cfm?#form.queryString#">

    
<cfelseif IsDefined("url.ProductionProgressDetailID")>
    
    <cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressDetailGateway" method="getById" returnvariable="ProductionProgressDetail">
		<cfinvokeargument name="id" value="#url.ProductionProgressDetailID#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.productionProgress.ProductionProgressHeaderGateway" method="getById" returnvariable="ProductionProgressHeader">
		<cfinvokeargument name="id" value="#ProductionProgressDetail.getProductionProgressID()#"/>
	</cfinvoke>

    <cfinvoke  component="mochi.cfc.operationsProcesses.OperationProcessGateway" method="getById" returnvariable="OperationProcess">
		<cfinvokeargument name="id" value="#ProductionProgressDetail.getOperationProcessID()#"/>
	</cfinvoke>
	
	<cfinvoke  component="mochi.cfc.operations.OperationGateway" method="getById" returnvariable="Operation">
		<cfinvokeargument name="id" value="#OperationProcess.getOperationID()#"/>
	</cfinvoke>
    
    <cfinvoke  component="mochi.cfc.productionDetailStatus.ProductionDetailStatusGateway" method="getById" returnvariable="ProductionDetailStatus">
		<cfinvokeargument name="id" value="#ProductionProgressDetail.getProductionDetailStatusID()#"/>
	</cfinvoke>

    <cfquery name="qProductionDetailStatus" datasource="#APPLICATION.DATASOURCE#">
    	SELECT ProductionDetailStatusID, Status 
        FROM   ProductionDetailStatus
        WHERE  OperationID IN ( #Operation.getOperationID()# ,1, 15 )
    </cfquery>


</cfif>

<cfif Trim(GetAuthUser()).EqualsIgnoreCase(Trim(OperationProcess.getPersonInCharge())) OR Trim(GetAuthUser()).EqualsIgnoreCase('Ruben')>     

    <cfform>
    
        <table width="333" border="1" align="left">
          <tr>
            <th colspan="2"><cfoutput>Update Cut #ProductionProgressHeader.getCutNumber()# #ProductionProgressHeader.getStyle()# #ProductionProgressHeader.getColor()#</cfoutput></th>
          </tr>
          <tr>
            <th width="149" scope="row">Updated By :</th>
            <td width="168">
                <cfoutput>#ProductionProgressDetail.getLastMaintainedBy()#</cfoutput>
            </td>  
          </tr>
          <tr>
            <th width="149" scope="row">Updated Date :</th>
            <td width="168">
                <cfoutput>#DateFormat(ProductionProgressDetail.getLastMaintainedDate(), 'full')#</cfoutput>
            </td>  
          </tr>
          <tr>  	
            <th width="149" scope="row">Plan Date :</th>
            <td width="168">
                <cfinput type="datefield" name="plandate" value="#DateFormat(ProductionProgressDetail.getPlanDate(), 'mm/dd/yyyy')#">
            </td>
          </tr>
          <tr>
            <th width="149" scope="row">Finished Date :</th>
            <td width="168">
                <cfinput type="datefield" name="finisheddate" value="#DateFormat(ProductionProgressDetail.getFinishedDate(), 'mm/dd/yyyy')#">
            </td>
          </tr>
          <tr>
            <th width="149" scope="row">Status :</th>
            <td width="168">
				<cfselect query="qProductionDetailStatus" name="productionDetailStatusID" value="productionDetailStatusID" display="Status" selected="#ProductionProgressDetail.getProductionDetailStatusID()#"/>
            </td>
          </tr>          
          <tr>  
            <th width="175" scope="row">Comments :</th>
            <td width="168"><cftextarea cols="25%" rows="5" name="comments" value="#ProductionProgressDetail.getComments()#"></cftextarea></td>
          </tr>
          <tr>
            <td colspan="2"><cfinput type="submit" name="submit" value="Update Process"></td>
          </tr>
        </table>
    
        <cfinput type="hidden" name="ProductionProgressDetailID" value="#ProductionProgressDetail.getProductionProgressDetailID()#">
        <cfinput type="hidden" name="ProductionProgressID" value="#ProductionProgressDetail.getProductionProgressID()#">
        <cfinput type="hidden" name="OperationProcessID" value="#ProductionProgressDetail.getOperationProcessID()#">
        <cfinput type="hidden" name="status" value="#ProductionProgressDetail.getStatus()#">
        
        <!--- variable to check how many times the production progress detail has been revised --->
        <cfinput type="hidden" name="Revision" value="#ProductionProgressDetail.getRevision()#">
    
        <!--- Timestamps  --->
        <cfinput type="hidden" name="createdby" value="#ProductionProgressDetail.getCreatedBy()#">  
        <cfinput type="hidden" name="createddate" value="#ProductionProgressDetail.getCreatedDate()#">
        <cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
        <cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    
    
    	<!--- query string to go back to the correct page --->
        <cfinput type="hidden" name="queryString" value="#url.queryString#">
        
    </cfform>
    
<cfelse>
    
    <table>
		<tr>
        	<th>Operation :</th>
            <td><cfoutput>#Operation.getOperation()#</cfoutput></td>
        </tr>    
		<tr>
        	<th>Responsibility of :</th>
            <td><cfoutput>#OperationProcess.getPersonInCharge()#</cfoutput></td>
        </tr>    
		<tr>
            <th>Last Updated By :</th>
            <td><cfoutput>#ProductionProgressDetail.getLastMaintainedBy()#</cfoutput></td>  
		</tr>
		<tr>
            <th>Last Updated Date :</th>
            <td><cfoutput>#DateFormat(ProductionProgressDetail.getLastMaintainedDate(), 'full')#</cfoutput></td>  
		</tr>        
		<tr>
            <th>Revision :</th>
            <td><cfoutput>#ProductionProgressDetail.getRevision()#</cfoutput></td>  
		</tr>        
		<tr>
        	<th>Cut :</th>
            <td><cfoutput>#ProductionProgressHeader.getCutNumber()#</cfoutput></td>
        </tr>    
		<tr>
        	<th>Style :</th>
            <td><cfoutput>#ProductionProgressHeader.getStyle()#</cfoutput></td>
        </tr>    
		<tr>
        	<th>Cut :</th>
            <td><cfoutput>#ProductionProgressHeader.getColor()#</cfoutput></td>
        </tr>    
		<tr>
        	<th>Plan Date :</th>
            <td><cfoutput>#DateFormat(ProductionProgressDetail.getPlanDate(), 'mm/dd/yyyy')#</cfoutput></td>
        </tr>    
		<tr>
        	<th>Finished Date :</th>
            <td><cfoutput>#DateFormat(ProductionProgressDetail.getFinishedDate(), 'mm/dd/yyyy')#</cfoutput></td>
        </tr>    
        <tr>
        	<th>Status :</th>
            <td><cfoutput>#ProductionDetailStatus.getStatus()#</cfoutput></td>        
        </tr>                     
        <tr>
        	<th>Comments :</th>
            <td><cfoutput>#ProductionProgressDetail.getComments()#</cfoutput></td>        
        </tr>             
    </table>
    
</cfif>    
