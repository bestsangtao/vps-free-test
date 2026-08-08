   ObjectSetString(0,"lineup" + IntegerToString(0,0,32),OBJPROP_TEXT,"Highest Balance: -");
   ObjectSetInteger(0,"lineup" + IntegerToString(0,0,32),OBJPROP_COLOR,panelTextColor);
   ObjectSetInteger(0,"lineup" + IntegerToString(0,0,32),OBJPROP_FONTSIZE,panelFontSize);
 }
 localInt18 = 0 ;
 localInt19 = 0 ;
 localInt20 = 0 ;
 localInt22 = localInt12 + localInt07 ;
 localInt23 = (int)(localInt13 + InfoPanelSizeAdjust * 176.0 + localInt08) ;
 localString21 = "Strategy" ;
 CreatePanelCell(localInt22,localInt23,0,"Strategy",0,0,1,0,1.0); 
 localInt18 = 1 ;
 localInt19 = 1 ;
 localString21 = "Closed PL" ;
 if ( legacyGlobalInt152 == 1 )
 {
   localString21 = "Closed PL*" ;
 }
 CreatePanelCell(localInt22,localInt23,localInt18,localString21,localInt20,localInt19,1,0,1.0); 
 localInt18 ++;
 localInt19 ++;
 localString21 = "PL per trade" ;
 if ( legacyGlobalInt152 == 2 )
 {
   localString21 = "PL per trade*" ;
 }
 CreatePanelCell(localInt22,localInt23,localInt18,localString21,localInt20,localInt19,1,0,1.0); 
 localInt18 ++;
 localInt19 ++;
 localString21 = "Lotsize" ;
 CreatePanelCell(localInt22,localInt23,localInt18,"Lotsize",localInt20,localInt19,1,0,1.0); 
 localInt18 ++;
 localInt19 = 0 ;
 localInt20 ++;
 panelStrategyRowStartIndex = localInt18 ;
 for (localInt24 = 0 ; localInt24 < 9 ; localInt24 ++)
 {
   localString21="Strategy " + IntegerToString(localInt24 + 1,0,32);
   CreatePanelCell(localInt22,localInt23,localInt18,localString21,localInt20,localInt19,1,0,1.0); 
   localInt18 ++;
   localInt19 ++;
   localString21 = DoubleToString(NormalizeDouble(strategyDisplayProfit[localInt24],2),2) ;
   CreatePanelCell(localInt22,localInt23,localInt18,localString21,localInt20,localInt19,1,0,1.0); 
   localInt18 ++;
   localInt19 ++;
   localString21 = DoubleToString(NormalizeDouble(averageProfitByStrategy[localInt24],2),2) ;
   CreatePanelCell(localInt22,localInt23,localInt18,localString21,localInt20,localInt19,1,0,1.0); 
   localInt18 ++;
   localInt19 ++;
   localString21 = DoubleToString(NormalizeDouble(lotSizeByStrategy[localInt24],2),2) ;
   CreatePanelCell(localInt22,localInt23,localInt18,localString21,localInt20,localInt19,1,0,1.0); 
   localInt18 ++;
   localInt19 = 0 ;
   localInt20 ++;
 }
 }
//lizong_24 <<==--------   --------
 void CreatePanelCell( int argInt00,int argInt01,int argInt02,string argString03,int argInt04,int argInt05,int argInt06,uint argUint07,double argDouble08)
 {
 ObjectCreate(0,"info_ea" + IntegerToString(argInt02,0,32),OBJ_EDIT,0,0,0.0); 
 ObjectSetInteger(0,"info_ea" + IntegerToString(argInt02,0,32),OBJPROP_XDISTANCE,(long)(argInt00 + argInt05 * legacyGlobalDouble361)); 
 ObjectSetInteger(0,"info_ea" + IntegerToString(argInt02,0,32),OBJPROP_YDISTANCE,(long)(argInt01 + argInt04 * panelRowHeight)); 
 ObjectSetString(0,"info_ea" + IntegerToString(argInt02,0,32),OBJPROP_TEXT,argString03); 
 ObjectSetInteger(0,"info_ea" + IntegerToString(argInt02,0,32),OBJPROP_BACK,0); 
 ObjectSetInteger(0,"info_ea" + IntegerToString(argInt02,0,32),OBJPROP_COLOR,argUint07); 
 ObjectSetInteger(0,"info_ea" + IntegerToString(argInt02,0,32),OBJPROP_BGCOLOR,legacyGlobalUint364); 
 ObjectSetInteger(0,"info_ea" + IntegerToString(argInt02,0,32),OBJPROP_BORDER_COLOR,0); 
 ObjectSetInteger(0,"info_ea" + IntegerToString(argInt02,0,32),OBJPROP_FONTSIZE,(long)(panelFontSize * argDouble08)); 
 ObjectSetInteger(0,"info_ea" + IntegerToString(argInt02,0,32),OBJPROP_READONLY,0x1); 
 ObjectSetInteger(0,"info_ea" + IntegerToString(argInt02,0,32),OBJPROP_YSIZE,(long)panelRowHeight); 
 ObjectSetInteger(0,"info_ea" + IntegerToString(argInt02,0,32),OBJPROP_XSIZE,(long)legacyGlobalDouble361); 
 ObjectSetInteger(0,"info_ea" + IntegerToString(argInt02,0,32),OBJPROP_YSIZE,(long)panelRowHeight); 
 if ( argInt06 == 0 )
 {
   ObjectSetInteger(0,"info_ea" + IntegerToString(argInt02,0,32),OBJPROP_ALIGN,0x1); 
 }
 if ( argInt06 == 1 )
 {
   ObjectSetInteger(0,"info_ea" + IntegerToString(argInt02,0,32),OBJPROP_ALIGN,0x2); 
 }
 if ( argInt06 != 2 )   return;
 ObjectSetInteger(0,"info_ea" + IntegerToString(argInt02,0,32),OBJPROP_ALIGN,0); 
 }
//lizong_25 <<==--------   --------
 void DeleteInfoPanel()
 {
  int       localInt01;
  int       localInt02;
  int       localInt03;
  int       localInt04;
//----- -----

 ObjectDelete(0,"line1"); 
 ObjectDelete(0,"linec"); 
 ObjectDelete(0,"line2"); 
 ObjectDelete(0,"lines"); 
 ObjectDelete(0,"linet"); 
 ObjectDelete(0,"lineTradeStart"); 
 for (localInt01 = 0 ; localInt01 <= 99 ; localInt01 ++)
 {
   ObjectDelete(0,"lineopl" + IntegerToString(localInt01,0,32)); 
   ObjectDelete(0,"linea" + IntegerToString(localInt01,0,32)); 
   ObjectDelete(0,"lineto" + IntegerToString(localInt01,0,32)); 
   ObjectDelete(0,"linetp" + IntegerToString(localInt01,0,32));
   ObjectDelete(0,"linetq" + IntegerToString(localInt01,0,32));
   ObjectDelete(0,"linenfp" + IntegerToString(localInt01,0,32));
   ObjectDelete(0,"lineup" + IntegerToString(localInt01,0,32));
   for (localInt02 = 0 ; localInt02 < 10 ; localInt02 ++)
   {
     ObjectDelete(0,"tabel_info" + IntegerToString(localInt01 * 100 + localInt02,0,32)); 
   }
 }
 ObjectDelete(0,"infopanel_rectangle"); 
 for (localInt03 = 0 ; localInt03 < 10 ; localInt03 ++)
 {
   ObjectDelete(0,"tabel_heading" + IntegerToString(localInt03,0,32)); 
   ObjectDelete(0,"tabel_totals" + IntegerToString(localInt03,0,32)); 
 }
 for (localInt04 = 0 ; localInt04 < legacyGlobalInt360 ; localInt04 ++)
 {
   ObjectDelete(0,"horizontalrect" + IntegerToString(localInt04,0,32)); 
   ObjectDelete(0,"info_ea" + IntegerToString(localInt04,0,32)); 
 }
 }
//lizong_26 <<==--------   --------
 string OnlyUpPeakGVName()
 {
 // Tach biet hoan toan dinh giua cac "phien": trong Strategy Tester, moi lan
 // chay (launch) mang mot g_onlyUpRunId rieng (sinh moi lan OnInit) nen khong
 // bao gio doc phai dinh con sot tu lan backtest truoc - moi lan backtest doc
 // lap 100% nhung van cap nhat/luu dinh binh thuong trong suot lan chay do.
 // Ngoai Tester (live/demo that), tach theo so tai khoan (ACCOUNT_LOGIN) de
 // tai khoan live va demo khac nhau khong dung chung 1 dinh.
 if ( MQLInfoInteger(MQL_TESTER) == 1 )
 {
   return("GR_OnlyUpPeak_TESTER_" + Symbol() + "_" + IntegerToString(ST1_MagicNumber) + "_" + IntegerToString(g_onlyUpRunId));
 }
 return("GR_OnlyUpPeak_" + Symbol() + "_" + IntegerToString(ST1_MagicNumber) + "_" + IntegerToString(AccountInfoInteger(ACCOUNT_LOGIN)));
 }
//OnlyUpPeakGVName <<==--------   --------
 string OnlyUpWithdrawGVName()
 {
 // Ten ngan hon gioi han 63 ky tu cua Global Variable, nhung van tach theo
 // phien tester / symbol / magic / tai khoan giong dinh OnlyUp.
 if ( MQLInfoInteger(MQL_TESTER) == 1 )
 {
   return("GR_OUWD_T_" + Symbol() + "_" + IntegerToString(ST1_MagicNumber) + "_" + IntegerToString(g_onlyUpRunId));
 }
 return("GR_OUWD_" + Symbol() + "_" + IntegerToString(ST1_MagicNumber) + "_" + IntegerToString(AccountInfoInteger(ACCOUNT_LOGIN)));
 }
//OnlyUpWithdrawGVName <<==--------   --------
 string GetNextNFPText()
 {
  datetime  legacyTemp_da_best = 0;
  int       legacyTemp_in_i;
//----- -----
 // Theo trang thai lay tin (g_nfpStatus): 2 = Lich MQL5 khong doc duoc -> bao
 // loi lay tin. mq5 dung Lich (khong co link) nen khong co trang thai thieu
 // link. Binh thuong (0): co NFP -> "Next NFP: ..."; khong co -> "No News".
 if ( g_nfpStatus == 2 )   return("NFP: news fetch error");
 for (legacyTemp_in_i = 0 ; legacyTemp_in_i < 300 ; legacyTemp_in_i ++)
 {
   if ( nfpDatesGmt[legacyTemp_in_i] <= 0 )   continue;
   if ( nfpDatesGmt[legacyTemp_in_i] >= legacyGlobalDatetime390 )
   {
     if ( legacyTemp_da_best == 0 || nfpDatesGmt[legacyTemp_in_i] < legacyTemp_da_best )   legacyTemp_da_best = nfpDatesGmt[legacyTemp_in_i];
   }
 }
 if ( legacyTemp_da_best == 0 )   return("No News Coming Up"); // chua co/chua lay duoc lich -> giong panel v4.3
 return("Next NFP: " + TimeToString(legacyTemp_da_best + legacyGlobalInt395 * 3600,TIME_DATE|TIME_SECONDS));
 }
//GetNextNFPText <<==--------   --------
 void UpdateInfoPanelSummary()
 {
  string    localString01;
//----- -----
 double     tmpDouble01;
 double     tmpDouble02;
 int        tmpInt03;
 int        tmpInt04;
 int        tmpInt05;
 int        tmpInt06;
 int        tmpInt07;
 int        tmpInt08;
 int        tmpInt09;
 int        tmpInt10;
 int        tmpInt11;
 int        tmpInt12;
 int        tmpInt13;
 int        tmpInt14;
 int        tmpInt15;
 int        tmpInt16;
 int        tmpInt17;
 int        tmpInt18;
 int        tmpInt19;

 if ( !(ShowInfoPanel) )   return;
 
 if ( ( MQLInfoInteger(MQL_TESTER) == 1 && !(UpdateInfoTesting) ) )   return;
 
 if ( MQLInfoInteger(MQL_TESTER) == 1 && !(UpdateInfoTesting) )
 {
   tmpDouble01 = 0.0;
 }
 else
 {
   tmpDouble02 = 0.0;
   for (tmpInt03 = MT4OrdersTotal() ; tmpInt03 >= 0 ; tmpInt03=tmpInt03 - 1)
   {
     if ( OrderSelect(tmpInt03,0,0) != true )   continue;
     
     if ( ( OrderSymbol() != currentSymbol && !(oneChartSetupEnabled) ) )   continue;
     tmpInt04 = OrderMagicNumber();
     tmpInt05=ST1_MagicNumber + 1;
     if ( tmpInt04 != tmpInt05 )
     {
       tmpInt05 = OrderMagicNumber();
       tmpInt06=ST1_MagicNumber + 2;
       if ( tmpInt05 != tmpInt06 )
       {
         tmpInt06 = OrderMagicNumber();
         tmpInt07=ST1_MagicNumber + 3;
         if ( tmpInt06 != tmpInt07 )
         {
           tmpInt07 = OrderMagicNumber();
           tmpInt08=ST1_MagicNumber + 4;
           if ( tmpInt07 != tmpInt08 )
           {
             tmpInt08 = OrderMagicNumber();
             tmpInt09=ST1_MagicNumber + 5;
             if ( tmpInt08 != tmpInt09 )
             {
               tmpInt09 = OrderMagicNumber();
               tmpInt10=ST1_MagicNumber + 6;
               if ( tmpInt09 != tmpInt10 )
               {
                 tmpInt10 = OrderMagicNumber();
                 tmpInt11=ST1_MagicNumber + 7;
                 if ( tmpInt10 != tmpInt11 )
                 {
                   tmpInt11 = OrderMagicNumber();
                   tmpInt12=ST1_MagicNumber + 8;
                   if ( tmpInt11 != tmpInt12 )
                   {
                     tmpInt12 = OrderMagicNumber();
                     tmpInt13=ST1_MagicNumber + 9;
                     if ( tmpInt12 != tmpInt13 )
                     {
                       tmpInt13 = OrderMagicNumber();
                       tmpInt14=ST1_MagicNumber + 10;
                       if ( tmpInt13 != tmpInt14 )
                       {
                         tmpInt14 = OrderMagicNumber();
                         tmpInt15=ST1_MagicNumber + 11;
                         if ( tmpInt14 != tmpInt15 )
                         {
                           tmpInt15 = OrderMagicNumber();
                           tmpInt16=ST1_MagicNumber + 12;
                           if ( tmpInt15 != tmpInt16 )
                           {
                             tmpInt16 = OrderMagicNumber();
                             tmpInt17=ST1_MagicNumber + 13;
                             if ( tmpInt16 != tmpInt17 )
                             {
                               tmpInt17 = OrderMagicNumber();
                               tmpInt18=ST1_MagicNumber + 14;
                               if ( tmpInt17 != tmpInt18 )
                               {
                                 tmpInt18 = OrderMagicNumber();
                                 tmpInt19=ST1_MagicNumber + 15;
                               if ( tmpInt18 != tmpInt19 )   continue;
                               }
                             }
                           }
                         }
                       }
                     }
                   }
                 }
               }
             }
           }
         }
       }
     }
     if ( ( OrderType() != 0 && OrderType() != 1 ) )   continue;
     tmpDouble02 = OrderProfit() + OrderSwap() + OrderCommission() + tmpDouble02;
     
   }
   legacyGlobalDouble323Array30[currentStrategyIndex] = tmpDouble02;
   tmpDouble01 = tmpDouble02;
 }
 ObjectSetString(0,"lineopl" + IntegerToString(0,0,32),OBJPROP_TEXT,"Open P/L: " + DoubleToString(tmpDouble01,2)); 
 ObjectSetString(0,"linea" + IntegerToString(0,0,32),OBJPROP_TEXT,"Account Balance: " + DoubleToString(AccountBalance(),2)); 
 if ( activeTradeFrequency == 1 )
 {
   localString01 = "conservative" ;
 }
 else
 {
   if ( activeTradeFrequency == 2 )
   {
     localString01 = "moderate" ;
   }
   else
   {
     if ( activeTradeFrequency == 3 )
     {
       localString01 = "intense" ;
     }
     else
     {
       if ( activeTradeFrequency == 4 )
       {
         localString01 = "extreme" ;
       }
       else
       {
         if ( activeTradeFrequency == 0 )
         {
           localString01 = "extreme conservative" ;
         }
         else
         {
           localString01 = "manual strategy selection" ;
         }
       }
     }
   }
 }
 ObjectSetString(0,"lines",OBJPROP_TEXT,"Trade Frequency: " + localString01); 
 if ( Risk == 1234 )
 {
   ObjectSetString(0,"linet",OBJPROP_TEXT,"Max allowed DD: " + string(MaxAllowedDD) + "%"); 
 }
 else
 {
   if ( Risk == 3 )
   {
     ObjectSetString(0,"linet",OBJPROP_TEXT,"Max risk per strategy: " + string(MaxRiskPerStrategy_) + "%"); 
   }
   else
   {
     ObjectSetString(0,"linet",OBJPROP_TEXT,"Manual lotsize: " + string(g_startLots_rw) + "lots"); 
   }
 }
 }
//lizong_27 <<==--------   --------
 void UpdateInfoPanelStrategyRows()
 {
  int       localInt01;
  string    localString02;
  int       localInt03;
//----- -----

 if ( !(ShowInfoPanel) )   return;
 
 if ( ( MQLInfoInteger(MQL_TESTER) == 1 && !(UpdateInfoTesting) ) )   return;
 localInt01 = panelStrategyRowStartIndex ;
 for (localInt03 = 0 ; localInt03 < 9 ; localInt03 ++)
 {
   localString02="Strategy " + IntegerToString(localInt03 + 1,0,32);
   ObjectSetString(0,"info_ea" + IntegerToString(localInt01,0,32),OBJPROP_TEXT,localString02); 
   localInt01 ++;
   localString02 = DoubleToString(NormalizeDouble(strategyDisplayProfit[localInt03],2),2) ;
   ObjectSetString(0,"info_ea" + IntegerToString(localInt01,0,32),OBJPROP_TEXT,localString02); 
   localInt01 ++;
   localString02 = DoubleToString(NormalizeDouble(averageProfitByStrategy[localInt03],2),2) ;
   ObjectSetString(0,"info_ea" + IntegerToString(localInt01,0,32),OBJPROP_TEXT,localString02); 
   localInt01 ++;
   localString02 = DoubleToString(NormalizeDouble(lotSizeByStrategy[localInt03],2),2) ;
   ObjectSetString(0,"info_ea" + IntegerToString(localInt01,0,32),OBJPROP_TEXT,localString02); 
   localInt01 ++;
 }
 }
//lizong_28 <<==--------   --------
 void UpdateInfoPanelTotals()
 {
 double     tmpDouble01;
 double     tmpDouble02;
 int        tmpInt03;
 int        tmpInt04;
 int        tmpInt05;
 int        tmpInt06;
 int        tmpInt07;
 int        tmpInt08;
 int        tmpInt09;
 int        tmpInt10;
 int        tmpInt11;
 int        tmpInt12;
 int        tmpInt13;
 int        tmpInt14;
 int        tmpInt15;
 int        tmpInt16;
 int        tmpInt17;
 int        tmpInt18;
 int        tmpInt19;
 int        tmpInt20;

 if ( !(ShowInfoPanel) )   return;
 
 if ( ( MQLInfoInteger(MQL_TESTER) == 1 && !(UpdateInfoTesting) ) )   return;
 ObjectSetString(0,"lineto" + IntegerToString(0,0,32),OBJPROP_TEXT,"Total profits/losses so far: " + IntegerToString(CountWinningClosedTrades(0,9999999),0,32) + "/" + IntegerToString(CountLosingClosedTrades(0,9999999),0,32)); 
 if ( MQLInfoInteger(MQL_TESTER) == 1 && !(UpdateInfoTesting) )
 {
   tmpDouble01 = 0.0;
 }
 else
 {
   tmpDouble02 = 0.0;
   tmpInt03 = 0;
   for (tmpInt04 = HistoryTotal() ; tmpInt04 >= 0 ; tmpInt04=tmpInt04 - 1)
   {
     if ( OrderSelect(tmpInt04,0,1) != true )   continue;
     
     if ( ( OrderSymbol() != currentSymbol && !(oneChartSetupEnabled) ) )   continue;
     tmpInt05 = OrderMagicNumber();
     tmpInt06=ST1_MagicNumber + 1;
     if ( tmpInt05 != tmpInt06 )
     {
       tmpInt06 = OrderMagicNumber();
       tmpInt07=ST1_MagicNumber + 2;
       if ( tmpInt06 != tmpInt07 )
       {
         tmpInt07 = OrderMagicNumber();
         tmpInt08=ST1_MagicNumber + 3;
         if ( tmpInt07 != tmpInt08 )
         {
           tmpInt08 = OrderMagicNumber();
           tmpInt09=ST1_MagicNumber + 4;
           if ( tmpInt08 != tmpInt09 )
           {
             tmpInt09 = OrderMagicNumber();
             tmpInt10=ST1_MagicNumber + 5;
             if ( tmpInt09 != tmpInt10 )
             {
               tmpInt10 = OrderMagicNumber();
               tmpInt11=ST1_MagicNumber + 6;
               if ( tmpInt10 != tmpInt11 )
               {
                 tmpInt11 = OrderMagicNumber();
                 tmpInt12=ST1_MagicNumber + 7;
                 if ( tmpInt11 != tmpInt12 )
                 {
                   tmpInt12 = OrderMagicNumber();
                   tmpInt13=ST1_MagicNumber + 8;
                   if ( tmpInt12 != tmpInt13 )
                   {
                     tmpInt13 = OrderMagicNumber();
                     tmpInt14=ST1_MagicNumber + 9;
                     if ( tmpInt13 != tmpInt14 )
                     {
                       tmpInt14 = OrderMagicNumber();
                       tmpInt15=ST1_MagicNumber + 10;
                       if ( tmpInt14 != tmpInt15 )
                       {
                         tmpInt15 = OrderMagicNumber();
                         tmpInt16=ST1_MagicNumber + 11;
                         if ( tmpInt15 != tmpInt16 )
                         {
                           tmpInt16 = OrderMagicNumber();
                           tmpInt17=ST1_MagicNumber + 12;
                           if ( tmpInt16 != tmpInt17 )
                           {
                             tmpInt17 = OrderMagicNumber();
                             tmpInt18=ST1_MagicNumber + 13;
                             if ( tmpInt17 != tmpInt18 )
                             {
                               tmpInt18 = OrderMagicNumber();
                               tmpInt19=ST1_MagicNumber + 14;
                               if ( tmpInt18 != tmpInt19 )
                               {
