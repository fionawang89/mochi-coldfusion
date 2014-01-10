<cfcomponent output="false">

	<cffunction name="getById" output="false" access="remote">
		<cfargument name="id" required="true" />
 		<cfreturn createObject("component", "JOBSUM0DAO").read(arguments.id)>
	</cffunction>


	<cffunction name="save" output="false" access="remote">
		<cfargument name="obj" required="true" />
 		<cfscript>
			if( obj.getCONO8Q() eq 0 )
			{
				return createObject("component", "JOBSUM0DAO").create(arguments.obj);
			} else {
				return createObject("component", "JOBSUM0DAO").update(arguments.obj);
			}
		</cfscript>
	</cffunction>


	<cffunction name="deleteById" output="false" access="remote">
		<cfargument name="id" required="true" />
		<cfset var obj = getById(arguments.id)>
		<cfset createObject("component", "JOBSUM0DAO").delete(obj)>
	</cffunction>



	<cffunction name="getAll" output="false" access="remote" returntype="mochi.cfc.as400.JOBSUM0[]">
		<cfset var qRead="">
		<cfset var obj="">
		<cfset var ret=arrayNew(1)>

		<cfquery name="qRead" datasource="AS400">
			select CONO8Q
			from VPSFILES.JOBSUM0
		</cfquery>

		<cfloop query="qRead">
		<cfscript>
			obj = createObject("component", "JOBSUM0DAO").read(qRead.CONO8Q);
			ArrayAppend(ret, obj);
		</cfscript>
		</cfloop>
		<cfreturn ret>
	</cffunction>



	<cffunction name="getAllAsQuery" output="false" access="remote" returntype="query">
		<cfargument name="fieldlist" default="*" hint="List of columns to be returned in the query.">

		<cfset var qRead="">

		<cfquery name="qRead" datasource="AS400">
			select #arguments.fieldList#
			from VPSFILES.JOBSUM0
		</cfquery>

		<cfreturn qRead>
	</cffunction>




</cfcomponent>