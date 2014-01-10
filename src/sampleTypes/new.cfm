<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.sampletype")>
	<!--- Check if sample type already exist in the system to avoid duplication --->    
	<cfquery name="qSampleType" datasource="#application.datasource#">
		SELECT SampleTypes.SampleTypeID
		FROM SampleTypes
		WHERE SampleTypes.SampleType = '#form.sampletype#'
	</cfquery>
	
	<!--- If result code doesnt exists create one --->
	<cfif qSampleType.RECORDCOUNT IS 0>
    	<cfinvoke  component="mochi.cfc.sampleTypes.SampleType" method="init" returnvariable="sampleType">
        	<cfinvokeargument name="stValues" value="#form#"/>		
        </cfinvoke>

		<cfinvoke  component="mochi.cfc.sampleTypes.SampleTypeGateway" method="save">
			<cfinvokeargument name="obj" value="#sampleType#"/>
		</cfinvoke>

	</cfif>
		
    <cflocation url="index.cfm">
	
</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>  
    <th width="149" scope="row">Sample Type :</th>
    <td width="168"><cfinput type="text" name="sampletype" id="sampletype"></td>
  </tr>
  <tr>  
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"></td>
  </tr>
  <tr>
  	<td colspan="2"><cfinput type="submit" name="submit" value="Create Sample Type"></td>
  </tr>
</table>
  
	<cfinput type="hidden" id="sampletypeid" name="sampletypeid" value="0">

	<!--- Timestamps --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>