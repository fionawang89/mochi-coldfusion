<cfcomponent output="false">

	<cffunction name="getById" output="false" access="remote">
		<cfargument name="id" required="true" />
 		<cfreturn createObject("component", "ProductionProgressDetailDAO").read(arguments.id)>
	</cffunction>


	<cffunction name="save" output="false" access="remote">
		<cfargument name="obj" required="true" />
 		<cfscript>
			if( obj.getProductionProgressDetailID() eq 0 )
			{
				return createObject("component", "ProductionProgressDetailDAO").create(arguments.obj);
			} else {
				return createObject("component", "ProductionProgressDetailDAO").update(arguments.obj);
			}
		</cfscript>
	</cffunction>


	<cffunction name="deleteById" output="false" access="remote">
		<cfargument name="id" required="true" />
		<cfset var obj = getById(arguments.id)>
		<cfset createObject("component", "ProductionProgressDetailDAO").delete(obj)>
	</cffunction>



	<cffunction name="getAll" output="false" access="remote" returntype="mochi.cfc.productionProgress.ProductionProgressDetail[]">
		<cfset var qRead="">
		<cfset var obj="">
		<cfset var ret=arrayNew(1)>

		<cfquery name="qRead" datasource="Mochi">
			select ProductionProgressDetailID
			from ProductionProgressDetail
		</cfquery>

		<cfloop query="qRead">
		<cfscript>
			obj = createObject("component", "ProductionProgressDetailDAO").read(qRead.ProductionProgressDetailID);
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
			from ProductionProgressDetail
		</cfquery>

		<cfreturn qRead>
	</cffunction>


	<cffunction name="getAllByProductionProgressID" output="false" access="remote" returntype="query">
		<cfargument name="id" required="true">
		<cfargument name="fieldlist" default="*" hint="List of columns to be returned in the query.">

		<cfset var qRead="">

		<cfquery name="qRead" datasource="Mochi">
			select #arguments.fieldList#
			from  ProductionProgressDetail, OperationsProcesses			
			where ProductionProgressDetail.OperationProcessID = OperationsProcesses.OperationProcessID 
			and   ProductionProgressID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
			order by OperationsProcesses.Sequence ASC
		</cfquery>

		<cfreturn qRead>
	</cffunction>


</cfcomponent>