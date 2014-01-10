<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.CopyrightID")>
	<cfset Copyright=CreateObject("component", "mochi.cfc.Copyrights.Copyright").init(form)>
	<cfinvoke component="mochi.cfc.Copyrights.CopyrightGateway" method="save" > 
		<cfinvokeargument name="obj" value="#Copyright#"/>
	</cfinvoke>
    <cflocation url="index.cfm">
<cfelseif IsDefined("url.CopyrightID")>
	<cfinvoke component="mochi.cfc.Copyrights.CopyrightGateway" method="getById" returnvariable="Copyright"> 
		<cfinvokeargument name="id" value="#url.CopyrightID#"/>
	</cfinvoke>
</cfif>


	<cfinvoke  component="mochi.cfc.copyrightAuthors.CopyrightAuthorGateway" method="getAllAsQuery" returnvariable="CopyrightAuthors">
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.copyrightApplicationStatus.CopyrightApplicationStatusGateway" method="getAllAsQuery" returnvariable="CopyrightApplicationStatus">
	</cfinvoke>


<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Copyright Author :</th>
    <td width="168">
		<cfselect id="styleid" name="CopyrightAuthorID" query="CopyrightAuthors" value="CopyrightAuthorID" display="Author" queryPosition="below"
                          required="yes" message="Copyright Author is required" selected="#Copyright.getCopyrightAuthorID()#">
            <option value="">Select Author
		</cfselect>     
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Title of Work :</th>
    <td width="168"><cfinput type="text" name="TitleOfWork" id="TitleOfWork" required="yes" message="Title of Work is required" value="#Copyright.getTitleOfWork()#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="Description" id="Description" value="#Copyright.getDescription()#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Transfer :</th>
    <td width="168"><cfinput type="text" name="Transfer" id="Transfer" value="#Copyright.getTransfer()#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Year of Creation :</th>
    <td width="168">		
        	<cfinput type="datefield" required="true" name="YearOfCreation" id="YearOfCreation" validateat="onSubmit"
		    			 value="#DateFormat(Copyright.getYearOfCreation(), 'm/d/yyyy')#" message="Year Of Creation is required">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Publication Date :</th>
    <td width="168">
        	<cfinput type="datefield" required="true" name="PublicationDate" id="PublicationDate" validateat="onSubmit"
		    			 value="#DateFormat(Copyright.getPublicationDate(), 'm/d/yyyy')#" message="Publication Date is required">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Prior Registration :</th>
    <td width="168">
		<cfinput type="text" name="PriorRegistration" id="PriorRegistration" value="#Copyright.getPriorRegistration()#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Application Date :</th>
    <td width="168">        	
    	<cfinput type="datefield" required="true" name="ApplicationDate" id="ApplicationDate" validateat="onSubmit"
		    			 value="#DateFormat(Copyright.getApplicationDate(),'m/d/yyyy')#" message="Application Date is required">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Approved Date :</th>
    <td width="168">
        	<cfinput type="datefield" name="ApprovedDate" id="ApprovedDate" validateat="onSubmit"
            		  value="#DateFormat(Copyright.getApprovedDate(),'m/d/yyyy')#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Registration Number :</th>
    <td width="168"><cfinput type="text" name="RegistrationNumber" id="RegistrationNumber" value="#Copyright.getRegistrationNumber()#">
    </td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Update Copyright"></td>
  </tr>
</table>
  
	<cfinput type="hidden" name="CopyrightID" value="#Copyright.getCopyrightID()#">
	<cfinput type="hidden" id="CopyrightApplicationStatusid" name="CopyrightApplicationStatusid" value="#Copyright.getCopyrightApplicationStatusid()#">    

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#Copyright.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>