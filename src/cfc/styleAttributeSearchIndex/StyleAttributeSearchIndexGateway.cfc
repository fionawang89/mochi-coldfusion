<cfcomponent output="false">

	<cffunction name="getById" output="false" access="remote">
		<cfargument name="id" required="true" />
 		<cfreturn createObject("component", "StyleAttributeSearchIndexDAO").read(arguments.id)>
	</cffunction>


	<cffunction name="save" output="false" access="remote">
		<cfargument name="obj" required="true" />
 		<cfscript>
			if( obj.getStyleAttributeSearchIndexID() eq 0 )
			{
				return createObject("component", "StyleAttributeSearchIndexDAO").create(arguments.obj);
			} else {
				return createObject("component", "StyleAttributeSearchIndexDAO").update(arguments.obj);
			}
		</cfscript>
	</cffunction>


	<cffunction name="deleteById" output="false" access="remote">
		<cfargument name="id" required="true" />
		<cfset var obj = getById(arguments.id)>
		<cfset createObject("component", "StyleAttributeSearchIndexDAO").delete(obj)>
	</cffunction>



	<cffunction name="getAll" output="false" access="remote" returntype="mochi.cfc.styleAttributeSearchIndex.StyleAttributeSearchIndex[]">
		<cfset var qRead="">
		<cfset var obj="">
		<cfset var ret=arrayNew(1)>

		<cfquery name="qRead" datasource="Mochi">
			select StyleAttributeSearchIndexID
			from StyleAttributeSearchIndex
		</cfquery>

		<cfloop query="qRead">
		<cfscript>
			obj = createObject("component", "StyleAttributeSearchIndexDAO").read(qRead.StyleAttributeSearchIndexID);
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
			from StyleAttributeSearchIndex
		</cfquery>

		<cfreturn qRead>
	</cffunction>




</cfcomponent>