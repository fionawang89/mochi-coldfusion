<table width="85%" border="0" cellspacing="0" cellpadding="2">
  <tr>
    <th scope="col">PATTERN</th>
    <th scope="col">1st SAMPLE</th>
    <th scope="col">PRODUCTION PATTERN</th>
  </tr>
  <tr>
    <td>STYLE</td>
    <td>CQ1952M</td>
    <td>OC9052M</td>
  </tr>
  <tr>
    <td>BEN</td>
    <td>CQ1952M PIC</td>
    <td>OC9052M PIC</td>
  </tr>
</table>
<cfquery name="qPatterns" datasource="#APPLICATION.DATASOURCE#">
SELECT  IIf(SampleTypes.SampleTypeID=4,Styles.ProductionPatternMaker,Styles.FirstPatternMaker) AS PatternMaker, Styles.StyleName, Styles.PatternDifficulty, Styles.StyleID, Images.ThumbnailFile, SampleRequest.RequestDate, SampleTypes.SampleTypeID, SampleTypes.SampleType
FROM (((SampleRequest LEFT JOIN SampleProgress ON SampleRequest.SampleRequestID = SampleProgress.SampleRequestID) INNER JOIN Styles ON SampleRequest.StyleID = Styles.StyleID) LEFT JOIN Images ON (Styles.StyleID = Images.EntityID) AND (Styles.EntityTypeID = Images.EntityTypeID)) INNER JOIN SampleTypes ON SampleRequest.SampleTypeID = SampleTypes.SampleTypeID
WHERE (((SampleRequest.RequestDate)>#12/1/2008#))
ORDER BY  IIf(SampleTypes.SampleTypeID=4,Styles.ProductionPatternMaker,Styles.FirstPatternMaker);
</cfquery>


<cfdump var="#qPatterns#">

<cfdocument format="pdf" pagetype="legal" orientation="landscape">


<!---	<cfset curPatternMaker = ''>
    
	<cfoutput query="qPatterns" group="PatternMaker">
    	                             
                                
     <cfif curPatternMaker IS ''>
        
        	<cfset curPatternMaker = #qPatterns.PatternMaker#>            
            <tr>
            	<td>
                    <tr>            
                        <th>Pattern</th>
                    </tr>
                    <tr>    
                        <th>Style</th>
                    </tr>
                    <tr>                    
                        <th>#qPatterns.PatternMaker#</th>
                    </tr>   
                 </td>   
                 
		<cfelseif curPatternMaker NEQ #qPatterns.PatternMaker#>
        	<cfset curPatternMaker = #qPatterns.PatternMaker#>
            </tr>
            <tr>
            	<td>
                    <tr>
                        <th>Pattern</th>
                    </tr>
                    <tr>                    
                        <th>Style</th>
                    </tr>
                    <tr>    
                        <th>#qPatterns.PatternMaker#</th>
                    </tr>  
                </td>      
        <cfelse>
            	<td>
                    <tr>
                        <td>#qPatterns.SampleType#</td>
                    </tr>
                    <tr>                    
                        <td>#qPatterns.StyleName#</td>
                    </tr>
                    <tr>    
                        <td>#qPatterns.PatternMaker#</td>
                    </tr>  
                </td>              	
        </cfif>             
                       
	</cfoutput>
        </tr>
--->    

</cfdocument>