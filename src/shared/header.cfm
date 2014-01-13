<html>
<head>
	<link href="../assets/style.css" rel="stylesheet" media="all" type="text/css" />
	<link href="../assets/bootstrap/dist/css/bootstrap.css" rel="stylesheet" media="all" type="text/css" />
    <script src="../assets/bootstrap/dist/js/bootstrap.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html" charset="utf-8">
</head>
<body>
<cfmenu name="menu" type="horizontal" fontsize="14">
	<cfmenuitem name="production" href="/mochi/productionProgress/index.cfm" display="Production" class="test"/>      
	<cfmenuitem name="productionReports" href="/mochi/productionReports/index.cfm" display="Production Reports"/>      
	<cfmenuitem name="samples" href="/mochi/sampleRequests/index.cfm" display="Samples"/>    
	<cfmenuitem name="copyrights" href="/mochi/copyrights/index.cfm" display="Copyrights"/>    
	<cfmenuitem name="fittings" href="/mochi/fittings/index.cfm" display="Fittings"/>    
    
    <cfmenuitem name="fabrics" display="Fabrics">
		<!---<cfmenuitem name="fabricPlans" href="/mochi/fabricPlans/index.cfm" display="Fabric Plans"/>  --->              
		<cfmenuitem name="solidFabrics" href="/mochi/solidFabrics/index.cfm" display="All Fabrics"/>    
    </cfmenuitem>
    
   	<cfmenuitem name="datas" display="Datas">
	    <cfmenuitem name="artworks" href="/mochi/artworks/index.cfm" display="Artworks"/>            
	    <cfmenuitem name="beadingStatus" href="/mochi/beadingStatus/index.cfm" display="Beading Status"/>                    
	    <cfmenuitem name="collection" href="/mochi/collections/index.cfm" display="Collections"/>            
		<cfmenuitem name="color" href="/mochi/colors/index.cfm" display="Colors"/>        
		<cfmenuitem name="contractor" href="/mochi/contractors/index.cfm" display="Contractors"/>                
		<cfmenuitem name="copyrightApplicationStatus" href="/mochi/copyrightApplicationStatus/index.cfm" display="Copyright Application Status"/>                
		<cfmenuitem name="copyrightAuthors" href="/mochi/copyrightAuthors/index.cfm" display="Copyright Authors"/>                
	    <cfmenuitem name="counterSampleStatus" href="/mochi/counterSampleStatus/index.cfm" display="Counter Sample Status"/>                    
		<cfmenuitem name="customer" href="/mochi/customers/index.cfm" display="Customers"/>                
		<cfmenuitem name="deliveries" href="/mochi/deliveries/index.cfm" display="Deliveries"/>                
		<cfmenuitem name="fabricLabDipStatus" href="/mochi/fabricLabDipStatus/index.cfm" display="Fabric Lab Dip Status"/>                
		<cfmenuitem name="fabricSampleOrderStatus" href="/mochi/fabricSampleOrderStatus/index.cfm" display="Fabric Sample Order Status"/>                
		<cfmenuitem name="fabricRequestStatus" href="/mochi/fabricRequestStatus/index.cfm" display="Fabric Request Status"/>                
		<cfmenuitem name="fabricRequestType" href="/mochi/fabricRequestTypes/index.cfm" display="Fabric Request Type"/>                
	    <cfmenuitem name="fabricTrimStatus" href="/mochi/fabricTrimStatus/index.cfm" display="Fabric Trim Status"/>                    
		<cfmenuitem name="location" href="/mochi/locations/index.cfm" display="Locations"/>                        
		<cfmenuitem name="material" href="/mochi/materials/index.cfm" display="Materials"/>        
		<cfmenuitem name="materialCategory" href="/mochi/materialCategories/index.cfm" display="Material Categories"/>                
		<cfmenuitem name="patternmaker" href="/mochi/patternmakers/index.cfm" display="Pattern Makers"/>            
		<cfmenuitem name="patternPriorities" href="/mochi/patternPriorities/index.cfm" display="Pattern Priorities"/>            
		<cfmenuitem name="patternStatus" href="/mochi/patternStatus/index.cfm" display="Pattern Status"/>            
		<cfmenuitem name="productionDetailStatus" href="/mochi/productionDetailStatus/index.cfm" display="Production Detail Status"/>                
		<cfmenuitem name="productionStatus" href="/mochi/productionStatus/index.cfm" display="Production Status"/>                
		<cfmenuitem name="requestStatus" href="/mochi/requestStatus/index.cfm" display="Request Status"/>                
		<cfmenuitem name="resultCodes" href="/mochi/resultCodes/index.cfm" display="Result Codes"/>            
		<cfmenuitem name="sampleType" href="/mochi/sampleTypes/index.cfm" display="Sample Types"/>                
		<cfmenuitem name="size" href="/mochi/sizes/index.cfm" display="Sizes"/>            
		<cfmenuitem name="style" href="/mochi/styles/index.cfm" display="Styles"/>        
		<cfmenuitem name="styleAttributes" href="/mochi/styleAttributes/index.cfm" display="Style Attributes"/>        
		<cfmenuitem name="styleAttributeOptions" href="/mochi/styleAttributeOptions/index.cfm" display="Style Attribute Options"/>        
		<cfmenuitem name="user" href="/mochi/users/index.cfm" display="Users"/>            
		<cfmenuitem name="vendor" href="/mochi/vendors/index.cfm" display="Vendors"/>            
		<cfmenuitem name="years" href="/mochi/years/index.cfm" display="Years"/>                
    </cfmenuitem>
    
    <cfif IsUserInRole("admin")>
      <cfmenuitem name="master" display="Master Files">
        <cfmenuitem name="process" href="/mochi/processes/index.cfm" display="Process"/>                        
        <cfmenuitem name="materialOperation" href="/mochi/materialOperations/index.cfm" display="Material Operations"/>                        
        <cfmenuitem name="materialProcess" href="/mochi/materialProcesses/index.cfm" display="Material Process"/>                        
        <cfmenuitem name="operationOperationProcess" href="/mochi/materialOperationsProcesses/index.cfm" display="Material Operation Process"/>                                
        <cfmenuitem name="operation" href="/mochi/operations/index.cfm" display="Operations"/>                        
        <cfmenuitem name="operationProcess" href="/mochi/operationsProcesses/index.cfm" display="Operation Process"/>                                
        <cfmenuitem name="entityType" href="/mochi/entityTypes/index.cfm" display="Entity Types"/>                                
        <cfmenuitem name="materialType" href="/mochi/materialTypes/index.cfm" display="Material Types"/>              
      </cfmenuitem> 
    </cfif>
    
	<cfmenuitem name="reports" href="/mochi/reports/index.cfm" display="Reports">
        <cfmenuitem name="mainReport" href="/mochi/reports/index.cfm" display="Main"/>                        
		<cfmenuitem name="similarPatternsReport" href="/mochi/reports/SimilarPatternsReport.cfm" display="Similar Patterns"/>
        <cfmenuitem name="firstSamplesReport" href="/mochi/reports/FirstSamplesReport.cfm" display="First Samples"/>                            
        <cfmenuitem name="performanceReport" href="/mochi/reports/PerformanceReport.cfm" display="Performance"/>                            
        <cfmenuitem name="deliveryReport" href="/mochi/reports/StylesDeliveryReport.cfm" display="Deliveries"/>                            
        <cfmenuitem name="OpenFirstSampleChart" href="/mochi/reports/OpenFirstSampleChart.cfm" display="Open First Samples"/>                            
        <cfmenuitem name="OpenProductionSampleChart" href="/mochi/reports/OpenProductionSampleReport.cfm" display="Open Production Samples"/>
		<cfmenuitem name="OpenJapanSampleChart" href="/mochi/reports/OpenJapanSampleReport.cfm" display="Open Japan Samples"/>
        <cfmenuitem name="OpenDuplicationSampleChart" href="/mochi/reports/OpenDuplicationSampleReport.cfm" display="Open Duplication Samples"/>                            
        <cfmenuitem name="FirstSamplesPlanShipDate" href="/mochi/reports/FirstSamplePlanShipDateReport.cfm" display="Samples Plan Ship Date"/>        <cfmenuitem name="Copyright" href="/mochi/reports/Copyright.cfm" display="Copyright"/>                    
    </cfmenuitem>    
    <cfif IsUserInRole("admin")>
      <cfmenuitem name="wizards" href="/mochi/wizards/index.cfm" display="Wizards"/>              
      <cfmenuitem name="emails" href="/mochi/emails/index.cfm" display="E-Mails"/>              
    </cfif>    
    <cfmenuitem name="forum" target="_blank" href="http://10.1.1.20:8500/blog/" display="Forum"/>      
	<cfmenuitem name="logout" href="/mochi/login/logout.cfm" display="Log Out ( #GetAuthUser()#)"/>                
</cfmenu>

<br/>
