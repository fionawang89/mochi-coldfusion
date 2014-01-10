<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.CopyrightID")>

	<cfset Copyright=CreateObject("component", "mochi.cfc.Copyrights.Copyright").init(form)>
	<cfinvoke component="mochi.cfc.Copyrights.CopyrightGateway" method="save" > 
		<cfinvokeargument name="obj" value="#Copyright#"/>
	</cfinvoke>

    <cflocation url="index.cfm">
	
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
                          required="yes" message="Copyright Author is required">
            <option value="">Select Author
		</cfselect>     
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Title of Work :</th>
    <td width="168"><cfinput type="text" name="TitleOfWork" id="TitleOfWork" required="yes" message="Title of Work is required">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="Description" id="Description">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Transfer :</th>
    <td width="168"><cfinput type="text" name="Transfer" id="Transfer">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Year of Creation :</th>
    <td width="168">		
        	<cfinput type="datefield" required="true" name="YearOfCreation" id="YearOfCreation" validateat="onSubmit"
		    			 value="#Now()#" message="Year Of Creation is required">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Publication Date :</th>
    <td width="168">
        	<cfinput type="datefield" required="true" name="PublicationDate" id="PublicationDate" validateat="onSubmit"
		    			 value="#Now()#" message="Publication Date is required">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Prior Registration :</th>
    <td width="168">
		<cfinput type="text" name="PriorRegistration" id="PriorRegistration">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Application Date :</th>
    <td width="168">        	
    	<cfinput type="datefield" required="true" name="ApplicationDate" id="ApplicationDate" validateat="onSubmit"
		    			 value="#Now()#" message="Application Date is required">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Approved Date :</th>
    <td width="168">
        	<cfinput type="datefield" name="ApprovedDate" id="ApprovedDate" validateat="onSubmit">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Registration Number :</th>
    <td width="168"><cfinput type="text" name="RegistrationNumber" id="RegistrationNumber">
    </td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create Copyright"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="Copyrightid" name="Copyrightid" value="0">
	<cfinput type="hidden" id="CopyrightApplicationStatusid" name="CopyrightApplicationStatusid" value="1">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>