<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.sampletypeid")>
	
    <cfinvoke  component="mochi.cfc.sampleTypes.SampleType" method="init" returnvariable="sampletype">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.sampleTypes.SampleTypeGateway" method="save">
		<cfinvokeargument name="obj" value="#sampletype#"/>
	</cfinvoke>

    <cflocation url="index.cfm">
    
<cfelseif IsDefined("url.sampletypeid")>

	<cfinvoke  component="mochi.cfc.sampleTypes.SampleTypeGateway" method="getById" returnvariable="sampletype"> 
		<cfinvokeargument name="id" value="#url.sampletypeid#"/>
	</cfinvoke>

</cfif>

<cfform>

<table width="333" border="1" align="left">
  <tr>
    <th width="149" scope="row">Sample Type :</th>
    <td width="168"><cfinput type="text" name="sampletype" id="sampletype"
            		 value="#sampletype.getSampleType()#">
    </td>
  </tr>
  <tr>
    <th width="149" scope="row">Description :</th>
    <td width="168"><cfinput type="text" name="description" id="description"
            		 value="#sampletype.getDescription()#">
    </td>
  </tr>
  <tr>
	<td colspan="2"><cfinput type="submit" name="submit" value="Update Sample Type"></td>
  </tr>
</table>
	<cfinput type="hidden" name="sampletypeid" value="#sampletype.getsampletypeid()#">

	<!--- Timestamps  --->
	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="createddate" value="#sampletype.getCreatedDate()#">
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
	<cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    

</cfform>