<cfcomponent output="false" alias="mochi.cfc.as400.JOBSUM0">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="CONO8Q" type="numeric" default="0">
	<cfproperty name="JBNO8Q" type="numeric" default="0">
	<cfproperty name="PRCD8Q" type="string" default="">
	<cfproperty name="CRCD8Q" type="string" default="">
	<cfproperty name="JBRF8Q" type="string" default="">
	<cfproperty name="DUDT8Q" type="numeric" default="0">
	<cfproperty name="JBDT8Q" type="numeric" default="0">
	<cfproperty name="ISDT8Q" type="numeric" default="0">
	<cfproperty name="CMDT8Q" type="numeric" default="0">
	<cfproperty name="JSDT8Q" type="numeric" default="0">
	<cfproperty name="JCDT8Q" type="numeric" default="0">
	<cfproperty name="ASCN8Q" type="numeric" default="0">
	<cfproperty name="CTRF8Q" type="string" default="">
	<cfproperty name="STCD8Q" type="string" default="">
	<cfproperty name="OPSQ8Q" type="numeric" default="0">
	<cfproperty name="PRSH8Q" type="string" default="">
	<cfproperty name="CMMT8Q" type="string" default="">
	<cfproperty name="VRNO8Q" type="numeric" default="0">
	<cfproperty name="PLDY8Q" type="numeric" default="0">
	<cfproperty name="MTPR8Q" type="numeric" default="0">
	<cfproperty name="LBPR8Q" type="numeric" default="0">
	<cfproperty name="OTPR8Q" type="numeric" default="0">
	<cfproperty name="OVPC8Q" type="numeric" default="0">
	<cfproperty name="OVAM8Q" type="numeric" default="0">
	<cfproperty name="OVDL8Q" type="numeric" default="0">
	<cfproperty name="SBDL8Q" type="numeric" default="0">
	<cfproperty name="STMC8Q" type="numeric" default="0">
	<cfproperty name="SBMY8Q" type="numeric" default="0">
	<cfproperty name="MADT8Q" type="numeric" default="0">
	<cfproperty name="TLIS8Q" type="numeric" default="0">
	<cfproperty name="IS018Q" type="numeric" default="0">
	<cfproperty name="IS028Q" type="numeric" default="0">
	<cfproperty name="IS038Q" type="numeric" default="0">
	<cfproperty name="IS048Q" type="numeric" default="0">
	<cfproperty name="IS058Q" type="numeric" default="0">
	<cfproperty name="IS068Q" type="numeric" default="0">
	<cfproperty name="IS078Q" type="numeric" default="0">
	<cfproperty name="IS088Q" type="numeric" default="0">
	<cfproperty name="IS098Q" type="numeric" default="0">
	<cfproperty name="IS108Q" type="numeric" default="0">
	<cfproperty name="IS118Q" type="numeric" default="0">
	<cfproperty name="IS128Q" type="numeric" default="0">
	<cfproperty name="TLWP8Q" type="numeric" default="0">
	<cfproperty name="WP018Q" type="numeric" default="0">
	<cfproperty name="WP028Q" type="numeric" default="0">
	<cfproperty name="WP038Q" type="numeric" default="0">
	<cfproperty name="WP048Q" type="numeric" default="0">
	<cfproperty name="WP058Q" type="numeric" default="0">
	<cfproperty name="WP068Q" type="numeric" default="0">
	<cfproperty name="WP078Q" type="numeric" default="0">
	<cfproperty name="WP088Q" type="numeric" default="0">
	<cfproperty name="WP098Q" type="numeric" default="0">
	<cfproperty name="WP108Q" type="numeric" default="0">
	<cfproperty name="WP118Q" type="numeric" default="0">
	<cfproperty name="WP128Q" type="numeric" default="0">
	<cfproperty name="TLSH8Q" type="numeric" default="0">
	<cfproperty name="SH018Q" type="numeric" default="0">
	<cfproperty name="SH028Q" type="numeric" default="0">
	<cfproperty name="SH038Q" type="numeric" default="0">
	<cfproperty name="SH048Q" type="numeric" default="0">
	<cfproperty name="SH058Q" type="numeric" default="0">
	<cfproperty name="SH068Q" type="numeric" default="0">
	<cfproperty name="SH078Q" type="numeric" default="0">
	<cfproperty name="SH088Q" type="numeric" default="0">
	<cfproperty name="SH098Q" type="numeric" default="0">
	<cfproperty name="SH108Q" type="numeric" default="0">
	<cfproperty name="SH118Q" type="numeric" default="0">
	<cfproperty name="SH128Q" type="numeric" default="0">
	<cfproperty name="TLRC8Q" type="numeric" default="0">
	<cfproperty name="RC018Q" type="numeric" default="0">
	<cfproperty name="RC028Q" type="numeric" default="0">
	<cfproperty name="RC038Q" type="numeric" default="0">
	<cfproperty name="RC048Q" type="numeric" default="0">
	<cfproperty name="RC058Q" type="numeric" default="0">
	<cfproperty name="RC068Q" type="numeric" default="0">
	<cfproperty name="RC078Q" type="numeric" default="0">
	<cfproperty name="RC088Q" type="numeric" default="0">
	<cfproperty name="RC098Q" type="numeric" default="0">
	<cfproperty name="RC108Q" type="numeric" default="0">
	<cfproperty name="RC118Q" type="numeric" default="0">
	<cfproperty name="RC128Q" type="numeric" default="0">
	<cfproperty name="TLAA8Q" type="numeric" default="0">
	<cfproperty name="AA018Q" type="numeric" default="0">
	<cfproperty name="AA028Q" type="numeric" default="0">
	<cfproperty name="AA038Q" type="numeric" default="0">
	<cfproperty name="AA048Q" type="numeric" default="0">
	<cfproperty name="AA058Q" type="numeric" default="0">
	<cfproperty name="AA068Q" type="numeric" default="0">
	<cfproperty name="AA078Q" type="numeric" default="0">
	<cfproperty name="AA088Q" type="numeric" default="0">
	<cfproperty name="AA098Q" type="numeric" default="0">
	<cfproperty name="AA108Q" type="numeric" default="0">
	<cfproperty name="AA118Q" type="numeric" default="0">
	<cfproperty name="AA128Q" type="numeric" default="0">
	<cfproperty name="TLAJ8Q" type="numeric" default="0">
	<cfproperty name="AJ018Q" type="numeric" default="0">
	<cfproperty name="AJ028Q" type="numeric" default="0">
	<cfproperty name="AJ038Q" type="numeric" default="0">
	<cfproperty name="AJ048Q" type="numeric" default="0">
	<cfproperty name="AJ058Q" type="numeric" default="0">
	<cfproperty name="AJ068Q" type="numeric" default="0">
	<cfproperty name="AJ078Q" type="numeric" default="0">
	<cfproperty name="AJ088Q" type="numeric" default="0">
	<cfproperty name="AJ098Q" type="numeric" default="0">
	<cfproperty name="AJ108Q" type="numeric" default="0">
	<cfproperty name="AJ118Q" type="numeric" default="0">
	<cfproperty name="AJ128Q" type="numeric" default="0">
	<cfproperty name="TLOP8Q" type="numeric" default="0">
	<cfproperty name="OP018Q" type="numeric" default="0">
	<cfproperty name="OP028Q" type="numeric" default="0">
	<cfproperty name="OP038Q" type="numeric" default="0">
	<cfproperty name="OP048Q" type="numeric" default="0">
	<cfproperty name="OP058Q" type="numeric" default="0">
	<cfproperty name="OP068Q" type="numeric" default="0">
	<cfproperty name="OP078Q" type="numeric" default="0">
	<cfproperty name="OP088Q" type="numeric" default="0">
	<cfproperty name="OP098Q" type="numeric" default="0">
	<cfproperty name="OP108Q" type="numeric" default="0">
	<cfproperty name="OP118Q" type="numeric" default="0">
	<cfproperty name="OP128Q" type="numeric" default="0">
	<cfproperty name="CRUS8Q" type="string" default="">
	<cfproperty name="CRDT8Q" type="numeric" default="0">
	<cfproperty name="CRTM8Q" type="numeric" default="0">
	<cfproperty name="MNUS8Q" type="string" default="">
	<cfproperty name="MNDT8Q" type="numeric" default="0">
	<cfproperty name="MNTM8Q" type="numeric" default="0">
	<cfproperty name="CLSD8Q" type="string" default="">
	<cfproperty name="CLDT8Q" type="numeric" default="0">
	<cfproperty name="CTNO8Q" type="numeric" default="0">
	<cfproperty name="CTL28Q" type="string" default="">
	<cfproperty name="CTL38Q" type="string" default="">
	<cfproperty name="CTL48Q" type="string" default="">
	<cfproperty name="CTL58Q" type="string" default="">
	<cfproperty name="CTL68Q" type="string" default="">
	<cfproperty name="PRMR8Q" type="string" default="">
	<cfproperty name="PROP8Q" type="string" default="">
	<cfproperty name="MKRF8Q" type="string" default="">
	<cfproperty name="MKCD8Q" type="string" default="">
	<cfproperty name="MRPR8Q" type="string" default="">
	<cfproperty name="PDTP8Q" type="string" default="">
	<cfproperty name="UPCS8Q" type="string" default="">
	<cfproperty name="ACDT8Q" type="numeric" default="0">
	<cfproperty name="ACRF8Q" type="string" default="">
	<cfproperty name="ESCS8Q" type="numeric" default="0">
	<cfproperty name="JBBT8Q" type="numeric" default="0">
	<cfproperty name="COCD8Q" type="string" default="">
	<cfproperty name="CLW18Q" type="string" default="">
	<cfproperty name="CLB18Q" type="string" default="">
	<cfproperty name="CLD18Q" type="string" default="">
	<cfproperty name="CLI18Q" type="string" default="">
	<cfproperty name="CLM18Q" type="string" default="">
	<cfproperty name="CLW28Q" type="string" default="">
	<cfproperty name="CLB28Q" type="string" default="">
	<cfproperty name="CLD28Q" type="string" default="">
	<cfproperty name="CLI28Q" type="string" default="">
	<cfproperty name="CLM28Q" type="string" default="">
	<cfproperty name="CLW38Q" type="string" default="">
	<cfproperty name="CLB38Q" type="string" default="">
	<cfproperty name="CLD38Q" type="string" default="">
	<cfproperty name="CLI38Q" type="string" default="">
	<cfproperty name="CLM38Q" type="string" default="">
	<cfproperty name="CP118Q" type="string" default="">
	<cfproperty name="P1118Q" type="numeric" default="0">
	<cfproperty name="P1128Q" type="numeric" default="0">
	<cfproperty name="P1138Q" type="numeric" default="0">
	<cfproperty name="P1148Q" type="numeric" default="0">
	<cfproperty name="P1158Q" type="numeric" default="0">
	<cfproperty name="C1118Q" type="string" default="">
	<cfproperty name="C1128Q" type="string" default="">
	<cfproperty name="C1138Q" type="string" default="">
	<cfproperty name="C1148Q" type="string" default="">
	<cfproperty name="C1158Q" type="string" default="">
	<cfproperty name="CP128Q" type="string" default="">
	<cfproperty name="P1218Q" type="numeric" default="0">
	<cfproperty name="P1228Q" type="numeric" default="0">
	<cfproperty name="P1238Q" type="numeric" default="0">
	<cfproperty name="P1248Q" type="numeric" default="0">
	<cfproperty name="P1258Q" type="numeric" default="0">
	<cfproperty name="C1218Q" type="string" default="">
	<cfproperty name="C1228Q" type="string" default="">
	<cfproperty name="C1238Q" type="string" default="">
	<cfproperty name="C1248Q" type="string" default="">
	<cfproperty name="C1258Q" type="string" default="">
	<cfproperty name="CP138Q" type="string" default="">
	<cfproperty name="P1318Q" type="numeric" default="0">
	<cfproperty name="P1328Q" type="numeric" default="0">
	<cfproperty name="P1338Q" type="numeric" default="0">
	<cfproperty name="P1348Q" type="numeric" default="0">
	<cfproperty name="P1358Q" type="numeric" default="0">
	<cfproperty name="C1318Q" type="string" default="">
	<cfproperty name="C1328Q" type="string" default="">
	<cfproperty name="C1338Q" type="string" default="">
	<cfproperty name="C1348Q" type="string" default="">
	<cfproperty name="C1358Q" type="string" default="">
	<cfproperty name="CP218Q" type="string" default="">
	<cfproperty name="P2118Q" type="numeric" default="0">
	<cfproperty name="P2128Q" type="numeric" default="0">
	<cfproperty name="P2138Q" type="numeric" default="0">
	<cfproperty name="P2148Q" type="numeric" default="0">
	<cfproperty name="P2158Q" type="numeric" default="0">
	<cfproperty name="C2118Q" type="string" default="">
	<cfproperty name="C2128Q" type="string" default="">
	<cfproperty name="C2138Q" type="string" default="">
	<cfproperty name="C2148Q" type="string" default="">
	<cfproperty name="C2158Q" type="string" default="">
	<cfproperty name="CP228Q" type="string" default="">
	<cfproperty name="P2218Q" type="numeric" default="0">
	<cfproperty name="P2228Q" type="numeric" default="0">
	<cfproperty name="P2238Q" type="numeric" default="0">
	<cfproperty name="P2248Q" type="numeric" default="0">
	<cfproperty name="P2258Q" type="numeric" default="0">
	<cfproperty name="C2218Q" type="string" default="">
	<cfproperty name="C2228Q" type="string" default="">
	<cfproperty name="C2238Q" type="string" default="">
	<cfproperty name="C2248Q" type="string" default="">
	<cfproperty name="C2258Q" type="string" default="">
	<cfproperty name="CP238Q" type="string" default="">
	<cfproperty name="P2318Q" type="numeric" default="0">
	<cfproperty name="P2328Q" type="numeric" default="0">
	<cfproperty name="P2338Q" type="numeric" default="0">
	<cfproperty name="P2348Q" type="numeric" default="0">
	<cfproperty name="P2358Q" type="numeric" default="0">
	<cfproperty name="C2318Q" type="string" default="">
	<cfproperty name="C2328Q" type="string" default="">
	<cfproperty name="C2338Q" type="string" default="">
	<cfproperty name="C2348Q" type="string" default="">
	<cfproperty name="C2358Q" type="string" default="">
	<cfproperty name="CP318Q" type="string" default="">
	<cfproperty name="P3118Q" type="numeric" default="0">
	<cfproperty name="P3128Q" type="numeric" default="0">
	<cfproperty name="P3138Q" type="numeric" default="0">
	<cfproperty name="P3148Q" type="numeric" default="0">
	<cfproperty name="P3158Q" type="numeric" default="0">
	<cfproperty name="C3118Q" type="string" default="">
	<cfproperty name="C3128Q" type="string" default="">
	<cfproperty name="C3138Q" type="string" default="">
	<cfproperty name="C3148Q" type="string" default="">
	<cfproperty name="C3158Q" type="string" default="">
	<cfproperty name="CP328Q" type="string" default="">
	<cfproperty name="P3218Q" type="numeric" default="0">
	<cfproperty name="P3228Q" type="numeric" default="0">
	<cfproperty name="P3238Q" type="numeric" default="0">
	<cfproperty name="P3248Q" type="numeric" default="0">
	<cfproperty name="P3258Q" type="numeric" default="0">
	<cfproperty name="C3218Q" type="string" default="">
	<cfproperty name="C3228Q" type="string" default="">
	<cfproperty name="C3238Q" type="string" default="">
	<cfproperty name="C3248Q" type="string" default="">
	<cfproperty name="C3258Q" type="string" default="">
	<cfproperty name="CP338Q" type="string" default="">
	<cfproperty name="P3318Q" type="numeric" default="0">
	<cfproperty name="P3328Q" type="numeric" default="0">
	<cfproperty name="P3338Q" type="numeric" default="0">
	<cfproperty name="P3348Q" type="numeric" default="0">
	<cfproperty name="P3358Q" type="numeric" default="0">
	<cfproperty name="C3318Q" type="string" default="">
	<cfproperty name="C3328Q" type="string" default="">
	<cfproperty name="C3338Q" type="string" default="">
	<cfproperty name="C3348Q" type="string" default="">
	<cfproperty name="C3358Q" type="string" default="">
	<cfproperty name="C1FM8Q" type="numeric" default="0">
	<cfproperty name="C2FM8Q" type="numeric" default="0">
	<cfproperty name="C3FM8Q" type="numeric" default="0">
	<cfproperty name="H1FM8Q" type="numeric" default="0">
	<cfproperty name="H2FM8Q" type="numeric" default="0">
	<cfproperty name="H3FM8Q" type="numeric" default="0">
	<cfproperty name="RNNO8Q" type="string" default="">
	<cfproperty name="CSIT8Q" type="string" default="">
	<cfproperty name="REPR8Q" type="numeric" default="0">
	<cfproperty name="CPUS8Q" type="string" default="">
	<cfproperty name="CPDT8Q" type="numeric" default="0">
	<cfproperty name="CPTM8Q" type="numeric" default="0">
	<cfproperty name="HPUS8Q" type="string" default="">
	<cfproperty name="HPDT8Q" type="numeric" default="0">
	<cfproperty name="HPTM8Q" type="numeric" default="0">
	<cfproperty name="HLPF8Q" type="string" default="">
	<cfproperty name="HLAC8Q" type="string" default="">
	<cfproperty name="HLFG8Q" type="string" default="">
	<cfproperty name="QCUS8Q" type="string" default="">
	<cfproperty name="QCDT8Q" type="numeric" default="0">
	<cfproperty name="QCTM8Q" type="numeric" default="0">
	<cfproperty name="PRPR8Q" type="string" default="">
	<cfproperty name="PRCR8Q" type="string" default="">
	<cfproperty name="LSRD8Q" type="numeric" default="0">
	<cfproperty name="FSRD8Q" type="numeric" default="0">
	<cfproperty name="FSRT8Q" type="numeric" default="0">
	<cfproperty name="MC018Q" type="string" default="">
	<cfproperty name="CP018Q" type="numeric" default="0">
	<cfproperty name="CD018Q" type="numeric" default="0">
	<cfproperty name="VN018Q" type="numeric" default="0">
	<cfproperty name="AC018Q" type="string" default="">
	<cfproperty name="MC028Q" type="string" default="">
	<cfproperty name="CP028Q" type="numeric" default="0">
	<cfproperty name="CD028Q" type="numeric" default="0">
	<cfproperty name="VN028Q" type="numeric" default="0">
	<cfproperty name="AC028Q" type="string" default="">
	<cfproperty name="MC038Q" type="string" default="">
	<cfproperty name="CP038Q" type="numeric" default="0">
	<cfproperty name="CD038Q" type="numeric" default="0">
	<cfproperty name="VN038Q" type="numeric" default="0">
	<cfproperty name="AC038Q" type="string" default="">
	<cfproperty name="MC048Q" type="string" default="">
	<cfproperty name="CP048Q" type="numeric" default="0">
	<cfproperty name="CD048Q" type="numeric" default="0">
	<cfproperty name="VN048Q" type="numeric" default="0">
	<cfproperty name="AC048Q" type="string" default="">
	<cfproperty name="MC058Q" type="string" default="">
	<cfproperty name="CP058Q" type="numeric" default="0">
	<cfproperty name="CD058Q" type="numeric" default="0">
	<cfproperty name="VN058Q" type="numeric" default="0">
	<cfproperty name="AC058Q" type="string" default="">
	<cfproperty name="MC068Q" type="string" default="">
	<cfproperty name="CP068Q" type="numeric" default="0">
	<cfproperty name="CD068Q" type="numeric" default="0">
	<cfproperty name="VN068Q" type="numeric" default="0">
	<cfproperty name="AC068Q" type="string" default="">
	<cfproperty name="MC078Q" type="string" default="">
	<cfproperty name="CP078Q" type="numeric" default="0">
	<cfproperty name="CD078Q" type="numeric" default="0">
	<cfproperty name="VN078Q" type="numeric" default="0">
	<cfproperty name="AC078Q" type="string" default="">
	<cfproperty name="MC088Q" type="string" default="">
	<cfproperty name="CP088Q" type="numeric" default="0">
	<cfproperty name="CD088Q" type="numeric" default="0">
	<cfproperty name="VN088Q" type="numeric" default="0">
	<cfproperty name="AC088Q" type="string" default="">
	<cfproperty name="MC098Q" type="string" default="">
	<cfproperty name="CP098Q" type="numeric" default="0">
	<cfproperty name="CD098Q" type="numeric" default="0">
	<cfproperty name="VN098Q" type="numeric" default="0">
	<cfproperty name="AC098Q" type="string" default="">
	<cfproperty name="ODDP8Q" type="numeric" default="0">
	<cfproperty name="ODAR8Q" type="numeric" default="0">
	<cfproperty name="ODIH8Q" type="numeric" default="0">
	<cfproperty name="RVDP8Q" type="numeric" default="0">
	<cfproperty name="RVAR8Q" type="numeric" default="0">
	<cfproperty name="RVIH8Q" type="numeric" default="0">
	<cfproperty name="ACDP8Q" type="numeric" default="0">
	<cfproperty name="ACAR8Q" type="numeric" default="0">
	<cfproperty name="ACIH8Q" type="numeric" default="0">
	<cfproperty name="VSAB8Q" type="string" default="">
	<cfproperty name="CNRF8Q" type="string" default="">
	<cfproperty name="SRCD8Q" type="string" default="">
	<cfproperty name="QTYR8Q" type="numeric" default="0">
	<cfproperty name="IMPP8Q" type="numeric" default="0">
	<cfproperty name="IMPR8Q" type="numeric" default="0">
	<cfproperty name="MSCD8Q" type="string" default="">
	<cfproperty name="PRUM8Q" type="string" default="">
	<cfproperty name="CVFC8Q" type="numeric" default="0">
	<cfproperty name="CVFO8Q" type="string" default="">
	<cfproperty name="CH018Q" type="string" default="">
	<cfproperty name="CH028Q" type="string" default="">
	<cfproperty name="CH038Q" type="string" default="">
	<cfproperty name="CH048Q" type="string" default="">
	<cfproperty name="CH058Q" type="string" default="">
	<cfproperty name="CH068Q" type="string" default="">
	<cfproperty name="CH078Q" type="string" default="">
	<cfproperty name="CH088Q" type="string" default="">
	<cfproperty name="CH098Q" type="string" default="">
	<cfproperty name="CH108Q" type="string" default="">
	<cfproperty name="VL018Q" type="string" default="">
	<cfproperty name="VL028Q" type="string" default="">
	<cfproperty name="VL038Q" type="string" default="">
	<cfproperty name="VL048Q" type="string" default="">
	<cfproperty name="VL058Q" type="string" default="">
	<cfproperty name="VL068Q" type="string" default="">
	<cfproperty name="VL078Q" type="string" default="">
	<cfproperty name="VL088Q" type="string" default="">
	<cfproperty name="VL098Q" type="string" default="">
	<cfproperty name="VL108Q" type="string" default="">
	<cfproperty name="CVPR8Q" type="string" default="">
	<cfproperty name="CVCR8Q" type="string" default="">
	<cfproperty name="CVCP8Q" type="numeric" default="0">
	<cfproperty name="AECD8Q" type="numeric" default="0">
	<cfproperty name="AUCD8Q" type="numeric" default="0">
	<cfproperty name="SPMT8Q" type="string" default="">
	<cfproperty name="ACIN8Q" type="string" default="">
	<cfproperty name="GLUS8Q" type="string" default="">
	<cfproperty name="GLDT8Q" type="numeric" default="0">
	<cfproperty name="GLTM8Q" type="numeric" default="0">
	<cfproperty name="MSJB8Q" type="numeric" default="0">
	<cfproperty name="MSJL8Q" type="numeric" default="0">
	<cfproperty name="PCDY8Q" type="numeric" default="0">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.CONO8Q = 0;
		variables.JBNO8Q = 0;
		variables.PRCD8Q = "";
		variables.CRCD8Q = "";
		variables.JBRF8Q = "";
		variables.DUDT8Q = 0;
		variables.JBDT8Q = 0;
		variables.ISDT8Q = 0;
		variables.CMDT8Q = 0;
		variables.JSDT8Q = 0;
		variables.JCDT8Q = 0;
		variables.ASCN8Q = 0;
		variables.CTRF8Q = "";
		variables.STCD8Q = "";
		variables.OPSQ8Q = 0;
		variables.PRSH8Q = "";
		variables.CMMT8Q = "";
		variables.VRNO8Q = 0;
		variables.PLDY8Q = 0;
		variables.MTPR8Q = 0;
		variables.LBPR8Q = 0;
		variables.OTPR8Q = 0;
		variables.OVPC8Q = 0;
		variables.OVAM8Q = 0;
		variables.OVDL8Q = 0;
		variables.SBDL8Q = 0;
		variables.STMC8Q = 0;
		variables.SBMY8Q = 0;
		variables.MADT8Q = 0;
		variables.TLIS8Q = 0;
		variables.IS018Q = 0;
		variables.IS028Q = 0;
		variables.IS038Q = 0;
		variables.IS048Q = 0;
		variables.IS058Q = 0;
		variables.IS068Q = 0;
		variables.IS078Q = 0;
		variables.IS088Q = 0;
		variables.IS098Q = 0;
		variables.IS108Q = 0;
		variables.IS118Q = 0;
		variables.IS128Q = 0;
		variables.TLWP8Q = 0;
		variables.WP018Q = 0;
		variables.WP028Q = 0;
		variables.WP038Q = 0;
		variables.WP048Q = 0;
		variables.WP058Q = 0;
		variables.WP068Q = 0;
		variables.WP078Q = 0;
		variables.WP088Q = 0;
		variables.WP098Q = 0;
		variables.WP108Q = 0;
		variables.WP118Q = 0;
		variables.WP128Q = 0;
		variables.TLSH8Q = 0;
		variables.SH018Q = 0;
		variables.SH028Q = 0;
		variables.SH038Q = 0;
		variables.SH048Q = 0;
		variables.SH058Q = 0;
		variables.SH068Q = 0;
		variables.SH078Q = 0;
		variables.SH088Q = 0;
		variables.SH098Q = 0;
		variables.SH108Q = 0;
		variables.SH118Q = 0;
		variables.SH128Q = 0;
		variables.TLRC8Q = 0;
		variables.RC018Q = 0;
		variables.RC028Q = 0;
		variables.RC038Q = 0;
		variables.RC048Q = 0;
		variables.RC058Q = 0;
		variables.RC068Q = 0;
		variables.RC078Q = 0;
		variables.RC088Q = 0;
		variables.RC098Q = 0;
		variables.RC108Q = 0;
		variables.RC118Q = 0;
		variables.RC128Q = 0;
		variables.TLAA8Q = 0;
		variables.AA018Q = 0;
		variables.AA028Q = 0;
		variables.AA038Q = 0;
		variables.AA048Q = 0;
		variables.AA058Q = 0;
		variables.AA068Q = 0;
		variables.AA078Q = 0;
		variables.AA088Q = 0;
		variables.AA098Q = 0;
		variables.AA108Q = 0;
		variables.AA118Q = 0;
		variables.AA128Q = 0;
		variables.TLAJ8Q = 0;
		variables.AJ018Q = 0;
		variables.AJ028Q = 0;
		variables.AJ038Q = 0;
		variables.AJ048Q = 0;
		variables.AJ058Q = 0;
		variables.AJ068Q = 0;
		variables.AJ078Q = 0;
		variables.AJ088Q = 0;
		variables.AJ098Q = 0;
		variables.AJ108Q = 0;
		variables.AJ118Q = 0;
		variables.AJ128Q = 0;
		variables.TLOP8Q = 0;
		variables.OP018Q = 0;
		variables.OP028Q = 0;
		variables.OP038Q = 0;
		variables.OP048Q = 0;
		variables.OP058Q = 0;
		variables.OP068Q = 0;
		variables.OP078Q = 0;
		variables.OP088Q = 0;
		variables.OP098Q = 0;
		variables.OP108Q = 0;
		variables.OP118Q = 0;
		variables.OP128Q = 0;
		variables.CRUS8Q = "";
		variables.CRDT8Q = 0;
		variables.CRTM8Q = 0;
		variables.MNUS8Q = "";
		variables.MNDT8Q = 0;
		variables.MNTM8Q = 0;
		variables.CLSD8Q = "";
		variables.CLDT8Q = 0;
		variables.CTNO8Q = 0;
		variables.CTL28Q = "";
		variables.CTL38Q = "";
		variables.CTL48Q = "";
		variables.CTL58Q = "";
		variables.CTL68Q = "";
		variables.PRMR8Q = "";
		variables.PROP8Q = "";
		variables.MKRF8Q = "";
		variables.MKCD8Q = "";
		variables.MRPR8Q = "";
		variables.PDTP8Q = "";
		variables.UPCS8Q = "";
		variables.ACDT8Q = 0;
		variables.ACRF8Q = "";
		variables.ESCS8Q = 0;
		variables.JBBT8Q = 0;
		variables.COCD8Q = "";
		variables.CLW18Q = "";
		variables.CLB18Q = "";
		variables.CLD18Q = "";
		variables.CLI18Q = "";
		variables.CLM18Q = "";
		variables.CLW28Q = "";
		variables.CLB28Q = "";
		variables.CLD28Q = "";
		variables.CLI28Q = "";
		variables.CLM28Q = "";
		variables.CLW38Q = "";
		variables.CLB38Q = "";
		variables.CLD38Q = "";
		variables.CLI38Q = "";
		variables.CLM38Q = "";
		variables.CP118Q = "";
		variables.P1118Q = 0;
		variables.P1128Q = 0;
		variables.P1138Q = 0;
		variables.P1148Q = 0;
		variables.P1158Q = 0;
		variables.C1118Q = "";
		variables.C1128Q = "";
		variables.C1138Q = "";
		variables.C1148Q = "";
		variables.C1158Q = "";
		variables.CP128Q = "";
		variables.P1218Q = 0;
		variables.P1228Q = 0;
		variables.P1238Q = 0;
		variables.P1248Q = 0;
		variables.P1258Q = 0;
		variables.C1218Q = "";
		variables.C1228Q = "";
		variables.C1238Q = "";
		variables.C1248Q = "";
		variables.C1258Q = "";
		variables.CP138Q = "";
		variables.P1318Q = 0;
		variables.P1328Q = 0;
		variables.P1338Q = 0;
		variables.P1348Q = 0;
		variables.P1358Q = 0;
		variables.C1318Q = "";
		variables.C1328Q = "";
		variables.C1338Q = "";
		variables.C1348Q = "";
		variables.C1358Q = "";
		variables.CP218Q = "";
		variables.P2118Q = 0;
		variables.P2128Q = 0;
		variables.P2138Q = 0;
		variables.P2148Q = 0;
		variables.P2158Q = 0;
		variables.C2118Q = "";
		variables.C2128Q = "";
		variables.C2138Q = "";
		variables.C2148Q = "";
		variables.C2158Q = "";
		variables.CP228Q = "";
		variables.P2218Q = 0;
		variables.P2228Q = 0;
		variables.P2238Q = 0;
		variables.P2248Q = 0;
		variables.P2258Q = 0;
		variables.C2218Q = "";
		variables.C2228Q = "";
		variables.C2238Q = "";
		variables.C2248Q = "";
		variables.C2258Q = "";
		variables.CP238Q = "";
		variables.P2318Q = 0;
		variables.P2328Q = 0;
		variables.P2338Q = 0;
		variables.P2348Q = 0;
		variables.P2358Q = 0;
		variables.C2318Q = "";
		variables.C2328Q = "";
		variables.C2338Q = "";
		variables.C2348Q = "";
		variables.C2358Q = "";
		variables.CP318Q = "";
		variables.P3118Q = 0;
		variables.P3128Q = 0;
		variables.P3138Q = 0;
		variables.P3148Q = 0;
		variables.P3158Q = 0;
		variables.C3118Q = "";
		variables.C3128Q = "";
		variables.C3138Q = "";
		variables.C3148Q = "";
		variables.C3158Q = "";
		variables.CP328Q = "";
		variables.P3218Q = 0;
		variables.P3228Q = 0;
		variables.P3238Q = 0;
		variables.P3248Q = 0;
		variables.P3258Q = 0;
		variables.C3218Q = "";
		variables.C3228Q = "";
		variables.C3238Q = "";
		variables.C3248Q = "";
		variables.C3258Q = "";
		variables.CP338Q = "";
		variables.P3318Q = 0;
		variables.P3328Q = 0;
		variables.P3338Q = 0;
		variables.P3348Q = 0;
		variables.P3358Q = 0;
		variables.C3318Q = "";
		variables.C3328Q = "";
		variables.C3338Q = "";
		variables.C3348Q = "";
		variables.C3358Q = "";
		variables.C1FM8Q = 0;
		variables.C2FM8Q = 0;
		variables.C3FM8Q = 0;
		variables.H1FM8Q = 0;
		variables.H2FM8Q = 0;
		variables.H3FM8Q = 0;
		variables.RNNO8Q = "";
		variables.CSIT8Q = "";
		variables.REPR8Q = 0;
		variables.CPUS8Q = "";
		variables.CPDT8Q = 0;
		variables.CPTM8Q = 0;
		variables.HPUS8Q = "";
		variables.HPDT8Q = 0;
		variables.HPTM8Q = 0;
		variables.HLPF8Q = "";
		variables.HLAC8Q = "";
		variables.HLFG8Q = "";
		variables.QCUS8Q = "";
		variables.QCDT8Q = 0;
		variables.QCTM8Q = 0;
		variables.PRPR8Q = "";
		variables.PRCR8Q = "";
		variables.LSRD8Q = 0;
		variables.FSRD8Q = 0;
		variables.FSRT8Q = 0;
		variables.MC018Q = "";
		variables.CP018Q = 0;
		variables.CD018Q = 0;
		variables.VN018Q = 0;
		variables.AC018Q = "";
		variables.MC028Q = "";
		variables.CP028Q = 0;
		variables.CD028Q = 0;
		variables.VN028Q = 0;
		variables.AC028Q = "";
		variables.MC038Q = "";
		variables.CP038Q = 0;
		variables.CD038Q = 0;
		variables.VN038Q = 0;
		variables.AC038Q = "";
		variables.MC048Q = "";
		variables.CP048Q = 0;
		variables.CD048Q = 0;
		variables.VN048Q = 0;
		variables.AC048Q = "";
		variables.MC058Q = "";
		variables.CP058Q = 0;
		variables.CD058Q = 0;
		variables.VN058Q = 0;
		variables.AC058Q = "";
		variables.MC068Q = "";
		variables.CP068Q = 0;
		variables.CD068Q = 0;
		variables.VN068Q = 0;
		variables.AC068Q = "";
		variables.MC078Q = "";
		variables.CP078Q = 0;
		variables.CD078Q = 0;
		variables.VN078Q = 0;
		variables.AC078Q = "";
		variables.MC088Q = "";
		variables.CP088Q = 0;
		variables.CD088Q = 0;
		variables.VN088Q = 0;
		variables.AC088Q = "";
		variables.MC098Q = "";
		variables.CP098Q = 0;
		variables.CD098Q = 0;
		variables.VN098Q = 0;
		variables.AC098Q = "";
		variables.ODDP8Q = 0;
		variables.ODAR8Q = 0;
		variables.ODIH8Q = 0;
		variables.RVDP8Q = 0;
		variables.RVAR8Q = 0;
		variables.RVIH8Q = 0;
		variables.ACDP8Q = 0;
		variables.ACAR8Q = 0;
		variables.ACIH8Q = 0;
		variables.VSAB8Q = "";
		variables.CNRF8Q = "";
		variables.SRCD8Q = "";
		variables.QTYR8Q = 0;
		variables.IMPP8Q = 0;
		variables.IMPR8Q = 0;
		variables.MSCD8Q = "";
		variables.PRUM8Q = "";
		variables.CVFC8Q = 0;
		variables.CVFO8Q = "";
		variables.CH018Q = "";
		variables.CH028Q = "";
		variables.CH038Q = "";
		variables.CH048Q = "";
		variables.CH058Q = "";
		variables.CH068Q = "";
		variables.CH078Q = "";
		variables.CH088Q = "";
		variables.CH098Q = "";
		variables.CH108Q = "";
		variables.VL018Q = "";
		variables.VL028Q = "";
		variables.VL038Q = "";
		variables.VL048Q = "";
		variables.VL058Q = "";
		variables.VL068Q = "";
		variables.VL078Q = "";
		variables.VL088Q = "";
		variables.VL098Q = "";
		variables.VL108Q = "";
		variables.CVPR8Q = "";
		variables.CVCR8Q = "";
		variables.CVCP8Q = 0;
		variables.AECD8Q = 0;
		variables.AUCD8Q = 0;
		variables.SPMT8Q = "";
		variables.ACIN8Q = "";
		variables.GLUS8Q = "";
		variables.GLDT8Q = 0;
		variables.GLTM8Q = 0;
		variables.MSJB8Q = 0;
		variables.MSJL8Q = 0;
		variables.PCDY8Q = 0;
	</cfscript>

	<cffunction name="init" output="false" returntype="JOBSUM0">
		<cfreturn this>
	</cffunction>
	<cffunction name="getCONO8Q" output="false" access="public" returntype="any">
		<cfreturn variables.CONO8Q>
	</cffunction>

	<cffunction name="setCONO8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CONO8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getJBNO8Q" output="false" access="public" returntype="any">
		<cfreturn variables.JBNO8Q>
	</cffunction>

	<cffunction name="setJBNO8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.JBNO8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPRCD8Q" output="false" access="public" returntype="any">
		<cfreturn variables.PRCD8Q>
	</cffunction>

	<cffunction name="setPRCD8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.PRCD8Q = arguments.val>
	</cffunction>

	<cffunction name="getCRCD8Q" output="false" access="public" returntype="any">
		<cfreturn variables.CRCD8Q>
	</cffunction>

	<cffunction name="setCRCD8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CRCD8Q = arguments.val>
	</cffunction>

	<cffunction name="getJBRF8Q" output="false" access="public" returntype="any">
		<cfreturn variables.JBRF8Q>
	</cffunction>

	<cffunction name="setJBRF8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.JBRF8Q = arguments.val>
	</cffunction>

	<cffunction name="getDUDT8Q" output="false" access="public" returntype="any">
		<cfreturn variables.DUDT8Q>
	</cffunction>

	<cffunction name="setDUDT8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.DUDT8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getJBDT8Q" output="false" access="public" returntype="any">
		<cfreturn variables.JBDT8Q>
	</cffunction>

	<cffunction name="setJBDT8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.JBDT8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getISDT8Q" output="false" access="public" returntype="any">
		<cfreturn variables.ISDT8Q>
	</cffunction>

	<cffunction name="setISDT8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ISDT8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCMDT8Q" output="false" access="public" returntype="any">
		<cfreturn variables.CMDT8Q>
	</cffunction>

	<cffunction name="setCMDT8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CMDT8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getJSDT8Q" output="false" access="public" returntype="any">
		<cfreturn variables.JSDT8Q>
	</cffunction>

	<cffunction name="setJSDT8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.JSDT8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getJCDT8Q" output="false" access="public" returntype="any">
		<cfreturn variables.JCDT8Q>
	</cffunction>

	<cffunction name="setJCDT8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.JCDT8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getASCN8Q" output="false" access="public" returntype="any">
		<cfreturn variables.ASCN8Q>
	</cffunction>

	<cffunction name="setASCN8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ASCN8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCTRF8Q" output="false" access="public" returntype="any">
		<cfreturn variables.CTRF8Q>
	</cffunction>

	<cffunction name="setCTRF8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CTRF8Q = arguments.val>
	</cffunction>

	<cffunction name="getSTCD8Q" output="false" access="public" returntype="any">
		<cfreturn variables.STCD8Q>
	</cffunction>

	<cffunction name="setSTCD8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.STCD8Q = arguments.val>
	</cffunction>

	<cffunction name="getOPSQ8Q" output="false" access="public" returntype="any">
		<cfreturn variables.OPSQ8Q>
	</cffunction>

	<cffunction name="setOPSQ8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.OPSQ8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPRSH8Q" output="false" access="public" returntype="any">
		<cfreturn variables.PRSH8Q>
	</cffunction>

	<cffunction name="setPRSH8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.PRSH8Q = arguments.val>
	</cffunction>

	<cffunction name="getCMMT8Q" output="false" access="public" returntype="any">
		<cfreturn variables.CMMT8Q>
	</cffunction>

	<cffunction name="setCMMT8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CMMT8Q = arguments.val>
	</cffunction>

	<cffunction name="getVRNO8Q" output="false" access="public" returntype="any">
		<cfreturn variables.VRNO8Q>
	</cffunction>

	<cffunction name="setVRNO8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.VRNO8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPLDY8Q" output="false" access="public" returntype="any">
		<cfreturn variables.PLDY8Q>
	</cffunction>

	<cffunction name="setPLDY8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PLDY8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getMTPR8Q" output="false" access="public" returntype="any">
		<cfreturn variables.MTPR8Q>
	</cffunction>

	<cffunction name="setMTPR8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.MTPR8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLBPR8Q" output="false" access="public" returntype="any">
		<cfreturn variables.LBPR8Q>
	</cffunction>

	<cffunction name="setLBPR8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.LBPR8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getOTPR8Q" output="false" access="public" returntype="any">
		<cfreturn variables.OTPR8Q>
	</cffunction>

	<cffunction name="setOTPR8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.OTPR8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getOVPC8Q" output="false" access="public" returntype="any">
		<cfreturn variables.OVPC8Q>
	</cffunction>

	<cffunction name="setOVPC8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.OVPC8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getOVAM8Q" output="false" access="public" returntype="any">
		<cfreturn variables.OVAM8Q>
	</cffunction>

	<cffunction name="setOVAM8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.OVAM8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getOVDL8Q" output="false" access="public" returntype="any">
		<cfreturn variables.OVDL8Q>
	</cffunction>

	<cffunction name="setOVDL8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.OVDL8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSBDL8Q" output="false" access="public" returntype="any">
		<cfreturn variables.SBDL8Q>
	</cffunction>

	<cffunction name="setSBDL8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SBDL8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSTMC8Q" output="false" access="public" returntype="any">
		<cfreturn variables.STMC8Q>
	</cffunction>

	<cffunction name="setSTMC8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.STMC8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSBMY8Q" output="false" access="public" returntype="any">
		<cfreturn variables.SBMY8Q>
	</cffunction>

	<cffunction name="setSBMY8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SBMY8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getMADT8Q" output="false" access="public" returntype="any">
		<cfreturn variables.MADT8Q>
	</cffunction>

	<cffunction name="setMADT8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.MADT8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLIS8Q" output="false" access="public" returntype="any">
		<cfreturn variables.TLIS8Q>
	</cffunction>

	<cffunction name="setTLIS8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLIS8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getIS018Q" output="false" access="public" returntype="any">
		<cfreturn variables.IS018Q>
	</cffunction>

	<cffunction name="setIS018Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.IS018Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getIS028Q" output="false" access="public" returntype="any">
		<cfreturn variables.IS028Q>
	</cffunction>

	<cffunction name="setIS028Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.IS028Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getIS038Q" output="false" access="public" returntype="any">
		<cfreturn variables.IS038Q>
	</cffunction>

	<cffunction name="setIS038Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.IS038Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getIS048Q" output="false" access="public" returntype="any">
		<cfreturn variables.IS048Q>
	</cffunction>

	<cffunction name="setIS048Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.IS048Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getIS058Q" output="false" access="public" returntype="any">
		<cfreturn variables.IS058Q>
	</cffunction>

	<cffunction name="setIS058Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.IS058Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getIS068Q" output="false" access="public" returntype="any">
		<cfreturn variables.IS068Q>
	</cffunction>

	<cffunction name="setIS068Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.IS068Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getIS078Q" output="false" access="public" returntype="any">
		<cfreturn variables.IS078Q>
	</cffunction>

	<cffunction name="setIS078Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.IS078Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getIS088Q" output="false" access="public" returntype="any">
		<cfreturn variables.IS088Q>
	</cffunction>

	<cffunction name="setIS088Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.IS088Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getIS098Q" output="false" access="public" returntype="any">
		<cfreturn variables.IS098Q>
	</cffunction>

	<cffunction name="setIS098Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.IS098Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getIS108Q" output="false" access="public" returntype="any">
		<cfreturn variables.IS108Q>
	</cffunction>

	<cffunction name="setIS108Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.IS108Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getIS118Q" output="false" access="public" returntype="any">
		<cfreturn variables.IS118Q>
	</cffunction>

	<cffunction name="setIS118Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.IS118Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getIS128Q" output="false" access="public" returntype="any">
		<cfreturn variables.IS128Q>
	</cffunction>

	<cffunction name="setIS128Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.IS128Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLWP8Q" output="false" access="public" returntype="any">
		<cfreturn variables.TLWP8Q>
	</cffunction>

	<cffunction name="setTLWP8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLWP8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getWP018Q" output="false" access="public" returntype="any">
		<cfreturn variables.WP018Q>
	</cffunction>

	<cffunction name="setWP018Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.WP018Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getWP028Q" output="false" access="public" returntype="any">
		<cfreturn variables.WP028Q>
	</cffunction>

	<cffunction name="setWP028Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.WP028Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getWP038Q" output="false" access="public" returntype="any">
		<cfreturn variables.WP038Q>
	</cffunction>

	<cffunction name="setWP038Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.WP038Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getWP048Q" output="false" access="public" returntype="any">
		<cfreturn variables.WP048Q>
	</cffunction>

	<cffunction name="setWP048Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.WP048Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getWP058Q" output="false" access="public" returntype="any">
		<cfreturn variables.WP058Q>
	</cffunction>

	<cffunction name="setWP058Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.WP058Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getWP068Q" output="false" access="public" returntype="any">
		<cfreturn variables.WP068Q>
	</cffunction>

	<cffunction name="setWP068Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.WP068Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getWP078Q" output="false" access="public" returntype="any">
		<cfreturn variables.WP078Q>
	</cffunction>

	<cffunction name="setWP078Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.WP078Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getWP088Q" output="false" access="public" returntype="any">
		<cfreturn variables.WP088Q>
	</cffunction>

	<cffunction name="setWP088Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.WP088Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getWP098Q" output="false" access="public" returntype="any">
		<cfreturn variables.WP098Q>
	</cffunction>

	<cffunction name="setWP098Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.WP098Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getWP108Q" output="false" access="public" returntype="any">
		<cfreturn variables.WP108Q>
	</cffunction>

	<cffunction name="setWP108Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.WP108Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getWP118Q" output="false" access="public" returntype="any">
		<cfreturn variables.WP118Q>
	</cffunction>

	<cffunction name="setWP118Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.WP118Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getWP128Q" output="false" access="public" returntype="any">
		<cfreturn variables.WP128Q>
	</cffunction>

	<cffunction name="setWP128Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.WP128Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLSH8Q" output="false" access="public" returntype="any">
		<cfreturn variables.TLSH8Q>
	</cffunction>

	<cffunction name="setTLSH8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLSH8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSH018Q" output="false" access="public" returntype="any">
		<cfreturn variables.SH018Q>
	</cffunction>

	<cffunction name="setSH018Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SH018Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSH028Q" output="false" access="public" returntype="any">
		<cfreturn variables.SH028Q>
	</cffunction>

	<cffunction name="setSH028Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SH028Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSH038Q" output="false" access="public" returntype="any">
		<cfreturn variables.SH038Q>
	</cffunction>

	<cffunction name="setSH038Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SH038Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSH048Q" output="false" access="public" returntype="any">
		<cfreturn variables.SH048Q>
	</cffunction>

	<cffunction name="setSH048Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SH048Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSH058Q" output="false" access="public" returntype="any">
		<cfreturn variables.SH058Q>
	</cffunction>

	<cffunction name="setSH058Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SH058Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSH068Q" output="false" access="public" returntype="any">
		<cfreturn variables.SH068Q>
	</cffunction>

	<cffunction name="setSH068Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SH068Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSH078Q" output="false" access="public" returntype="any">
		<cfreturn variables.SH078Q>
	</cffunction>

	<cffunction name="setSH078Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SH078Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSH088Q" output="false" access="public" returntype="any">
		<cfreturn variables.SH088Q>
	</cffunction>

	<cffunction name="setSH088Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SH088Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSH098Q" output="false" access="public" returntype="any">
		<cfreturn variables.SH098Q>
	</cffunction>

	<cffunction name="setSH098Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SH098Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSH108Q" output="false" access="public" returntype="any">
		<cfreturn variables.SH108Q>
	</cffunction>

	<cffunction name="setSH108Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SH108Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSH118Q" output="false" access="public" returntype="any">
		<cfreturn variables.SH118Q>
	</cffunction>

	<cffunction name="setSH118Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SH118Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSH128Q" output="false" access="public" returntype="any">
		<cfreturn variables.SH128Q>
	</cffunction>

	<cffunction name="setSH128Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SH128Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLRC8Q" output="false" access="public" returntype="any">
		<cfreturn variables.TLRC8Q>
	</cffunction>

	<cffunction name="setTLRC8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLRC8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getRC018Q" output="false" access="public" returntype="any">
		<cfreturn variables.RC018Q>
	</cffunction>

	<cffunction name="setRC018Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.RC018Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getRC028Q" output="false" access="public" returntype="any">
		<cfreturn variables.RC028Q>
	</cffunction>

	<cffunction name="setRC028Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.RC028Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getRC038Q" output="false" access="public" returntype="any">
		<cfreturn variables.RC038Q>
	</cffunction>

	<cffunction name="setRC038Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.RC038Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getRC048Q" output="false" access="public" returntype="any">
		<cfreturn variables.RC048Q>
	</cffunction>

	<cffunction name="setRC048Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.RC048Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getRC058Q" output="false" access="public" returntype="any">
		<cfreturn variables.RC058Q>
	</cffunction>

	<cffunction name="setRC058Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.RC058Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getRC068Q" output="false" access="public" returntype="any">
		<cfreturn variables.RC068Q>
	</cffunction>

	<cffunction name="setRC068Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.RC068Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getRC078Q" output="false" access="public" returntype="any">
		<cfreturn variables.RC078Q>
	</cffunction>

	<cffunction name="setRC078Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.RC078Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getRC088Q" output="false" access="public" returntype="any">
		<cfreturn variables.RC088Q>
	</cffunction>

	<cffunction name="setRC088Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.RC088Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getRC098Q" output="false" access="public" returntype="any">
		<cfreturn variables.RC098Q>
	</cffunction>

	<cffunction name="setRC098Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.RC098Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getRC108Q" output="false" access="public" returntype="any">
		<cfreturn variables.RC108Q>
	</cffunction>

	<cffunction name="setRC108Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.RC108Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getRC118Q" output="false" access="public" returntype="any">
		<cfreturn variables.RC118Q>
	</cffunction>

	<cffunction name="setRC118Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.RC118Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getRC128Q" output="false" access="public" returntype="any">
		<cfreturn variables.RC128Q>
	</cffunction>

	<cffunction name="setRC128Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.RC128Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLAA8Q" output="false" access="public" returntype="any">
		<cfreturn variables.TLAA8Q>
	</cffunction>

	<cffunction name="setTLAA8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLAA8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAA018Q" output="false" access="public" returntype="any">
		<cfreturn variables.AA018Q>
	</cffunction>

	<cffunction name="setAA018Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AA018Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAA028Q" output="false" access="public" returntype="any">
		<cfreturn variables.AA028Q>
	</cffunction>

	<cffunction name="setAA028Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AA028Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAA038Q" output="false" access="public" returntype="any">
		<cfreturn variables.AA038Q>
	</cffunction>

	<cffunction name="setAA038Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AA038Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAA048Q" output="false" access="public" returntype="any">
		<cfreturn variables.AA048Q>
	</cffunction>

	<cffunction name="setAA048Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AA048Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAA058Q" output="false" access="public" returntype="any">
		<cfreturn variables.AA058Q>
	</cffunction>

	<cffunction name="setAA058Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AA058Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAA068Q" output="false" access="public" returntype="any">
		<cfreturn variables.AA068Q>
	</cffunction>

	<cffunction name="setAA068Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AA068Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAA078Q" output="false" access="public" returntype="any">
		<cfreturn variables.AA078Q>
	</cffunction>

	<cffunction name="setAA078Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AA078Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAA088Q" output="false" access="public" returntype="any">
		<cfreturn variables.AA088Q>
	</cffunction>

	<cffunction name="setAA088Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AA088Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAA098Q" output="false" access="public" returntype="any">
		<cfreturn variables.AA098Q>
	</cffunction>

	<cffunction name="setAA098Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AA098Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAA108Q" output="false" access="public" returntype="any">
		<cfreturn variables.AA108Q>
	</cffunction>

	<cffunction name="setAA108Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AA108Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAA118Q" output="false" access="public" returntype="any">
		<cfreturn variables.AA118Q>
	</cffunction>

	<cffunction name="setAA118Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AA118Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAA128Q" output="false" access="public" returntype="any">
		<cfreturn variables.AA128Q>
	</cffunction>

	<cffunction name="setAA128Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AA128Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLAJ8Q" output="false" access="public" returntype="any">
		<cfreturn variables.TLAJ8Q>
	</cffunction>

	<cffunction name="setTLAJ8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLAJ8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAJ018Q" output="false" access="public" returntype="any">
		<cfreturn variables.AJ018Q>
	</cffunction>

	<cffunction name="setAJ018Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AJ018Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAJ028Q" output="false" access="public" returntype="any">
		<cfreturn variables.AJ028Q>
	</cffunction>

	<cffunction name="setAJ028Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AJ028Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAJ038Q" output="false" access="public" returntype="any">
		<cfreturn variables.AJ038Q>
	</cffunction>

	<cffunction name="setAJ038Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AJ038Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAJ048Q" output="false" access="public" returntype="any">
		<cfreturn variables.AJ048Q>
	</cffunction>

	<cffunction name="setAJ048Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AJ048Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAJ058Q" output="false" access="public" returntype="any">
		<cfreturn variables.AJ058Q>
	</cffunction>

	<cffunction name="setAJ058Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AJ058Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAJ068Q" output="false" access="public" returntype="any">
		<cfreturn variables.AJ068Q>
	</cffunction>

	<cffunction name="setAJ068Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AJ068Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAJ078Q" output="false" access="public" returntype="any">
		<cfreturn variables.AJ078Q>
	</cffunction>

	<cffunction name="setAJ078Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AJ078Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAJ088Q" output="false" access="public" returntype="any">
		<cfreturn variables.AJ088Q>
	</cffunction>

	<cffunction name="setAJ088Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AJ088Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAJ098Q" output="false" access="public" returntype="any">
		<cfreturn variables.AJ098Q>
	</cffunction>

	<cffunction name="setAJ098Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AJ098Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAJ108Q" output="false" access="public" returntype="any">
		<cfreturn variables.AJ108Q>
	</cffunction>

	<cffunction name="setAJ108Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AJ108Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAJ118Q" output="false" access="public" returntype="any">
		<cfreturn variables.AJ118Q>
	</cffunction>

	<cffunction name="setAJ118Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AJ118Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAJ128Q" output="false" access="public" returntype="any">
		<cfreturn variables.AJ128Q>
	</cffunction>

	<cffunction name="setAJ128Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AJ128Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTLOP8Q" output="false" access="public" returntype="any">
		<cfreturn variables.TLOP8Q>
	</cffunction>

	<cffunction name="setTLOP8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.TLOP8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getOP018Q" output="false" access="public" returntype="any">
		<cfreturn variables.OP018Q>
	</cffunction>

	<cffunction name="setOP018Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.OP018Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getOP028Q" output="false" access="public" returntype="any">
		<cfreturn variables.OP028Q>
	</cffunction>

	<cffunction name="setOP028Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.OP028Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getOP038Q" output="false" access="public" returntype="any">
		<cfreturn variables.OP038Q>
	</cffunction>

	<cffunction name="setOP038Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.OP038Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getOP048Q" output="false" access="public" returntype="any">
		<cfreturn variables.OP048Q>
	</cffunction>

	<cffunction name="setOP048Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.OP048Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getOP058Q" output="false" access="public" returntype="any">
		<cfreturn variables.OP058Q>
	</cffunction>

	<cffunction name="setOP058Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.OP058Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getOP068Q" output="false" access="public" returntype="any">
		<cfreturn variables.OP068Q>
	</cffunction>

	<cffunction name="setOP068Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.OP068Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getOP078Q" output="false" access="public" returntype="any">
		<cfreturn variables.OP078Q>
	</cffunction>

	<cffunction name="setOP078Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.OP078Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getOP088Q" output="false" access="public" returntype="any">
		<cfreturn variables.OP088Q>
	</cffunction>

	<cffunction name="setOP088Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.OP088Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getOP098Q" output="false" access="public" returntype="any">
		<cfreturn variables.OP098Q>
	</cffunction>

	<cffunction name="setOP098Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.OP098Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getOP108Q" output="false" access="public" returntype="any">
		<cfreturn variables.OP108Q>
	</cffunction>

	<cffunction name="setOP108Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.OP108Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getOP118Q" output="false" access="public" returntype="any">
		<cfreturn variables.OP118Q>
	</cffunction>

	<cffunction name="setOP118Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.OP118Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getOP128Q" output="false" access="public" returntype="any">
		<cfreturn variables.OP128Q>
	</cffunction>

	<cffunction name="setOP128Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.OP128Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCRUS8Q" output="false" access="public" returntype="any">
		<cfreturn variables.CRUS8Q>
	</cffunction>

	<cffunction name="setCRUS8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CRUS8Q = arguments.val>
	</cffunction>

	<cffunction name="getCRDT8Q" output="false" access="public" returntype="any">
		<cfreturn variables.CRDT8Q>
	</cffunction>

	<cffunction name="setCRDT8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CRDT8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCRTM8Q" output="false" access="public" returntype="any">
		<cfreturn variables.CRTM8Q>
	</cffunction>

	<cffunction name="setCRTM8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CRTM8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getMNUS8Q" output="false" access="public" returntype="any">
		<cfreturn variables.MNUS8Q>
	</cffunction>

	<cffunction name="setMNUS8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.MNUS8Q = arguments.val>
	</cffunction>

	<cffunction name="getMNDT8Q" output="false" access="public" returntype="any">
		<cfreturn variables.MNDT8Q>
	</cffunction>

	<cffunction name="setMNDT8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.MNDT8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getMNTM8Q" output="false" access="public" returntype="any">
		<cfreturn variables.MNTM8Q>
	</cffunction>

	<cffunction name="setMNTM8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.MNTM8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCLSD8Q" output="false" access="public" returntype="any">
		<cfreturn variables.CLSD8Q>
	</cffunction>

	<cffunction name="setCLSD8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CLSD8Q = arguments.val>
	</cffunction>

	<cffunction name="getCLDT8Q" output="false" access="public" returntype="any">
		<cfreturn variables.CLDT8Q>
	</cffunction>

	<cffunction name="setCLDT8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CLDT8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCTNO8Q" output="false" access="public" returntype="any">
		<cfreturn variables.CTNO8Q>
	</cffunction>

	<cffunction name="setCTNO8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CTNO8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCTL28Q" output="false" access="public" returntype="any">
		<cfreturn variables.CTL28Q>
	</cffunction>

	<cffunction name="setCTL28Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CTL28Q = arguments.val>
	</cffunction>

	<cffunction name="getCTL38Q" output="false" access="public" returntype="any">
		<cfreturn variables.CTL38Q>
	</cffunction>

	<cffunction name="setCTL38Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CTL38Q = arguments.val>
	</cffunction>

	<cffunction name="getCTL48Q" output="false" access="public" returntype="any">
		<cfreturn variables.CTL48Q>
	</cffunction>

	<cffunction name="setCTL48Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CTL48Q = arguments.val>
	</cffunction>

	<cffunction name="getCTL58Q" output="false" access="public" returntype="any">
		<cfreturn variables.CTL58Q>
	</cffunction>

	<cffunction name="setCTL58Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CTL58Q = arguments.val>
	</cffunction>

	<cffunction name="getCTL68Q" output="false" access="public" returntype="any">
		<cfreturn variables.CTL68Q>
	</cffunction>

	<cffunction name="setCTL68Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CTL68Q = arguments.val>
	</cffunction>

	<cffunction name="getPRMR8Q" output="false" access="public" returntype="any">
		<cfreturn variables.PRMR8Q>
	</cffunction>

	<cffunction name="setPRMR8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.PRMR8Q = arguments.val>
	</cffunction>

	<cffunction name="getPROP8Q" output="false" access="public" returntype="any">
		<cfreturn variables.PROP8Q>
	</cffunction>

	<cffunction name="setPROP8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.PROP8Q = arguments.val>
	</cffunction>

	<cffunction name="getMKRF8Q" output="false" access="public" returntype="any">
		<cfreturn variables.MKRF8Q>
	</cffunction>

	<cffunction name="setMKRF8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.MKRF8Q = arguments.val>
	</cffunction>

	<cffunction name="getMKCD8Q" output="false" access="public" returntype="any">
		<cfreturn variables.MKCD8Q>
	</cffunction>

	<cffunction name="setMKCD8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.MKCD8Q = arguments.val>
	</cffunction>

	<cffunction name="getMRPR8Q" output="false" access="public" returntype="any">
		<cfreturn variables.MRPR8Q>
	</cffunction>

	<cffunction name="setMRPR8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.MRPR8Q = arguments.val>
	</cffunction>

	<cffunction name="getPDTP8Q" output="false" access="public" returntype="any">
		<cfreturn variables.PDTP8Q>
	</cffunction>

	<cffunction name="setPDTP8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.PDTP8Q = arguments.val>
	</cffunction>

	<cffunction name="getUPCS8Q" output="false" access="public" returntype="any">
		<cfreturn variables.UPCS8Q>
	</cffunction>

	<cffunction name="setUPCS8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.UPCS8Q = arguments.val>
	</cffunction>

	<cffunction name="getACDT8Q" output="false" access="public" returntype="any">
		<cfreturn variables.ACDT8Q>
	</cffunction>

	<cffunction name="setACDT8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ACDT8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getACRF8Q" output="false" access="public" returntype="any">
		<cfreturn variables.ACRF8Q>
	</cffunction>

	<cffunction name="setACRF8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ACRF8Q = arguments.val>
	</cffunction>

	<cffunction name="getESCS8Q" output="false" access="public" returntype="any">
		<cfreturn variables.ESCS8Q>
	</cffunction>

	<cffunction name="setESCS8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ESCS8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getJBBT8Q" output="false" access="public" returntype="any">
		<cfreturn variables.JBBT8Q>
	</cffunction>

	<cffunction name="setJBBT8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.JBBT8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCOCD8Q" output="false" access="public" returntype="any">
		<cfreturn variables.COCD8Q>
	</cffunction>

	<cffunction name="setCOCD8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.COCD8Q = arguments.val>
	</cffunction>

	<cffunction name="getCLW18Q" output="false" access="public" returntype="any">
		<cfreturn variables.CLW18Q>
	</cffunction>

	<cffunction name="setCLW18Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CLW18Q = arguments.val>
	</cffunction>

	<cffunction name="getCLB18Q" output="false" access="public" returntype="any">
		<cfreturn variables.CLB18Q>
	</cffunction>

	<cffunction name="setCLB18Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CLB18Q = arguments.val>
	</cffunction>

	<cffunction name="getCLD18Q" output="false" access="public" returntype="any">
		<cfreturn variables.CLD18Q>
	</cffunction>

	<cffunction name="setCLD18Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CLD18Q = arguments.val>
	</cffunction>

	<cffunction name="getCLI18Q" output="false" access="public" returntype="any">
		<cfreturn variables.CLI18Q>
	</cffunction>

	<cffunction name="setCLI18Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CLI18Q = arguments.val>
	</cffunction>

	<cffunction name="getCLM18Q" output="false" access="public" returntype="any">
		<cfreturn variables.CLM18Q>
	</cffunction>

	<cffunction name="setCLM18Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CLM18Q = arguments.val>
	</cffunction>

	<cffunction name="getCLW28Q" output="false" access="public" returntype="any">
		<cfreturn variables.CLW28Q>
	</cffunction>

	<cffunction name="setCLW28Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CLW28Q = arguments.val>
	</cffunction>

	<cffunction name="getCLB28Q" output="false" access="public" returntype="any">
		<cfreturn variables.CLB28Q>
	</cffunction>

	<cffunction name="setCLB28Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CLB28Q = arguments.val>
	</cffunction>

	<cffunction name="getCLD28Q" output="false" access="public" returntype="any">
		<cfreturn variables.CLD28Q>
	</cffunction>

	<cffunction name="setCLD28Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CLD28Q = arguments.val>
	</cffunction>

	<cffunction name="getCLI28Q" output="false" access="public" returntype="any">
		<cfreturn variables.CLI28Q>
	</cffunction>

	<cffunction name="setCLI28Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CLI28Q = arguments.val>
	</cffunction>

	<cffunction name="getCLM28Q" output="false" access="public" returntype="any">
		<cfreturn variables.CLM28Q>
	</cffunction>

	<cffunction name="setCLM28Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CLM28Q = arguments.val>
	</cffunction>

	<cffunction name="getCLW38Q" output="false" access="public" returntype="any">
		<cfreturn variables.CLW38Q>
	</cffunction>

	<cffunction name="setCLW38Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CLW38Q = arguments.val>
	</cffunction>

	<cffunction name="getCLB38Q" output="false" access="public" returntype="any">
		<cfreturn variables.CLB38Q>
	</cffunction>

	<cffunction name="setCLB38Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CLB38Q = arguments.val>
	</cffunction>

	<cffunction name="getCLD38Q" output="false" access="public" returntype="any">
		<cfreturn variables.CLD38Q>
	</cffunction>

	<cffunction name="setCLD38Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CLD38Q = arguments.val>
	</cffunction>

	<cffunction name="getCLI38Q" output="false" access="public" returntype="any">
		<cfreturn variables.CLI38Q>
	</cffunction>

	<cffunction name="setCLI38Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CLI38Q = arguments.val>
	</cffunction>

	<cffunction name="getCLM38Q" output="false" access="public" returntype="any">
		<cfreturn variables.CLM38Q>
	</cffunction>

	<cffunction name="setCLM38Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CLM38Q = arguments.val>
	</cffunction>

	<cffunction name="getCP118Q" output="false" access="public" returntype="any">
		<cfreturn variables.CP118Q>
	</cffunction>

	<cffunction name="setCP118Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CP118Q = arguments.val>
	</cffunction>

	<cffunction name="getP1118Q" output="false" access="public" returntype="any">
		<cfreturn variables.P1118Q>
	</cffunction>

	<cffunction name="setP1118Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P1118Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP1128Q" output="false" access="public" returntype="any">
		<cfreturn variables.P1128Q>
	</cffunction>

	<cffunction name="setP1128Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P1128Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP1138Q" output="false" access="public" returntype="any">
		<cfreturn variables.P1138Q>
	</cffunction>

	<cffunction name="setP1138Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P1138Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP1148Q" output="false" access="public" returntype="any">
		<cfreturn variables.P1148Q>
	</cffunction>

	<cffunction name="setP1148Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P1148Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP1158Q" output="false" access="public" returntype="any">
		<cfreturn variables.P1158Q>
	</cffunction>

	<cffunction name="setP1158Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P1158Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getC1118Q" output="false" access="public" returntype="any">
		<cfreturn variables.C1118Q>
	</cffunction>

	<cffunction name="setC1118Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C1118Q = arguments.val>
	</cffunction>

	<cffunction name="getC1128Q" output="false" access="public" returntype="any">
		<cfreturn variables.C1128Q>
	</cffunction>

	<cffunction name="setC1128Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C1128Q = arguments.val>
	</cffunction>

	<cffunction name="getC1138Q" output="false" access="public" returntype="any">
		<cfreturn variables.C1138Q>
	</cffunction>

	<cffunction name="setC1138Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C1138Q = arguments.val>
	</cffunction>

	<cffunction name="getC1148Q" output="false" access="public" returntype="any">
		<cfreturn variables.C1148Q>
	</cffunction>

	<cffunction name="setC1148Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C1148Q = arguments.val>
	</cffunction>

	<cffunction name="getC1158Q" output="false" access="public" returntype="any">
		<cfreturn variables.C1158Q>
	</cffunction>

	<cffunction name="setC1158Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C1158Q = arguments.val>
	</cffunction>

	<cffunction name="getCP128Q" output="false" access="public" returntype="any">
		<cfreturn variables.CP128Q>
	</cffunction>

	<cffunction name="setCP128Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CP128Q = arguments.val>
	</cffunction>

	<cffunction name="getP1218Q" output="false" access="public" returntype="any">
		<cfreturn variables.P1218Q>
	</cffunction>

	<cffunction name="setP1218Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P1218Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP1228Q" output="false" access="public" returntype="any">
		<cfreturn variables.P1228Q>
	</cffunction>

	<cffunction name="setP1228Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P1228Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP1238Q" output="false" access="public" returntype="any">
		<cfreturn variables.P1238Q>
	</cffunction>

	<cffunction name="setP1238Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P1238Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP1248Q" output="false" access="public" returntype="any">
		<cfreturn variables.P1248Q>
	</cffunction>

	<cffunction name="setP1248Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P1248Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP1258Q" output="false" access="public" returntype="any">
		<cfreturn variables.P1258Q>
	</cffunction>

	<cffunction name="setP1258Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P1258Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getC1218Q" output="false" access="public" returntype="any">
		<cfreturn variables.C1218Q>
	</cffunction>

	<cffunction name="setC1218Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C1218Q = arguments.val>
	</cffunction>

	<cffunction name="getC1228Q" output="false" access="public" returntype="any">
		<cfreturn variables.C1228Q>
	</cffunction>

	<cffunction name="setC1228Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C1228Q = arguments.val>
	</cffunction>

	<cffunction name="getC1238Q" output="false" access="public" returntype="any">
		<cfreturn variables.C1238Q>
	</cffunction>

	<cffunction name="setC1238Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C1238Q = arguments.val>
	</cffunction>

	<cffunction name="getC1248Q" output="false" access="public" returntype="any">
		<cfreturn variables.C1248Q>
	</cffunction>

	<cffunction name="setC1248Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C1248Q = arguments.val>
	</cffunction>

	<cffunction name="getC1258Q" output="false" access="public" returntype="any">
		<cfreturn variables.C1258Q>
	</cffunction>

	<cffunction name="setC1258Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C1258Q = arguments.val>
	</cffunction>

	<cffunction name="getCP138Q" output="false" access="public" returntype="any">
		<cfreturn variables.CP138Q>
	</cffunction>

	<cffunction name="setCP138Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CP138Q = arguments.val>
	</cffunction>

	<cffunction name="getP1318Q" output="false" access="public" returntype="any">
		<cfreturn variables.P1318Q>
	</cffunction>

	<cffunction name="setP1318Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P1318Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP1328Q" output="false" access="public" returntype="any">
		<cfreturn variables.P1328Q>
	</cffunction>

	<cffunction name="setP1328Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P1328Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP1338Q" output="false" access="public" returntype="any">
		<cfreturn variables.P1338Q>
	</cffunction>

	<cffunction name="setP1338Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P1338Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP1348Q" output="false" access="public" returntype="any">
		<cfreturn variables.P1348Q>
	</cffunction>

	<cffunction name="setP1348Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P1348Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP1358Q" output="false" access="public" returntype="any">
		<cfreturn variables.P1358Q>
	</cffunction>

	<cffunction name="setP1358Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P1358Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getC1318Q" output="false" access="public" returntype="any">
		<cfreturn variables.C1318Q>
	</cffunction>

	<cffunction name="setC1318Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C1318Q = arguments.val>
	</cffunction>

	<cffunction name="getC1328Q" output="false" access="public" returntype="any">
		<cfreturn variables.C1328Q>
	</cffunction>

	<cffunction name="setC1328Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C1328Q = arguments.val>
	</cffunction>

	<cffunction name="getC1338Q" output="false" access="public" returntype="any">
		<cfreturn variables.C1338Q>
	</cffunction>

	<cffunction name="setC1338Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C1338Q = arguments.val>
	</cffunction>

	<cffunction name="getC1348Q" output="false" access="public" returntype="any">
		<cfreturn variables.C1348Q>
	</cffunction>

	<cffunction name="setC1348Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C1348Q = arguments.val>
	</cffunction>

	<cffunction name="getC1358Q" output="false" access="public" returntype="any">
		<cfreturn variables.C1358Q>
	</cffunction>

	<cffunction name="setC1358Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C1358Q = arguments.val>
	</cffunction>

	<cffunction name="getCP218Q" output="false" access="public" returntype="any">
		<cfreturn variables.CP218Q>
	</cffunction>

	<cffunction name="setCP218Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CP218Q = arguments.val>
	</cffunction>

	<cffunction name="getP2118Q" output="false" access="public" returntype="any">
		<cfreturn variables.P2118Q>
	</cffunction>

	<cffunction name="setP2118Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P2118Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP2128Q" output="false" access="public" returntype="any">
		<cfreturn variables.P2128Q>
	</cffunction>

	<cffunction name="setP2128Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P2128Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP2138Q" output="false" access="public" returntype="any">
		<cfreturn variables.P2138Q>
	</cffunction>

	<cffunction name="setP2138Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P2138Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP2148Q" output="false" access="public" returntype="any">
		<cfreturn variables.P2148Q>
	</cffunction>

	<cffunction name="setP2148Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P2148Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP2158Q" output="false" access="public" returntype="any">
		<cfreturn variables.P2158Q>
	</cffunction>

	<cffunction name="setP2158Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P2158Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getC2118Q" output="false" access="public" returntype="any">
		<cfreturn variables.C2118Q>
	</cffunction>

	<cffunction name="setC2118Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C2118Q = arguments.val>
	</cffunction>

	<cffunction name="getC2128Q" output="false" access="public" returntype="any">
		<cfreturn variables.C2128Q>
	</cffunction>

	<cffunction name="setC2128Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C2128Q = arguments.val>
	</cffunction>

	<cffunction name="getC2138Q" output="false" access="public" returntype="any">
		<cfreturn variables.C2138Q>
	</cffunction>

	<cffunction name="setC2138Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C2138Q = arguments.val>
	</cffunction>

	<cffunction name="getC2148Q" output="false" access="public" returntype="any">
		<cfreturn variables.C2148Q>
	</cffunction>

	<cffunction name="setC2148Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C2148Q = arguments.val>
	</cffunction>

	<cffunction name="getC2158Q" output="false" access="public" returntype="any">
		<cfreturn variables.C2158Q>
	</cffunction>

	<cffunction name="setC2158Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C2158Q = arguments.val>
	</cffunction>

	<cffunction name="getCP228Q" output="false" access="public" returntype="any">
		<cfreturn variables.CP228Q>
	</cffunction>

	<cffunction name="setCP228Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CP228Q = arguments.val>
	</cffunction>

	<cffunction name="getP2218Q" output="false" access="public" returntype="any">
		<cfreturn variables.P2218Q>
	</cffunction>

	<cffunction name="setP2218Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P2218Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP2228Q" output="false" access="public" returntype="any">
		<cfreturn variables.P2228Q>
	</cffunction>

	<cffunction name="setP2228Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P2228Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP2238Q" output="false" access="public" returntype="any">
		<cfreturn variables.P2238Q>
	</cffunction>

	<cffunction name="setP2238Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P2238Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP2248Q" output="false" access="public" returntype="any">
		<cfreturn variables.P2248Q>
	</cffunction>

	<cffunction name="setP2248Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P2248Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP2258Q" output="false" access="public" returntype="any">
		<cfreturn variables.P2258Q>
	</cffunction>

	<cffunction name="setP2258Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P2258Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getC2218Q" output="false" access="public" returntype="any">
		<cfreturn variables.C2218Q>
	</cffunction>

	<cffunction name="setC2218Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C2218Q = arguments.val>
	</cffunction>

	<cffunction name="getC2228Q" output="false" access="public" returntype="any">
		<cfreturn variables.C2228Q>
	</cffunction>

	<cffunction name="setC2228Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C2228Q = arguments.val>
	</cffunction>

	<cffunction name="getC2238Q" output="false" access="public" returntype="any">
		<cfreturn variables.C2238Q>
	</cffunction>

	<cffunction name="setC2238Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C2238Q = arguments.val>
	</cffunction>

	<cffunction name="getC2248Q" output="false" access="public" returntype="any">
		<cfreturn variables.C2248Q>
	</cffunction>

	<cffunction name="setC2248Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C2248Q = arguments.val>
	</cffunction>

	<cffunction name="getC2258Q" output="false" access="public" returntype="any">
		<cfreturn variables.C2258Q>
	</cffunction>

	<cffunction name="setC2258Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C2258Q = arguments.val>
	</cffunction>

	<cffunction name="getCP238Q" output="false" access="public" returntype="any">
		<cfreturn variables.CP238Q>
	</cffunction>

	<cffunction name="setCP238Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CP238Q = arguments.val>
	</cffunction>

	<cffunction name="getP2318Q" output="false" access="public" returntype="any">
		<cfreturn variables.P2318Q>
	</cffunction>

	<cffunction name="setP2318Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P2318Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP2328Q" output="false" access="public" returntype="any">
		<cfreturn variables.P2328Q>
	</cffunction>

	<cffunction name="setP2328Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P2328Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP2338Q" output="false" access="public" returntype="any">
		<cfreturn variables.P2338Q>
	</cffunction>

	<cffunction name="setP2338Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P2338Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP2348Q" output="false" access="public" returntype="any">
		<cfreturn variables.P2348Q>
	</cffunction>

	<cffunction name="setP2348Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P2348Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP2358Q" output="false" access="public" returntype="any">
		<cfreturn variables.P2358Q>
	</cffunction>

	<cffunction name="setP2358Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P2358Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getC2318Q" output="false" access="public" returntype="any">
		<cfreturn variables.C2318Q>
	</cffunction>

	<cffunction name="setC2318Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C2318Q = arguments.val>
	</cffunction>

	<cffunction name="getC2328Q" output="false" access="public" returntype="any">
		<cfreturn variables.C2328Q>
	</cffunction>

	<cffunction name="setC2328Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C2328Q = arguments.val>
	</cffunction>

	<cffunction name="getC2338Q" output="false" access="public" returntype="any">
		<cfreturn variables.C2338Q>
	</cffunction>

	<cffunction name="setC2338Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C2338Q = arguments.val>
	</cffunction>

	<cffunction name="getC2348Q" output="false" access="public" returntype="any">
		<cfreturn variables.C2348Q>
	</cffunction>

	<cffunction name="setC2348Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C2348Q = arguments.val>
	</cffunction>

	<cffunction name="getC2358Q" output="false" access="public" returntype="any">
		<cfreturn variables.C2358Q>
	</cffunction>

	<cffunction name="setC2358Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C2358Q = arguments.val>
	</cffunction>

	<cffunction name="getCP318Q" output="false" access="public" returntype="any">
		<cfreturn variables.CP318Q>
	</cffunction>

	<cffunction name="setCP318Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CP318Q = arguments.val>
	</cffunction>

	<cffunction name="getP3118Q" output="false" access="public" returntype="any">
		<cfreturn variables.P3118Q>
	</cffunction>

	<cffunction name="setP3118Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P3118Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP3128Q" output="false" access="public" returntype="any">
		<cfreturn variables.P3128Q>
	</cffunction>

	<cffunction name="setP3128Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P3128Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP3138Q" output="false" access="public" returntype="any">
		<cfreturn variables.P3138Q>
	</cffunction>

	<cffunction name="setP3138Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P3138Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP3148Q" output="false" access="public" returntype="any">
		<cfreturn variables.P3148Q>
	</cffunction>

	<cffunction name="setP3148Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P3148Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP3158Q" output="false" access="public" returntype="any">
		<cfreturn variables.P3158Q>
	</cffunction>

	<cffunction name="setP3158Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P3158Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getC3118Q" output="false" access="public" returntype="any">
		<cfreturn variables.C3118Q>
	</cffunction>

	<cffunction name="setC3118Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C3118Q = arguments.val>
	</cffunction>

	<cffunction name="getC3128Q" output="false" access="public" returntype="any">
		<cfreturn variables.C3128Q>
	</cffunction>

	<cffunction name="setC3128Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C3128Q = arguments.val>
	</cffunction>

	<cffunction name="getC3138Q" output="false" access="public" returntype="any">
		<cfreturn variables.C3138Q>
	</cffunction>

	<cffunction name="setC3138Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C3138Q = arguments.val>
	</cffunction>

	<cffunction name="getC3148Q" output="false" access="public" returntype="any">
		<cfreturn variables.C3148Q>
	</cffunction>

	<cffunction name="setC3148Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C3148Q = arguments.val>
	</cffunction>

	<cffunction name="getC3158Q" output="false" access="public" returntype="any">
		<cfreturn variables.C3158Q>
	</cffunction>

	<cffunction name="setC3158Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C3158Q = arguments.val>
	</cffunction>

	<cffunction name="getCP328Q" output="false" access="public" returntype="any">
		<cfreturn variables.CP328Q>
	</cffunction>

	<cffunction name="setCP328Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CP328Q = arguments.val>
	</cffunction>

	<cffunction name="getP3218Q" output="false" access="public" returntype="any">
		<cfreturn variables.P3218Q>
	</cffunction>

	<cffunction name="setP3218Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P3218Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP3228Q" output="false" access="public" returntype="any">
		<cfreturn variables.P3228Q>
	</cffunction>

	<cffunction name="setP3228Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P3228Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP3238Q" output="false" access="public" returntype="any">
		<cfreturn variables.P3238Q>
	</cffunction>

	<cffunction name="setP3238Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P3238Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP3248Q" output="false" access="public" returntype="any">
		<cfreturn variables.P3248Q>
	</cffunction>

	<cffunction name="setP3248Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P3248Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP3258Q" output="false" access="public" returntype="any">
		<cfreturn variables.P3258Q>
	</cffunction>

	<cffunction name="setP3258Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P3258Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getC3218Q" output="false" access="public" returntype="any">
		<cfreturn variables.C3218Q>
	</cffunction>

	<cffunction name="setC3218Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C3218Q = arguments.val>
	</cffunction>

	<cffunction name="getC3228Q" output="false" access="public" returntype="any">
		<cfreturn variables.C3228Q>
	</cffunction>

	<cffunction name="setC3228Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C3228Q = arguments.val>
	</cffunction>

	<cffunction name="getC3238Q" output="false" access="public" returntype="any">
		<cfreturn variables.C3238Q>
	</cffunction>

	<cffunction name="setC3238Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C3238Q = arguments.val>
	</cffunction>

	<cffunction name="getC3248Q" output="false" access="public" returntype="any">
		<cfreturn variables.C3248Q>
	</cffunction>

	<cffunction name="setC3248Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C3248Q = arguments.val>
	</cffunction>

	<cffunction name="getC3258Q" output="false" access="public" returntype="any">
		<cfreturn variables.C3258Q>
	</cffunction>

	<cffunction name="setC3258Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C3258Q = arguments.val>
	</cffunction>

	<cffunction name="getCP338Q" output="false" access="public" returntype="any">
		<cfreturn variables.CP338Q>
	</cffunction>

	<cffunction name="setCP338Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CP338Q = arguments.val>
	</cffunction>

	<cffunction name="getP3318Q" output="false" access="public" returntype="any">
		<cfreturn variables.P3318Q>
	</cffunction>

	<cffunction name="setP3318Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P3318Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP3328Q" output="false" access="public" returntype="any">
		<cfreturn variables.P3328Q>
	</cffunction>

	<cffunction name="setP3328Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P3328Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP3338Q" output="false" access="public" returntype="any">
		<cfreturn variables.P3338Q>
	</cffunction>

	<cffunction name="setP3338Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P3338Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP3348Q" output="false" access="public" returntype="any">
		<cfreturn variables.P3348Q>
	</cffunction>

	<cffunction name="setP3348Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P3348Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getP3358Q" output="false" access="public" returntype="any">
		<cfreturn variables.P3358Q>
	</cffunction>

	<cffunction name="setP3358Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.P3358Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getC3318Q" output="false" access="public" returntype="any">
		<cfreturn variables.C3318Q>
	</cffunction>

	<cffunction name="setC3318Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C3318Q = arguments.val>
	</cffunction>

	<cffunction name="getC3328Q" output="false" access="public" returntype="any">
		<cfreturn variables.C3328Q>
	</cffunction>

	<cffunction name="setC3328Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C3328Q = arguments.val>
	</cffunction>

	<cffunction name="getC3338Q" output="false" access="public" returntype="any">
		<cfreturn variables.C3338Q>
	</cffunction>

	<cffunction name="setC3338Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C3338Q = arguments.val>
	</cffunction>

	<cffunction name="getC3348Q" output="false" access="public" returntype="any">
		<cfreturn variables.C3348Q>
	</cffunction>

	<cffunction name="setC3348Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C3348Q = arguments.val>
	</cffunction>

	<cffunction name="getC3358Q" output="false" access="public" returntype="any">
		<cfreturn variables.C3358Q>
	</cffunction>

	<cffunction name="setC3358Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.C3358Q = arguments.val>
	</cffunction>

	<cffunction name="getC1FM8Q" output="false" access="public" returntype="any">
		<cfreturn variables.C1FM8Q>
	</cffunction>

	<cffunction name="setC1FM8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.C1FM8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getC2FM8Q" output="false" access="public" returntype="any">
		<cfreturn variables.C2FM8Q>
	</cffunction>

	<cffunction name="setC2FM8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.C2FM8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getC3FM8Q" output="false" access="public" returntype="any">
		<cfreturn variables.C3FM8Q>
	</cffunction>

	<cffunction name="setC3FM8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.C3FM8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getH1FM8Q" output="false" access="public" returntype="any">
		<cfreturn variables.H1FM8Q>
	</cffunction>

	<cffunction name="setH1FM8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.H1FM8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getH2FM8Q" output="false" access="public" returntype="any">
		<cfreturn variables.H2FM8Q>
	</cffunction>

	<cffunction name="setH2FM8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.H2FM8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getH3FM8Q" output="false" access="public" returntype="any">
		<cfreturn variables.H3FM8Q>
	</cffunction>

	<cffunction name="setH3FM8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.H3FM8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getRNNO8Q" output="false" access="public" returntype="any">
		<cfreturn variables.RNNO8Q>
	</cffunction>

	<cffunction name="setRNNO8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.RNNO8Q = arguments.val>
	</cffunction>

	<cffunction name="getCSIT8Q" output="false" access="public" returntype="any">
		<cfreturn variables.CSIT8Q>
	</cffunction>

	<cffunction name="setCSIT8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CSIT8Q = arguments.val>
	</cffunction>

	<cffunction name="getREPR8Q" output="false" access="public" returntype="any">
		<cfreturn variables.REPR8Q>
	</cffunction>

	<cffunction name="setREPR8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.REPR8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCPUS8Q" output="false" access="public" returntype="any">
		<cfreturn variables.CPUS8Q>
	</cffunction>

	<cffunction name="setCPUS8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CPUS8Q = arguments.val>
	</cffunction>

	<cffunction name="getCPDT8Q" output="false" access="public" returntype="any">
		<cfreturn variables.CPDT8Q>
	</cffunction>

	<cffunction name="setCPDT8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CPDT8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCPTM8Q" output="false" access="public" returntype="any">
		<cfreturn variables.CPTM8Q>
	</cffunction>

	<cffunction name="setCPTM8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CPTM8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getHPUS8Q" output="false" access="public" returntype="any">
		<cfreturn variables.HPUS8Q>
	</cffunction>

	<cffunction name="setHPUS8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.HPUS8Q = arguments.val>
	</cffunction>

	<cffunction name="getHPDT8Q" output="false" access="public" returntype="any">
		<cfreturn variables.HPDT8Q>
	</cffunction>

	<cffunction name="setHPDT8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.HPDT8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getHPTM8Q" output="false" access="public" returntype="any">
		<cfreturn variables.HPTM8Q>
	</cffunction>

	<cffunction name="setHPTM8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.HPTM8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getHLPF8Q" output="false" access="public" returntype="any">
		<cfreturn variables.HLPF8Q>
	</cffunction>

	<cffunction name="setHLPF8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.HLPF8Q = arguments.val>
	</cffunction>

	<cffunction name="getHLAC8Q" output="false" access="public" returntype="any">
		<cfreturn variables.HLAC8Q>
	</cffunction>

	<cffunction name="setHLAC8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.HLAC8Q = arguments.val>
	</cffunction>

	<cffunction name="getHLFG8Q" output="false" access="public" returntype="any">
		<cfreturn variables.HLFG8Q>
	</cffunction>

	<cffunction name="setHLFG8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.HLFG8Q = arguments.val>
	</cffunction>

	<cffunction name="getQCUS8Q" output="false" access="public" returntype="any">
		<cfreturn variables.QCUS8Q>
	</cffunction>

	<cffunction name="setQCUS8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.QCUS8Q = arguments.val>
	</cffunction>

	<cffunction name="getQCDT8Q" output="false" access="public" returntype="any">
		<cfreturn variables.QCDT8Q>
	</cffunction>

	<cffunction name="setQCDT8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.QCDT8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getQCTM8Q" output="false" access="public" returntype="any">
		<cfreturn variables.QCTM8Q>
	</cffunction>

	<cffunction name="setQCTM8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.QCTM8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPRPR8Q" output="false" access="public" returntype="any">
		<cfreturn variables.PRPR8Q>
	</cffunction>

	<cffunction name="setPRPR8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.PRPR8Q = arguments.val>
	</cffunction>

	<cffunction name="getPRCR8Q" output="false" access="public" returntype="any">
		<cfreturn variables.PRCR8Q>
	</cffunction>

	<cffunction name="setPRCR8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.PRCR8Q = arguments.val>
	</cffunction>

	<cffunction name="getLSRD8Q" output="false" access="public" returntype="any">
		<cfreturn variables.LSRD8Q>
	</cffunction>

	<cffunction name="setLSRD8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.LSRD8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getFSRD8Q" output="false" access="public" returntype="any">
		<cfreturn variables.FSRD8Q>
	</cffunction>

	<cffunction name="setFSRD8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.FSRD8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getFSRT8Q" output="false" access="public" returntype="any">
		<cfreturn variables.FSRT8Q>
	</cffunction>

	<cffunction name="setFSRT8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.FSRT8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getMC018Q" output="false" access="public" returntype="any">
		<cfreturn variables.MC018Q>
	</cffunction>

	<cffunction name="setMC018Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.MC018Q = arguments.val>
	</cffunction>

	<cffunction name="getCP018Q" output="false" access="public" returntype="any">
		<cfreturn variables.CP018Q>
	</cffunction>

	<cffunction name="setCP018Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CP018Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCD018Q" output="false" access="public" returntype="any">
		<cfreturn variables.CD018Q>
	</cffunction>

	<cffunction name="setCD018Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CD018Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getVN018Q" output="false" access="public" returntype="any">
		<cfreturn variables.VN018Q>
	</cffunction>

	<cffunction name="setVN018Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.VN018Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAC018Q" output="false" access="public" returntype="any">
		<cfreturn variables.AC018Q>
	</cffunction>

	<cffunction name="setAC018Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.AC018Q = arguments.val>
	</cffunction>

	<cffunction name="getMC028Q" output="false" access="public" returntype="any">
		<cfreturn variables.MC028Q>
	</cffunction>

	<cffunction name="setMC028Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.MC028Q = arguments.val>
	</cffunction>

	<cffunction name="getCP028Q" output="false" access="public" returntype="any">
		<cfreturn variables.CP028Q>
	</cffunction>

	<cffunction name="setCP028Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CP028Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCD028Q" output="false" access="public" returntype="any">
		<cfreturn variables.CD028Q>
	</cffunction>

	<cffunction name="setCD028Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CD028Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getVN028Q" output="false" access="public" returntype="any">
		<cfreturn variables.VN028Q>
	</cffunction>

	<cffunction name="setVN028Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.VN028Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAC028Q" output="false" access="public" returntype="any">
		<cfreturn variables.AC028Q>
	</cffunction>

	<cffunction name="setAC028Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.AC028Q = arguments.val>
	</cffunction>

	<cffunction name="getMC038Q" output="false" access="public" returntype="any">
		<cfreturn variables.MC038Q>
	</cffunction>

	<cffunction name="setMC038Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.MC038Q = arguments.val>
	</cffunction>

	<cffunction name="getCP038Q" output="false" access="public" returntype="any">
		<cfreturn variables.CP038Q>
	</cffunction>

	<cffunction name="setCP038Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CP038Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCD038Q" output="false" access="public" returntype="any">
		<cfreturn variables.CD038Q>
	</cffunction>

	<cffunction name="setCD038Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CD038Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getVN038Q" output="false" access="public" returntype="any">
		<cfreturn variables.VN038Q>
	</cffunction>

	<cffunction name="setVN038Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.VN038Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAC038Q" output="false" access="public" returntype="any">
		<cfreturn variables.AC038Q>
	</cffunction>

	<cffunction name="setAC038Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.AC038Q = arguments.val>
	</cffunction>

	<cffunction name="getMC048Q" output="false" access="public" returntype="any">
		<cfreturn variables.MC048Q>
	</cffunction>

	<cffunction name="setMC048Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.MC048Q = arguments.val>
	</cffunction>

	<cffunction name="getCP048Q" output="false" access="public" returntype="any">
		<cfreturn variables.CP048Q>
	</cffunction>

	<cffunction name="setCP048Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CP048Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCD048Q" output="false" access="public" returntype="any">
		<cfreturn variables.CD048Q>
	</cffunction>

	<cffunction name="setCD048Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CD048Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getVN048Q" output="false" access="public" returntype="any">
		<cfreturn variables.VN048Q>
	</cffunction>

	<cffunction name="setVN048Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.VN048Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAC048Q" output="false" access="public" returntype="any">
		<cfreturn variables.AC048Q>
	</cffunction>

	<cffunction name="setAC048Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.AC048Q = arguments.val>
	</cffunction>

	<cffunction name="getMC058Q" output="false" access="public" returntype="any">
		<cfreturn variables.MC058Q>
	</cffunction>

	<cffunction name="setMC058Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.MC058Q = arguments.val>
	</cffunction>

	<cffunction name="getCP058Q" output="false" access="public" returntype="any">
		<cfreturn variables.CP058Q>
	</cffunction>

	<cffunction name="setCP058Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CP058Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCD058Q" output="false" access="public" returntype="any">
		<cfreturn variables.CD058Q>
	</cffunction>

	<cffunction name="setCD058Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CD058Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getVN058Q" output="false" access="public" returntype="any">
		<cfreturn variables.VN058Q>
	</cffunction>

	<cffunction name="setVN058Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.VN058Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAC058Q" output="false" access="public" returntype="any">
		<cfreturn variables.AC058Q>
	</cffunction>

	<cffunction name="setAC058Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.AC058Q = arguments.val>
	</cffunction>

	<cffunction name="getMC068Q" output="false" access="public" returntype="any">
		<cfreturn variables.MC068Q>
	</cffunction>

	<cffunction name="setMC068Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.MC068Q = arguments.val>
	</cffunction>

	<cffunction name="getCP068Q" output="false" access="public" returntype="any">
		<cfreturn variables.CP068Q>
	</cffunction>

	<cffunction name="setCP068Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CP068Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCD068Q" output="false" access="public" returntype="any">
		<cfreturn variables.CD068Q>
	</cffunction>

	<cffunction name="setCD068Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CD068Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getVN068Q" output="false" access="public" returntype="any">
		<cfreturn variables.VN068Q>
	</cffunction>

	<cffunction name="setVN068Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.VN068Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAC068Q" output="false" access="public" returntype="any">
		<cfreturn variables.AC068Q>
	</cffunction>

	<cffunction name="setAC068Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.AC068Q = arguments.val>
	</cffunction>

	<cffunction name="getMC078Q" output="false" access="public" returntype="any">
		<cfreturn variables.MC078Q>
	</cffunction>

	<cffunction name="setMC078Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.MC078Q = arguments.val>
	</cffunction>

	<cffunction name="getCP078Q" output="false" access="public" returntype="any">
		<cfreturn variables.CP078Q>
	</cffunction>

	<cffunction name="setCP078Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CP078Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCD078Q" output="false" access="public" returntype="any">
		<cfreturn variables.CD078Q>
	</cffunction>

	<cffunction name="setCD078Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CD078Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getVN078Q" output="false" access="public" returntype="any">
		<cfreturn variables.VN078Q>
	</cffunction>

	<cffunction name="setVN078Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.VN078Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAC078Q" output="false" access="public" returntype="any">
		<cfreturn variables.AC078Q>
	</cffunction>

	<cffunction name="setAC078Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.AC078Q = arguments.val>
	</cffunction>

	<cffunction name="getMC088Q" output="false" access="public" returntype="any">
		<cfreturn variables.MC088Q>
	</cffunction>

	<cffunction name="setMC088Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.MC088Q = arguments.val>
	</cffunction>

	<cffunction name="getCP088Q" output="false" access="public" returntype="any">
		<cfreturn variables.CP088Q>
	</cffunction>

	<cffunction name="setCP088Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CP088Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCD088Q" output="false" access="public" returntype="any">
		<cfreturn variables.CD088Q>
	</cffunction>

	<cffunction name="setCD088Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CD088Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getVN088Q" output="false" access="public" returntype="any">
		<cfreturn variables.VN088Q>
	</cffunction>

	<cffunction name="setVN088Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.VN088Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAC088Q" output="false" access="public" returntype="any">
		<cfreturn variables.AC088Q>
	</cffunction>

	<cffunction name="setAC088Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.AC088Q = arguments.val>
	</cffunction>

	<cffunction name="getMC098Q" output="false" access="public" returntype="any">
		<cfreturn variables.MC098Q>
	</cffunction>

	<cffunction name="setMC098Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.MC098Q = arguments.val>
	</cffunction>

	<cffunction name="getCP098Q" output="false" access="public" returntype="any">
		<cfreturn variables.CP098Q>
	</cffunction>

	<cffunction name="setCP098Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CP098Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCD098Q" output="false" access="public" returntype="any">
		<cfreturn variables.CD098Q>
	</cffunction>

	<cffunction name="setCD098Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CD098Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getVN098Q" output="false" access="public" returntype="any">
		<cfreturn variables.VN098Q>
	</cffunction>

	<cffunction name="setVN098Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.VN098Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAC098Q" output="false" access="public" returntype="any">
		<cfreturn variables.AC098Q>
	</cffunction>

	<cffunction name="setAC098Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.AC098Q = arguments.val>
	</cffunction>

	<cffunction name="getODDP8Q" output="false" access="public" returntype="any">
		<cfreturn variables.ODDP8Q>
	</cffunction>

	<cffunction name="setODDP8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ODDP8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getODAR8Q" output="false" access="public" returntype="any">
		<cfreturn variables.ODAR8Q>
	</cffunction>

	<cffunction name="setODAR8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ODAR8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getODIH8Q" output="false" access="public" returntype="any">
		<cfreturn variables.ODIH8Q>
	</cffunction>

	<cffunction name="setODIH8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ODIH8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getRVDP8Q" output="false" access="public" returntype="any">
		<cfreturn variables.RVDP8Q>
	</cffunction>

	<cffunction name="setRVDP8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.RVDP8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getRVAR8Q" output="false" access="public" returntype="any">
		<cfreturn variables.RVAR8Q>
	</cffunction>

	<cffunction name="setRVAR8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.RVAR8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getRVIH8Q" output="false" access="public" returntype="any">
		<cfreturn variables.RVIH8Q>
	</cffunction>

	<cffunction name="setRVIH8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.RVIH8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getACDP8Q" output="false" access="public" returntype="any">
		<cfreturn variables.ACDP8Q>
	</cffunction>

	<cffunction name="setACDP8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ACDP8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getACAR8Q" output="false" access="public" returntype="any">
		<cfreturn variables.ACAR8Q>
	</cffunction>

	<cffunction name="setACAR8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ACAR8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getACIH8Q" output="false" access="public" returntype="any">
		<cfreturn variables.ACIH8Q>
	</cffunction>

	<cffunction name="setACIH8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ACIH8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getVSAB8Q" output="false" access="public" returntype="any">
		<cfreturn variables.VSAB8Q>
	</cffunction>

	<cffunction name="setVSAB8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.VSAB8Q = arguments.val>
	</cffunction>

	<cffunction name="getCNRF8Q" output="false" access="public" returntype="any">
		<cfreturn variables.CNRF8Q>
	</cffunction>

	<cffunction name="setCNRF8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CNRF8Q = arguments.val>
	</cffunction>

	<cffunction name="getSRCD8Q" output="false" access="public" returntype="any">
		<cfreturn variables.SRCD8Q>
	</cffunction>

	<cffunction name="setSRCD8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SRCD8Q = arguments.val>
	</cffunction>

	<cffunction name="getQTYR8Q" output="false" access="public" returntype="any">
		<cfreturn variables.QTYR8Q>
	</cffunction>

	<cffunction name="setQTYR8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.QTYR8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getIMPP8Q" output="false" access="public" returntype="any">
		<cfreturn variables.IMPP8Q>
	</cffunction>

	<cffunction name="setIMPP8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.IMPP8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getIMPR8Q" output="false" access="public" returntype="any">
		<cfreturn variables.IMPR8Q>
	</cffunction>

	<cffunction name="setIMPR8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.IMPR8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getMSCD8Q" output="false" access="public" returntype="any">
		<cfreturn variables.MSCD8Q>
	</cffunction>

	<cffunction name="setMSCD8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.MSCD8Q = arguments.val>
	</cffunction>

	<cffunction name="getPRUM8Q" output="false" access="public" returntype="any">
		<cfreturn variables.PRUM8Q>
	</cffunction>

	<cffunction name="setPRUM8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.PRUM8Q = arguments.val>
	</cffunction>

	<cffunction name="getCVFC8Q" output="false" access="public" returntype="any">
		<cfreturn variables.CVFC8Q>
	</cffunction>

	<cffunction name="setCVFC8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CVFC8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCVFO8Q" output="false" access="public" returntype="any">
		<cfreturn variables.CVFO8Q>
	</cffunction>

	<cffunction name="setCVFO8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CVFO8Q = arguments.val>
	</cffunction>

	<cffunction name="getCH018Q" output="false" access="public" returntype="any">
		<cfreturn variables.CH018Q>
	</cffunction>

	<cffunction name="setCH018Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CH018Q = arguments.val>
	</cffunction>

	<cffunction name="getCH028Q" output="false" access="public" returntype="any">
		<cfreturn variables.CH028Q>
	</cffunction>

	<cffunction name="setCH028Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CH028Q = arguments.val>
	</cffunction>

	<cffunction name="getCH038Q" output="false" access="public" returntype="any">
		<cfreturn variables.CH038Q>
	</cffunction>

	<cffunction name="setCH038Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CH038Q = arguments.val>
	</cffunction>

	<cffunction name="getCH048Q" output="false" access="public" returntype="any">
		<cfreturn variables.CH048Q>
	</cffunction>

	<cffunction name="setCH048Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CH048Q = arguments.val>
	</cffunction>

	<cffunction name="getCH058Q" output="false" access="public" returntype="any">
		<cfreturn variables.CH058Q>
	</cffunction>

	<cffunction name="setCH058Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CH058Q = arguments.val>
	</cffunction>

	<cffunction name="getCH068Q" output="false" access="public" returntype="any">
		<cfreturn variables.CH068Q>
	</cffunction>

	<cffunction name="setCH068Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CH068Q = arguments.val>
	</cffunction>

	<cffunction name="getCH078Q" output="false" access="public" returntype="any">
		<cfreturn variables.CH078Q>
	</cffunction>

	<cffunction name="setCH078Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CH078Q = arguments.val>
	</cffunction>

	<cffunction name="getCH088Q" output="false" access="public" returntype="any">
		<cfreturn variables.CH088Q>
	</cffunction>

	<cffunction name="setCH088Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CH088Q = arguments.val>
	</cffunction>

	<cffunction name="getCH098Q" output="false" access="public" returntype="any">
		<cfreturn variables.CH098Q>
	</cffunction>

	<cffunction name="setCH098Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CH098Q = arguments.val>
	</cffunction>

	<cffunction name="getCH108Q" output="false" access="public" returntype="any">
		<cfreturn variables.CH108Q>
	</cffunction>

	<cffunction name="setCH108Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CH108Q = arguments.val>
	</cffunction>

	<cffunction name="getVL018Q" output="false" access="public" returntype="any">
		<cfreturn variables.VL018Q>
	</cffunction>

	<cffunction name="setVL018Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.VL018Q = arguments.val>
	</cffunction>

	<cffunction name="getVL028Q" output="false" access="public" returntype="any">
		<cfreturn variables.VL028Q>
	</cffunction>

	<cffunction name="setVL028Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.VL028Q = arguments.val>
	</cffunction>

	<cffunction name="getVL038Q" output="false" access="public" returntype="any">
		<cfreturn variables.VL038Q>
	</cffunction>

	<cffunction name="setVL038Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.VL038Q = arguments.val>
	</cffunction>

	<cffunction name="getVL048Q" output="false" access="public" returntype="any">
		<cfreturn variables.VL048Q>
	</cffunction>

	<cffunction name="setVL048Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.VL048Q = arguments.val>
	</cffunction>

	<cffunction name="getVL058Q" output="false" access="public" returntype="any">
		<cfreturn variables.VL058Q>
	</cffunction>

	<cffunction name="setVL058Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.VL058Q = arguments.val>
	</cffunction>

	<cffunction name="getVL068Q" output="false" access="public" returntype="any">
		<cfreturn variables.VL068Q>
	</cffunction>

	<cffunction name="setVL068Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.VL068Q = arguments.val>
	</cffunction>

	<cffunction name="getVL078Q" output="false" access="public" returntype="any">
		<cfreturn variables.VL078Q>
	</cffunction>

	<cffunction name="setVL078Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.VL078Q = arguments.val>
	</cffunction>

	<cffunction name="getVL088Q" output="false" access="public" returntype="any">
		<cfreturn variables.VL088Q>
	</cffunction>

	<cffunction name="setVL088Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.VL088Q = arguments.val>
	</cffunction>

	<cffunction name="getVL098Q" output="false" access="public" returntype="any">
		<cfreturn variables.VL098Q>
	</cffunction>

	<cffunction name="setVL098Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.VL098Q = arguments.val>
	</cffunction>

	<cffunction name="getVL108Q" output="false" access="public" returntype="any">
		<cfreturn variables.VL108Q>
	</cffunction>

	<cffunction name="setVL108Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.VL108Q = arguments.val>
	</cffunction>

	<cffunction name="getCVPR8Q" output="false" access="public" returntype="any">
		<cfreturn variables.CVPR8Q>
	</cffunction>

	<cffunction name="setCVPR8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CVPR8Q = arguments.val>
	</cffunction>

	<cffunction name="getCVCR8Q" output="false" access="public" returntype="any">
		<cfreturn variables.CVCR8Q>
	</cffunction>

	<cffunction name="setCVCR8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CVCR8Q = arguments.val>
	</cffunction>

	<cffunction name="getCVCP8Q" output="false" access="public" returntype="any">
		<cfreturn variables.CVCP8Q>
	</cffunction>

	<cffunction name="setCVCP8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CVCP8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAECD8Q" output="false" access="public" returntype="any">
		<cfreturn variables.AECD8Q>
	</cffunction>

	<cffunction name="setAECD8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AECD8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAUCD8Q" output="false" access="public" returntype="any">
		<cfreturn variables.AUCD8Q>
	</cffunction>

	<cffunction name="setAUCD8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AUCD8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSPMT8Q" output="false" access="public" returntype="any">
		<cfreturn variables.SPMT8Q>
	</cffunction>

	<cffunction name="setSPMT8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SPMT8Q = arguments.val>
	</cffunction>

	<cffunction name="getACIN8Q" output="false" access="public" returntype="any">
		<cfreturn variables.ACIN8Q>
	</cffunction>

	<cffunction name="setACIN8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ACIN8Q = arguments.val>
	</cffunction>

	<cffunction name="getGLUS8Q" output="false" access="public" returntype="any">
		<cfreturn variables.GLUS8Q>
	</cffunction>

	<cffunction name="setGLUS8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.GLUS8Q = arguments.val>
	</cffunction>

	<cffunction name="getGLDT8Q" output="false" access="public" returntype="any">
		<cfreturn variables.GLDT8Q>
	</cffunction>

	<cffunction name="setGLDT8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.GLDT8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getGLTM8Q" output="false" access="public" returntype="any">
		<cfreturn variables.GLTM8Q>
	</cffunction>

	<cffunction name="setGLTM8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.GLTM8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getMSJB8Q" output="false" access="public" returntype="any">
		<cfreturn variables.MSJB8Q>
	</cffunction>

	<cffunction name="setMSJB8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.MSJB8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getMSJL8Q" output="false" access="public" returntype="any">
		<cfreturn variables.MSJL8Q>
	</cffunction>

	<cffunction name="setMSJL8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.MSJL8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPCDY8Q" output="false" access="public" returntype="any">
		<cfreturn variables.PCDY8Q>
	</cffunction>

	<cffunction name="setPCDY8Q" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.PCDY8Q = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>



</cfcomponent>