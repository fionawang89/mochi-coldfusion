<!---This is used to update all the retail price of the store from AS400--->



<cfinvoke  component="mochi.cfc.wizards.Wizard" method="updateTadashiRetailStorePrice" returnvariable="status">
</cfinvoke>	

<cflocation url="index.cfm">