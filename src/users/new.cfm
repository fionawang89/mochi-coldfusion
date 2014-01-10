<cfinclude template="../shared/header.cfm">

<cfif IsDefined("form.email")>
	<!--- Check if the user already exist in the system --->
	<cfquery name="qUser" datasource="#application.datasource#">
		SELECT Email
		FROM Users
		WHERE Email = '#form.email#'
	</cfquery>
	
	<!--- If user doesn't exist create the user --->
	<cfif qUser.RECORDCOUNT IS 0>
		<cfset user=CreateObject("component", "mochi.cfc.users.User").init(form)>
		<cfinvoke component="mochi.cfc.users.UserGateway" method="save" returnvariable="savedUser"> 
				<cfinvokeargument name="obj" value="#user#"/>
		</cfinvoke>
	</cfif>
	
	<!--- Go back to users index page --->	
    <cflocation url="index.cfm">
	
</cfif>
	
	
	<cfform method="post">
	<table width="333" border="1" align="left">
	  <tr>
	    <th width="149" scope="row">First Name :</th>
	    <td width="168">
		    	<cfinput required="true" type="text" name="firstname" id="firstname" validateat="onSubmit"
		    			 message="First Name is required">
	    </td>
	  </tr>
	  <tr>
	    <th scope="row">Last Name :</th>
	    <td>
		    	<cfinput type="text" required="true" name="lastname" id="lastname" validateat="onSubmit"
		    			 message="Last Name is required">
	    </td>
	  </tr>
	  <tr>
	    <th scope="row">E-Mail Address :</th>
	    <td>
		    	<cfinput required="true"  validate="regular_expression" pattern="\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\"  type="text" name="email" id="email" validateat="onSubmit"
		    			 message="E-Mail Adress is required">
	    </td>
	  </tr>
	  <tr>
	    <th scope="row">Password :</th>
	    <td>
	        	<cfinput required="true" type="password" name="password" id="password" validateat="onSubmit"
	        			 message="Password is required">
	    </td>
	  </tr>
	  <tr>
	    <th scope="row">Roles :</th>
	    <td>
	            <select name="roles" id="roles">
	                <option value="user">USER</option>
	                <option value="sales">SALES</option>                    
	                <option value="admin">ADMINISTRATOR</option>
	                <option value="reports">REPORTS</option>
	            </select>
		</span>            
	    </td>
	  </tr>
	  <tr>
		<td colspan="2"><cfinput type="submit" name="submit" value="Create User"></td>	
	 </tr>
	</table>
	  

	<cfinput type="hidden" name="createdby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="lastmaintainedby" value="#GetAuthUser()#">  
	<cfinput type="hidden" name="userid" value="0">  	

</cfform>
	
