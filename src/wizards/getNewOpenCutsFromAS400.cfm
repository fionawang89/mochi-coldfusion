
<!--- cfc method to get new cuts from company 1 in AS400 --->
<cfinvoke  component="mochi.cfc.wizards.Wizard" method="getNewOpenCutsInCompanyOneFromAS400" returnvariable="getNewOpenCutsInCompanyOneFromAS400Ret">
</cfinvoke>

<!--- cfc method to get new cuts from company 3 in AS400 --->
<cfinvoke  component="mochi.cfc.wizards.Wizard" method="getNewOpenCutsInCompanyThreeFromAS400" returnvariable="getNewOpenCutsInCompanyThreeFromAS400Ret">
</cfinvoke>




<cflocation url="index.cfm">