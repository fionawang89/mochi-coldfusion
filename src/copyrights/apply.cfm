<cfinclude template="../shared/header.cfm">

<cfif IsDefined("form.CopyrightID")>	
	
	<cfinvoke component="mochi.cfc.Copyrights.CopyrightGateway" method="getById"  returnvariable="Copyright"> 
		<cfinvokeargument name="id" value="#form.CopyrightID#"/>
	</cfinvoke>
            
    <!--- if the copyright is not approved yet but there's already an entry for application remove those entries first before adding new application --->
	<cfif Copyright.getCopyrightApplicationStatusID() EQ 1>
    	<cfquery datasource="#APPLICATION.DATASOURCE#">
            DELETE FROM CopyrightsStyles
            WHERE CopyrightsStyles.CopyrightID = #Copyright.getCopyrightID()#   
        </cfquery>    
    </cfif>
    
    
    <!--- check if the application is by style or by production date --->
    <!--- if it's applied by production date --->
    <cfif IsDefined("form.FromSamplesCreateDate")>
		<!--- query all the styles by production date I used the report object to create the query --->
        <cfinvoke component="mochi.cfc.reports.Report" method="getStylesInProductionByDate" returnvariable="stylesInProduction">
            <cfinvokeargument name="param" value="#form#"/>
        </cfinvoke>
	
    	<!--- loop over the styles in the query --->
		<cfloop query="stylesInProduction">
        	<!--- create the copyright styles for each style in the production --->
        	<!--- create a struct object for each style and copyright id combination --->
            <cfset structCopyright = StructNew()>
            <cfset structCopyright.CopyrightsStylesID = 0>
            <cfset structCopyright.StyleID = stylesInProduction.StyleID>
            <cfset structCopyright.CopyrightID = form.CopyrightID>

			<!--- create the CopyrightStyle entry in the database --->    
            <cfset CopyrightStyle=CreateObject("component", "mochi.cfc.CopyrightsStyles.CopyrightStyle").init(structCopyright)>
            <cfinvoke  component="mochi.cfc.copyrightsStyles.CopyrightStyleGateway" method="save">
                <cfinvokeargument name="obj" value="#CopyrightStyle#"/>
            </cfinvoke>            
        </cfloop>
    
    <!--- if it's applied by pattern reference --->    
    <cfelseif IsDefined("form.PatternReference")>    
        <!--- get all the styles that has the same pattern reference entered --->    
    	<cfquery datasource="mochi" name="styles">
            SELECT Styles.StyleID
            FROM Styles
            WHERE Styles.PatternReference='#form.PatternReference#'
        </cfquery>
	    <!--- loop over the styles in the query --->
        <cfloop query="styles">
        	<!--- create the copyright styles for each style in the production --->
        	<!--- create a struct object for each style and copyright id combination --->
            <cfset structCopyright = StructNew()>
            <cfset structCopyright.CopyrightsStylesID = 0>
            <cfset structCopyright.StyleID = styles.StyleID>
            <cfset structCopyright.CopyrightID = form.CopyrightID>

			<!--- create the CopyrightStyle entry in the database --->    
            <cfset CopyrightStyle=CreateObject("component", "mochi.cfc.CopyrightsStyles.CopyrightStyle").init(structCopyright)>
            <cfinvoke  component="mochi.cfc.copyrightsStyles.CopyrightStyleGateway" method="save">
                <cfinvokeargument name="obj" value="#CopyrightStyle#"/>
            </cfinvoke>                    
        </cfloop>

	<!--- if it's applied by style --->    
	<cfelse>    
		<!--- create the CopyrightStyle entry in the database --->    
        <cfset CopyrightStyle=CreateObject("component", "mochi.cfc.CopyrightsStyles.CopyrightStyle").init(form)>
        <cfinvoke  component="mochi.cfc.copyrightsStyles.CopyrightStyleGateway" method="save">
            <cfinvokeargument name="obj" value="#CopyrightStyle#"/>
        </cfinvoke>
    
    </cfif>
    
    
    <cflocation url="index.cfm">
    
<cfelseif IsDefined("url.CopyrightID")>

	<cfinvoke component="mochi.cfc.Copyrights.CopyrightGateway" method="getById" returnvariable="Copyright"> 
		<cfinvokeargument name="id" value="#url.CopyrightID#"/>
	</cfinvoke>
    
</cfif>

<!--- cfc components --->
    
<cfinvoke  component="mochi.cfc.copyrightAuthors.CopyrightAuthorGateway" method="getById" returnvariable="CopyrightAuthor">
	<cfinvokeargument name="id" value="#Copyright.getCopyrightAuthorID()#"/>
</cfinvoke>

<cfinvoke  component="mochi.cfc.copyrightApplicationStatus.CopyrightApplicationStatusGateway" method="getById" returnvariable="CopyrightApplicationStatus">
	<cfinvokeargument name="id" value="#Copyright.getCopyrightApplicationStatusID()#"/>
</cfinvoke>

<cfinvoke  component="mochi.cfc.styles.StyleGateway" method="getAllAsQuery" returnvariable="styles">
</cfinvoke>


<cfoutput>            
	<table border="1">
    	<tr>
        	<th>Author</th>
	        <th>Title of Work</th>
        	<th>Date of Birth</th>            
        	<th>Transfer</th>            
            <th>Year of Creation</th>
            <th>Publication Date</th>
            <th>Application Date</th>
            <th>Approved Date</th>
            <th>Registration Number</th>
            <th>Status</th>
        </tr>			
		<tr>
			<td>#CopyrightAuthor.getAuthor()#</td>          
			<td>#Copyright.getTitleOfWork()#</td>
			<td>#Copyright.getDescription()#</td>
			<td>#Copyright.getTransfer()#</td>
			<td>#DateFormat(Copyright.getYearOfCreation(), 'yyyy')#</td>
			<td>#DateFormat(Copyright.getPublicationDate())#</td>
			<td>#DateFormat(Copyright.getApplicationDate())#</td>
			<td>#Copyright.getApprovedDate()#</td>
			<td>#Copyright.getRegistrationNumber()#</td>
			<td>#CopyrightApplicationStatus.getStatus()#</td>
		</tr>        
	</table>

	<!--- create application by style --->
	<cfform method="post">
    	<table>
            <tr>
                <th colspan="2">APPLY COPYRIGHT BY STYLE</th>
            </tr>
          <tr>
            <th width="149" scope="row">Style Number :</th>
            <td width="168">
                <cfselect name="StyleID" query="styles" value="styleid" display="StyleName" required="yes" message="Style Number is required" queryPosition="below">
                	<option value="">Select Style
                </cfselect>
            </td>
          </tr>
          <tr>
            <td colspan="2" align="right"><cfinput type="submit" name="submit" value="Apply Copyright"></td>	
         </tr>                  	        
        </table>   
        <cfinput type="hidden" name="CopyrightsStylesID" value="0"/>
        <cfinput type="hidden" name="CopyrightID" value="#Copyright.getCopyrightID()#"/>
        
    </cfform> 
    

    <!--- create application by pattern reference --->
	<cfform method="post">
    	<table>
            <tr>
                <th colspan="2">APPLY COPYRIGHT BY PATTERN REFERENCE</th>
            </tr>
          <tr>
            <th width="149" scope="row">Pattern Reference :</th>
            <td width="168">
            	<cfinput type="text" name="PatternReference"/>
            </td>
          </tr>
          <tr>
            <td colspan="2" align="right"><cfinput type="submit" name="submit" value="Apply Copyright"></td>	
         </tr>                  	        
        </table>   
        <cfinput type="hidden" name="CopyrightsStylesID" value="0"/>
        <cfinput type="hidden" name="CopyrightID" value="#Copyright.getCopyrightID()#"/>
        
    </cfform> 

    
    <!--- create application by production date --->
	<cfform method="post">
        <table>
            <tr>
                <th colspan="2">APPLY COPYRIGHT BY PRODUCTION DATE</th>
            </tr>
            <tr>
                <th>
                    PRODUCTION SAMPLE CREATE DATES :     
        
                </th>
            </tr>
            <tr>
                <th>
                    From :
                </th>
                <td>
                    <cfinput type="datefield" name="FromSamplesCreateDate" required="yes" message="Date is required">
                </td>
            </tr>
            <tr>
                <th>
                    To :
                </th>
                <td>
                    <cfinput type="datefield" name="ToSamplesCreateDate" required="yes" message="Date is required">
                </td>
            </tr>            
            <tr>
                <td colspan="2" align="center"><cfinput type="submit" name="submit" value="Apply Copyright"><cfinput type="reset" name="reset" value="Reset"></td>
            </tr>
        
        </table>
        <cfinput type="hidden" name="CopyrightsStylesID" value="0"/>
        <cfinput type="hidden" name="CopyrightID" value="#Copyright.getCopyrightID()#"/>
            
	</cfform>
        
    
    
    

    
</cfoutput>

