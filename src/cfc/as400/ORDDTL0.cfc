<cfcomponent output="false" alias="mochi.cfc.as400.ORDDTL0">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="CONO4E" type="numeric" default="0">
	<cfproperty name="ORNO4E" type="numeric" default="0">
	<cfproperty name="LNNO4E" type="numeric" default="0">
	<cfproperty name="PRCD4E" type="string" default="">
	<cfproperty name="CRCD4E" type="string" default="">
	<cfproperty name="UNIT4E" type="numeric" default="0">
	<cfproperty name="LSPR4E" type="numeric" default="0">
	<cfproperty name="SLPR4E" type="numeric" default="0">
	<cfproperty name="INPR4E" type="numeric" default="0">
	<cfproperty name="SCAM4E" type="numeric" default="0">
	<cfproperty name="NTPR4E" type="numeric" default="0">
	<cfproperty name="EXAM4E" type="numeric" default="0">
	<cfproperty name="LDCT4E" type="string" default="">
	<cfproperty name="LDAM4E" type="numeric" default="0">
	<cfproperty name="TDNO4E" type="numeric" default="0">
	<cfproperty name="TDOV4E" type="numeric" default="0">
	<cfproperty name="DSC14E" type="string" default="">
	<cfproperty name="DAI14E" type="string" default="">
	<cfproperty name="DSA14E" type="numeric" default="0">
	<cfproperty name="DSC24E" type="string" default="">
	<cfproperty name="DAI24E" type="string" default="">
	<cfproperty name="DSA24E" type="numeric" default="0">
	<cfproperty name="DSC34E" type="string" default="">
	<cfproperty name="DAI34E" type="string" default="">
	<cfproperty name="DSA34E" type="numeric" default="0">
	<cfproperty name="DSC44E" type="string" default="">
	<cfproperty name="DAI44E" type="string" default="">
	<cfproperty name="DSA44E" type="numeric" default="0">
	<cfproperty name="DSC54E" type="string" default="">
	<cfproperty name="DAI54E" type="string" default="">
	<cfproperty name="DSA54E" type="numeric" default="0">
	<cfproperty name="DSC64E" type="string" default="">
	<cfproperty name="DAI64E" type="string" default="">
	<cfproperty name="DSA64E" type="numeric" default="0">
	<cfproperty name="DSC74E" type="string" default="">
	<cfproperty name="DAI74E" type="string" default="">
	<cfproperty name="DSA74E" type="numeric" default="0">
	<cfproperty name="DSC84E" type="string" default="">
	<cfproperty name="DAI84E" type="string" default="">
	<cfproperty name="DSA84E" type="numeric" default="0">
	<cfproperty name="DSC94E" type="string" default="">
	<cfproperty name="DAI94E" type="string" default="">
	<cfproperty name="DSA94E" type="numeric" default="0">
	<cfproperty name="TLDS4E" type="numeric" default="0">
	<cfproperty name="DSPC4E" type="numeric" default="0">
	<cfproperty name="PSPR4E" type="numeric" default="0">
	<cfproperty name="SZ014E" type="numeric" default="0">
	<cfproperty name="SZ024E" type="numeric" default="0">
	<cfproperty name="SZ034E" type="numeric" default="0">
	<cfproperty name="SZ044E" type="numeric" default="0">
	<cfproperty name="SZ054E" type="numeric" default="0">
	<cfproperty name="SZ064E" type="numeric" default="0">
	<cfproperty name="SZ074E" type="numeric" default="0">
	<cfproperty name="SZ084E" type="numeric" default="0">
	<cfproperty name="SZ094E" type="numeric" default="0">
	<cfproperty name="SZ104E" type="numeric" default="0">
	<cfproperty name="SZ114E" type="numeric" default="0">
	<cfproperty name="SZ124E" type="numeric" default="0">
	<cfproperty name="DUDT4E" type="numeric" default="0">
	<cfproperty name="PRNO4E" type="numeric" default="0">
	<cfproperty name="CMNO4E" type="numeric" default="0">
	<cfproperty name="CMN24E" type="numeric" default="0">
	<cfproperty name="CMN34E" type="numeric" default="0">
	<cfproperty name="CMDF4E" type="numeric" default="0">
	<cfproperty name="SZCD4E" type="string" default="">
	<cfproperty name="SRCD4E" type="string" default="">
	<cfproperty name="PROV4E" type="string" default="">
	<cfproperty name="MSCD4E" type="string" default="">
	<cfproperty name="PRUM4E" type="string" default="">
	<cfproperty name="CVFC4E" type="numeric" default="0">
	<cfproperty name="MKGP4E" type="string" default="">
	<cfproperty name="UNWT4E" type="numeric" default="0">
	<cfproperty name="UNVL4E" type="numeric" default="0">
	<cfproperty name="TPSL4E" type="string" default="">
	<cfproperty name="TXBL4E" type="string" default="">
	<cfproperty name="NCHG4E" type="string" default="">
	<cfproperty name="SPCL4E" type="string" default="">
	<cfproperty name="STCD4E" type="string" default="">
	<cfproperty name="OGPR4E" type="string" default="">
	<cfproperty name="OGCR4E" type="string" default="">
	<cfproperty name="TGNO4E" type="numeric" default="0">
	<cfproperty name="TGN24E" type="numeric" default="0">
	<cfproperty name="TGN34E" type="numeric" default="0">
	<cfproperty name="BGDT4E" type="numeric" default="0">
	<cfproperty name="ENDT4E" type="numeric" default="0">
	<cfproperty name="LNST4E" type="string" default="">
	<cfproperty name="INLN4E" type="string" default="">
	<cfproperty name="BKOR4E" type="string" default="">
	<cfproperty name="CLLN4E" type="string" default="">
	<cfproperty name="PSBK4E" type="string" default="">
	<cfproperty name="CRWS4E" type="string" default="">
	<cfproperty name="CRUS4E" type="string" default="">
	<cfproperty name="CRDT4E" type="numeric" default="0">
	<cfproperty name="CRTM4E" type="numeric" default="0">
	<cfproperty name="MNWS4E" type="string" default="">
	<cfproperty name="MNUS4E" type="string" default="">
	<cfproperty name="MNDT4E" type="numeric" default="0">
	<cfproperty name="MNTM4E" type="numeric" default="0">
	<cfproperty name="LCUS4E" type="string" default="">
	<cfproperty name="LCDT4E" type="numeric" default="0">
	<cfproperty name="LCTM4E" type="numeric" default="0">
	<cfproperty name="TLTA4E" type="numeric" default="0">
	<cfproperty name="TA014E" type="numeric" default="0">
	<cfproperty name="TA024E" type="numeric" default="0">
	<cfproperty name="TA034E" type="numeric" default="0">
	<cfproperty name="TA044E" type="numeric" default="0">
	<cfproperty name="TA054E" type="numeric" default="0">
	<cfproperty name="TA064E" type="numeric" default="0">
	<cfproperty name="TA074E" type="numeric" default="0">
	<cfproperty name="TA084E" type="numeric" default="0">
	<cfproperty name="TA094E" type="numeric" default="0">
	<cfproperty name="TA104E" type="numeric" default="0">
	<cfproperty name="TA114E" type="numeric" default="0">
	<cfproperty name="TA124E" type="numeric" default="0">
	<cfproperty name="TLQA4E" type="numeric" default="0">
	<cfproperty name="QA014E" type="numeric" default="0">
	<cfproperty name="QA024E" type="numeric" default="0">
	<cfproperty name="QA034E" type="numeric" default="0">
	<cfproperty name="QA044E" type="numeric" default="0">
	<cfproperty name="QA054E" type="numeric" default="0">
	<cfproperty name="QA064E" type="numeric" default="0">
	<cfproperty name="QA074E" type="numeric" default="0">
	<cfproperty name="QA084E" type="numeric" default="0">
	<cfproperty name="QA094E" type="numeric" default="0">
	<cfproperty name="QA104E" type="numeric" default="0">
	<cfproperty name="QA114E" type="numeric" default="0">
	<cfproperty name="QA124E" type="numeric" default="0">
	<cfproperty name="TLQP4E" type="numeric" default="0">
	<cfproperty name="QP014E" type="numeric" default="0">
	<cfproperty name="QP024E" type="numeric" default="0">
	<cfproperty name="QP034E" type="numeric" default="0">
	<cfproperty name="QP044E" type="numeric" default="0">
	<cfproperty name="QP054E" type="numeric" default="0">
	<cfproperty name="QP064E" type="numeric" default="0">
	<cfproperty name="QP074E" type="numeric" default="0">
	<cfproperty name="QP084E" type="numeric" default="0">
	<cfproperty name="QP094E" type="numeric" default="0">
	<cfproperty name="QP104E" type="numeric" default="0">
	<cfproperty name="QP114E" type="numeric" default="0">
	<cfproperty name="QP124E" type="numeric" default="0">
	<cfproperty name="ALBT4E" type="numeric" default="0">
	<cfproperty name="ABCL4E" type="string" default="">
	<cfproperty name="PTNO4E" type="numeric" default="0">
	<cfproperty name="PTLN4E" type="numeric" default="0">
	<cfproperty name="PTSQ4E" type="numeric" default="0">
	<cfproperty name="PTDT4E" type="numeric" default="0">
	<cfproperty name="PTTM4E" type="numeric" default="0">
	<cfproperty name="VRUS4E" type="string" default="">
	<cfproperty name="VRDT4E" type="numeric" default="0">
	<cfproperty name="VRTM4E" type="numeric" default="0">
	<cfproperty name="APUS4E" type="string" default="">
	<cfproperty name="PRHG4E" type="string" default="">
	<cfproperty name="CSNO4E" type="numeric" default="0">
	<cfproperty name="CSSN4E" type="string" default="">
	<cfproperty name="SHNO4E" type="numeric" default="0">
	<cfproperty name="CSPO4E" type="string" default="">
	<cfproperty name="DVNO4E" type="numeric" default="0">
	<cfproperty name="SNNO4E" type="numeric" default="0">
	<cfproperty name="SBSN4E" type="numeric" default="0">
	<cfproperty name="SASN4E" type="numeric" default="0">
	<cfproperty name="SAPR4E" type="string" default="">
	<cfproperty name="SMN14E" type="numeric" default="0">
	<cfproperty name="BKDS4E" type="string" default="">
	<cfproperty name="EDII4E" type="string" default="">
	<cfproperty name="EDSP4E" type="numeric" default="0">
	<cfproperty name="EDRP4E" type="numeric" default="0">
	<cfproperty name="PRUP4E" type="numeric" default="0">
	<cfproperty name="EDR14E" type="string" default="">
	<cfproperty name="EDR24E" type="string" default="">
	<cfproperty name="EDR34E" type="string" default="">
	<cfproperty name="EDR44E" type="string" default="">
	<cfproperty name="EDCS4E" type="numeric" default="0">
	<cfproperty name="JBNO4E" type="numeric" default="0">
	<cfproperty name="JBRF4E" type="string" default="">
	<cfproperty name="OGJR4E" type="string" default="">
	<cfproperty name="JBDT4E" type="numeric" default="0">
	<cfproperty name="JBAS4E" type="string" default="">
	<cfproperty name="JBBT4E" type="numeric" default="0">
	<cfproperty name="JBLR4E" type="string" default="">
	<cfproperty name="TLPA4E" type="numeric" default="0">
	<cfproperty name="PA014E" type="numeric" default="0">
	<cfproperty name="PA024E" type="numeric" default="0">
	<cfproperty name="PA034E" type="numeric" default="0">
	<cfproperty name="PA044E" type="numeric" default="0">
	<cfproperty name="PA054E" type="numeric" default="0">
	<cfproperty name="PA064E" type="numeric" default="0">
	<cfproperty name="PA074E" type="numeric" default="0">
	<cfproperty name="PA084E" type="numeric" default="0">
	<cfproperty name="PA094E" type="numeric" default="0">
	<cfproperty name="PA104E" type="numeric" default="0">
	<cfproperty name="PA114E" type="numeric" default="0">
	<cfproperty name="PA124E" type="numeric" default="0">
	<cfproperty name="TLCO4E" type="numeric" default="0">
	<cfproperty name="CO014E" type="numeric" default="0">
	<cfproperty name="CO024E" type="numeric" default="0">
	<cfproperty name="CO034E" type="numeric" default="0">
	<cfproperty name="CO044E" type="numeric" default="0">
	<cfproperty name="CO054E" type="numeric" default="0">
	<cfproperty name="CO064E" type="numeric" default="0">
	<cfproperty name="CO074E" type="numeric" default="0">
	<cfproperty name="CO084E" type="numeric" default="0">
	<cfproperty name="CO094E" type="numeric" default="0">
	<cfproperty name="CO104E" type="numeric" default="0">
	<cfproperty name="CO114E" type="numeric" default="0">
	<cfproperty name="CO124E" type="numeric" default="0">
	<cfproperty name="TLCT4E" type="numeric" default="0">
	<cfproperty name="CT014E" type="numeric" default="0">
	<cfproperty name="CT024E" type="numeric" default="0">
	<cfproperty name="CT034E" type="numeric" default="0">
	<cfproperty name="CT044E" type="numeric" default="0">
	<cfproperty name="CT054E" type="numeric" default="0">
	<cfproperty name="CT064E" type="numeric" default="0">
	<cfproperty name="CT074E" type="numeric" default="0">
	<cfproperty name="CT084E" type="numeric" default="0">
	<cfproperty name="CT094E" type="numeric" default="0">
	<cfproperty name="CT104E" type="numeric" default="0">
	<cfproperty name="CT114E" type="numeric" default="0">
	<cfproperty name="CT124E" type="numeric" default="0">
	<cfproperty name="TLCP4E" type="numeric" default="0">
	<cfproperty name="CP014E" type="numeric" default="0">
	<cfproperty name="CP024E" type="numeric" default="0">
	<cfproperty name="CP034E" type="numeric" default="0">
	<cfproperty name="CP044E" type="numeric" default="0">
	<cfproperty name="CP054E" type="numeric" default="0">
	<cfproperty name="CP064E" type="numeric" default="0">
	<cfproperty name="CP074E" type="numeric" default="0">
	<cfproperty name="CP084E" type="numeric" default="0">
	<cfproperty name="CP094E" type="numeric" default="0">
	<cfproperty name="CP104E" type="numeric" default="0">
	<cfproperty name="CP114E" type="numeric" default="0">
	<cfproperty name="CP124E" type="numeric" default="0">
	<cfproperty name="TLCD4E" type="numeric" default="0">
	<cfproperty name="CD014E" type="numeric" default="0">
	<cfproperty name="CD024E" type="numeric" default="0">
	<cfproperty name="CD034E" type="numeric" default="0">
	<cfproperty name="CD044E" type="numeric" default="0">
	<cfproperty name="CD054E" type="numeric" default="0">
	<cfproperty name="CD064E" type="numeric" default="0">
	<cfproperty name="CD074E" type="numeric" default="0">
	<cfproperty name="CD084E" type="numeric" default="0">
	<cfproperty name="CD094E" type="numeric" default="0">
	<cfproperty name="CD104E" type="numeric" default="0">
	<cfproperty name="CD114E" type="numeric" default="0">
	<cfproperty name="CD124E" type="numeric" default="0">
	<cfproperty name="RMOR4E" type="string" default="">
	<cfproperty name="TPDT4E" type="numeric" default="0">
	<cfproperty name="TPTM4E" type="numeric" default="0">
	<cfproperty name="FRSP4E" type="numeric" default="0">
	<cfproperty name="WHNO4E" type="numeric" default="0">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.CONO4E = 0;
		variables.ORNO4E = 0;
		variables.LNNO4E = 0;
		variables.PRCD4E = "";
		variables.CRCD4E = "";
		variables.UNIT4E = 0;
		variables.LSPR4E = 0;
		variables.SLPR4E = 0;
		variables.INPR4E = 0;
		variables.SCAM4E = 0;
		variables.NTPR4E = 0;
		variables.EXAM4E = 0;
		variables.LDCT4E = "";
		variables.LDAM4E = 0;
		variables.TDNO4E = 0;
		variables.TDOV4E = 0;
		variables.DSC14E = "";
		variables.DAI14E = "";
		variables.DSA14E = 0;
		variables.DSC24E = "";
		variables.DAI24E = "";
		variables.DSA24E = 0;
		variables.DSC34E = "";
		variables.DAI34E = "";
		variables.DSA34E = 0;
		variables.DSC44E = "";
		variables.DAI44E = "";
		variables.DSA44E = 0;
		variables.DSC54E = "";
		variables.DAI54E = "";
		variables.DSA54E = 0;
		variables.DSC64E = "";
		variables.DAI64E = "";
		variables.DSA64E = 0;
		variables.DSC74E = "";
		variables.DAI74E = "";
		variables.DSA74E = 0;
		variables.DSC84E = "";
		variables.DAI84E = "";
		variables.DSA84E = 0;
		variables.DSC94E = "";
		variables.DAI94E = "";
		variables.DSA94E = 0;
		variables.TLDS4E = 0;
		variables.DSPC4E = 0;
		variables.PSPR4E = 0;
		variables.SZ014E = 0;
		variables.SZ024E = 0;
		variables.SZ034E = 0;
		variables.SZ044E = 0;
		variables.SZ054E = 0;
		variables.SZ064E = 0;
		variables.SZ074E = 0;
		variables.SZ084E = 0;
		variables.SZ094E = 0;
		variables.SZ104E = 0;
		variables.SZ114E = 0;
		variables.SZ124E = 0;
		variables.DUDT4E = 0;
		variables.PRNO4E = 0;
		variables.CMNO4E = 0;
		variables.CMN24E = 0;
		variables.CMN34E = 0;
		variables.CMDF4E = 0;
		variables.SZCD4E = "";
		variables.SRCD4E = "";
		variables.PROV4E = "";
		variables.MSCD4E = "";
		variables.PRUM4E = "";
		variables.CVFC4E = 0;
		variables.MKGP4E = "";
		variables.UNWT4E = 0;
		variables.UNVL4E = 0;
		variables.TPSL4E = "";
		variables.TXBL4E = "";
		variables.NCHG4E = "";
		variables.SPCL4E = "";
		variables.STCD4E = "";
		variables.OGPR4E = "";
		variables.OGCR4E = "";
		variables.TGNO4E = 0;
		variables.TGN24E = 0;
		variables.TGN34E = 0;
		variables.BGDT4E = 0;
		variables.ENDT4E = 0;
		variables.LNST4E = "";
		variables.INLN4E = "";
		variables.BKOR4E = "";
		variables.CLLN4E = "";
		variables.PSBK4E = "";
		variables.CRWS4E = "";
		variables.CRUS4E = "";
		variables.CRDT4E = 0;
		variables.CRTM4E = 0;
		variables.MNWS4E = "";
		variables.MNUS4E = "";
		variables.MNDT4E = 0;
		variables.MNTM4E = 0;
		variables.LCUS4E = "";
		variables.LCDT4E = 0;
		variables.LCTM4E = 0;
		variables.TLTA4E = 0;
		variables.TA014E = 0;
		variables.TA024E = 0;
		variables.TA034E = 0;
		variables.TA044E = 0;
		variables.TA054E = 0;
		variables.TA064E = 0;
		variables.TA074E = 0;
		variables.TA084E = 0;
		variables.TA094E = 0;
		variables.TA104E = 0;
		variables.TA114E = 0;
		variables.TA124E = 0;
		variables.TLQA4E = 0;
		variables.QA014E = 0;
		variables.QA024E = 0;
		variables.QA034E = 0;
		variables.QA044E = 0;
		variables.QA054E = 0;
		variables.QA064E = 0;
		variables.QA074E = 0;
		variables.QA084E = 0;
		variables.QA094E = 0;
		variables.QA104E = 0;
		variables.QA114E = 0;
		variables.QA124E = 0;
		variables.TLQP4E = 0;
		variables.QP014E = 0;
		variables.QP024E = 0;
		variables.QP034E = 0;
		variables.QP044E = 0;
		variables.QP054E = 0;
		variables.QP064E = 0;
		variables.QP074E = 0;
		variables.QP084E = 0;
		variables.QP094E = 0;
		variables.QP104E = 0;
		variables.QP114E = 0;
		variables.QP124E = 0;
		variables.ALBT4E = 0;
		variables.ABCL4E = "";
		variables.PTNO4E = 0;
		variables.PTLN4E = 0;
		variables.PTSQ4E = 0;
		variables.PTDT4E = 0;
		variables.PTTM4E = 0;
		variables.VRUS4E = "";
		variables.VRDT4E = 0;
		variables.VRTM4E = 0;
		variables.APUS4E = "";
		variables.PRHG4E = "";
		variables.CSNO4E = 0;
		variables.CSSN4E = "";
		variables.SHNO4E = 0;
		variables.CSPO4E = "";
		variables.DVNO4E = 0;
		variables.SNNO4E = 0;
		variables.SBSN4E = 0;
		variables.SASN4E = 0;
		variables.SAPR4E = "";
		variables.SMN14E = 0;
		variables.BKDS4E = "";
		variables.EDII4E = "";
		variables.EDSP4E = 0;
		variables.EDRP4E = 0;
		variables.PRUP4E = 0;
		variables.EDR14E = "";
		variables.EDR24E = "";
		variables.EDR34E = "";
		variables.EDR44E = "";
		variables.EDCS4E = 0;
		variables.JBNO4E = 0;
		variables.JBRF4E = "";
		variables.OGJR4E = "";
		variables.JBDT4E = 0;
		variables.JBAS4E = "";
		variables.JBBT4E = 0;
		variables.JBLR4E = "";
		variables.TLPA4E = 0;
		variables.PA014E = 0;
		variables.PA024E = 0;
		variables.PA034E = 0;
		variables.PA044E = 0;
		variables.PA054E = 0;
		variables.PA064E = 0;
		variables.PA074E = 0;
		variables.PA084E = 0;
		variables.PA094E = 0;
		variables.PA104E = 0;
		variables.PA114E = 0;
		variables.PA124E = 0;
		variables.TLCO4E = 0;
		variables.CO014E = 0;
		variables.CO024E = 0;
		variables.CO034E = 0;
		variables.CO044E = 0;
		variables.CO054E = 0;
		variables.CO064E = 0;
		variables.CO074E = 0;
		variables.CO084E = 0;
		variables.CO094E = 0;
		variables.CO104E = 0;
		variables.CO114E = 0;
		variables.CO124E = 0;
		variables.TLCT4E = 0;
		variables.CT014E = 0;
		variables.CT024E = 0;
		variables.CT034E = 0;
		variables.CT044E = 0;
		variables.CT054E = 0;
		variables.CT064E = 0;
		variables.CT074E = 0;
		variables.CT084E = 0;
		variables.CT094E = 0;
		variables.CT104E = 0;
		variables.CT114E = 0;
		variables.CT124E = 0;
		variables.TLCP4E = 0;
		variables.CP014E = 0;
		variables.CP024E = 0;
		variables.CP034E = 0;
		variables.CP044E = 0;
		variables.CP054E = 0;
		variables.CP064E = 0;
		variables.CP074E = 0;
		variables.CP084E = 0;
		variables.CP094E = 0;
		variables.CP104E = 0;
		variables.CP114E = 0;
		variables.CP124E = 0;
		variables.TLCD4E = 0;
		variables.CD014E = 0;
		variables.CD024E = 0;
		variables.CD034E = 0;
		variables.CD044E = 0;
		variables.CD054E = 0;
		variables.CD064E = 0;
		variables.CD074E = 0;
		variables.CD084E = 0;
		variables.CD094E = 0;
		variables.CD104E = 0;
		variables.CD114E = 0;
		variables.CD124E = 0;
		variables.RMOR4E = "";
		variables.TPDT4E = 0;
		variables.TPTM4E = 0;
		variables.FRSP4E = 0;
		variables.WHNO4E = 0;
	</cfscript>

	<cffunction name="init" output="false" returntype="ORDDTL0">
		<cfreturn this>
	</cffunction>
	<cffunction name="getCONO4E" output="false" access="public" returntype="any">
		<cfreturn variables.CONO4E>
	</cffunction>

	<cffunction name="setCONO4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CONO4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getORNO4E" output="false" access="public" returntype="any">
		<cfreturn variables.ORNO4E>
	</cffunction>

	<cffunction name="setORNO4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ORNO4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLNNO4E" output="false" access="public" returntype="any">
		<cfreturn variables.LNNO4E>
	</cffunction>

	<cffunction name="setLNNO4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.LNNO4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPRCD4E" output="false" access="public" returntype="any">
		<cfreturn variables.PRCD4E>
	</cffunction>

	<cffunction name="setPRCD4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.PRCD4E = arguments.val>
	</cffunction>

	<cffunction name="getCRCD4E" output="false" access="public" returntype="any">
		<cfreturn variables.CRCD4E>
	</cffunction>

	<cffunction name="setCRCD4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CRCD4E = arguments.val>
	</cffunction>

	<cffunction name="getUNIT4E" output="false" access="public" returntype="any">
		<cfreturn variables.UNIT4E>
	</cffunction>

	<cffunction name="setUNIT4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.UNIT4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLSPR4E" output="false" access="public" returntype="any">
		<cfreturn variables.LSPR4E>
	</cffunction>

	<cffunction name="setLSPR4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.LSPR4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSLPR4E" output="false" access="public" returntype="any">
		<cfreturn variables.SLPR4E>
	</cffunction>

	<cffunction name="setSLPR4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SLPR4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getINPR4E" output="false" access="public" returntype="any">
		<cfreturn variables.INPR4E>
	</cffunction>

	<cffunction name="setINPR4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.INPR4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSCAM4E" output="false" access="public" returntype="any">
		<cfreturn variables.SCAM4E>
	</cffunction>

	<cffunction name="setSCAM4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SCAM4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getNTPR4E" output="false" access="public" returntype="any">
		<cfreturn variables.NTPR4E>
	</cffunction>

	<cffunction name="setNTPR4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.NTPR4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getEXAM4E" output="false" access="public" returntype="any">
		<cfreturn variables.EXAM4E>
	</cffunction>

	<cffunction name="setEXAM4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.EXAM4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLDCT4E" output="false" access="public" returntype="any">
		<cfreturn variables.LDCT4E>
	</cffunction>

	<cffunction name="setLDCT4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LDCT4E = arguments.val>
	</cffunction>

	<cffunction name="getLDAM4E" output="false" access="public" returntype="any">
		<cfreturn variables.LDAM4E>
	</cffunction>

	<cffunction name="setLDAM4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.LDAM4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTDNO4E" output="false" access="public" returntype="any">
		<cfreturn variables.TDNO4E>
	</cffunction>

	<cffunction name="setTDNO4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TDNO4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTDOV4E" output="false" access="public" returntype="any">
		<cfreturn variables.TDOV4E>
	</cffunction>

	<cffunction name="setTDOV4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TDOV4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDSC14E" output="false" access="public" returntype="any">
		<cfreturn variables.DSC14E>
	</cffunction>

	<cffunction name="setDSC14E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.DSC14E = arguments.val>
	</cffunction>

	<cffunction name="getDAI14E" output="false" access="public" returntype="any">
		<cfreturn variables.DAI14E>
	</cffunction>

	<cffunction name="setDAI14E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.DAI14E = arguments.val>
	</cffunction>

	<cffunction name="getDSA14E" output="false" access="public" returntype="any">
		<cfreturn variables.DSA14E>
	</cffunction>

	<cffunction name="setDSA14E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.DSA14E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDSC24E" output="false" access="public" returntype="any">
		<cfreturn variables.DSC24E>
	</cffunction>

	<cffunction name="setDSC24E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.DSC24E = arguments.val>
	</cffunction>

	<cffunction name="getDAI24E" output="false" access="public" returntype="any">
		<cfreturn variables.DAI24E>
	</cffunction>

	<cffunction name="setDAI24E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.DAI24E = arguments.val>
	</cffunction>

	<cffunction name="getDSA24E" output="false" access="public" returntype="any">
		<cfreturn variables.DSA24E>
	</cffunction>

	<cffunction name="setDSA24E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.DSA24E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDSC34E" output="false" access="public" returntype="any">
		<cfreturn variables.DSC34E>
	</cffunction>

	<cffunction name="setDSC34E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.DSC34E = arguments.val>
	</cffunction>

	<cffunction name="getDAI34E" output="false" access="public" returntype="any">
		<cfreturn variables.DAI34E>
	</cffunction>

	<cffunction name="setDAI34E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.DAI34E = arguments.val>
	</cffunction>

	<cffunction name="getDSA34E" output="false" access="public" returntype="any">
		<cfreturn variables.DSA34E>
	</cffunction>

	<cffunction name="setDSA34E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.DSA34E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDSC44E" output="false" access="public" returntype="any">
		<cfreturn variables.DSC44E>
	</cffunction>

	<cffunction name="setDSC44E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.DSC44E = arguments.val>
	</cffunction>

	<cffunction name="getDAI44E" output="false" access="public" returntype="any">
		<cfreturn variables.DAI44E>
	</cffunction>

	<cffunction name="setDAI44E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.DAI44E = arguments.val>
	</cffunction>

	<cffunction name="getDSA44E" output="false" access="public" returntype="any">
		<cfreturn variables.DSA44E>
	</cffunction>

	<cffunction name="setDSA44E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.DSA44E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDSC54E" output="false" access="public" returntype="any">
		<cfreturn variables.DSC54E>
	</cffunction>

	<cffunction name="setDSC54E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.DSC54E = arguments.val>
	</cffunction>

	<cffunction name="getDAI54E" output="false" access="public" returntype="any">
		<cfreturn variables.DAI54E>
	</cffunction>

	<cffunction name="setDAI54E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.DAI54E = arguments.val>
	</cffunction>

	<cffunction name="getDSA54E" output="false" access="public" returntype="any">
		<cfreturn variables.DSA54E>
	</cffunction>

	<cffunction name="setDSA54E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.DSA54E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDSC64E" output="false" access="public" returntype="any">
		<cfreturn variables.DSC64E>
	</cffunction>

	<cffunction name="setDSC64E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.DSC64E = arguments.val>
	</cffunction>

	<cffunction name="getDAI64E" output="false" access="public" returntype="any">
		<cfreturn variables.DAI64E>
	</cffunction>

	<cffunction name="setDAI64E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.DAI64E = arguments.val>
	</cffunction>

	<cffunction name="getDSA64E" output="false" access="public" returntype="any">
		<cfreturn variables.DSA64E>
	</cffunction>

	<cffunction name="setDSA64E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.DSA64E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDSC74E" output="false" access="public" returntype="any">
		<cfreturn variables.DSC74E>
	</cffunction>

	<cffunction name="setDSC74E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.DSC74E = arguments.val>
	</cffunction>

	<cffunction name="getDAI74E" output="false" access="public" returntype="any">
		<cfreturn variables.DAI74E>
	</cffunction>

	<cffunction name="setDAI74E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.DAI74E = arguments.val>
	</cffunction>

	<cffunction name="getDSA74E" output="false" access="public" returntype="any">
		<cfreturn variables.DSA74E>
	</cffunction>

	<cffunction name="setDSA74E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.DSA74E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDSC84E" output="false" access="public" returntype="any">
		<cfreturn variables.DSC84E>
	</cffunction>

	<cffunction name="setDSC84E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.DSC84E = arguments.val>
	</cffunction>

	<cffunction name="getDAI84E" output="false" access="public" returntype="any">
		<cfreturn variables.DAI84E>
	</cffunction>

	<cffunction name="setDAI84E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.DAI84E = arguments.val>
	</cffunction>

	<cffunction name="getDSA84E" output="false" access="public" returntype="any">
		<cfreturn variables.DSA84E>
	</cffunction>

	<cffunction name="setDSA84E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.DSA84E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDSC94E" output="false" access="public" returntype="any">
		<cfreturn variables.DSC94E>
	</cffunction>

	<cffunction name="setDSC94E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.DSC94E = arguments.val>
	</cffunction>

	<cffunction name="getDAI94E" output="false" access="public" returntype="any">
		<cfreturn variables.DAI94E>
	</cffunction>

	<cffunction name="setDAI94E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.DAI94E = arguments.val>
	</cffunction>

	<cffunction name="getDSA94E" output="false" access="public" returntype="any">
		<cfreturn variables.DSA94E>
	</cffunction>

	<cffunction name="setDSA94E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.DSA94E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLDS4E" output="false" access="public" returntype="any">
		<cfreturn variables.TLDS4E>
	</cffunction>

	<cffunction name="setTLDS4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLDS4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDSPC4E" output="false" access="public" returntype="any">
		<cfreturn variables.DSPC4E>
	</cffunction>

	<cffunction name="setDSPC4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.DSPC4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPSPR4E" output="false" access="public" returntype="any">
		<cfreturn variables.PSPR4E>
	</cffunction>

	<cffunction name="setPSPR4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PSPR4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSZ014E" output="false" access="public" returntype="any">
		<cfreturn variables.SZ014E>
	</cffunction>

	<cffunction name="setSZ014E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SZ014E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSZ024E" output="false" access="public" returntype="any">
		<cfreturn variables.SZ024E>
	</cffunction>

	<cffunction name="setSZ024E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SZ024E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSZ034E" output="false" access="public" returntype="any">
		<cfreturn variables.SZ034E>
	</cffunction>

	<cffunction name="setSZ034E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SZ034E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSZ044E" output="false" access="public" returntype="any">
		<cfreturn variables.SZ044E>
	</cffunction>

	<cffunction name="setSZ044E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SZ044E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSZ054E" output="false" access="public" returntype="any">
		<cfreturn variables.SZ054E>
	</cffunction>

	<cffunction name="setSZ054E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SZ054E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSZ064E" output="false" access="public" returntype="any">
		<cfreturn variables.SZ064E>
	</cffunction>

	<cffunction name="setSZ064E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SZ064E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSZ074E" output="false" access="public" returntype="any">
		<cfreturn variables.SZ074E>
	</cffunction>

	<cffunction name="setSZ074E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SZ074E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSZ084E" output="false" access="public" returntype="any">
		<cfreturn variables.SZ084E>
	</cffunction>

	<cffunction name="setSZ084E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SZ084E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSZ094E" output="false" access="public" returntype="any">
		<cfreturn variables.SZ094E>
	</cffunction>

	<cffunction name="setSZ094E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SZ094E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSZ104E" output="false" access="public" returntype="any">
		<cfreturn variables.SZ104E>
	</cffunction>

	<cffunction name="setSZ104E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SZ104E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSZ114E" output="false" access="public" returntype="any">
		<cfreturn variables.SZ114E>
	</cffunction>

	<cffunction name="setSZ114E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SZ114E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSZ124E" output="false" access="public" returntype="any">
		<cfreturn variables.SZ124E>
	</cffunction>

	<cffunction name="setSZ124E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SZ124E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDUDT4E" output="false" access="public" returntype="any">
		<cfreturn variables.DUDT4E>
	</cffunction>

	<cffunction name="setDUDT4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.DUDT4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPRNO4E" output="false" access="public" returntype="any">
		<cfreturn variables.PRNO4E>
	</cffunction>

	<cffunction name="setPRNO4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PRNO4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCMNO4E" output="false" access="public" returntype="any">
		<cfreturn variables.CMNO4E>
	</cffunction>

	<cffunction name="setCMNO4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CMNO4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCMN24E" output="false" access="public" returntype="any">
		<cfreturn variables.CMN24E>
	</cffunction>

	<cffunction name="setCMN24E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CMN24E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCMN34E" output="false" access="public" returntype="any">
		<cfreturn variables.CMN34E>
	</cffunction>

	<cffunction name="setCMN34E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CMN34E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCMDF4E" output="false" access="public" returntype="any">
		<cfreturn variables.CMDF4E>
	</cffunction>

	<cffunction name="setCMDF4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CMDF4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSZCD4E" output="false" access="public" returntype="any">
		<cfreturn variables.SZCD4E>
	</cffunction>

	<cffunction name="setSZCD4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SZCD4E = arguments.val>
	</cffunction>

	<cffunction name="getSRCD4E" output="false" access="public" returntype="any">
		<cfreturn variables.SRCD4E>
	</cffunction>

	<cffunction name="setSRCD4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SRCD4E = arguments.val>
	</cffunction>

	<cffunction name="getPROV4E" output="false" access="public" returntype="any">
		<cfreturn variables.PROV4E>
	</cffunction>

	<cffunction name="setPROV4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.PROV4E = arguments.val>
	</cffunction>

	<cffunction name="getMSCD4E" output="false" access="public" returntype="any">
		<cfreturn variables.MSCD4E>
	</cffunction>

	<cffunction name="setMSCD4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.MSCD4E = arguments.val>
	</cffunction>

	<cffunction name="getPRUM4E" output="false" access="public" returntype="any">
		<cfreturn variables.PRUM4E>
	</cffunction>

	<cffunction name="setPRUM4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.PRUM4E = arguments.val>
	</cffunction>

	<cffunction name="getCVFC4E" output="false" access="public" returntype="any">
		<cfreturn variables.CVFC4E>
	</cffunction>

	<cffunction name="setCVFC4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CVFC4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getMKGP4E" output="false" access="public" returntype="any">
		<cfreturn variables.MKGP4E>
	</cffunction>

	<cffunction name="setMKGP4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.MKGP4E = arguments.val>
	</cffunction>

	<cffunction name="getUNWT4E" output="false" access="public" returntype="any">
		<cfreturn variables.UNWT4E>
	</cffunction>

	<cffunction name="setUNWT4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.UNWT4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getUNVL4E" output="false" access="public" returntype="any">
		<cfreturn variables.UNVL4E>
	</cffunction>

	<cffunction name="setUNVL4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.UNVL4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTPSL4E" output="false" access="public" returntype="any">
		<cfreturn variables.TPSL4E>
	</cffunction>

	<cffunction name="setTPSL4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.TPSL4E = arguments.val>
	</cffunction>

	<cffunction name="getTXBL4E" output="false" access="public" returntype="any">
		<cfreturn variables.TXBL4E>
	</cffunction>

	<cffunction name="setTXBL4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.TXBL4E = arguments.val>
	</cffunction>

	<cffunction name="getNCHG4E" output="false" access="public" returntype="any">
		<cfreturn variables.NCHG4E>
	</cffunction>

	<cffunction name="setNCHG4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.NCHG4E = arguments.val>
	</cffunction>

	<cffunction name="getSPCL4E" output="false" access="public" returntype="any">
		<cfreturn variables.SPCL4E>
	</cffunction>

	<cffunction name="setSPCL4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SPCL4E = arguments.val>
	</cffunction>

	<cffunction name="getSTCD4E" output="false" access="public" returntype="any">
		<cfreturn variables.STCD4E>
	</cffunction>

	<cffunction name="setSTCD4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.STCD4E = arguments.val>
	</cffunction>

	<cffunction name="getOGPR4E" output="false" access="public" returntype="any">
		<cfreturn variables.OGPR4E>
	</cffunction>

	<cffunction name="setOGPR4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.OGPR4E = arguments.val>
	</cffunction>

	<cffunction name="getOGCR4E" output="false" access="public" returntype="any">
		<cfreturn variables.OGCR4E>
	</cffunction>

	<cffunction name="setOGCR4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.OGCR4E = arguments.val>
	</cffunction>

	<cffunction name="getTGNO4E" output="false" access="public" returntype="any">
		<cfreturn variables.TGNO4E>
	</cffunction>

	<cffunction name="setTGNO4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TGNO4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTGN24E" output="false" access="public" returntype="any">
		<cfreturn variables.TGN24E>
	</cffunction>

	<cffunction name="setTGN24E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TGN24E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTGN34E" output="false" access="public" returntype="any">
		<cfreturn variables.TGN34E>
	</cffunction>

	<cffunction name="setTGN34E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TGN34E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getBGDT4E" output="false" access="public" returntype="any">
		<cfreturn variables.BGDT4E>
	</cffunction>

	<cffunction name="setBGDT4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.BGDT4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getENDT4E" output="false" access="public" returntype="any">
		<cfreturn variables.ENDT4E>
	</cffunction>

	<cffunction name="setENDT4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ENDT4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLNST4E" output="false" access="public" returntype="any">
		<cfreturn variables.LNST4E>
	</cffunction>

	<cffunction name="setLNST4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LNST4E = arguments.val>
	</cffunction>

	<cffunction name="getINLN4E" output="false" access="public" returntype="any">
		<cfreturn variables.INLN4E>
	</cffunction>

	<cffunction name="setINLN4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.INLN4E = arguments.val>
	</cffunction>

	<cffunction name="getBKOR4E" output="false" access="public" returntype="any">
		<cfreturn variables.BKOR4E>
	</cffunction>

	<cffunction name="setBKOR4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.BKOR4E = arguments.val>
	</cffunction>

	<cffunction name="getCLLN4E" output="false" access="public" returntype="any">
		<cfreturn variables.CLLN4E>
	</cffunction>

	<cffunction name="setCLLN4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CLLN4E = arguments.val>
	</cffunction>

	<cffunction name="getPSBK4E" output="false" access="public" returntype="any">
		<cfreturn variables.PSBK4E>
	</cffunction>

	<cffunction name="setPSBK4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.PSBK4E = arguments.val>
	</cffunction>

	<cffunction name="getCRWS4E" output="false" access="public" returntype="any">
		<cfreturn variables.CRWS4E>
	</cffunction>

	<cffunction name="setCRWS4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CRWS4E = arguments.val>
	</cffunction>

	<cffunction name="getCRUS4E" output="false" access="public" returntype="any">
		<cfreturn variables.CRUS4E>
	</cffunction>

	<cffunction name="setCRUS4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CRUS4E = arguments.val>
	</cffunction>

	<cffunction name="getCRDT4E" output="false" access="public" returntype="any">
		<cfreturn variables.CRDT4E>
	</cffunction>

	<cffunction name="setCRDT4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CRDT4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCRTM4E" output="false" access="public" returntype="any">
		<cfreturn variables.CRTM4E>
	</cffunction>

	<cffunction name="setCRTM4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CRTM4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getMNWS4E" output="false" access="public" returntype="any">
		<cfreturn variables.MNWS4E>
	</cffunction>

	<cffunction name="setMNWS4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.MNWS4E = arguments.val>
	</cffunction>

	<cffunction name="getMNUS4E" output="false" access="public" returntype="any">
		<cfreturn variables.MNUS4E>
	</cffunction>

	<cffunction name="setMNUS4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.MNUS4E = arguments.val>
	</cffunction>

	<cffunction name="getMNDT4E" output="false" access="public" returntype="any">
		<cfreturn variables.MNDT4E>
	</cffunction>

	<cffunction name="setMNDT4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.MNDT4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getMNTM4E" output="false" access="public" returntype="any">
		<cfreturn variables.MNTM4E>
	</cffunction>

	<cffunction name="setMNTM4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.MNTM4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLCUS4E" output="false" access="public" returntype="any">
		<cfreturn variables.LCUS4E>
	</cffunction>

	<cffunction name="setLCUS4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LCUS4E = arguments.val>
	</cffunction>

	<cffunction name="getLCDT4E" output="false" access="public" returntype="any">
		<cfreturn variables.LCDT4E>
	</cffunction>

	<cffunction name="setLCDT4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.LCDT4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLCTM4E" output="false" access="public" returntype="any">
		<cfreturn variables.LCTM4E>
	</cffunction>

	<cffunction name="setLCTM4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.LCTM4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLTA4E" output="false" access="public" returntype="any">
		<cfreturn variables.TLTA4E>
	</cffunction>

	<cffunction name="setTLTA4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLTA4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTA014E" output="false" access="public" returntype="any">
		<cfreturn variables.TA014E>
	</cffunction>

	<cffunction name="setTA014E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TA014E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTA024E" output="false" access="public" returntype="any">
		<cfreturn variables.TA024E>
	</cffunction>

	<cffunction name="setTA024E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TA024E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTA034E" output="false" access="public" returntype="any">
		<cfreturn variables.TA034E>
	</cffunction>

	<cffunction name="setTA034E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TA034E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTA044E" output="false" access="public" returntype="any">
		<cfreturn variables.TA044E>
	</cffunction>

	<cffunction name="setTA044E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TA044E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTA054E" output="false" access="public" returntype="any">
		<cfreturn variables.TA054E>
	</cffunction>

	<cffunction name="setTA054E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TA054E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTA064E" output="false" access="public" returntype="any">
		<cfreturn variables.TA064E>
	</cffunction>

	<cffunction name="setTA064E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TA064E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTA074E" output="false" access="public" returntype="any">
		<cfreturn variables.TA074E>
	</cffunction>

	<cffunction name="setTA074E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TA074E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTA084E" output="false" access="public" returntype="any">
		<cfreturn variables.TA084E>
	</cffunction>

	<cffunction name="setTA084E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TA084E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTA094E" output="false" access="public" returntype="any">
		<cfreturn variables.TA094E>
	</cffunction>

	<cffunction name="setTA094E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TA094E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTA104E" output="false" access="public" returntype="any">
		<cfreturn variables.TA104E>
	</cffunction>

	<cffunction name="setTA104E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TA104E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTA114E" output="false" access="public" returntype="any">
		<cfreturn variables.TA114E>
	</cffunction>

	<cffunction name="setTA114E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TA114E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTA124E" output="false" access="public" returntype="any">
		<cfreturn variables.TA124E>
	</cffunction>

	<cffunction name="setTA124E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TA124E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLQA4E" output="false" access="public" returntype="any">
		<cfreturn variables.TLQA4E>
	</cffunction>

	<cffunction name="setTLQA4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLQA4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getQA014E" output="false" access="public" returntype="any">
		<cfreturn variables.QA014E>
	</cffunction>

	<cffunction name="setQA014E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.QA014E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getQA024E" output="false" access="public" returntype="any">
		<cfreturn variables.QA024E>
	</cffunction>

	<cffunction name="setQA024E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.QA024E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getQA034E" output="false" access="public" returntype="any">
		<cfreturn variables.QA034E>
	</cffunction>

	<cffunction name="setQA034E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.QA034E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getQA044E" output="false" access="public" returntype="any">
		<cfreturn variables.QA044E>
	</cffunction>

	<cffunction name="setQA044E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.QA044E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getQA054E" output="false" access="public" returntype="any">
		<cfreturn variables.QA054E>
	</cffunction>

	<cffunction name="setQA054E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.QA054E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getQA064E" output="false" access="public" returntype="any">
		<cfreturn variables.QA064E>
	</cffunction>

	<cffunction name="setQA064E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.QA064E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getQA074E" output="false" access="public" returntype="any">
		<cfreturn variables.QA074E>
	</cffunction>

	<cffunction name="setQA074E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.QA074E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getQA084E" output="false" access="public" returntype="any">
		<cfreturn variables.QA084E>
	</cffunction>

	<cffunction name="setQA084E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.QA084E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getQA094E" output="false" access="public" returntype="any">
		<cfreturn variables.QA094E>
	</cffunction>

	<cffunction name="setQA094E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.QA094E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getQA104E" output="false" access="public" returntype="any">
		<cfreturn variables.QA104E>
	</cffunction>

	<cffunction name="setQA104E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.QA104E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getQA114E" output="false" access="public" returntype="any">
		<cfreturn variables.QA114E>
	</cffunction>

	<cffunction name="setQA114E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.QA114E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getQA124E" output="false" access="public" returntype="any">
		<cfreturn variables.QA124E>
	</cffunction>

	<cffunction name="setQA124E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.QA124E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLQP4E" output="false" access="public" returntype="any">
		<cfreturn variables.TLQP4E>
	</cffunction>

	<cffunction name="setTLQP4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLQP4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getQP014E" output="false" access="public" returntype="any">
		<cfreturn variables.QP014E>
	</cffunction>

	<cffunction name="setQP014E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.QP014E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getQP024E" output="false" access="public" returntype="any">
		<cfreturn variables.QP024E>
	</cffunction>

	<cffunction name="setQP024E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.QP024E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getQP034E" output="false" access="public" returntype="any">
		<cfreturn variables.QP034E>
	</cffunction>

	<cffunction name="setQP034E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.QP034E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getQP044E" output="false" access="public" returntype="any">
		<cfreturn variables.QP044E>
	</cffunction>

	<cffunction name="setQP044E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.QP044E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getQP054E" output="false" access="public" returntype="any">
		<cfreturn variables.QP054E>
	</cffunction>

	<cffunction name="setQP054E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.QP054E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getQP064E" output="false" access="public" returntype="any">
		<cfreturn variables.QP064E>
	</cffunction>

	<cffunction name="setQP064E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.QP064E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getQP074E" output="false" access="public" returntype="any">
		<cfreturn variables.QP074E>
	</cffunction>

	<cffunction name="setQP074E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.QP074E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getQP084E" output="false" access="public" returntype="any">
		<cfreturn variables.QP084E>
	</cffunction>

	<cffunction name="setQP084E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.QP084E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getQP094E" output="false" access="public" returntype="any">
		<cfreturn variables.QP094E>
	</cffunction>

	<cffunction name="setQP094E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.QP094E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getQP104E" output="false" access="public" returntype="any">
		<cfreturn variables.QP104E>
	</cffunction>

	<cffunction name="setQP104E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.QP104E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getQP114E" output="false" access="public" returntype="any">
		<cfreturn variables.QP114E>
	</cffunction>

	<cffunction name="setQP114E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.QP114E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getQP124E" output="false" access="public" returntype="any">
		<cfreturn variables.QP124E>
	</cffunction>

	<cffunction name="setQP124E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.QP124E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getALBT4E" output="false" access="public" returntype="any">
		<cfreturn variables.ALBT4E>
	</cffunction>

	<cffunction name="setALBT4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ALBT4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getABCL4E" output="false" access="public" returntype="any">
		<cfreturn variables.ABCL4E>
	</cffunction>

	<cffunction name="setABCL4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ABCL4E = arguments.val>
	</cffunction>

	<cffunction name="getPTNO4E" output="false" access="public" returntype="any">
		<cfreturn variables.PTNO4E>
	</cffunction>

	<cffunction name="setPTNO4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PTNO4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPTLN4E" output="false" access="public" returntype="any">
		<cfreturn variables.PTLN4E>
	</cffunction>

	<cffunction name="setPTLN4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PTLN4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPTSQ4E" output="false" access="public" returntype="any">
		<cfreturn variables.PTSQ4E>
	</cffunction>

	<cffunction name="setPTSQ4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PTSQ4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPTDT4E" output="false" access="public" returntype="any">
		<cfreturn variables.PTDT4E>
	</cffunction>

	<cffunction name="setPTDT4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PTDT4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPTTM4E" output="false" access="public" returntype="any">
		<cfreturn variables.PTTM4E>
	</cffunction>

	<cffunction name="setPTTM4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PTTM4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getVRUS4E" output="false" access="public" returntype="any">
		<cfreturn variables.VRUS4E>
	</cffunction>

	<cffunction name="setVRUS4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.VRUS4E = arguments.val>
	</cffunction>

	<cffunction name="getVRDT4E" output="false" access="public" returntype="any">
		<cfreturn variables.VRDT4E>
	</cffunction>

	<cffunction name="setVRDT4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.VRDT4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getVRTM4E" output="false" access="public" returntype="any">
		<cfreturn variables.VRTM4E>
	</cffunction>

	<cffunction name="setVRTM4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.VRTM4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAPUS4E" output="false" access="public" returntype="any">
		<cfreturn variables.APUS4E>
	</cffunction>

	<cffunction name="setAPUS4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.APUS4E = arguments.val>
	</cffunction>

	<cffunction name="getPRHG4E" output="false" access="public" returntype="any">
		<cfreturn variables.PRHG4E>
	</cffunction>

	<cffunction name="setPRHG4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.PRHG4E = arguments.val>
	</cffunction>

	<cffunction name="getCSNO4E" output="false" access="public" returntype="any">
		<cfreturn variables.CSNO4E>
	</cffunction>

	<cffunction name="setCSNO4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CSNO4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCSSN4E" output="false" access="public" returntype="any">
		<cfreturn variables.CSSN4E>
	</cffunction>

	<cffunction name="setCSSN4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CSSN4E = arguments.val>
	</cffunction>

	<cffunction name="getSHNO4E" output="false" access="public" returntype="any">
		<cfreturn variables.SHNO4E>
	</cffunction>

	<cffunction name="setSHNO4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SHNO4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCSPO4E" output="false" access="public" returntype="any">
		<cfreturn variables.CSPO4E>
	</cffunction>

	<cffunction name="setCSPO4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CSPO4E = arguments.val>
	</cffunction>

	<cffunction name="getDVNO4E" output="false" access="public" returntype="any">
		<cfreturn variables.DVNO4E>
	</cffunction>

	<cffunction name="setDVNO4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.DVNO4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSNNO4E" output="false" access="public" returntype="any">
		<cfreturn variables.SNNO4E>
	</cffunction>

	<cffunction name="setSNNO4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SNNO4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSBSN4E" output="false" access="public" returntype="any">
		<cfreturn variables.SBSN4E>
	</cffunction>

	<cffunction name="setSBSN4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SBSN4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSASN4E" output="false" access="public" returntype="any">
		<cfreturn variables.SASN4E>
	</cffunction>

	<cffunction name="setSASN4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SASN4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSAPR4E" output="false" access="public" returntype="any">
		<cfreturn variables.SAPR4E>
	</cffunction>

	<cffunction name="setSAPR4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SAPR4E = arguments.val>
	</cffunction>

	<cffunction name="getSMN14E" output="false" access="public" returntype="any">
		<cfreturn variables.SMN14E>
	</cffunction>

	<cffunction name="setSMN14E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SMN14E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getBKDS4E" output="false" access="public" returntype="any">
		<cfreturn variables.BKDS4E>
	</cffunction>

	<cffunction name="setBKDS4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.BKDS4E = arguments.val>
	</cffunction>

	<cffunction name="getEDII4E" output="false" access="public" returntype="any">
		<cfreturn variables.EDII4E>
	</cffunction>

	<cffunction name="setEDII4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.EDII4E = arguments.val>
	</cffunction>

	<cffunction name="getEDSP4E" output="false" access="public" returntype="any">
		<cfreturn variables.EDSP4E>
	</cffunction>

	<cffunction name="setEDSP4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.EDSP4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getEDRP4E" output="false" access="public" returntype="any">
		<cfreturn variables.EDRP4E>
	</cffunction>

	<cffunction name="setEDRP4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.EDRP4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPRUP4E" output="false" access="public" returntype="any">
		<cfreturn variables.PRUP4E>
	</cffunction>

	<cffunction name="setPRUP4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PRUP4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getEDR14E" output="false" access="public" returntype="any">
		<cfreturn variables.EDR14E>
	</cffunction>

	<cffunction name="setEDR14E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.EDR14E = arguments.val>
	</cffunction>

	<cffunction name="getEDR24E" output="false" access="public" returntype="any">
		<cfreturn variables.EDR24E>
	</cffunction>

	<cffunction name="setEDR24E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.EDR24E = arguments.val>
	</cffunction>

	<cffunction name="getEDR34E" output="false" access="public" returntype="any">
		<cfreturn variables.EDR34E>
	</cffunction>

	<cffunction name="setEDR34E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.EDR34E = arguments.val>
	</cffunction>

	<cffunction name="getEDR44E" output="false" access="public" returntype="any">
		<cfreturn variables.EDR44E>
	</cffunction>

	<cffunction name="setEDR44E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.EDR44E = arguments.val>
	</cffunction>

	<cffunction name="getEDCS4E" output="false" access="public" returntype="any">
		<cfreturn variables.EDCS4E>
	</cffunction>

	<cffunction name="setEDCS4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.EDCS4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getJBNO4E" output="false" access="public" returntype="any">
		<cfreturn variables.JBNO4E>
	</cffunction>

	<cffunction name="setJBNO4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.JBNO4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getJBRF4E" output="false" access="public" returntype="any">
		<cfreturn variables.JBRF4E>
	</cffunction>

	<cffunction name="setJBRF4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.JBRF4E = arguments.val>
	</cffunction>

	<cffunction name="getOGJR4E" output="false" access="public" returntype="any">
		<cfreturn variables.OGJR4E>
	</cffunction>

	<cffunction name="setOGJR4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.OGJR4E = arguments.val>
	</cffunction>

	<cffunction name="getJBDT4E" output="false" access="public" returntype="any">
		<cfreturn variables.JBDT4E>
	</cffunction>

	<cffunction name="setJBDT4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.JBDT4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getJBAS4E" output="false" access="public" returntype="any">
		<cfreturn variables.JBAS4E>
	</cffunction>

	<cffunction name="setJBAS4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.JBAS4E = arguments.val>
	</cffunction>

	<cffunction name="getJBBT4E" output="false" access="public" returntype="any">
		<cfreturn variables.JBBT4E>
	</cffunction>

	<cffunction name="setJBBT4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.JBBT4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getJBLR4E" output="false" access="public" returntype="any">
		<cfreturn variables.JBLR4E>
	</cffunction>

	<cffunction name="setJBLR4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.JBLR4E = arguments.val>
	</cffunction>

	<cffunction name="getTLPA4E" output="false" access="public" returntype="any">
		<cfreturn variables.TLPA4E>
	</cffunction>

	<cffunction name="setTLPA4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLPA4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPA014E" output="false" access="public" returntype="any">
		<cfreturn variables.PA014E>
	</cffunction>

	<cffunction name="setPA014E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PA014E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPA024E" output="false" access="public" returntype="any">
		<cfreturn variables.PA024E>
	</cffunction>

	<cffunction name="setPA024E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PA024E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPA034E" output="false" access="public" returntype="any">
		<cfreturn variables.PA034E>
	</cffunction>

	<cffunction name="setPA034E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PA034E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPA044E" output="false" access="public" returntype="any">
		<cfreturn variables.PA044E>
	</cffunction>

	<cffunction name="setPA044E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PA044E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPA054E" output="false" access="public" returntype="any">
		<cfreturn variables.PA054E>
	</cffunction>

	<cffunction name="setPA054E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PA054E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPA064E" output="false" access="public" returntype="any">
		<cfreturn variables.PA064E>
	</cffunction>

	<cffunction name="setPA064E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PA064E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPA074E" output="false" access="public" returntype="any">
		<cfreturn variables.PA074E>
	</cffunction>

	<cffunction name="setPA074E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PA074E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPA084E" output="false" access="public" returntype="any">
		<cfreturn variables.PA084E>
	</cffunction>

	<cffunction name="setPA084E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PA084E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPA094E" output="false" access="public" returntype="any">
		<cfreturn variables.PA094E>
	</cffunction>

	<cffunction name="setPA094E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PA094E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPA104E" output="false" access="public" returntype="any">
		<cfreturn variables.PA104E>
	</cffunction>

	<cffunction name="setPA104E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PA104E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPA114E" output="false" access="public" returntype="any">
		<cfreturn variables.PA114E>
	</cffunction>

	<cffunction name="setPA114E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PA114E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPA124E" output="false" access="public" returntype="any">
		<cfreturn variables.PA124E>
	</cffunction>

	<cffunction name="setPA124E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PA124E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLCO4E" output="false" access="public" returntype="any">
		<cfreturn variables.TLCO4E>
	</cffunction>

	<cffunction name="setTLCO4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLCO4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCO014E" output="false" access="public" returntype="any">
		<cfreturn variables.CO014E>
	</cffunction>

	<cffunction name="setCO014E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CO014E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCO024E" output="false" access="public" returntype="any">
		<cfreturn variables.CO024E>
	</cffunction>

	<cffunction name="setCO024E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CO024E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCO034E" output="false" access="public" returntype="any">
		<cfreturn variables.CO034E>
	</cffunction>

	<cffunction name="setCO034E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CO034E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCO044E" output="false" access="public" returntype="any">
		<cfreturn variables.CO044E>
	</cffunction>

	<cffunction name="setCO044E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CO044E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCO054E" output="false" access="public" returntype="any">
		<cfreturn variables.CO054E>
	</cffunction>

	<cffunction name="setCO054E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CO054E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCO064E" output="false" access="public" returntype="any">
		<cfreturn variables.CO064E>
	</cffunction>

	<cffunction name="setCO064E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CO064E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCO074E" output="false" access="public" returntype="any">
		<cfreturn variables.CO074E>
	</cffunction>

	<cffunction name="setCO074E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CO074E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCO084E" output="false" access="public" returntype="any">
		<cfreturn variables.CO084E>
	</cffunction>

	<cffunction name="setCO084E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CO084E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCO094E" output="false" access="public" returntype="any">
		<cfreturn variables.CO094E>
	</cffunction>

	<cffunction name="setCO094E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CO094E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCO104E" output="false" access="public" returntype="any">
		<cfreturn variables.CO104E>
	</cffunction>

	<cffunction name="setCO104E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CO104E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCO114E" output="false" access="public" returntype="any">
		<cfreturn variables.CO114E>
	</cffunction>

	<cffunction name="setCO114E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CO114E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCO124E" output="false" access="public" returntype="any">
		<cfreturn variables.CO124E>
	</cffunction>

	<cffunction name="setCO124E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CO124E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLCT4E" output="false" access="public" returntype="any">
		<cfreturn variables.TLCT4E>
	</cffunction>

	<cffunction name="setTLCT4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLCT4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCT014E" output="false" access="public" returntype="any">
		<cfreturn variables.CT014E>
	</cffunction>

	<cffunction name="setCT014E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CT014E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCT024E" output="false" access="public" returntype="any">
		<cfreturn variables.CT024E>
	</cffunction>

	<cffunction name="setCT024E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CT024E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCT034E" output="false" access="public" returntype="any">
		<cfreturn variables.CT034E>
	</cffunction>

	<cffunction name="setCT034E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CT034E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCT044E" output="false" access="public" returntype="any">
		<cfreturn variables.CT044E>
	</cffunction>

	<cffunction name="setCT044E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CT044E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCT054E" output="false" access="public" returntype="any">
		<cfreturn variables.CT054E>
	</cffunction>

	<cffunction name="setCT054E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CT054E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCT064E" output="false" access="public" returntype="any">
		<cfreturn variables.CT064E>
	</cffunction>

	<cffunction name="setCT064E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CT064E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCT074E" output="false" access="public" returntype="any">
		<cfreturn variables.CT074E>
	</cffunction>

	<cffunction name="setCT074E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CT074E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCT084E" output="false" access="public" returntype="any">
		<cfreturn variables.CT084E>
	</cffunction>

	<cffunction name="setCT084E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CT084E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCT094E" output="false" access="public" returntype="any">
		<cfreturn variables.CT094E>
	</cffunction>

	<cffunction name="setCT094E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CT094E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCT104E" output="false" access="public" returntype="any">
		<cfreturn variables.CT104E>
	</cffunction>

	<cffunction name="setCT104E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CT104E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCT114E" output="false" access="public" returntype="any">
		<cfreturn variables.CT114E>
	</cffunction>

	<cffunction name="setCT114E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CT114E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCT124E" output="false" access="public" returntype="any">
		<cfreturn variables.CT124E>
	</cffunction>

	<cffunction name="setCT124E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CT124E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLCP4E" output="false" access="public" returntype="any">
		<cfreturn variables.TLCP4E>
	</cffunction>

	<cffunction name="setTLCP4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLCP4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCP014E" output="false" access="public" returntype="any">
		<cfreturn variables.CP014E>
	</cffunction>

	<cffunction name="setCP014E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CP014E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCP024E" output="false" access="public" returntype="any">
		<cfreturn variables.CP024E>
	</cffunction>

	<cffunction name="setCP024E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CP024E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCP034E" output="false" access="public" returntype="any">
		<cfreturn variables.CP034E>
	</cffunction>

	<cffunction name="setCP034E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CP034E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCP044E" output="false" access="public" returntype="any">
		<cfreturn variables.CP044E>
	</cffunction>

	<cffunction name="setCP044E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CP044E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCP054E" output="false" access="public" returntype="any">
		<cfreturn variables.CP054E>
	</cffunction>

	<cffunction name="setCP054E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CP054E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCP064E" output="false" access="public" returntype="any">
		<cfreturn variables.CP064E>
	</cffunction>

	<cffunction name="setCP064E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CP064E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCP074E" output="false" access="public" returntype="any">
		<cfreturn variables.CP074E>
	</cffunction>

	<cffunction name="setCP074E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CP074E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCP084E" output="false" access="public" returntype="any">
		<cfreturn variables.CP084E>
	</cffunction>

	<cffunction name="setCP084E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CP084E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCP094E" output="false" access="public" returntype="any">
		<cfreturn variables.CP094E>
	</cffunction>

	<cffunction name="setCP094E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CP094E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCP104E" output="false" access="public" returntype="any">
		<cfreturn variables.CP104E>
	</cffunction>

	<cffunction name="setCP104E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CP104E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCP114E" output="false" access="public" returntype="any">
		<cfreturn variables.CP114E>
	</cffunction>

	<cffunction name="setCP114E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CP114E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCP124E" output="false" access="public" returntype="any">
		<cfreturn variables.CP124E>
	</cffunction>

	<cffunction name="setCP124E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CP124E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLCD4E" output="false" access="public" returntype="any">
		<cfreturn variables.TLCD4E>
	</cffunction>

	<cffunction name="setTLCD4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLCD4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCD014E" output="false" access="public" returntype="any">
		<cfreturn variables.CD014E>
	</cffunction>

	<cffunction name="setCD014E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CD014E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCD024E" output="false" access="public" returntype="any">
		<cfreturn variables.CD024E>
	</cffunction>

	<cffunction name="setCD024E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CD024E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCD034E" output="false" access="public" returntype="any">
		<cfreturn variables.CD034E>
	</cffunction>

	<cffunction name="setCD034E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CD034E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCD044E" output="false" access="public" returntype="any">
		<cfreturn variables.CD044E>
	</cffunction>

	<cffunction name="setCD044E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CD044E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCD054E" output="false" access="public" returntype="any">
		<cfreturn variables.CD054E>
	</cffunction>

	<cffunction name="setCD054E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CD054E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCD064E" output="false" access="public" returntype="any">
		<cfreturn variables.CD064E>
	</cffunction>

	<cffunction name="setCD064E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CD064E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCD074E" output="false" access="public" returntype="any">
		<cfreturn variables.CD074E>
	</cffunction>

	<cffunction name="setCD074E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CD074E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCD084E" output="false" access="public" returntype="any">
		<cfreturn variables.CD084E>
	</cffunction>

	<cffunction name="setCD084E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CD084E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCD094E" output="false" access="public" returntype="any">
		<cfreturn variables.CD094E>
	</cffunction>

	<cffunction name="setCD094E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CD094E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCD104E" output="false" access="public" returntype="any">
		<cfreturn variables.CD104E>
	</cffunction>

	<cffunction name="setCD104E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CD104E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCD114E" output="false" access="public" returntype="any">
		<cfreturn variables.CD114E>
	</cffunction>

	<cffunction name="setCD114E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CD114E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCD124E" output="false" access="public" returntype="any">
		<cfreturn variables.CD124E>
	</cffunction>

	<cffunction name="setCD124E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CD124E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getRMOR4E" output="false" access="public" returntype="any">
		<cfreturn variables.RMOR4E>
	</cffunction>

	<cffunction name="setRMOR4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.RMOR4E = arguments.val>
	</cffunction>

	<cffunction name="getTPDT4E" output="false" access="public" returntype="any">
		<cfreturn variables.TPDT4E>
	</cffunction>

	<cffunction name="setTPDT4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TPDT4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTPTM4E" output="false" access="public" returntype="any">
		<cfreturn variables.TPTM4E>
	</cffunction>

	<cffunction name="setTPTM4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TPTM4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getFRSP4E" output="false" access="public" returntype="any">
		<cfreturn variables.FRSP4E>
	</cffunction>

	<cffunction name="setFRSP4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.FRSP4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getWHNO4E" output="false" access="public" returntype="any">
		<cfreturn variables.WHNO4E>
	</cffunction>

	<cffunction name="setWHNO4E" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.WHNO4E = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>



</cfcomponent>