<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="mochi.cfc.as400.ORDHDR0">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="AS400">
			select 	CONO2Y, ORNO2Y, CSNO2Y, CSSN2Y, SHNO2Y, DCNO2Y, 
					BLNO2Y, BLFN2Y, BLA12Y, BLA22Y, BLCT2Y, 
					BLST2Y, BLZP2Y, BLEX2Y, BLCY2Y, BLFA2Y, 
					SHFN2Y, SHA12Y, SHA22Y, SHCT2Y, SHST2Y, 
					SHZP2Y, SHEX2Y, SHCY2Y, SHFA2Y, DVNO2Y, 
					SNNO2Y, SBSN2Y, SASN2Y, ORDT2Y, SSDT2Y, 
					CNDT2Y, CMDT2Y, STDT2Y, TMDT2Y, CSDP2Y, 
					CSPO2Y, ORTP2Y, BKDS2Y, BKNO2Y, ORST2Y, 
					SVCD2Y, SVDS2Y, FBCD2Y, FBDS2Y, CLFR2Y, 
					CLIN2Y, TMCD2Y, TMDS2Y, BYNO2Y, SHPR2Y, 
					ORPR2Y, SMN12Y, SMP12Y, CMN12Y, CMD12Y, 
					SMN22Y, SMP22Y, CMN22Y, CMD22Y, SMN32Y, 
					SMP32Y, CMN32Y, CMD32Y, SMDF2Y, TXNO2Y, 
					CTN12Y, CTN22Y, CTN32Y, PRNO2Y, CMNO2Y, 
					TDNO2Y, JBRF2Y, DUDT2Y, TLLN2Y, TLUN2Y, 
					TLSL2Y, TLDB2Y, TLSC2Y, INTL2Y, TLDA2Y, 
					NTTL2Y, TLOU2Y, TLOD2Y, TLIU2Y, TLID2Y, 
					TLDU2Y, TLDD2Y, TLCU2Y, TLCD2Y, CRCK2Y, 
					NOEX2Y, DTEX2Y, CONV2Y, APTP2Y, OSTS2Y, 
					ORCL2Y, PSBK2Y, CRWS2Y, CRUS2Y, CRDT2Y, 
					CRTM2Y, MNWS2Y, MNUS2Y, MNDT2Y, MNTM2Y, 
					OCUS2Y, OCDT2Y, OCTM2Y, PRDT2Y, PRTM2Y, 
					NOPR2Y, FCTR2Y, EDR12Y, EDR22Y, EDR32Y, 
					EDR42Y, EDR52Y, EDR62Y, EDR72Y, EDR82Y, 
					EDR92Y, SHFM2Y, CACD2Y, ETMC2Y, ETBD2Y, 
					ETDP2Y, ETDT2Y, ETDD2Y, ENDT2Y, ENDD2Y, 
					ETDS2Y, ESCA2Y, ETRC2Y, ESVD2Y, ESMP2Y, 
					EFBD2Y, RMOR2Y, LCC12Y, LCD12Y, LCP12Y, 
					LCN12Y, LCC22Y, LCD22Y, LCP22Y, LCN22Y, 
					LCC32Y, LCD32Y, LCP32Y, LCN32Y, LCC42Y, 
					LCD42Y, LCP42Y, LCN42Y, LCC52Y, LCD52Y, 
					LCP52Y, LCN52Y, LCC62Y, LCD62Y, LCP62Y, 
					LCN62Y, LCC72Y, LCD72Y, LCP72Y, LCN72Y, 
					LCC82Y, LCD82Y, LCP82Y, LCN82Y, LCC92Y, 
					LCD92Y, LCP92Y, LCN92Y, PRMI2Y, SPMI2Y, 
					SRCD2Y, WHNO2Y, EMA12Y, EMA22Y, EMA32Y
					
			from VPSFILES.ORDHDR0
			where CONO2Y = <cfqueryparam cfsqltype="CF_SQL_NUMERIC" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "mochi.cfc.as400.ORDHDR0").init();
			obj.setCONO2Y(qRead.CONO2Y);
			obj.setORNO2Y(qRead.ORNO2Y);
			obj.setCSNO2Y(qRead.CSNO2Y);
			obj.setCSSN2Y(qRead.CSSN2Y);
			obj.setSHNO2Y(qRead.SHNO2Y);
			obj.setDCNO2Y(qRead.DCNO2Y);
			obj.setBLNO2Y(qRead.BLNO2Y);
			obj.setBLFN2Y(qRead.BLFN2Y);
			obj.setBLA12Y(qRead.BLA12Y);
			obj.setBLA22Y(qRead.BLA22Y);
			obj.setBLCT2Y(qRead.BLCT2Y);
			obj.setBLST2Y(qRead.BLST2Y);
			obj.setBLZP2Y(qRead.BLZP2Y);
			obj.setBLEX2Y(qRead.BLEX2Y);
			obj.setBLCY2Y(qRead.BLCY2Y);
			obj.setBLFA2Y(qRead.BLFA2Y);
			obj.setSHFN2Y(qRead.SHFN2Y);
			obj.setSHA12Y(qRead.SHA12Y);
			obj.setSHA22Y(qRead.SHA22Y);
			obj.setSHCT2Y(qRead.SHCT2Y);
			obj.setSHST2Y(qRead.SHST2Y);
			obj.setSHZP2Y(qRead.SHZP2Y);
			obj.setSHEX2Y(qRead.SHEX2Y);
			obj.setSHCY2Y(qRead.SHCY2Y);
			obj.setSHFA2Y(qRead.SHFA2Y);
			obj.setDVNO2Y(qRead.DVNO2Y);
			obj.setSNNO2Y(qRead.SNNO2Y);
			obj.setSBSN2Y(qRead.SBSN2Y);
			obj.setSASN2Y(qRead.SASN2Y);
			obj.setORDT2Y(qRead.ORDT2Y);
			obj.setSSDT2Y(qRead.SSDT2Y);
			obj.setCNDT2Y(qRead.CNDT2Y);
			obj.setCMDT2Y(qRead.CMDT2Y);
			obj.setSTDT2Y(qRead.STDT2Y);
			obj.setTMDT2Y(qRead.TMDT2Y);
			obj.setCSDP2Y(qRead.CSDP2Y);
			obj.setCSPO2Y(qRead.CSPO2Y);
			obj.setORTP2Y(qRead.ORTP2Y);
			obj.setBKDS2Y(qRead.BKDS2Y);
			obj.setBKNO2Y(qRead.BKNO2Y);
			obj.setORST2Y(qRead.ORST2Y);
			obj.setSVCD2Y(qRead.SVCD2Y);
			obj.setSVDS2Y(qRead.SVDS2Y);
			obj.setFBCD2Y(qRead.FBCD2Y);
			obj.setFBDS2Y(qRead.FBDS2Y);
			obj.setCLFR2Y(qRead.CLFR2Y);
			obj.setCLIN2Y(qRead.CLIN2Y);
			obj.setTMCD2Y(qRead.TMCD2Y);
			obj.setTMDS2Y(qRead.TMDS2Y);
			obj.setBYNO2Y(qRead.BYNO2Y);
			obj.setSHPR2Y(qRead.SHPR2Y);
			obj.setORPR2Y(qRead.ORPR2Y);
			obj.setSMN12Y(qRead.SMN12Y);
			obj.setSMP12Y(qRead.SMP12Y);
			obj.setCMN12Y(qRead.CMN12Y);
			obj.setCMD12Y(qRead.CMD12Y);
			obj.setSMN22Y(qRead.SMN22Y);
			obj.setSMP22Y(qRead.SMP22Y);
			obj.setCMN22Y(qRead.CMN22Y);
			obj.setCMD22Y(qRead.CMD22Y);
			obj.setSMN32Y(qRead.SMN32Y);
			obj.setSMP32Y(qRead.SMP32Y);
			obj.setCMN32Y(qRead.CMN32Y);
			obj.setCMD32Y(qRead.CMD32Y);
			obj.setSMDF2Y(qRead.SMDF2Y);
			obj.setTXNO2Y(qRead.TXNO2Y);
			obj.setCTN12Y(qRead.CTN12Y);
			obj.setCTN22Y(qRead.CTN22Y);
			obj.setCTN32Y(qRead.CTN32Y);
			obj.setPRNO2Y(qRead.PRNO2Y);
			obj.setCMNO2Y(qRead.CMNO2Y);
			obj.setTDNO2Y(qRead.TDNO2Y);
			obj.setJBRF2Y(qRead.JBRF2Y);
			obj.setDUDT2Y(qRead.DUDT2Y);
			obj.setTLLN2Y(qRead.TLLN2Y);
			obj.setTLUN2Y(qRead.TLUN2Y);
			obj.setTLSL2Y(qRead.TLSL2Y);
			obj.setTLDB2Y(qRead.TLDB2Y);
			obj.setTLSC2Y(qRead.TLSC2Y);
			obj.setINTL2Y(qRead.INTL2Y);
			obj.setTLDA2Y(qRead.TLDA2Y);
			obj.setNTTL2Y(qRead.NTTL2Y);
			obj.setTLOU2Y(qRead.TLOU2Y);
			obj.setTLOD2Y(qRead.TLOD2Y);
			obj.setTLIU2Y(qRead.TLIU2Y);
			obj.setTLID2Y(qRead.TLID2Y);
			obj.setTLDU2Y(qRead.TLDU2Y);
			obj.setTLDD2Y(qRead.TLDD2Y);
			obj.setTLCU2Y(qRead.TLCU2Y);
			obj.setTLCD2Y(qRead.TLCD2Y);
			obj.setCRCK2Y(qRead.CRCK2Y);
			obj.setNOEX2Y(qRead.NOEX2Y);
			obj.setDTEX2Y(qRead.DTEX2Y);
			obj.setCONV2Y(qRead.CONV2Y);
			obj.setAPTP2Y(qRead.APTP2Y);
			obj.setOSTS2Y(qRead.OSTS2Y);
			obj.setORCL2Y(qRead.ORCL2Y);
			obj.setPSBK2Y(qRead.PSBK2Y);
			obj.setCRWS2Y(qRead.CRWS2Y);
			obj.setCRUS2Y(qRead.CRUS2Y);
			obj.setCRDT2Y(qRead.CRDT2Y);
			obj.setCRTM2Y(qRead.CRTM2Y);
			obj.setMNWS2Y(qRead.MNWS2Y);
			obj.setMNUS2Y(qRead.MNUS2Y);
			obj.setMNDT2Y(qRead.MNDT2Y);
			obj.setMNTM2Y(qRead.MNTM2Y);
			obj.setOCUS2Y(qRead.OCUS2Y);
			obj.setOCDT2Y(qRead.OCDT2Y);
			obj.setOCTM2Y(qRead.OCTM2Y);
			obj.setPRDT2Y(qRead.PRDT2Y);
			obj.setPRTM2Y(qRead.PRTM2Y);
			obj.setNOPR2Y(qRead.NOPR2Y);
			obj.setFCTR2Y(qRead.FCTR2Y);
			obj.setEDR12Y(qRead.EDR12Y);
			obj.setEDR22Y(qRead.EDR22Y);
			obj.setEDR32Y(qRead.EDR32Y);
			obj.setEDR42Y(qRead.EDR42Y);
			obj.setEDR52Y(qRead.EDR52Y);
			obj.setEDR62Y(qRead.EDR62Y);
			obj.setEDR72Y(qRead.EDR72Y);
			obj.setEDR82Y(qRead.EDR82Y);
			obj.setEDR92Y(qRead.EDR92Y);
			obj.setSHFM2Y(qRead.SHFM2Y);
			obj.setCACD2Y(qRead.CACD2Y);
			obj.setETMC2Y(qRead.ETMC2Y);
			obj.setETBD2Y(qRead.ETBD2Y);
			obj.setETDP2Y(qRead.ETDP2Y);
			obj.setETDT2Y(qRead.ETDT2Y);
			obj.setETDD2Y(qRead.ETDD2Y);
			obj.setENDT2Y(qRead.ENDT2Y);
			obj.setENDD2Y(qRead.ENDD2Y);
			obj.setETDS2Y(qRead.ETDS2Y);
			obj.setESCA2Y(qRead.ESCA2Y);
			obj.setETRC2Y(qRead.ETRC2Y);
			obj.setESVD2Y(qRead.ESVD2Y);
			obj.setESMP2Y(qRead.ESMP2Y);
			obj.setEFBD2Y(qRead.EFBD2Y);
			obj.setRMOR2Y(qRead.RMOR2Y);
			obj.setLCC12Y(qRead.LCC12Y);
			obj.setLCD12Y(qRead.LCD12Y);
			obj.setLCP12Y(qRead.LCP12Y);
			obj.setLCN12Y(qRead.LCN12Y);
			obj.setLCC22Y(qRead.LCC22Y);
			obj.setLCD22Y(qRead.LCD22Y);
			obj.setLCP22Y(qRead.LCP22Y);
			obj.setLCN22Y(qRead.LCN22Y);
			obj.setLCC32Y(qRead.LCC32Y);
			obj.setLCD32Y(qRead.LCD32Y);
			obj.setLCP32Y(qRead.LCP32Y);
			obj.setLCN32Y(qRead.LCN32Y);
			obj.setLCC42Y(qRead.LCC42Y);
			obj.setLCD42Y(qRead.LCD42Y);
			obj.setLCP42Y(qRead.LCP42Y);
			obj.setLCN42Y(qRead.LCN42Y);
			obj.setLCC52Y(qRead.LCC52Y);
			obj.setLCD52Y(qRead.LCD52Y);
			obj.setLCP52Y(qRead.LCP52Y);
			obj.setLCN52Y(qRead.LCN52Y);
			obj.setLCC62Y(qRead.LCC62Y);
			obj.setLCD62Y(qRead.LCD62Y);
			obj.setLCP62Y(qRead.LCP62Y);
			obj.setLCN62Y(qRead.LCN62Y);
			obj.setLCC72Y(qRead.LCC72Y);
			obj.setLCD72Y(qRead.LCD72Y);
			obj.setLCP72Y(qRead.LCP72Y);
			obj.setLCN72Y(qRead.LCN72Y);
			obj.setLCC82Y(qRead.LCC82Y);
			obj.setLCD82Y(qRead.LCD82Y);
			obj.setLCP82Y(qRead.LCP82Y);
			obj.setLCN82Y(qRead.LCN82Y);
			obj.setLCC92Y(qRead.LCC92Y);
			obj.setLCD92Y(qRead.LCD92Y);
			obj.setLCP92Y(qRead.LCP92Y);
			obj.setLCN92Y(qRead.LCN92Y);
			obj.setPRMI2Y(qRead.PRMI2Y);
			obj.setSPMI2Y(qRead.SPMI2Y);
			obj.setSRCD2Y(qRead.SRCD2Y);
			obj.setWHNO2Y(qRead.WHNO2Y);
			obj.setEMA12Y(qRead.EMA12Y);
			obj.setEMA22Y(qRead.EMA22Y);
			obj.setEMA32Y(qRead.EMA32Y);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.as400.ORDHDR0">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local0=arguments.bean.getCONO2Y()>
		<cfset var local1=arguments.bean.getORNO2Y()>
		<cfset var local2=arguments.bean.getCSNO2Y()>
		<cfset var local3=arguments.bean.getCSSN2Y()>
		<cfset var local4=arguments.bean.getSHNO2Y()>
		<cfset var local5=arguments.bean.getDCNO2Y()>
		<cfset var local6=arguments.bean.getBLNO2Y()>
		<cfset var local7=arguments.bean.getBLFN2Y()>
		<cfset var local8=arguments.bean.getBLA12Y()>
		<cfset var local9=arguments.bean.getBLA22Y()>
		<cfset var local10=arguments.bean.getBLCT2Y()>
		<cfset var local11=arguments.bean.getBLST2Y()>
		<cfset var local12=arguments.bean.getBLZP2Y()>
		<cfset var local13=arguments.bean.getBLEX2Y()>
		<cfset var local14=arguments.bean.getBLCY2Y()>
		<cfset var local15=arguments.bean.getBLFA2Y()>
		<cfset var local16=arguments.bean.getSHFN2Y()>
		<cfset var local17=arguments.bean.getSHA12Y()>
		<cfset var local18=arguments.bean.getSHA22Y()>
		<cfset var local19=arguments.bean.getSHCT2Y()>
		<cfset var local20=arguments.bean.getSHST2Y()>
		<cfset var local21=arguments.bean.getSHZP2Y()>
		<cfset var local22=arguments.bean.getSHEX2Y()>
		<cfset var local23=arguments.bean.getSHCY2Y()>
		<cfset var local24=arguments.bean.getSHFA2Y()>
		<cfset var local25=arguments.bean.getDVNO2Y()>
		<cfset var local26=arguments.bean.getSNNO2Y()>
		<cfset var local27=arguments.bean.getSBSN2Y()>
		<cfset var local28=arguments.bean.getSASN2Y()>
		<cfset var local29=arguments.bean.getORDT2Y()>
		<cfset var local30=arguments.bean.getSSDT2Y()>
		<cfset var local31=arguments.bean.getCNDT2Y()>
		<cfset var local32=arguments.bean.getCMDT2Y()>
		<cfset var local33=arguments.bean.getSTDT2Y()>
		<cfset var local34=arguments.bean.getTMDT2Y()>
		<cfset var local35=arguments.bean.getCSDP2Y()>
		<cfset var local36=arguments.bean.getCSPO2Y()>
		<cfset var local37=arguments.bean.getORTP2Y()>
		<cfset var local38=arguments.bean.getBKDS2Y()>
		<cfset var local39=arguments.bean.getBKNO2Y()>
		<cfset var local40=arguments.bean.getORST2Y()>
		<cfset var local41=arguments.bean.getSVCD2Y()>
		<cfset var local42=arguments.bean.getSVDS2Y()>
		<cfset var local43=arguments.bean.getFBCD2Y()>
		<cfset var local44=arguments.bean.getFBDS2Y()>
		<cfset var local45=arguments.bean.getCLFR2Y()>
		<cfset var local46=arguments.bean.getCLIN2Y()>
		<cfset var local47=arguments.bean.getTMCD2Y()>
		<cfset var local48=arguments.bean.getTMDS2Y()>
		<cfset var local49=arguments.bean.getBYNO2Y()>
		<cfset var local50=arguments.bean.getSHPR2Y()>
		<cfset var local51=arguments.bean.getORPR2Y()>
		<cfset var local52=arguments.bean.getSMN12Y()>
		<cfset var local53=arguments.bean.getSMP12Y()>
		<cfset var local54=arguments.bean.getCMN12Y()>
		<cfset var local55=arguments.bean.getCMD12Y()>
		<cfset var local56=arguments.bean.getSMN22Y()>
		<cfset var local57=arguments.bean.getSMP22Y()>
		<cfset var local58=arguments.bean.getCMN22Y()>
		<cfset var local59=arguments.bean.getCMD22Y()>
		<cfset var local60=arguments.bean.getSMN32Y()>
		<cfset var local61=arguments.bean.getSMP32Y()>
		<cfset var local62=arguments.bean.getCMN32Y()>
		<cfset var local63=arguments.bean.getCMD32Y()>
		<cfset var local64=arguments.bean.getSMDF2Y()>
		<cfset var local65=arguments.bean.getTXNO2Y()>
		<cfset var local66=arguments.bean.getCTN12Y()>
		<cfset var local67=arguments.bean.getCTN22Y()>
		<cfset var local68=arguments.bean.getCTN32Y()>
		<cfset var local69=arguments.bean.getPRNO2Y()>
		<cfset var local70=arguments.bean.getCMNO2Y()>
		<cfset var local71=arguments.bean.getTDNO2Y()>
		<cfset var local72=arguments.bean.getJBRF2Y()>
		<cfset var local73=arguments.bean.getDUDT2Y()>
		<cfset var local74=arguments.bean.getTLLN2Y()>
		<cfset var local75=arguments.bean.getTLUN2Y()>
		<cfset var local76=arguments.bean.getTLSL2Y()>
		<cfset var local77=arguments.bean.getTLDB2Y()>
		<cfset var local78=arguments.bean.getTLSC2Y()>
		<cfset var local79=arguments.bean.getINTL2Y()>
		<cfset var local80=arguments.bean.getTLDA2Y()>
		<cfset var local81=arguments.bean.getNTTL2Y()>
		<cfset var local82=arguments.bean.getTLOU2Y()>
		<cfset var local83=arguments.bean.getTLOD2Y()>
		<cfset var local84=arguments.bean.getTLIU2Y()>
		<cfset var local85=arguments.bean.getTLID2Y()>
		<cfset var local86=arguments.bean.getTLDU2Y()>
		<cfset var local87=arguments.bean.getTLDD2Y()>
		<cfset var local88=arguments.bean.getTLCU2Y()>
		<cfset var local89=arguments.bean.getTLCD2Y()>
		<cfset var local90=arguments.bean.getCRCK2Y()>
		<cfset var local91=arguments.bean.getNOEX2Y()>
		<cfset var local92=arguments.bean.getDTEX2Y()>
		<cfset var local93=arguments.bean.getCONV2Y()>
		<cfset var local94=arguments.bean.getAPTP2Y()>
		<cfset var local95=arguments.bean.getOSTS2Y()>
		<cfset var local96=arguments.bean.getORCL2Y()>
		<cfset var local97=arguments.bean.getPSBK2Y()>
		<cfset var local98=arguments.bean.getCRWS2Y()>
		<cfset var local99=arguments.bean.getCRUS2Y()>
		<cfset var local100=arguments.bean.getCRDT2Y()>
		<cfset var local101=arguments.bean.getCRTM2Y()>
		<cfset var local102=arguments.bean.getMNWS2Y()>
		<cfset var local103=arguments.bean.getMNUS2Y()>
		<cfset var local104=arguments.bean.getMNDT2Y()>
		<cfset var local105=arguments.bean.getMNTM2Y()>
		<cfset var local106=arguments.bean.getOCUS2Y()>
		<cfset var local107=arguments.bean.getOCDT2Y()>
		<cfset var local108=arguments.bean.getOCTM2Y()>
		<cfset var local109=arguments.bean.getPRDT2Y()>
		<cfset var local110=arguments.bean.getPRTM2Y()>
		<cfset var local111=arguments.bean.getNOPR2Y()>
		<cfset var local112=arguments.bean.getFCTR2Y()>
		<cfset var local113=arguments.bean.getEDR12Y()>
		<cfset var local114=arguments.bean.getEDR22Y()>
		<cfset var local115=arguments.bean.getEDR32Y()>
		<cfset var local116=arguments.bean.getEDR42Y()>
		<cfset var local117=arguments.bean.getEDR52Y()>
		<cfset var local118=arguments.bean.getEDR62Y()>
		<cfset var local119=arguments.bean.getEDR72Y()>
		<cfset var local120=arguments.bean.getEDR82Y()>
		<cfset var local121=arguments.bean.getEDR92Y()>
		<cfset var local122=arguments.bean.getSHFM2Y()>
		<cfset var local123=arguments.bean.getCACD2Y()>
		<cfset var local124=arguments.bean.getETMC2Y()>
		<cfset var local125=arguments.bean.getETBD2Y()>
		<cfset var local126=arguments.bean.getETDP2Y()>
		<cfset var local127=arguments.bean.getETDT2Y()>
		<cfset var local128=arguments.bean.getETDD2Y()>
		<cfset var local129=arguments.bean.getENDT2Y()>
		<cfset var local130=arguments.bean.getENDD2Y()>
		<cfset var local131=arguments.bean.getETDS2Y()>
		<cfset var local132=arguments.bean.getESCA2Y()>
		<cfset var local133=arguments.bean.getETRC2Y()>
		<cfset var local134=arguments.bean.getESVD2Y()>
		<cfset var local135=arguments.bean.getESMP2Y()>
		<cfset var local136=arguments.bean.getEFBD2Y()>
		<cfset var local137=arguments.bean.getRMOR2Y()>
		<cfset var local138=arguments.bean.getLCC12Y()>
		<cfset var local139=arguments.bean.getLCD12Y()>
		<cfset var local140=arguments.bean.getLCP12Y()>
		<cfset var local141=arguments.bean.getLCN12Y()>
		<cfset var local142=arguments.bean.getLCC22Y()>
		<cfset var local143=arguments.bean.getLCD22Y()>
		<cfset var local144=arguments.bean.getLCP22Y()>
		<cfset var local145=arguments.bean.getLCN22Y()>
		<cfset var local146=arguments.bean.getLCC32Y()>
		<cfset var local147=arguments.bean.getLCD32Y()>
		<cfset var local148=arguments.bean.getLCP32Y()>
		<cfset var local149=arguments.bean.getLCN32Y()>
		<cfset var local150=arguments.bean.getLCC42Y()>
		<cfset var local151=arguments.bean.getLCD42Y()>
		<cfset var local152=arguments.bean.getLCP42Y()>
		<cfset var local153=arguments.bean.getLCN42Y()>
		<cfset var local154=arguments.bean.getLCC52Y()>
		<cfset var local155=arguments.bean.getLCD52Y()>
		<cfset var local156=arguments.bean.getLCP52Y()>
		<cfset var local157=arguments.bean.getLCN52Y()>
		<cfset var local158=arguments.bean.getLCC62Y()>
		<cfset var local159=arguments.bean.getLCD62Y()>
		<cfset var local160=arguments.bean.getLCP62Y()>
		<cfset var local161=arguments.bean.getLCN62Y()>
		<cfset var local162=arguments.bean.getLCC72Y()>
		<cfset var local163=arguments.bean.getLCD72Y()>
		<cfset var local164=arguments.bean.getLCP72Y()>
		<cfset var local165=arguments.bean.getLCN72Y()>
		<cfset var local166=arguments.bean.getLCC82Y()>
		<cfset var local167=arguments.bean.getLCD82Y()>
		<cfset var local168=arguments.bean.getLCP82Y()>
		<cfset var local169=arguments.bean.getLCN82Y()>
		<cfset var local170=arguments.bean.getLCC92Y()>
		<cfset var local171=arguments.bean.getLCD92Y()>
		<cfset var local172=arguments.bean.getLCP92Y()>
		<cfset var local173=arguments.bean.getLCN92Y()>
		<cfset var local174=arguments.bean.getPRMI2Y()>
		<cfset var local175=arguments.bean.getSPMI2Y()>
		<cfset var local176=arguments.bean.getSRCD2Y()>
		<cfset var local177=arguments.bean.getWHNO2Y()>
		<cfset var local178=arguments.bean.getEMA12Y()>
		<cfset var local179=arguments.bean.getEMA22Y()>
		<cfset var local180=arguments.bean.getEMA32Y()>

		<cfquery name="qCreate" datasource="AS400">
			insert into VPSFILES.ORDHDR0(CONO2Y, ORNO2Y, CSNO2Y, CSSN2Y, SHNO2Y, DCNO2Y, BLNO2Y, BLFN2Y, BLA12Y, BLA22Y, BLCT2Y, BLST2Y, BLZP2Y, BLEX2Y, BLCY2Y, BLFA2Y, SHFN2Y, SHA12Y, SHA22Y, SHCT2Y, SHST2Y, SHZP2Y, SHEX2Y, SHCY2Y, SHFA2Y, DVNO2Y, SNNO2Y, SBSN2Y, SASN2Y, ORDT2Y, SSDT2Y, CNDT2Y, CMDT2Y, STDT2Y, TMDT2Y, CSDP2Y, CSPO2Y, ORTP2Y, BKDS2Y, BKNO2Y, ORST2Y, SVCD2Y, SVDS2Y, FBCD2Y, FBDS2Y, CLFR2Y, CLIN2Y, TMCD2Y, TMDS2Y, BYNO2Y, SHPR2Y, ORPR2Y, SMN12Y, SMP12Y, CMN12Y, CMD12Y, SMN22Y, SMP22Y, CMN22Y, CMD22Y, SMN32Y, SMP32Y, CMN32Y, CMD32Y, SMDF2Y, TXNO2Y, CTN12Y, CTN22Y, CTN32Y, PRNO2Y, CMNO2Y, TDNO2Y, JBRF2Y, DUDT2Y, TLLN2Y, TLUN2Y, TLSL2Y, TLDB2Y, TLSC2Y, INTL2Y, TLDA2Y, NTTL2Y, TLOU2Y, TLOD2Y, TLIU2Y, TLID2Y, TLDU2Y, TLDD2Y, TLCU2Y, TLCD2Y, CRCK2Y, NOEX2Y, DTEX2Y, CONV2Y, APTP2Y, OSTS2Y, ORCL2Y, PSBK2Y, CRWS2Y, CRUS2Y, CRDT2Y, CRTM2Y, MNWS2Y, MNUS2Y, MNDT2Y, MNTM2Y, OCUS2Y, OCDT2Y, OCTM2Y, PRDT2Y, PRTM2Y, NOPR2Y, FCTR2Y, EDR12Y, EDR22Y, EDR32Y, EDR42Y, EDR52Y, EDR62Y, EDR72Y, EDR82Y, EDR92Y, SHFM2Y, CACD2Y, ETMC2Y, ETBD2Y, ETDP2Y, ETDT2Y, ETDD2Y, ENDT2Y, ENDD2Y, ETDS2Y, ESCA2Y, ETRC2Y, ESVD2Y, ESMP2Y, EFBD2Y, RMOR2Y, LCC12Y, LCD12Y, LCP12Y, LCN12Y, LCC22Y, LCD22Y, LCP22Y, LCN22Y, LCC32Y, LCD32Y, LCP32Y, LCN32Y, LCC42Y, LCD42Y, LCP42Y, LCN42Y, LCC52Y, LCD52Y, LCP52Y, LCN52Y, LCC62Y, LCD62Y, LCP62Y, LCN62Y, LCC72Y, LCD72Y, LCP72Y, LCN72Y, LCC82Y, LCD82Y, LCP82Y, LCN82Y, LCC92Y, LCD92Y, LCP92Y, LCN92Y, PRMI2Y, SPMI2Y, SRCD2Y, WHNO2Y, EMA12Y, EMA22Y, EMA32Y)
			values (
				<cfqueryparam value="#local0#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local0 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local1#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local2#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local2 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local3#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local4#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local4 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local5#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local5 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local6#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local6 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local7#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local8#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local9#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local10#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local11#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local12#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local13#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local14#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local15#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local16#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local17#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local18#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local19#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local20#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local21#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local22#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local23#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local24#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local25#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local25 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local26#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local26 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local27#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local27 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local28#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local28 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local29#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local29 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local30#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local30 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local31#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local31 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local32#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local32 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local33#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local33 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local34#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local34 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local35#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local36#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local37#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local38#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local39#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local39 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local40#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local41#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local42#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local43#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local44#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local45#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local46#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local47#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local48#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local49#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local49 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local50#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local50 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local51#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local51 eq ""), de("yes"), de("no"))#" />,
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
				<cfqueryparam value="#local69#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local69 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local70#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local70 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local71#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local71 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local72#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local73#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local73 eq ""), de("yes"), de("no"))#" />,
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
				<cfqueryparam value="#local90#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local91#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local91 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local92#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local93#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local94#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local95#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local96#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local97#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local98#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local99#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local100#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local100 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local101#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local101 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local102#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local103#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local104#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local104 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local105#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local105 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local106#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local107#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local107 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local108#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local108 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local109#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local109 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local110#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local110 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local111#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local111 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local112#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local113#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local114#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local115#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local116#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local117#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local118#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local119#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local120#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local121#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local122#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local122 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local123#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local124#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local125#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local126#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local126 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local127#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local127 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local128#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local128 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local129#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local129 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local130#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local130 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local131#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local132#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local133#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local134#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local135#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local136#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local137#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local138#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local139#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local140#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local140 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local141#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local142#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local143#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local144#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local144 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local145#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local146#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local147#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local148#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local148 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local149#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local150#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local151#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local152#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local152 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local153#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local154#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local155#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local156#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local156 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local157#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local158#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local159#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local160#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local160 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local161#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local162#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local163#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local164#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local164 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local165#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local166#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local167#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local168#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local168 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local169#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local170#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local171#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local172#" cfsqltype="CF_SQL_DECIMAL" null="#iif((local172 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local173#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local174#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local175#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local176#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local177#" cfsqltype="CF_SQL_NUMERIC" null="#iif((local177 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local178#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local179#" cfsqltype="CF_SQL_CHAR" />,
				<cfqueryparam value="#local180#" cfsqltype="CF_SQL_CHAR" />
			)
		</cfquery>

		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="mochi.cfc.as400.ORDHDR0">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="AS400" result="status">
			update VPSFILES.ORDHDR0
			set CONO2Y = <cfqueryparam value="#arguments.bean.getCONO2Y()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getCONO2Y() eq ""), de("yes"), de("no"))#" />,
				ORNO2Y = <cfqueryparam value="#arguments.bean.getORNO2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getORNO2Y() eq ""), de("yes"), de("no"))#" />,
				CSNO2Y = <cfqueryparam value="#arguments.bean.getCSNO2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCSNO2Y() eq ""), de("yes"), de("no"))#" />,
				CSSN2Y = <cfqueryparam value="#arguments.bean.getCSSN2Y()#" cfsqltype="CF_SQL_CHAR" />,
				SHNO2Y = <cfqueryparam value="#arguments.bean.getSHNO2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSHNO2Y() eq ""), de("yes"), de("no"))#" />,
				DCNO2Y = <cfqueryparam value="#arguments.bean.getDCNO2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getDCNO2Y() eq ""), de("yes"), de("no"))#" />,
				BLNO2Y = <cfqueryparam value="#arguments.bean.getBLNO2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getBLNO2Y() eq ""), de("yes"), de("no"))#" />,
				BLFN2Y = <cfqueryparam value="#arguments.bean.getBLFN2Y()#" cfsqltype="CF_SQL_CHAR" />,
				BLA12Y = <cfqueryparam value="#arguments.bean.getBLA12Y()#" cfsqltype="CF_SQL_CHAR" />,
				BLA22Y = <cfqueryparam value="#arguments.bean.getBLA22Y()#" cfsqltype="CF_SQL_CHAR" />,
				BLCT2Y = <cfqueryparam value="#arguments.bean.getBLCT2Y()#" cfsqltype="CF_SQL_CHAR" />,
				BLST2Y = <cfqueryparam value="#arguments.bean.getBLST2Y()#" cfsqltype="CF_SQL_CHAR" />,
				BLZP2Y = <cfqueryparam value="#arguments.bean.getBLZP2Y()#" cfsqltype="CF_SQL_CHAR" />,
				BLEX2Y = <cfqueryparam value="#arguments.bean.getBLEX2Y()#" cfsqltype="CF_SQL_CHAR" />,
				BLCY2Y = <cfqueryparam value="#arguments.bean.getBLCY2Y()#" cfsqltype="CF_SQL_CHAR" />,
				BLFA2Y = <cfqueryparam value="#arguments.bean.getBLFA2Y()#" cfsqltype="CF_SQL_CHAR" />,
				SHFN2Y = <cfqueryparam value="#arguments.bean.getSHFN2Y()#" cfsqltype="CF_SQL_CHAR" />,
				SHA12Y = <cfqueryparam value="#arguments.bean.getSHA12Y()#" cfsqltype="CF_SQL_CHAR" />,
				SHA22Y = <cfqueryparam value="#arguments.bean.getSHA22Y()#" cfsqltype="CF_SQL_CHAR" />,
				SHCT2Y = <cfqueryparam value="#arguments.bean.getSHCT2Y()#" cfsqltype="CF_SQL_CHAR" />,
				SHST2Y = <cfqueryparam value="#arguments.bean.getSHST2Y()#" cfsqltype="CF_SQL_CHAR" />,
				SHZP2Y = <cfqueryparam value="#arguments.bean.getSHZP2Y()#" cfsqltype="CF_SQL_CHAR" />,
				SHEX2Y = <cfqueryparam value="#arguments.bean.getSHEX2Y()#" cfsqltype="CF_SQL_CHAR" />,
				SHCY2Y = <cfqueryparam value="#arguments.bean.getSHCY2Y()#" cfsqltype="CF_SQL_CHAR" />,
				SHFA2Y = <cfqueryparam value="#arguments.bean.getSHFA2Y()#" cfsqltype="CF_SQL_CHAR" />,
				DVNO2Y = <cfqueryparam value="#arguments.bean.getDVNO2Y()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getDVNO2Y() eq ""), de("yes"), de("no"))#" />,
				SNNO2Y = <cfqueryparam value="#arguments.bean.getSNNO2Y()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getSNNO2Y() eq ""), de("yes"), de("no"))#" />,
				SBSN2Y = <cfqueryparam value="#arguments.bean.getSBSN2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSBSN2Y() eq ""), de("yes"), de("no"))#" />,
				SASN2Y = <cfqueryparam value="#arguments.bean.getSASN2Y()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getSASN2Y() eq ""), de("yes"), de("no"))#" />,
				ORDT2Y = <cfqueryparam value="#arguments.bean.getORDT2Y()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getORDT2Y() eq ""), de("yes"), de("no"))#" />,
				SSDT2Y = <cfqueryparam value="#arguments.bean.getSSDT2Y()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getSSDT2Y() eq ""), de("yes"), de("no"))#" />,
				CNDT2Y = <cfqueryparam value="#arguments.bean.getCNDT2Y()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getCNDT2Y() eq ""), de("yes"), de("no"))#" />,
				CMDT2Y = <cfqueryparam value="#arguments.bean.getCMDT2Y()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getCMDT2Y() eq ""), de("yes"), de("no"))#" />,
				STDT2Y = <cfqueryparam value="#arguments.bean.getSTDT2Y()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getSTDT2Y() eq ""), de("yes"), de("no"))#" />,
				TMDT2Y = <cfqueryparam value="#arguments.bean.getTMDT2Y()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getTMDT2Y() eq ""), de("yes"), de("no"))#" />,
				CSDP2Y = <cfqueryparam value="#arguments.bean.getCSDP2Y()#" cfsqltype="CF_SQL_CHAR" />,
				CSPO2Y = <cfqueryparam value="#arguments.bean.getCSPO2Y()#" cfsqltype="CF_SQL_CHAR" />,
				ORTP2Y = <cfqueryparam value="#arguments.bean.getORTP2Y()#" cfsqltype="CF_SQL_CHAR" />,
				BKDS2Y = <cfqueryparam value="#arguments.bean.getBKDS2Y()#" cfsqltype="CF_SQL_CHAR" />,
				BKNO2Y = <cfqueryparam value="#arguments.bean.getBKNO2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getBKNO2Y() eq ""), de("yes"), de("no"))#" />,
				ORST2Y = <cfqueryparam value="#arguments.bean.getORST2Y()#" cfsqltype="CF_SQL_CHAR" />,
				SVCD2Y = <cfqueryparam value="#arguments.bean.getSVCD2Y()#" cfsqltype="CF_SQL_CHAR" />,
				SVDS2Y = <cfqueryparam value="#arguments.bean.getSVDS2Y()#" cfsqltype="CF_SQL_CHAR" />,
				FBCD2Y = <cfqueryparam value="#arguments.bean.getFBCD2Y()#" cfsqltype="CF_SQL_CHAR" />,
				FBDS2Y = <cfqueryparam value="#arguments.bean.getFBDS2Y()#" cfsqltype="CF_SQL_CHAR" />,
				CLFR2Y = <cfqueryparam value="#arguments.bean.getCLFR2Y()#" cfsqltype="CF_SQL_CHAR" />,
				CLIN2Y = <cfqueryparam value="#arguments.bean.getCLIN2Y()#" cfsqltype="CF_SQL_CHAR" />,
				TMCD2Y = <cfqueryparam value="#arguments.bean.getTMCD2Y()#" cfsqltype="CF_SQL_CHAR" />,
				TMDS2Y = <cfqueryparam value="#arguments.bean.getTMDS2Y()#" cfsqltype="CF_SQL_CHAR" />,
				BYNO2Y = <cfqueryparam value="#arguments.bean.getBYNO2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getBYNO2Y() eq ""), de("yes"), de("no"))#" />,
				SHPR2Y = <cfqueryparam value="#arguments.bean.getSHPR2Y()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getSHPR2Y() eq ""), de("yes"), de("no"))#" />,
				ORPR2Y = <cfqueryparam value="#arguments.bean.getORPR2Y()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getORPR2Y() eq ""), de("yes"), de("no"))#" />,
				SMN12Y = <cfqueryparam value="#arguments.bean.getSMN12Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSMN12Y() eq ""), de("yes"), de("no"))#" />,
				SMP12Y = <cfqueryparam value="#arguments.bean.getSMP12Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSMP12Y() eq ""), de("yes"), de("no"))#" />,
				CMN12Y = <cfqueryparam value="#arguments.bean.getCMN12Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCMN12Y() eq ""), de("yes"), de("no"))#" />,
				CMD12Y = <cfqueryparam value="#arguments.bean.getCMD12Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCMD12Y() eq ""), de("yes"), de("no"))#" />,
				SMN22Y = <cfqueryparam value="#arguments.bean.getSMN22Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSMN22Y() eq ""), de("yes"), de("no"))#" />,
				SMP22Y = <cfqueryparam value="#arguments.bean.getSMP22Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSMP22Y() eq ""), de("yes"), de("no"))#" />,
				CMN22Y = <cfqueryparam value="#arguments.bean.getCMN22Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCMN22Y() eq ""), de("yes"), de("no"))#" />,
				CMD22Y = <cfqueryparam value="#arguments.bean.getCMD22Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCMD22Y() eq ""), de("yes"), de("no"))#" />,
				SMN32Y = <cfqueryparam value="#arguments.bean.getSMN32Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSMN32Y() eq ""), de("yes"), de("no"))#" />,
				SMP32Y = <cfqueryparam value="#arguments.bean.getSMP32Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSMP32Y() eq ""), de("yes"), de("no"))#" />,
				CMN32Y = <cfqueryparam value="#arguments.bean.getCMN32Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCMN32Y() eq ""), de("yes"), de("no"))#" />,
				CMD32Y = <cfqueryparam value="#arguments.bean.getCMD32Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCMD32Y() eq ""), de("yes"), de("no"))#" />,
				SMDF2Y = <cfqueryparam value="#arguments.bean.getSMDF2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSMDF2Y() eq ""), de("yes"), de("no"))#" />,
				TXNO2Y = <cfqueryparam value="#arguments.bean.getTXNO2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTXNO2Y() eq ""), de("yes"), de("no"))#" />,
				CTN12Y = <cfqueryparam value="#arguments.bean.getCTN12Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCTN12Y() eq ""), de("yes"), de("no"))#" />,
				CTN22Y = <cfqueryparam value="#arguments.bean.getCTN22Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCTN22Y() eq ""), de("yes"), de("no"))#" />,
				CTN32Y = <cfqueryparam value="#arguments.bean.getCTN32Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCTN32Y() eq ""), de("yes"), de("no"))#" />,
				PRNO2Y = <cfqueryparam value="#arguments.bean.getPRNO2Y()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getPRNO2Y() eq ""), de("yes"), de("no"))#" />,
				CMNO2Y = <cfqueryparam value="#arguments.bean.getCMNO2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getCMNO2Y() eq ""), de("yes"), de("no"))#" />,
				TDNO2Y = <cfqueryparam value="#arguments.bean.getTDNO2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTDNO2Y() eq ""), de("yes"), de("no"))#" />,
				JBRF2Y = <cfqueryparam value="#arguments.bean.getJBRF2Y()#" cfsqltype="CF_SQL_CHAR" />,
				DUDT2Y = <cfqueryparam value="#arguments.bean.getDUDT2Y()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getDUDT2Y() eq ""), de("yes"), de("no"))#" />,
				TLLN2Y = <cfqueryparam value="#arguments.bean.getTLLN2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLLN2Y() eq ""), de("yes"), de("no"))#" />,
				TLUN2Y = <cfqueryparam value="#arguments.bean.getTLUN2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLUN2Y() eq ""), de("yes"), de("no"))#" />,
				TLSL2Y = <cfqueryparam value="#arguments.bean.getTLSL2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLSL2Y() eq ""), de("yes"), de("no"))#" />,
				TLDB2Y = <cfqueryparam value="#arguments.bean.getTLDB2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLDB2Y() eq ""), de("yes"), de("no"))#" />,
				TLSC2Y = <cfqueryparam value="#arguments.bean.getTLSC2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLSC2Y() eq ""), de("yes"), de("no"))#" />,
				INTL2Y = <cfqueryparam value="#arguments.bean.getINTL2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getINTL2Y() eq ""), de("yes"), de("no"))#" />,
				TLDA2Y = <cfqueryparam value="#arguments.bean.getTLDA2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLDA2Y() eq ""), de("yes"), de("no"))#" />,
				NTTL2Y = <cfqueryparam value="#arguments.bean.getNTTL2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getNTTL2Y() eq ""), de("yes"), de("no"))#" />,
				TLOU2Y = <cfqueryparam value="#arguments.bean.getTLOU2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLOU2Y() eq ""), de("yes"), de("no"))#" />,
				TLOD2Y = <cfqueryparam value="#arguments.bean.getTLOD2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLOD2Y() eq ""), de("yes"), de("no"))#" />,
				TLIU2Y = <cfqueryparam value="#arguments.bean.getTLIU2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLIU2Y() eq ""), de("yes"), de("no"))#" />,
				TLID2Y = <cfqueryparam value="#arguments.bean.getTLID2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLID2Y() eq ""), de("yes"), de("no"))#" />,
				TLDU2Y = <cfqueryparam value="#arguments.bean.getTLDU2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLDU2Y() eq ""), de("yes"), de("no"))#" />,
				TLDD2Y = <cfqueryparam value="#arguments.bean.getTLDD2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLDD2Y() eq ""), de("yes"), de("no"))#" />,
				TLCU2Y = <cfqueryparam value="#arguments.bean.getTLCU2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLCU2Y() eq ""), de("yes"), de("no"))#" />,
				TLCD2Y = <cfqueryparam value="#arguments.bean.getTLCD2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getTLCD2Y() eq ""), de("yes"), de("no"))#" />,
				CRCK2Y = <cfqueryparam value="#arguments.bean.getCRCK2Y()#" cfsqltype="CF_SQL_CHAR" />,
				NOEX2Y = <cfqueryparam value="#arguments.bean.getNOEX2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getNOEX2Y() eq ""), de("yes"), de("no"))#" />,
				DTEX2Y = <cfqueryparam value="#arguments.bean.getDTEX2Y()#" cfsqltype="CF_SQL_CHAR" />,
				CONV2Y = <cfqueryparam value="#arguments.bean.getCONV2Y()#" cfsqltype="CF_SQL_CHAR" />,
				APTP2Y = <cfqueryparam value="#arguments.bean.getAPTP2Y()#" cfsqltype="CF_SQL_CHAR" />,
				OSTS2Y = <cfqueryparam value="#arguments.bean.getOSTS2Y()#" cfsqltype="CF_SQL_CHAR" />,
				ORCL2Y = <cfqueryparam value="#arguments.bean.getORCL2Y()#" cfsqltype="CF_SQL_CHAR" />,
				PSBK2Y = <cfqueryparam value="#arguments.bean.getPSBK2Y()#" cfsqltype="CF_SQL_CHAR" />,
				CRWS2Y = <cfqueryparam value="#arguments.bean.getCRWS2Y()#" cfsqltype="CF_SQL_CHAR" />,
				CRUS2Y = <cfqueryparam value="#arguments.bean.getCRUS2Y()#" cfsqltype="CF_SQL_CHAR" />,
				CRDT2Y = <cfqueryparam value="#arguments.bean.getCRDT2Y()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getCRDT2Y() eq ""), de("yes"), de("no"))#" />,
				CRTM2Y = <cfqueryparam value="#arguments.bean.getCRTM2Y()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getCRTM2Y() eq ""), de("yes"), de("no"))#" />,
				MNWS2Y = <cfqueryparam value="#arguments.bean.getMNWS2Y()#" cfsqltype="CF_SQL_CHAR" />,
				MNUS2Y = <cfqueryparam value="#arguments.bean.getMNUS2Y()#" cfsqltype="CF_SQL_CHAR" />,
				MNDT2Y = <cfqueryparam value="#arguments.bean.getMNDT2Y()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getMNDT2Y() eq ""), de("yes"), de("no"))#" />,
				MNTM2Y = <cfqueryparam value="#arguments.bean.getMNTM2Y()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getMNTM2Y() eq ""), de("yes"), de("no"))#" />,
				OCUS2Y = <cfqueryparam value="#arguments.bean.getOCUS2Y()#" cfsqltype="CF_SQL_CHAR" />,
				OCDT2Y = <cfqueryparam value="#arguments.bean.getOCDT2Y()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getOCDT2Y() eq ""), de("yes"), de("no"))#" />,
				OCTM2Y = <cfqueryparam value="#arguments.bean.getOCTM2Y()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getOCTM2Y() eq ""), de("yes"), de("no"))#" />,
				PRDT2Y = <cfqueryparam value="#arguments.bean.getPRDT2Y()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getPRDT2Y() eq ""), de("yes"), de("no"))#" />,
				PRTM2Y = <cfqueryparam value="#arguments.bean.getPRTM2Y()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getPRTM2Y() eq ""), de("yes"), de("no"))#" />,
				NOPR2Y = <cfqueryparam value="#arguments.bean.getNOPR2Y()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getNOPR2Y() eq ""), de("yes"), de("no"))#" />,
				FCTR2Y = <cfqueryparam value="#arguments.bean.getFCTR2Y()#" cfsqltype="CF_SQL_CHAR" />,
				EDR12Y = <cfqueryparam value="#arguments.bean.getEDR12Y()#" cfsqltype="CF_SQL_CHAR" />,
				EDR22Y = <cfqueryparam value="#arguments.bean.getEDR22Y()#" cfsqltype="CF_SQL_CHAR" />,
				EDR32Y = <cfqueryparam value="#arguments.bean.getEDR32Y()#" cfsqltype="CF_SQL_CHAR" />,
				EDR42Y = <cfqueryparam value="#arguments.bean.getEDR42Y()#" cfsqltype="CF_SQL_CHAR" />,
				EDR52Y = <cfqueryparam value="#arguments.bean.getEDR52Y()#" cfsqltype="CF_SQL_CHAR" />,
				EDR62Y = <cfqueryparam value="#arguments.bean.getEDR62Y()#" cfsqltype="CF_SQL_CHAR" />,
				EDR72Y = <cfqueryparam value="#arguments.bean.getEDR72Y()#" cfsqltype="CF_SQL_CHAR" />,
				EDR82Y = <cfqueryparam value="#arguments.bean.getEDR82Y()#" cfsqltype="CF_SQL_CHAR" />,
				EDR92Y = <cfqueryparam value="#arguments.bean.getEDR92Y()#" cfsqltype="CF_SQL_CHAR" />,
				SHFM2Y = <cfqueryparam value="#arguments.bean.getSHFM2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getSHFM2Y() eq ""), de("yes"), de("no"))#" />,
				CACD2Y = <cfqueryparam value="#arguments.bean.getCACD2Y()#" cfsqltype="CF_SQL_CHAR" />,
				ETMC2Y = <cfqueryparam value="#arguments.bean.getETMC2Y()#" cfsqltype="CF_SQL_CHAR" />,
				ETBD2Y = <cfqueryparam value="#arguments.bean.getETBD2Y()#" cfsqltype="CF_SQL_CHAR" />,
				ETDP2Y = <cfqueryparam value="#arguments.bean.getETDP2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getETDP2Y() eq ""), de("yes"), de("no"))#" />,
				ETDT2Y = <cfqueryparam value="#arguments.bean.getETDT2Y()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getETDT2Y() eq ""), de("yes"), de("no"))#" />,
				ETDD2Y = <cfqueryparam value="#arguments.bean.getETDD2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getETDD2Y() eq ""), de("yes"), de("no"))#" />,
				ENDT2Y = <cfqueryparam value="#arguments.bean.getENDT2Y()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getENDT2Y() eq ""), de("yes"), de("no"))#" />,
				ENDD2Y = <cfqueryparam value="#arguments.bean.getENDD2Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getENDD2Y() eq ""), de("yes"), de("no"))#" />,
				ETDS2Y = <cfqueryparam value="#arguments.bean.getETDS2Y()#" cfsqltype="CF_SQL_CHAR" />,
				ESCA2Y = <cfqueryparam value="#arguments.bean.getESCA2Y()#" cfsqltype="CF_SQL_CHAR" />,
				ETRC2Y = <cfqueryparam value="#arguments.bean.getETRC2Y()#" cfsqltype="CF_SQL_CHAR" />,
				ESVD2Y = <cfqueryparam value="#arguments.bean.getESVD2Y()#" cfsqltype="CF_SQL_CHAR" />,
				ESMP2Y = <cfqueryparam value="#arguments.bean.getESMP2Y()#" cfsqltype="CF_SQL_CHAR" />,
				EFBD2Y = <cfqueryparam value="#arguments.bean.getEFBD2Y()#" cfsqltype="CF_SQL_CHAR" />,
				RMOR2Y = <cfqueryparam value="#arguments.bean.getRMOR2Y()#" cfsqltype="CF_SQL_CHAR" />,
				LCC12Y = <cfqueryparam value="#arguments.bean.getLCC12Y()#" cfsqltype="CF_SQL_CHAR" />,
				LCD12Y = <cfqueryparam value="#arguments.bean.getLCD12Y()#" cfsqltype="CF_SQL_CHAR" />,
				LCP12Y = <cfqueryparam value="#arguments.bean.getLCP12Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getLCP12Y() eq ""), de("yes"), de("no"))#" />,
				LCN12Y = <cfqueryparam value="#arguments.bean.getLCN12Y()#" cfsqltype="CF_SQL_CHAR" />,
				LCC22Y = <cfqueryparam value="#arguments.bean.getLCC22Y()#" cfsqltype="CF_SQL_CHAR" />,
				LCD22Y = <cfqueryparam value="#arguments.bean.getLCD22Y()#" cfsqltype="CF_SQL_CHAR" />,
				LCP22Y = <cfqueryparam value="#arguments.bean.getLCP22Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getLCP22Y() eq ""), de("yes"), de("no"))#" />,
				LCN22Y = <cfqueryparam value="#arguments.bean.getLCN22Y()#" cfsqltype="CF_SQL_CHAR" />,
				LCC32Y = <cfqueryparam value="#arguments.bean.getLCC32Y()#" cfsqltype="CF_SQL_CHAR" />,
				LCD32Y = <cfqueryparam value="#arguments.bean.getLCD32Y()#" cfsqltype="CF_SQL_CHAR" />,
				LCP32Y = <cfqueryparam value="#arguments.bean.getLCP32Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getLCP32Y() eq ""), de("yes"), de("no"))#" />,
				LCN32Y = <cfqueryparam value="#arguments.bean.getLCN32Y()#" cfsqltype="CF_SQL_CHAR" />,
				LCC42Y = <cfqueryparam value="#arguments.bean.getLCC42Y()#" cfsqltype="CF_SQL_CHAR" />,
				LCD42Y = <cfqueryparam value="#arguments.bean.getLCD42Y()#" cfsqltype="CF_SQL_CHAR" />,
				LCP42Y = <cfqueryparam value="#arguments.bean.getLCP42Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getLCP42Y() eq ""), de("yes"), de("no"))#" />,
				LCN42Y = <cfqueryparam value="#arguments.bean.getLCN42Y()#" cfsqltype="CF_SQL_CHAR" />,
				LCC52Y = <cfqueryparam value="#arguments.bean.getLCC52Y()#" cfsqltype="CF_SQL_CHAR" />,
				LCD52Y = <cfqueryparam value="#arguments.bean.getLCD52Y()#" cfsqltype="CF_SQL_CHAR" />,
				LCP52Y = <cfqueryparam value="#arguments.bean.getLCP52Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getLCP52Y() eq ""), de("yes"), de("no"))#" />,
				LCN52Y = <cfqueryparam value="#arguments.bean.getLCN52Y()#" cfsqltype="CF_SQL_CHAR" />,
				LCC62Y = <cfqueryparam value="#arguments.bean.getLCC62Y()#" cfsqltype="CF_SQL_CHAR" />,
				LCD62Y = <cfqueryparam value="#arguments.bean.getLCD62Y()#" cfsqltype="CF_SQL_CHAR" />,
				LCP62Y = <cfqueryparam value="#arguments.bean.getLCP62Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getLCP62Y() eq ""), de("yes"), de("no"))#" />,
				LCN62Y = <cfqueryparam value="#arguments.bean.getLCN62Y()#" cfsqltype="CF_SQL_CHAR" />,
				LCC72Y = <cfqueryparam value="#arguments.bean.getLCC72Y()#" cfsqltype="CF_SQL_CHAR" />,
				LCD72Y = <cfqueryparam value="#arguments.bean.getLCD72Y()#" cfsqltype="CF_SQL_CHAR" />,
				LCP72Y = <cfqueryparam value="#arguments.bean.getLCP72Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getLCP72Y() eq ""), de("yes"), de("no"))#" />,
				LCN72Y = <cfqueryparam value="#arguments.bean.getLCN72Y()#" cfsqltype="CF_SQL_CHAR" />,
				LCC82Y = <cfqueryparam value="#arguments.bean.getLCC82Y()#" cfsqltype="CF_SQL_CHAR" />,
				LCD82Y = <cfqueryparam value="#arguments.bean.getLCD82Y()#" cfsqltype="CF_SQL_CHAR" />,
				LCP82Y = <cfqueryparam value="#arguments.bean.getLCP82Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getLCP82Y() eq ""), de("yes"), de("no"))#" />,
				LCN82Y = <cfqueryparam value="#arguments.bean.getLCN82Y()#" cfsqltype="CF_SQL_CHAR" />,
				LCC92Y = <cfqueryparam value="#arguments.bean.getLCC92Y()#" cfsqltype="CF_SQL_CHAR" />,
				LCD92Y = <cfqueryparam value="#arguments.bean.getLCD92Y()#" cfsqltype="CF_SQL_CHAR" />,
				LCP92Y = <cfqueryparam value="#arguments.bean.getLCP92Y()#" cfsqltype="CF_SQL_DECIMAL" null="#iif((arguments.bean.getLCP92Y() eq ""), de("yes"), de("no"))#" />,
				LCN92Y = <cfqueryparam value="#arguments.bean.getLCN92Y()#" cfsqltype="CF_SQL_CHAR" />,
				PRMI2Y = <cfqueryparam value="#arguments.bean.getPRMI2Y()#" cfsqltype="CF_SQL_CHAR" />,
				SPMI2Y = <cfqueryparam value="#arguments.bean.getSPMI2Y()#" cfsqltype="CF_SQL_CHAR" />,
				SRCD2Y = <cfqueryparam value="#arguments.bean.getSRCD2Y()#" cfsqltype="CF_SQL_CHAR" />,
				WHNO2Y = <cfqueryparam value="#arguments.bean.getWHNO2Y()#" cfsqltype="CF_SQL_NUMERIC" null="#iif((arguments.bean.getWHNO2Y() eq ""), de("yes"), de("no"))#" />,
				EMA12Y = <cfqueryparam value="#arguments.bean.getEMA12Y()#" cfsqltype="CF_SQL_CHAR" />,
				EMA22Y = <cfqueryparam value="#arguments.bean.getEMA22Y()#" cfsqltype="CF_SQL_CHAR" />,
				EMA32Y = <cfqueryparam value="#arguments.bean.getEMA32Y()#" cfsqltype="CF_SQL_CHAR" />
			where CONO2Y = <cfqueryparam value="#arguments.bean.getCONO2Y()#" cfsqltype="CF_SQL_NUMERIC">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="mochi.cfc.as400.ORDHDR0">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="AS400" result="status">
			delete
			from VPSFILES.ORDHDR0
			where CONO2Y = <cfqueryparam cfsqltype="CF_SQL_NUMERIC" value="#arguments.bean.getCONO2Y()#" />
		</cfquery>

	</cffunction>


</cfcomponent>