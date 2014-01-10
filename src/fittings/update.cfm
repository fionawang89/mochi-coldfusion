<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.fittingid")>
	
    <cfinvoke  component="mochi.cfc.fittings.Fitting" method="init" returnvariable="fitting">
		<cfinvokeargument name="stValues" value="#form#"/>	
    </cfinvoke>

	<cfinvoke  component="mochi.cfc.fittings.FittingGateway" method="save">
		<cfinvokeargument name="obj" value="#fitting#"/>
	</cfinvoke>

    <cflocation url="index.cfm">
    
<cfelseif IsDefined("url.fittingid")>

	<cfinvoke  component="mochi.cfc.fittings.FittingGateway" method="getById" returnvariable="fitting">
		<cfinvokeargument name="id" value="#url.fittingid#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.styles.StyleGateway" method="getAllAsQuery" returnvariable="Styles">
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.sampleCategories.SampleCategoryGateway" method="getAllAsQuery" returnvariable="sampleCategories">
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.patternMakers.PatternMakerGateway" method="getAllAsQuery"returnvariable="patternMakers">
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.locations.LocationGateway" method="getAllAsQuery" returnvariable="locations">
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.contractors.ContractorGateway" method="getAllAsQuery" returnvariable="contractors">
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.resultCodes.ResultCodeGateway" method="getAllAsQuery" returnvariable="resultCodes">
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.patternStatus.PatternStatusGateway" method="getAllAsQuery" returnvariable="patternStatus">
	</cfinvoke>


</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Style :</th>
    <td width="168"><cfselect id="styleid" name="styleid" query="Styles" value="StyleID" display="StyleName" selected="#fitting.getStyleID()#"></cfselect>
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Category :</th>
    <td width="168"><cfselect id="samplecategoryid" name="samplecategoryid" query="sampleCategories" value="SampleCategoryID" display="Category" selected="#fitting.getSampleCategoryID()#"></cfselect>
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Pattern Maker :</th>
    <td width="168"><cfselect id="patternmakerid" name="patternmakerid" query="patternMakers" value="PatternMakerID" display="FirstName" selected="#fitting.getPatternMakerID()#"></cfselect>
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Cut Number :</th>
    <td width="168"><cfinput id="cutnumber" name="cutnumber" type="text" validate="integer" value="#fitting.getCutNumber()#" validateat="onsubmit">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Due Date :</th>
    <td width="168"><cfinput id="duedate" name="duedate" type="datefield" value="#DateFormat(fitting.getDueDate(), 'm/d/yyyy')#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Location :</th>
    <td width="168"><cfselect id="locationid" name="locationid" query="Locations" value="LocationID" display="Location" selected="#fitting.getLocationID()#"></cfselect>
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Contractor :</th>
    <td width="168"><cfselect id="contractorid" name="contractorid" query="Contractors" value="ContractorID" display="Contractor" selected="#fitting.getContractorID()#"></cfselect>
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Fitter :</th>
    <td width="168"><cfinput id="fitter" name="fitter" type="text" required="yes" value="#fitting.getFitter()#" validateat="onsubmit">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Fitting Date :</th>
    <td width="168"><cfinput id="fittingdate" name="fittingdate" type="datefield" value="#DateFormat(fitting.getFittingDate(), 'm/d/yyyy')#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Result :</th>
    <td width="168"><cfselect id="resultcodeid" name="resultcodeid" query="ResultCodes" value="ResultCodeID" display="Code" selected="#fitting.getResultCodeID()#"></cfselect>
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Pattern Status :</th>
    <td width="168"><cfselect id="patternstatusid" name="patternstatusid" query="PatternStatus" value="PatternStatusID" display="Status" selected="#fitting.getPatternStatusID()#"></cfselect>
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Comments :</th>
    <td width="100%" height="100%"><cftextarea id="comments" name="comments" cols="100%" rows="7" value="#fitting.getComments()#"></cftextarea>
    </td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Fitting"></td>
  </tr>
</table>
	<cfinput type="hidden" name="fittingid" value="#fitting.getfittingid()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#fitting.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>