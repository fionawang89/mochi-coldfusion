<cfcomponent output="false">

	<cffunction name="getById" output="false" access="remote">
		<cfargument name="id" required="true" />
 		<cfreturn createObject("component", "FittingCommentDAO").read(arguments.id)>
	</cffunction>


	<cffunction name="save" output="false" access="remote">
		<cfargument name="obj" required="true" />
 		<cfscript>
			if( obj.getFittingCommentID() eq 0 )
			{
				return createObject("component", "FittingCommentDAO").create(arguments.obj);
			} else {
				return createObject("component", "FittingCommentDAO").update(arguments.obj);
			}
		</cfscript>
	</cffunction>


	<cffunction name="deleteById" output="false" access="remote">
		<cfargument name="id" required="true" />
		<cfset var obj = getById(arguments.id)>
		<cfset createObject("component", "FittingCommentDAO").delete(obj)>
	</cffunction>



	<cffunction name="getAll" output="false" access="remote" returntype="mochi.cfc.fittingComments.FittingComment[]">
		<cfset var qRead="">
		<cfset var obj="">
		<cfset var ret=arrayNew(1)>

		<cfquery name="qRead" datasource="Mochi">
			select FittingCommentID
			from FittingComments
		</cfquery>

		<cfloop query="qRead">
		<cfscript>
			obj = createObject("component", "FittingCommentDAO").read(qRead.FittingCommentID);
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
			from FittingComments
		</cfquery>

		<cfreturn qRead>
	</cffunction>
	
	
	
	<cffunction name="getAllAsQueryByFittingID" output="false" access="remote" returntype="query">
		<cfargument name="id" required="true" />
		<cfargument name="fieldlist" default="*" hint="List of columns to be returned in the query.">

		<cfset var qRead="">

		<cfquery name="qRead" datasource="Mochi">
			select #arguments.fieldList#
			from FittingComments
			where FittingID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfreturn qRead>
	</cffunction>
	




</cfcomponent>