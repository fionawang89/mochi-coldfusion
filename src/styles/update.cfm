<cfinclude template="../shared/header.cfm">

<cfif IsDefined("form.styleid")>

	<!--- save style in the database --->
	<cfinvoke  component="mochi.cfc.styles.Style" method="init" returnvariable="style">
		<cfinvokeargument name="stValues" value="#form#"/>
	</cfinvoke>
                        
	<cfinvoke component="mochi.cfc.styles.StyleGateway" method="save" returnvariable="savedStyle"> 
		<cfinvokeargument name="obj" value="#style#"/>
	</cfinvoke>
               
	<!--- create list to array --->
    <cfset attributeOptionsArray =  ListToArray(form.StyleAttributeOptionID) />
    
    <cfdump var="#attributeOptionsArray#"/>
    
	<!--- save the style attribute option info in the database --->                 
             
    <!--- loop through the array of StyleAttributeOptionID --->
    <cfloop index="StyleAttributeOptionID" array="#attributeOptionsArray#" >
        <cfif StyleAttributeOptionID NEQ ''>         	            	
        
			<!--- get the StyleAttributeOption object --->
            <cfinvoke component="mochi.cfc.styleAttributeOptions.StyleAttributeOptionGateway" method="getById" returnvariable="styleAttributeOption"> 
                <cfinvokeargument name="id" value="#StyleAttributeOptionID#"/>
            </cfinvoke>          
            
            
            <!--- now get the attribute value using StyleAttributeID and StyleID --->
            <cfquery datasource="#APPLICATION.DATASOURCE#" name="qStyleAttributeValueID">
                SELECT StyleAttributeValues.StyleAttributeValueID
                FROM StyleAttributeValues 
                INNER JOIN StyleAttributeOptions ON StyleAttributeValues.StyleAttributeOptionID = StyleAttributeOptions.StyleAttributeOptionID
                WHERE (((StyleAttributeOptions.StyleAttributeID)=#styleAttributeOption.getStyleAttributeID()#) 
                AND ((StyleAttributeValues.StyleID)=#style.getStyleID()#))        
            </cfquery>

			<!--- check if there was an existing data for StyleAttributeValue if not this will have to be a create function --->              
            <cfif qStyleAttributeValueID.RecordCount IS 0>	
            	<cfset vStyleAttributeValueID = 0/>
             <cfelse>
            	<cfset vStyleAttributeValueID = qStyleAttributeValueID.StyleAttributeValueID/>                             
            </cfif>
            
            <cfset styleAttributeValueStruct={StyleAttributeValueID=#vStyleAttributeValueID#,StyleAttributeOptionID=#StyleAttributeOptionID#, StyleID=#style.getStyleID()#}>
            
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
                            
	<cflocation url="show.cfm?styleid=#form.styleid#">

<cfelseif IsDefined("form.image") AND (form.entitytypeid EQ 2) >
    
	<!--- Check if an image for this style already exist there should only be one image and delete it --->
    <cfquery name="qImage" datasource="#APPLICATION.DATASOURCE#">
    	DELETE 
        FROM Images
        WHERE EntityTypeID = 2
        AND   EntityID = #form.entityid#
    </cfquery>

	<!--- Save the image in the database --->
	<cfinvoke  component="mochi.cfc.images.ImageGateway" method="uploadImage" returnvariable="uploadImageRet">
        <cfinvokeargument name="entitytypeid" value="#form.entitytypeid#"/>
        <cfinvokeargument name="entityid" value="#form.entityid#"/>
        <cfinvokeargument name="description" value="#form.description#"/>
        <cfinvokeargument name="image" value="#form.image#"/>
    </cfinvoke>
    
	<cflocation url="show.cfm?styleid=#form.entityid#">

<!--- additional images for the style --->    
<cfelseif IsDefined("form.image") AND (form.entitytypeid EQ 7) >

	<!--- Save the image in the database --->
	<cfinvoke  component="mochi.cfc.images.ImageGateway" method="uploadImage" returnvariable="uploadImageRet">
        <cfinvokeargument name="entitytypeid" value="#form.entitytypeid#"/>
        <cfinvokeargument name="entityid" value="#form.entityid#"/>
        <cfinvokeargument name="description" value="#form.description#"/>
        <cfinvokeargument name="image" value="#form.image#"/>
    </cfinvoke>
    
	<cflocation url="show.cfm?styleid=#form.entityid#">    
    
<cfelseif IsDefined("url.styleid")>

	<cfinvoke component="mochi.cfc.styles.StyleGateway" method="getById" returnvariable="style"> 
		<cfinvokeargument name="id" value="#url.styleid#"/>
	</cfinvoke>

	<cfinvoke  component="mochi.cfc.patternMakers.PatternMakerGateway" method="getAllAsQuery" returnvariable="patternMakers">
	</cfinvoke>

	<cfinvoke component="mochi.cfc.styleAttributes.StyleAttributeGateway" method="getAllAsQuery" returnvariable="styleAttributes"> 
	</cfinvoke>

 
	  <!--- get the additional images for this style --->	
     <cfquery name="styleImages" datasource="#APPLICATION.DATASOURCE#">
        SELECT Images.ThumbnailFile 
        FROM Images 
        WHERE Images.EntityID = #url.styleid#
        AND Images.EntityTypeID = 7
     </cfquery>
 

<table width="333" border="1" align="left">


    <cfform method="post" enctype="multipart/form-data">
    
      <tr>
        <th width="149" scope="row">Style Name :</th>
        <td width="168"><cfinput name="stylename" type="text" required="yes" message="Style name is required" 
                         value="#style.getStyleName()#">
        </td>
      </tr>
      <tr>
        <th scope="row">Description :</th>
        <td><cfinput type="text" name="description" id="description"
                         value="#style.getDescription()#"></td>
      </tr>
	  <tr>
        <th scope="row">Production Team Leader :</th>
        <td>
			<cfselect query="patternMakers" name="ProductionTeamLeader" value="FirstName" display="FirstName" selected="#style.getProductionTeamLeader()#"
				queryPosition="below">
					<option value="">Select Production Team Leader                          
                </cfselect>
        </td>
      </tr>
      <tr>
        <th scope="row">Production Pattern Maker :</th>
        <td>
           	<cfselect query="patternMakers" name="ProductionPatternMaker" value="FirstName" display="FirstName" selected="#style.getProductionPatternMaker()#"
                	queryPosition="below">
				<option value="">Select Production Pattern Maker
            </cfselect>
        </td>
      </tr>
      <tr>
        <th scope="row">First Pattern Maker :</th>
        <td>
            <cfselect query="patternMakers" name="FirstPatternMaker" value="FirstName" display="FirstName" selected="#style.getFirstPatternMaker()#"
                	queryPosition="below">
				<option value="">Select First Pattern Maker
            </cfselect>                          
        </td>
      </tr>
	  <tr>
		<th scope="row">Care Information:</th>
		<td>
			<cftextarea name="CareInformation" value="#style.getCareInformation()#" rows="5" cols="50%"/>                      
		</td>
	  </tr>
      <tr>
      	<th scope="row">Pattern Difficulty :</th>
        <td>
			<cfinput type="text" id="PatternDifficulty" name="PatternDifficulty" value="#style.getPatternDifficulty()#"/>                      
		</td>
	  </tr>
      <tr>
      	<th scope="row">Pattern Reference :</th>
        <td>
			<cfinput type="text" id="PatternReference" name="PatternReference" value="#style.getPatternReference()#"/>                      
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
  			        <!--- get style attribute value by StyleID and StyleAttributeID --->
                    <cfquery datasource="#APPLICATION.DATASOURCE#" name="styleAttributeValue">
                        SELECT StyleAttributeValues.StyleAttributeValueID, StyleAttributeValues.StyleAttributeOptionID
                        FROM (StyleAttributeOptions INNER JOIN StyleAttributeValues ON 
                        StyleAttributeOptions.StyleAttributeOptionID = StyleAttributeValues.StyleAttributeOptionID) 
                        INNER JOIN StyleAttributes ON StyleAttributeOptions.StyleAttributeID = StyleAttributes.StyleAttributeID
                        WHERE (((StyleAttributeOptions.StyleAttributeID)=#styleAttributes.StyleAttributeID#) AND ((StyleAttributeValues.StyleID)=#style.getStyleID()#))                                        
                    </cfquery>
                    
                    
                    <cfselect query="styleAttributeOptions" name="StyleAttributeOptionID" value="StyleAttributeOptionID" display="AttributeValue" queryPosition="below" required="yes" message="style attribute is required" selected="#styleAttributeValue.StyleAttributeOptionID#">
                        <option value="">Select Value
                    </cfselect>                                                              
                </td>
              </tr>
	          </cfoutput>	      	
          </cfloop>
      
      
      <tr>
        <td colspan="2" align="right"><cfinput type="submit" name="submit" value="Update Style"></td>
      </tr>
      
    
        <cfinput type="hidden" name="styleid" value="#style.getStyleID()#">
    
        <!--- Timestamps --->
        <cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
        <cfinput type="hidden" name="createddate" value="#style.getCreatedDate()#">
        <cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">
        <cfinput type="hidden" name="lastmaintaineddate" value="#DateFormat(CreateODBCDate(Now()), 'm/d/yyyy') & ' ' & TimeFormat(CreateODBCTime(Now()), 'hh:mm:ss tt')#">    
    
    </cfform>

	<cfform method="post" enctype="multipart/form-data">
		
        <tr>
			<th>Description :</th>           
			<td><cfinput type="text" required="yes" message="Description is required" name="description" validateat="onsubmit"></td>
		</tr>    
		<tr>
			<th>Upload Image :</th>           
			<td><cfinput type="file" name="image" required="yes" message="Image is required" validateat="onsubmit"><cfinput type="submit" name="submit" value="Upload Image"></td>
		</tr>    
		<cfinput type="hidden" name="entitytypeid" value="2">        
		<cfinput type="hidden" name="entityid" value="#url.styleid#">
        
	</cfform>
	<cfform method="post" enctype="multipart/form-data">
		
        <tr>
			<th>Description :</th>           
			<td><cfinput type="text" required="yes" message="Description is required" name="description" validateat="onsubmit"></td>
		</tr>    
		<tr>
			<th>Upload More Images :</th>           
			<td><cfinput type="file" name="image" required="yes" message="Image is required" validateat="onsubmit"><cfinput type="submit" name="submit" value="Upload More Images"></td>
		</tr>    
		<cfinput type="hidden" name="entityid" value="#url.styleid#">
		<cfinput type="hidden" name="entitytypeid" value="7">
        
	</cfform>
    
	<tr>
    	<td colspan="2"><a href="new.cfm">Create New Style</a></td>
    </tr>
</table>

<div style="clear:left;">
	<cfoutput query="styleImages">
    	<tr>
        	<td><img src="/mochi/uploads/#style.getStyleID()#/images/7/#styleImages.ThumbnailFile#" /></td>
        </tr>   
    </cfoutput>
</div>


<cfelse>

	<cflocation url="index.cfm">    

</cfif>
