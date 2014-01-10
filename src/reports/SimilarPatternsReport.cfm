<cfinclude template="../shared/header.cfm"/>

<cfif IsDefined("form.reportFormat")>

    <cfinvoke  component="mochi.cfc.reports.Report" method="getSimilarPatternsQuery" returnvariable="SimilarPatternsQuery">
	    <cfinvokeargument name="param" value="#form#"/>    
	</cfinvoke>

	<cfreport template="#form.reportFormat#" format="pdf" query="#SimilarPatternsQuery#"/>

    
<cfelse>


<cfinvoke component="mochi.cfc.styleAttributes.StyleAttributeGateway" method="getAllAsQuery" returnvariable="styleAttributes"> 
</cfinvoke>



<cfform method="post">

	<table>
	  <!--- Style Attributes Form --->
      <cfloop query="styleAttributes">
      
        <cfinvoke component="mochi.cfc.styleAttributeOptions.StyleAttributeOptionGateway" method="getAllAsQueryByStyleAttributeID" returnvariable="styleAttributeOptions"> 
            <cfinvokeargument name="StyleAttributeID" value="#styleAttributes.StyleAttributeID#"/>
        </cfinvoke>
      
          <cfoutput>
          <tr>
            <th scope="row">Select #styleAttributes.AttributeName# :</th>  
            <td>
                <cfselect query="styleAttributeOptions" name="StyleAttributeOptionID" value="StyleAttributeOptionID" display="AttributeValue" queryPosition="below" required="yes" message="style attribute is required" multiple="yes">
                    <option value="">ALL #styleAttributes.AttributeName#
                </cfselect>                                          
            </td>
          </tr>
          </cfoutput>	      	
      </cfloop>
      <tr>
          <td colspan="2" align="center"><cfinput type="submit" name="submit" value="Create Report"><cfinput type="reset" name="reset" value="Reset"></td>
      </tr>
      
  </table>

  <cfinput type="hidden" name="reportFormat" value="StyleAttributes.cfr"/>
  
</cfform>

</cfif>