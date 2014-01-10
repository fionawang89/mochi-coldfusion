<cfcomponent output="false" alias="mochi.cfc.as400.ORDHDR0">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="CONO2Y" type="numeric" default="0">
	<cfproperty name="ORNO2Y" type="numeric" default="0">
	<cfproperty name="CSNO2Y" type="numeric" default="0">
	<cfproperty name="CSSN2Y" type="string" default="">
	<cfproperty name="SHNO2Y" type="numeric" default="0">
	<cfproperty name="DCNO2Y" type="numeric" default="0">
	<cfproperty name="BLNO2Y" type="numeric" default="0">
	<cfproperty name="BLFN2Y" type="string" default="">
	<cfproperty name="BLA12Y" type="string" default="">
	<cfproperty name="BLA22Y" type="string" default="">
	<cfproperty name="BLCT2Y" type="string" default="">
	<cfproperty name="BLST2Y" type="string" default="">
	<cfproperty name="BLZP2Y" type="string" default="">
	<cfproperty name="BLEX2Y" type="string" default="">
	<cfproperty name="BLCY2Y" type="string" default="">
	<cfproperty name="BLFA2Y" type="string" default="">
	<cfproperty name="SHFN2Y" type="string" default="">
	<cfproperty name="SHA12Y" type="string" default="">
	<cfproperty name="SHA22Y" type="string" default="">
	<cfproperty name="SHCT2Y" type="string" default="">
	<cfproperty name="SHST2Y" type="string" default="">
	<cfproperty name="SHZP2Y" type="string" default="">
	<cfproperty name="SHEX2Y" type="string" default="">
	<cfproperty name="SHCY2Y" type="string" default="">
	<cfproperty name="SHFA2Y" type="string" default="">
	<cfproperty name="DVNO2Y" type="numeric" default="0">
	<cfproperty name="SNNO2Y" type="numeric" default="0">
	<cfproperty name="SBSN2Y" type="numeric" default="0">
	<cfproperty name="SASN2Y" type="numeric" default="0">
	<cfproperty name="ORDT2Y" type="numeric" default="0">
	<cfproperty name="SSDT2Y" type="numeric" default="0">
	<cfproperty name="CNDT2Y" type="numeric" default="0">
	<cfproperty name="CMDT2Y" type="numeric" default="0">
	<cfproperty name="STDT2Y" type="numeric" default="0">
	<cfproperty name="TMDT2Y" type="numeric" default="0">
	<cfproperty name="CSDP2Y" type="string" default="">
	<cfproperty name="CSPO2Y" type="string" default="">
	<cfproperty name="ORTP2Y" type="string" default="">
	<cfproperty name="BKDS2Y" type="string" default="">
	<cfproperty name="BKNO2Y" type="numeric" default="0">
	<cfproperty name="ORST2Y" type="string" default="">
	<cfproperty name="SVCD2Y" type="string" default="">
	<cfproperty name="SVDS2Y" type="string" default="">
	<cfproperty name="FBCD2Y" type="string" default="">
	<cfproperty name="FBDS2Y" type="string" default="">
	<cfproperty name="CLFR2Y" type="string" default="">
	<cfproperty name="CLIN2Y" type="string" default="">
	<cfproperty name="TMCD2Y" type="string" default="">
	<cfproperty name="TMDS2Y" type="string" default="">
	<cfproperty name="BYNO2Y" type="numeric" default="0">
	<cfproperty name="SHPR2Y" type="numeric" default="0">
	<cfproperty name="ORPR2Y" type="numeric" default="0">
	<cfproperty name="SMN12Y" type="numeric" default="0">
	<cfproperty name="SMP12Y" type="numeric" default="0">
	<cfproperty name="CMN12Y" type="numeric" default="0">
	<cfproperty name="CMD12Y" type="numeric" default="0">
	<cfproperty name="SMN22Y" type="numeric" default="0">
	<cfproperty name="SMP22Y" type="numeric" default="0">
	<cfproperty name="CMN22Y" type="numeric" default="0">
	<cfproperty name="CMD22Y" type="numeric" default="0">
	<cfproperty name="SMN32Y" type="numeric" default="0">
	<cfproperty name="SMP32Y" type="numeric" default="0">
	<cfproperty name="CMN32Y" type="numeric" default="0">
	<cfproperty name="CMD32Y" type="numeric" default="0">
	<cfproperty name="SMDF2Y" type="numeric" default="0">
	<cfproperty name="TXNO2Y" type="numeric" default="0">
	<cfproperty name="CTN12Y" type="numeric" default="0">
	<cfproperty name="CTN22Y" type="numeric" default="0">
	<cfproperty name="CTN32Y" type="numeric" default="0">
	<cfproperty name="PRNO2Y" type="numeric" default="0">
	<cfproperty name="CMNO2Y" type="numeric" default="0">
	<cfproperty name="TDNO2Y" type="numeric" default="0">
	<cfproperty name="JBRF2Y" type="string" default="">
	<cfproperty name="DUDT2Y" type="numeric" default="0">
	<cfproperty name="TLLN2Y" type="numeric" default="0">
	<cfproperty name="TLUN2Y" type="numeric" default="0">
	<cfproperty name="TLSL2Y" type="numeric" default="0">
	<cfproperty name="TLDB2Y" type="numeric" default="0">
	<cfproperty name="TLSC2Y" type="numeric" default="0">
	<cfproperty name="INTL2Y" type="numeric" default="0">
	<cfproperty name="TLDA2Y" type="numeric" default="0">
	<cfproperty name="NTTL2Y" type="numeric" default="0">
	<cfproperty name="TLOU2Y" type="numeric" default="0">
	<cfproperty name="TLOD2Y" type="numeric" default="0">
	<cfproperty name="TLIU2Y" type="numeric" default="0">
	<cfproperty name="TLID2Y" type="numeric" default="0">
	<cfproperty name="TLDU2Y" type="numeric" default="0">
	<cfproperty name="TLDD2Y" type="numeric" default="0">
	<cfproperty name="TLCU2Y" type="numeric" default="0">
	<cfproperty name="TLCD2Y" type="numeric" default="0">
	<cfproperty name="CRCK2Y" type="string" default="">
	<cfproperty name="NOEX2Y" type="numeric" default="0">
	<cfproperty name="DTEX2Y" type="string" default="">
	<cfproperty name="CONV2Y" type="string" default="">
	<cfproperty name="APTP2Y" type="string" default="">
	<cfproperty name="OSTS2Y" type="string" default="">
	<cfproperty name="ORCL2Y" type="string" default="">
	<cfproperty name="PSBK2Y" type="string" default="">
	<cfproperty name="CRWS2Y" type="string" default="">
	<cfproperty name="CRUS2Y" type="string" default="">
	<cfproperty name="CRDT2Y" type="numeric" default="0">
	<cfproperty name="CRTM2Y" type="numeric" default="0">
	<cfproperty name="MNWS2Y" type="string" default="">
	<cfproperty name="MNUS2Y" type="string" default="">
	<cfproperty name="MNDT2Y" type="numeric" default="0">
	<cfproperty name="MNTM2Y" type="numeric" default="0">
	<cfproperty name="OCUS2Y" type="string" default="">
	<cfproperty name="OCDT2Y" type="numeric" default="0">
	<cfproperty name="OCTM2Y" type="numeric" default="0">
	<cfproperty name="PRDT2Y" type="numeric" default="0">
	<cfproperty name="PRTM2Y" type="numeric" default="0">
	<cfproperty name="NOPR2Y" type="numeric" default="0">
	<cfproperty name="FCTR2Y" type="string" default="">
	<cfproperty name="EDR12Y" type="string" default="">
	<cfproperty name="EDR22Y" type="string" default="">
	<cfproperty name="EDR32Y" type="string" default="">
	<cfproperty name="EDR42Y" type="string" default="">
	<cfproperty name="EDR52Y" type="string" default="">
	<cfproperty name="EDR62Y" type="string" default="">
	<cfproperty name="EDR72Y" type="string" default="">
	<cfproperty name="EDR82Y" type="string" default="">
	<cfproperty name="EDR92Y" type="string" default="">
	<cfproperty name="SHFM2Y" type="numeric" default="0">
	<cfproperty name="CACD2Y" type="string" default="">
	<cfproperty name="ETMC2Y" type="string" default="">
	<cfproperty name="ETBD2Y" type="string" default="">
	<cfproperty name="ETDP2Y" type="numeric" default="0">
	<cfproperty name="ETDT2Y" type="numeric" default="0">
	<cfproperty name="ETDD2Y" type="numeric" default="0">
	<cfproperty name="ENDT2Y" type="numeric" default="0">
	<cfproperty name="ENDD2Y" type="numeric" default="0">
	<cfproperty name="ETDS2Y" type="string" default="">
	<cfproperty name="ESCA2Y" type="string" default="">
	<cfproperty name="ETRC2Y" type="string" default="">
	<cfproperty name="ESVD2Y" type="string" default="">
	<cfproperty name="ESMP2Y" type="string" default="">
	<cfproperty name="EFBD2Y" type="string" default="">
	<cfproperty name="RMOR2Y" type="string" default="">
	<cfproperty name="LCC12Y" type="string" default="">
	<cfproperty name="LCD12Y" type="string" default="">
	<cfproperty name="LCP12Y" type="numeric" default="0">
	<cfproperty name="LCN12Y" type="string" default="">
	<cfproperty name="LCC22Y" type="string" default="">
	<cfproperty name="LCD22Y" type="string" default="">
	<cfproperty name="LCP22Y" type="numeric" default="0">
	<cfproperty name="LCN22Y" type="string" default="">
	<cfproperty name="LCC32Y" type="string" default="">
	<cfproperty name="LCD32Y" type="string" default="">
	<cfproperty name="LCP32Y" type="numeric" default="0">
	<cfproperty name="LCN32Y" type="string" default="">
	<cfproperty name="LCC42Y" type="string" default="">
	<cfproperty name="LCD42Y" type="string" default="">
	<cfproperty name="LCP42Y" type="numeric" default="0">
	<cfproperty name="LCN42Y" type="string" default="">
	<cfproperty name="LCC52Y" type="string" default="">
	<cfproperty name="LCD52Y" type="string" default="">
	<cfproperty name="LCP52Y" type="numeric" default="0">
	<cfproperty name="LCN52Y" type="string" default="">
	<cfproperty name="LCC62Y" type="string" default="">
	<cfproperty name="LCD62Y" type="string" default="">
	<cfproperty name="LCP62Y" type="numeric" default="0">
	<cfproperty name="LCN62Y" type="string" default="">
	<cfproperty name="LCC72Y" type="string" default="">
	<cfproperty name="LCD72Y" type="string" default="">
	<cfproperty name="LCP72Y" type="numeric" default="0">
	<cfproperty name="LCN72Y" type="string" default="">
	<cfproperty name="LCC82Y" type="string" default="">
	<cfproperty name="LCD82Y" type="string" default="">
	<cfproperty name="LCP82Y" type="numeric" default="0">
	<cfproperty name="LCN82Y" type="string" default="">
	<cfproperty name="LCC92Y" type="string" default="">
	<cfproperty name="LCD92Y" type="string" default="">
	<cfproperty name="LCP92Y" type="numeric" default="0">
	<cfproperty name="LCN92Y" type="string" default="">
	<cfproperty name="PRMI2Y" type="string" default="">
	<cfproperty name="SPMI2Y" type="string" default="">
	<cfproperty name="SRCD2Y" type="string" default="">
	<cfproperty name="WHNO2Y" type="numeric" default="0">
	<cfproperty name="EMA12Y" type="string" default="">
	<cfproperty name="EMA22Y" type="string" default="">
	<cfproperty name="EMA32Y" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.CONO2Y = 0;
		variables.ORNO2Y = 0;
		variables.CSNO2Y = 0;
		variables.CSSN2Y = "";
		variables.SHNO2Y = 0;
		variables.DCNO2Y = 0;
		variables.BLNO2Y = 0;
		variables.BLFN2Y = "";
		variables.BLA12Y = "";
		variables.BLA22Y = "";
		variables.BLCT2Y = "";
		variables.BLST2Y = "";
		variables.BLZP2Y = "";
		variables.BLEX2Y = "";
		variables.BLCY2Y = "";
		variables.BLFA2Y = "";
		variables.SHFN2Y = "";
		variables.SHA12Y = "";
		variables.SHA22Y = "";
		variables.SHCT2Y = "";
		variables.SHST2Y = "";
		variables.SHZP2Y = "";
		variables.SHEX2Y = "";
		variables.SHCY2Y = "";
		variables.SHFA2Y = "";
		variables.DVNO2Y = 0;
		variables.SNNO2Y = 0;
		variables.SBSN2Y = 0;
		variables.SASN2Y = 0;
		variables.ORDT2Y = 0;
		variables.SSDT2Y = 0;
		variables.CNDT2Y = 0;
		variables.CMDT2Y = 0;
		variables.STDT2Y = 0;
		variables.TMDT2Y = 0;
		variables.CSDP2Y = "";
		variables.CSPO2Y = "";
		variables.ORTP2Y = "";
		variables.BKDS2Y = "";
		variables.BKNO2Y = 0;
		variables.ORST2Y = "";
		variables.SVCD2Y = "";
		variables.SVDS2Y = "";
		variables.FBCD2Y = "";
		variables.FBDS2Y = "";
		variables.CLFR2Y = "";
		variables.CLIN2Y = "";
		variables.TMCD2Y = "";
		variables.TMDS2Y = "";
		variables.BYNO2Y = 0;
		variables.SHPR2Y = 0;
		variables.ORPR2Y = 0;
		variables.SMN12Y = 0;
		variables.SMP12Y = 0;
		variables.CMN12Y = 0;
		variables.CMD12Y = 0;
		variables.SMN22Y = 0;
		variables.SMP22Y = 0;
		variables.CMN22Y = 0;
		variables.CMD22Y = 0;
		variables.SMN32Y = 0;
		variables.SMP32Y = 0;
		variables.CMN32Y = 0;
		variables.CMD32Y = 0;
		variables.SMDF2Y = 0;
		variables.TXNO2Y = 0;
		variables.CTN12Y = 0;
		variables.CTN22Y = 0;
		variables.CTN32Y = 0;
		variables.PRNO2Y = 0;
		variables.CMNO2Y = 0;
		variables.TDNO2Y = 0;
		variables.JBRF2Y = "";
		variables.DUDT2Y = 0;
		variables.TLLN2Y = 0;
		variables.TLUN2Y = 0;
		variables.TLSL2Y = 0;
		variables.TLDB2Y = 0;
		variables.TLSC2Y = 0;
		variables.INTL2Y = 0;
		variables.TLDA2Y = 0;
		variables.NTTL2Y = 0;
		variables.TLOU2Y = 0;
		variables.TLOD2Y = 0;
		variables.TLIU2Y = 0;
		variables.TLID2Y = 0;
		variables.TLDU2Y = 0;
		variables.TLDD2Y = 0;
		variables.TLCU2Y = 0;
		variables.TLCD2Y = 0;
		variables.CRCK2Y = "";
		variables.NOEX2Y = 0;
		variables.DTEX2Y = "";
		variables.CONV2Y = "";
		variables.APTP2Y = "";
		variables.OSTS2Y = "";
		variables.ORCL2Y = "";
		variables.PSBK2Y = "";
		variables.CRWS2Y = "";
		variables.CRUS2Y = "";
		variables.CRDT2Y = 0;
		variables.CRTM2Y = 0;
		variables.MNWS2Y = "";
		variables.MNUS2Y = "";
		variables.MNDT2Y = 0;
		variables.MNTM2Y = 0;
		variables.OCUS2Y = "";
		variables.OCDT2Y = 0;
		variables.OCTM2Y = 0;
		variables.PRDT2Y = 0;
		variables.PRTM2Y = 0;
		variables.NOPR2Y = 0;
		variables.FCTR2Y = "";
		variables.EDR12Y = "";
		variables.EDR22Y = "";
		variables.EDR32Y = "";
		variables.EDR42Y = "";
		variables.EDR52Y = "";
		variables.EDR62Y = "";
		variables.EDR72Y = "";
		variables.EDR82Y = "";
		variables.EDR92Y = "";
		variables.SHFM2Y = 0;
		variables.CACD2Y = "";
		variables.ETMC2Y = "";
		variables.ETBD2Y = "";
		variables.ETDP2Y = 0;
		variables.ETDT2Y = 0;
		variables.ETDD2Y = 0;
		variables.ENDT2Y = 0;
		variables.ENDD2Y = 0;
		variables.ETDS2Y = "";
		variables.ESCA2Y = "";
		variables.ETRC2Y = "";
		variables.ESVD2Y = "";
		variables.ESMP2Y = "";
		variables.EFBD2Y = "";
		variables.RMOR2Y = "";
		variables.LCC12Y = "";
		variables.LCD12Y = "";
		variables.LCP12Y = 0;
		variables.LCN12Y = "";
		variables.LCC22Y = "";
		variables.LCD22Y = "";
		variables.LCP22Y = 0;
		variables.LCN22Y = "";
		variables.LCC32Y = "";
		variables.LCD32Y = "";
		variables.LCP32Y = 0;
		variables.LCN32Y = "";
		variables.LCC42Y = "";
		variables.LCD42Y = "";
		variables.LCP42Y = 0;
		variables.LCN42Y = "";
		variables.LCC52Y = "";
		variables.LCD52Y = "";
		variables.LCP52Y = 0;
		variables.LCN52Y = "";
		variables.LCC62Y = "";
		variables.LCD62Y = "";
		variables.LCP62Y = 0;
		variables.LCN62Y = "";
		variables.LCC72Y = "";
		variables.LCD72Y = "";
		variables.LCP72Y = 0;
		variables.LCN72Y = "";
		variables.LCC82Y = "";
		variables.LCD82Y = "";
		variables.LCP82Y = 0;
		variables.LCN82Y = "";
		variables.LCC92Y = "";
		variables.LCD92Y = "";
		variables.LCP92Y = 0;
		variables.LCN92Y = "";
		variables.PRMI2Y = "";
		variables.SPMI2Y = "";
		variables.SRCD2Y = "";
		variables.WHNO2Y = 0;
		variables.EMA12Y = "";
		variables.EMA22Y = "";
		variables.EMA32Y = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="ORDHDR0">
		<cfreturn this>
	</cffunction>
	<cffunction name="getCONO2Y" output="false" access="public" returntype="any">
		<cfreturn variables.CONO2Y>
	</cffunction>

	<cffunction name="setCONO2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CONO2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getORNO2Y" output="false" access="public" returntype="any">
		<cfreturn variables.ORNO2Y>
	</cffunction>

	<cffunction name="setORNO2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ORNO2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCSNO2Y" output="false" access="public" returntype="any">
		<cfreturn variables.CSNO2Y>
	</cffunction>

	<cffunction name="setCSNO2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CSNO2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCSSN2Y" output="false" access="public" returntype="any">
		<cfreturn variables.CSSN2Y>
	</cffunction>

	<cffunction name="setCSSN2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CSSN2Y = arguments.val>
	</cffunction>

	<cffunction name="getSHNO2Y" output="false" access="public" returntype="any">
		<cfreturn variables.SHNO2Y>
	</cffunction>

	<cffunction name="setSHNO2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SHNO2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDCNO2Y" output="false" access="public" returntype="any">
		<cfreturn variables.DCNO2Y>
	</cffunction>

	<cffunction name="setDCNO2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.DCNO2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getBLNO2Y" output="false" access="public" returntype="any">
		<cfreturn variables.BLNO2Y>
	</cffunction>

	<cffunction name="setBLNO2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.BLNO2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getBLFN2Y" output="false" access="public" returntype="any">
		<cfreturn variables.BLFN2Y>
	</cffunction>

	<cffunction name="setBLFN2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.BLFN2Y = arguments.val>
	</cffunction>

	<cffunction name="getBLA12Y" output="false" access="public" returntype="any">
		<cfreturn variables.BLA12Y>
	</cffunction>

	<cffunction name="setBLA12Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.BLA12Y = arguments.val>
	</cffunction>

	<cffunction name="getBLA22Y" output="false" access="public" returntype="any">
		<cfreturn variables.BLA22Y>
	</cffunction>

	<cffunction name="setBLA22Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.BLA22Y = arguments.val>
	</cffunction>

	<cffunction name="getBLCT2Y" output="false" access="public" returntype="any">
		<cfreturn variables.BLCT2Y>
	</cffunction>

	<cffunction name="setBLCT2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.BLCT2Y = arguments.val>
	</cffunction>

	<cffunction name="getBLST2Y" output="false" access="public" returntype="any">
		<cfreturn variables.BLST2Y>
	</cffunction>

	<cffunction name="setBLST2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.BLST2Y = arguments.val>
	</cffunction>

	<cffunction name="getBLZP2Y" output="false" access="public" returntype="any">
		<cfreturn variables.BLZP2Y>
	</cffunction>

	<cffunction name="setBLZP2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.BLZP2Y = arguments.val>
	</cffunction>

	<cffunction name="getBLEX2Y" output="false" access="public" returntype="any">
		<cfreturn variables.BLEX2Y>
	</cffunction>

	<cffunction name="setBLEX2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.BLEX2Y = arguments.val>
	</cffunction>

	<cffunction name="getBLCY2Y" output="false" access="public" returntype="any">
		<cfreturn variables.BLCY2Y>
	</cffunction>

	<cffunction name="setBLCY2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.BLCY2Y = arguments.val>
	</cffunction>

	<cffunction name="getBLFA2Y" output="false" access="public" returntype="any">
		<cfreturn variables.BLFA2Y>
	</cffunction>

	<cffunction name="setBLFA2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.BLFA2Y = arguments.val>
	</cffunction>

	<cffunction name="getSHFN2Y" output="false" access="public" returntype="any">
		<cfreturn variables.SHFN2Y>
	</cffunction>

	<cffunction name="setSHFN2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SHFN2Y = arguments.val>
	</cffunction>

	<cffunction name="getSHA12Y" output="false" access="public" returntype="any">
		<cfreturn variables.SHA12Y>
	</cffunction>

	<cffunction name="setSHA12Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SHA12Y = arguments.val>
	</cffunction>

	<cffunction name="getSHA22Y" output="false" access="public" returntype="any">
		<cfreturn variables.SHA22Y>
	</cffunction>

	<cffunction name="setSHA22Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SHA22Y = arguments.val>
	</cffunction>

	<cffunction name="getSHCT2Y" output="false" access="public" returntype="any">
		<cfreturn variables.SHCT2Y>
	</cffunction>

	<cffunction name="setSHCT2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SHCT2Y = arguments.val>
	</cffunction>

	<cffunction name="getSHST2Y" output="false" access="public" returntype="any">
		<cfreturn variables.SHST2Y>
	</cffunction>

	<cffunction name="setSHST2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SHST2Y = arguments.val>
	</cffunction>

	<cffunction name="getSHZP2Y" output="false" access="public" returntype="any">
		<cfreturn variables.SHZP2Y>
	</cffunction>

	<cffunction name="setSHZP2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SHZP2Y = arguments.val>
	</cffunction>

	<cffunction name="getSHEX2Y" output="false" access="public" returntype="any">
		<cfreturn variables.SHEX2Y>
	</cffunction>

	<cffunction name="setSHEX2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SHEX2Y = arguments.val>
	</cffunction>

	<cffunction name="getSHCY2Y" output="false" access="public" returntype="any">
		<cfreturn variables.SHCY2Y>
	</cffunction>

	<cffunction name="setSHCY2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SHCY2Y = arguments.val>
	</cffunction>

	<cffunction name="getSHFA2Y" output="false" access="public" returntype="any">
		<cfreturn variables.SHFA2Y>
	</cffunction>

	<cffunction name="setSHFA2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SHFA2Y = arguments.val>
	</cffunction>

	<cffunction name="getDVNO2Y" output="false" access="public" returntype="any">
		<cfreturn variables.DVNO2Y>
	</cffunction>

	<cffunction name="setDVNO2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.DVNO2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSNNO2Y" output="false" access="public" returntype="any">
		<cfreturn variables.SNNO2Y>
	</cffunction>

	<cffunction name="setSNNO2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SNNO2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSBSN2Y" output="false" access="public" returntype="any">
		<cfreturn variables.SBSN2Y>
	</cffunction>

	<cffunction name="setSBSN2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SBSN2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSASN2Y" output="false" access="public" returntype="any">
		<cfreturn variables.SASN2Y>
	</cffunction>

	<cffunction name="setSASN2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SASN2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getORDT2Y" output="false" access="public" returntype="any">
		<cfreturn variables.ORDT2Y>
	</cffunction>

	<cffunction name="setORDT2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ORDT2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSSDT2Y" output="false" access="public" returntype="any">
		<cfreturn variables.SSDT2Y>
	</cffunction>

	<cffunction name="setSSDT2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SSDT2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCNDT2Y" output="false" access="public" returntype="any">
		<cfreturn variables.CNDT2Y>
	</cffunction>

	<cffunction name="setCNDT2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CNDT2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCMDT2Y" output="false" access="public" returntype="any">
		<cfreturn variables.CMDT2Y>
	</cffunction>

	<cffunction name="setCMDT2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CMDT2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSTDT2Y" output="false" access="public" returntype="any">
		<cfreturn variables.STDT2Y>
	</cffunction>

	<cffunction name="setSTDT2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.STDT2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTMDT2Y" output="false" access="public" returntype="any">
		<cfreturn variables.TMDT2Y>
	</cffunction>

	<cffunction name="setTMDT2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TMDT2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCSDP2Y" output="false" access="public" returntype="any">
		<cfreturn variables.CSDP2Y>
	</cffunction>

	<cffunction name="setCSDP2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CSDP2Y = arguments.val>
	</cffunction>

	<cffunction name="getCSPO2Y" output="false" access="public" returntype="any">
		<cfreturn variables.CSPO2Y>
	</cffunction>

	<cffunction name="setCSPO2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CSPO2Y = arguments.val>
	</cffunction>

	<cffunction name="getORTP2Y" output="false" access="public" returntype="any">
		<cfreturn variables.ORTP2Y>
	</cffunction>

	<cffunction name="setORTP2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ORTP2Y = arguments.val>
	</cffunction>

	<cffunction name="getBKDS2Y" output="false" access="public" returntype="any">
		<cfreturn variables.BKDS2Y>
	</cffunction>

	<cffunction name="setBKDS2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.BKDS2Y = arguments.val>
	</cffunction>

	<cffunction name="getBKNO2Y" output="false" access="public" returntype="any">
		<cfreturn variables.BKNO2Y>
	</cffunction>

	<cffunction name="setBKNO2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.BKNO2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getORST2Y" output="false" access="public" returntype="any">
		<cfreturn variables.ORST2Y>
	</cffunction>

	<cffunction name="setORST2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ORST2Y = arguments.val>
	</cffunction>

	<cffunction name="getSVCD2Y" output="false" access="public" returntype="any">
		<cfreturn variables.SVCD2Y>
	</cffunction>

	<cffunction name="setSVCD2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SVCD2Y = arguments.val>
	</cffunction>

	<cffunction name="getSVDS2Y" output="false" access="public" returntype="any">
		<cfreturn variables.SVDS2Y>
	</cffunction>

	<cffunction name="setSVDS2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SVDS2Y = arguments.val>
	</cffunction>

	<cffunction name="getFBCD2Y" output="false" access="public" returntype="any">
		<cfreturn variables.FBCD2Y>
	</cffunction>

	<cffunction name="setFBCD2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.FBCD2Y = arguments.val>
	</cffunction>

	<cffunction name="getFBDS2Y" output="false" access="public" returntype="any">
		<cfreturn variables.FBDS2Y>
	</cffunction>

	<cffunction name="setFBDS2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.FBDS2Y = arguments.val>
	</cffunction>

	<cffunction name="getCLFR2Y" output="false" access="public" returntype="any">
		<cfreturn variables.CLFR2Y>
	</cffunction>

	<cffunction name="setCLFR2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CLFR2Y = arguments.val>
	</cffunction>

	<cffunction name="getCLIN2Y" output="false" access="public" returntype="any">
		<cfreturn variables.CLIN2Y>
	</cffunction>

	<cffunction name="setCLIN2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CLIN2Y = arguments.val>
	</cffunction>

	<cffunction name="getTMCD2Y" output="false" access="public" returntype="any">
		<cfreturn variables.TMCD2Y>
	</cffunction>

	<cffunction name="setTMCD2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.TMCD2Y = arguments.val>
	</cffunction>

	<cffunction name="getTMDS2Y" output="false" access="public" returntype="any">
		<cfreturn variables.TMDS2Y>
	</cffunction>

	<cffunction name="setTMDS2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.TMDS2Y = arguments.val>
	</cffunction>

	<cffunction name="getBYNO2Y" output="false" access="public" returntype="any">
		<cfreturn variables.BYNO2Y>
	</cffunction>

	<cffunction name="setBYNO2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.BYNO2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSHPR2Y" output="false" access="public" returntype="any">
		<cfreturn variables.SHPR2Y>
	</cffunction>

	<cffunction name="setSHPR2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SHPR2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getORPR2Y" output="false" access="public" returntype="any">
		<cfreturn variables.ORPR2Y>
	</cffunction>

	<cffunction name="setORPR2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ORPR2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSMN12Y" output="false" access="public" returntype="any">
		<cfreturn variables.SMN12Y>
	</cffunction>

	<cffunction name="setSMN12Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SMN12Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSMP12Y" output="false" access="public" returntype="any">
		<cfreturn variables.SMP12Y>
	</cffunction>

	<cffunction name="setSMP12Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SMP12Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCMN12Y" output="false" access="public" returntype="any">
		<cfreturn variables.CMN12Y>
	</cffunction>

	<cffunction name="setCMN12Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CMN12Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCMD12Y" output="false" access="public" returntype="any">
		<cfreturn variables.CMD12Y>
	</cffunction>

	<cffunction name="setCMD12Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CMD12Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSMN22Y" output="false" access="public" returntype="any">
		<cfreturn variables.SMN22Y>
	</cffunction>

	<cffunction name="setSMN22Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SMN22Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSMP22Y" output="false" access="public" returntype="any">
		<cfreturn variables.SMP22Y>
	</cffunction>

	<cffunction name="setSMP22Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SMP22Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCMN22Y" output="false" access="public" returntype="any">
		<cfreturn variables.CMN22Y>
	</cffunction>

	<cffunction name="setCMN22Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CMN22Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCMD22Y" output="false" access="public" returntype="any">
		<cfreturn variables.CMD22Y>
	</cffunction>

	<cffunction name="setCMD22Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CMD22Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSMN32Y" output="false" access="public" returntype="any">
		<cfreturn variables.SMN32Y>
	</cffunction>

	<cffunction name="setSMN32Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SMN32Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSMP32Y" output="false" access="public" returntype="any">
		<cfreturn variables.SMP32Y>
	</cffunction>

	<cffunction name="setSMP32Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SMP32Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCMN32Y" output="false" access="public" returntype="any">
		<cfreturn variables.CMN32Y>
	</cffunction>

	<cffunction name="setCMN32Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CMN32Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCMD32Y" output="false" access="public" returntype="any">
		<cfreturn variables.CMD32Y>
	</cffunction>

	<cffunction name="setCMD32Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CMD32Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSMDF2Y" output="false" access="public" returntype="any">
		<cfreturn variables.SMDF2Y>
	</cffunction>

	<cffunction name="setSMDF2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SMDF2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTXNO2Y" output="false" access="public" returntype="any">
		<cfreturn variables.TXNO2Y>
	</cffunction>

	<cffunction name="setTXNO2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TXNO2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCTN12Y" output="false" access="public" returntype="any">
		<cfreturn variables.CTN12Y>
	</cffunction>

	<cffunction name="setCTN12Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CTN12Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCTN22Y" output="false" access="public" returntype="any">
		<cfreturn variables.CTN22Y>
	</cffunction>

	<cffunction name="setCTN22Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CTN22Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCTN32Y" output="false" access="public" returntype="any">
		<cfreturn variables.CTN32Y>
	</cffunction>

	<cffunction name="setCTN32Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CTN32Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPRNO2Y" output="false" access="public" returntype="any">
		<cfreturn variables.PRNO2Y>
	</cffunction>

	<cffunction name="setPRNO2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PRNO2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCMNO2Y" output="false" access="public" returntype="any">
		<cfreturn variables.CMNO2Y>
	</cffunction>

	<cffunction name="setCMNO2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CMNO2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTDNO2Y" output="false" access="public" returntype="any">
		<cfreturn variables.TDNO2Y>
	</cffunction>

	<cffunction name="setTDNO2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TDNO2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getJBRF2Y" output="false" access="public" returntype="any">
		<cfreturn variables.JBRF2Y>
	</cffunction>

	<cffunction name="setJBRF2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.JBRF2Y = arguments.val>
	</cffunction>

	<cffunction name="getDUDT2Y" output="false" access="public" returntype="any">
		<cfreturn variables.DUDT2Y>
	</cffunction>

	<cffunction name="setDUDT2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.DUDT2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLLN2Y" output="false" access="public" returntype="any">
		<cfreturn variables.TLLN2Y>
	</cffunction>

	<cffunction name="setTLLN2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLLN2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLUN2Y" output="false" access="public" returntype="any">
		<cfreturn variables.TLUN2Y>
	</cffunction>

	<cffunction name="setTLUN2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLUN2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLSL2Y" output="false" access="public" returntype="any">
		<cfreturn variables.TLSL2Y>
	</cffunction>

	<cffunction name="setTLSL2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLSL2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLDB2Y" output="false" access="public" returntype="any">
		<cfreturn variables.TLDB2Y>
	</cffunction>

	<cffunction name="setTLDB2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLDB2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLSC2Y" output="false" access="public" returntype="any">
		<cfreturn variables.TLSC2Y>
	</cffunction>

	<cffunction name="setTLSC2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLSC2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getINTL2Y" output="false" access="public" returntype="any">
		<cfreturn variables.INTL2Y>
	</cffunction>

	<cffunction name="setINTL2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.INTL2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLDA2Y" output="false" access="public" returntype="any">
		<cfreturn variables.TLDA2Y>
	</cffunction>

	<cffunction name="setTLDA2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLDA2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getNTTL2Y" output="false" access="public" returntype="any">
		<cfreturn variables.NTTL2Y>
	</cffunction>

	<cffunction name="setNTTL2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.NTTL2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLOU2Y" output="false" access="public" returntype="any">
		<cfreturn variables.TLOU2Y>
	</cffunction>

	<cffunction name="setTLOU2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLOU2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLOD2Y" output="false" access="public" returntype="any">
		<cfreturn variables.TLOD2Y>
	</cffunction>

	<cffunction name="setTLOD2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLOD2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLIU2Y" output="false" access="public" returntype="any">
		<cfreturn variables.TLIU2Y>
	</cffunction>

	<cffunction name="setTLIU2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLIU2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLID2Y" output="false" access="public" returntype="any">
		<cfreturn variables.TLID2Y>
	</cffunction>

	<cffunction name="setTLID2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLID2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLDU2Y" output="false" access="public" returntype="any">
		<cfreturn variables.TLDU2Y>
	</cffunction>

	<cffunction name="setTLDU2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLDU2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLDD2Y" output="false" access="public" returntype="any">
		<cfreturn variables.TLDD2Y>
	</cffunction>

	<cffunction name="setTLDD2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLDD2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLCU2Y" output="false" access="public" returntype="any">
		<cfreturn variables.TLCU2Y>
	</cffunction>

	<cffunction name="setTLCU2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLCU2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLCD2Y" output="false" access="public" returntype="any">
		<cfreturn variables.TLCD2Y>
	</cffunction>

	<cffunction name="setTLCD2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLCD2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCRCK2Y" output="false" access="public" returntype="any">
		<cfreturn variables.CRCK2Y>
	</cffunction>

	<cffunction name="setCRCK2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CRCK2Y = arguments.val>
	</cffunction>

	<cffunction name="getNOEX2Y" output="false" access="public" returntype="any">
		<cfreturn variables.NOEX2Y>
	</cffunction>

	<cffunction name="setNOEX2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.NOEX2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDTEX2Y" output="false" access="public" returntype="any">
		<cfreturn variables.DTEX2Y>
	</cffunction>

	<cffunction name="setDTEX2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.DTEX2Y = arguments.val>
	</cffunction>

	<cffunction name="getCONV2Y" output="false" access="public" returntype="any">
		<cfreturn variables.CONV2Y>
	</cffunction>

	<cffunction name="setCONV2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CONV2Y = arguments.val>
	</cffunction>

	<cffunction name="getAPTP2Y" output="false" access="public" returntype="any">
		<cfreturn variables.APTP2Y>
	</cffunction>

	<cffunction name="setAPTP2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.APTP2Y = arguments.val>
	</cffunction>

	<cffunction name="getOSTS2Y" output="false" access="public" returntype="any">
		<cfreturn variables.OSTS2Y>
	</cffunction>

	<cffunction name="setOSTS2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.OSTS2Y = arguments.val>
	</cffunction>

	<cffunction name="getORCL2Y" output="false" access="public" returntype="any">
		<cfreturn variables.ORCL2Y>
	</cffunction>

	<cffunction name="setORCL2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ORCL2Y = arguments.val>
	</cffunction>

	<cffunction name="getPSBK2Y" output="false" access="public" returntype="any">
		<cfreturn variables.PSBK2Y>
	</cffunction>

	<cffunction name="setPSBK2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.PSBK2Y = arguments.val>
	</cffunction>

	<cffunction name="getCRWS2Y" output="false" access="public" returntype="any">
		<cfreturn variables.CRWS2Y>
	</cffunction>

	<cffunction name="setCRWS2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CRWS2Y = arguments.val>
	</cffunction>

	<cffunction name="getCRUS2Y" output="false" access="public" returntype="any">
		<cfreturn variables.CRUS2Y>
	</cffunction>

	<cffunction name="setCRUS2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CRUS2Y = arguments.val>
	</cffunction>

	<cffunction name="getCRDT2Y" output="false" access="public" returntype="any">
		<cfreturn variables.CRDT2Y>
	</cffunction>

	<cffunction name="setCRDT2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CRDT2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCRTM2Y" output="false" access="public" returntype="any">
		<cfreturn variables.CRTM2Y>
	</cffunction>

	<cffunction name="setCRTM2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CRTM2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getMNWS2Y" output="false" access="public" returntype="any">
		<cfreturn variables.MNWS2Y>
	</cffunction>

	<cffunction name="setMNWS2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.MNWS2Y = arguments.val>
	</cffunction>

	<cffunction name="getMNUS2Y" output="false" access="public" returntype="any">
		<cfreturn variables.MNUS2Y>
	</cffunction>

	<cffunction name="setMNUS2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.MNUS2Y = arguments.val>
	</cffunction>

	<cffunction name="getMNDT2Y" output="false" access="public" returntype="any">
		<cfreturn variables.MNDT2Y>
	</cffunction>

	<cffunction name="setMNDT2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.MNDT2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getMNTM2Y" output="false" access="public" returntype="any">
		<cfreturn variables.MNTM2Y>
	</cffunction>

	<cffunction name="setMNTM2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.MNTM2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getOCUS2Y" output="false" access="public" returntype="any">
		<cfreturn variables.OCUS2Y>
	</cffunction>

	<cffunction name="setOCUS2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.OCUS2Y = arguments.val>
	</cffunction>

	<cffunction name="getOCDT2Y" output="false" access="public" returntype="any">
		<cfreturn variables.OCDT2Y>
	</cffunction>

	<cffunction name="setOCDT2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.OCDT2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getOCTM2Y" output="false" access="public" returntype="any">
		<cfreturn variables.OCTM2Y>
	</cffunction>

	<cffunction name="setOCTM2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.OCTM2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPRDT2Y" output="false" access="public" returntype="any">
		<cfreturn variables.PRDT2Y>
	</cffunction>

	<cffunction name="setPRDT2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PRDT2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPRTM2Y" output="false" access="public" returntype="any">
		<cfreturn variables.PRTM2Y>
	</cffunction>

	<cffunction name="setPRTM2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PRTM2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getNOPR2Y" output="false" access="public" returntype="any">
		<cfreturn variables.NOPR2Y>
	</cffunction>

	<cffunction name="setNOPR2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.NOPR2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getFCTR2Y" output="false" access="public" returntype="any">
		<cfreturn variables.FCTR2Y>
	</cffunction>

	<cffunction name="setFCTR2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.FCTR2Y = arguments.val>
	</cffunction>

	<cffunction name="getEDR12Y" output="false" access="public" returntype="any">
		<cfreturn variables.EDR12Y>
	</cffunction>

	<cffunction name="setEDR12Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.EDR12Y = arguments.val>
	</cffunction>

	<cffunction name="getEDR22Y" output="false" access="public" returntype="any">
		<cfreturn variables.EDR22Y>
	</cffunction>

	<cffunction name="setEDR22Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.EDR22Y = arguments.val>
	</cffunction>

	<cffunction name="getEDR32Y" output="false" access="public" returntype="any">
		<cfreturn variables.EDR32Y>
	</cffunction>

	<cffunction name="setEDR32Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.EDR32Y = arguments.val>
	</cffunction>

	<cffunction name="getEDR42Y" output="false" access="public" returntype="any">
		<cfreturn variables.EDR42Y>
	</cffunction>

	<cffunction name="setEDR42Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.EDR42Y = arguments.val>
	</cffunction>

	<cffunction name="getEDR52Y" output="false" access="public" returntype="any">
		<cfreturn variables.EDR52Y>
	</cffunction>

	<cffunction name="setEDR52Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.EDR52Y = arguments.val>
	</cffunction>

	<cffunction name="getEDR62Y" output="false" access="public" returntype="any">
		<cfreturn variables.EDR62Y>
	</cffunction>

	<cffunction name="setEDR62Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.EDR62Y = arguments.val>
	</cffunction>

	<cffunction name="getEDR72Y" output="false" access="public" returntype="any">
		<cfreturn variables.EDR72Y>
	</cffunction>

	<cffunction name="setEDR72Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.EDR72Y = arguments.val>
	</cffunction>

	<cffunction name="getEDR82Y" output="false" access="public" returntype="any">
		<cfreturn variables.EDR82Y>
	</cffunction>

	<cffunction name="setEDR82Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.EDR82Y = arguments.val>
	</cffunction>

	<cffunction name="getEDR92Y" output="false" access="public" returntype="any">
		<cfreturn variables.EDR92Y>
	</cffunction>

	<cffunction name="setEDR92Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.EDR92Y = arguments.val>
	</cffunction>

	<cffunction name="getSHFM2Y" output="false" access="public" returntype="any">
		<cfreturn variables.SHFM2Y>
	</cffunction>

	<cffunction name="setSHFM2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SHFM2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCACD2Y" output="false" access="public" returntype="any">
		<cfreturn variables.CACD2Y>
	</cffunction>

	<cffunction name="setCACD2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CACD2Y = arguments.val>
	</cffunction>

	<cffunction name="getETMC2Y" output="false" access="public" returntype="any">
		<cfreturn variables.ETMC2Y>
	</cffunction>

	<cffunction name="setETMC2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ETMC2Y = arguments.val>
	</cffunction>

	<cffunction name="getETBD2Y" output="false" access="public" returntype="any">
		<cfreturn variables.ETBD2Y>
	</cffunction>

	<cffunction name="setETBD2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ETBD2Y = arguments.val>
	</cffunction>

	<cffunction name="getETDP2Y" output="false" access="public" returntype="any">
		<cfreturn variables.ETDP2Y>
	</cffunction>

	<cffunction name="setETDP2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ETDP2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getETDT2Y" output="false" access="public" returntype="any">
		<cfreturn variables.ETDT2Y>
	</cffunction>

	<cffunction name="setETDT2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ETDT2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getETDD2Y" output="false" access="public" returntype="any">
		<cfreturn variables.ETDD2Y>
	</cffunction>

	<cffunction name="setETDD2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ETDD2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getENDT2Y" output="false" access="public" returntype="any">
		<cfreturn variables.ENDT2Y>
	</cffunction>

	<cffunction name="setENDT2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ENDT2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getENDD2Y" output="false" access="public" returntype="any">
		<cfreturn variables.ENDD2Y>
	</cffunction>

	<cffunction name="setENDD2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ENDD2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getETDS2Y" output="false" access="public" returntype="any">
		<cfreturn variables.ETDS2Y>
	</cffunction>

	<cffunction name="setETDS2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ETDS2Y = arguments.val>
	</cffunction>

	<cffunction name="getESCA2Y" output="false" access="public" returntype="any">
		<cfreturn variables.ESCA2Y>
	</cffunction>

	<cffunction name="setESCA2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ESCA2Y = arguments.val>
	</cffunction>

	<cffunction name="getETRC2Y" output="false" access="public" returntype="any">
		<cfreturn variables.ETRC2Y>
	</cffunction>

	<cffunction name="setETRC2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ETRC2Y = arguments.val>
	</cffunction>

	<cffunction name="getESVD2Y" output="false" access="public" returntype="any">
		<cfreturn variables.ESVD2Y>
	</cffunction>

	<cffunction name="setESVD2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ESVD2Y = arguments.val>
	</cffunction>

	<cffunction name="getESMP2Y" output="false" access="public" returntype="any">
		<cfreturn variables.ESMP2Y>
	</cffunction>

	<cffunction name="setESMP2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ESMP2Y = arguments.val>
	</cffunction>

	<cffunction name="getEFBD2Y" output="false" access="public" returntype="any">
		<cfreturn variables.EFBD2Y>
	</cffunction>

	<cffunction name="setEFBD2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.EFBD2Y = arguments.val>
	</cffunction>

	<cffunction name="getRMOR2Y" output="false" access="public" returntype="any">
		<cfreturn variables.RMOR2Y>
	</cffunction>

	<cffunction name="setRMOR2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.RMOR2Y = arguments.val>
	</cffunction>

	<cffunction name="getLCC12Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCC12Y>
	</cffunction>

	<cffunction name="setLCC12Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCC12Y = arguments.val>
	</cffunction>

	<cffunction name="getLCD12Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCD12Y>
	</cffunction>

	<cffunction name="setLCD12Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCD12Y = arguments.val>
	</cffunction>

	<cffunction name="getLCP12Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCP12Y>
	</cffunction>

	<cffunction name="setLCP12Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.LCP12Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLCN12Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCN12Y>
	</cffunction>

	<cffunction name="setLCN12Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCN12Y = arguments.val>
	</cffunction>

	<cffunction name="getLCC22Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCC22Y>
	</cffunction>

	<cffunction name="setLCC22Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCC22Y = arguments.val>
	</cffunction>

	<cffunction name="getLCD22Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCD22Y>
	</cffunction>

	<cffunction name="setLCD22Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCD22Y = arguments.val>
	</cffunction>

	<cffunction name="getLCP22Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCP22Y>
	</cffunction>

	<cffunction name="setLCP22Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.LCP22Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLCN22Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCN22Y>
	</cffunction>

	<cffunction name="setLCN22Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCN22Y = arguments.val>
	</cffunction>

	<cffunction name="getLCC32Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCC32Y>
	</cffunction>

	<cffunction name="setLCC32Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCC32Y = arguments.val>
	</cffunction>

	<cffunction name="getLCD32Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCD32Y>
	</cffunction>

	<cffunction name="setLCD32Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCD32Y = arguments.val>
	</cffunction>

	<cffunction name="getLCP32Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCP32Y>
	</cffunction>

	<cffunction name="setLCP32Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.LCP32Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLCN32Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCN32Y>
	</cffunction>

	<cffunction name="setLCN32Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCN32Y = arguments.val>
	</cffunction>

	<cffunction name="getLCC42Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCC42Y>
	</cffunction>

	<cffunction name="setLCC42Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCC42Y = arguments.val>
	</cffunction>

	<cffunction name="getLCD42Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCD42Y>
	</cffunction>

	<cffunction name="setLCD42Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCD42Y = arguments.val>
	</cffunction>

	<cffunction name="getLCP42Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCP42Y>
	</cffunction>

	<cffunction name="setLCP42Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.LCP42Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLCN42Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCN42Y>
	</cffunction>

	<cffunction name="setLCN42Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCN42Y = arguments.val>
	</cffunction>

	<cffunction name="getLCC52Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCC52Y>
	</cffunction>

	<cffunction name="setLCC52Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCC52Y = arguments.val>
	</cffunction>

	<cffunction name="getLCD52Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCD52Y>
	</cffunction>

	<cffunction name="setLCD52Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCD52Y = arguments.val>
	</cffunction>

	<cffunction name="getLCP52Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCP52Y>
	</cffunction>

	<cffunction name="setLCP52Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.LCP52Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLCN52Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCN52Y>
	</cffunction>

	<cffunction name="setLCN52Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCN52Y = arguments.val>
	</cffunction>

	<cffunction name="getLCC62Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCC62Y>
	</cffunction>

	<cffunction name="setLCC62Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCC62Y = arguments.val>
	</cffunction>

	<cffunction name="getLCD62Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCD62Y>
	</cffunction>

	<cffunction name="setLCD62Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCD62Y = arguments.val>
	</cffunction>

	<cffunction name="getLCP62Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCP62Y>
	</cffunction>

	<cffunction name="setLCP62Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.LCP62Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLCN62Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCN62Y>
	</cffunction>

	<cffunction name="setLCN62Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCN62Y = arguments.val>
	</cffunction>

	<cffunction name="getLCC72Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCC72Y>
	</cffunction>

	<cffunction name="setLCC72Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCC72Y = arguments.val>
	</cffunction>

	<cffunction name="getLCD72Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCD72Y>
	</cffunction>

	<cffunction name="setLCD72Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCD72Y = arguments.val>
	</cffunction>

	<cffunction name="getLCP72Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCP72Y>
	</cffunction>

	<cffunction name="setLCP72Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.LCP72Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLCN72Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCN72Y>
	</cffunction>

	<cffunction name="setLCN72Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCN72Y = arguments.val>
	</cffunction>

	<cffunction name="getLCC82Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCC82Y>
	</cffunction>

	<cffunction name="setLCC82Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCC82Y = arguments.val>
	</cffunction>

	<cffunction name="getLCD82Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCD82Y>
	</cffunction>

	<cffunction name="setLCD82Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCD82Y = arguments.val>
	</cffunction>

	<cffunction name="getLCP82Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCP82Y>
	</cffunction>

	<cffunction name="setLCP82Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.LCP82Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLCN82Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCN82Y>
	</cffunction>

	<cffunction name="setLCN82Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCN82Y = arguments.val>
	</cffunction>

	<cffunction name="getLCC92Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCC92Y>
	</cffunction>

	<cffunction name="setLCC92Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCC92Y = arguments.val>
	</cffunction>

	<cffunction name="getLCD92Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCD92Y>
	</cffunction>

	<cffunction name="setLCD92Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCD92Y = arguments.val>
	</cffunction>

	<cffunction name="getLCP92Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCP92Y>
	</cffunction>

	<cffunction name="setLCP92Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.LCP92Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLCN92Y" output="false" access="public" returntype="any">
		<cfreturn variables.LCN92Y>
	</cffunction>

	<cffunction name="setLCN92Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCN92Y = arguments.val>
	</cffunction>

	<cffunction name="getPRMI2Y" output="false" access="public" returntype="any">
		<cfreturn variables.PRMI2Y>
	</cffunction>

	<cffunction name="setPRMI2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.PRMI2Y = arguments.val>
	</cffunction>

	<cffunction name="getSPMI2Y" output="false" access="public" returntype="any">
		<cfreturn variables.SPMI2Y>
	</cffunction>

	<cffunction name="setSPMI2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SPMI2Y = arguments.val>
	</cffunction>

	<cffunction name="getSRCD2Y" output="false" access="public" returntype="any">
		<cfreturn variables.SRCD2Y>
	</cffunction>

	<cffunction name="setSRCD2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SRCD2Y = arguments.val>
	</cffunction>

	<cffunction name="getWHNO2Y" output="false" access="public" returntype="any">
		<cfreturn variables.WHNO2Y>
	</cffunction>

	<cffunction name="setWHNO2Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.WHNO2Y = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getEMA12Y" output="false" access="public" returntype="any">
		<cfreturn variables.EMA12Y>
	</cffunction>

	<cffunction name="setEMA12Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.EMA12Y = arguments.val>
	</cffunction>

	<cffunction name="getEMA22Y" output="false" access="public" returntype="any">
		<cfreturn variables.EMA22Y>
	</cffunction>

	<cffunction name="setEMA22Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.EMA22Y = arguments.val>
	</cffunction>

	<cffunction name="getEMA32Y" output="false" access="public" returntype="any">
		<cfreturn variables.EMA32Y>
	</cffunction>

	<cffunction name="setEMA32Y" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.EMA32Y = arguments.val>
	</cffunction>



</cfcomponent>