<cfcomponent output="false" alias="mochi.cfc.images.Image">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="ImageID" type="numeric" default="0">
	<cfproperty name="EntityTypeID" type="numeric" default="0">
	<cfproperty name="EntityID" type="numeric" default="0">
	<cfproperty name="Description" type="string" default="">
	<cfproperty name="Location" type="string" default="">
	<cfproperty name="URL" type="string" default="">
	<cfproperty name="ContentType" type="string" default="">
	<cfproperty name="File" type="string" default="">
	<cfproperty name="FileName" type="string" default="">
	<cfproperty name="FileExtension" type="string" default="">
	<cfproperty name="Height" type="numeric" default="0">
	<cfproperty name="Width" type="numeric" default="0">
	<cfproperty name="FileSize" type="numeric" default="0">
	<cfproperty name="ThumbnailFile" type="string" default="">
	<cfproperty name="ThumbnailFileName" type="string" default="">
	<cfproperty name="ThumbnailHeight" type="numeric" default="0">
	<cfproperty name="ThumbnailWidth" type="numeric" default="0">
	<cfproperty name="CreatedDate" type="date" default="">
	<cfproperty name="CreatedBy" type="string" default="">
	<cfproperty name="LastMaintainedDate" type="date" default="">
	<cfproperty name="LastMaintainedBy" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.ImageID = 0;
		variables.EntityTypeID = 0;
		variables.EntityID = 0;
		variables.Description = "";
		variables.Location = "";
		variables.URL = "";
		variables.ContentType = "";
		variables.File = "";
		variables.FileName = "";
		variables.FileExtension = "";
		variables.Height = 0;
		variables.Width = 0;
		variables.FileSize = 0;
		variables.ThumbnailFile = "";
		variables.ThumbnailFileName = "";
		variables.ThumbnailHeight = 0;
		variables.ThumbnailWidth = 0;
		variables.CreatedDate = "";
		variables.CreatedBy = "";
		variables.LastMaintainedDate = "";
		variables.LastMaintainedBy = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="Image">
		<cfargument name="stValues" required="false" type="struct">
			<cfif IsDefined("arguments.stValues")>
				<cfset variables.ImageID=stValues.ImageID>
				<cfset variables.EntityTypeID=stValues.EntityTypeID>
				<cfset variables.EntityID=stValues.EntityID>
				<cfset variables.Description=stValues.description>
				<cfset variables.Location=stValues.location>
				<cfset variables.URL=stValues.url>
				<cfset variables.Description=stValues.description>
				<cfset variables.ContentType=stValues.contenttype>
				<cfset variables.File=stValues.file>
				<cfset variables.FileName=stValues.filename>
				<cfset variables.FileExtension=stValues.fileextension>
				<cfset variables.Height=stValues.Height>
				<cfset variables.Width=stValues.Width>
				<cfset variables.FileSize=stValues.filesize>
				<cfset variables.ThumbnailFile=stValues.ThumbnailFile>
				<cfset variables.ThumbnailFileName=stValues.ThumbnailFileName> 
				<cfset variables.ThumbnailHeight=stValues.ThumbnailHeight> 
				<cfset variables.ThumbnailWidth=stValues.ThumbnailWidth>
				<cfset variables.createdby=stValues.createdby>
				<cfset variables.createddate=stValues.createddate>
				<cfset variables.lastmaintainedby=stValues.lastmaintainedby>
				<cfset variables.lastmaintaineddate=stValues.lastmaintaineddate>
			</cfif>
		<cfreturn this>		
	</cffunction>
	
	<cffunction name="getImageID" output="false" access="public" returntype="any">
		<cfreturn variables.ImageID>
	</cffunction>

	<cffunction name="setImageID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ImageID = arguments.val>
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

	<cffunction name="getEntityID" output="false" access="public" returntype="any">
		<cfreturn variables.EntityID>
	</cffunction>

	<cffunction name="setEntityID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.EntityID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDescription" output="false" access="public" returntype="any">
		<cfreturn variables.Description>
	</cffunction>

	<cffunction name="setDescription" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Description = arguments.val>
	</cffunction>

	<cffunction name="getLocation" output="false" access="public" returntype="any">
		<cfreturn variables.Location>
	</cffunction>

	<cffunction name="setLocation" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Location = arguments.val>
	</cffunction>

	<cffunction name="getURL" output="false" access="public" returntype="any">
		<cfreturn variables.URL>
	</cffunction>

	<cffunction name="setURL" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.URL = arguments.val>
	</cffunction>

	<cffunction name="getContentType" output="false" access="public" returntype="any">
		<cfreturn variables.ContentType>
	</cffunction>

	<cffunction name="setContentType" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ContentType = arguments.val>
	</cffunction>

	<cffunction name="getFile" output="false" access="public" returntype="any">
		<cfreturn variables.File>
	</cffunction>

	<cffunction name="setFile" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.File = arguments.val>
	</cffunction>

	<cffunction name="getFileName" output="false" access="public" returntype="any">
		<cfreturn variables.FileName>
	</cffunction>

	<cffunction name="setFileName" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.FileName = arguments.val>
	</cffunction>

	<cffunction name="getFileExtension" output="false" access="public" returntype="any">
		<cfreturn variables.FileExtension>
	</cffunction>

	<cffunction name="setFileExtension" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.FileExtension = arguments.val>
	</cffunction>

	<cffunction name="getHeight" output="false" access="public" returntype="any">
		<cfreturn variables.Height>
	</cffunction>

	<cffunction name="setHeight" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Height = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getWidth" output="false" access="public" returntype="any">
		<cfreturn variables.Width>
	</cffunction>

	<cffunction name="setWidth" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Width = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getFileSize" output="false" access="public" returntype="any">
		<cfreturn variables.FileSize>
	</cffunction>

	<cffunction name="setFileSize" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.FileSize = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getThumbnailFile" output="false" access="public" returntype="any">
		<cfreturn variables.ThumbnailFile>
	</cffunction>

	<cffunction name="setThumbnailFile" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ThumbnailFile = arguments.val>
	</cffunction>

	<cffunction name="getThumbnailFileName" output="false" access="public" returntype="any">
		<cfreturn variables.ThumbnailFileName>
	</cffunction>

	<cffunction name="setThumbnailFileName" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ThumbnailFileName = arguments.val>
	</cffunction>

	<cffunction name="getThumbnailHeight" output="false" access="public" returntype="any">
		<cfreturn variables.ThumbnailHeight>
	</cffunction>

	<cffunction name="setThumbnailHeight" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ThumbnailHeight = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getThumbnailWidth" output="false" access="public" returntype="any">
		<cfreturn variables.ThumbnailWidth>
	</cffunction>

	<cffunction name="setThumbnailWidth" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ThumbnailWidth = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
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

	<cffunction name="getCreatedBy" output="false" access="public" returntype="any">
		<cfreturn variables.CreatedBy>
	</cffunction>

	<cffunction name="setCreatedBy" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CreatedBy = arguments.val>
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

	<cffunction name="getLastMaintainedBy" output="false" access="public" returntype="any">
		<cfreturn variables.LastMaintainedBy>
	</cffunction>

	<cffunction name="setLastMaintainedBy" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LastMaintainedBy = arguments.val>
	</cffunction>



</cfcomponent>