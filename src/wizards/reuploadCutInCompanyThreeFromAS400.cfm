<cfif IsDefined("form.cut")>

<cfinvoke  component="mochi.cfc.wizards.Wizard" method="reuploadCutInCompanyThreeFromAS400" returnvariable="reuploadCutInCompanyOneFromAS400Ret">
	<cfinvokeargument name="cut" value="#form.cut#"/>
</cfinvoke>

</cfif>


<cfform>
	Enter Cut : <cfinput type="text" name="cut"> <cfinput type="submit" name="submit" value="Submit">
</cfform>