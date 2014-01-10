<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.as400.ORDDTL0">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="AS400">
			select 	CONO4E, ORNO4E, LNNO4E, PRCD4E, CRCD4E, UNIT4E, 
					LSPR4E, SLPR4E, INPR4E, SCAM4E, NTPR4E, 
					EXAM4E, LDCT4E, LDAM4E, TDNO4E, TDOV4E, 
					DSC14E, DAI14E, DSA14E, DSC24E, DAI24E, 
					DSA24E, DSC34E, DAI34E, DSA34E, DSC44E, 
					DAI44E, DSA44E, DSC54E, DAI54E, DSA54E, 
					DSC64E, DAI64E, DSA64E, DSC74E, DAI74E, 
					DSA74E, DSC84E, DAI84E, DSA84E, DSC94E, 
					DAI94E, DSA94E, TLDS4E, DSPC4E, PSPR4E, 
					SZ014E, SZ024E, SZ034E, SZ044E, SZ054E, 
					SZ064E, SZ074E, SZ084E, SZ094E, SZ104E, 
					SZ114E, SZ124E, DUDT4E, PRNO4E, CMNO4E, 
					CMN24E, CMN34E, CMDF4E, SZCD4E, SRCD4E, 
					PROV4E, MSCD4E, PRUM4E, CVFC4E, MKGP4E, 
					UNWT4E, UNVL4E, TPSL4E, TXBL4E, NCHG4E, 
					SPCL4E, STCD4E, OGPR4E, OGCR4E, TGNO4E, 
					TGN24E, TGN34E, BGDT4E, ENDT4E, LNST4E, 
					INLN4E, BKOR4E, CLLN4E, PSBK4E, CRWS4E, 
					CRUS4E, CRDT4E, CRTM4E, MNWS4E, MNUS4E, 
					MNDT4E, MNTM4E, LCUS4E, LCDT4E, LCTM4E, 
					TLTA4E, TA014E, TA024E, TA034E, TA044E, 
					TA054E, TA064E, TA074E, TA084E, TA094E, 
					TA104E, TA114E, TA124E, TLQA4E, QA014E, 
					QA024E, QA034E, QA044E, QA054E, QA064E, 
					QA074E, QA084E, QA094E, QA104E, QA114E, 
					QA124E, TLQP4E, QP014E, QP024E, QP034E, 
					QP044E, QP054E, QP064E, QP074E, QP084E, 
					QP094E, QP104E, QP114E, QP124E, ALBT4E, 
					ABCL4E, PTNO4E, PTLN4E, PTSQ4E, PTDT4E, 
					PTTM4E, VRUS4E, VRDT4E, VRTM4E, APUS4E, 
					PRHG4E, CSNO4E, CSSN4E, SHNO4E, CSPO4E, 
					DVNO4E, SNNO4E, SBSN4E, SASN4E, SAPR4E, 
					SMN14E, BKDS4E, EDII4E, EDSP4E, EDRP4E, 
					PRUP4E, EDR14E, EDR24E, EDR34E, EDR44E, 
					EDCS4E, JBNO4E, JBRF4E, OGJR4E, JBDT4E, 
					JBAS4E, JBBT4E, JBLR4E, TLPA4E, PA014E, 
					PA024E, PA034E, PA044E, PA054E, PA064E, 
					PA074E, PA084E, PA094E, PA104E, PA114E, 
					PA124E, TLCO4E, CO014E, CO024E, CO034E, 
					CO044E, CO054E, CO064E, CO074E, CO084E, 
					CO094E, CO104E, CO114E, CO124E, TLCT4E, 
					CT014E, CT024E, CT034E, CT044E, CT054E, 
					CT064E, CT074E, CT084E, CT094E, CT104E, 
					CT114E, CT124E, TLCP4E, CP014E, CP024E, 
					CP034E, CP044E, CP054E, CP064E, CP074E, 
					CP084E, CP094E, CP104E, CP114E, CP124E, 
					TLCD4E, CD014E, CD024E, CD034E, CD044E, 
					CD054E, CD064E, CD074E, CD084E, CD094E, 
					CD104E, CD114E, CD124E, RMOR4E, TPDT4E, 
					TPTM4E, FRSP4E, WHNO4E
			from VPSFILES.ORDDTL0
			where CONO4E = <cfqueryparam cfsqltype="CF_SQL_NUMERIC" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.as400.ORDDTL0").init();
			obj.setCONO4E(qRead.CONO4E);
			obj.setORNO4E(qRead.ORNO4E);
			obj.setLNNO4E(qRead.LNNO4E);
			obj.setPRCD4E(qRead.PRCD4E);
			obj.setCRCD4E(qRead.CRCD4E);
			obj.setUNIT4E(qRead.UNIT4E);
			obj.setLSPR4E(qRead.LSPR4E);
			obj.setSLPR4E(qRead.SLPR4E);
			obj.setINPR4E(qRead.INPR4E);
			obj.setSCAM4E(qRead.SCAM4E);
			obj.setNTPR4E(qRead.NTPR4E);
			obj.setEXAM4E(qRead.EXAM4E);
			obj.setLDCT4E(qRead.LDCT4E);
			obj.setLDAM4E(qRead.LDAM4E);
			obj.setTDNO4E(qRead.TDNO4E);
			obj.setTDOV4E(qRead.TDOV4E);
			obj.setDSC14E(qRead.DSC14E);
			obj.setDAI14E(qRead.DAI14E);
			obj.setDSA14E(qRead.DSA14E);
			obj.setDSC24E(qRead.DSC24E);
			obj.setDAI24E(qRead.DAI24E);
			obj.setDSA24E(qRead.DSA24E);
			obj.setDSC34E(qRead.DSC34E);
			obj.setDAI34E(qRead.DAI34E);
			obj.setDSA34E(qRead.DSA34E);
			obj.setDSC44E(qRead.DSC44E);
			obj.setDAI44E(qRead.DAI44E);
			obj.setDSA44E(qRead.DSA44E);
			obj.setDSC54E(qRead.DSC54E);
			obj.setDAI54E(qRead.DAI54E);
			obj.setDSA54E(qRead.DSA54E);
			obj.setDSC64E(qRead.DSC64E);
			obj.setDAI64E(qRead.DAI64E);
			obj.setDSA64E(qRead.DSA64E);
			obj.setDSC74E(qRead.DSC74E);
			obj.setDAI74E(qRead.DAI74E);
			obj.setDSA74E(qRead.DSA74E);
			obj.setDSC84E(qRead.DSC84E);
			obj.setDAI84E(qRead.DAI84E);
			obj.setDSA84E(qRead.DSA84E);
			obj.setDSC94E(qRead.DSC94E);
			obj.setDAI94E(qRead.DAI94E);
			obj.setDSA94E(qRead.DSA94E);
			obj.setTLDS4E(qRead.TLDS4E);
			obj.setDSPC4E(qRead.DSPC4E);
			obj.setPSPR4E(qRead.PSPR4E);
			obj.setSZ014E(qRead.SZ014E);
			obj.setSZ024E(qRead.SZ024E);
			obj.setSZ034E(qRead.SZ034E);
			obj.setSZ044E(qRead.SZ044E);
			obj.setSZ054E(qRead.SZ054E);
			obj.setSZ064E(qRead.SZ064E);
			obj.setSZ074E(qRead.SZ074E);
			obj.setSZ084E(qRead.SZ084E);
			obj.setSZ094E(qRead.SZ094E);
			obj.setSZ104E(qRead.SZ104E);
			obj.setSZ114E(qRead.SZ114E);
			obj.setSZ124E(qRead.SZ124E);
			obj.setDUDT4E(qRead.DUDT4E);
			obj.setPRNO4E(qRead.PRNO4E);
			obj.setCMNO4E(qRead.CMNO4E);
			obj.setCMN24E(qRead.CMN24E);
			obj.setCMN34E(qRead.CMN34E);
			obj.setCMDF4E(qRead.CMDF4E);
			obj.setSZCD4E(qRead.SZCD4E);
			obj.setSRCD4E(qRead.SRCD4E);
			obj.setPROV4E(qRead.PROV4E);
			obj.setMSCD4E(qRead.MSCD4E);
			obj.setPRUM4E(qRead.PRUM4E);
			obj.setCVFC4E(qRead.CVFC4E);
			obj.setMKGP4E(qRead.MKGP4E);
			obj.setUNWT4E(qRead.UNWT4E);
			obj.setUNVL4E(qRead.UNVL4E);
			obj.setTPSL4E(qRead.TPSL4E);
			obj.setTXBL4E(qRead.TXBL4E);
			obj.setNCHG4E(qRead.NCHG4E);
			obj.setSPCL4E(qRead.SPCL4E);
			obj.setSTCD4E(qRead.STCD4E);
			obj.setOGPR4E(qRead.OGPR4E);
			obj.setOGCR4E(qRead.OGCR4E);
			obj.setTGNO4E(qRead.TGNO4E);
			obj.setTGN24E(qRead.TGN24E);
			obj.setTGN34E(qRead.TGN34E);
			obj.setBGDT4E(qRead.BGDT4E);
			obj.setENDT4E(qRead.ENDT4E);
			obj.setLNST4E(qRead.LNST4E);
			obj.setINLN4E(qRead.INLN4E);
			obj.setBKOR4E(qRead.BKOR4E);
			obj.setCLLN4E(qRead.CLLN4E);
			obj.setPSBK4E(qRead.PSBK4E);
			obj.setCRWS4E(qRead.CRWS4E);
			obj.setCRUS4E(qRead.CRUS4E);
			obj.setCRDT4E(qRead.CRDT4E);
			obj.setCRTM4E(qRead.CRTM4E);
			obj.setMNWS4E(qRead.MNWS4E);
			obj.setMNUS4E(qRead.MNUS4E);
			obj.setMNDT4E(qRead.MNDT4E);
			obj.setMNTM4E(qRead.MNTM4E);
			obj.setLCUS4E(qRead.LCUS4E);
			obj.setLCDT4E(qRead.LCDT4E);
			obj.setLCTM4E(qRead.LCTM4E);
			obj.setTLTA4E(qRead.TLTA4E);
			obj.setTA014E(qRead.TA014E);
			obj.setTA024E(qRead.TA024E);
			obj.setTA034E(qRead.TA034E);
			obj.setTA044E(qRead.TA044E);
			obj.setTA054E(qRead.TA054E);
			obj.setTA064E(qRead.TA064E);
			obj.setTA074E(qRead.TA074E);
			obj.setTA084E(qRead.TA084E);
			obj.setTA094E(qRead.TA094E);
			obj.setTA104E(qRead.TA104E);
			obj.setTA114E(qRead.TA114E);
			obj.setTA124E(qRead.TA124E);
			obj.setTLQA4E(qRead.TLQA4E);
			obj.setQA014E(qRead.QA014E);
			obj.setQA024E(qRead.QA024E);
			obj.setQA034E(qRead.QA034E);
			obj.setQA044E(qRead.QA044E);
			obj.setQA054E(qRead.QA054E);
			obj.setQA064E(qRead.QA064E);
			obj.setQA074E(qRead.QA074E);
			obj.setQA084E(qRead.QA084E);
			obj.setQA094E(qRead.QA094E);
			obj.setQA104E(qRead.QA104E);
			obj.setQA114E(qRead.QA114E);
			obj.setQA124E(qRead.QA124E);
			obj.setTLQP4E(qRead.TLQP4E);
			obj.setQP014E(qRead.QP014E);
			obj.setQP024E(qRead.QP024E);
			obj.setQP034E(qRead.QP034E);
			obj.setQP044E(qRead.QP044E);
			obj.setQP054E(qRead.QP054E);
			obj.setQP064E(qRead.QP064E);
			obj.setQP074E(qRead.QP074E);
			obj.setQP084E(qRead.QP084E);
			obj.setQP094E(qRead.QP094E);
			obj.setQP104E(qRead.QP104E);
			obj.setQP114E(qRead.QP114E);
			obj.setQP124E(qRead.QP124E);
			obj.setALBT4E(qRead.ALBT4E);
			obj.setABCL4E(qRead.ABCL4E);
			obj.setPTNO4E(qRead.PTNO4E);
			obj.setPTLN4E(qRead.PTLN4E);
			obj.setPTSQ4E(qRead.PTSQ4E);
			obj.setPTDT4E(qRead.PTDT4E);
			obj.setPTTM4E(qRead.PTTM4E);
			obj.setVRUS4E(qRead.VRUS4E);
			obj.setVRDT4E(qRead.VRDT4E);
			obj.setVRTM4E(qRead.VRTM4E);
			obj.setAPUS4E(qRead.APUS4E);
			obj.setPRHG4E(qRead.PRHG4E);
			obj.setCSNO4E(qRead.CSNO4E);
			obj.setCSSN4E(qRead.CSSN4E);
			obj.setSHNO4E(qRead.SHNO4E);
			obj.setCSPO4E(qRead.CSPO4E);
			obj.setDVNO4E(qRead.DVNO4E);
			obj.setSNNO4E(qRead.SNNO4E);
			obj.setSBSN4E(qRead.SBSN4E);
			obj.setSASN4E(qRead.SASN4E);
			obj.setSAPR4E(qRead.SAPR4E);
			obj.setSMN14E(qRead.SMN14E);
			obj.setBKDS4E(qRead.BKDS4E);
			obj.setEDII4E(qRead.EDII4E);
			obj.setEDSP4E(qRead.EDSP4E);
			obj.setEDRP4E(qRead.EDRP4E);
			obj.setPRUP4E(qRead.PRUP4E);
			obj.setEDR14E(qRead.EDR14E);
			obj.setEDR24E(qRead.EDR24E);
			obj.setEDR34E(qRead.EDR34E);
			obj.setEDR44E(qRead.EDR44E);
			obj.setEDCS4E(qRead.EDCS4E);
			obj.setJBNO4E(qRead.JBNO4E);
			obj.setJBRF4E(qRead.JBRF4E);
			obj.setOGJR4E(qRead.OGJR4E);
			obj.setJBDT4E(qRead.JBDT4E);
			obj.setJBAS4E(qRead.JBAS4E);
			obj.setJBBT4E(qRead.JBBT4E);
			obj.setJBLR4E(qRead.JBLR4E);
			obj.setTLPA4E(qRead.TLPA4E);
			obj.setPA014E(qRead.PA014E);
			obj.setPA024E(qRead.PA024E);
			obj.setPA034E(qRead.PA034E);
			obj.setPA044E(qRead.PA044E);
			obj.setPA054E(qRead.PA054E);
			obj.setPA064E(qRead.PA064E);
			obj.setPA074E(qRead.PA074E);
			obj.setPA084E(qRead.PA084E);
			obj.setPA094E(qRead.PA094E);
			obj.setPA104E(qRead.PA104E);
			obj.setPA114E(qRead.PA114E);
			obj.setPA124E(qRead.PA124E);
			obj.setTLCO4E(qRead.TLCO4E);
			obj.setCO014E(qRead.CO014E);
			obj.setCO024E(qRead.CO024E);
			obj.setCO034E(qRead.CO034E);
			obj.setCO044E(qRead.CO044E);
			obj.setCO054E(qRead.CO054E);
			obj.setCO064E(qRead.CO064E);
			obj.setCO074E(qRead.CO074E);
			obj.setCO084E(qRead.CO084E);
			obj.setCO094E(qRead.CO094E);
			obj.setCO104E(qRead.CO104E);
			obj.setCO114E(qRead.CO114E);
			obj.setCO124E(qRead.CO124E);
			obj.setTLCT4E(qRead.TLCT4E);
			obj.setCT014E(qRead.CT014E);
			obj.setCT024E(qRead.CT024E);
			obj.setCT034E(qRead.CT034E);
			obj.setCT044E(qRead.CT044E);
			obj.setCT054E(qRead.CT054E);
			obj.setCT064E(qRead.CT064E);
			obj.setCT074E(qRead.CT074E);
			obj.setCT084E(qRead.CT084E);
			obj.setCT094E(qRead.CT094E);
			obj.setCT104E(qRead.CT104E);
			obj.setCT114E(qRead.CT114E);
			obj.setCT124E(qRead.CT124E);
			obj.setTLCP4E(qRead.TLCP4E);
			obj.setCP014E(qRead.CP014E);
			obj.setCP024E(qRead.CP024E);
			obj.setCP034E(qRead.CP034E);
			obj.setCP044E(qRead.CP044E);
			obj.setCP054E(qRead.CP054E);
			obj.setCP064E(qRead.CP064E);
			obj.setCP074E(qRead.CP074E);
			obj.setCP084E(qRead.CP084E);
			obj.setCP094E(qRead.CP094E);
			obj.setCP104E(qRead.CP104E);
			obj.setCP114E(qRead.CP114E);
			obj.setCP124E(qRead.CP124E);
			obj.setTLCD4E(qRead.TLCD4E);
			obj.setCD014E(qRead.CD014E);
			obj.setCD024E(qRead.CD024E);
			obj.setCD034E(qRead.CD034E);
			obj.setCD044E(qRead.CD044E);
			obj.setCD054E(qRead.CD054E);
			obj.setCD064E(qRead.CD064E);
			obj.setCD074E(qRead.CD074E);
			obj.setCD084E(qRead.CD084E);
			obj.setCD094E(qRead.CD094E);
			obj.setCD104E(qRead.CD104E);
			obj.setCD114E(qRead.CD114E);
			obj.setCD124E(qRead.CD124E);
			obj.setRMOR4E(qRead.RMOR4E);
			obj.setTPDT4E(qRead.TPDT4E);
			obj.setTPTM4E(qRead.TPTM4E);
			obj.setFRSP4E(qRead.FRSP4E);
			obj.setWHNO4E(qRead.WHNO4E);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.as400.ORDDTL0">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local0=arguments.bean.getCONO4E()>
		<cfset var local1=arguments.bean.getORNO4E()>
		<cfset var local2=arguments.bean.getLNNO4E()>
		<cfset var local3=arguments.bean.getPRCD4E()>
		<cfset var local4=arguments.bean.getCRCD4E()>
		<cfset var local5=arguments.bean.getUNIT4E()>
		<cfset var local6=arguments.bean.getLSPR4E()>
		<cfset var local7=arguments.bean.getSLPR4E()>
		<cfset var local8=arguments.bean.getINPR4E()>
		<cfset var local9=arguments.bean.getSCAM4E()>
		<cfset var local10=arguments.bean.getNTPR4E()>
		<cfset var local11=arguments.bean.getEXAM4E()>
		<cfset var local12=arguments.bean.getLDCT4E()>
		<cfset var local13=arguments.bean.getLDAM4E()>
		<cfset var local14=arguments.bean.getTDNO4E()>
		<cfset var local15=arguments.bean.getTDOV4E()>
		<cfset var local16=arguments.bean.getDSC14E()>
		<cfset var local17=arguments.bean.getDAI14E()>
		<cfset var local18=arguments.bean.getDSA14E()>
		<cfset var local19=arguments.bean.getDSC24E()>
		<cfset var local20=arguments.bean.getDAI24E()>
		<cfset var local21=arguments.bean.getDSA24E()>
		<cfset var local22=arguments.bean.getDSC34E()>
		<cfset var local23=arguments.bean.getDAI34E()>
		<cfset var local24=arguments.bean.getDSA34E()>
		<cfset var local25=arguments.bean.getDSC44E()>
		<cfset var local26=arguments.bean.getDAI44E()>
		<cfset var local27=arguments.bean.getDSA44E()>
		<cfset var local28=arguments.bean.getDSC54E()>
		<cfset var local29=arguments.bean.getDAI54E()>
		<cfset var local30=arguments.bean.getDSA54E()>
		<cfset var local31=arguments.bean.getDSC64E()>
		<cfset var local32=arguments.bean.getDAI64E()>
		<cfset var local33=arguments.bean.getDSA64E()>
		<cfset var local34=arguments.bean.getDSC74E()>
		<cfset var local35=arguments.bean.getDAI74E()>
		<cfset var local36=arguments.bean.getDSA74E()>
		<cfset var local37=arguments.bean.getDSC84E()>
		<cfset var local38=arguments.bean.getDAI84E()>
		<cfset var local39=arguments.bean.getDSA84E()>
		<cfset var local40=arguments.bean.getDSC94E()>
		<cfset var local41=arguments.bean.getDAI94E()>
		<cfset var local42=arguments.bean.getDSA94E()>
		<cfset var local43=arguments.bean.getTLDS4E()>
		<cfset var local44=arguments.bean.getDSPC4E()>
		<cfset var local45=arguments.bean.getPSPR4E()>
		<cfset var local46=arguments.bean.getSZ014E()>
		<cfset var local47=arguments.bean.getSZ024E()>
		<cfset var local48=arguments.bean.getSZ034E()>
		<cfset var local49=arguments.bean.getSZ044E()>
		<cfset var local50=arguments.bean.getSZ054E()>
		<cfset var local51=arguments.bean.getSZ064E()>
		<cfset var local52=arguments.bean.getSZ074E()>
		<cfset var local53=arguments.bean.getSZ084E()>
		<cfset var local54=arguments.bean.getSZ094E()>
		<cfset var local55=arguments.bean.getSZ104E()>
		<cfset var local56=arguments.bean.getSZ114E()>
		<cfset var local57=arguments.bean.getSZ124E()>
		<cfset var local58=arguments.bean.getDUDT4E()>
		<cfset var local59=arguments.bean.getPRNO4E()>
		<cfset var local60=arguments.bean.getCMNO4E()>
		<cfset var local61=arguments.bean.getCMN24E()>
		<cfset var local62=arguments.bean.getCMN34E()>
		<cfset var local63=arguments.bean.getCMDF4E()>
		<cfset var local64=arguments.bean.getSZCD4E()>
		<cfset var local65=arguments.bean.getSRCD4E()>
		<cfset var local66=arguments.bean.getPROV4E()>
		<cfset var local67=arguments.bean.getMSCD4E()>
		<cfset var local68=arguments.bean.getPRUM4E()>
		<cfset var local69=arguments.bean.getCVFC4E()>
		<cfset var local70=arguments.bean.getMKGP4E()>
		<cfset var local71=arguments.bean.getUNWT4E()>
		<cfset var local72=arguments.bean.getUNVL4E()>
		<cfset var local73=arguments.bean.getTPSL4E()>
		<cfset var local74=arguments.bean.getTXBL4E()>
		<cfset var local75=arguments.bean.getNCHG4E()>
		<cfset var local76=arguments.bean.getSPCL4E()>
		<cfset var local77=arguments.bean.getSTCD4E()>
		<cfset var local78=arguments.bean.getOGPR4E()>
		<cfset var local79=arguments.bean.getOGCR4E()>
		<cfset var local80=arguments.bean.getTGNO4E()>
		<cfset var local81=arguments.bean.getTGN24E()>
		<cfset var local82=arguments.bean.getTGN34E()>
		<cfset var local83=arguments.bean.getBGDT4E()>
		<cfset var local84=arguments.bean.getENDT4E()>
		<cfset var local85=arguments.bean.getLNST4E()>
		<cfset var local86=arguments.bean.getINLN4E()>
		<cfset var local87=arguments.bean.getBKOR4E()>
		<cfset var local88=arguments.bean.getCLLN4E()>
		<cfset var local89=arguments.bean.getPSBK4E()>
		<cfset var local90=arguments.bean.getCRWS4E()>
		<cfset var local91=arguments.bean.getCRUS4E()>
		<cfset var local92=arguments.bean.getCRDT4E()>
		<cfset var local93=arguments.bean.getCRTM4E()>
		<cfset var local94=arguments.bean.getMNWS4E()>
		<cfset var local95=arguments.bean.getMNUS4E()>
		<cfset var local96=arguments.bean.getMNDT4E()>
		<cfset var local97=arguments.bean.getMNTM4E()>
		<cfset var local98=arguments.bean.getLCUS4E()>
		<cfset var local99=arguments.bean.getLCDT4E()>
		<cfset var local100=arguments.bean.getLCTM4E()>
		<cfset var local101=arguments.bean.getTLTA4E()>
		<cfset var local102=arguments.bean.getTA014E()>
		<cfset var local103=arguments.bean.getTA024E()>
		<cfset var local104=arguments.bean.getTA034E()>
		<cfset var local105=arguments.bean.getTA044E()>
		<cfset var local106=arguments.bean.getTA054E()>
		<cfset var local107=arguments.bean.getTA064E()>
		<cfset var local108=arguments.bean.getTA074E()>
		<cfset var local109=arguments.bean.getTA084E()>
		<cfset var local110=arguments.bean.getTA094E()>
		<cfset var local111=arguments.bean.getTA104E()>
		<cfset var local112=arguments.bean.getTA114E()>
		<cfset var local113=arguments.bean.getTA124E()>
		<cfset var local114=arguments.bean.getTLQA4E()>
		<cfset var local115=arguments.bean.getQA014E()>
		<cfset var local116=arguments.bean.getQA024E()>
		<cfset var local117=arguments.bean.getQA034E()>
		<cfset var local118=arguments.bean.getQA044E()>
		<cfset var local119=arguments.bean.getQA054E()>
		<cfset var local120=arguments.bean.getQA064E()>
		<cfset var local121=arguments.bean.getQA074E()>
		<cfset var local122=arguments.bean.getQA084E()>
		<cfset var local123=arguments.bean.getQA094E()>
		<cfset var local124=arguments.bean.getQA104E()>
		<cfset var local125=arguments.bean.getQA114E()>
		<cfset var local126=arguments.bean.getQA124E()>
		<cfset var local127=arguments.bean.getTLQP4E()>
		<cfset var local128=arguments.bean.getQP014E()>
		<cfset var local129=arguments.bean.getQP024E()>
		<cfset var local130=arguments.bean.getQP034E()>
		<cfset var local131=arguments.bean.getQP044E()>
		<cfset var local132=arguments.bean.getQP054E()>
		<cfset var local133=arguments.bean.getQP064E()>
		<cfset var local134=arguments.bean.getQP074E()>
		<cfset var local135=arguments.bean.getQP084E()>
		<cfset var local136=arguments.bean.getQP094E()>
		<cfset var local137=arguments.bean.getQP104E()>
		<cfset var local138=arguments.bean.getQP114E()>
		<cfset var local139=arguments.bean.getQP124E()>
		<cfset var local140=arguments.bean.getALBT4E()>
		<cfset var local141=arguments.bean.getABCL4E()>
		<cfset var local142=arguments.bean.getPTNO4E()>
		<cfset var local143=arguments.bean.getPTLN4E()>
		<cfset var local144=arguments.bean.getPTSQ4E()>
		<cfset var local145=arguments.bean.getPTDT4E()>
		<cfset var local146=arguments.bean.getPTTM4E()>
		<cfset var local147=arguments.bean.getVRUS4E()>
		<cfset var local148=arguments.bean.getVRDT4E()>
		<cfset var local149=arguments.bean.getVRTM4E()>
		<cfset var local150=arguments.bean.getAPUS4E()>
		<cfset var local151=arguments.bean.getPRHG4E()>
		<cfset var local152=arguments.bean.getCSNO4E()>
		<cfset var local153=arguments.bean.getCSSN4E()>
		<cfset var local154=arguments.bean.getSHNO4E()>
		<cfset var local155=arguments.bean.getCSPO4E()>
		<cfset var local156=arguments.bean.getDVNO4E()>
		<cfset var local157=arguments.bean.getSNNO4E()>
		<cfset var local158=arguments.bean.getSBSN4E()>
		<cfset var local159=arguments.bean.getSASN4E()>
		<cfset var local160=arguments.bean.getSAPR4E()>
		<cfset var local161=arguments.bean.getSMN14E()>
		<cfset var local162=arguments.bean.getBKDS4E()>
		<cfset var local163=arguments.bean.getEDII4E()>
		<cfset var local164=arguments.bean.getEDSP4E()>
		<cfset var local165=arguments.bean.getEDRP4E()>
		<cfset var local166=arguments.bean.getPRUP4E()>
		<cfset var local167=arguments.bean.getEDR14E()>
		<cfset var local168=arguments.bean.getEDR24E()>
		<cfset var local169=arguments.bean.getEDR34E()>
		<cfset var local170=arguments.bean.getEDR44E()>
		<cfset var local171=arguments.bean.getEDCS4E()>
		<cfset var local172=arguments.bean.getJBNO4E()>
		<cfset var local173=arguments.bean.getJBRF4E()>
		<cfset var local174=arguments.bean.getOGJR4E()>
		<cfset var local175=arguments.bean.getJBDT4E()>
		<cfset var local176=arguments.bean.getJBAS4E()>
		<cfset var local177=arguments.bean.getJBBT4E()>
		<cfset var local178=arguments.bean.getJBLR4E()>
		<cfset var local179=arguments.bean.getTLPA4E()>
		<cfset var local180=arguments.bean.getPA014E()>
		<cfset var local181=arguments.bean.getPA024E()>
		<cfset var local182=arguments.bean.getPA034E()>
		<cfset var local183=arguments.bean.getPA044E()>
		<cfset var local184=arguments.bean.getPA054E()>
		<cfset var local185=arguments.bean.getPA064E()>
		<cfset var local186=arguments.bean.getPA074E()>
		<cfset var local187=arguments.bean.getPA084E()>
		<cfset var local188=arguments.bean.getPA094E()>
		<cfset var local189=arguments.bean.getPA104E()>
		<cfset var local190=arguments.bean.getPA114E()>
		<cfset var local191=arguments.bean.getPA124E()>
		<cfset var local192=arguments.bean.getTLCO4E()>
		<cfset var local193=arguments.bean.getCO014E()>
		<cfset var local194=arguments.bean.getCO024E()>
		<cfset var local195=arguments.bean.getCO034E()>
		<cfset var local196=arguments.bean.getCO044E()>
		<cfset var local197=arguments.bean.getCO054E()>
		<cfset var local198=arguments.bean.getCO064E()>
		<cfset var local199=arguments.bean.getCO074E()>
		<cfset var local200=arguments.bean.getCO084E()>
		<cfset var local201=arguments.bean.getCO094E()>
		<cfset var local202=arguments.bean.getCO104E()>
		<cfset var local203=arguments.bean.getCO114E()>
		<cfset var local204=arguments.bean.getCO124E()>
		<cfset var local205=arguments.bean.getTLCT4E()>
		<cfset var local206=arguments.bean.getCT014E()>
		<cfset var local207=arguments.bean.getCT024E()>
		<cfset var local208=arguments.bean.getCT034E()>
		<cfset var local209=arguments.bean.getCT044E()>
		<cfset var local210=arguments.bean.getCT054E()>
		<cfset var local211=arguments.bean.getCT064E()>
		<cfset var local212=arguments.bean.getCT074E()>
		<cfset var local213=arguments.bean.getCT084E()>
		<cfset var local214=arguments.bean.getCT094E()>
		<cfset var local215=arguments.bean.getCT104E()>
		<cfset var local216=arguments.bean.getCT114E()>
		<cfset var local217=arguments.bean.getCT124E()>
		<cfset var local218=arguments.bean.getTLCP4E()>
		<cfset var local219=arguments.bean.getCP014E()>
		<cfset var local220=arguments.bean.getCP024E()>
		<cfset var local221=arguments.bean.getCP034E()>
		<cfset var local222=arguments.bean.getCP044E()>
		<cfset var local223=arguments.bean.getCP054E()>
		<cfset var local224=arguments.bean.getCP064E()>
		<cfset var local225=arguments.bean.getCP074E()>
		<cfset var local226=arguments.bean.getCP084E()>
		<cfset var local227=arguments.bean.getCP094E()>
		<cfset var local228=arguments.bean.getCP104E()>
		<cfset var local229=arguments.bean.getCP114E()>
		<cfset var local230=arguments.bean.getCP124E()>
		<cfset var local231=arguments.bean.getTLCD4E()>
		<cfset var local232=arguments.bean.getCD014E()>
		<cfset var local233=arguments.bean.getCD024E()>
		<cfset var local234=arguments.bean.getCD034E()>
		<cfset var local235=arguments.bean.getCD044E()>
		<cfset var local236=arguments.bean.getCD054E()>
		<cfset var local237=arguments.bean.getCD064E()>
		<cfset var local238=arguments.bean.getCD074E()>
		<cfset var local239=arguments.bean.getCD084E()>
		<cfset var local240=arguments.bean.getCD094E()>
		<cfset var local241=arguments.bean.getCD104E()>
		<cfset var local242=arguments.bean.getCD114E()>
		<cfset var local243=arguments.bean.getCD124E()>
		<cfset var local244=arguments.bean.getRMOR4E()>
		<cfset var local245=arguments.bean.getTPDT4E()>
		<cfset var local246=arguments.bean.getTPTM4E()>
		<cfset var local247=arguments.bean.getFRSP4E()>
		<cfset var local248=arguments.bean.getWHNO4E()>

		<cfquery name="qCreate" datasource="AS400">
			insert into VPSFILES.ORDDTL0(CONO4E, ORNO4E, LNNO4E, PRCD4E, CRCD4E, UNIT4E, LSPR4E, SLPR4E, INPR4E, SCAM4E, NTPR4E, EXAM4E, LDCT4E, LDAM4E, TDNO4E, TDOV4E, DSC14E, DAI14E, DSA14E, DSC24E, DAI24E, DSA24E, DSC34E, DAI34E, DSA34E, DSC44E, DAI44E, DSA44E, DSC54E, DAI54E, DSA54E, DSC64E, DAI64E, DSA64E, DSC74E, DAI74E, DSA74E, DSC84E, DAI84E, DSA84E, DSC94E, DAI94E, DSA94E, TLDS4E, DSPC4E, PSPR4E, SZ014E, SZ024E, SZ034E, SZ044E, SZ054E, SZ064E, SZ074E, SZ084E, SZ094E, SZ104E, SZ114E, SZ124E, DUDT4E, PRNO4E, CMNO4E, CMN24E, CMN34E, CMDF4E, SZCD4E, SRCD4E, PROV4E, MSCD4E, PRUM4E, CVFC4E, MKGP4E, UNWT4E, UNVL4E, TPSL4E, TXBL4E, NCHG4E, SPCL4E, STCD4E, OGPR4E, OGCR4E, TGNO4E, TGN24E, TGN34E, BGDT4E, ENDT4E, LNST4E, INLN4E, BKOR4E, CLLN4E, PSBK4E, CRWS4E, CRUS4E, CRDT4E, CRTM4E, MNWS4E, MNUS4E, MNDT4E, MNTM4E, LCUS4E, LCDT4E, LCTM4E, TLTA4E, TA014E, TA024E, TA034E, TA044E, TA054E, TA064E, TA074E, TA084E, TA094E, TA104E, TA114E, TA124E, TLQA4E, QA014E, QA024E, QA034E, QA044E, QA054E, QA064E, QA074E, QA084E, QA094E, QA104E, QA114E, QA124E, TLQP4E, QP014E, QP024E, QP034E, QP044E, QP054E, QP064E, QP074E, QP084E, QP094E, QP104E, QP114E, QP124E, ALBT4E, ABCL4E, PTNO4E, PTLN4E, PTSQ4E, PTDT4E, PTTM4E, VRUS4E, VRDT4E, VRTM4E, APUS4E, PRHG4E, CSNO4E, CSSN4E, SHNO4E, CSPO4E, DVNO4E, SNNO4E, SBSN4E, SASN4E, SAPR4E, SMN14E, BKDS4E, EDII4E, EDSP4E, EDRP4E, PRUP4E, EDR14E, EDR24E, EDR34E, EDR44E, EDCS4E, JBNO4E, JBRF4E, OGJR4E, JBDT4E, JBAS4E, JBBT4E, JBLR4E, TLPA4E, PA014E, PA024E, PA034E, PA044E, PA054E, PA064E, PA074E, PA084E, PA094E, PA104E, PA114E, PA124E, TLCO4E, CO014E, CO024E, CO034E, CO044E, CO054E, CO064E, CO074E, CO084E, CO094E, CO104E, CO114E, CO124E, TLCT4E, CT014E, CT024E, CT034E, CT044E, CT054E, CT064E, CT074E, CT084E, CT094E, CT104E, CT114E, CT124E, TLCP4E, CP014E, CP024E, CP034E, CP044E, CP054E, CP064E, CP074E, CP084E, CP094E, CP104E, CP114E, CP124E, TLCD4E, CD014E, CD024E, CD034E, CD044E, CD054E, CD064E, CD074E, CD084E, CD094E, CD104E, CD114E, CD124E, RMOR4E, TPDT4E, TPTM4E, FRSP4E, WHNO4E)
			values (
				<cfqueryparam value="#local0#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local0 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local1#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local2#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local2 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local3#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local4#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local5#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local5 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local6#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local6 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local7#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local7 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local8#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local8 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local9#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local9 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local10#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local10 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local11#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local11 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local12#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local13#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local13 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local14#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local14 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local15#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local15 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local16#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local17#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local18#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local18 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local19#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local20#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local21#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local21 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local22#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local23#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local24#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local24 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local25#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local26#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local27#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local27 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local28#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local29#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local30#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local30 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local31#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local32#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local33#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local33 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local34#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local35#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local36#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local36 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local37#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local38#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local39#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local39 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local40#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local41#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local42#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local42 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local43#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local43 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local44#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local44 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local45#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local45 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local46#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local46 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local47#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local47 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local48#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local48 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local49#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local49 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local50#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local50 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local51#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local51 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local52#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local52 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local53#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local53 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local54#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local54 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local55#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local55 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local56#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local56 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local57#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local57 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local58#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local58 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local59#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local59 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local60#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local60 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local61#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local61 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local62#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local62 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local63#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local63 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local64#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local65#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local66#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local67#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local68#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local69#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local69 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local70#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local71#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local71 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local72#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local72 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local73#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local74#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local75#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local76#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local77#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local78#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local79#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local80#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local80 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local81#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local81 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local82#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local82 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local83#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local83 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local84#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local84 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local85#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local86#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local87#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local88#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local89#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local90#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local91#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local92#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local92 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local93#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local93 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local94#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local95#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local96#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local96 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local97#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local97 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local98#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local99#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local99 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local100#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local100 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local101#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local101 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local102#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local102 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local103#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local103 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local104#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local104 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local105#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local105 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local106#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local106 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local107#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local107 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local108#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local108 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local109#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local109 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local110#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local110 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local111#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local111 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local112#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local112 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local113#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local113 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local114#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local114 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local115#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local115 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local116#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local116 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local117#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local117 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local118#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local118 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local119#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local119 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local120#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local120 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local121#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local121 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local122#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local122 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local123#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local123 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local124#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local124 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local125#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local125 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local126#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local126 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local127#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local127 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local128#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local128 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local129#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local129 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local130#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local130 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local131#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local131 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local132#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local132 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local133#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local133 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local134#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local134 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local135#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local135 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local136#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local136 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local137#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local137 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local138#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local138 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local139#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local139 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local140#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local140 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local141#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local142#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local142 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local143#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local143 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local144#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local144 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local145#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local145 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local146#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local146 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local147#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local148#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local148 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local149#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local149 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local150#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local151#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local152#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local152 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local153#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local154#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local154 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local155#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local156#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local156 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local157#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local157 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local158#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local158 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local159#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local159 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local160#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local161#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local161 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local162#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local163#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local164#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local164 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local165#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local165 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local166#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local166 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local167#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local168#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local169#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local170#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local171#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local171 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local172#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local172 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local173#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local174#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local175#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local175 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local176#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local177#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local177 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local178#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local179#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local179 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local180#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local180 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local181#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local181 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local182#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local182 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local183#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local183 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local184#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local184 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local185#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local185 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local186#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local186 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local187#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local187 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local188#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local188 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local189#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local189 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local190#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local190 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local191#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local191 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local192#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local192 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local193#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local193 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local194#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local194 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local195#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local195 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local196#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local196 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local197#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local197 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local198#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local198 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local199#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local199 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local200#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local200 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local201#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local201 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local202#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local202 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local203#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local203 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local204#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local204 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local205#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local205 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local206#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local206 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local207#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local207 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local208#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local208 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local209#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local209 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local210#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local210 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local211#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local211 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local212#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local212 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local213#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local213 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local214#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local214 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local215#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local215 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local216#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local216 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local217#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local217 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local218#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local218 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local219#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local219 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local220#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local220 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local221#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local221 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local222#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local222 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local223#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local223 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local224#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local224 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local225#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local225 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local226#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local226 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local227#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local227 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local228#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local228 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local229#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local229 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local230#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local230 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local231#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local231 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local232#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local232 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local233#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local233 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local234#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local234 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local235#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local235 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local236#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local236 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local237#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local237 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local238#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local238 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local239#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local239 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local240#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local240 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local241#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local241 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local242#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local242 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local243#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local243 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local244#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local245#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local245 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local246#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local246 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local247#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local247 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local248#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local248 eq ""), de("yes"), de("no"))#" />
			)
		</cfquery>

		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.as400.ORDDTL0">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="AS400" result="status">
			update VPSFILES.ORDDTL0
			set CONO4E = <cfqueryparam value="#arguments.bean.getCONO4E()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getCONO4E() eq ""), de("yes"), de("no"))#" />,
				ORNO4E = <cfqueryparam value="#arguments.bean.getORNO4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getORNO4E() eq ""), de("yes"), de("no"))#" />,
				LNNO4E = <cfqueryparam value="#arguments.bean.getLNNO4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getLNNO4E() eq ""), de("yes"), de("no"))#" />,
				PRCD4E = <cfqueryparam value="#arguments.bean.getPRCD4E()#" cfsqltype="CF_SQL_CHAR" />,
				CRCD4E = <cfqueryparam value="#arguments.bean.getCRCD4E()#" cfsqltype="CF_SQL_CHAR" />,
				UNIT4E = <cfqueryparam value="#arguments.bean.getUNIT4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getUNIT4E() eq ""), de("yes"), de("no"))#" />,
				LSPR4E = <cfqueryparam value="#arguments.bean.getLSPR4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getLSPR4E() eq ""), de("yes"), de("no"))#" />,
				SLPR4E = <cfqueryparam value="#arguments.bean.getSLPR4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSLPR4E() eq ""), de("yes"), de("no"))#" />,
				INPR4E = <cfqueryparam value="#arguments.bean.getINPR4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getINPR4E() eq ""), de("yes"), de("no"))#" />,
				SCAM4E = <cfqueryparam value="#arguments.bean.getSCAM4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSCAM4E() eq ""), de("yes"), de("no"))#" />,
				NTPR4E = <cfqueryparam value="#arguments.bean.getNTPR4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getNTPR4E() eq ""), de("yes"), de("no"))#" />,
				EXAM4E = <cfqueryparam value="#arguments.bean.getEXAM4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getEXAM4E() eq ""), de("yes"), de("no"))#" />,
				LDCT4E = <cfqueryparam value="#arguments.bean.getLDCT4E()#" cfsqltype="CF_SQL_CHAR" />,
				LDAM4E = <cfqueryparam value="#arguments.bean.getLDAM4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getLDAM4E() eq ""), de("yes"), de("no"))#" />,
				TDNO4E = <cfqueryparam value="#arguments.bean.getTDNO4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTDNO4E() eq ""), de("yes"), de("no"))#" />,
				TDOV4E = <cfqueryparam value="#arguments.bean.getTDOV4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTDOV4E() eq ""), de("yes"), de("no"))#" />,
				DSC14E = <cfqueryparam value="#arguments.bean.getDSC14E()#" cfsqltype="CF_SQL_CHAR" />,
				DAI14E = <cfqueryparam value="#arguments.bean.getDAI14E()#" cfsqltype="CF_SQL_CHAR" />,
				DSA14E = <cfqueryparam value="#arguments.bean.getDSA14E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getDSA14E() eq ""), de("yes"), de("no"))#" />,
				DSC24E = <cfqueryparam value="#arguments.bean.getDSC24E()#" cfsqltype="CF_SQL_CHAR" />,
				DAI24E = <cfqueryparam value="#arguments.bean.getDAI24E()#" cfsqltype="CF_SQL_CHAR" />,
				DSA24E = <cfqueryparam value="#arguments.bean.getDSA24E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getDSA24E() eq ""), de("yes"), de("no"))#" />,
				DSC34E = <cfqueryparam value="#arguments.bean.getDSC34E()#" cfsqltype="CF_SQL_CHAR" />,
				DAI34E = <cfqueryparam value="#arguments.bean.getDAI34E()#" cfsqltype="CF_SQL_CHAR" />,
				DSA34E = <cfqueryparam value="#arguments.bean.getDSA34E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getDSA34E() eq ""), de("yes"), de("no"))#" />,
				DSC44E = <cfqueryparam value="#arguments.bean.getDSC44E()#" cfsqltype="CF_SQL_CHAR" />,
				DAI44E = <cfqueryparam value="#arguments.bean.getDAI44E()#" cfsqltype="CF_SQL_CHAR" />,
				DSA44E = <cfqueryparam value="#arguments.bean.getDSA44E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getDSA44E() eq ""), de("yes"), de("no"))#" />,
				DSC54E = <cfqueryparam value="#arguments.bean.getDSC54E()#" cfsqltype="CF_SQL_CHAR" />,
				DAI54E = <cfqueryparam value="#arguments.bean.getDAI54E()#" cfsqltype="CF_SQL_CHAR" />,
				DSA54E = <cfqueryparam value="#arguments.bean.getDSA54E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getDSA54E() eq ""), de("yes"), de("no"))#" />,
				DSC64E = <cfqueryparam value="#arguments.bean.getDSC64E()#" cfsqltype="CF_SQL_CHAR" />,
				DAI64E = <cfqueryparam value="#arguments.bean.getDAI64E()#" cfsqltype="CF_SQL_CHAR" />,
				DSA64E = <cfqueryparam value="#arguments.bean.getDSA64E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getDSA64E() eq ""), de("yes"), de("no"))#" />,
				DSC74E = <cfqueryparam value="#arguments.bean.getDSC74E()#" cfsqltype="CF_SQL_CHAR" />,
				DAI74E = <cfqueryparam value="#arguments.bean.getDAI74E()#" cfsqltype="CF_SQL_CHAR" />,
				DSA74E = <cfqueryparam value="#arguments.bean.getDSA74E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getDSA74E() eq ""), de("yes"), de("no"))#" />,
				DSC84E = <cfqueryparam value="#arguments.bean.getDSC84E()#" cfsqltype="CF_SQL_CHAR" />,
				DAI84E = <cfqueryparam value="#arguments.bean.getDAI84E()#" cfsqltype="CF_SQL_CHAR" />,
				DSA84E = <cfqueryparam value="#arguments.bean.getDSA84E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getDSA84E() eq ""), de("yes"), de("no"))#" />,
				DSC94E = <cfqueryparam value="#arguments.bean.getDSC94E()#" cfsqltype="CF_SQL_CHAR" />,
				DAI94E = <cfqueryparam value="#arguments.bean.getDAI94E()#" cfsqltype="CF_SQL_CHAR" />,
				DSA94E = <cfqueryparam value="#arguments.bean.getDSA94E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getDSA94E() eq ""), de("yes"), de("no"))#" />,
				TLDS4E = <cfqueryparam value="#arguments.bean.getTLDS4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLDS4E() eq ""), de("yes"), de("no"))#" />,
				DSPC4E = <cfqueryparam value="#arguments.bean.getDSPC4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getDSPC4E() eq ""), de("yes"), de("no"))#" />,
				PSPR4E = <cfqueryparam value="#arguments.bean.getPSPR4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getPSPR4E() eq ""), de("yes"), de("no"))#" />,
				SZ014E = <cfqueryparam value="#arguments.bean.getSZ014E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSZ014E() eq ""), de("yes"), de("no"))#" />,
				SZ024E = <cfqueryparam value="#arguments.bean.getSZ024E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSZ024E() eq ""), de("yes"), de("no"))#" />,
				SZ034E = <cfqueryparam value="#arguments.bean.getSZ034E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSZ034E() eq ""), de("yes"), de("no"))#" />,
				SZ044E = <cfqueryparam value="#arguments.bean.getSZ044E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSZ044E() eq ""), de("yes"), de("no"))#" />,
				SZ054E = <cfqueryparam value="#arguments.bean.getSZ054E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSZ054E() eq ""), de("yes"), de("no"))#" />,
				SZ064E = <cfqueryparam value="#arguments.bean.getSZ064E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSZ064E() eq ""), de("yes"), de("no"))#" />,
				SZ074E = <cfqueryparam value="#arguments.bean.getSZ074E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSZ074E() eq ""), de("yes"), de("no"))#" />,
				SZ084E = <cfqueryparam value="#arguments.bean.getSZ084E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSZ084E() eq ""), de("yes"), de("no"))#" />,
				SZ094E = <cfqueryparam value="#arguments.bean.getSZ094E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSZ094E() eq ""), de("yes"), de("no"))#" />,
				SZ104E = <cfqueryparam value="#arguments.bean.getSZ104E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSZ104E() eq ""), de("yes"), de("no"))#" />,
				SZ114E = <cfqueryparam value="#arguments.bean.getSZ114E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSZ114E() eq ""), de("yes"), de("no"))#" />,
				SZ124E = <cfqueryparam value="#arguments.bean.getSZ124E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSZ124E() eq ""), de("yes"), de("no"))#" />,
				DUDT4E = <cfqueryparam value="#arguments.bean.getDUDT4E()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getDUDT4E() eq ""), de("yes"), de("no"))#" />,
				PRNO4E = <cfqueryparam value="#arguments.bean.getPRNO4E()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getPRNO4E() eq ""), de("yes"), de("no"))#" />,
				CMNO4E = <cfqueryparam value="#arguments.bean.getCMNO4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCMNO4E() eq ""), de("yes"), de("no"))#" />,
				CMN24E = <cfqueryparam value="#arguments.bean.getCMN24E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCMN24E() eq ""), de("yes"), de("no"))#" />,
				CMN34E = <cfqueryparam value="#arguments.bean.getCMN34E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCMN34E() eq ""), de("yes"), de("no"))#" />,
				CMDF4E = <cfqueryparam value="#arguments.bean.getCMDF4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCMDF4E() eq ""), de("yes"), de("no"))#" />,
				SZCD4E = <cfqueryparam value="#arguments.bean.getSZCD4E()#" cfsqltype="CF_SQL_CHAR" />,
				SRCD4E = <cfqueryparam value="#arguments.bean.getSRCD4E()#" cfsqltype="CF_SQL_CHAR" />,
				PROV4E = <cfqueryparam value="#arguments.bean.getPROV4E()#" cfsqltype="CF_SQL_CHAR" />,
				MSCD4E = <cfqueryparam value="#arguments.bean.getMSCD4E()#" cfsqltype="CF_SQL_CHAR" />,
				PRUM4E = <cfqueryparam value="#arguments.bean.getPRUM4E()#" cfsqltype="CF_SQL_CHAR" />,
				CVFC4E = <cfqueryparam value="#arguments.bean.getCVFC4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCVFC4E() eq ""), de("yes"), de("no"))#" />,
				MKGP4E = <cfqueryparam value="#arguments.bean.getMKGP4E()#" cfsqltype="CF_SQL_CHAR" />,
				UNWT4E = <cfqueryparam value="#arguments.bean.getUNWT4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getUNWT4E() eq ""), de("yes"), de("no"))#" />,
				UNVL4E = <cfqueryparam value="#arguments.bean.getUNVL4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getUNVL4E() eq ""), de("yes"), de("no"))#" />,
				TPSL4E = <cfqueryparam value="#arguments.bean.getTPSL4E()#" cfsqltype="CF_SQL_CHAR" />,
				TXBL4E = <cfqueryparam value="#arguments.bean.getTXBL4E()#" cfsqltype="CF_SQL_CHAR" />,
				NCHG4E = <cfqueryparam value="#arguments.bean.getNCHG4E()#" cfsqltype="CF_SQL_CHAR" />,
				SPCL4E = <cfqueryparam value="#arguments.bean.getSPCL4E()#" cfsqltype="CF_SQL_CHAR" />,
				STCD4E = <cfqueryparam value="#arguments.bean.getSTCD4E()#" cfsqltype="CF_SQL_CHAR" />,
				OGPR4E = <cfqueryparam value="#arguments.bean.getOGPR4E()#" cfsqltype="CF_SQL_CHAR" />,
				OGCR4E = <cfqueryparam value="#arguments.bean.getOGCR4E()#" cfsqltype="CF_SQL_CHAR" />,
				TGNO4E = <cfqueryparam value="#arguments.bean.getTGNO4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTGNO4E() eq ""), de("yes"), de("no"))#" />,
				TGN24E = <cfqueryparam value="#arguments.bean.getTGN24E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTGN24E() eq ""), de("yes"), de("no"))#" />,
				TGN34E = <cfqueryparam value="#arguments.bean.getTGN34E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTGN34E() eq ""), de("yes"), de("no"))#" />,
				BGDT4E = <cfqueryparam value="#arguments.bean.getBGDT4E()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getBGDT4E() eq ""), de("yes"), de("no"))#" />,
				ENDT4E = <cfqueryparam value="#arguments.bean.getENDT4E()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getENDT4E() eq ""), de("yes"), de("no"))#" />,
				LNST4E = <cfqueryparam value="#arguments.bean.getLNST4E()#" cfsqltype="CF_SQL_CHAR" />,
				INLN4E = <cfqueryparam value="#arguments.bean.getINLN4E()#" cfsqltype="CF_SQL_CHAR" />,
				BKOR4E = <cfqueryparam value="#arguments.bean.getBKOR4E()#" cfsqltype="CF_SQL_CHAR" />,
				CLLN4E = <cfqueryparam value="#arguments.bean.getCLLN4E()#" cfsqltype="CF_SQL_CHAR" />,
				PSBK4E = <cfqueryparam value="#arguments.bean.getPSBK4E()#" cfsqltype="CF_SQL_CHAR" />,
				CRWS4E = <cfqueryparam value="#arguments.bean.getCRWS4E()#" cfsqltype="CF_SQL_CHAR" />,
				CRUS4E = <cfqueryparam value="#arguments.bean.getCRUS4E()#" cfsqltype="CF_SQL_CHAR" />,
				CRDT4E = <cfqueryparam value="#arguments.bean.getCRDT4E()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getCRDT4E() eq ""), de("yes"), de("no"))#" />,
				CRTM4E = <cfqueryparam value="#arguments.bean.getCRTM4E()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getCRTM4E() eq ""), de("yes"), de("no"))#" />,
				MNWS4E = <cfqueryparam value="#arguments.bean.getMNWS4E()#" cfsqltype="CF_SQL_CHAR" />,
				MNUS4E = <cfqueryparam value="#arguments.bean.getMNUS4E()#" cfsqltype="CF_SQL_CHAR" />,
				MNDT4E = <cfqueryparam value="#arguments.bean.getMNDT4E()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getMNDT4E() eq ""), de("yes"), de("no"))#" />,
				MNTM4E = <cfqueryparam value="#arguments.bean.getMNTM4E()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getMNTM4E() eq ""), de("yes"), de("no"))#" />,
				LCUS4E = <cfqueryparam value="#arguments.bean.getLCUS4E()#" cfsqltype="CF_SQL_CHAR" />,
				LCDT4E = <cfqueryparam value="#arguments.bean.getLCDT4E()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getLCDT4E() eq ""), de("yes"), de("no"))#" />,
				LCTM4E = <cfqueryparam value="#arguments.bean.getLCTM4E()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getLCTM4E() eq ""), de("yes"), de("no"))#" />,
				TLTA4E = <cfqueryparam value="#arguments.bean.getTLTA4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLTA4E() eq ""), de("yes"), de("no"))#" />,
				TA014E = <cfqueryparam value="#arguments.bean.getTA014E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTA014E() eq ""), de("yes"), de("no"))#" />,
				TA024E = <cfqueryparam value="#arguments.bean.getTA024E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTA024E() eq ""), de("yes"), de("no"))#" />,
				TA034E = <cfqueryparam value="#arguments.bean.getTA034E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTA034E() eq ""), de("yes"), de("no"))#" />,
				TA044E = <cfqueryparam value="#arguments.bean.getTA044E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTA044E() eq ""), de("yes"), de("no"))#" />,
				TA054E = <cfqueryparam value="#arguments.bean.getTA054E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTA054E() eq ""), de("yes"), de("no"))#" />,
				TA064E = <cfqueryparam value="#arguments.bean.getTA064E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTA064E() eq ""), de("yes"), de("no"))#" />,
				TA074E = <cfqueryparam value="#arguments.bean.getTA074E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTA074E() eq ""), de("yes"), de("no"))#" />,
				TA084E = <cfqueryparam value="#arguments.bean.getTA084E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTA084E() eq ""), de("yes"), de("no"))#" />,
				TA094E = <cfqueryparam value="#arguments.bean.getTA094E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTA094E() eq ""), de("yes"), de("no"))#" />,
				TA104E = <cfqueryparam value="#arguments.bean.getTA104E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTA104E() eq ""), de("yes"), de("no"))#" />,
				TA114E = <cfqueryparam value="#arguments.bean.getTA114E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTA114E() eq ""), de("yes"), de("no"))#" />,
				TA124E = <cfqueryparam value="#arguments.bean.getTA124E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTA124E() eq ""), de("yes"), de("no"))#" />,
				TLQA4E = <cfqueryparam value="#arguments.bean.getTLQA4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLQA4E() eq ""), de("yes"), de("no"))#" />,
				QA014E = <cfqueryparam value="#arguments.bean.getQA014E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getQA014E() eq ""), de("yes"), de("no"))#" />,
				QA024E = <cfqueryparam value="#arguments.bean.getQA024E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getQA024E() eq ""), de("yes"), de("no"))#" />,
				QA034E = <cfqueryparam value="#arguments.bean.getQA034E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getQA034E() eq ""), de("yes"), de("no"))#" />,
				QA044E = <cfqueryparam value="#arguments.bean.getQA044E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getQA044E() eq ""), de("yes"), de("no"))#" />,
				QA054E = <cfqueryparam value="#arguments.bean.getQA054E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getQA054E() eq ""), de("yes"), de("no"))#" />,
				QA064E = <cfqueryparam value="#arguments.bean.getQA064E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getQA064E() eq ""), de("yes"), de("no"))#" />,
				QA074E = <cfqueryparam value="#arguments.bean.getQA074E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getQA074E() eq ""), de("yes"), de("no"))#" />,
				QA084E = <cfqueryparam value="#arguments.bean.getQA084E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getQA084E() eq ""), de("yes"), de("no"))#" />,
				QA094E = <cfqueryparam value="#arguments.bean.getQA094E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getQA094E() eq ""), de("yes"), de("no"))#" />,
				QA104E = <cfqueryparam value="#arguments.bean.getQA104E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getQA104E() eq ""), de("yes"), de("no"))#" />,
				QA114E = <cfqueryparam value="#arguments.bean.getQA114E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getQA114E() eq ""), de("yes"), de("no"))#" />,
				QA124E = <cfqueryparam value="#arguments.bean.getQA124E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getQA124E() eq ""), de("yes"), de("no"))#" />,
				TLQP4E = <cfqueryparam value="#arguments.bean.getTLQP4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLQP4E() eq ""), de("yes"), de("no"))#" />,
				QP014E = <cfqueryparam value="#arguments.bean.getQP014E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getQP014E() eq ""), de("yes"), de("no"))#" />,
				QP024E = <cfqueryparam value="#arguments.bean.getQP024E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getQP024E() eq ""), de("yes"), de("no"))#" />,
				QP034E = <cfqueryparam value="#arguments.bean.getQP034E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getQP034E() eq ""), de("yes"), de("no"))#" />,
				QP044E = <cfqueryparam value="#arguments.bean.getQP044E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getQP044E() eq ""), de("yes"), de("no"))#" />,
				QP054E = <cfqueryparam value="#arguments.bean.getQP054E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getQP054E() eq ""), de("yes"), de("no"))#" />,
				QP064E = <cfqueryparam value="#arguments.bean.getQP064E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getQP064E() eq ""), de("yes"), de("no"))#" />,
				QP074E = <cfqueryparam value="#arguments.bean.getQP074E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getQP074E() eq ""), de("yes"), de("no"))#" />,
				QP084E = <cfqueryparam value="#arguments.bean.getQP084E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getQP084E() eq ""), de("yes"), de("no"))#" />,
				QP094E = <cfqueryparam value="#arguments.bean.getQP094E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getQP094E() eq ""), de("yes"), de("no"))#" />,
				QP104E = <cfqueryparam value="#arguments.bean.getQP104E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getQP104E() eq ""), de("yes"), de("no"))#" />,
				QP114E = <cfqueryparam value="#arguments.bean.getQP114E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getQP114E() eq ""), de("yes"), de("no"))#" />,
				QP124E = <cfqueryparam value="#arguments.bean.getQP124E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getQP124E() eq ""), de("yes"), de("no"))#" />,
				ALBT4E = <cfqueryparam value="#arguments.bean.getALBT4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getALBT4E() eq ""), de("yes"), de("no"))#" />,
				ABCL4E = <cfqueryparam value="#arguments.bean.getABCL4E()#" cfsqltype="CF_SQL_CHAR" />,
				PTNO4E = <cfqueryparam value="#arguments.bean.getPTNO4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getPTNO4E() eq ""), de("yes"), de("no"))#" />,
				PTLN4E = <cfqueryparam value="#arguments.bean.getPTLN4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getPTLN4E() eq ""), de("yes"), de("no"))#" />,
				PTSQ4E = <cfqueryparam value="#arguments.bean.getPTSQ4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getPTSQ4E() eq ""), de("yes"), de("no"))#" />,
				PTDT4E = <cfqueryparam value="#arguments.bean.getPTDT4E()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getPTDT4E() eq ""), de("yes"), de("no"))#" />,
				PTTM4E = <cfqueryparam value="#arguments.bean.getPTTM4E()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getPTTM4E() eq ""), de("yes"), de("no"))#" />,
				VRUS4E = <cfqueryparam value="#arguments.bean.getVRUS4E()#" cfsqltype="CF_SQL_CHAR" />,
				VRDT4E = <cfqueryparam value="#arguments.bean.getVRDT4E()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getVRDT4E() eq ""), de("yes"), de("no"))#" />,
				VRTM4E = <cfqueryparam value="#arguments.bean.getVRTM4E()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getVRTM4E() eq ""), de("yes"), de("no"))#" />,
				APUS4E = <cfqueryparam value="#arguments.bean.getAPUS4E()#" cfsqltype="CF_SQL_CHAR" />,
				PRHG4E = <cfqueryparam value="#arguments.bean.getPRHG4E()#" cfsqltype="CF_SQL_CHAR" />,
				CSNO4E = <cfqueryparam value="#arguments.bean.getCSNO4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCSNO4E() eq ""), de("yes"), de("no"))#" />,
				CSSN4E = <cfqueryparam value="#arguments.bean.getCSSN4E()#" cfsqltype="CF_SQL_CHAR" />,
				SHNO4E = <cfqueryparam value="#arguments.bean.getSHNO4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSHNO4E() eq ""), de("yes"), de("no"))#" />,
				CSPO4E = <cfqueryparam value="#arguments.bean.getCSPO4E()#" cfsqltype="CF_SQL_CHAR" />,
				DVNO4E = <cfqueryparam value="#arguments.bean.getDVNO4E()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getDVNO4E() eq ""), de("yes"), de("no"))#" />,
				SNNO4E = <cfqueryparam value="#arguments.bean.getSNNO4E()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getSNNO4E() eq ""), de("yes"), de("no"))#" />,
				SBSN4E = <cfqueryparam value="#arguments.bean.getSBSN4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSBSN4E() eq ""), de("yes"), de("no"))#" />,
				SASN4E = <cfqueryparam value="#arguments.bean.getSASN4E()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getSASN4E() eq ""), de("yes"), de("no"))#" />,
				SAPR4E = <cfqueryparam value="#arguments.bean.getSAPR4E()#" cfsqltype="CF_SQL_CHAR" />,
				SMN14E = <cfqueryparam value="#arguments.bean.getSMN14E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSMN14E() eq ""), de("yes"), de("no"))#" />,
				BKDS4E = <cfqueryparam value="#arguments.bean.getBKDS4E()#" cfsqltype="CF_SQL_CHAR" />,
				EDII4E = <cfqueryparam value="#arguments.bean.getEDII4E()#" cfsqltype="CF_SQL_CHAR" />,
				EDSP4E = <cfqueryparam value="#arguments.bean.getEDSP4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getEDSP4E() eq ""), de("yes"), de("no"))#" />,
				EDRP4E = <cfqueryparam value="#arguments.bean.getEDRP4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getEDRP4E() eq ""), de("yes"), de("no"))#" />,
				PRUP4E = <cfqueryparam value="#arguments.bean.getPRUP4E()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getPRUP4E() eq ""), de("yes"), de("no"))#" />,
				EDR14E = <cfqueryparam value="#arguments.bean.getEDR14E()#" cfsqltype="CF_SQL_CHAR" />,
				EDR24E = <cfqueryparam value="#arguments.bean.getEDR24E()#" cfsqltype="CF_SQL_CHAR" />,
				EDR34E = <cfqueryparam value="#arguments.bean.getEDR34E()#" cfsqltype="CF_SQL_CHAR" />,
				EDR44E = <cfqueryparam value="#arguments.bean.getEDR44E()#" cfsqltype="CF_SQL_CHAR" />,
				EDCS4E = <cfqueryparam value="#arguments.bean.getEDCS4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getEDCS4E() eq ""), de("yes"), de("no"))#" />,
				JBNO4E = <cfqueryparam value="#arguments.bean.getJBNO4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getJBNO4E() eq ""), de("yes"), de("no"))#" />,
				JBRF4E = <cfqueryparam value="#arguments.bean.getJBRF4E()#" cfsqltype="CF_SQL_CHAR" />,
				OGJR4E = <cfqueryparam value="#arguments.bean.getOGJR4E()#" cfsqltype="CF_SQL_CHAR" />,
				JBDT4E = <cfqueryparam value="#arguments.bean.getJBDT4E()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getJBDT4E() eq ""), de("yes"), de("no"))#" />,
				JBAS4E = <cfqueryparam value="#arguments.bean.getJBAS4E()#" cfsqltype="CF_SQL_CHAR" />,
				JBBT4E = <cfqueryparam value="#arguments.bean.getJBBT4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getJBBT4E() eq ""), de("yes"), de("no"))#" />,
				JBLR4E = <cfqueryparam value="#arguments.bean.getJBLR4E()#" cfsqltype="CF_SQL_CHAR" />,
				TLPA4E = <cfqueryparam value="#arguments.bean.getTLPA4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLPA4E() eq ""), de("yes"), de("no"))#" />,
				PA014E = <cfqueryparam value="#arguments.bean.getPA014E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getPA014E() eq ""), de("yes"), de("no"))#" />,
				PA024E = <cfqueryparam value="#arguments.bean.getPA024E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getPA024E() eq ""), de("yes"), de("no"))#" />,
				PA034E = <cfqueryparam value="#arguments.bean.getPA034E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getPA034E() eq ""), de("yes"), de("no"))#" />,
				PA044E = <cfqueryparam value="#arguments.bean.getPA044E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getPA044E() eq ""), de("yes"), de("no"))#" />,
				PA054E = <cfqueryparam value="#arguments.bean.getPA054E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getPA054E() eq ""), de("yes"), de("no"))#" />,
				PA064E = <cfqueryparam value="#arguments.bean.getPA064E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getPA064E() eq ""), de("yes"), de("no"))#" />,
				PA074E = <cfqueryparam value="#arguments.bean.getPA074E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getPA074E() eq ""), de("yes"), de("no"))#" />,
				PA084E = <cfqueryparam value="#arguments.bean.getPA084E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getPA084E() eq ""), de("yes"), de("no"))#" />,
				PA094E = <cfqueryparam value="#arguments.bean.getPA094E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getPA094E() eq ""), de("yes"), de("no"))#" />,
				PA104E = <cfqueryparam value="#arguments.bean.getPA104E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getPA104E() eq ""), de("yes"), de("no"))#" />,
				PA114E = <cfqueryparam value="#arguments.bean.getPA114E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getPA114E() eq ""), de("yes"), de("no"))#" />,
				PA124E = <cfqueryparam value="#arguments.bean.getPA124E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getPA124E() eq ""), de("yes"), de("no"))#" />,
				TLCO4E = <cfqueryparam value="#arguments.bean.getTLCO4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLCO4E() eq ""), de("yes"), de("no"))#" />,
				CO014E = <cfqueryparam value="#arguments.bean.getCO014E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCO014E() eq ""), de("yes"), de("no"))#" />,
				CO024E = <cfqueryparam value="#arguments.bean.getCO024E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCO024E() eq ""), de("yes"), de("no"))#" />,
				CO034E = <cfqueryparam value="#arguments.bean.getCO034E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCO034E() eq ""), de("yes"), de("no"))#" />,
				CO044E = <cfqueryparam value="#arguments.bean.getCO044E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCO044E() eq ""), de("yes"), de("no"))#" />,
				CO054E = <cfqueryparam value="#arguments.bean.getCO054E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCO054E() eq ""), de("yes"), de("no"))#" />,
				CO064E = <cfqueryparam value="#arguments.bean.getCO064E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCO064E() eq ""), de("yes"), de("no"))#" />,
				CO074E = <cfqueryparam value="#arguments.bean.getCO074E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCO074E() eq ""), de("yes"), de("no"))#" />,
				CO084E = <cfqueryparam value="#arguments.bean.getCO084E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCO084E() eq ""), de("yes"), de("no"))#" />,
				CO094E = <cfqueryparam value="#arguments.bean.getCO094E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCO094E() eq ""), de("yes"), de("no"))#" />,
				CO104E = <cfqueryparam value="#arguments.bean.getCO104E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCO104E() eq ""), de("yes"), de("no"))#" />,
				CO114E = <cfqueryparam value="#arguments.bean.getCO114E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCO114E() eq ""), de("yes"), de("no"))#" />,
				CO124E = <cfqueryparam value="#arguments.bean.getCO124E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCO124E() eq ""), de("yes"), de("no"))#" />,
				TLCT4E = <cfqueryparam value="#arguments.bean.getTLCT4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLCT4E() eq ""), de("yes"), de("no"))#" />,
				CT014E = <cfqueryparam value="#arguments.bean.getCT014E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCT014E() eq ""), de("yes"), de("no"))#" />,
				CT024E = <cfqueryparam value="#arguments.bean.getCT024E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCT024E() eq ""), de("yes"), de("no"))#" />,
				CT034E = <cfqueryparam value="#arguments.bean.getCT034E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCT034E() eq ""), de("yes"), de("no"))#" />,
				CT044E = <cfqueryparam value="#arguments.bean.getCT044E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCT044E() eq ""), de("yes"), de("no"))#" />,
				CT054E = <cfqueryparam value="#arguments.bean.getCT054E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCT054E() eq ""), de("yes"), de("no"))#" />,
				CT064E = <cfqueryparam value="#arguments.bean.getCT064E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCT064E() eq ""), de("yes"), de("no"))#" />,
				CT074E = <cfqueryparam value="#arguments.bean.getCT074E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCT074E() eq ""), de("yes"), de("no"))#" />,
				CT084E = <cfqueryparam value="#arguments.bean.getCT084E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCT084E() eq ""), de("yes"), de("no"))#" />,
				CT094E = <cfqueryparam value="#arguments.bean.getCT094E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCT094E() eq ""), de("yes"), de("no"))#" />,
				CT104E = <cfqueryparam value="#arguments.bean.getCT104E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCT104E() eq ""), de("yes"), de("no"))#" />,
				CT114E = <cfqueryparam value="#arguments.bean.getCT114E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCT114E() eq ""), de("yes"), de("no"))#" />,
				CT124E = <cfqueryparam value="#arguments.bean.getCT124E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCT124E() eq ""), de("yes"), de("no"))#" />,
				TLCP4E = <cfqueryparam value="#arguments.bean.getTLCP4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLCP4E() eq ""), de("yes"), de("no"))#" />,
				CP014E = <cfqueryparam value="#arguments.bean.getCP014E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCP014E() eq ""), de("yes"), de("no"))#" />,
				CP024E = <cfqueryparam value="#arguments.bean.getCP024E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCP024E() eq ""), de("yes"), de("no"))#" />,
				CP034E = <cfqueryparam value="#arguments.bean.getCP034E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCP034E() eq ""), de("yes"), de("no"))#" />,
				CP044E = <cfqueryparam value="#arguments.bean.getCP044E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCP044E() eq ""), de("yes"), de("no"))#" />,
				CP054E = <cfqueryparam value="#arguments.bean.getCP054E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCP054E() eq ""), de("yes"), de("no"))#" />,
				CP064E = <cfqueryparam value="#arguments.bean.getCP064E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCP064E() eq ""), de("yes"), de("no"))#" />,
				CP074E = <cfqueryparam value="#arguments.bean.getCP074E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCP074E() eq ""), de("yes"), de("no"))#" />,
				CP084E = <cfqueryparam value="#arguments.bean.getCP084E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCP084E() eq ""), de("yes"), de("no"))#" />,
				CP094E = <cfqueryparam value="#arguments.bean.getCP094E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCP094E() eq ""), de("yes"), de("no"))#" />,
				CP104E = <cfqueryparam value="#arguments.bean.getCP104E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCP104E() eq ""), de("yes"), de("no"))#" />,
				CP114E = <cfqueryparam value="#arguments.bean.getCP114E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCP114E() eq ""), de("yes"), de("no"))#" />,
				CP124E = <cfqueryparam value="#arguments.bean.getCP124E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCP124E() eq ""), de("yes"), de("no"))#" />,
				TLCD4E = <cfqueryparam value="#arguments.bean.getTLCD4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLCD4E() eq ""), de("yes"), de("no"))#" />,
				CD014E = <cfqueryparam value="#arguments.bean.getCD014E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCD014E() eq ""), de("yes"), de("no"))#" />,
				CD024E = <cfqueryparam value="#arguments.bean.getCD024E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCD024E() eq ""), de("yes"), de("no"))#" />,
				CD034E = <cfqueryparam value="#arguments.bean.getCD034E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCD034E() eq ""), de("yes"), de("no"))#" />,
				CD044E = <cfqueryparam value="#arguments.bean.getCD044E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCD044E() eq ""), de("yes"), de("no"))#" />,
				CD054E = <cfqueryparam value="#arguments.bean.getCD054E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCD054E() eq ""), de("yes"), de("no"))#" />,
				CD064E = <cfqueryparam value="#arguments.bean.getCD064E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCD064E() eq ""), de("yes"), de("no"))#" />,
				CD074E = <cfqueryparam value="#arguments.bean.getCD074E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCD074E() eq ""), de("yes"), de("no"))#" />,
				CD084E = <cfqueryparam value="#arguments.bean.getCD084E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCD084E() eq ""), de("yes"), de("no"))#" />,
				CD094E = <cfqueryparam value="#arguments.bean.getCD094E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCD094E() eq ""), de("yes"), de("no"))#" />,
				CD104E = <cfqueryparam value="#arguments.bean.getCD104E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCD104E() eq ""), de("yes"), de("no"))#" />,
				CD114E = <cfqueryparam value="#arguments.bean.getCD114E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCD114E() eq ""), de("yes"), de("no"))#" />,
				CD124E = <cfqueryparam value="#arguments.bean.getCD124E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCD124E() eq ""), de("yes"), de("no"))#" />,
				RMOR4E = <cfqueryparam value="#arguments.bean.getRMOR4E()#" cfsqltype="CF_SQL_CHAR" />,
				TPDT4E = <cfqueryparam value="#arguments.bean.getTPDT4E()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getTPDT4E() eq ""), de("yes"), de("no"))#" />,
				TPTM4E = <cfqueryparam value="#arguments.bean.getTPTM4E()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getTPTM4E() eq ""), de("yes"), de("no"))#" />,
				FRSP4E = <cfqueryparam value="#arguments.bean.getFRSP4E()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getFRSP4E() eq ""), de("yes"), de("no"))#" />,
				WHNO4E = <cfqueryparam value="#arguments.bean.getWHNO4E()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getWHNO4E() eq ""), de("yes"), de("no"))#" />
			where CONO4E = <cfqueryparam value="#arguments.bean.getCONO4E()#" cfsqltype="CF_SQL_NUMERIC">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.as400.ORDDTL0">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="AS400" result="status">
			delete
			from VPSFILES.ORDDTL0
			where CONO4E = <cfqueryparam cfsqltype="CF_SQL_NUMERIC" value="#arguments.bean.getCONO4E()#" />
		</cfquery>

	</cffunction>


</cfcomponent>