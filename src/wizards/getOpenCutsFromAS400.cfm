<!---This is used to load all the open cuts from AS400--->


<cfinvoke  component="mochi.cfc.wizards.Wizard" method="getOpenCutsFromAS400" returnvariable="status">
</cfinvoke>	

<cflocation url="index.cfm">