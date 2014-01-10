<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.fittingid")>

	<cfinvoke  component="mochi.cfc.fittings.Fitting" method="init" returnvariable="fitting">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>


	<cfinvoke  component="mochi.cfc.fittings.FittingGateway" method="save">
		<cfinvokeargument name="obj" value="#fitting#"/>
	</cfinvoke>

    <cflocation url="index.cfm">
	
</cfif>

<cfinvoke  component="mochi.cfc.styles.StyleGateway" method="getAllAsQuery" returnvariable="styles"/>

<cfinvoke  component="mochi.cfc.sampleCategories.SampleCategoryGateway" method="getAllAsQuery"
 returnvariable="sampleCategories">
</cfinvoke>

<cfinvoke  component="mochi.cfc.patternMakers.PatternMakerGateway" method="getAllAsQuery" returnvariable="patternMakers">
</cfinvoke>

<cfinvoke  component="mochi.cfc.locations.LocationGateway" method="getAllAsQuery" returnvariable="locations">
</cfinvoke>

<cfinvoke  component="mochi.cfc.contractors.ContractorGateway" method="getAllAsQuery"  returnvariable="contractors">
</cfinvoke>

<cfinvoke  component="mochi.cfc.resultCodes.ResultCodeGateway" method="getAllAsQuery"
 returnvariable="resultCodes">
</cfinvoke>

<cfinvoke 
 component="mochi.cfc.patternStatus.PatternStatusGateway" method="getAllAsQuery" returnvariable="patternStatus">
</cfinvoke>


<cfform>



<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Style :</th>
    <td width="168"><cfselect id="styleid" name="styleid" message="Style is required" query="styles" value="StyleID" display="StyleName" required="yes" queryPosition="below">
    	<option value="">Select Style
    </cfselect>
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Category :</th>
    <td width="168"><cfselect id="samplecategoryid" name="samplecategoryid" message="Category is required" query="sampleCategories" value="SampleCategoryID" display="Category" required="yes" queryPosition="below">
    	<option value="">Select Category</cfselect>
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Pattern Maker :</th>
    <td width="168"><cfselect id="patternmakerid" name="patternmakerid" message="Pattern Maker is required" query="patternMakers" value="PatternMakerID" display="FirstName" required="yes" queryPosition="below">
    	<option value="">Select Pattern Maker</cfselect>
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Cut :</th>
    <td width="168"><cfinput type="text" validate="integer" validateat="onsubmit" id="cutnumber" name="cutnumber">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Due Date :</th>
    <td width="168"><cfinput type="datefield" id="duedate" name="duedate">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Location :</th>
    <td width="168"><cfselect id="locationid" name="locationid" message="Location is required" query="locations" queryPosition="below" value="LocationID" display="Location" required="yes"> 
    	<option value="">Select Location
    </cfselect>
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Contractor :</th>
    <td width="168"><cfselect id="contractorid" name="contractorid" message="Location is required" query="contractors" queryPosition="below" value="ContractorID" display="Contractor"> 
    	<option value="">Select Contractor
    </cfselect>
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Fitter :</th>
    <td width="168"><cfinput type="text" id="fitter" name="fitter" required="yes" validateat="onsubmit">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Fitting Date :</th>
    <td width="168"><cfinput type="datefield" id="fittingdate" name="fittingdate">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Result :</th>
    <td width="168"><cfselect id="resultCodeid" name="resultCodeid" message="Result Code is required" query="resultCodes" queryPosition="below" required="yes" value="ResultCodeID" display="Code"> 
    	<option value="">Select Result
    </cfselect>
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Pattern Status :</th>
    <td width="168"><cfselect id="patternStatusid" name="patternStatusid" message="Pattern Status is required" query="patternStatus" queryPosition="below" required="yes" value="PatternStatusID" display="Status"> 
    	<option value="">Select Pattern Status
    </cfselect>
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Comments :</th>
    <td width="100%" height="100%"><cftextarea id="comments" name="comments" cols="100%" rows="7"></cftextarea>
    </td>
  </tr>
   <tr>
  	<td colspan="2" align="right"><cfinput type="submit" name="submit" value="Create New Fitting"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="fittingid" name="fittingid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>