<cfcomponent name="datastore" hint="A security datastore object">

<!------------------------------------------- CONSTRUCTOR ------------------------------------------->
	<cffunction name="init" access="public" returntype="datastore" output="false">
		<cfreturn this>
	</cffunction>

<!------------------------------------------- PUBLIC ------------------------------------------->

	<cffunction name="validateUser" access="public" returntype="struct" output="false">
		<cfargument name="username" type="string" required="true">
		<cfargument name="password" type="string" required="true">
		<cfset var rtnStruct = structnew()>
		<cfset var thePassword = "">
		<cfset rtnStruct.validated = false>
		<cfset rtnStruct.qUser = "">

		<cfset thePassword = hash(arguments.password,'SHA')>
		<!--- Validate a user --->
		<cfquery name="rtnStruct.qUser">
		 select *
		 from dbo.Users
		 where username = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.username#"> and
			  userpassword = <cfqueryparam cfsqltype="cf_sql_varchar" value="#thePassword#">
		</cfquery>

		<cfif rtnStruct.qUser.recordcount>
			<cfset rtnStruct.validated = true>
		</cfif>
		<cfreturn rtnStruct>
	</cffunction>

</cfcomponent>