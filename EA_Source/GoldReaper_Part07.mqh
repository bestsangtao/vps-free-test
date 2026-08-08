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
 if ( iBars(currentSymbol,MT4Period(PERIOD_D1)) != legacyGlobalInt383 )
 {
   legacyGlobalInt383 = iBars(currentSymbol,MT4Period(PERIOD_D1)) ;
   dailyDrawdownLockActive = false ;
   legacyGlobalDouble384 = 0.0 ;
 }
 if ( PropFirmMaxDailyDD>0.0 )
 {
   EnforcePropFirmDailyDrawdown(); 
 }
 if ( dailyDrawdownLockActive || !(legacyGlobalBool380) )   return;
 localBool04 = false ;
 if ( lastPerformanceRefreshH1BarTime != iTime(currentSymbol,MT4Period(PERIOD_H1),1) )
 {
   localBool04 = true ;
   lastPerformanceRefreshH1BarTime = iTime(currentSymbol,MT4Period(PERIOD_H1),1) ;
 }
 if ( ( StringFind(Symbol(),"XAUUSD",0) >= 0 || StringFind(Symbol(),"xauusd",0) >= 0 || StringFind(Symbol(),"GOLD",0) >= 0 || StringFind(Symbol(),"GLD",0) >= 0 || StringFind(Symbol(),"gold",0) >= 0 || StringFind(Symbol(),"Gold",0) >= 0 ) )
 {
   currentSymbol = Symbol() ;
   if ( legacyGlobalBool020 )
   {
     LoadStrategy1Profile(); 
     LoadStrategyRuntimeContext(0); 
     RunStrategyCycle(0); 
     if ( localBool04 )
     {
       if ( MQLInfoInteger(MQL_TESTER) == 1 && !(UpdateInfoTesting) )
       {
         tmpDouble02 = 0.0;
       }
       else
       {
         tmpDouble03 = 0.0;
         totalTradeCountByStrategy[currentStrategyIndex] = 0;
         for (tmpInt04 = HistoryTotal() ; tmpInt04 >= 0 ; tmpInt04=tmpInt04 - 1)
         {
           if ( OrderSelect(tmpInt04,0,1) != true || OrderSymbol() != currentSymbol || OrderMagicNumber() != strategyMagicNumber )   continue;
           
           if ( ( OrderType() != 0 && OrderType() != 1 ) )   continue;
           totalTradeCountByStrategy[currentStrategyIndex] ++;
           tmpDouble03 = tmpDouble03 + OrderProfit() + OrderSwap() + OrderCommission();
           
         }
         tmpDouble02 = tmpDouble03;
       }
       strategyDisplayProfit[0] = tmpDouble02;
       if ( strategyDisplayProfit[0]!=0.0 && totalTradeCountByStrategy[0] >  0 )
       {
         averageProfitByStrategy[0] = strategyDisplayProfit[0] / totalTradeCountByStrategy[0];
       }
     }
   }
   if ( legacyGlobalBool027 )
   {
     LoadStrategy2Profile(); 
     LoadStrategyRuntimeContext(3); 
     RunStrategyCycle(3); 
     if ( localBool04 )
     {
       if ( MQLInfoInteger(MQL_TESTER) == 1 && !(UpdateInfoTesting) )
       {
         tmpDouble05 = 0.0;
       }
       else
       {
         tmpDouble06 = 0.0;
         totalTradeCountByStrategy[currentStrategyIndex] = 0;
         for (tmpInt07 = HistoryTotal() ; tmpInt07 >= 0 ; tmpInt07=tmpInt07 - 1)
         {
           if ( OrderSelect(tmpInt07,0,1) != true || OrderSymbol() != currentSymbol || OrderMagicNumber() != strategyMagicNumber )   continue;
           
           if ( ( OrderType() != 0 && OrderType() != 1 ) )   continue;
           totalTradeCountByStrategy[currentStrategyIndex] ++;
           tmpDouble06 = tmpDouble06 + OrderProfit() + OrderSwap() + OrderCommission();
           
         }
         tmpDouble05 = tmpDouble06;
       }
       strategyDisplayProfit[3] = tmpDouble05;
       if ( strategyDisplayProfit[3]!=0.0 && totalTradeCountByStrategy[3] >  0 )
       {
         averageProfitByStrategy[3] = strategyDisplayProfit[3] / totalTradeCountByStrategy[3];
       }
     }
   }
   if ( legacyGlobalBool023 )
   {
     LoadStrategy3Profile(); 
     LoadStrategyRuntimeContext(1); 
     RunStrategyCycle(1); 
     if ( localBool04 )
     {
       if ( MQLInfoInteger(MQL_TESTER) == 1 && !(UpdateInfoTesting) )
       {
         tmpDouble08 = 0.0;
       }
       else
       {
         tmpDouble09 = 0.0;
         totalTradeCountByStrategy[currentStrategyIndex] = 0;
         for (tmpInt10 = HistoryTotal() ; tmpInt10 >= 0 ; tmpInt10=tmpInt10 - 1)
         {
           if ( OrderSelect(tmpInt10,0,1) != true || OrderSymbol() != currentSymbol || OrderMagicNumber() != strategyMagicNumber )   continue;
           
           if ( ( OrderType() != 0 && OrderType() != 1 ) )   continue;
           totalTradeCountByStrategy[currentStrategyIndex] ++;
           tmpDouble09 = tmpDouble09 + OrderProfit() + OrderSwap() + OrderCommission();
           
         }
         tmpDouble08 = tmpDouble09;
       }
       strategyDisplayProfit[1] = tmpDouble08;
       if ( strategyDisplayProfit[1]!=0.0 && totalTradeCountByStrategy[1] >  0 )
       {
         averageProfitByStrategy[1] = strategyDisplayProfit[1] / totalTradeCountByStrategy[1];
       }
     }
   }
   if ( legacyGlobalBool026 )
   {
     LoadStrategy4Profile(); 
     LoadStrategyRuntimeContext(2); 
     RunStrategyCycle(2); 
     if ( localBool04 )
     {
       if ( MQLInfoInteger(MQL_TESTER) == 1 && !(UpdateInfoTesting) )
       {
         tmpDouble11 = 0.0;
       }
       else
       {
         tmpDouble12 = 0.0;
         totalTradeCountByStrategy[currentStrategyIndex] = 0;
         for (tmpInt13 = HistoryTotal() ; tmpInt13 >= 0 ; tmpInt13=tmpInt13 - 1)
         {
           if ( OrderSelect(tmpInt13,0,1) != true || OrderSymbol() != currentSymbol || OrderMagicNumber() != strategyMagicNumber )   continue;
           
           if ( ( OrderType() != 0 && OrderType() != 1 ) )   continue;
           totalTradeCountByStrategy[currentStrategyIndex] ++;
           tmpDouble12 = tmpDouble12 + OrderProfit() + OrderSwap() + OrderCommission();
           
         }
         tmpDouble11 = tmpDouble12;
       }
       strategyDisplayProfit[2] = tmpDouble11;
       if ( strategyDisplayProfit[2]!=0.0 && totalTradeCountByStrategy[2] >  0 )
       {
         averageProfitByStrategy[2] = strategyDisplayProfit[2] / totalTradeCountByStrategy[2];
       }
     }
   }
   if ( legacyGlobalBool028 )
   {
     LoadStrategy5Profile(); 
     LoadStrategyRuntimeContext(5); 
     RunStrategyCycle(5); 
     if ( localBool04 )
     {
       if ( MQLInfoInteger(MQL_TESTER) == 1 && !(UpdateInfoTesting) )
       {
         tmpDouble14 = 0.0;
       }
       else
       {
         tmpDouble15 = 0.0;
         totalTradeCountByStrategy[currentStrategyIndex] = 0;
         for (tmpInt16 = HistoryTotal() ; tmpInt16 >= 0 ; tmpInt16=tmpInt16 - 1)
         {
           if ( OrderSelect(tmpInt16,0,1) != true || OrderSymbol() != currentSymbol || OrderMagicNumber() != strategyMagicNumber )   continue;
           
           if ( ( OrderType() != 0 && OrderType() != 1 ) )   continue;
           totalTradeCountByStrategy[currentStrategyIndex] ++;
           tmpDouble15 = tmpDouble15 + OrderProfit() + OrderSwap() + OrderCommission();
           
         }
         tmpDouble14 = tmpDouble15;
       }
       strategyDisplayProfit[5] = tmpDouble14;
       if ( strategyDisplayProfit[5]!=0.0 && totalTradeCountByStrategy[5] >  0 )
       {
         averageProfitByStrategy[5] = strategyDisplayProfit[5] / totalTradeCountByStrategy[5];
       }
     }
   }
   if ( legacyGlobalBool031 )
   {
     LoadStrategy6Profile(); 
     LoadStrategyRuntimeContext(4); 
     RunStrategyCycle(4); 
     if ( localBool04 )
     {
       if ( MQLInfoInteger(MQL_TESTER) == 1 && !(UpdateInfoTesting) )
       {
         tmpDouble17 = 0.0;
       }
       else
       {
         tmpDouble18 = 0.0;
         totalTradeCountByStrategy[currentStrategyIndex] = 0;
         for (tmpInt19 = HistoryTotal() ; tmpInt19 >= 0 ; tmpInt19=tmpInt19 - 1)
         {
           if ( OrderSelect(tmpInt19,0,1) != true || OrderSymbol() != currentSymbol || OrderMagicNumber() != strategyMagicNumber )   continue;
           
           if ( ( OrderType() != 0 && OrderType() != 1 ) )   continue;
           totalTradeCountByStrategy[currentStrategyIndex] ++;
           tmpDouble18 = tmpDouble18 + OrderProfit() + OrderSwap() + OrderCommission();
           
         }
         tmpDouble17 = tmpDouble18;
       }
       strategyDisplayProfit[4] = tmpDouble17;
       if ( strategyDisplayProfit[4]!=0.0 && totalTradeCountByStrategy[4] >  0 )
       {
         averageProfitByStrategy[4] = strategyDisplayProfit[4] / totalTradeCountByStrategy[4];
       }
     }
   }
   if ( legacyGlobalBool032 )
   {
     LoadStrategy7Profile(); 
     LoadStrategyRuntimeContext(8); 
     RunStrategyCycle(8); 
     if ( localBool04 )
     {
       if ( MQLInfoInteger(MQL_TESTER) == 1 && !(UpdateInfoTesting) )
       {
         tmpDouble20 = 0.0;
       }
       else
       {
         tmpDouble21 = 0.0;
         totalTradeCountByStrategy[currentStrategyIndex] = 0;
         for (tmpInt22 = HistoryTotal() ; tmpInt22 >= 0 ; tmpInt22=tmpInt22 - 1)
         {
           if ( OrderSelect(tmpInt22,0,1) != true || OrderSymbol() != currentSymbol || OrderMagicNumber() != strategyMagicNumber )   continue;
           
           if ( ( OrderType() != 0 && OrderType() != 1 ) )   continue;
           totalTradeCountByStrategy[currentStrategyIndex] ++;
           tmpDouble21 = tmpDouble21 + OrderProfit() + OrderSwap() + OrderCommission();
           
         }
         tmpDouble20 = tmpDouble21;
       }
       strategyDisplayProfit[8] = tmpDouble20;
       if ( strategyDisplayProfit[8]!=0.0 && totalTradeCountByStrategy[8] >  0 )
       {
         averageProfitByStrategy[8] = strategyDisplayProfit[8] / totalTradeCountByStrategy[8];
       }
     }
   }
   if ( legacyGlobalBool033 )
   {
     LoadStrategy8Profile(); 
     LoadStrategyRuntimeContext(6); 
     RunStrategyCycle(6); 
     if ( localBool04 )
     {
       if ( MQLInfoInteger(MQL_TESTER) == 1 && !(UpdateInfoTesting) )
       {
         tmpDouble23 = 0.0;
       }
       else
       {
         tmpDouble24 = 0.0;
         totalTradeCountByStrategy[currentStrategyIndex] = 0;
         for (tmpInt25 = HistoryTotal() ; tmpInt25 >= 0 ; tmpInt25=tmpInt25 - 1)
         {
           if ( OrderSelect(tmpInt25,0,1) != true || OrderSymbol() != currentSymbol || OrderMagicNumber() != strategyMagicNumber )   continue;
           
           if ( ( OrderType() != 0 && OrderType() != 1 ) )   continue;
           totalTradeCountByStrategy[currentStrategyIndex] ++;
           tmpDouble24 = tmpDouble24 + OrderProfit() + OrderSwap() + OrderCommission();
           
         }
         tmpDouble23 = tmpDouble24;
       }
       strategyDisplayProfit[6] = tmpDouble23;
       if ( strategyDisplayProfit[6]!=0.0 && totalTradeCountByStrategy[6] >  0 )
       {
         averageProfitByStrategy[6] = strategyDisplayProfit[6] / totalTradeCountByStrategy[6];
       }
     }
   }
   if ( legacyGlobalBool034 )
   {
     LoadStrategy9Profile(); 
     LoadStrategyRuntimeContext(7); 
     RunStrategyCycle(7); 
     if ( localBool04 )
     {
       if ( MQLInfoInteger(MQL_TESTER) == 1 && !(UpdateInfoTesting) )
       {
         tmpDouble26 = 0.0;
       }
       else
       {
         tmpDouble27 = 0.0;
         totalTradeCountByStrategy[currentStrategyIndex] = 0;
         for (tmpInt28 = HistoryTotal() ; tmpInt28 >= 0 ; tmpInt28=tmpInt28 - 1)
         {
           if ( OrderSelect(tmpInt28,0,1) != true || OrderSymbol() != currentSymbol || OrderMagicNumber() != strategyMagicNumber )   continue;
           
           if ( ( OrderType() != 0 && OrderType() != 1 ) )   continue;
           totalTradeCountByStrategy[currentStrategyIndex] ++;
           tmpDouble27 = tmpDouble27 + OrderProfit() + OrderSwap() + OrderCommission();
           
         }
         tmpDouble26 = tmpDouble27;
       }
       strategyDisplayProfit[7] = tmpDouble26;
       if ( strategyDisplayProfit[7]!=0.0 && totalTradeCountByStrategy[7] >  0 )
       {
         averageProfitByStrategy[7] = strategyDisplayProfit[7] / totalTradeCountByStrategy[7];
       }
     }
   }
 }
 else
 {
   currentSymbol = Symbol() ;
   RunStrategyCycle(0); 
 }
 UpdateInfoPanelSummary(); 
 if ( iTime(Symbol(),PERIOD_M5,1) != lastPanelRefreshM5BarTime )
 {
   lastPanelRefreshM5BarTime = iTime(Symbol(),PERIOD_M5,1) ;
   UpdateInfoPanelStrategyRows(); 
   UpdateInfoPanelTotals(); 
 }
 legacyGlobalInt381 ++;
 if ( legacyGlobalInt381 < 2 )   return;
 legacyGlobalDouble318 = AccountBalance() ;
 legacyGlobalInt381 = 0 ;
 }
//OnTick <<==--------   --------
 void OnDeinit(const int reason)
 {
 DeleteInfoPanel(); 
 }
//deinit <<==--------   --------

//+------------------------------------------------------------------+
//| Xu ly ngay giao dich nap/rut tien khi EA dang chay.               |
//+------------------------------------------------------------------+
 void OnTradeTransaction(const MqlTradeTransaction &trans,
                         const MqlTradeRequest &request,
                         const MqlTradeResult &result)
 {
  if ( !(OnlyUp) || ManualBalance>0.0 )   return;
  if ( trans.type!=TRADE_TRANSACTION_DEAL_ADD || trans.deal==0 )   return;
  if ( !(HistoryDealSelect(trans.deal)) )   return;
  ENUM_DEAL_TYPE legacyTemp_type = (ENUM_DEAL_TYPE)HistoryDealGetInteger(trans.deal,DEAL_TYPE) ;
  if ( legacyTemp_type!=DEAL_TYPE_BALANCE )   return;
  long legacyTemp_dealMsc = (long)HistoryDealGetInteger(trans.deal,DEAL_TIME_MSC) ;
  // Giao dich da duoc ReconcileOnlyUpWithdrawals() xu ly luc khoi dong.
  if ( legacyTemp_dealMsc<=g_onlyUpWithdrawScannedMsc )   return;
  double legacyTemp_amount = HistoryDealGetDouble(trans.deal,DEAL_PROFIT) ;
  if ( legacyTemp_amount<0.0 )   ApplyOnlyUpWithdrawal(legacyTemp_amount) ;
  g_onlyUpWithdrawScannedMsc = legacyTemp_dealMsc ;
  GlobalVariableSet(OnlyUpWithdrawGVName(),(double)g_onlyUpWithdrawScannedMsc) ;
 }
//OnTradeTransaction <<==--------   --------
 void LoadStrategyRuntimeContext( int argInt00)
 {
 currentStrategyIndex = argInt00 ;
 symbolPoint = SymbolInfoDouble(currentSymbol,16) ;
 pipSize = symbolPoint ;
 if ( ( MarketInfo(currentSymbol,MODE_DIGITS)==3.0 || MarketInfo(currentSymbol,MODE_DIGITS)==5.0 ) )
 {
   pipSize = symbolPoint * 10.0 ;
 }
 if ( SymbolInfoInteger(currentSymbol,17) == 0x1 )
 {
   pipSize = symbolPoint / 10.0 ;
 }
 symbolDigits = (int)MarketInfo(currentSymbol,MODE_DIGITS) ;
 currentSpreadPrice = MarketInfo(currentSymbol,MODE_ASK) - MarketInfo(currentSymbol,MODE_BID) ;
 stopLevelPriceDistance = MarketInfo(currentSymbol,MODE_STOPLEVEL) * symbolPoint ;
 freezeLevelPriceDistance = MarketInfo(currentSymbol,MODE_FREEZELEVEL) * symbolPoint ;
 pendingExpirationSeconds=pendingExpirationEnabledValue * 60 * 60;
 if ( pendingExpirationEnabledValue >  0 )
 {
   legacyGlobalDatetime302=TimeCurrent() + pendingExpirationSeconds;
 }
 else
 {
   legacyGlobalDatetime302 = 0 ;
 }
 if ( Virtual_expiration )
 {
   legacyGlobalDatetime302 = 0 ;
 }
 variableLotInverseScaleFactor = 1.0 ;
 if ( !(UseVariableValues) )   return;
 
 if ( legacyGlobalDouble007>0.0 )
 {
   variableValueScaleFactor = iOpen(currentSymbol,MT4Period(PERIOD_D1),1) / legacyGlobalDouble007 ;
 }
 else
 {
   variableValueScaleFactor = 1.0 ;
 }
 if ( AdjustLotsizeToVariableValues )
 {
   variableLotInverseScaleFactor = 1.0 / variableValueScaleFactor ;
 }
 else
 {
   variableLotInverseScaleFactor = 1.0 ;
 }
 legacyGlobalDouble080 = legacyGlobalDouble080 * variableValueScaleFactor ;
 buyPendingEntryOffsetPips = NormalizeDouble(buyPendingEntryOffsetPips * variableValueScaleFactor,0) ;
 sellPendingEntryOffsetPips = NormalizeDouble(sellPendingEntryOffsetPips * variableValueScaleFactor,0) ;
 stopLossPips = stopLossPips * variableValueScaleFactor ;
 takeProfitPips = takeProfitPips * variableValueScaleFactor ;
 legacyGlobalDouble103 = legacyGlobalDouble103 * variableValueScaleFactor ;
 legacyGlobalDouble104 = legacyGlobalDouble104 * variableValueScaleFactor ;
 legacyGlobalDouble105 = legacyGlobalDouble105 * variableValueScaleFactor ;
 legacyGlobalDouble108 = legacyGlobalDouble108 * variableValueScaleFactor ;
 legacyGlobalDouble109 = legacyGlobalDouble109 * variableValueScaleFactor ;
 legacyGlobalDouble113 = legacyGlobalDouble113 * variableValueScaleFactor ;
 legacyGlobalDouble114 = legacyGlobalDouble114 * variableValueScaleFactor ;
 }
//lizong_6 <<==--------   --------
 int RunStrategyCycle( int argInt00)
 {
  bool      localBool02;
  datetime  localLong03;
  int       localInt04;
  int       localInt05;
  string    localString06;
  datetime  localDatetime07;
  int       localInt08;
  int       localInt09;
//----- -----
 int        tmpInt01;
 int        tmpInt02;
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
 int        tmpInt21;
 int        tmpInt22;
 int        tmpInt23;
 int        tmpInt24;
 int        tmpInt25;
 int        tmpInt26;
 int        tmpInt27;
 int        tmpInt28;
 int        tmpInt29;
 int        tmpInt30;
 int        tmpInt31;
 int        tmpInt32;
 int        tmpInt33;
 int        tmpInt34;
 int        tmpInt35;
 int        tmpInt36;
 int        tmpInt37;
 int        tmpInt38;
 int        tmpInt39;
 int        tmpInt40;
 int        tmpInt41;
 int        tmpInt42;
 int        tmpInt43;
 int        tmpInt44;
 int        tmpInt45;
 int        tmpInt46;
 int        tmpInt47;
 int        tmpInt48;
 int        tmpInt49;
 int        tmpInt50;
 int        tmpInt51;
 int        tmpInt52;
 int        tmpInt53;
 int        tmpInt54;
 int        tmpInt55;
 int        tmpInt56;
 int        tmpInt57;
 int        tmpInt58;
 int        tmpInt59;
 int        tmpInt60;
 int        tmpInt61;
 int        tmpInt62;
 int        tmpInt63;
 int        tmpInt64;
 int        tmpInt65;
 int        tmpInt66;
 int        tmpInt67;
 int        tmpInt68;
 int        tmpInt69;
 int        tmpInt70;
 int        tmpInt71;
 int        tmpInt72;
 int        tmpInt73;
 int        tmpInt74;
 int        tmpInt75;
 int        tmpInt76;
 int        tmpInt77;
 int        tmpInt78;
