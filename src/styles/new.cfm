  <cfinclude template="../shared/header.cfm">

<cfif IsDefined("form.StyleName")>

	<cfdump var="#GetPageContext().getRequest().getParameterValues('StyleAttributeOptionID')#"/>
    

	<cfquery name="qStyle" datasource="#application.datasource#">
		SELECT StyleID
		FROM Styles 
		WHERE StyleName = '#form.StyleName#'
	</cfquery>
	            
	<cfif qStyle.RecordCount IS 0>	


		<!--- save style info in the database --->
        <cfinvoke  component="mochi.cfc.styles.Style" method="init" returnvariable="style">
            <cfinvokeargument name="stValues" value="#form#"/>
        </cfinvoke>
                            
        <cfinvoke component="mochi.cfc.styles.StyleGateway" method="save" returnvariable="savedStyle"> 
            <cfinvokeargument name="obj" value="#style#"/>
        </cfinvoke>
                 

		<!--- save the style attribute option info in the database --->                 
                 
        <!--- loop through the array of StyleAttributeOptionID --->
        <cfloop index="StyleAttributeOptionID" array="#GetPageContext().getRequest().getParameterValues('StyleAttributeOptionID')#">
			<!--- if the style attribute option ID is not empty save it to the database --->                 
        	<cfif StyleAttributeOptionID NEQ ''>         	            	
                <cfset styleAttributeValueStruct={StyleAttributeValueID=0,StyleAttributeOptionID=#StyleAttributeOptionID#, StyleID=#savedStyle.getStyleID()#}>
                
                <cfinvoke  component="mochi.cfc.styleAttributeValues.StyleAttributeValue" method="init" returnvariable="styleAttributeValue">
                    <cfinvokeargument name="stValues" value="#styleAttributeValueStruct#"/>
                </cfinvoke>
                
                <cfinvoke component="mochi.cfc.styleAttributeValues.StyleAttributeValueGateway" method="save" returnvariable="savedStyleAttributeValue"> 
                    <cfinvokeargument name="obj" value="#styleAttributeValue#"/>
                </cfinvoke>
                                                        		            
            <cfelse>
	        	<!--- just ignore this if empty  --->
            </cfif>    
        </cfloop>
        
        
        
        <cflocation url="update.cfm?styleid=#savedStyle.getStyleID()#"> 
    
    <cfelse>
    	
        <h1 style="color:red">Style already exists in the system!</h1>     
         
	</cfif>
    
    
</cfif>

	<cfinvoke  component="mochi.cfc.patternMakers.PatternMakerGateway" method="getAllAsQuery" returnvariable="patternMakers">
	</cfinvoke>

	<cfinvoke component="mochi.cfc.styleAttributes.StyleAttributeGateway" method="getAllAsQuery" returnvariable="styleAttributes"> 
	</cfinvoke>


<table width="333" border="1" align="left">

<!--- Form for creating a new style --->
    <cfform method="post"> 
          <tr>
            <th width="149" scope="row">Style Name :</th>
            <td width="168">
                    <cfinput required="true" type="text" name="stylename" id="stylename" validateat="onSubmit"
                             message="Style Name is required">
            </td>
          </tr>
          <tr>
            <th scope="row">Description :</th>
            <td>
                    <cfinput type="text" name="description" id="description">
            </td>
          </tr>
          <tr>
            <th scope="row">Production Team Leader :</th>
            <td>
                <cfselect query="patternMakers" name="ProductionTeamLeader" value="FirstName" display="FirstName" queryPosition="below">
                        <option value="">Select Production Team Leader                          
                    </cfselect>
            </td>
          </tr>
          <tr>
            <th scope="row">Production Pattern Maker :</th>
            <td>
                <cfselect query="patternMakers" name="ProductionPatternMaker" value="FirstName" display="FirstName" queryPosition="below">
                    <option value="">Select Production Pattern Maker
                </cfselect>
            </td>
          </tr>
          <tr>
            <th scope="row">First Pattern Maker :</th>
            <td>
                <cfselect query="patternMakers" name="FirstPatternMaker" value="FirstName" display="FirstName" queryPosition="below">
                    <option value="">Select First Pattern Maker
                </cfselect>                          
            </td>
          </tr>
          <tr>
            <th scope="row">Care Information:</th>
            <td>
                    <cftextarea name="CareInformation" rows="5" cols="50%"/>                      
            </td>
          </tr>
          <tr>
            <th scope="row">Pattern Difficulty :</th>
            <td>
                    <cfinput type="text" id="PatternDifficulty" name="PatternDifficulty" />                      
            </td>
          </tr>
          <tr>
            <th scope="row">Pattern Reference :</th>
            <td>
                    <cfinput type="text" id="PatternReference" name="PatternReference" />                      
            </td>
          </tr>
          <!--- Style Attributes Form --->
          <cfloop query="styleAttributes">
          
			<cfinvoke component="mochi.cfc.styleAttributeOptions.StyleAttributeOptionGateway" method="getAllAsQueryByStyleAttributeID" returnvariable="styleAttributeOptions"> 
            	<cfinvokeargument name="StyleAttributeID" value="#styleAttributes.StyleAttributeID#"/>
			</cfinvoke>
	
    		  <cfoutput>
              <tr>
                <th scope="row">#styleAttributes.AttributeName#</th>  
                <td>
                    <cfselect query="styleAttributeOptions" name="StyleAttributeOptionID" value="StyleAttributeOptionID" display="AttributeValue" queryPosition="below" required="yes" message="style attribute is required">
                        <option value="">Select Value
                    </cfselect>                                          
                </td>
              </tr>
	          </cfoutput>	      	
          </cfloop>
          
		<tr>
            <td colspan="2"><cfinput type="submit" name="submit" value="Create Style"></td>	
         </tr>
                                            

        <cfinput type="hidden" name="styleid" value="0">
    
        <!--- Timestamps --->
        <cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
        <cfinput type="hidden" name="createddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">
        <cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
        <cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    
            
    </cfform>
    
    
</table>
	
