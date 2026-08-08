 legacyGlobalDouble384 = 0.0 ;
 dailyDrawdownLockActive = false ;
 lastPanelRefreshM5BarTime = 0 ;
 legacyGlobalBool380 = true ;
 legacyGlobalDouble358 = 5.0 ;
 legacyGlobalDouble359 = 10.0 ;
 strategyMagicNumber = ST1_MagicNumber ;
 legacyGlobalInt360 = 300 ;
 legacyGlobalDouble361 = panelFontSize * 25 * panelWidthScaleFactor * InfoPanelSizeAdjust ;
 panelRowHeight = panelFontSize * 3.5 * panelHeightScaleFactor * InfoPanelSizeAdjust ;
 legacyGlobalInt363 = 7 ;
 currentStrategyIndex = 0 ;
 currentSymbol = Symbol() ;
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
 if ( FridayStopHour <  0 )
 {
   fridayStopEnabled = false ;
 }
 else
 {
   fridayStopEnabled = true ;
 }
 legacyGlobalDouble251 = (double)TimeCurrent() ;
 currentSpreadPrice = MarketInfo(currentSymbol,MODE_ASK) - MarketInfo(currentSymbol,MODE_BID) ;
 lotSizeByStrategy[currentStrategyIndex] = NormalizeDouble(MathFloor(g_startLots_rw * 100.0) / 100.0,2);
 if ( MarketInfo(currentSymbol,MODE_LOTSTEP)==0.1 )
 {
   lotSizeByStrategy[currentStrategyIndex] = NormalizeDouble((MathFloor(g_startLots_rw * 10.0)) / 10.0,1);
   if ( lotSizeByStrategy[currentStrategyIndex]<0.1 )
   {
     lotSizeByStrategy[currentStrategyIndex] = 0.1;
   }
 }
 if ( lotSizeByStrategy[currentStrategyIndex]<MarketInfo(currentSymbol,MODE_MINLOT) )
 {
   lotSizeByStrategy[currentStrategyIndex] = MarketInfo(currentSymbol,MODE_MINLOT);
 }
 if ( lotSizeByStrategy[currentStrategyIndex]>MarketInfo(currentSymbol,MODE_MAXLOT) )
 {
   lotSizeByStrategy[currentStrategyIndex] = MarketInfo(currentSymbol,MODE_MAXLOT);
 }
 legacyGlobalInt306 = iBars(currentSymbol,MT4Period(PERIOD_CURRENT)) ;
 if ( magicTrailStepPips * pipSize<symbolPoint )
 {
   magicTrailStepPips = symbolPoint / pipSize ;
 }
 legacyGlobalDouble307 = AccountBalance() ;
 stopLevelPriceDistance = MarketInfo(currentSymbol,MODE_STOPLEVEL) * symbolPoint ;
 freezeLevelPriceDistance = MarketInfo(currentSymbol,MODE_FREEZELEVEL) * symbolPoint ;
 legacyGlobalString299 = StringSubstr(Symbol(),6,10) ;
 if ( legacyGlobalString299 != "" )
 {
   Print("Suffix detected: " + legacyGlobalString299); 
 }
 if ( ( StringFind(Symbol(),"XAUUSD",0) >= 0 || StringFind(Symbol(),"xauusd",0) >= 0 || StringFind(Symbol(),"GOLD",0) >= 0 || StringFind(Symbol(),"gold",0) >= 0 || StringFind(Symbol(),"Gold",0) >= 0 || StringFind(Symbol(),"GLD",0) >= 0 ) )
 {
   currentSymbol = Symbol() ;
   legacyGlobalString347Array99[strategySymbolCount] = Symbol();
   LoadStrategy1Profile(); 
   LoadStrategyRuntimeContext(0); 
   strategySymbolCount ++;
 }
 else
 {
   currentSymbol = Symbol() ;
   LoadStrategyRuntimeContext(0); 
 }
 if ( !(legacyGlobalBool380) )
 {
   Print("Initialisation of pairs failed!"); 
 }
 if ( stopLossPips<=0.0 )
 {
   stopLossPips = 1.0 ;
 }
 if ( takeProfitPips<=0.0 )
 {
   takeProfitPips = 1.0 ;
 }
 if ( legacyGlobalDouble114>legacyGlobalDouble113 )
 {
   legacyGlobalDouble114 = legacyGlobalDouble113 + 0.1 ;
 }
 if ( legacyGlobalInt036<freezeLevelPriceDistance / pipSize )
 {
   legacyGlobalInt036 = (int)(freezeLevelPriceDistance / pipSize) ;
 }
 if ( legacyGlobalDouble103!=0.0 && legacyGlobalDouble103<freezeLevelPriceDistance / pipSize )
 {
   legacyGlobalDouble103 = freezeLevelPriceDistance / pipSize ;
 }
 if ( legacyGlobalDouble103!=0.0 && legacyGlobalDouble103<stopLevelPriceDistance / pipSize )
 {
   legacyGlobalDouble103 = stopLevelPriceDistance / pipSize ;
 }
 if ( legacyGlobalDouble125>0.0 && legacyGlobalDouble126<freezeLevelPriceDistance / pipSize )
 {
   legacyGlobalDouble126 = freezeLevelPriceDistance / pipSize ;
 }
 if ( legacyGlobalDouble125>0.0 && legacyGlobalDouble126<stopLevelPriceDistance / pipSize )
 {
   legacyGlobalDouble126 = stopLevelPriceDistance / pipSize ;
 }
 if ( stopLossPips<stopLevelPriceDistance * 2.0 / pipSize )
 {
   stopLossPips = stopLevelPriceDistance * 2.0 / pipSize ;
 }
 if ( takeProfitPips<stopLevelPriceDistance * 2.0 / pipSize )
 {
   takeProfitPips = stopLevelPriceDistance * 2.0 / pipSize ;
 }
 if ( legacyGlobalDouble080<stopLevelPriceDistance * 2.0 / pipSize )
 {
   legacyGlobalDouble080 = stopLevelPriceDistance * 2.0 / pipSize ;
 }
 if ( legacyGlobalInt073 <  1 )
 {
   legacyGlobalInt073 = 1 ;
 }
 if ( legacyGlobalInt074 <  1 )
 {
   legacyGlobalInt074 = 1 ;
 }
 if ( legacyGlobalDouble080<0.1 )
 {
   legacyGlobalDouble080 = 0.1 ;
 }
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
 nfpTradingSuspended = false ;
 legacyGlobalDouble260 = Seconds() ;
 lastVirtualStopSyncTime = TimeCurrent() ;
 buyZoneStateInitialized = false ;
 sellZoneStateInitialized = false ;
 legacyGlobalInt258 = Month() ;
 legacyGlobalDatetime313 = iTime(currentSymbol,MT4Period(PERIOD_W1),1) ;
 legacyGlobalDatetime314 = iTime(currentSymbol,MT4Period(PERIOD_M1),1) ;
 legacyGlobalDatetime315 = iTime(currentSymbol,MT4Period(PERIOD_M1),1) ;
 if ( maxSpreadPips>MaxSpread )
 {
   maxSpreadPips = MaxSpread ;
 }
 legacyGlobalBool257 = false ;
 CalculateBuyEntryPrice(entryTimeframeMinutes); 
 CalculateSellEntryPrice(entryTimeframeMinutes); 
 cachedBuySignalPrice = NormalizeDouble(buyEntryPrice,symbolDigits) ;
 cachedSellSignalPrice = NormalizeDouble(sellEntryPrice,symbolDigits) ;
 legacyGlobalInt250 = 0 ;
 marketPauseMessageLogged = false ;
 legacyGlobalInt304 = (int)(legacyGlobalDouble125 * 60.0) ;
 legacyGlobalBool139 = false ;
 tradingHoursState = true ;
 freezeLevelPriceDistance = MarketInfo(currentSymbol,MODE_FREEZELEVEL) * symbolPoint ;
 if ( !(tradingHoursEnabled) )
 {
   tradingHoursState = false ;
 }
 activeVirtualStopPrice = 0.0 ;
 legacyGlobalDouble201 = 0.0 ;
 legacyGlobalDouble202 = 0.0 ;
 legacyGlobalBool240 = false ;
 legacyGlobalString299 = StringSubstr(currentSymbol,6,0) ;
 if ( Risk >  0 )
 {
   legacyGlobalBool139 = true ;
 }
 if ( g_startLots_rw<0.0 )
 {
   g_startLots_rw = 0.01 ;
 }
 if ( maxCalculatedLotSize>MarketInfo(currentSymbol,MODE_MAXLOT) )
 {
   maxCalculatedLotSize = MarketInfo(currentSymbol,MODE_MAXLOT) ;
 }
 for (localInt04 = 0 ; localInt04 < legacyGlobalInt199 ; localInt04 ++)
 {
   for (localInt05 = 0 ; localInt05 < 2 ; localInt05 ++)
   {
     virtualStopByTicket[localInt04][localInt05] = 0.0;
   }
 }
 for (localInt06 = 0 ; localInt06 < orderBufferCapacity ; localInt06 ++)
 {
   for (localInt07 = 0 ; localInt07 < 3 ; localInt07 ++)
   {
     storedPendingOrders[localInt06][localInt07] = 0.0;
   }
 }
 for (localInt08 = 0 ; localInt08 < 100 ; localInt08 ++)
 {
   storedPendingOrders[localInt08][0] = 0.0;
   storedPendingOrders[localInt08][1] = 0.0;
 }
 fridayTradingSuspended = false ;
 legacyGlobalDouble272 = iFractals(currentSymbol,0,1,1) ;
 legacyGlobalDouble273 = iFractals(currentSymbol,0,2,1) ;
 legacyGlobalDouble270 = legacyGlobalDouble272 ;
 legacyGlobalDouble271 = legacyGlobalDouble273 ;
 legacyGlobalDouble275 = 0.0 ;
 legacyGlobalBool231 = false ;
 legacyGlobalInt290 = Hour() ;
 legacyGlobalInt289 = 0 ;
 legacyGlobalString252=ST1_Comment + "B1";
 legacyGlobalString253=ST1_Comment + "B2";
 legacyGlobalString254=ST1_Comment + "S1";
 legacyGlobalString255=ST1_Comment + "S2";
 legacyGlobalInt297 = 0 ;
 legacyGlobalInt298 = 0 ;
 legacyGlobalInt267 = Hour() ;
 if ( virtualPendingOrdersEnabled )
 {
   maxPendingOrders = 1 ;
   legacyGlobalBool278 = true ;
   legacyGlobalBool279 = true ;
 }
 legacyGlobalDouble209 = 999.0 ;
 legacyGlobalDouble210 = 0.0 ;
 legacyGlobalDouble300 = 0.0 ;
 legacyGlobalDouble301 = 0.0 ;
 for (localInt09 = 0 ; localInt09 < 99 ; localInt09 ++)
 {
   legacyGlobalInt322Array99[localInt09] = 0;
   legacyGlobalInt321Array99[localInt09] = 0;
   legacyGlobalDatetime215Array99[localInt09] = iTime(currentSymbol,MT4Period(entryTimeframeMinutes),1);
   if ( !(lotSizeByStrategy[localInt09]<g_startLots_rw) )   continue;
   lotSizeByStrategy[localInt09] = g_startLots_rw;
   
 }
 legacyGlobalLong216 = 0 ;
 legacyGlobalBool238 = false ;
 legacyGlobalBool239 = false ;
 if ( legacyGlobalInt063 == 1 )
 {
   legacyGlobalDouble064 = 0.0 ;
 }
 symbolDigits = (int)MarketInfo(currentSymbol,MODE_DIGITS) ;
 demoAccountDetectedFlag = false ;
 IsDemo(); 

 if ( tmpBool01 == true )
 {
   demoAccountDetectedFlag = true ;
 }
 if ( ShowInfoPanel )
 {
   if ( legacyGlobalInt152 == 1 )
   {
     RankStrategiesByTotalProfit(); 
   }
   else
   {
     if ( legacyGlobalInt152 == 2 )
     {
       RankStrategiesByAverageProfit(); 
     }
   }
   CreateInfoPanel(); 
   UpdateInfoPanelSummary(); 
   UpdateInfoPanelTotals(); 
 }
 return(0); 
 }
//init <<==--------   --------
 void OnTick()
 {
  bool      localBool01;
  double    localDouble02;
  double    localDouble03;
  bool      localBool04;
  MqlDateTime legacyLocal_5_a_129;
  MqlDateTime legacyLocal_6_a_129;
//----- -----
 bool       tmpBool01;
 double     tmpDouble02;
 double     tmpDouble03;
 int        tmpInt04;
 double     tmpDouble05;
 double     tmpDouble06;
 int        tmpInt07;
 double     tmpDouble08;
 double     tmpDouble09;
 int        tmpInt10;
 double     tmpDouble11;
 double     tmpDouble12;
 int        tmpInt13;
 double     tmpDouble14;
 double     tmpDouble15;
 int        tmpInt16;
 double     tmpDouble17;
 double     tmpDouble18;
 int        tmpInt19;
 double     tmpDouble20;
 double     tmpDouble21;
 int        tmpInt22;
 double     tmpDouble23;
 double     tmpDouble24;
 int        tmpInt25;
 double     tmpDouble26;
 double     tmpDouble27;
 int        tmpInt28;

 currentBalanceBasis = AccountInfoDouble(ACCOUNT_BALANCE) ;
 if ( UseEquity )
 {
   currentBalanceBasis = AccountInfoDouble(ACCOUNT_EQUITY) ;
 }
 if ( ManualBalance>0.0 )
 {
   currentBalanceBasis = ManualBalance ;
 }
 if ( OnlyUp && highestBalanceBasis>currentBalanceBasis )
 {
   currentBalanceBasis = highestBalanceBasis ;
 }
 if ( currentBalanceBasis>highestBalanceBasis )
 {
   highestBalanceBasis = currentBalanceBasis ;
   if ( OnlyUp )   GlobalVariableSet(OnlyUpPeakGVName(),highestBalanceBasis) ;
 }
 if ( FakeOutFilter == 0 )
 {
   candleExitM1Enabled = false ;
   candleExitM15Enabled = false ;
   candleExitH1Enabled = false ;
 }
 else
 {
   if ( FakeOutFilter == 1 )
   {
     candleExitM1Enabled = true ;
     candleExitM15Enabled = false ;
     candleExitH1Enabled = false ;
   }
   else
   {
     if ( FakeOutFilter == 2 )
     {
       candleExitM1Enabled = true ;
       candleExitM15Enabled = true ;
       candleExitH1Enabled = false ;
     }
     else
     {
       if ( FakeOutFilter == 3 )
       {
         candleExitM1Enabled = true ;
         candleExitM15Enabled = true ;
         candleExitH1Enabled = true ;
       }
     }
   }
 }
 localBool01 = false ;
 if ( IsAmericanDaylightSavingTime() )
 {
   legacyGlobalInt395 = Broker_GMT_OFFSET_Summer ;
   if ( ( !(usDaylightSavingState) || !(gmtDetectionInitialized) ) && AutoGMT && !(localBool01) )
   {
     usDaylightSavingState = true ;
     europeDaylightSavingState = true ;
     legacyGlobalInt396 = FetchUtcOffsetHours() ;
     if ( legacyGlobalInt396 == 999 )
     {
       Print("GMT_Offset wrongly detected.  Trying againg!"); 
       Sleep(2000); 
       legacyGlobalInt396 = FetchUtcOffsetHours() ;
     }
     if ( legacyGlobalInt396 == 999 )
     {
       Print("GMT_Offset still wrong.  Using VPS time for GMT detection!"); 
     }
     gmtDetectionInitialized = true ;
     localBool01 = true ;
     Print("DST_US on"); 
   }
 }
 else
 {
   legacyGlobalInt395 = Broker_GMT_OFFSET_Winter ;
   if ( ( usDaylightSavingState || !(gmtDetectionInitialized) ) && AutoGMT && !(localBool01) )
   {
     usDaylightSavingState = false ;
     europeDaylightSavingState = false ;
     legacyGlobalInt396 = FetchUtcOffsetHours() ;
     if ( legacyGlobalInt396 == 999 )
     {
       Print("GMT_Offset wrongly detected.  Trying againg!"); 
       Sleep(2000); 
       legacyGlobalInt396 = FetchUtcOffsetHours() ;
     }
     if ( legacyGlobalInt396 == 999 )
     {
       Print("GMT_Offset still wrong.  Using VPS time for GMT detection!"); 
     }
     gmtDetectionInitialized = true ;
     localBool01 = true ;
     Print("DST_US off"); 
   }
 }
 TimeToStruct(StringToTime(string(TimeYear(TimeCurrent())) + ".03.31 01:00"),legacyLocal_5_a_129); 
 TimeToStruct(StringToTime(string(TimeYear(TimeCurrent())) + ".10.31 02:00"),legacyLocal_6_a_129); 
 if ( TimeDayOfYear(TimeCurrent()) >  TimeDayOfYear(StringToTime(string(TimeYear(TimeCurrent())) + ".03.31 01:00") - legacyLocal_5_a_129.day_of_week * 86400) && TimeDayOfYear(TimeCurrent()) <  TimeDayOfYear(StringToTime(string(TimeYear(TimeCurrent())) + ".10.31 02:00") - legacyLocal_6_a_129.day_of_week * 86400) )
 {
   tmpBool01 = true;
 }
 else
 {
   tmpBool01 = false;
 }
 if ( tmpBool01 )
 {
   if ( ( !(europeDaylightSavingState) || !(gmtDetectionInitialized) ) && AutoGMT && !(localBool01) )
   {
     europeDaylightSavingState = true ;
     legacyGlobalInt396 = FetchUtcOffsetHours() ;
     if ( legacyGlobalInt396 == 999 )
     {
       Print("GMT_Offset wrongly detected.  Trying againg!"); 
       Sleep(2000); 
       legacyGlobalInt396 = FetchUtcOffsetHours() ;
     }
     if ( legacyGlobalInt396 == 999 )
     {
       Print("GMT_Offset still wrong.  Using VPS time for GMT detection!"); 
     }
     gmtDetectionInitialized = true ;
     localBool01 = true ;
     Print("DST_EU on"); 
   }
 }
 else
 {
   if ( ( europeDaylightSavingState || !(gmtDetectionInitialized) ) && AutoGMT && !(localBool01) )
   {
     europeDaylightSavingState = false ;
     legacyGlobalInt396 = FetchUtcOffsetHours() ;
     if ( legacyGlobalInt396 == 999 )
     {
       Print("GMT_Offset wrongly detected.  Trying againg!"); 
       Sleep(2000); 
       legacyGlobalInt396 = FetchUtcOffsetHours() ;
     }
     if ( legacyGlobalInt396 == 999 )
     {
       Print("GMT_Offset still wrong.  Using VPS time for GMT detection!"); 
     }
     gmtDetectionInitialized = true ;
     localBool01 = true ;
     Print("DST_EU off"); 
   }
 }
 if ( AutoGMT && MQLInfoInteger(MQL_TESTER) != 1 )
 {
   if ( legacyGlobalInt396 != 999 )
   {
     legacyGlobalDatetime390=TimeCurrent() - legacyGlobalInt396 * 3600;
   }
   else
   {
     legacyGlobalDatetime390 = TimeGMT() ;
   }
 }
 else
 {
   legacyGlobalDatetime390=TimeCurrent() - legacyGlobalInt395 * 3600;
 }
 // Lich MQL5 khong kha dung/dang tin cay trong Strategy Tester (backtest) nen chi
 // lam moi tu Lich MQL5 khi dang chay live/demo that; kiem thu nguoc luon dung mang
 // 总_391_da_5DFC_si300[] ma hoa cung ben tren (da cap nhat toi het nam 2026) de dam
 // bao ket qua backtest 100% xac dinh, lap lai duoc.
 if ( EnableNFP_Filter && UseMQL5Calendar && MQLInfoInteger(MQL_TESTER) != 1 && TimeCurrent() - TimeCurrent() % 86400 > g_nfpCalendarBuiltDay )
 {
   BuildNFPDatesFromCalendar();
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
