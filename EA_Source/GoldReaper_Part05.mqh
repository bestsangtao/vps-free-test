    if ( legacyTemp_dealMsc>legacyTemp_latestMsc )   legacyTemp_latestMsc = legacyTemp_dealMsc ;
    ENUM_DEAL_TYPE legacyTemp_type = (ENUM_DEAL_TYPE)HistoryDealGetInteger(legacyTemp_ticket,DEAL_TYPE) ;
    if ( legacyTemp_type!=DEAL_TYPE_BALANCE )   continue;
    double legacyTemp_amount = HistoryDealGetDouble(legacyTemp_ticket,DEAL_PROFIT) ;
    if ( legacyTemp_amount<0.0 )   legacyTemp_withdrawals = legacyTemp_withdrawals + legacyTemp_amount ;
  }
  if ( legacyTemp_withdrawals<0.0 )   ApplyOnlyUpWithdrawal(legacyTemp_withdrawals) ;
  if ( legacyTemp_nowMsc>legacyTemp_latestMsc )   legacyTemp_latestMsc = legacyTemp_nowMsc ;
  g_onlyUpWithdrawScannedMsc = legacyTemp_latestMsc ;
  GlobalVariableSet(OnlyUpWithdrawGVName(),(double)g_onlyUpWithdrawScannedMsc) ;
 }
//ReconcileOnlyUpWithdrawals <<==--------   --------

 int OnInit()
 {
g_startLots_rw=StartLots;
  double    localDouble02;
  double    localDouble03;
  int       localInt04;
  int       localInt05;
  int       localInt06;
  int       localInt07;
  int       localInt08;
  int       localInt09;
//----- -----
 // MQL4 tu dong khoi tao bool local ve false; MQL5 thi khong, nen phai gan
 // ro rang de giu dung hanh vi ban goc (bien nay khong duoc gan truoc khi
 // dung o duoi, IsDemo() ket qua bi bo qua trong ca ban mq4 goc).
 bool       tmpBool01 = false;

 // Sinh ma rieng cho lan chay Strategy Tester nay (xem OnlyUpPeakGVName) -
 // GetTickCount() (mili-giay tu luc terminal khoi dong) + so ngau nhien de
 // moi lan backtest deu co ma khac nhau, tranh trung khi nhieu agent toi uu
 // hoa chay song song va bat dau o cung mot thoi diem. MathRand() bat buoc
 // phai MathSrand() truoc thi moi cho ra chuoi so khac nhau giua cac lan
 // chay (theo tai lieu MQL5) - neu khong se luon ra cung 1 gia tri co dinh
 // moi lan khoi dong, lam mat tac dung chong trung.
 // SetFontSize >0: ghi de co chu panel (0 = co mac dinh theo thiet ke goc)
 if ( SetFontSize > 0 )   panelFontSize = SetFontSize ;
 MathSrand((int)GetTickCount()) ;
 g_onlyUpRunId = (long)GetTickCount() * 1000 + MathRand() ;

 currentBalanceBasis = AccountInfoDouble(ACCOUNT_BALANCE) ;
 if ( UseEquity )
 {
   currentBalanceBasis = AccountInfoDouble(ACCOUNT_EQUITY) ;
 }
 if ( ManualBalance>0.0 )
 {
   currentBalanceBasis = ManualBalance ;
 }
 // OnlyUp cai tien: doc lai muc so du cao nhat da luu trong GlobalVariable
 // cua terminal (ton tai xuyen suot restart EA/MT5), thay vi luon reset ve
 // so du hien tai moi lan khoi dong nhu truoc - tranh mat muc dinh cao da
 // dat duoc truoc do.
 // ResetHighestBalance: xoa ca dinh va moc quet rut tien, bat dau lai tu
 // balance/equity hien tai va khong tru lai cac lan rut tien cu.
 if ( ResetHighestBalance )
 {
   GlobalVariableDel(OnlyUpPeakGVName()) ;
   GlobalVariableDel(OnlyUpWithdrawGVName()) ;
 }
 bool legacyTemp_hadStoredPeak = (OnlyUp && GlobalVariableCheck(OnlyUpPeakGVName())) ;
 datetime legacyTemp_peakSavedTime = 0 ;
 if ( legacyTemp_hadStoredPeak )   legacyTemp_peakSavedTime = GlobalVariableTime(OnlyUpPeakGVName()) ;
 if ( legacyTemp_hadStoredPeak )
 {
   highestBalanceBasis = GlobalVariableGet(OnlyUpPeakGVName()) ;
 }
 else
 {
   highestBalanceBasis = currentBalanceBasis ;
 }
 if ( OnlyUp )
 {
   // Ban moi da co moc quet rieng. Khi nang cap tu ban cu, dung thoi diem dinh
   // da duoc luu lam moc dau de co the bu lai cac lan rut tien xay ra sau do.
   if ( GlobalVariableCheck(OnlyUpWithdrawGVName()) )
   {
     g_onlyUpWithdrawScannedMsc = (long)GlobalVariableGet(OnlyUpWithdrawGVName()) ;
   }
   else
   {
     if ( legacyTemp_hadStoredPeak && legacyTemp_peakSavedTime>0 )
       g_onlyUpWithdrawScannedMsc = (long)legacyTemp_peakSavedTime * 1000 ;
     else
       g_onlyUpWithdrawScannedMsc = (long)TimeCurrent() * 1000 ;
   }
   ReconcileOnlyUpWithdrawals() ;
   // Neu balance/equity hien tai da tao dinh moi (vi du sau loi nhuan hoac nap
   // tien), dinh moi van phai duoc uu tien sau khi da bu cac khoan rut.
   if ( currentBalanceBasis>highestBalanceBasis )   highestBalanceBasis = currentBalanceBasis ;
   GlobalVariableSet(OnlyUpPeakGVName(),highestBalanceBasis) ;
   GlobalVariableSet(OnlyUpWithdrawGVName(),(double)g_onlyUpWithdrawScannedMsc) ;
 }
 else
 {
   highestBalanceBasis = currentBalanceBasis ;
 }
 usDaylightSavingState = false ;
 europeDaylightSavingState = false ;
 nfpDatesGmt[0] = D'2026.12.04 12:30';
 nfpDatesGmt[1] = D'2026.11.06 12:30';
 nfpDatesGmt[2] = D'2026.10.02 12:30';
 nfpDatesGmt[3] = D'2026.09.04 12:30';
 nfpDatesGmt[4] = D'2026.08.07 12:30';
 nfpDatesGmt[5] = D'2026.07.02 12:30';
 nfpDatesGmt[6] = D'2026.06.05 12:30';
 nfpDatesGmt[7] = D'2026.05.08 12:30';
 nfpDatesGmt[8] = D'2026.04.03 12:30';
 nfpDatesGmt[9] = D'2026.03.06 12:30';
 nfpDatesGmt[10] = D'2026.02.11 12:30';
 nfpDatesGmt[11] = D'2026.01.09 12:30';
 nfpDatesGmt[12] = D'2025.12.16 12:30';
 nfpDatesGmt[13] = D'2025.11.07 12:30';
 nfpDatesGmt[14] = D'2025.10.03 12:30';
 nfpDatesGmt[15] = D'2025.09.05 12:30';
 nfpDatesGmt[16] = D'2025.08.01 12:30';
 nfpDatesGmt[17] = D'2025.07.03 12:30';
 nfpDatesGmt[18] = D'2025.06.06 12:30';
 nfpDatesGmt[19] = D'2025.05.02 12:30';
 nfpDatesGmt[20] = D'2025.04.04 12:30';
 nfpDatesGmt[21] = D'2025.03.07 12:30';
 nfpDatesGmt[22] = D'2025.02.07 12:30';
 nfpDatesGmt[23] = D'2025.01.10 12:30';
 nfpDatesGmt[24] = D'2024.12.06 12:30';
 nfpDatesGmt[25] = D'2024.11.01 12:30';
 nfpDatesGmt[26] = D'2024.10.04 12:30';
 nfpDatesGmt[27] = D'2024.09.06 12:30';
 nfpDatesGmt[28] = D'2024.08.02 12:30';
 nfpDatesGmt[29] = D'2024.07.05 12:30';
 nfpDatesGmt[30] = D'2024.06.07 12:30';
 nfpDatesGmt[31] = D'2024.05.03 12:30';
 nfpDatesGmt[32] = D'2024.04.05 12:30';
 nfpDatesGmt[33] = D'2024.03.08 12:30';
 nfpDatesGmt[34] = D'2024.02.02 12:30';
 nfpDatesGmt[35] = D'2024.01.05 12:30';
 nfpDatesGmt[36] = D'2023.12.08 12:30';
 nfpDatesGmt[37] = D'2023.11.03 12:30';
 nfpDatesGmt[38] = D'2023.10.06 12:30';
 nfpDatesGmt[39] = D'2023.09.01 12:30';
 nfpDatesGmt[40] = D'2023.08.04 12:30';
 nfpDatesGmt[41] = D'2023.07.07 12:30';
 nfpDatesGmt[42] = D'2023.06.02 12:30';
 nfpDatesGmt[43] = D'2023.05.05 12:30';
 nfpDatesGmt[44] = D'2023.04.07 12:30';
 nfpDatesGmt[45] = D'2023.03.10 12:30';
 nfpDatesGmt[46] = D'2023.02.03 12:30';
 nfpDatesGmt[47] = D'2023.01.06 12:30';
 nfpDatesGmt[48] = D'2022.12.02 12:30';
 nfpDatesGmt[49] = D'2022.11.04 12:30';
 nfpDatesGmt[50] = D'2022.10.07 12:30';
 nfpDatesGmt[51] = D'2022.09.02 12:30';
 nfpDatesGmt[52] = D'2022.08.05 12:30';
 nfpDatesGmt[53] = D'2022.07.08 12:30';
 nfpDatesGmt[54] = D'2022.06.03 12:30';
 nfpDatesGmt[55] = D'2022.05.06 12:30';
 nfpDatesGmt[56] = D'2022.04.01 12:30';
 nfpDatesGmt[57] = D'2022.03.04 12:30';
 nfpDatesGmt[58] = D'2022.02.04 12:30';
 nfpDatesGmt[59] = D'2022.01.07 12:30';
 nfpDatesGmt[60] = D'2021.12.03 12:30';
 nfpDatesGmt[61] = D'2021.11.05 12:30';
 nfpDatesGmt[62] = D'2021.10.08 12:30';
 nfpDatesGmt[63] = D'2021.09.03 12:30';
 nfpDatesGmt[64] = D'2021.08.06 12:30';
 nfpDatesGmt[65] = D'2021.07.02 12:30';
 nfpDatesGmt[66] = D'2021.06.04 12:30';
 nfpDatesGmt[67] = D'2021.05.07 12:30';
 nfpDatesGmt[68] = D'2021.04.02 12:30';
 nfpDatesGmt[69] = D'2021.03.05 12:30';
 nfpDatesGmt[70] = D'2021.02.05 12:30';
 nfpDatesGmt[71] = D'2021.01.08 12:30';
 nfpDatesGmt[72] = D'2020.12.04 12:30';
 nfpDatesGmt[73] = D'2020.11.06 12:30';
 nfpDatesGmt[74] = D'2020.10.02 12:30';
 nfpDatesGmt[75] = D'2020.09.04 12:30';
 nfpDatesGmt[76] = D'2020.08.07 12:30';
 nfpDatesGmt[77] = D'2020.07.02 12:30';
 nfpDatesGmt[78] = D'2020.06.05 12:30';
 nfpDatesGmt[79] = D'2020.05.08 12:30';
 nfpDatesGmt[80] = D'2020.04.03 12:30';
 nfpDatesGmt[81] = D'2020.03.06 12:30';
 nfpDatesGmt[82] = D'2020.02.07 12:30';
 nfpDatesGmt[83] = D'2020.01.10 12:30';
 nfpDatesGmt[84] = D'2019.12.06 12:30';
 nfpDatesGmt[85] = D'2019.11.01 12:30';
 nfpDatesGmt[86] = D'2019.10.04 12:30';
 nfpDatesGmt[87] = D'2019.09.06 12:30';
 nfpDatesGmt[88] = D'2019.08.02 12:30';
 nfpDatesGmt[89] = D'2019.07.05 12:30';
 nfpDatesGmt[90] = D'2019.06.07 12:30';
 nfpDatesGmt[91] = D'2019.05.03 12:30';
 nfpDatesGmt[92] = D'2019.04.05 12:30';
 nfpDatesGmt[93] = D'2019.03.08 12:30';
 nfpDatesGmt[94] = D'2019.02.01 12:30';
 nfpDatesGmt[95] = D'2019.01.04 12:30';
 nfpDatesGmt[96] = D'2018.12.07 12:30';
 nfpDatesGmt[97] = D'2018.11.02 12:30';
 nfpDatesGmt[98] = D'2018.10.05 12:30';
 nfpDatesGmt[99] = D'2018.09.07 12:30';
 nfpDatesGmt[100] = D'2018.08.03 12:30';
 nfpDatesGmt[101] = D'2018.07.06 12:30';
 nfpDatesGmt[102] = D'2018.06.01 12:30';
 nfpDatesGmt[103] = D'2018.05.04 12:30';
 nfpDatesGmt[104] = D'2018.04.06 12:30';
 nfpDatesGmt[105] = D'2018.03.09 12:30';
 nfpDatesGmt[106] = D'2018.02.02 12:30';
 nfpDatesGmt[107] = D'2018.01.05 12:30';
 nfpDatesGmt[108] = D'2017.12.08 12:30';
 nfpDatesGmt[109] = D'2017.11.03 12:30';
 nfpDatesGmt[110] = D'2017.10.06 12:30';
 nfpDatesGmt[111] = D'2017.09.01 12:30';
 nfpDatesGmt[112] = D'2017.08.04 12:30';
 nfpDatesGmt[113] = D'2017.07.07 12:30';
 nfpDatesGmt[114] = D'2017.06.02 12:30';
 nfpDatesGmt[115] = D'2017.05.05 12:30';
 nfpDatesGmt[116] = D'2017.04.07 12:30';
 nfpDatesGmt[117] = D'2017.03.10 12:30';
 nfpDatesGmt[118] = D'2017.02.03 12:30';
 nfpDatesGmt[119] = D'2017.01.06 12:30';
 nfpDatesGmt[120] = D'2016.12.02 12:30';
 nfpDatesGmt[121] = D'2016.11.04 12:30';
 nfpDatesGmt[122] = D'2016.10.07 12:30';
 nfpDatesGmt[123] = D'2016.09.02 12:30';
 nfpDatesGmt[124] = D'2016.08.05 12:30';
 nfpDatesGmt[125] = D'2016.07.08 12:30';
 nfpDatesGmt[126] = D'2016.06.03 12:30';
 nfpDatesGmt[127] = D'2016.05.06 12:30';
 nfpDatesGmt[128] = D'2016.04.01 12:30';
 nfpDatesGmt[129] = D'2016.03.04 12:30';
 nfpDatesGmt[130] = D'2016.02.05 12:30';
 nfpDatesGmt[131] = D'2016.01.08 12:30';
 nfpDatesGmt[132] = D'2015.12.04 12:30';
 nfpDatesGmt[133] = D'2015.11.06 12:30';
 nfpDatesGmt[134] = D'2015.10.02 12:30';
 nfpDatesGmt[135] = D'2015.09.04 12:30';
 nfpDatesGmt[136] = D'2015.08.07 12:30';
 nfpDatesGmt[137] = D'2015.07.02 12:30';
 nfpDatesGmt[138] = D'2015.06.05 12:30';
 nfpDatesGmt[139] = D'2015.05.08 12:30';
 nfpDatesGmt[140] = D'2015.04.03 12:30';
 nfpDatesGmt[141] = D'2015.03.06 12:30';
 nfpDatesGmt[142] = D'2015.02.06 12:30';
 nfpDatesGmt[143] = D'2015.01.09 12:30';
 nfpDatesGmt[144] = D'2014.12.05 12:30';
 nfpDatesGmt[145] = D'2014.11.07 12:30';
 nfpDatesGmt[146] = D'2014.10.03 12:30';
 nfpDatesGmt[147] = D'2014.09.05 12:30';
 nfpDatesGmt[148] = D'2014.08.01 12:30';
 nfpDatesGmt[149] = D'2014.07.03 12:30';
 nfpDatesGmt[150] = D'2014.06.06 12:30';
 nfpDatesGmt[151] = D'2014.05.02 12:30';
 nfpDatesGmt[152] = D'2014.04.04 12:30';
 nfpDatesGmt[153] = D'2014.03.07 12:30';
 nfpDatesGmt[154] = D'2014.02.07 12:30';
 nfpDatesGmt[155] = D'2014.01.10 12:30';
 nfpDatesGmt[156] = D'2013.12.06 12:30';
 nfpDatesGmt[157] = D'2013.11.08 12:30';
 nfpDatesGmt[158] = D'2013.10.22 12:30';
 nfpDatesGmt[159] = D'2013.09.06 12:30';
 nfpDatesGmt[160] = D'2013.08.02 12:30';
 nfpDatesGmt[161] = D'2013.07.05 12:30';
 nfpDatesGmt[162] = D'2013.06.07 12:30';
 nfpDatesGmt[163] = D'2013.05.03 12:30';
 nfpDatesGmt[164] = D'2013.04.05 12:30';
 nfpDatesGmt[165] = D'2013.03.08 12:30';
 nfpDatesGmt[166] = D'2013.02.01 12:30';
 nfpDatesGmt[167] = D'2013.01.04 12:30';
 nfpDatesGmt[168] = D'2012.12.07 12:30';
 nfpDatesGmt[169] = D'2012.11.02 12:30';
 nfpDatesGmt[170] = D'2012.10.05 12:30';
 nfpDatesGmt[171] = D'2012.09.07 12:30';
 nfpDatesGmt[172] = D'2012.08.03 12:30';
 nfpDatesGmt[173] = D'2012.07.06 12:30';
 nfpDatesGmt[174] = D'2012.06.01 12:30';
 nfpDatesGmt[175] = D'2012.05.04 12:30';
 nfpDatesGmt[176] = D'2012.04.06 12:30';
 nfpDatesGmt[177] = D'2012.03.09 12:30';
 nfpDatesGmt[178] = D'2012.02.03 12:30';
 nfpDatesGmt[179] = D'2012.01.06 12:30';
 nfpDatesGmt[180] = D'2011.12.02 12:30';
 nfpDatesGmt[181] = D'2011.11.04 12:30';
 nfpDatesGmt[182] = D'2011.10.07 12:30';
 nfpDatesGmt[183] = D'2011.09.02 12:30';
 nfpDatesGmt[184] = D'2011.08.05 12:30';
 nfpDatesGmt[185] = D'2011.07.08 12:30';
 nfpDatesGmt[186] = D'2011.06.03 12:30';
 nfpDatesGmt[187] = D'2011.05.06 12:30';
 nfpDatesGmt[188] = D'2011.04.01 12:30';
 nfpDatesGmt[189] = D'2011.03.04 12:30';
 nfpDatesGmt[190] = D'2011.02.04 12:30';
 nfpDatesGmt[191] = D'2011.01.07 12:30';
 nfpDatesGmt[192] = D'2010.12.03 12:30';
 nfpDatesGmt[193] = D'2010.11.05 12:30';
 nfpDatesGmt[194] = D'2010.10.08 12:30';
 nfpDatesGmt[195] = D'2010.09.03 12:30';
 nfpDatesGmt[196] = D'2010.08.06 12:30';
 nfpDatesGmt[197] = D'2010.07.02 12:30';
 nfpDatesGmt[198] = D'2010.06.04 12:30';
 nfpDatesGmt[199] = D'2010.05.07 12:30';
 nfpDatesGmt[200] = D'2010.04.02 12:30';
 nfpDatesGmt[201] = D'2010.03.05 12:30';
 nfpDatesGmt[202] = D'2010.02.05 12:30';
 nfpDatesGmt[203] = D'2010.01.08 12:30';
 nfpDatesGmt[204] = D'2009.12.04 12:30';
 nfpDatesGmt[205] = D'2009.11.06 12:30';
 nfpDatesGmt[206] = D'2009.10.02 12:30';
 nfpDatesGmt[207] = D'2009.09.04 12:30';
 nfpDatesGmt[208] = D'2009.08.07 12:30';
 nfpDatesGmt[209] = D'2009.07.02 12:30';
 nfpDatesGmt[210] = D'2009.06.05 12:30';
 nfpDatesGmt[211] = D'2009.05.08 12:30';
 nfpDatesGmt[212] = D'2009.04.03 12:30';
 nfpDatesGmt[213] = D'2009.03.06 12:30';
 nfpDatesGmt[214] = D'2009.02.06 12:30';
 nfpDatesGmt[215] = D'2009.01.09 12:30';
 nfpDatesGmt[216] = D'2008.12.05 12:30';
 nfpDatesGmt[217] = D'2008.11.07 12:30';
 nfpDatesGmt[218] = D'2008.10.03 12:30';
 nfpDatesGmt[219] = D'2008.09.05 12:30';
 nfpDatesGmt[220] = D'2008.08.01 12:30';
 nfpDatesGmt[221] = D'2008.07.03 12:30';
 nfpDatesGmt[222] = D'2008.06.06 12:30';
 nfpDatesGmt[223] = D'2008.05.02 12:30';
 nfpDatesGmt[224] = D'2008.04.04 12:30';
 nfpDatesGmt[225] = D'2008.03.07 12:30';
 nfpDatesGmt[226] = D'2008.02.01 12:30';
 nfpDatesGmt[227] = D'2008.01.04 12:30';
 nfpDatesGmt[228] = D'2007.12.07 12:30';
 nfpDatesGmt[229] = D'2007.11.02 12:30';
 nfpDatesGmt[230] = D'2007.10.05 12:30';
 nfpDatesGmt[231] = D'2007.09.07 12:30';
 nfpDatesGmt[232] = D'2007.08.03 12:30';
 nfpDatesGmt[233] = D'2007.07.06 12:30';
 nfpDatesGmt[234] = D'2007.06.01 12:30';
 nfpDatesGmt[235] = D'2007.05.04 12:30';
 nfpDatesGmt[236] = D'2007.04.06 12:30';
 nfpDatesGmt[237] = D'2007.03.09 12:30';
 nfpDatesGmt[238] = D'2007.02.02 12:30';
 nfpDatesGmt[239] = D'2007.01.05 12:30';
 // UseMQL5Calendar=true: CHI dung Lich MQL5 lam nguon ngay NFP - xoa sach
 // mang ngay co san vua gan o tren, de khi Lich chua tai duoc/khong co du
 // lieu thi KHONG roi ve mang cu (panel se hien "no news coming up" va bo
 // loc NFP khong co ngay nao cho den khi Lich tra du lieu). Rieng trong
 // Strategy Tester van giu mang co san bat ke cong tac, vi Lich MQL5 khong
 // hoat dong trong tester (gioi han cua nen tang) - giong hanh vi v4.3.
 if ( UseMQL5Calendar && MQLInfoInteger(MQL_TESTER) != 1 )
 {
   for (localInt04 = 0 ; localInt04 < 300 ; localInt04 ++)   nfpDatesGmt[localInt04] = 0 ;
 }
 if ( Risk == 1234 )
 {
   g_startLots_rw = MarketInfo(currentSymbol,MODE_MINLOT) ;
 }
 if ( TradeFrequency == 5 && Risk == 1234 )
 {
   localDouble02 = ConvertAccountCurrencyToUsdRounded(AccountInfoDouble(ACCOUNT_BALANCE)) ;
   localDouble03 = MaxAllowedDD / 100.0 * localDouble02 ;
   if ( localDouble03>autoFrequencyThreshold4 )
   {
     activeTradeFrequency = 3 ;
   }
   else
   {
     if ( localDouble03>autoFrequencyThreshold3 )
     {
       activeTradeFrequency = 2 ;
     }
     else
     {
       if ( localDouble03>autoFrequencyThreshold2 )
       {
         activeTradeFrequency = 1 ;
       }
       else
       {
         activeTradeFrequency = 0 ;
       }
     }
   }
 }
 else
 {
   activeTradeFrequency = TradeFrequency ;
 }
 if ( activeTradeFrequency == 0 )
 {
   legacyGlobalBool027 = false ;
   legacyGlobalBool031 = false ;
   legacyGlobalBool028 = false ;
   legacyGlobalBool033 = false ;
   legacyGlobalBool034 = false ;
   legacyGlobalBool032 = false ;
   legacyGlobalDouble398 = 2.4 ;
   if ( UseVariableValues )
   {
     legacyGlobalDouble398 = 3.0 ;
   }
 }
 else
 {
   if ( activeTradeFrequency == 1 )
   {
     legacyGlobalBool027 = true ;
     legacyGlobalBool031 = true ;
     legacyGlobalBool028 = false ;
     legacyGlobalBool033 = false ;
     legacyGlobalBool034 = false ;
     legacyGlobalBool032 = false ;
     legacyGlobalDouble398 = 3.4 ;
     if ( UseVariableValues )
     {
       legacyGlobalDouble398 = 4.0 ;
     }
   }
   else
   {
     if ( activeTradeFrequency == 2 )
     {
       legacyGlobalBool027 = true ;
       legacyGlobalBool031 = true ;
       legacyGlobalBool028 = true ;
       legacyGlobalBool033 = true ;
       legacyGlobalBool034 = false ;
       legacyGlobalBool032 = false ;
       legacyGlobalDouble398 = 4.1 ;
       if ( UseVariableValues )
       {
         legacyGlobalDouble398 = 5.0 ;
       }
     }
     else
     {
       if ( activeTradeFrequency == 3 )
       {
         legacyGlobalBool027 = true ;
         legacyGlobalBool031 = true ;
         legacyGlobalBool028 = true ;
         legacyGlobalBool033 = true ;
         legacyGlobalBool034 = true ;
         legacyGlobalBool032 = false ;
         legacyGlobalDouble398 = 4.8 ;
         if ( UseVariableValues )
         {
           legacyGlobalDouble398 = 5.6 ;
         }
       }
       else
       {
         if ( activeTradeFrequency == 4 )
         {
           legacyGlobalBool027 = true ;
           legacyGlobalBool031 = true ;
           legacyGlobalBool028 = true ;
           legacyGlobalBool033 = true ;
           legacyGlobalBool034 = true ;
           legacyGlobalBool032 = true ;
           legacyGlobalDouble398 = 5.1 ;
           if ( UseVariableValues )
           {
             legacyGlobalDouble398 = 6.0 ;
           }
         }
         else
         {
           if ( activeTradeFrequency == 6 )
           {
             legacyGlobalBool020 = RunStrat1 ;
             legacyGlobalBool023 = RunStrat2 ;
             legacyGlobalBool026 = RunStrat3 ;
             legacyGlobalBool027 = RunStrat4 ;
             legacyGlobalBool031 = RunStrat5 ;
             legacyGlobalBool028 = RunStrat6 ;
             legacyGlobalBool033 = RunStrat7 ;
             legacyGlobalBool034 = RunStrat8 ;
             legacyGlobalBool032 = RunStrat9 ;
           }
         }
       }
     }
   }
 }
 currentStrategyComment = ST1_Comment ;
