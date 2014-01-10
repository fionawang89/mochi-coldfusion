<cfcomponent output="false" alias="mochi.cfc.materials.Material">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="MaterialID" type="numeric" default="0">
	<cfproperty name="EntityTypeID" type="numeric" default="0">
	<cfproperty name="MaterialCode" type="string" default="">
	<cfproperty name="Description" type="string" default="">
	<cfproperty name="MaterialClassID" type="numeric" default="0">
	<cfproperty name="MaterialTypeID" type="numeric" default="0">
	<cfproperty name="MaterialCategoryID" type="numeric" default="0">
	<cfproperty name="Width" type="string" default="">
	<cfproperty name="Content" type="string" default="">
	<cfproperty name="CreatedBy" type="string" default="">
	<cfproperty name="CreatedDate" type="date" default="">
	<cfproperty name="LastMaintainedBy" type="string" default="">
	<cfproperty name="LastMaintainedDate" type="date" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.MaterialID = 0;
		variables.EntityTypeID = 0;
		variables.MaterialCode = "";
		variables.Description = "";
		variables.MaterialClassID = 0;
		variables.MaterialTypeID = 0;
		variables.MaterialCategoryID = 0;
		variables.Width = "";
		variables.Content = "";
		variables.CreatedBy = "";
		variables.CreatedDate = "";
		variables.LastMaintainedBy = "";
		variables.LastMaintainedDate = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="Material">
		<cfargument name="stValues" required="false" type="struct">
			<cfif IsDefined("arguments.stValues")>
				<cfset variables.MaterialID=stValues.MaterialID>
				<cfset variables.EntityTypeID=5>
				<cfset variables.MaterialCode=stValues.MaterialCode>
				<cfset variables.Description=stValues.Description>
				<cfset variables.MaterialTypeID=stValues.MaterialTypeID>
				<cfset variables.MaterialClassID=stValues.MaterialClassID>
				<cfset variables.MaterialCategoryID=stValues.MaterialCategoryID>
				<cfset variables.Width=stValues.Width>
				<cfset variables.Content=stValues.Content>
				<cfset variables.createdby=stValues.createdby>
				<cfset variables.createddate=stValues.createddate>
				<cfset variables.lastmaintainedby=stValues.lastmaintainedby>
				<cfset variables.lastmaintaineddate=stValues.lastmaintaineddate>
			</cfif>
		<cfreturn this>
	</cffunction>
	<cffunction name="getMaterialID" output="false" access="public" returntype="any">
		<cfreturn variables.MaterialID>
	</cffunction>

	<cffunction name="setMaterialID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.MaterialID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getEntityTypeID" output="false" access="public" returntype="any">
		<cfreturn variables.EntityTypeID>
	</cffunction>

	<cffunction name="setEntityTypeID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.EntityTypeID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getMaterialCode" output="false" access="public" returntype="any">
		<cfreturn variables.MaterialCode>
	</cffunction>

	<cffunction name="setMaterialCode" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.MaterialCode = arguments.val>
	</cffunction>

	<cffunction name="getDescription" output="false" access="public" returntype="any">
		<cfreturn variables.Description>
	</cffunction>

	<cffunction name="setDescription" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Description = arguments.val>
	</cffunction>

	<cffunction name="getMaterialClassID" output="false" access="public" returntype="any">
		<cfreturn variables.MaterialClassID>
	</cffunction>

	<cffunction name="setMaterialClassID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.MaterialClassID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getMaterialTypeID" output="false" access="public" returntype="any">
		<cfreturn variables.MaterialTypeID>
	</cffunction>

	<cffunction name="setMaterialTypeID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.MaterialTypeID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getMaterialCategoryID" output="false" access="public" returntype="any">
		<cfreturn variables.MaterialCategoryID>
	</cffunction>

	<cffunction name="setMaterialCategoryID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.MaterialCategoryID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getWidth" output="false" access="public" returntype="any">
		<cfreturn variables.Width>
	</cffunction>

	<cffunction name="setWidth" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Width = arguments.val>
	</cffunction>

	<cffunction name="getContent" output="false" access="public" returntype="any">
		<cfreturn variables.Content>
	</cffunction>

	<cffunction name="setContent" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Content = arguments.val>
	</cffunction>

	<cffunction name="getCreatedBy" output="false" access="public" returntype="any">
		<cfreturn variables.CreatedBy>
	</cffunction>

	<cffunction name="setCreatedBy" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CreatedBy = arguments.val>
	</cffunction>

	<cffunction name="getCreatedDate" output="false" access="public" returntype="any">
		<cfreturn variables.CreatedDate>
	</cffunction>

	<cffunction name="setCreatedDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CreatedDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getLastMaintainedBy" output="false" access="public" returntype="any">
		<cfreturn variables.LastMaintainedBy>
	</cffunction>

	<cffunction name="setLastMaintainedBy" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LastMaintainedBy = arguments.val>
	</cffunction>

	<cffunction name="getLastMaintainedDate" output="false" access="public" returntype="any">
		<cfreturn variables.LastMaintainedDate>
	</cffunction>

	<cffunction name="setLastMaintainedDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.LastMaintainedDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>



</cfcomponent>