<cfcomponent output="false">

	<cffunction name="getById" output="false" access="remote">
		<cfargument name="id" required="true" />
 		<cfreturn createObject("component", "StyleAttributeOptionDAO").read(arguments.id)>
	</cffunction>


	<cffunction name="save" output="false" access="remote">
		<cfargument name="obj" required="true" />
 		<cfscript>
			if( obj.getStyleAttributeOptionID() eq 0 )
			{
				return createObject("component", "StyleAttributeOptionDAO").create(arguments.obj);
			} else {
				return createObject("component", "StyleAttributeOptionDAO").update(arguments.obj);
			}
		</cfscript>
	</cffunction>


	<cffunction name="deleteById" output="false" access="remote">
		<cfargument name="id" required="true" />
		<cfset var obj = getById(arguments.id)>
		<cfset createObject("component", "StyleAttributeOptionDAO").delete(obj)>
	</cffunction>



	<cffunction name="getAll" output="false" access="remote" returntype="mochi.cfc.styleAttributeOptions.StyleAttributeOption[]">
		<cfset var qRead="">
		<cfset var obj="">
		<cfset var ret=arrayNew(1)>

		<cfquery name="qRead" datasource="Mochi">
			select StyleAttributeOptionID
			from StyleAttributeOptions
		</cfquery>

		<cfloop query="qRead">
		<cfscript>
			obj = createObject("component", "StyleAttributeOptionDAO").read(qRead.StyleAttributeOptionID);
			ArrayAppend(ret, obj);
		</cfscript>
		</cfloop>
		<cfreturn ret>
	</cffunction>



	<cffunction name="getAllAsQuery" output="false" access="remote" returntype="query">
		<cfargument name="fieldlist" default="*" hint="List of columns to be returned in the query.">

		<cfset var qRead="">

		<cfquery name="qRead" datasource="Mochi">
			select #arguments.fieldList#
			from StyleAttributeOptions
		</cfquery>

		<cfreturn qRead>
	</cffunction>

	<cffunction name="getAllAsQueryByStyleAttributeID" output="false" access="remote" returntype="query">
		<cfargument name="fieldlist" default="*" hint="List of columns to be returned in the query.">
		<cfargument name="StyleAttributeID" required="true" />

		<cfset var qRead="">

		<cfquery name="qRead" datasource="Mochi">
			select #arguments.fieldList#
			from StyleAttributeOptions
            where StyleAttributeID = #arguments.StyleAttributeID#
            order by AttributeValue ASC
		</cfquery>

		<cfreturn qRead>
	</cffunction>




</cfcomponent>