<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.as400.JOBSUM0">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="AS400">
			select 	CONO8Q, JBNO8Q, PRCD8Q, CRCD8Q, JBRF8Q, DUDT8Q, 
					JBDT8Q, ISDT8Q, CMDT8Q, JSDT8Q, JCDT8Q, 
					ASCN8Q, CTRF8Q, STCD8Q, OPSQ8Q, PRSH8Q, 
					CMMT8Q, VRNO8Q, PLDY8Q, MTPR8Q, LBPR8Q, 
					OTPR8Q, OVPC8Q, OVAM8Q, OVDL8Q, SBDL8Q, 
					STMC8Q, SBMY8Q, MADT8Q, TLIS8Q, IS018Q, 
					IS028Q, IS038Q, IS048Q, IS058Q, IS068Q, 
					IS078Q, IS088Q, IS098Q, IS108Q, IS118Q, 
					IS128Q, TLWP8Q, WP018Q, WP028Q, WP038Q, 
					WP048Q, WP058Q, WP068Q, WP078Q, WP088Q, 
					WP098Q, WP108Q, WP118Q, WP128Q, TLSH8Q, 
					SH018Q, SH028Q, SH038Q, SH048Q, SH058Q, 
					SH068Q, SH078Q, SH088Q, SH098Q, SH108Q, 
					SH118Q, SH128Q, TLRC8Q, RC018Q, RC028Q, 
					RC038Q, RC048Q, RC058Q, RC068Q, RC078Q, 
					RC088Q, RC098Q, RC108Q, RC118Q, RC128Q, 
					TLAA8Q, AA018Q, AA028Q, AA038Q, AA048Q, 
					AA058Q, AA068Q, AA078Q, AA088Q, AA098Q, 
					AA108Q, AA118Q, AA128Q, TLAJ8Q, AJ018Q, 
					AJ028Q, AJ038Q, AJ048Q, AJ058Q, AJ068Q, 
					AJ078Q, AJ088Q, AJ098Q, AJ108Q, AJ118Q, 
					AJ128Q, TLOP8Q, OP018Q, OP028Q, OP038Q, 
					OP048Q, OP058Q, OP068Q, OP078Q, OP088Q, 
					OP098Q, OP108Q, OP118Q, OP128Q, CRUS8Q, 
					CRDT8Q, CRTM8Q, MNUS8Q, MNDT8Q, MNTM8Q, 
					CLSD8Q, CLDT8Q, CTNO8Q, CTL28Q, CTL38Q, 
					CTL48Q, CTL58Q, CTL68Q, PRMR8Q, PROP8Q, 
					MKRF8Q, MKCD8Q, MRPR8Q, PDTP8Q, UPCS8Q, 
					ACDT8Q, ACRF8Q, ESCS8Q, JBBT8Q, COCD8Q, 
					CLW18Q, CLB18Q, CLD18Q, CLI18Q, CLM18Q, 
					CLW28Q, CLB28Q, CLD28Q, CLI28Q, CLM28Q, 
					CLW38Q, CLB38Q, CLD38Q, CLI38Q, CLM38Q, 
					CP118Q, P1118Q, P1128Q, P1138Q, P1148Q, 
					P1158Q, C1118Q, C1128Q, C1138Q, C1148Q, 
					C1158Q, CP128Q, P1218Q, P1228Q, P1238Q, 
					P1248Q, P1258Q, C1218Q, C1228Q, C1238Q, 
					C1248Q, C1258Q, CP138Q, P1318Q, P1328Q, 
					P1338Q, P1348Q, P1358Q, C1318Q, C1328Q, 
					C1338Q, C1348Q, C1358Q, CP218Q, P2118Q, 
					P2128Q, P2138Q, P2148Q, P2158Q, C2118Q, 
					C2128Q, C2138Q, C2148Q, C2158Q, CP228Q, 
					P2218Q, P2228Q, P2238Q, P2248Q, P2258Q, 
					C2218Q, C2228Q, C2238Q, C2248Q, C2258Q, 
					CP238Q, P2318Q, P2328Q, P2338Q, P2348Q, 
					P2358Q, C2318Q, C2328Q, C2338Q, C2348Q, 
					C2358Q, CP318Q, P3118Q, P3128Q, P3138Q, 
					P3148Q, P3158Q, C3118Q, C3128Q, C3138Q, 
					C3148Q, C3158Q, CP328Q, P3218Q, P3228Q, 
					P3238Q, P3248Q, P3258Q, C3218Q, C3228Q, 
					C3238Q, C3248Q, C3258Q, CP338Q, P3318Q, 
					P3328Q, P3338Q, P3348Q, P3358Q, C3318Q, 
					C3328Q, C3338Q, C3348Q, C3358Q, C1FM8Q, 
					C2FM8Q, C3FM8Q, H1FM8Q, H2FM8Q, H3FM8Q, 
					RNNO8Q, CSIT8Q, REPR8Q, CPUS8Q, CPDT8Q, 
					CPTM8Q, HPUS8Q, HPDT8Q, HPTM8Q, HLPF8Q, 
					HLAC8Q, HLFG8Q, QCUS8Q, QCDT8Q, QCTM8Q, 
					PRPR8Q, PRCR8Q, LSRD8Q, FSRD8Q, FSRT8Q, 
					MC018Q, CP018Q, CD018Q, VN018Q, AC018Q, 
					MC028Q, CP028Q, CD028Q, VN028Q, AC028Q, 
					MC038Q, CP038Q, CD038Q, VN038Q, AC038Q, 
					MC048Q, CP048Q, CD048Q, VN048Q, AC048Q, 
					MC058Q, CP058Q, CD058Q, VN058Q, AC058Q, 
					MC068Q, CP068Q, CD068Q, VN068Q, AC068Q, 
					MC078Q, CP078Q, CD078Q, VN078Q, AC078Q, 
					MC088Q, CP088Q, CD088Q, VN088Q, AC088Q, 
					MC098Q, CP098Q, CD098Q, VN098Q, AC098Q, 
					ODDP8Q, ODAR8Q, ODIH8Q, RVDP8Q, RVAR8Q, 
					RVIH8Q, ACDP8Q, ACAR8Q, ACIH8Q, VSAB8Q, 
					CNRF8Q, SRCD8Q, QTYR8Q, IMPP8Q, IMPR8Q, 
					MSCD8Q, PRUM8Q, CVFC8Q, CVFO8Q, CH018Q, 
					CH028Q, CH038Q, CH048Q, CH058Q, CH068Q, 
					CH078Q, CH088Q, CH098Q, CH108Q, VL018Q, 
					VL028Q, VL038Q, VL048Q, VL058Q, VL068Q, 
					VL078Q, VL088Q, VL098Q, VL108Q, CVPR8Q, 
					CVCR8Q, CVCP8Q, AECD8Q, AUCD8Q, SPMT8Q, 
					ACIN8Q, GLUS8Q, GLDT8Q, GLTM8Q, MSJB8Q, 
					MSJL8Q, PCDY8Q
			from VPSFILES.JOBSUM0
			where CONO8Q = <cfqueryparam cfsqltype="CF_SQL_NUMERIC" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.as400.JOBSUM0").init();
			obj.setCONO8Q(qRead.CONO8Q);
			obj.setJBNO8Q(qRead.JBNO8Q);
			obj.setPRCD8Q(qRead.PRCD8Q);
			obj.setCRCD8Q(qRead.CRCD8Q);
			obj.setJBRF8Q(qRead.JBRF8Q);
			obj.setDUDT8Q(qRead.DUDT8Q);
			obj.setJBDT8Q(qRead.JBDT8Q);
			obj.setISDT8Q(qRead.ISDT8Q);
			obj.setCMDT8Q(qRead.CMDT8Q);
			obj.setJSDT8Q(qRead.JSDT8Q);
			obj.setJCDT8Q(qRead.JCDT8Q);
			obj.setASCN8Q(qRead.ASCN8Q);
			obj.setCTRF8Q(qRead.CTRF8Q);
			obj.setSTCD8Q(qRead.STCD8Q);
			obj.setOPSQ8Q(qRead.OPSQ8Q);
			obj.setPRSH8Q(qRead.PRSH8Q);
			obj.setCMMT8Q(qRead.CMMT8Q);
			obj.setVRNO8Q(qRead.VRNO8Q);
			obj.setPLDY8Q(qRead.PLDY8Q);
			obj.setMTPR8Q(qRead.MTPR8Q);
			obj.setLBPR8Q(qRead.LBPR8Q);
			obj.setOTPR8Q(qRead.OTPR8Q);
			obj.setOVPC8Q(qRead.OVPC8Q);
			obj.setOVAM8Q(qRead.OVAM8Q);
			obj.setOVDL8Q(qRead.OVDL8Q);
			obj.setSBDL8Q(qRead.SBDL8Q);
			obj.setSTMC8Q(qRead.STMC8Q);
			obj.setSBMY8Q(qRead.SBMY8Q);
			obj.setMADT8Q(qRead.MADT8Q);
			obj.setTLIS8Q(qRead.TLIS8Q);
			obj.setIS018Q(qRead.IS018Q);
			obj.setIS028Q(qRead.IS028Q);
			obj.setIS038Q(qRead.IS038Q);
			obj.setIS048Q(qRead.IS048Q);
			obj.setIS058Q(qRead.IS058Q);
			obj.setIS068Q(qRead.IS068Q);
			obj.setIS078Q(qRead.IS078Q);
			obj.setIS088Q(qRead.IS088Q);
			obj.setIS098Q(qRead.IS098Q);
			obj.setIS108Q(qRead.IS108Q);
			obj.setIS118Q(qRead.IS118Q);
			obj.setIS128Q(qRead.IS128Q);
			obj.setTLWP8Q(qRead.TLWP8Q);
			obj.setWP018Q(qRead.WP018Q);
			obj.setWP028Q(qRead.WP028Q);
			obj.setWP038Q(qRead.WP038Q);
			obj.setWP048Q(qRead.WP048Q);
			obj.setWP058Q(qRead.WP058Q);
			obj.setWP068Q(qRead.WP068Q);
			obj.setWP078Q(qRead.WP078Q);
			obj.setWP088Q(qRead.WP088Q);
			obj.setWP098Q(qRead.WP098Q);
			obj.setWP108Q(qRead.WP108Q);
			obj.setWP118Q(qRead.WP118Q);
			obj.setWP128Q(qRead.WP128Q);
			obj.setTLSH8Q(qRead.TLSH8Q);
			obj.setSH018Q(qRead.SH018Q);
			obj.setSH028Q(qRead.SH028Q);
			obj.setSH038Q(qRead.SH038Q);
			obj.setSH048Q(qRead.SH048Q);
			obj.setSH058Q(qRead.SH058Q);
			obj.setSH068Q(qRead.SH068Q);
			obj.setSH078Q(qRead.SH078Q);
			obj.setSH088Q(qRead.SH088Q);
			obj.setSH098Q(qRead.SH098Q);
			obj.setSH108Q(qRead.SH108Q);
			obj.setSH118Q(qRead.SH118Q);
			obj.setSH128Q(qRead.SH128Q);
			obj.setTLRC8Q(qRead.TLRC8Q);
			obj.setRC018Q(qRead.RC018Q);
			obj.setRC028Q(qRead.RC028Q);
			obj.setRC038Q(qRead.RC038Q);
			obj.setRC048Q(qRead.RC048Q);
			obj.setRC058Q(qRead.RC058Q);
			obj.setRC068Q(qRead.RC068Q);
			obj.setRC078Q(qRead.RC078Q);
			obj.setRC088Q(qRead.RC088Q);
			obj.setRC098Q(qRead.RC098Q);
			obj.setRC108Q(qRead.RC108Q);
			obj.setRC118Q(qRead.RC118Q);
			obj.setRC128Q(qRead.RC128Q);
			obj.setTLAA8Q(qRead.TLAA8Q);
			obj.setAA018Q(qRead.AA018Q);
			obj.setAA028Q(qRead.AA028Q);
			obj.setAA038Q(qRead.AA038Q);
			obj.setAA048Q(qRead.AA048Q);
			obj.setAA058Q(qRead.AA058Q);
			obj.setAA068Q(qRead.AA068Q);
			obj.setAA078Q(qRead.AA078Q);
			obj.setAA088Q(qRead.AA088Q);
			obj.setAA098Q(qRead.AA098Q);
			obj.setAA108Q(qRead.AA108Q);
			obj.setAA118Q(qRead.AA118Q);
			obj.setAA128Q(qRead.AA128Q);
			obj.setTLAJ8Q(qRead.TLAJ8Q);
			obj.setAJ018Q(qRead.AJ018Q);
			obj.setAJ028Q(qRead.AJ028Q);
			obj.setAJ038Q(qRead.AJ038Q);
			obj.setAJ048Q(qRead.AJ048Q);
			obj.setAJ058Q(qRead.AJ058Q);
			obj.setAJ068Q(qRead.AJ068Q);
			obj.setAJ078Q(qRead.AJ078Q);
			obj.setAJ088Q(qRead.AJ088Q);
			obj.setAJ098Q(qRead.AJ098Q);
			obj.setAJ108Q(qRead.AJ108Q);
			obj.setAJ118Q(qRead.AJ118Q);
			obj.setAJ128Q(qRead.AJ128Q);
			obj.setTLOP8Q(qRead.TLOP8Q);
			obj.setOP018Q(qRead.OP018Q);
			obj.setOP028Q(qRead.OP028Q);
			obj.setOP038Q(qRead.OP038Q);
			obj.setOP048Q(qRead.OP048Q);
			obj.setOP058Q(qRead.OP058Q);
			obj.setOP068Q(qRead.OP068Q);
			obj.setOP078Q(qRead.OP078Q);
			obj.setOP088Q(qRead.OP088Q);
			obj.setOP098Q(qRead.OP098Q);
			obj.setOP108Q(qRead.OP108Q);
			obj.setOP118Q(qRead.OP118Q);
			obj.setOP128Q(qRead.OP128Q);
			obj.setCRUS8Q(qRead.CRUS8Q);
			obj.setCRDT8Q(qRead.CRDT8Q);
			obj.setCRTM8Q(qRead.CRTM8Q);
			obj.setMNUS8Q(qRead.MNUS8Q);
			obj.setMNDT8Q(qRead.MNDT8Q);
			obj.setMNTM8Q(qRead.MNTM8Q);
			obj.setCLSD8Q(qRead.CLSD8Q);
			obj.setCLDT8Q(qRead.CLDT8Q);
			obj.setCTNO8Q(qRead.CTNO8Q);
			obj.setCTL28Q(qRead.CTL28Q);
			obj.setCTL38Q(qRead.CTL38Q);
			obj.setCTL48Q(qRead.CTL48Q);
			obj.setCTL58Q(qRead.CTL58Q);
			obj.setCTL68Q(qRead.CTL68Q);
			obj.setPRMR8Q(qRead.PRMR8Q);
			obj.setPROP8Q(qRead.PROP8Q);
			obj.setMKRF8Q(qRead.MKRF8Q);
			obj.setMKCD8Q(qRead.MKCD8Q);
			obj.setMRPR8Q(qRead.MRPR8Q);
			obj.setPDTP8Q(qRead.PDTP8Q);
			obj.setUPCS8Q(qRead.UPCS8Q);
			obj.setACDT8Q(qRead.ACDT8Q);
			obj.setACRF8Q(qRead.ACRF8Q);
			obj.setESCS8Q(qRead.ESCS8Q);
			obj.setJBBT8Q(qRead.JBBT8Q);
			obj.setCOCD8Q(qRead.COCD8Q);
			obj.setCLW18Q(qRead.CLW18Q);
			obj.setCLB18Q(qRead.CLB18Q);
			obj.setCLD18Q(qRead.CLD18Q);
			obj.setCLI18Q(qRead.CLI18Q);
			obj.setCLM18Q(qRead.CLM18Q);
			obj.setCLW28Q(qRead.CLW28Q);
			obj.setCLB28Q(qRead.CLB28Q);
			obj.setCLD28Q(qRead.CLD28Q);
			obj.setCLI28Q(qRead.CLI28Q);
			obj.setCLM28Q(qRead.CLM28Q);
			obj.setCLW38Q(qRead.CLW38Q);
			obj.setCLB38Q(qRead.CLB38Q);
			obj.setCLD38Q(qRead.CLD38Q);
			obj.setCLI38Q(qRead.CLI38Q);
			obj.setCLM38Q(qRead.CLM38Q);
			obj.setCP118Q(qRead.CP118Q);
			obj.setP1118Q(qRead.P1118Q);
			obj.setP1128Q(qRead.P1128Q);
			obj.setP1138Q(qRead.P1138Q);
			obj.setP1148Q(qRead.P1148Q);
			obj.setP1158Q(qRead.P1158Q);
			obj.setC1118Q(qRead.C1118Q);
			obj.setC1128Q(qRead.C1128Q);
			obj.setC1138Q(qRead.C1138Q);
			obj.setC1148Q(qRead.C1148Q);
			obj.setC1158Q(qRead.C1158Q);
			obj.setCP128Q(qRead.CP128Q);
			obj.setP1218Q(qRead.P1218Q);
			obj.setP1228Q(qRead.P1228Q);
			obj.setP1238Q(qRead.P1238Q);
			obj.setP1248Q(qRead.P1248Q);
			obj.setP1258Q(qRead.P1258Q);
			obj.setC1218Q(qRead.C1218Q);
			obj.setC1228Q(qRead.C1228Q);
			obj.setC1238Q(qRead.C1238Q);
			obj.setC1248Q(qRead.C1248Q);
			obj.setC1258Q(qRead.C1258Q);
			obj.setCP138Q(qRead.CP138Q);
			obj.setP1318Q(qRead.P1318Q);
			obj.setP1328Q(qRead.P1328Q);
			obj.setP1338Q(qRead.P1338Q);
			obj.setP1348Q(qRead.P1348Q);
			obj.setP1358Q(qRead.P1358Q);
			obj.setC1318Q(qRead.C1318Q);
			obj.setC1328Q(qRead.C1328Q);
			obj.setC1338Q(qRead.C1338Q);
			obj.setC1348Q(qRead.C1348Q);
			obj.setC1358Q(qRead.C1358Q);
			obj.setCP218Q(qRead.CP218Q);
			obj.setP2118Q(qRead.P2118Q);
			obj.setP2128Q(qRead.P2128Q);
			obj.setP2138Q(qRead.P2138Q);
			obj.setP2148Q(qRead.P2148Q);
			obj.setP2158Q(qRead.P2158Q);
			obj.setC2118Q(qRead.C2118Q);
			obj.setC2128Q(qRead.C2128Q);
			obj.setC2138Q(qRead.C2138Q);
			obj.setC2148Q(qRead.C2148Q);
			obj.setC2158Q(qRead.C2158Q);
			obj.setCP228Q(qRead.CP228Q);
			obj.setP2218Q(qRead.P2218Q);
			obj.setP2228Q(qRead.P2228Q);
			obj.setP2238Q(qRead.P2238Q);
			obj.setP2248Q(qRead.P2248Q);
			obj.setP2258Q(qRead.P2258Q);
			obj.setC2218Q(qRead.C2218Q);
			obj.setC2228Q(qRead.C2228Q);
			obj.setC2238Q(qRead.C2238Q);
			obj.setC2248Q(qRead.C2248Q);
			obj.setC2258Q(qRead.C2258Q);
			obj.setCP238Q(qRead.CP238Q);
			obj.setP2318Q(qRead.P2318Q);
			obj.setP2328Q(qRead.P2328Q);
			obj.setP2338Q(qRead.P2338Q);
			obj.setP2348Q(qRead.P2348Q);
			obj.setP2358Q(qRead.P2358Q);
			obj.setC2318Q(qRead.C2318Q);
			obj.setC2328Q(qRead.C2328Q);
			obj.setC2338Q(qRead.C2338Q);
			obj.setC2348Q(qRead.C2348Q);
			obj.setC2358Q(qRead.C2358Q);
			obj.setCP318Q(qRead.CP318Q);
			obj.setP3118Q(qRead.P3118Q);
			obj.setP3128Q(qRead.P3128Q);
			obj.setP3138Q(qRead.P3138Q);
			obj.setP3148Q(qRead.P3148Q);
			obj.setP3158Q(qRead.P3158Q);
			obj.setC3118Q(qRead.C3118Q);
			obj.setC3128Q(qRead.C3128Q);
			obj.setC3138Q(qRead.C3138Q);
			obj.setC3148Q(qRead.C3148Q);
			obj.setC3158Q(qRead.C3158Q);
			obj.setCP328Q(qRead.CP328Q);
			obj.setP3218Q(qRead.P3218Q);
			obj.setP3228Q(qRead.P3228Q);
			obj.setP3238Q(qRead.P3238Q);
			obj.setP3248Q(qRead.P3248Q);
			obj.setP3258Q(qRead.P3258Q);
			obj.setC3218Q(qRead.C3218Q);
			obj.setC3228Q(qRead.C3228Q);
			obj.setC3238Q(qRead.C3238Q);
			obj.setC3248Q(qRead.C3248Q);
			obj.setC3258Q(qRead.C3258Q);
			obj.setCP338Q(qRead.CP338Q);
			obj.setP3318Q(qRead.P3318Q);
			obj.setP3328Q(qRead.P3328Q);
			obj.setP3338Q(qRead.P3338Q);
			obj.setP3348Q(qRead.P3348Q);
			obj.setP3358Q(qRead.P3358Q);
			obj.setC3318Q(qRead.C3318Q);
			obj.setC3328Q(qRead.C3328Q);
			obj.setC3338Q(qRead.C3338Q);
			obj.setC3348Q(qRead.C3348Q);
			obj.setC3358Q(qRead.C3358Q);
			obj.setC1FM8Q(qRead.C1FM8Q);
			obj.setC2FM8Q(qRead.C2FM8Q);
			obj.setC3FM8Q(qRead.C3FM8Q);
			obj.setH1FM8Q(qRead.H1FM8Q);
			obj.setH2FM8Q(qRead.H2FM8Q);
			obj.setH3FM8Q(qRead.H3FM8Q);
			obj.setRNNO8Q(qRead.RNNO8Q);
			obj.setCSIT8Q(qRead.CSIT8Q);
			obj.setREPR8Q(qRead.REPR8Q);
			obj.setCPUS8Q(qRead.CPUS8Q);
			obj.setCPDT8Q(qRead.CPDT8Q);
			obj.setCPTM8Q(qRead.CPTM8Q);
			obj.setHPUS8Q(qRead.HPUS8Q);
			obj.setHPDT8Q(qRead.HPDT8Q);
			obj.setHPTM8Q(qRead.HPTM8Q);
			obj.setHLPF8Q(qRead.HLPF8Q);
			obj.setHLAC8Q(qRead.HLAC8Q);
			obj.setHLFG8Q(qRead.HLFG8Q);
			obj.setQCUS8Q(qRead.QCUS8Q);
			obj.setQCDT8Q(qRead.QCDT8Q);
			obj.setQCTM8Q(qRead.QCTM8Q);
			obj.setPRPR8Q(qRead.PRPR8Q);
			obj.setPRCR8Q(qRead.PRCR8Q);
			obj.setLSRD8Q(qRead.LSRD8Q);
			obj.setFSRD8Q(qRead.FSRD8Q);
			obj.setFSRT8Q(qRead.FSRT8Q);
			obj.setMC018Q(qRead.MC018Q);
			obj.setCP018Q(qRead.CP018Q);
			obj.setCD018Q(qRead.CD018Q);
			obj.setVN018Q(qRead.VN018Q);
			obj.setAC018Q(qRead.AC018Q);
			obj.setMC028Q(qRead.MC028Q);
			obj.setCP028Q(qRead.CP028Q);
			obj.setCD028Q(qRead.CD028Q);
			obj.setVN028Q(qRead.VN028Q);
			obj.setAC028Q(qRead.AC028Q);
			obj.setMC038Q(qRead.MC038Q);
			obj.setCP038Q(qRead.CP038Q);
			obj.setCD038Q(qRead.CD038Q);
			obj.setVN038Q(qRead.VN038Q);
			obj.setAC038Q(qRead.AC038Q);
			obj.setMC048Q(qRead.MC048Q);
			obj.setCP048Q(qRead.CP048Q);
			obj.setCD048Q(qRead.CD048Q);
			obj.setVN048Q(qRead.VN048Q);
			obj.setAC048Q(qRead.AC048Q);
			obj.setMC058Q(qRead.MC058Q);
			obj.setCP058Q(qRead.CP058Q);
			obj.setCD058Q(qRead.CD058Q);
			obj.setVN058Q(qRead.VN058Q);
			obj.setAC058Q(qRead.AC058Q);
			obj.setMC068Q(qRead.MC068Q);
			obj.setCP068Q(qRead.CP068Q);
			obj.setCD068Q(qRead.CD068Q);
			obj.setVN068Q(qRead.VN068Q);
			obj.setAC068Q(qRead.AC068Q);
			obj.setMC078Q(qRead.MC078Q);
			obj.setCP078Q(qRead.CP078Q);
			obj.setCD078Q(qRead.CD078Q);
			obj.setVN078Q(qRead.VN078Q);
			obj.setAC078Q(qRead.AC078Q);
			obj.setMC088Q(qRead.MC088Q);
			obj.setCP088Q(qRead.CP088Q);
			obj.setCD088Q(qRead.CD088Q);
			obj.setVN088Q(qRead.VN088Q);
			obj.setAC088Q(qRead.AC088Q);
			obj.setMC098Q(qRead.MC098Q);
			obj.setCP098Q(qRead.CP098Q);
			obj.setCD098Q(qRead.CD098Q);
			obj.setVN098Q(qRead.VN098Q);
			obj.setAC098Q(qRead.AC098Q);
			obj.setODDP8Q(qRead.ODDP8Q);
			obj.setODAR8Q(qRead.ODAR8Q);
			obj.setODIH8Q(qRead.ODIH8Q);
			obj.setRVDP8Q(qRead.RVDP8Q);
			obj.setRVAR8Q(qRead.RVAR8Q);
			obj.setRVIH8Q(qRead.RVIH8Q);
			obj.setACDP8Q(qRead.ACDP8Q);
			obj.setACAR8Q(qRead.ACAR8Q);
			obj.setACIH8Q(qRead.ACIH8Q);
			obj.setVSAB8Q(qRead.VSAB8Q);
			obj.setCNRF8Q(qRead.CNRF8Q);
			obj.setSRCD8Q(qRead.SRCD8Q);
			obj.setQTYR8Q(qRead.QTYR8Q);
			obj.setIMPP8Q(qRead.IMPP8Q);
			obj.setIMPR8Q(qRead.IMPR8Q);
			obj.setMSCD8Q(qRead.MSCD8Q);
			obj.setPRUM8Q(qRead.PRUM8Q);
			obj.setCVFC8Q(qRead.CVFC8Q);
			obj.setCVFO8Q(qRead.CVFO8Q);
			obj.setCH018Q(qRead.CH018Q);
			obj.setCH028Q(qRead.CH028Q);
			obj.setCH038Q(qRead.CH038Q);
			obj.setCH048Q(qRead.CH048Q);
			obj.setCH058Q(qRead.CH058Q);
			obj.setCH068Q(qRead.CH068Q);
			obj.setCH078Q(qRead.CH078Q);
			obj.setCH088Q(qRead.CH088Q);
			obj.setCH098Q(qRead.CH098Q);
			obj.setCH108Q(qRead.CH108Q);
			obj.setVL018Q(qRead.VL018Q);
			obj.setVL028Q(qRead.VL028Q);
			obj.setVL038Q(qRead.VL038Q);
			obj.setVL048Q(qRead.VL048Q);
			obj.setVL058Q(qRead.VL058Q);
			obj.setVL068Q(qRead.VL068Q);
			obj.setVL078Q(qRead.VL078Q);
			obj.setVL088Q(qRead.VL088Q);
			obj.setVL098Q(qRead.VL098Q);
			obj.setVL108Q(qRead.VL108Q);
			obj.setCVPR8Q(qRead.CVPR8Q);
			obj.setCVCR8Q(qRead.CVCR8Q);
			obj.setCVCP8Q(qRead.CVCP8Q);
			obj.setAECD8Q(qRead.AECD8Q);
			obj.setAUCD8Q(qRead.AUCD8Q);
			obj.setSPMT8Q(qRead.SPMT8Q);
			obj.setACIN8Q(qRead.ACIN8Q);
			obj.setGLUS8Q(qRead.GLUS8Q);
			obj.setGLDT8Q(qRead.GLDT8Q);
			obj.setGLTM8Q(qRead.GLTM8Q);
			obj.setMSJB8Q(qRead.MSJB8Q);
			obj.setMSJL8Q(qRead.MSJL8Q);
			obj.setPCDY8Q(qRead.PCDY8Q);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.as400.JOBSUM0">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local0=arguments.bean.getCONO8Q()>
		<cfset var local1=arguments.bean.getJBNO8Q()>
		<cfset var local2=arguments.bean.getPRCD8Q()>
		<cfset var local3=arguments.bean.getCRCD8Q()>
		<cfset var local4=arguments.bean.getJBRF8Q()>
		<cfset var local5=arguments.bean.getDUDT8Q()>
		<cfset var local6=arguments.bean.getJBDT8Q()>
		<cfset var local7=arguments.bean.getISDT8Q()>
		<cfset var local8=arguments.bean.getCMDT8Q()>
		<cfset var local9=arguments.bean.getJSDT8Q()>
		<cfset var local10=arguments.bean.getJCDT8Q()>
		<cfset var local11=arguments.bean.getASCN8Q()>
		<cfset var local12=arguments.bean.getCTRF8Q()>
		<cfset var local13=arguments.bean.getSTCD8Q()>
		<cfset var local14=arguments.bean.getOPSQ8Q()>
		<cfset var local15=arguments.bean.getPRSH8Q()>
		<cfset var local16=arguments.bean.getCMMT8Q()>
		<cfset var local17=arguments.bean.getVRNO8Q()>
		<cfset var local18=arguments.bean.getPLDY8Q()>
		<cfset var local19=arguments.bean.getMTPR8Q()>
		<cfset var local20=arguments.bean.getLBPR8Q()>
		<cfset var local21=arguments.bean.getOTPR8Q()>
		<cfset var local22=arguments.bean.getOVPC8Q()>
		<cfset var local23=arguments.bean.getOVAM8Q()>
		<cfset var local24=arguments.bean.getOVDL8Q()>
		<cfset var local25=arguments.bean.getSBDL8Q()>
		<cfset var local26=arguments.bean.getSTMC8Q()>
		<cfset var local27=arguments.bean.getSBMY8Q()>
		<cfset var local28=arguments.bean.getMADT8Q()>
		<cfset var local29=arguments.bean.getTLIS8Q()>
		<cfset var local30=arguments.bean.getIS018Q()>
		<cfset var local31=arguments.bean.getIS028Q()>
		<cfset var local32=arguments.bean.getIS038Q()>
		<cfset var local33=arguments.bean.getIS048Q()>
		<cfset var local34=arguments.bean.getIS058Q()>
		<cfset var local35=arguments.bean.getIS068Q()>
		<cfset var local36=arguments.bean.getIS078Q()>
		<cfset var local37=arguments.bean.getIS088Q()>
		<cfset var local38=arguments.bean.getIS098Q()>
		<cfset var local39=arguments.bean.getIS108Q()>
		<cfset var local40=arguments.bean.getIS118Q()>
		<cfset var local41=arguments.bean.getIS128Q()>
		<cfset var local42=arguments.bean.getTLWP8Q()>
		<cfset var local43=arguments.bean.getWP018Q()>
		<cfset var local44=arguments.bean.getWP028Q()>
		<cfset var local45=arguments.bean.getWP038Q()>
		<cfset var local46=arguments.bean.getWP048Q()>
		<cfset var local47=arguments.bean.getWP058Q()>
		<cfset var local48=arguments.bean.getWP068Q()>
		<cfset var local49=arguments.bean.getWP078Q()>
		<cfset var local50=arguments.bean.getWP088Q()>
		<cfset var local51=arguments.bean.getWP098Q()>
		<cfset var local52=arguments.bean.getWP108Q()>
		<cfset var local53=arguments.bean.getWP118Q()>
		<cfset var local54=arguments.bean.getWP128Q()>
		<cfset var local55=arguments.bean.getTLSH8Q()>
		<cfset var local56=arguments.bean.getSH018Q()>
		<cfset var local57=arguments.bean.getSH028Q()>
		<cfset var local58=arguments.bean.getSH038Q()>
		<cfset var local59=arguments.bean.getSH048Q()>
		<cfset var local60=arguments.bean.getSH058Q()>
		<cfset var local61=arguments.bean.getSH068Q()>
		<cfset var local62=arguments.bean.getSH078Q()>
		<cfset var local63=arguments.bean.getSH088Q()>
		<cfset var local64=arguments.bean.getSH098Q()>
		<cfset var local65=arguments.bean.getSH108Q()>
		<cfset var local66=arguments.bean.getSH118Q()>
		<cfset var local67=arguments.bean.getSH128Q()>
		<cfset var local68=arguments.bean.getTLRC8Q()>
		<cfset var local69=arguments.bean.getRC018Q()>
		<cfset var local70=arguments.bean.getRC028Q()>
		<cfset var local71=arguments.bean.getRC038Q()>
		<cfset var local72=arguments.bean.getRC048Q()>
		<cfset var local73=arguments.bean.getRC058Q()>
		<cfset var local74=arguments.bean.getRC068Q()>
		<cfset var local75=arguments.bean.getRC078Q()>
		<cfset var local76=arguments.bean.getRC088Q()>
		<cfset var local77=arguments.bean.getRC098Q()>
		<cfset var local78=arguments.bean.getRC108Q()>
		<cfset var local79=arguments.bean.getRC118Q()>
		<cfset var local80=arguments.bean.getRC128Q()>
		<cfset var local81=arguments.bean.getTLAA8Q()>
		<cfset var local82=arguments.bean.getAA018Q()>
		<cfset var local83=arguments.bean.getAA028Q()>
		<cfset var local84=arguments.bean.getAA038Q()>
		<cfset var local85=arguments.bean.getAA048Q()>
		<cfset var local86=arguments.bean.getAA058Q()>
		<cfset var local87=arguments.bean.getAA068Q()>
		<cfset var local88=arguments.bean.getAA078Q()>
		<cfset var local89=arguments.bean.getAA088Q()>
		<cfset var local90=arguments.bean.getAA098Q()>
		<cfset var local91=arguments.bean.getAA108Q()>
		<cfset var local92=arguments.bean.getAA118Q()>
		<cfset var local93=arguments.bean.getAA128Q()>
		<cfset var local94=arguments.bean.getTLAJ8Q()>
		<cfset var local95=arguments.bean.getAJ018Q()>
		<cfset var local96=arguments.bean.getAJ028Q()>
		<cfset var local97=arguments.bean.getAJ038Q()>
		<cfset var local98=arguments.bean.getAJ048Q()>
		<cfset var local99=arguments.bean.getAJ058Q()>
		<cfset var local100=arguments.bean.getAJ068Q()>
		<cfset var local101=arguments.bean.getAJ078Q()>
		<cfset var local102=arguments.bean.getAJ088Q()>
		<cfset var local103=arguments.bean.getAJ098Q()>
		<cfset var local104=arguments.bean.getAJ108Q()>
		<cfset var local105=arguments.bean.getAJ118Q()>
		<cfset var local106=arguments.bean.getAJ128Q()>
		<cfset var local107=arguments.bean.getTLOP8Q()>
		<cfset var local108=arguments.bean.getOP018Q()>
		<cfset var local109=arguments.bean.getOP028Q()>
		<cfset var local110=arguments.bean.getOP038Q()>
		<cfset var local111=arguments.bean.getOP048Q()>
		<cfset var local112=arguments.bean.getOP058Q()>
		<cfset var local113=arguments.bean.getOP068Q()>
		<cfset var local114=arguments.bean.getOP078Q()>
		<cfset var local115=arguments.bean.getOP088Q()>
		<cfset var local116=arguments.bean.getOP098Q()>
		<cfset var local117=arguments.bean.getOP108Q()>
		<cfset var local118=arguments.bean.getOP118Q()>
		<cfset var local119=arguments.bean.getOP128Q()>
		<cfset var local120=arguments.bean.getCRUS8Q()>
		<cfset var local121=arguments.bean.getCRDT8Q()>
		<cfset var local122=arguments.bean.getCRTM8Q()>
		<cfset var local123=arguments.bean.getMNUS8Q()>
		<cfset var local124=arguments.bean.getMNDT8Q()>
		<cfset var local125=arguments.bean.getMNTM8Q()>
		<cfset var local126=arguments.bean.getCLSD8Q()>
		<cfset var local127=arguments.bean.getCLDT8Q()>
		<cfset var local128=arguments.bean.getCTNO8Q()>
		<cfset var local129=arguments.bean.getCTL28Q()>
		<cfset var local130=arguments.bean.getCTL38Q()>
		<cfset var local131=arguments.bean.getCTL48Q()>
		<cfset var local132=arguments.bean.getCTL58Q()>
		<cfset var local133=arguments.bean.getCTL68Q()>
		<cfset var local134=arguments.bean.getPRMR8Q()>
		<cfset var local135=arguments.bean.getPROP8Q()>
		<cfset var local136=arguments.bean.getMKRF8Q()>
		<cfset var local137=arguments.bean.getMKCD8Q()>
		<cfset var local138=arguments.bean.getMRPR8Q()>
		<cfset var local139=arguments.bean.getPDTP8Q()>
		<cfset var local140=arguments.bean.getUPCS8Q()>
		<cfset var local141=arguments.bean.getACDT8Q()>
		<cfset var local142=arguments.bean.getACRF8Q()>
		<cfset var local143=arguments.bean.getESCS8Q()>
		<cfset var local144=arguments.bean.getJBBT8Q()>
		<cfset var local145=arguments.bean.getCOCD8Q()>
		<cfset var local146=arguments.bean.getCLW18Q()>
		<cfset var local147=arguments.bean.getCLB18Q()>
		<cfset var local148=arguments.bean.getCLD18Q()>
		<cfset var local149=arguments.bean.getCLI18Q()>
		<cfset var local150=arguments.bean.getCLM18Q()>
		<cfset var local151=arguments.bean.getCLW28Q()>
		<cfset var local152=arguments.bean.getCLB28Q()>
		<cfset var local153=arguments.bean.getCLD28Q()>
		<cfset var local154=arguments.bean.getCLI28Q()>
		<cfset var local155=arguments.bean.getCLM28Q()>
		<cfset var local156=arguments.bean.getCLW38Q()>
		<cfset var local157=arguments.bean.getCLB38Q()>
		<cfset var local158=arguments.bean.getCLD38Q()>
		<cfset var local159=arguments.bean.getCLI38Q()>
		<cfset var local160=arguments.bean.getCLM38Q()>
		<cfset var local161=arguments.bean.getCP118Q()>
		<cfset var local162=arguments.bean.getP1118Q()>
		<cfset var local163=arguments.bean.getP1128Q()>
		<cfset var local164=arguments.bean.getP1138Q()>
		<cfset var local165=arguments.bean.getP1148Q()>
		<cfset var local166=arguments.bean.getP1158Q()>
		<cfset var local167=arguments.bean.getC1118Q()>
		<cfset var local168=arguments.bean.getC1128Q()>
		<cfset var local169=arguments.bean.getC1138Q()>
		<cfset var local170=arguments.bean.getC1148Q()>
		<cfset var local171=arguments.bean.getC1158Q()>
		<cfset var local172=arguments.bean.getCP128Q()>
		<cfset var local173=arguments.bean.getP1218Q()>
		<cfset var local174=arguments.bean.getP1228Q()>
		<cfset var local175=arguments.bean.getP1238Q()>
		<cfset var local176=arguments.bean.getP1248Q()>
		<cfset var local177=arguments.bean.getP1258Q()>
		<cfset var local178=arguments.bean.getC1218Q()>
		<cfset var local179=arguments.bean.getC1228Q()>
		<cfset var local180=arguments.bean.getC1238Q()>
		<cfset var local181=arguments.bean.getC1248Q()>
		<cfset var local182=arguments.bean.getC1258Q()>
		<cfset var local183=arguments.bean.getCP138Q()>
		<cfset var local184=arguments.bean.getP1318Q()>
		<cfset var local185=arguments.bean.getP1328Q()>
		<cfset var local186=arguments.bean.getP1338Q()>
		<cfset var local187=arguments.bean.getP1348Q()>
		<cfset var local188=arguments.bean.getP1358Q()>
		<cfset var local189=arguments.bean.getC1318Q()>
		<cfset var local190=arguments.bean.getC1328Q()>
		<cfset var local191=arguments.bean.getC1338Q()>
		<cfset var local192=arguments.bean.getC1348Q()>
		<cfset var local193=arguments.bean.getC1358Q()>
		<cfset var local194=arguments.bean.getCP218Q()>
		<cfset var local195=arguments.bean.getP2118Q()>
		<cfset var local196=arguments.bean.getP2128Q()>
		<cfset var local197=arguments.bean.getP2138Q()>
		<cfset var local198=arguments.bean.getP2148Q()>
		<cfset var local199=arguments.bean.getP2158Q()>
		<cfset var local200=arguments.bean.getC2118Q()>
		<cfset var local201=arguments.bean.getC2128Q()>
		<cfset var local202=arguments.bean.getC2138Q()>
		<cfset var local203=arguments.bean.getC2148Q()>
		<cfset var local204=arguments.bean.getC2158Q()>
		<cfset var local205=arguments.bean.getCP228Q()>
		<cfset var local206=arguments.bean.getP2218Q()>
		<cfset var local207=arguments.bean.getP2228Q()>
		<cfset var local208=arguments.bean.getP2238Q()>
		<cfset var local209=arguments.bean.getP2248Q()>
		<cfset var local210=arguments.bean.getP2258Q()>
		<cfset var local211=arguments.bean.getC2218Q()>
		<cfset var local212=arguments.bean.getC2228Q()>
		<cfset var local213=arguments.bean.getC2238Q()>
		<cfset var local214=arguments.bean.getC2248Q()>
		<cfset var local215=arguments.bean.getC2258Q()>
		<cfset var local216=arguments.bean.getCP238Q()>
		<cfset var local217=arguments.bean.getP2318Q()>
		<cfset var local218=arguments.bean.getP2328Q()>
		<cfset var local219=arguments.bean.getP2338Q()>
		<cfset var local220=arguments.bean.getP2348Q()>
		<cfset var local221=arguments.bean.getP2358Q()>
		<cfset var local222=arguments.bean.getC2318Q()>
		<cfset var local223=arguments.bean.getC2328Q()>
		<cfset var local224=arguments.bean.getC2338Q()>
		<cfset var local225=arguments.bean.getC2348Q()>
		<cfset var local226=arguments.bean.getC2358Q()>
		<cfset var local227=arguments.bean.getCP318Q()>
		<cfset var local228=arguments.bean.getP3118Q()>
		<cfset var local229=arguments.bean.getP3128Q()>
		<cfset var local230=arguments.bean.getP3138Q()>
		<cfset var local231=arguments.bean.getP3148Q()>
		<cfset var local232=arguments.bean.getP3158Q()>
		<cfset var local233=arguments.bean.getC3118Q()>
		<cfset var local234=arguments.bean.getC3128Q()>
		<cfset var local235=arguments.bean.getC3138Q()>
		<cfset var local236=arguments.bean.getC3148Q()>
		<cfset var local237=arguments.bean.getC3158Q()>
		<cfset var local238=arguments.bean.getCP328Q()>
		<cfset var local239=arguments.bean.getP3218Q()>
		<cfset var local240=arguments.bean.getP3228Q()>
		<cfset var local241=arguments.bean.getP3238Q()>
		<cfset var local242=arguments.bean.getP3248Q()>
		<cfset var local243=arguments.bean.getP3258Q()>
		<cfset var local244=arguments.bean.getC3218Q()>
		<cfset var local245=arguments.bean.getC3228Q()>
		<cfset var local246=arguments.bean.getC3238Q()>
		<cfset var local247=arguments.bean.getC3248Q()>
		<cfset var local248=arguments.bean.getC3258Q()>
		<cfset var local249=arguments.bean.getCP338Q()>
		<cfset var local250=arguments.bean.getP3318Q()>
		<cfset var local251=arguments.bean.getP3328Q()>
		<cfset var local252=arguments.bean.getP3338Q()>
		<cfset var local253=arguments.bean.getP3348Q()>
		<cfset var local254=arguments.bean.getP3358Q()>
		<cfset var local255=arguments.bean.getC3318Q()>
		<cfset var local256=arguments.bean.getC3328Q()>
		<cfset var local257=arguments.bean.getC3338Q()>
		<cfset var local258=arguments.bean.getC3348Q()>
		<cfset var local259=arguments.bean.getC3358Q()>
		<cfset var local260=arguments.bean.getC1FM8Q()>
		<cfset var local261=arguments.bean.getC2FM8Q()>
		<cfset var local262=arguments.bean.getC3FM8Q()>
		<cfset var local263=arguments.bean.getH1FM8Q()>
		<cfset var local264=arguments.bean.getH2FM8Q()>
		<cfset var local265=arguments.bean.getH3FM8Q()>
		<cfset var local266=arguments.bean.getRNNO8Q()>
		<cfset var local267=arguments.bean.getCSIT8Q()>
		<cfset var local268=arguments.bean.getREPR8Q()>
		<cfset var local269=arguments.bean.getCPUS8Q()>
		<cfset var local270=arguments.bean.getCPDT8Q()>
		<cfset var local271=arguments.bean.getCPTM8Q()>
		<cfset var local272=arguments.bean.getHPUS8Q()>
		<cfset var local273=arguments.bean.getHPDT8Q()>
		<cfset var local274=arguments.bean.getHPTM8Q()>
		<cfset var local275=arguments.bean.getHLPF8Q()>
		<cfset var local276=arguments.bean.getHLAC8Q()>
		<cfset var local277=arguments.bean.getHLFG8Q()>
		<cfset var local278=arguments.bean.getQCUS8Q()>
		<cfset var local279=arguments.bean.getQCDT8Q()>
		<cfset var local280=arguments.bean.getQCTM8Q()>
		<cfset var local281=arguments.bean.getPRPR8Q()>
		<cfset var local282=arguments.bean.getPRCR8Q()>
		<cfset var local283=arguments.bean.getLSRD8Q()>
		<cfset var local284=arguments.bean.getFSRD8Q()>
		<cfset var local285=arguments.bean.getFSRT8Q()>
		<cfset var local286=arguments.bean.getMC018Q()>
		<cfset var local287=arguments.bean.getCP018Q()>
		<cfset var local288=arguments.bean.getCD018Q()>
		<cfset var local289=arguments.bean.getVN018Q()>
		<cfset var local290=arguments.bean.getAC018Q()>
		<cfset var local291=arguments.bean.getMC028Q()>
		<cfset var local292=arguments.bean.getCP028Q()>
		<cfset var local293=arguments.bean.getCD028Q()>
		<cfset var local294=arguments.bean.getVN028Q()>
		<cfset var local295=arguments.bean.getAC028Q()>
		<cfset var local296=arguments.bean.getMC038Q()>
		<cfset var local297=arguments.bean.getCP038Q()>
		<cfset var local298=arguments.bean.getCD038Q()>
		<cfset var local299=arguments.bean.getVN038Q()>
		<cfset var local300=arguments.bean.getAC038Q()>
		<cfset var local301=arguments.bean.getMC048Q()>
		<cfset var local302=arguments.bean.getCP048Q()>
		<cfset var local303=arguments.bean.getCD048Q()>
		<cfset var local304=arguments.bean.getVN048Q()>
		<cfset var local305=arguments.bean.getAC048Q()>
		<cfset var local306=arguments.bean.getMC058Q()>
		<cfset var local307=arguments.bean.getCP058Q()>
		<cfset var local308=arguments.bean.getCD058Q()>
		<cfset var local309=arguments.bean.getVN058Q()>
		<cfset var local310=arguments.bean.getAC058Q()>
		<cfset var local311=arguments.bean.getMC068Q()>
		<cfset var local312=arguments.bean.getCP068Q()>
		<cfset var local313=arguments.bean.getCD068Q()>
		<cfset var local314=arguments.bean.getVN068Q()>
		<cfset var local315=arguments.bean.getAC068Q()>
		<cfset var local316=arguments.bean.getMC078Q()>
		<cfset var local317=arguments.bean.getCP078Q()>
		<cfset var local318=arguments.bean.getCD078Q()>
		<cfset var local319=arguments.bean.getVN078Q()>
		<cfset var local320=arguments.bean.getAC078Q()>
		<cfset var local321=arguments.bean.getMC088Q()>
		<cfset var local322=arguments.bean.getCP088Q()>
		<cfset var local323=arguments.bean.getCD088Q()>
		<cfset var local324=arguments.bean.getVN088Q()>
		<cfset var local325=arguments.bean.getAC088Q()>
		<cfset var local326=arguments.bean.getMC098Q()>
		<cfset var local327=arguments.bean.getCP098Q()>
		<cfset var local328=arguments.bean.getCD098Q()>
		<cfset var local329=arguments.bean.getVN098Q()>
		<cfset var local330=arguments.bean.getAC098Q()>
		<cfset var local331=arguments.bean.getODDP8Q()>
		<cfset var local332=arguments.bean.getODAR8Q()>
		<cfset var local333=arguments.bean.getODIH8Q()>
		<cfset var local334=arguments.bean.getRVDP8Q()>
		<cfset var local335=arguments.bean.getRVAR8Q()>
		<cfset var local336=arguments.bean.getRVIH8Q()>
		<cfset var local337=arguments.bean.getACDP8Q()>
		<cfset var local338=arguments.bean.getACAR8Q()>
		<cfset var local339=arguments.bean.getACIH8Q()>
		<cfset var local340=arguments.bean.getVSAB8Q()>
		<cfset var local341=arguments.bean.getCNRF8Q()>
		<cfset var local342=arguments.bean.getSRCD8Q()>
		<cfset var local343=arguments.bean.getQTYR8Q()>
		<cfset var local344=arguments.bean.getIMPP8Q()>
		<cfset var local345=arguments.bean.getIMPR8Q()>
		<cfset var local346=arguments.bean.getMSCD8Q()>
		<cfset var local347=arguments.bean.getPRUM8Q()>
		<cfset var local348=arguments.bean.getCVFC8Q()>
		<cfset var local349=arguments.bean.getCVFO8Q()>
		<cfset var local350=arguments.bean.getCH018Q()>
		<cfset var local351=arguments.bean.getCH028Q()>
		<cfset var local352=arguments.bean.getCH038Q()>
		<cfset var local353=arguments.bean.getCH048Q()>
		<cfset var local354=arguments.bean.getCH058Q()>
		<cfset var local355=arguments.bean.getCH068Q()>
		<cfset var local356=arguments.bean.getCH078Q()>
		<cfset var local357=arguments.bean.getCH088Q()>
		<cfset var local358=arguments.bean.getCH098Q()>
		<cfset var local359=arguments.bean.getCH108Q()>
		<cfset var local360=arguments.bean.getVL018Q()>
		<cfset var local361=arguments.bean.getVL028Q()>
		<cfset var local362=arguments.bean.getVL038Q()>
		<cfset var local363=arguments.bean.getVL048Q()>
		<cfset var local364=arguments.bean.getVL058Q()>
		<cfset var local365=arguments.bean.getVL068Q()>
		<cfset var local366=arguments.bean.getVL078Q()>
		<cfset var local367=arguments.bean.getVL088Q()>
		<cfset var local368=arguments.bean.getVL098Q()>
		<cfset var local369=arguments.bean.getVL108Q()>
		<cfset var local370=arguments.bean.getCVPR8Q()>
		<cfset var local371=arguments.bean.getCVCR8Q()>
		<cfset var local372=arguments.bean.getCVCP8Q()>
		<cfset var local373=arguments.bean.getAECD8Q()>
		<cfset var local374=arguments.bean.getAUCD8Q()>
		<cfset var local375=arguments.bean.getSPMT8Q()>
		<cfset var local376=arguments.bean.getACIN8Q()>
		<cfset var local377=arguments.bean.getGLUS8Q()>
		<cfset var local378=arguments.bean.getGLDT8Q()>
		<cfset var local379=arguments.bean.getGLTM8Q()>
		<cfset var local380=arguments.bean.getMSJB8Q()>
		<cfset var local381=arguments.bean.getMSJL8Q()>
		<cfset var local382=arguments.bean.getPCDY8Q()>

		<cfquery name="qCreate" datasource="AS400">
			insert into VPSFILES.JOBSUM0(CONO8Q, JBNO8Q, PRCD8Q, CRCD8Q, JBRF8Q, DUDT8Q, JBDT8Q, ISDT8Q, CMDT8Q, JSDT8Q, JCDT8Q, ASCN8Q, CTRF8Q, STCD8Q, OPSQ8Q, PRSH8Q, CMMT8Q, VRNO8Q, PLDY8Q, MTPR8Q, LBPR8Q, OTPR8Q, OVPC8Q, OVAM8Q, OVDL8Q, SBDL8Q, STMC8Q, SBMY8Q, MADT8Q, TLIS8Q, IS018Q, IS028Q, IS038Q, IS048Q, IS058Q, IS068Q, IS078Q, IS088Q, IS098Q, IS108Q, IS118Q, IS128Q, TLWP8Q, WP018Q, WP028Q, WP038Q, WP048Q, WP058Q, WP068Q, WP078Q, WP088Q, WP098Q, WP108Q, WP118Q, WP128Q, TLSH8Q, SH018Q, SH028Q, SH038Q, SH048Q, SH058Q, SH068Q, SH078Q, SH088Q, SH098Q, SH108Q, SH118Q, SH128Q, TLRC8Q, RC018Q, RC028Q, RC038Q, RC048Q, RC058Q, RC068Q, RC078Q, RC088Q, RC098Q, RC108Q, RC118Q, RC128Q, TLAA8Q, AA018Q, AA028Q, AA038Q, AA048Q, AA058Q, AA068Q, AA078Q, AA088Q, AA098Q, AA108Q, AA118Q, AA128Q, TLAJ8Q, AJ018Q, AJ028Q, AJ038Q, AJ048Q, AJ058Q, AJ068Q, AJ078Q, AJ088Q, AJ098Q, AJ108Q, AJ118Q, AJ128Q, TLOP8Q, OP018Q, OP028Q, OP038Q, OP048Q, OP058Q, OP068Q, OP078Q, OP088Q, OP098Q, OP108Q, OP118Q, OP128Q, CRUS8Q, CRDT8Q, CRTM8Q, MNUS8Q, MNDT8Q, MNTM8Q, CLSD8Q, CLDT8Q, CTNO8Q, CTL28Q, CTL38Q, CTL48Q, CTL58Q, CTL68Q, PRMR8Q, PROP8Q, MKRF8Q, MKCD8Q, MRPR8Q, PDTP8Q, UPCS8Q, ACDT8Q, ACRF8Q, ESCS8Q, JBBT8Q, COCD8Q, CLW18Q, CLB18Q, CLD18Q, CLI18Q, CLM18Q, CLW28Q, CLB28Q, CLD28Q, CLI28Q, CLM28Q, CLW38Q, CLB38Q, CLD38Q, CLI38Q, CLM38Q, CP118Q, P1118Q, P1128Q, P1138Q, P1148Q, P1158Q, C1118Q, C1128Q, C1138Q, C1148Q, C1158Q, CP128Q, P1218Q, P1228Q, P1238Q, P1248Q, P1258Q, C1218Q, C1228Q, C1238Q, C1248Q, C1258Q, CP138Q, P1318Q, P1328Q, P1338Q, P1348Q, P1358Q, C1318Q, C1328Q, C1338Q, C1348Q, C1358Q, CP218Q, P2118Q, P2128Q, P2138Q, P2148Q, P2158Q, C2118Q, C2128Q, C2138Q, C2148Q, C2158Q, CP228Q, P2218Q, P2228Q, P2238Q, P2248Q, P2258Q, C2218Q, C2228Q, C2238Q, C2248Q, C2258Q, CP238Q, P2318Q, P2328Q, P2338Q, P2348Q, P2358Q, C2318Q, C2328Q, C2338Q, C2348Q, C2358Q, CP318Q, P3118Q, P3128Q, P3138Q, P3148Q, P3158Q, C3118Q, C3128Q, C3138Q, C3148Q, C3158Q, CP328Q, P3218Q, P3228Q, P3238Q, P3248Q, P3258Q, C3218Q, C3228Q, C3238Q, C3248Q, C3258Q, CP338Q, P3318Q, P3328Q, P3338Q, P3348Q, P3358Q, C3318Q, C3328Q, C3338Q, C3348Q, C3358Q, C1FM8Q, C2FM8Q, C3FM8Q, H1FM8Q, H2FM8Q, H3FM8Q, RNNO8Q, CSIT8Q, REPR8Q, CPUS8Q, CPDT8Q, CPTM8Q, HPUS8Q, HPDT8Q, HPTM8Q, HLPF8Q, HLAC8Q, HLFG8Q, QCUS8Q, QCDT8Q, QCTM8Q, PRPR8Q, PRCR8Q, LSRD8Q, FSRD8Q, FSRT8Q, MC018Q, CP018Q, CD018Q, VN018Q, AC018Q, MC028Q, CP028Q, CD028Q, VN028Q, AC028Q, MC038Q, CP038Q, CD038Q, VN038Q, AC038Q, MC048Q, CP048Q, CD048Q, VN048Q, AC048Q, MC058Q, CP058Q, CD058Q, VN058Q, AC058Q, MC068Q, CP068Q, CD068Q, VN068Q, AC068Q, MC078Q, CP078Q, CD078Q, VN078Q, AC078Q, MC088Q, CP088Q, CD088Q, VN088Q, AC088Q, MC098Q, CP098Q, CD098Q, VN098Q, AC098Q, ODDP8Q, ODAR8Q, ODIH8Q, RVDP8Q, RVAR8Q, RVIH8Q, ACDP8Q, ACAR8Q, ACIH8Q, VSAB8Q, CNRF8Q, SRCD8Q, QTYR8Q, IMPP8Q, IMPR8Q, MSCD8Q, PRUM8Q, CVFC8Q, CVFO8Q, CH018Q, CH028Q, CH038Q, CH048Q, CH058Q, CH068Q, CH078Q, CH088Q, CH098Q, CH108Q, VL018Q, VL028Q, VL038Q, VL048Q, VL058Q, VL068Q, VL078Q, VL088Q, VL098Q, VL108Q, CVPR8Q, CVCR8Q, CVCP8Q, AECD8Q, AUCD8Q, SPMT8Q, ACIN8Q, GLUS8Q, GLDT8Q, GLTM8Q, MSJB8Q, MSJL8Q, PCDY8Q)
			values (
				<cfqueryparam value="#local0#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local0 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local1#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local2#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local3#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local4#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local5#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local5 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local6#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local6 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local7#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local7 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local8#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local8 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local9#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local9 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local10#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local10 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local11#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local11 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local12#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local13#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local14#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local14 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local15#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local16#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local17#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local17 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local18#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local18 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local19#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local19 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local20#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local20 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local21#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local21 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local22#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local22 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local23#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local23 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local24#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local24 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local25#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local25 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local26#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local26 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local27#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local27 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local28#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local28 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local29#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local29 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local30#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local30 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local31#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local31 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local32#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local32 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local33#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local33 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local34#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local34 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local35#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local35 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local36#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local36 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local37#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local37 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local38#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local38 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local39#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local39 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local40#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local40 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local41#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local41 eq ""), de("yes"), de("no"))#" />,
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
				<cfqueryparam value="#local58#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local58 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local59#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local59 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local60#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local60 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local61#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local61 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local62#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local62 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local63#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local63 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local64#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local64 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local65#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local65 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local66#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local66 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local67#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local67 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local68#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local68 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local69#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local69 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local70#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local70 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local71#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local71 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local72#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local72 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local73#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local73 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local74#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local74 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local75#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local75 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local76#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local76 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local77#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local77 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local78#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local78 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local79#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local79 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local80#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local80 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local81#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local81 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local82#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local82 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local83#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local83 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local84#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local84 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local85#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local85 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local86#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local86 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local87#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local87 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local88#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local88 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local89#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local89 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local90#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local90 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local91#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local91 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local92#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local92 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local93#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local93 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local94#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local94 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local95#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local95 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local96#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local96 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local97#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local97 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local98#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local98 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local99#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local99 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local100#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local100 eq ""), de("yes"), de("no"))#" />,
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
				<cfqueryparam value="#local120#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local121#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local121 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local122#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local122 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local123#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local124#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local124 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local125#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local125 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local126#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local127#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local127 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local128#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local128 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local129#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local130#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local131#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local132#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local133#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local134#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local135#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local136#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local137#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local138#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local139#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local140#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local141#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local141 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local142#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local143#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local143 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local144#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local144 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local145#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local146#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local147#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local148#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local149#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local150#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local151#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local152#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local153#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local154#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local155#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local156#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local157#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local158#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local159#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local160#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local161#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local162#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local162 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local163#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local163 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local164#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local164 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local165#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local165 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local166#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local166 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local167#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local168#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local169#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local170#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local171#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local172#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local173#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local173 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local174#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local174 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local175#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local175 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local176#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local176 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local177#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local177 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local178#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local179#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local180#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local181#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local182#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local183#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local184#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local184 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local185#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local185 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local186#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local186 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local187#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local187 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local188#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local188 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local189#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local190#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local191#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local192#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local193#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local194#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local195#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local195 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local196#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local196 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local197#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local197 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local198#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local198 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local199#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local199 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local200#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local201#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local202#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local203#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local204#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local205#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local206#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local206 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local207#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local207 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local208#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local208 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local209#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local209 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local210#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local210 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local211#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local212#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local213#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local214#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local215#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local216#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local217#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local217 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local218#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local218 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local219#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local219 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local220#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local220 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local221#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local221 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local222#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local223#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local224#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local225#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local226#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local227#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local228#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local228 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local229#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local229 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local230#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local230 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local231#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local231 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local232#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local232 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local233#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local234#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local235#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local236#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local237#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local238#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local239#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local239 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local240#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local240 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local241#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local241 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local242#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local242 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local243#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local243 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local244#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local245#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local246#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local247#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local248#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local249#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local250#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local250 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local251#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local251 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local252#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local252 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local253#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local253 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local254#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local254 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local255#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local256#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local257#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local258#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local259#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local260#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local260 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local261#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local261 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local262#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local262 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local263#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local263 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local264#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local264 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local265#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local265 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local266#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local267#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local268#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local268 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local269#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local270#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local270 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local271#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local271 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local272#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local273#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local273 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local274#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local274 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local275#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local276#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local277#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local278#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local279#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local279 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local280#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local280 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local281#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local282#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local283#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local283 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local284#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local284 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local285#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local285 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local286#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local287#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local287 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local288#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local288 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local289#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local289 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local290#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local291#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local292#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local292 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local293#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local293 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local294#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local294 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local295#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local296#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local297#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local297 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local298#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local298 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local299#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local299 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local300#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local301#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local302#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local302 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local303#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local303 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local304#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local304 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local305#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local306#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local307#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local307 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local308#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local308 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local309#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local309 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local310#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local311#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local312#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local312 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local313#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local313 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local314#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local314 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local315#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local316#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local317#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local317 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local318#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local318 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local319#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local319 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local320#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local321#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local322#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local322 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local323#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local323 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local324#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local324 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local325#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local326#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local327#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local327 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local328#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local328 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local329#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local329 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local330#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local331#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local331 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local332#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local332 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local333#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local333 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local334#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local334 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local335#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local335 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local336#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local336 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local337#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local337 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local338#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local338 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local339#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local339 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local340#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local341#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local342#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local343#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local343 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local344#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local344 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local345#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local345 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local346#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local347#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local348#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local348 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local349#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local350#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local351#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local352#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local353#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local354#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local355#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local356#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local357#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local358#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local359#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local360#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local361#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local362#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local363#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local364#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local365#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local366#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local367#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local368#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local369#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local370#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local371#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local372#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local372 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local373#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local373 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local374#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local374 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local375#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local376#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local377#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local378#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local378 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local379#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local379 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local380#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local380 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local381#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local381 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local382#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local382 eq ""), de("yes"), de("no"))#" />
			)
		</cfquery>

		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.as400.JOBSUM0">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="AS400" result="status">
			update VPSFILES.JOBSUM0
			set CONO8Q = <cfqueryparam value="#arguments.bean.getCONO8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getCONO8Q() eq ""), de("yes"), de("no"))#" />,
				JBNO8Q = <cfqueryparam value="#arguments.bean.getJBNO8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getJBNO8Q() eq ""), de("yes"), de("no"))#" />,
				PRCD8Q = <cfqueryparam value="#arguments.bean.getPRCD8Q()#" cfsqltype="CF_SQL_CHAR" />,
				CRCD8Q = <cfqueryparam value="#arguments.bean.getCRCD8Q()#" cfsqltype="CF_SQL_CHAR" />,
				JBRF8Q = <cfqueryparam value="#arguments.bean.getJBRF8Q()#" cfsqltype="CF_SQL_CHAR" />,
				DUDT8Q = <cfqueryparam value="#arguments.bean.getDUDT8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getDUDT8Q() eq ""), de("yes"), de("no"))#" />,
				JBDT8Q = <cfqueryparam value="#arguments.bean.getJBDT8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getJBDT8Q() eq ""), de("yes"), de("no"))#" />,
				ISDT8Q = <cfqueryparam value="#arguments.bean.getISDT8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getISDT8Q() eq ""), de("yes"), de("no"))#" />,
				CMDT8Q = <cfqueryparam value="#arguments.bean.getCMDT8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getCMDT8Q() eq ""), de("yes"), de("no"))#" />,
				JSDT8Q = <cfqueryparam value="#arguments.bean.getJSDT8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getJSDT8Q() eq ""), de("yes"), de("no"))#" />,
				JCDT8Q = <cfqueryparam value="#arguments.bean.getJCDT8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getJCDT8Q() eq ""), de("yes"), de("no"))#" />,
				ASCN8Q = <cfqueryparam value="#arguments.bean.getASCN8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getASCN8Q() eq ""), de("yes"), de("no"))#" />,
				CTRF8Q = <cfqueryparam value="#arguments.bean.getCTRF8Q()#" cfsqltype="CF_SQL_CHAR" />,
				STCD8Q = <cfqueryparam value="#arguments.bean.getSTCD8Q()#" cfsqltype="CF_SQL_CHAR" />,
				OPSQ8Q = <cfqueryparam value="#arguments.bean.getOPSQ8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getOPSQ8Q() eq ""), de("yes"), de("no"))#" />,
				PRSH8Q = <cfqueryparam value="#arguments.bean.getPRSH8Q()#" cfsqltype="CF_SQL_CHAR" />,
				CMMT8Q = <cfqueryparam value="#arguments.bean.getCMMT8Q()#" cfsqltype="CF_SQL_CHAR" />,
				VRNO8Q = <cfqueryparam value="#arguments.bean.getVRNO8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getVRNO8Q() eq ""), de("yes"), de("no"))#" />,
				PLDY8Q = <cfqueryparam value="#arguments.bean.getPLDY8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getPLDY8Q() eq ""), de("yes"), de("no"))#" />,
				MTPR8Q = <cfqueryparam value="#arguments.bean.getMTPR8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getMTPR8Q() eq ""), de("yes"), de("no"))#" />,
				LBPR8Q = <cfqueryparam value="#arguments.bean.getLBPR8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getLBPR8Q() eq ""), de("yes"), de("no"))#" />,
				OTPR8Q = <cfqueryparam value="#arguments.bean.getOTPR8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getOTPR8Q() eq ""), de("yes"), de("no"))#" />,
				OVPC8Q = <cfqueryparam value="#arguments.bean.getOVPC8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getOVPC8Q() eq ""), de("yes"), de("no"))#" />,
				OVAM8Q = <cfqueryparam value="#arguments.bean.getOVAM8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getOVAM8Q() eq ""), de("yes"), de("no"))#" />,
				OVDL8Q = <cfqueryparam value="#arguments.bean.getOVDL8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getOVDL8Q() eq ""), de("yes"), de("no"))#" />,
				SBDL8Q = <cfqueryparam value="#arguments.bean.getSBDL8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSBDL8Q() eq ""), de("yes"), de("no"))#" />,
				STMC8Q = <cfqueryparam value="#arguments.bean.getSTMC8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSTMC8Q() eq ""), de("yes"), de("no"))#" />,
				SBMY8Q = <cfqueryparam value="#arguments.bean.getSBMY8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSBMY8Q() eq ""), de("yes"), de("no"))#" />,
				MADT8Q = <cfqueryparam value="#arguments.bean.getMADT8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getMADT8Q() eq ""), de("yes"), de("no"))#" />,
				TLIS8Q = <cfqueryparam value="#arguments.bean.getTLIS8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLIS8Q() eq ""), de("yes"), de("no"))#" />,
				IS018Q = <cfqueryparam value="#arguments.bean.getIS018Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getIS018Q() eq ""), de("yes"), de("no"))#" />,
				IS028Q = <cfqueryparam value="#arguments.bean.getIS028Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getIS028Q() eq ""), de("yes"), de("no"))#" />,
				IS038Q = <cfqueryparam value="#arguments.bean.getIS038Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getIS038Q() eq ""), de("yes"), de("no"))#" />,
				IS048Q = <cfqueryparam value="#arguments.bean.getIS048Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getIS048Q() eq ""), de("yes"), de("no"))#" />,
				IS058Q = <cfqueryparam value="#arguments.bean.getIS058Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getIS058Q() eq ""), de("yes"), de("no"))#" />,
				IS068Q = <cfqueryparam value="#arguments.bean.getIS068Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getIS068Q() eq ""), de("yes"), de("no"))#" />,
				IS078Q = <cfqueryparam value="#arguments.bean.getIS078Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getIS078Q() eq ""), de("yes"), de("no"))#" />,
				IS088Q = <cfqueryparam value="#arguments.bean.getIS088Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getIS088Q() eq ""), de("yes"), de("no"))#" />,
				IS098Q = <cfqueryparam value="#arguments.bean.getIS098Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getIS098Q() eq ""), de("yes"), de("no"))#" />,
				IS108Q = <cfqueryparam value="#arguments.bean.getIS108Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getIS108Q() eq ""), de("yes"), de("no"))#" />,
				IS118Q = <cfqueryparam value="#arguments.bean.getIS118Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getIS118Q() eq ""), de("yes"), de("no"))#" />,
				IS128Q = <cfqueryparam value="#arguments.bean.getIS128Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getIS128Q() eq ""), de("yes"), de("no"))#" />,
				TLWP8Q = <cfqueryparam value="#arguments.bean.getTLWP8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLWP8Q() eq ""), de("yes"), de("no"))#" />,
				WP018Q = <cfqueryparam value="#arguments.bean.getWP018Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getWP018Q() eq ""), de("yes"), de("no"))#" />,
				WP028Q = <cfqueryparam value="#arguments.bean.getWP028Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getWP028Q() eq ""), de("yes"), de("no"))#" />,
				WP038Q = <cfqueryparam value="#arguments.bean.getWP038Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getWP038Q() eq ""), de("yes"), de("no"))#" />,
				WP048Q = <cfqueryparam value="#arguments.bean.getWP048Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getWP048Q() eq ""), de("yes"), de("no"))#" />,
				WP058Q = <cfqueryparam value="#arguments.bean.getWP058Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getWP058Q() eq ""), de("yes"), de("no"))#" />,
				WP068Q = <cfqueryparam value="#arguments.bean.getWP068Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getWP068Q() eq ""), de("yes"), de("no"))#" />,
				WP078Q = <cfqueryparam value="#arguments.bean.getWP078Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getWP078Q() eq ""), de("yes"), de("no"))#" />,
				WP088Q = <cfqueryparam value="#arguments.bean.getWP088Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getWP088Q() eq ""), de("yes"), de("no"))#" />,
				WP098Q = <cfqueryparam value="#arguments.bean.getWP098Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getWP098Q() eq ""), de("yes"), de("no"))#" />,
				WP108Q = <cfqueryparam value="#arguments.bean.getWP108Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getWP108Q() eq ""), de("yes"), de("no"))#" />,
				WP118Q = <cfqueryparam value="#arguments.bean.getWP118Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getWP118Q() eq ""), de("yes"), de("no"))#" />,
				WP128Q = <cfqueryparam value="#arguments.bean.getWP128Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getWP128Q() eq ""), de("yes"), de("no"))#" />,
				TLSH8Q = <cfqueryparam value="#arguments.bean.getTLSH8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLSH8Q() eq ""), de("yes"), de("no"))#" />,
				SH018Q = <cfqueryparam value="#arguments.bean.getSH018Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSH018Q() eq ""), de("yes"), de("no"))#" />,
				SH028Q = <cfqueryparam value="#arguments.bean.getSH028Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSH028Q() eq ""), de("yes"), de("no"))#" />,
				SH038Q = <cfqueryparam value="#arguments.bean.getSH038Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSH038Q() eq ""), de("yes"), de("no"))#" />,
				SH048Q = <cfqueryparam value="#arguments.bean.getSH048Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSH048Q() eq ""), de("yes"), de("no"))#" />,
				SH058Q = <cfqueryparam value="#arguments.bean.getSH058Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSH058Q() eq ""), de("yes"), de("no"))#" />,
				SH068Q = <cfqueryparam value="#arguments.bean.getSH068Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSH068Q() eq ""), de("yes"), de("no"))#" />,
				SH078Q = <cfqueryparam value="#arguments.bean.getSH078Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSH078Q() eq ""), de("yes"), de("no"))#" />,
				SH088Q = <cfqueryparam value="#arguments.bean.getSH088Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSH088Q() eq ""), de("yes"), de("no"))#" />,
				SH098Q = <cfqueryparam value="#arguments.bean.getSH098Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSH098Q() eq ""), de("yes"), de("no"))#" />,
				SH108Q = <cfqueryparam value="#arguments.bean.getSH108Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSH108Q() eq ""), de("yes"), de("no"))#" />,
				SH118Q = <cfqueryparam value="#arguments.bean.getSH118Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSH118Q() eq ""), de("yes"), de("no"))#" />,
				SH128Q = <cfqueryparam value="#arguments.bean.getSH128Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSH128Q() eq ""), de("yes"), de("no"))#" />,
				TLRC8Q = <cfqueryparam value="#arguments.bean.getTLRC8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLRC8Q() eq ""), de("yes"), de("no"))#" />,
				RC018Q = <cfqueryparam value="#arguments.bean.getRC018Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getRC018Q() eq ""), de("yes"), de("no"))#" />,
				RC028Q = <cfqueryparam value="#arguments.bean.getRC028Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getRC028Q() eq ""), de("yes"), de("no"))#" />,
				RC038Q = <cfqueryparam value="#arguments.bean.getRC038Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getRC038Q() eq ""), de("yes"), de("no"))#" />,
				RC048Q = <cfqueryparam value="#arguments.bean.getRC048Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getRC048Q() eq ""), de("yes"), de("no"))#" />,
				RC058Q = <cfqueryparam value="#arguments.bean.getRC058Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getRC058Q() eq ""), de("yes"), de("no"))#" />,
				RC068Q = <cfqueryparam value="#arguments.bean.getRC068Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getRC068Q() eq ""), de("yes"), de("no"))#" />,
				RC078Q = <cfqueryparam value="#arguments.bean.getRC078Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getRC078Q() eq ""), de("yes"), de("no"))#" />,
				RC088Q = <cfqueryparam value="#arguments.bean.getRC088Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getRC088Q() eq ""), de("yes"), de("no"))#" />,
				RC098Q = <cfqueryparam value="#arguments.bean.getRC098Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getRC098Q() eq ""), de("yes"), de("no"))#" />,
				RC108Q = <cfqueryparam value="#arguments.bean.getRC108Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getRC108Q() eq ""), de("yes"), de("no"))#" />,
				RC118Q = <cfqueryparam value="#arguments.bean.getRC118Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getRC118Q() eq ""), de("yes"), de("no"))#" />,
				RC128Q = <cfqueryparam value="#arguments.bean.getRC128Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getRC128Q() eq ""), de("yes"), de("no"))#" />,
				TLAA8Q = <cfqueryparam value="#arguments.bean.getTLAA8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLAA8Q() eq ""), de("yes"), de("no"))#" />,
				AA018Q = <cfqueryparam value="#arguments.bean.getAA018Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getAA018Q() eq ""), de("yes"), de("no"))#" />,
				AA028Q = <cfqueryparam value="#arguments.bean.getAA028Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getAA028Q() eq ""), de("yes"), de("no"))#" />,
				AA038Q = <cfqueryparam value="#arguments.bean.getAA038Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getAA038Q() eq ""), de("yes"), de("no"))#" />,
				AA048Q = <cfqueryparam value="#arguments.bean.getAA048Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getAA048Q() eq ""), de("yes"), de("no"))#" />,
				AA058Q = <cfqueryparam value="#arguments.bean.getAA058Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getAA058Q() eq ""), de("yes"), de("no"))#" />,
				AA068Q = <cfqueryparam value="#arguments.bean.getAA068Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getAA068Q() eq ""), de("yes"), de("no"))#" />,
				AA078Q = <cfqueryparam value="#arguments.bean.getAA078Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getAA078Q() eq ""), de("yes"), de("no"))#" />,
				AA088Q = <cfqueryparam value="#arguments.bean.getAA088Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getAA088Q() eq ""), de("yes"), de("no"))#" />,
				AA098Q = <cfqueryparam value="#arguments.bean.getAA098Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getAA098Q() eq ""), de("yes"), de("no"))#" />,
				AA108Q = <cfqueryparam value="#arguments.bean.getAA108Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getAA108Q() eq ""), de("yes"), de("no"))#" />,
				AA118Q = <cfqueryparam value="#arguments.bean.getAA118Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getAA118Q() eq ""), de("yes"), de("no"))#" />,
				AA128Q = <cfqueryparam value="#arguments.bean.getAA128Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getAA128Q() eq ""), de("yes"), de("no"))#" />,
				TLAJ8Q = <cfqueryparam value="#arguments.bean.getTLAJ8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLAJ8Q() eq ""), de("yes"), de("no"))#" />,
				AJ018Q = <cfqueryparam value="#arguments.bean.getAJ018Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getAJ018Q() eq ""), de("yes"), de("no"))#" />,
				AJ028Q = <cfqueryparam value="#arguments.bean.getAJ028Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getAJ028Q() eq ""), de("yes"), de("no"))#" />,
				AJ038Q = <cfqueryparam value="#arguments.bean.getAJ038Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getAJ038Q() eq ""), de("yes"), de("no"))#" />,
				AJ048Q = <cfqueryparam value="#arguments.bean.getAJ048Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getAJ048Q() eq ""), de("yes"), de("no"))#" />,
				AJ058Q = <cfqueryparam value="#arguments.bean.getAJ058Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getAJ058Q() eq ""), de("yes"), de("no"))#" />,
				AJ068Q = <cfqueryparam value="#arguments.bean.getAJ068Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getAJ068Q() eq ""), de("yes"), de("no"))#" />,
				AJ078Q = <cfqueryparam value="#arguments.bean.getAJ078Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getAJ078Q() eq ""), de("yes"), de("no"))#" />,
				AJ088Q = <cfqueryparam value="#arguments.bean.getAJ088Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getAJ088Q() eq ""), de("yes"), de("no"))#" />,
				AJ098Q = <cfqueryparam value="#arguments.bean.getAJ098Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getAJ098Q() eq ""), de("yes"), de("no"))#" />,
				AJ108Q = <cfqueryparam value="#arguments.bean.getAJ108Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getAJ108Q() eq ""), de("yes"), de("no"))#" />,
				AJ118Q = <cfqueryparam value="#arguments.bean.getAJ118Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getAJ118Q() eq ""), de("yes"), de("no"))#" />,
				AJ128Q = <cfqueryparam value="#arguments.bean.getAJ128Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getAJ128Q() eq ""), de("yes"), de("no"))#" />,
				TLOP8Q = <cfqueryparam value="#arguments.bean.getTLOP8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLOP8Q() eq ""), de("yes"), de("no"))#" />,
				OP018Q = <cfqueryparam value="#arguments.bean.getOP018Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getOP018Q() eq ""), de("yes"), de("no"))#" />,
				OP028Q = <cfqueryparam value="#arguments.bean.getOP028Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getOP028Q() eq ""), de("yes"), de("no"))#" />,
				OP038Q = <cfqueryparam value="#arguments.bean.getOP038Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getOP038Q() eq ""), de("yes"), de("no"))#" />,
				OP048Q = <cfqueryparam value="#arguments.bean.getOP048Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getOP048Q() eq ""), de("yes"), de("no"))#" />,
				OP058Q = <cfqueryparam value="#arguments.bean.getOP058Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getOP058Q() eq ""), de("yes"), de("no"))#" />,
				OP068Q = <cfqueryparam value="#arguments.bean.getOP068Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getOP068Q() eq ""), de("yes"), de("no"))#" />,
				OP078Q = <cfqueryparam value="#arguments.bean.getOP078Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getOP078Q() eq ""), de("yes"), de("no"))#" />,
				OP088Q = <cfqueryparam value="#arguments.bean.getOP088Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getOP088Q() eq ""), de("yes"), de("no"))#" />,
				OP098Q = <cfqueryparam value="#arguments.bean.getOP098Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getOP098Q() eq ""), de("yes"), de("no"))#" />,
				OP108Q = <cfqueryparam value="#arguments.bean.getOP108Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getOP108Q() eq ""), de("yes"), de("no"))#" />,
				OP118Q = <cfqueryparam value="#arguments.bean.getOP118Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getOP118Q() eq ""), de("yes"), de("no"))#" />,
				OP128Q = <cfqueryparam value="#arguments.bean.getOP128Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getOP128Q() eq ""), de("yes"), de("no"))#" />,
				CRUS8Q = <cfqueryparam value="#arguments.bean.getCRUS8Q()#" cfsqltype="CF_SQL_CHAR" />,
				CRDT8Q = <cfqueryparam value="#arguments.bean.getCRDT8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getCRDT8Q() eq ""), de("yes"), de("no"))#" />,
				CRTM8Q = <cfqueryparam value="#arguments.bean.getCRTM8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getCRTM8Q() eq ""), de("yes"), de("no"))#" />,
				MNUS8Q = <cfqueryparam value="#arguments.bean.getMNUS8Q()#" cfsqltype="CF_SQL_CHAR" />,
				MNDT8Q = <cfqueryparam value="#arguments.bean.getMNDT8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getMNDT8Q() eq ""), de("yes"), de("no"))#" />,
				MNTM8Q = <cfqueryparam value="#arguments.bean.getMNTM8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getMNTM8Q() eq ""), de("yes"), de("no"))#" />,
				CLSD8Q = <cfqueryparam value="#arguments.bean.getCLSD8Q()#" cfsqltype="CF_SQL_CHAR" />,
				CLDT8Q = <cfqueryparam value="#arguments.bean.getCLDT8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getCLDT8Q() eq ""), de("yes"), de("no"))#" />,
				CTNO8Q = <cfqueryparam value="#arguments.bean.getCTNO8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCTNO8Q() eq ""), de("yes"), de("no"))#" />,
				CTL28Q = <cfqueryparam value="#arguments.bean.getCTL28Q()#" cfsqltype="CF_SQL_CHAR" />,
				CTL38Q = <cfqueryparam value="#arguments.bean.getCTL38Q()#" cfsqltype="CF_SQL_CHAR" />,
				CTL48Q = <cfqueryparam value="#arguments.bean.getCTL48Q()#" cfsqltype="CF_SQL_CHAR" />,
				CTL58Q = <cfqueryparam value="#arguments.bean.getCTL58Q()#" cfsqltype="CF_SQL_CHAR" />,
				CTL68Q = <cfqueryparam value="#arguments.bean.getCTL68Q()#" cfsqltype="CF_SQL_CHAR" />,
				PRMR8Q = <cfqueryparam value="#arguments.bean.getPRMR8Q()#" cfsqltype="CF_SQL_CHAR" />,
				PROP8Q = <cfqueryparam value="#arguments.bean.getPROP8Q()#" cfsqltype="CF_SQL_CHAR" />,
				MKRF8Q = <cfqueryparam value="#arguments.bean.getMKRF8Q()#" cfsqltype="CF_SQL_CHAR" />,
				MKCD8Q = <cfqueryparam value="#arguments.bean.getMKCD8Q()#" cfsqltype="CF_SQL_CHAR" />,
				MRPR8Q = <cfqueryparam value="#arguments.bean.getMRPR8Q()#" cfsqltype="CF_SQL_CHAR" />,
				PDTP8Q = <cfqueryparam value="#arguments.bean.getPDTP8Q()#" cfsqltype="CF_SQL_CHAR" />,
				UPCS8Q = <cfqueryparam value="#arguments.bean.getUPCS8Q()#" cfsqltype="CF_SQL_CHAR" />,
				ACDT8Q = <cfqueryparam value="#arguments.bean.getACDT8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getACDT8Q() eq ""), de("yes"), de("no"))#" />,
				ACRF8Q = <cfqueryparam value="#arguments.bean.getACRF8Q()#" cfsqltype="CF_SQL_CHAR" />,
				ESCS8Q = <cfqueryparam value="#arguments.bean.getESCS8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getESCS8Q() eq ""), de("yes"), de("no"))#" />,
				JBBT8Q = <cfqueryparam value="#arguments.bean.getJBBT8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getJBBT8Q() eq ""), de("yes"), de("no"))#" />,
				COCD8Q = <cfqueryparam value="#arguments.bean.getCOCD8Q()#" cfsqltype="CF_SQL_CHAR" />,
				CLW18Q = <cfqueryparam value="#arguments.bean.getCLW18Q()#" cfsqltype="CF_SQL_CHAR" />,
				CLB18Q = <cfqueryparam value="#arguments.bean.getCLB18Q()#" cfsqltype="CF_SQL_CHAR" />,
				CLD18Q = <cfqueryparam value="#arguments.bean.getCLD18Q()#" cfsqltype="CF_SQL_CHAR" />,
				CLI18Q = <cfqueryparam value="#arguments.bean.getCLI18Q()#" cfsqltype="CF_SQL_CHAR" />,
				CLM18Q = <cfqueryparam value="#arguments.bean.getCLM18Q()#" cfsqltype="CF_SQL_CHAR" />,
				CLW28Q = <cfqueryparam value="#arguments.bean.getCLW28Q()#" cfsqltype="CF_SQL_CHAR" />,
				CLB28Q = <cfqueryparam value="#arguments.bean.getCLB28Q()#" cfsqltype="CF_SQL_CHAR" />,
				CLD28Q = <cfqueryparam value="#arguments.bean.getCLD28Q()#" cfsqltype="CF_SQL_CHAR" />,
				CLI28Q = <cfqueryparam value="#arguments.bean.getCLI28Q()#" cfsqltype="CF_SQL_CHAR" />,
				CLM28Q = <cfqueryparam value="#arguments.bean.getCLM28Q()#" cfsqltype="CF_SQL_CHAR" />,
				CLW38Q = <cfqueryparam value="#arguments.bean.getCLW38Q()#" cfsqltype="CF_SQL_CHAR" />,
				CLB38Q = <cfqueryparam value="#arguments.bean.getCLB38Q()#" cfsqltype="CF_SQL_CHAR" />,
				CLD38Q = <cfqueryparam value="#arguments.bean.getCLD38Q()#" cfsqltype="CF_SQL_CHAR" />,
				CLI38Q = <cfqueryparam value="#arguments.bean.getCLI38Q()#" cfsqltype="CF_SQL_CHAR" />,
				CLM38Q = <cfqueryparam value="#arguments.bean.getCLM38Q()#" cfsqltype="CF_SQL_CHAR" />,
				CP118Q = <cfqueryparam value="#arguments.bean.getCP118Q()#" cfsqltype="CF_SQL_CHAR" />,
				P1118Q = <cfqueryparam value="#arguments.bean.getP1118Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP1118Q() eq ""), de("yes"), de("no"))#" />,
				P1128Q = <cfqueryparam value="#arguments.bean.getP1128Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP1128Q() eq ""), de("yes"), de("no"))#" />,
				P1138Q = <cfqueryparam value="#arguments.bean.getP1138Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP1138Q() eq ""), de("yes"), de("no"))#" />,
				P1148Q = <cfqueryparam value="#arguments.bean.getP1148Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP1148Q() eq ""), de("yes"), de("no"))#" />,
				P1158Q = <cfqueryparam value="#arguments.bean.getP1158Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP1158Q() eq ""), de("yes"), de("no"))#" />,
				C1118Q = <cfqueryparam value="#arguments.bean.getC1118Q()#" cfsqltype="CF_SQL_CHAR" />,
				C1128Q = <cfqueryparam value="#arguments.bean.getC1128Q()#" cfsqltype="CF_SQL_CHAR" />,
				C1138Q = <cfqueryparam value="#arguments.bean.getC1138Q()#" cfsqltype="CF_SQL_CHAR" />,
				C1148Q = <cfqueryparam value="#arguments.bean.getC1148Q()#" cfsqltype="CF_SQL_CHAR" />,
				C1158Q = <cfqueryparam value="#arguments.bean.getC1158Q()#" cfsqltype="CF_SQL_CHAR" />,
				CP128Q = <cfqueryparam value="#arguments.bean.getCP128Q()#" cfsqltype="CF_SQL_CHAR" />,
				P1218Q = <cfqueryparam value="#arguments.bean.getP1218Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP1218Q() eq ""), de("yes"), de("no"))#" />,
				P1228Q = <cfqueryparam value="#arguments.bean.getP1228Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP1228Q() eq ""), de("yes"), de("no"))#" />,
				P1238Q = <cfqueryparam value="#arguments.bean.getP1238Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP1238Q() eq ""), de("yes"), de("no"))#" />,
				P1248Q = <cfqueryparam value="#arguments.bean.getP1248Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP1248Q() eq ""), de("yes"), de("no"))#" />,
				P1258Q = <cfqueryparam value="#arguments.bean.getP1258Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP1258Q() eq ""), de("yes"), de("no"))#" />,
				C1218Q = <cfqueryparam value="#arguments.bean.getC1218Q()#" cfsqltype="CF_SQL_CHAR" />,
				C1228Q = <cfqueryparam value="#arguments.bean.getC1228Q()#" cfsqltype="CF_SQL_CHAR" />,
				C1238Q = <cfqueryparam value="#arguments.bean.getC1238Q()#" cfsqltype="CF_SQL_CHAR" />,
				C1248Q = <cfqueryparam value="#arguments.bean.getC1248Q()#" cfsqltype="CF_SQL_CHAR" />,
				C1258Q = <cfqueryparam value="#arguments.bean.getC1258Q()#" cfsqltype="CF_SQL_CHAR" />,
				CP138Q = <cfqueryparam value="#arguments.bean.getCP138Q()#" cfsqltype="CF_SQL_CHAR" />,
				P1318Q = <cfqueryparam value="#arguments.bean.getP1318Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP1318Q() eq ""), de("yes"), de("no"))#" />,
				P1328Q = <cfqueryparam value="#arguments.bean.getP1328Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP1328Q() eq ""), de("yes"), de("no"))#" />,
				P1338Q = <cfqueryparam value="#arguments.bean.getP1338Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP1338Q() eq ""), de("yes"), de("no"))#" />,
				P1348Q = <cfqueryparam value="#arguments.bean.getP1348Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP1348Q() eq ""), de("yes"), de("no"))#" />,
				P1358Q = <cfqueryparam value="#arguments.bean.getP1358Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP1358Q() eq ""), de("yes"), de("no"))#" />,
				C1318Q = <cfqueryparam value="#arguments.bean.getC1318Q()#" cfsqltype="CF_SQL_CHAR" />,
				C1328Q = <cfqueryparam value="#arguments.bean.getC1328Q()#" cfsqltype="CF_SQL_CHAR" />,
				C1338Q = <cfqueryparam value="#arguments.bean.getC1338Q()#" cfsqltype="CF_SQL_CHAR" />,
				C1348Q = <cfqueryparam value="#arguments.bean.getC1348Q()#" cfsqltype="CF_SQL_CHAR" />,
				C1358Q = <cfqueryparam value="#arguments.bean.getC1358Q()#" cfsqltype="CF_SQL_CHAR" />,
				CP218Q = <cfqueryparam value="#arguments.bean.getCP218Q()#" cfsqltype="CF_SQL_CHAR" />,
				P2118Q = <cfqueryparam value="#arguments.bean.getP2118Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP2118Q() eq ""), de("yes"), de("no"))#" />,
				P2128Q = <cfqueryparam value="#arguments.bean.getP2128Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP2128Q() eq ""), de("yes"), de("no"))#" />,
				P2138Q = <cfqueryparam value="#arguments.bean.getP2138Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP2138Q() eq ""), de("yes"), de("no"))#" />,
				P2148Q = <cfqueryparam value="#arguments.bean.getP2148Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP2148Q() eq ""), de("yes"), de("no"))#" />,
				P2158Q = <cfqueryparam value="#arguments.bean.getP2158Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP2158Q() eq ""), de("yes"), de("no"))#" />,
				C2118Q = <cfqueryparam value="#arguments.bean.getC2118Q()#" cfsqltype="CF_SQL_CHAR" />,
				C2128Q = <cfqueryparam value="#arguments.bean.getC2128Q()#" cfsqltype="CF_SQL_CHAR" />,
				C2138Q = <cfqueryparam value="#arguments.bean.getC2138Q()#" cfsqltype="CF_SQL_CHAR" />,
				C2148Q = <cfqueryparam value="#arguments.bean.getC2148Q()#" cfsqltype="CF_SQL_CHAR" />,
				C2158Q = <cfqueryparam value="#arguments.bean.getC2158Q()#" cfsqltype="CF_SQL_CHAR" />,
				CP228Q = <cfqueryparam value="#arguments.bean.getCP228Q()#" cfsqltype="CF_SQL_CHAR" />,
				P2218Q = <cfqueryparam value="#arguments.bean.getP2218Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP2218Q() eq ""), de("yes"), de("no"))#" />,
				P2228Q = <cfqueryparam value="#arguments.bean.getP2228Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP2228Q() eq ""), de("yes"), de("no"))#" />,
				P2238Q = <cfqueryparam value="#arguments.bean.getP2238Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP2238Q() eq ""), de("yes"), de("no"))#" />,
				P2248Q = <cfqueryparam value="#arguments.bean.getP2248Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP2248Q() eq ""), de("yes"), de("no"))#" />,
				P2258Q = <cfqueryparam value="#arguments.bean.getP2258Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP2258Q() eq ""), de("yes"), de("no"))#" />,
				C2218Q = <cfqueryparam value="#arguments.bean.getC2218Q()#" cfsqltype="CF_SQL_CHAR" />,
				C2228Q = <cfqueryparam value="#arguments.bean.getC2228Q()#" cfsqltype="CF_SQL_CHAR" />,
				C2238Q = <cfqueryparam value="#arguments.bean.getC2238Q()#" cfsqltype="CF_SQL_CHAR" />,
				C2248Q = <cfqueryparam value="#arguments.bean.getC2248Q()#" cfsqltype="CF_SQL_CHAR" />,
				C2258Q = <cfqueryparam value="#arguments.bean.getC2258Q()#" cfsqltype="CF_SQL_CHAR" />,
				CP238Q = <cfqueryparam value="#arguments.bean.getCP238Q()#" cfsqltype="CF_SQL_CHAR" />,
				P2318Q = <cfqueryparam value="#arguments.bean.getP2318Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP2318Q() eq ""), de("yes"), de("no"))#" />,
				P2328Q = <cfqueryparam value="#arguments.bean.getP2328Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP2328Q() eq ""), de("yes"), de("no"))#" />,
				P2338Q = <cfqueryparam value="#arguments.bean.getP2338Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP2338Q() eq ""), de("yes"), de("no"))#" />,
				P2348Q = <cfqueryparam value="#arguments.bean.getP2348Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP2348Q() eq ""), de("yes"), de("no"))#" />,
				P2358Q = <cfqueryparam value="#arguments.bean.getP2358Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP2358Q() eq ""), de("yes"), de("no"))#" />,
				C2318Q = <cfqueryparam value="#arguments.bean.getC2318Q()#" cfsqltype="CF_SQL_CHAR" />,
				C2328Q = <cfqueryparam value="#arguments.bean.getC2328Q()#" cfsqltype="CF_SQL_CHAR" />,
				C2338Q = <cfqueryparam value="#arguments.bean.getC2338Q()#" cfsqltype="CF_SQL_CHAR" />,
				C2348Q = <cfqueryparam value="#arguments.bean.getC2348Q()#" cfsqltype="CF_SQL_CHAR" />,
				C2358Q = <cfqueryparam value="#arguments.bean.getC2358Q()#" cfsqltype="CF_SQL_CHAR" />,
				CP318Q = <cfqueryparam value="#arguments.bean.getCP318Q()#" cfsqltype="CF_SQL_CHAR" />,
				P3118Q = <cfqueryparam value="#arguments.bean.getP3118Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP3118Q() eq ""), de("yes"), de("no"))#" />,
				P3128Q = <cfqueryparam value="#arguments.bean.getP3128Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP3128Q() eq ""), de("yes"), de("no"))#" />,
				P3138Q = <cfqueryparam value="#arguments.bean.getP3138Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP3138Q() eq ""), de("yes"), de("no"))#" />,
				P3148Q = <cfqueryparam value="#arguments.bean.getP3148Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP3148Q() eq ""), de("yes"), de("no"))#" />,
				P3158Q = <cfqueryparam value="#arguments.bean.getP3158Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP3158Q() eq ""), de("yes"), de("no"))#" />,
				C3118Q = <cfqueryparam value="#arguments.bean.getC3118Q()#" cfsqltype="CF_SQL_CHAR" />,
				C3128Q = <cfqueryparam value="#arguments.bean.getC3128Q()#" cfsqltype="CF_SQL_CHAR" />,
				C3138Q = <cfqueryparam value="#arguments.bean.getC3138Q()#" cfsqltype="CF_SQL_CHAR" />,
				C3148Q = <cfqueryparam value="#arguments.bean.getC3148Q()#" cfsqltype="CF_SQL_CHAR" />,
				C3158Q = <cfqueryparam value="#arguments.bean.getC3158Q()#" cfsqltype="CF_SQL_CHAR" />,
				CP328Q = <cfqueryparam value="#arguments.bean.getCP328Q()#" cfsqltype="CF_SQL_CHAR" />,
				P3218Q = <cfqueryparam value="#arguments.bean.getP3218Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP3218Q() eq ""), de("yes"), de("no"))#" />,
				P3228Q = <cfqueryparam value="#arguments.bean.getP3228Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP3228Q() eq ""), de("yes"), de("no"))#" />,
				P3238Q = <cfqueryparam value="#arguments.bean.getP3238Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP3238Q() eq ""), de("yes"), de("no"))#" />,
				P3248Q = <cfqueryparam value="#arguments.bean.getP3248Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP3248Q() eq ""), de("yes"), de("no"))#" />,
				P3258Q = <cfqueryparam value="#arguments.bean.getP3258Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP3258Q() eq ""), de("yes"), de("no"))#" />,
				C3218Q = <cfqueryparam value="#arguments.bean.getC3218Q()#" cfsqltype="CF_SQL_CHAR" />,
				C3228Q = <cfqueryparam value="#arguments.bean.getC3228Q()#" cfsqltype="CF_SQL_CHAR" />,
				C3238Q = <cfqueryparam value="#arguments.bean.getC3238Q()#" cfsqltype="CF_SQL_CHAR" />,
				C3248Q = <cfqueryparam value="#arguments.bean.getC3248Q()#" cfsqltype="CF_SQL_CHAR" />,
				C3258Q = <cfqueryparam value="#arguments.bean.getC3258Q()#" cfsqltype="CF_SQL_CHAR" />,
				CP338Q = <cfqueryparam value="#arguments.bean.getCP338Q()#" cfsqltype="CF_SQL_CHAR" />,
				P3318Q = <cfqueryparam value="#arguments.bean.getP3318Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP3318Q() eq ""), de("yes"), de("no"))#" />,
				P3328Q = <cfqueryparam value="#arguments.bean.getP3328Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP3328Q() eq ""), de("yes"), de("no"))#" />,
				P3338Q = <cfqueryparam value="#arguments.bean.getP3338Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP3338Q() eq ""), de("yes"), de("no"))#" />,
				P3348Q = <cfqueryparam value="#arguments.bean.getP3348Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP3348Q() eq ""), de("yes"), de("no"))#" />,
				P3358Q = <cfqueryparam value="#arguments.bean.getP3358Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getP3358Q() eq ""), de("yes"), de("no"))#" />,
				C3318Q = <cfqueryparam value="#arguments.bean.getC3318Q()#" cfsqltype="CF_SQL_CHAR" />,
				C3328Q = <cfqueryparam value="#arguments.bean.getC3328Q()#" cfsqltype="CF_SQL_CHAR" />,
				C3338Q = <cfqueryparam value="#arguments.bean.getC3338Q()#" cfsqltype="CF_SQL_CHAR" />,
				C3348Q = <cfqueryparam value="#arguments.bean.getC3348Q()#" cfsqltype="CF_SQL_CHAR" />,
				C3358Q = <cfqueryparam value="#arguments.bean.getC3358Q()#" cfsqltype="CF_SQL_CHAR" />,
				C1FM8Q = <cfqueryparam value="#arguments.bean.getC1FM8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getC1FM8Q() eq ""), de("yes"), de("no"))#" />,
				C2FM8Q = <cfqueryparam value="#arguments.bean.getC2FM8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getC2FM8Q() eq ""), de("yes"), de("no"))#" />,
				C3FM8Q = <cfqueryparam value="#arguments.bean.getC3FM8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getC3FM8Q() eq ""), de("yes"), de("no"))#" />,
				H1FM8Q = <cfqueryparam value="#arguments.bean.getH1FM8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getH1FM8Q() eq ""), de("yes"), de("no"))#" />,
				H2FM8Q = <cfqueryparam value="#arguments.bean.getH2FM8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getH2FM8Q() eq ""), de("yes"), de("no"))#" />,
				H3FM8Q = <cfqueryparam value="#arguments.bean.getH3FM8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getH3FM8Q() eq ""), de("yes"), de("no"))#" />,
				RNNO8Q = <cfqueryparam value="#arguments.bean.getRNNO8Q()#" cfsqltype="CF_SQL_CHAR" />,
				CSIT8Q = <cfqueryparam value="#arguments.bean.getCSIT8Q()#" cfsqltype="CF_SQL_CHAR" />,
				REPR8Q = <cfqueryparam value="#arguments.bean.getREPR8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getREPR8Q() eq ""), de("yes"), de("no"))#" />,
				CPUS8Q = <cfqueryparam value="#arguments.bean.getCPUS8Q()#" cfsqltype="CF_SQL_CHAR" />,
				CPDT8Q = <cfqueryparam value="#arguments.bean.getCPDT8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getCPDT8Q() eq ""), de("yes"), de("no"))#" />,
				CPTM8Q = <cfqueryparam value="#arguments.bean.getCPTM8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getCPTM8Q() eq ""), de("yes"), de("no"))#" />,
				HPUS8Q = <cfqueryparam value="#arguments.bean.getHPUS8Q()#" cfsqltype="CF_SQL_CHAR" />,
				HPDT8Q = <cfqueryparam value="#arguments.bean.getHPDT8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getHPDT8Q() eq ""), de("yes"), de("no"))#" />,
				HPTM8Q = <cfqueryparam value="#arguments.bean.getHPTM8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getHPTM8Q() eq ""), de("yes"), de("no"))#" />,
				HLPF8Q = <cfqueryparam value="#arguments.bean.getHLPF8Q()#" cfsqltype="CF_SQL_CHAR" />,
				HLAC8Q = <cfqueryparam value="#arguments.bean.getHLAC8Q()#" cfsqltype="CF_SQL_CHAR" />,
				HLFG8Q = <cfqueryparam value="#arguments.bean.getHLFG8Q()#" cfsqltype="CF_SQL_CHAR" />,
				QCUS8Q = <cfqueryparam value="#arguments.bean.getQCUS8Q()#" cfsqltype="CF_SQL_CHAR" />,
				QCDT8Q = <cfqueryparam value="#arguments.bean.getQCDT8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getQCDT8Q() eq ""), de("yes"), de("no"))#" />,
				QCTM8Q = <cfqueryparam value="#arguments.bean.getQCTM8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getQCTM8Q() eq ""), de("yes"), de("no"))#" />,
				PRPR8Q = <cfqueryparam value="#arguments.bean.getPRPR8Q()#" cfsqltype="CF_SQL_CHAR" />,
				PRCR8Q = <cfqueryparam value="#arguments.bean.getPRCR8Q()#" cfsqltype="CF_SQL_CHAR" />,
				LSRD8Q = <cfqueryparam value="#arguments.bean.getLSRD8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getLSRD8Q() eq ""), de("yes"), de("no"))#" />,
				FSRD8Q = <cfqueryparam value="#arguments.bean.getFSRD8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getFSRD8Q() eq ""), de("yes"), de("no"))#" />,
				FSRT8Q = <cfqueryparam value="#arguments.bean.getFSRT8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getFSRT8Q() eq ""), de("yes"), de("no"))#" />,
				MC018Q = <cfqueryparam value="#arguments.bean.getMC018Q()#" cfsqltype="CF_SQL_CHAR" />,
				CP018Q = <cfqueryparam value="#arguments.bean.getCP018Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCP018Q() eq ""), de("yes"), de("no"))#" />,
				CD018Q = <cfqueryparam value="#arguments.bean.getCD018Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCD018Q() eq ""), de("yes"), de("no"))#" />,
				VN018Q = <cfqueryparam value="#arguments.bean.getVN018Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getVN018Q() eq ""), de("yes"), de("no"))#" />,
				AC018Q = <cfqueryparam value="#arguments.bean.getAC018Q()#" cfsqltype="CF_SQL_CHAR" />,
				MC028Q = <cfqueryparam value="#arguments.bean.getMC028Q()#" cfsqltype="CF_SQL_CHAR" />,
				CP028Q = <cfqueryparam value="#arguments.bean.getCP028Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCP028Q() eq ""), de("yes"), de("no"))#" />,
				CD028Q = <cfqueryparam value="#arguments.bean.getCD028Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCD028Q() eq ""), de("yes"), de("no"))#" />,
				VN028Q = <cfqueryparam value="#arguments.bean.getVN028Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getVN028Q() eq ""), de("yes"), de("no"))#" />,
				AC028Q = <cfqueryparam value="#arguments.bean.getAC028Q()#" cfsqltype="CF_SQL_CHAR" />,
				MC038Q = <cfqueryparam value="#arguments.bean.getMC038Q()#" cfsqltype="CF_SQL_CHAR" />,
				CP038Q = <cfqueryparam value="#arguments.bean.getCP038Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCP038Q() eq ""), de("yes"), de("no"))#" />,
				CD038Q = <cfqueryparam value="#arguments.bean.getCD038Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCD038Q() eq ""), de("yes"), de("no"))#" />,
				VN038Q = <cfqueryparam value="#arguments.bean.getVN038Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getVN038Q() eq ""), de("yes"), de("no"))#" />,
				AC038Q = <cfqueryparam value="#arguments.bean.getAC038Q()#" cfsqltype="CF_SQL_CHAR" />,
				MC048Q = <cfqueryparam value="#arguments.bean.getMC048Q()#" cfsqltype="CF_SQL_CHAR" />,
				CP048Q = <cfqueryparam value="#arguments.bean.getCP048Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCP048Q() eq ""), de("yes"), de("no"))#" />,
				CD048Q = <cfqueryparam value="#arguments.bean.getCD048Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCD048Q() eq ""), de("yes"), de("no"))#" />,
				VN048Q = <cfqueryparam value="#arguments.bean.getVN048Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getVN048Q() eq ""), de("yes"), de("no"))#" />,
				AC048Q = <cfqueryparam value="#arguments.bean.getAC048Q()#" cfsqltype="CF_SQL_CHAR" />,
				MC058Q = <cfqueryparam value="#arguments.bean.getMC058Q()#" cfsqltype="CF_SQL_CHAR" />,
				CP058Q = <cfqueryparam value="#arguments.bean.getCP058Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCP058Q() eq ""), de("yes"), de("no"))#" />,
				CD058Q = <cfqueryparam value="#arguments.bean.getCD058Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCD058Q() eq ""), de("yes"), de("no"))#" />,
				VN058Q = <cfqueryparam value="#arguments.bean.getVN058Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getVN058Q() eq ""), de("yes"), de("no"))#" />,
				AC058Q = <cfqueryparam value="#arguments.bean.getAC058Q()#" cfsqltype="CF_SQL_CHAR" />,
				MC068Q = <cfqueryparam value="#arguments.bean.getMC068Q()#" cfsqltype="CF_SQL_CHAR" />,
				CP068Q = <cfqueryparam value="#arguments.bean.getCP068Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCP068Q() eq ""), de("yes"), de("no"))#" />,
				CD068Q = <cfqueryparam value="#arguments.bean.getCD068Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCD068Q() eq ""), de("yes"), de("no"))#" />,
				VN068Q = <cfqueryparam value="#arguments.bean.getVN068Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getVN068Q() eq ""), de("yes"), de("no"))#" />,
				AC068Q = <cfqueryparam value="#arguments.bean.getAC068Q()#" cfsqltype="CF_SQL_CHAR" />,
				MC078Q = <cfqueryparam value="#arguments.bean.getMC078Q()#" cfsqltype="CF_SQL_CHAR" />,
				CP078Q = <cfqueryparam value="#arguments.bean.getCP078Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCP078Q() eq ""), de("yes"), de("no"))#" />,
				CD078Q = <cfqueryparam value="#arguments.bean.getCD078Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCD078Q() eq ""), de("yes"), de("no"))#" />,
				VN078Q = <cfqueryparam value="#arguments.bean.getVN078Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getVN078Q() eq ""), de("yes"), de("no"))#" />,
				AC078Q = <cfqueryparam value="#arguments.bean.getAC078Q()#" cfsqltype="CF_SQL_CHAR" />,
				MC088Q = <cfqueryparam value="#arguments.bean.getMC088Q()#" cfsqltype="CF_SQL_CHAR" />,
				CP088Q = <cfqueryparam value="#arguments.bean.getCP088Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCP088Q() eq ""), de("yes"), de("no"))#" />,
				CD088Q = <cfqueryparam value="#arguments.bean.getCD088Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCD088Q() eq ""), de("yes"), de("no"))#" />,
				VN088Q = <cfqueryparam value="#arguments.bean.getVN088Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getVN088Q() eq ""), de("yes"), de("no"))#" />,
				AC088Q = <cfqueryparam value="#arguments.bean.getAC088Q()#" cfsqltype="CF_SQL_CHAR" />,
				MC098Q = <cfqueryparam value="#arguments.bean.getMC098Q()#" cfsqltype="CF_SQL_CHAR" />,
				CP098Q = <cfqueryparam value="#arguments.bean.getCP098Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCP098Q() eq ""), de("yes"), de("no"))#" />,
				CD098Q = <cfqueryparam value="#arguments.bean.getCD098Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCD098Q() eq ""), de("yes"), de("no"))#" />,
				VN098Q = <cfqueryparam value="#arguments.bean.getVN098Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getVN098Q() eq ""), de("yes"), de("no"))#" />,
				AC098Q = <cfqueryparam value="#arguments.bean.getAC098Q()#" cfsqltype="CF_SQL_CHAR" />,
				ODDP8Q = <cfqueryparam value="#arguments.bean.getODDP8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getODDP8Q() eq ""), de("yes"), de("no"))#" />,
				ODAR8Q = <cfqueryparam value="#arguments.bean.getODAR8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getODAR8Q() eq ""), de("yes"), de("no"))#" />,
				ODIH8Q = <cfqueryparam value="#arguments.bean.getODIH8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getODIH8Q() eq ""), de("yes"), de("no"))#" />,
				RVDP8Q = <cfqueryparam value="#arguments.bean.getRVDP8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getRVDP8Q() eq ""), de("yes"), de("no"))#" />,
				RVAR8Q = <cfqueryparam value="#arguments.bean.getRVAR8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getRVAR8Q() eq ""), de("yes"), de("no"))#" />,
				RVIH8Q = <cfqueryparam value="#arguments.bean.getRVIH8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getRVIH8Q() eq ""), de("yes"), de("no"))#" />,
				ACDP8Q = <cfqueryparam value="#arguments.bean.getACDP8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getACDP8Q() eq ""), de("yes"), de("no"))#" />,
				ACAR8Q = <cfqueryparam value="#arguments.bean.getACAR8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getACAR8Q() eq ""), de("yes"), de("no"))#" />,
				ACIH8Q = <cfqueryparam value="#arguments.bean.getACIH8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getACIH8Q() eq ""), de("yes"), de("no"))#" />,
				VSAB8Q = <cfqueryparam value="#arguments.bean.getVSAB8Q()#" cfsqltype="CF_SQL_CHAR" />,
				CNRF8Q = <cfqueryparam value="#arguments.bean.getCNRF8Q()#" cfsqltype="CF_SQL_CHAR" />,
				SRCD8Q = <cfqueryparam value="#arguments.bean.getSRCD8Q()#" cfsqltype="CF_SQL_CHAR" />,
				QTYR8Q = <cfqueryparam value="#arguments.bean.getQTYR8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getQTYR8Q() eq ""), de("yes"), de("no"))#" />,
				IMPP8Q = <cfqueryparam value="#arguments.bean.getIMPP8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getIMPP8Q() eq ""), de("yes"), de("no"))#" />,
				IMPR8Q = <cfqueryparam value="#arguments.bean.getIMPR8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getIMPR8Q() eq ""), de("yes"), de("no"))#" />,
				MSCD8Q = <cfqueryparam value="#arguments.bean.getMSCD8Q()#" cfsqltype="CF_SQL_CHAR" />,
				PRUM8Q = <cfqueryparam value="#arguments.bean.getPRUM8Q()#" cfsqltype="CF_SQL_CHAR" />,
				CVFC8Q = <cfqueryparam value="#arguments.bean.getCVFC8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCVFC8Q() eq ""), de("yes"), de("no"))#" />,
				CVFO8Q = <cfqueryparam value="#arguments.bean.getCVFO8Q()#" cfsqltype="CF_SQL_CHAR" />,
				CH018Q = <cfqueryparam value="#arguments.bean.getCH018Q()#" cfsqltype="CF_SQL_CHAR" />,
				CH028Q = <cfqueryparam value="#arguments.bean.getCH028Q()#" cfsqltype="CF_SQL_CHAR" />,
				CH038Q = <cfqueryparam value="#arguments.bean.getCH038Q()#" cfsqltype="CF_SQL_CHAR" />,
				CH048Q = <cfqueryparam value="#arguments.bean.getCH048Q()#" cfsqltype="CF_SQL_CHAR" />,
				CH058Q = <cfqueryparam value="#arguments.bean.getCH058Q()#" cfsqltype="CF_SQL_CHAR" />,
				CH068Q = <cfqueryparam value="#arguments.bean.getCH068Q()#" cfsqltype="CF_SQL_CHAR" />,
				CH078Q = <cfqueryparam value="#arguments.bean.getCH078Q()#" cfsqltype="CF_SQL_CHAR" />,
				CH088Q = <cfqueryparam value="#arguments.bean.getCH088Q()#" cfsqltype="CF_SQL_CHAR" />,
				CH098Q = <cfqueryparam value="#arguments.bean.getCH098Q()#" cfsqltype="CF_SQL_CHAR" />,
				CH108Q = <cfqueryparam value="#arguments.bean.getCH108Q()#" cfsqltype="CF_SQL_CHAR" />,
				VL018Q = <cfqueryparam value="#arguments.bean.getVL018Q()#" cfsqltype="CF_SQL_CHAR" />,
				VL028Q = <cfqueryparam value="#arguments.bean.getVL028Q()#" cfsqltype="CF_SQL_CHAR" />,
				VL038Q = <cfqueryparam value="#arguments.bean.getVL038Q()#" cfsqltype="CF_SQL_CHAR" />,
				VL048Q = <cfqueryparam value="#arguments.bean.getVL048Q()#" cfsqltype="CF_SQL_CHAR" />,
				VL058Q = <cfqueryparam value="#arguments.bean.getVL058Q()#" cfsqltype="CF_SQL_CHAR" />,
				VL068Q = <cfqueryparam value="#arguments.bean.getVL068Q()#" cfsqltype="CF_SQL_CHAR" />,
				VL078Q = <cfqueryparam value="#arguments.bean.getVL078Q()#" cfsqltype="CF_SQL_CHAR" />,
				VL088Q = <cfqueryparam value="#arguments.bean.getVL088Q()#" cfsqltype="CF_SQL_CHAR" />,
				VL098Q = <cfqueryparam value="#arguments.bean.getVL098Q()#" cfsqltype="CF_SQL_CHAR" />,
				VL108Q = <cfqueryparam value="#arguments.bean.getVL108Q()#" cfsqltype="CF_SQL_CHAR" />,
				CVPR8Q = <cfqueryparam value="#arguments.bean.getCVPR8Q()#" cfsqltype="CF_SQL_CHAR" />,
				CVCR8Q = <cfqueryparam value="#arguments.bean.getCVCR8Q()#" cfsqltype="CF_SQL_CHAR" />,
				CVCP8Q = <cfqueryparam value="#arguments.bean.getCVCP8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCVCP8Q() eq ""), de("yes"), de("no"))#" />,
				AECD8Q = <cfqueryparam value="#arguments.bean.getAECD8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getAECD8Q() eq ""), de("yes"), de("no"))#" />,
				AUCD8Q = <cfqueryparam value="#arguments.bean.getAUCD8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getAUCD8Q() eq ""), de("yes"), de("no"))#" />,
				SPMT8Q = <cfqueryparam value="#arguments.bean.getSPMT8Q()#" cfsqltype="CF_SQL_CHAR" />,
				ACIN8Q = <cfqueryparam value="#arguments.bean.getACIN8Q()#" cfsqltype="CF_SQL_CHAR" />,
				GLUS8Q = <cfqueryparam value="#arguments.bean.getGLUS8Q()#" cfsqltype="CF_SQL_CHAR" />,
				GLDT8Q = <cfqueryparam value="#arguments.bean.getGLDT8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getGLDT8Q() eq ""), de("yes"), de("no"))#" />,
				GLTM8Q = <cfqueryparam value="#arguments.bean.getGLTM8Q()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getGLTM8Q() eq ""), de("yes"), de("no"))#" />,
				MSJB8Q = <cfqueryparam value="#arguments.bean.getMSJB8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getMSJB8Q() eq ""), de("yes"), de("no"))#" />,
				MSJL8Q = <cfqueryparam value="#arguments.bean.getMSJL8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getMSJL8Q() eq ""), de("yes"), de("no"))#" />,
				PCDY8Q = <cfqueryparam value="#arguments.bean.getPCDY8Q()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getPCDY8Q() eq ""), de("yes"), de("no"))#" />
			where CONO8Q = <cfqueryparam value="#arguments.bean.getCONO8Q()#" cfsqltype="CF_SQL_NUMERIC">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.as400.JOBSUM0">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="AS400" result="status">
			delete
			from VPSFILES.JOBSUM0
			where CONO8Q = <cfqueryparam cfsqltype="CF_SQL_NUMERIC" value="#arguments.bean.getCONO8Q()#" />
		</cfquery>

	</cffunction>


</cfcomponent>