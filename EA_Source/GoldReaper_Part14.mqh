           tmpDouble36 = localDouble10;
           tmpInt37 = 1;
           tmpDouble38 = 0.0;
           tmpBool39 = false;
           for (tmpInt40 = 0 ; tmpInt40 < legacyGlobalInt199 ; tmpInt40=tmpInt40 + 1)
           {
             if ( virtualStopByTicket[tmpInt40][0]==tmpLong34 )
             {
               tmpDouble38 = virtualStopByTicket[tmpInt40][1];
               tmpBool39 = true;
               break;
             }
           }
           if ( !(tmpBool39) )
           {
             if ( tmpInt37 == 1 )
             {
               tmpDouble38 = NormalizeDouble(tmpDouble36 - tmpDouble35 * pipSize,symbolDigits);
             }
             if ( tmpInt37 == 2 )
             {
               tmpDouble38 = NormalizeDouble(tmpDouble35 * pipSize + tmpDouble36,symbolDigits);
             }
             for (tmpInt41 = 0 ; tmpInt41 < legacyGlobalInt199 ; tmpInt41=tmpInt41 + 1)
             {
               if ( virtualStopByTicket[tmpInt41][0]==0.0 )
               {
                 virtualStopByTicket[tmpInt41][0] = (double)tmpLong34;
                 virtualStopByTicket[tmpInt41][1] = tmpDouble38;
                 break;
               }
             }
           }
           activeVirtualStopPrice = tmpDouble38 ;
           localDouble04 = activeVirtualStopPrice ;
           if ( MarketInfo(currentSymbol,MODE_BID)<=localDouble04 )
           {
             RefreshRates(); 
             OrderClose(localLong09,localDouble12,MarketInfo(currentSymbol,MODE_BID),(int)currentSpreadPrice,0xFFFFFFFF); 
             return(true); 
           }
           localInt28 = (int)(TimeCurrent() - lastVirtualStopSyncTime) ;
           if ( localInt28 >= legacyGlobalInt065 )
           {
             if ( NormalizeDouble(activeVirtualStopPrice,symbolDigits)>localDouble07 + symbolPoint )
             {
               OrderModify(localLong09,localDouble10,NormalizeDouble(activeVirtualStopPrice,symbolDigits),localDouble08,0,0xFFFFFFFF); 
             }
             lastVirtualStopSyncTime = TimeCurrent() ;
           }
           if ( legacyGlobalDouble125>0.0 && TimeCurrent() >= localDatetime13 + legacyGlobalInt304 && MarketInfo(currentSymbol,MODE_BID)>legacyGlobalDouble126 * pipSize + (activeVirtualStopPrice + symbolPoint) && MarketInfo(currentSymbol,MODE_BID)<localDouble08 - freezeLevelPriceDistance )
           {
             localBool02 = true ;
             activeVirtualStopPrice = MarketInfo(currentSymbol,MODE_BID) - legacyGlobalDouble126 * pipSize ;
           }
           if ( legacyGlobalDouble103>0.0 && MarketInfo(currentSymbol,MODE_BID)>(legacyGlobalDouble103 + trailingActivationBufferPips) * pipSize + (activeVirtualStopPrice + symbolPoint) && MarketInfo(currentSymbol,MODE_BID)>legacyGlobalDouble104 * pipSize + localDouble05 && activeVirtualStopPrice<legacyGlobalDouble105 * pipSize + localDouble10 )
           {
             localBool02 = true ;
             activeVirtualStopPrice = MarketInfo(currentSymbol,MODE_BID) - legacyGlobalDouble103 * pipSize ;
             localDouble29 = NormalizeDouble(trailingPartialClosePercent / 100.0 * lotSizeByStrategy[currentStrategyIndex],2) ;
             if ( localDouble29<localDouble12 && localDouble29>=MarketInfo(currentSymbol,MODE_LOTSTEP) )
             {
               OrderClose(localLong09,localDouble29,MarketInfo(currentSymbol,MODE_BID),(int)orderSlippageSetting,Red); 
               return(true); 
             }
           }
           if ( localBool19 && legacyGlobalInt039 == 1 && slippageRecoveryTrailDistancePips>0.0 && MarketInfo(currentSymbol,MODE_BID)>slippageRecoveryTrailDistancePips * pipSize + (activeVirtualStopPrice + symbolPoint) && MarketInfo(currentSymbol,MODE_BID)>slippageRecoveryTriggerPips * pipSize + localDouble17 && MarketInfo(currentSymbol,MODE_BID)<localDouble08 - freezeLevelPriceDistance && activeVirtualStopPrice<slippageRecoveryMaximumStopPips * pipSize + localDouble10 )
           {
             Print("Slippage control active"); 
             localBool02 = true ;
             activeVirtualStopPrice = MarketInfo(currentSymbol,MODE_BID) - slippageRecoveryTrailDistancePips * pipSize ;
           }
           if ( legacyGlobalInt119 >  0 && legacyGlobalInt120 >= 0 && legacyGlobalDouble242Array99[currentStrategyIndex]>activeVirtualStopPrice + stopLevelPriceDistance + symbolPoint && ( legacyGlobalDouble242Array99[currentStrategyIndex]<localDouble10 || !(legacyGlobalBool116) ) && legacyGlobalDouble242Array99[currentStrategyIndex]<MarketInfo(currentSymbol,MODE_BID) - legacyGlobalInt122 * pipSize - stopLevelPriceDistance - symbolPoint && MarketInfo(currentSymbol,MODE_BID)<localDouble08 - freezeLevelPriceDistance )
           {
             activeVirtualStopPrice = legacyGlobalDouble242Array99[currentStrategyIndex] ;
             localBool02 = true ;
           }
           if ( legacyGlobalDouble113>0.0 && legacyGlobalInt063 == 3 && MarketInfo(currentSymbol,MODE_BID)>legacyGlobalDouble113 * pipSize + localDouble10 && legacyGlobalDouble114 * pipSize + localDouble10>localDouble07 + symbolPoint && MarketInfo(currentSymbol,MODE_BID)>legacyGlobalDouble114 * pipSize + localDouble10 + stopLevelPriceDistance && MarketInfo(currentSymbol,MODE_BID)<localDouble08 - freezeLevelPriceDistance && NormalizeDouble(legacyGlobalDouble114 * pipSize + localDouble10,symbolDigits)>OrderStopLoss() )
           {
             activeVirtualStopPrice = NormalizeDouble(legacyGlobalDouble114 * pipSize + localDouble10,symbolDigits) ;
             legacyGlobalInt230 = OrderModify(localLong09,localDouble10,activeVirtualStopPrice,localDouble08,0,0xFFFFFFFF) ;
             if ( legacyGlobalInt230 <= 0 )
             {
               Print("error when setting breakeven: '" + TradeErrorDescription(MT4_LastError()) + "' ..'Exit_BE_start' to close to 'Exit_BE_extra_pips' ..trying again!"); 
             }
             localBool02 = true ;
           }
           if ( legacyGlobalDouble113>0.0 && legacyGlobalInt063 == 2 && MarketInfo(currentSymbol,MODE_BID)>legacyGlobalDouble113 * pipSize + localDouble10 && legacyGlobalDouble114 * pipSize + localDouble10>activeVirtualStopPrice + symbolPoint && MarketInfo(currentSymbol,MODE_BID)>legacyGlobalDouble114 * pipSize + localDouble10 + stopLevelPriceDistance && MarketInfo(currentSymbol,MODE_BID)<localDouble08 - freezeLevelPriceDistance )
           {
             activeVirtualStopPrice = legacyGlobalDouble114 * pipSize + localDouble10 ;
             localBool02 = true ;
           }
           if ( !(localBool02) && ( legacyGlobalInt128 == 1 || (legacyGlobalInt128 == 2 && magicTrailStepPips * pipSize + activeVirtualStopPrice<=magicTrailMode2SpreadBufferPips * pipSize + (localDouble05 + currentSpreadPrice)) ) )
           {
             legacyGlobalInt250 ++;
             if ( MarketInfo(currentSymbol,MODE_BID)>magicTrailStepPips * pipSize + activeVirtualStopPrice + stopLevelPriceDistance && MarketInfo(currentSymbol,MODE_BID)<localDouble08 - freezeLevelPriceDistance && ( magicTrailActivationDistancePips==0.0 || MarketInfo(currentSymbol,MODE_BID)>legacyGlobalDouble247 * pipSize + localDouble05 ) && legacyGlobalInt250 >= legacyGlobalInt130 )
             {
               legacyGlobalInt250 = 0 ;
               activeVirtualStopPrice = magicTrailStepPips * pipSize + activeVirtualStopPrice ;
               localBool02 = true ;
             }
           }
           if ( MarketInfo(currentSymbol,MODE_BID)<=activeVirtualStopPrice )
           {
             RefreshRates(); 
             OrderClose(localLong09,localDouble12,MarketInfo(currentSymbol,MODE_BID),(int)currentSpreadPrice,0xFFFFFFFF); 
             return(true); 
           }
           if ( NormalizeDouble(localDouble04,symbolDigits)!=NormalizeDouble(activeVirtualStopPrice,symbolDigits) )
           {
             tmpDouble42 = NormalizeDouble(activeVirtualStopPrice,symbolDigits);
             tmpLong43 = localLong09;
             for (tmpInt44 = 0 ; tmpInt44 < legacyGlobalInt199 ; tmpInt44=tmpInt44 + 1)
             {
               if ( virtualStopByTicket[tmpInt44][0]==tmpLong43 )
               {
                 virtualStopByTicket[tmpInt44][1] = tmpDouble42;
                 break;
               }
             }
           }
         }
       }
     }
     if ( localBool02 )
     {
       localBool03 = true ;
     }
   }
   if ( localBool02 )
   {
     localBool03 = true ;
   }
 }
 return(localBool03); 
 }
//lizong_18 <<==--------   --------
 bool ManageSellTrades()
 {
  bool      localBool02 = false;
  bool      localBool03 = false;
  double    localDouble04;
  double    localDouble05;
  int       localInt06;
  double    localDouble07;
  double    localDouble08;
  long      localLong09;
  double    localDouble10;
  string    localString11;
  double    localDouble12;
  datetime  localDatetime13;
  int       localInt14;
  int       localInt15;
  string    localString16;
  double    localDouble17;
  double    localDouble18;
  bool      localBool19;
  bool      localBool20;
  double    localDouble21;
  bool      localBool22;
  double    localDouble23;
  double    localDouble24;
  double    localDouble25;
  double    localDouble26;
  double    localDouble27;
  int       localInt28;
  double    localDouble29;
//----- -----
 int        tmpInt01;
 long       tmpLong02;
 int        tmpInt03;
 double     tmpDouble04;
 double     tmpDouble05;
 long       tmpLong06;
 int        tmpInt07;
 long       tmpLong08;
 int        tmpInt09;
 int        tmpInt10;
 string     tmpString11;
 double     tmpDouble12;
 int        tmpInt13;
 long       tmpLong14;
 double     tmpDouble15;
 int        tmpInt16;
 long       tmpLong17;
 long       tmpLong18;
 int        tmpInt19;
 int        tmpInt20;
 int        tmpInt21;
 string     tmpString22;
 long       tmpLong23;
 double     tmpDouble24;
 double     tmpDouble25;
 int        tmpInt26;
 double     tmpDouble27;
 bool       tmpBool28;
 int        tmpInt29;
 int        tmpInt30;
 double     tmpDouble31;
 long       tmpLong32;
 int        tmpInt33;
 long       tmpLong34;
 double     tmpDouble35;
 double     tmpDouble36;
 int        tmpInt37;
 double     tmpDouble38;
 bool       tmpBool39;
 int        tmpInt40;
 int        tmpInt41;
 double     tmpDouble42;
 long       tmpLong43;
 int        tmpInt44;

 localDouble04 = 0.0 ;
 localDouble05 = 0.0 ;
 for (localInt06 = 0 ; localInt06 < MT4OrdersTotal() ; localInt06 ++)
 {
   if ( OrderSelect(localInt06,0,0) == true )
   {
     localBool02 = false ;
     localDouble07 = NormalizeDouble(OrderStopLoss(),symbolDigits) ;
     localDouble08 = NormalizeDouble(OrderTakeProfit(),symbolDigits) ;
     localLong09 = OrderTicket() ;
     localDouble10 = NormalizeDouble(OrderOpenPrice(),symbolDigits) ;
     localString11 = OrderComment() ;
     localDouble12 = OrderLots() ;
     localDatetime13 = OrderOpenTime() ;
     localInt14 = OrderType() ;
     localInt15 = OrderMagicNumber() ;
     localString16 = OrderSymbol() ;
     if ( ( localInt14 == 5 || localInt14 == 3 ) && entryStrategyMode == 2 && ( legacyGlobalInt095 == 0 || (legacyGlobalInt095 == 1 && localString16 == currentSymbol) ) && ( localInt15 == secondaryStrategyMagicNumber || secondaryStrategyMagicNumber == 0 ) && ( localString11 == legacyGlobalString097 || legacyGlobalString097 == "" ) )
     {
       if ( ( localDouble07==0.0 || localDouble07==0.0 ) )
       {
         localDouble07 = NormalizeDouble(stopLossPips * pipSize + localDouble10,symbolDigits) ;
         OrderModify(localLong09,localDouble10,localDouble07,localDouble08,0,Green); 
       }
       if ( ( localDouble08==0.0 || localDouble08==0.0 ) )
       {
         localDouble08 = NormalizeDouble(localDouble10 - takeProfitPips * pipSize,symbolDigits) ;
         OrderModify(localLong09,localDouble10,localDouble07,localDouble08,0,Green); 
       }
     }
     if ( localInt14 == 1 && ( ( localInt15 == strategyMagicNumber && entryStrategyMode == 1 && localString16 == currentSymbol ) || (entryStrategyMode == 2 && ( legacyGlobalInt095 == 0 || (legacyGlobalInt095 == 1 && localString16 == currentSymbol) ) && ( localInt15 == secondaryStrategyMagicNumber || secondaryStrategyMagicNumber == 0 ) && (localString11 == legacyGlobalString097 || legacyGlobalString097 == "")) ) )
     {
       if ( ( localDouble07==0.0 || localDouble07==0.0 ) )
       {
         localDouble07 = NormalizeDouble(stopLossPips * pipSize + localDouble10,symbolDigits) ;
         OrderModify(localLong09,localDouble10,localDouble07,localDouble08,0,Green); 
       }
       if ( ( localDouble08==0.0 || localDouble08==0.0 ) )
       {
         localDouble08 = NormalizeDouble(localDouble10 - takeProfitPips * pipSize,symbolDigits) ;
         OrderModify(localLong09,localDouble10,localDouble07,localDouble08,0,Green); 
       }
       if ( candleExitM1Enabled && iTime(currentSymbol,MT4Period(legacyGlobalInt052),legacyGlobalInt051) <= localDatetime13 && iTime(currentSymbol,MT4Period(legacyGlobalInt052),0) >  localDatetime13 && iClose(currentSymbol,MT4Period(legacyGlobalInt052),1)>iOpen(currentSymbol,MT4Period(legacyGlobalInt052),1) && iClose(currentSymbol,MT4Period(legacyGlobalInt052),1)>localDouble10 )
       {
         OrderClose(localLong09,localDouble12,MarketInfo(currentSymbol,MODE_ASK),0,Red); 
         Print("closing candle confirmation"); 
         continue; // ticket da dong: khong OrderModify tiep tren cung position
       }
       if ( candleExitM5Enabled && iTime(currentSymbol,MT4Period(legacyGlobalInt054),legacyGlobalInt051) <= localDatetime13 && iTime(currentSymbol,MT4Period(legacyGlobalInt054),0) >  localDatetime13 && iClose(currentSymbol,MT4Period(legacyGlobalInt054),1)>iOpen(currentSymbol,MT4Period(legacyGlobalInt054),1) && iClose(currentSymbol,MT4Period(legacyGlobalInt054),1)>localDouble10 )
       {
         OrderClose(localLong09,localDouble12,MarketInfo(currentSymbol,MODE_ASK),0,Red); 
         Print("closing candle confirmation"); 
         continue; // ticket da dong: khong OrderModify tiep tren cung position
       }
       if ( candleExitM15Enabled && iTime(currentSymbol,MT4Period(legacyGlobalInt056),legacyGlobalInt051) <= localDatetime13 && iTime(currentSymbol,MT4Period(legacyGlobalInt056),0) >  localDatetime13 && iClose(currentSymbol,MT4Period(legacyGlobalInt056),1)>iOpen(currentSymbol,MT4Period(legacyGlobalInt056),1) && iClose(currentSymbol,MT4Period(legacyGlobalInt056),1)>localDouble10 )
       {
         OrderClose(localLong09,localDouble12,MarketInfo(currentSymbol,MODE_ASK),0,Red); 
         Print("closing candle confirmation"); 
         continue; // ticket da dong: khong OrderModify tiep tren cung position
       }
       if ( candleExitM30Enabled && iTime(currentSymbol,MT4Period(legacyGlobalInt058),legacyGlobalInt051) <= localDatetime13 && iTime(currentSymbol,MT4Period(legacyGlobalInt058),0) >  localDatetime13 && iClose(currentSymbol,MT4Period(legacyGlobalInt058),1)>iOpen(currentSymbol,MT4Period(legacyGlobalInt058),1) && iClose(currentSymbol,MT4Period(legacyGlobalInt058),1)>localDouble10 )
       {
         OrderClose(localLong09,localDouble12,MarketInfo(currentSymbol,MODE_ASK),0,Red); 
         Print("closing candle confirmation"); 
         continue; // ticket da dong: khong OrderModify tiep tren cung position
       }
       if ( candleExitH1Enabled && iTime(currentSymbol,MT4Period(legacyGlobalInt060),legacyGlobalInt051) <= localDatetime13 && iTime(currentSymbol,MT4Period(legacyGlobalInt060),0) >  localDatetime13 && iClose(currentSymbol,MT4Period(legacyGlobalInt060),1)>iOpen(currentSymbol,MT4Period(legacyGlobalInt060),1) && iClose(currentSymbol,MT4Period(legacyGlobalInt060),1)>localDouble10 )
       {
         OrderClose(localLong09,localDouble12,MarketInfo(currentSymbol,MODE_ASK),0,Red); 
         Print("closing candle confirmation"); 
         continue; // ticket da dong: khong OrderModify tiep tren cung position
       }
       legacyGlobalDouble247 = magicTrailActivationDistancePips ;
       if ( legacyGlobalInt133 >  0 && TimeCurrent() >  localDatetime13 + legacyGlobalInt133 * 60 )
       {
         legacyGlobalDouble247 = magicTrailDelayedActivationPips ;
       }
       tmpInt01 = symbolDigits;
       tmpLong02 = localLong09;
       for (tmpInt03 = 0 ; tmpInt03 < 100 ; tmpInt03=tmpInt03 + 1)
       {
         if ( !(pendingTicketPriceMap[tmpInt03][0]==tmpLong02) )   continue;
         tmpDouble04 = pendingTicketPriceMap[tmpInt03][1];
         break;
         
       }
       tmpDouble04 = 0.0;
       localDouble17 = NormalizeDouble(tmpDouble04,tmpInt01) ;
       if ( localDouble17==0.0 )
       {
         tmpDouble05 = localDouble10;
         tmpLong06 = localLong09;
         for (tmpInt07 = 0 ; tmpInt07 < 100 ; tmpInt07=tmpInt07 + 1)
         {
           if ( !(pendingTicketPriceMap[tmpInt07][0]==0.0) )   continue;
           pendingTicketPriceMap[tmpInt07][0] = (double)tmpLong06;
           pendingTicketPriceMap[tmpInt07][1] = tmpDouble05;
           break;
           
         }
         localDouble17 = localDouble10 ;
       }
       else
       {
         localDouble17 = localDouble17 - requestedEntryAdjustmentPips * pipSize ;
       }
       localDouble18 = localDouble17 - localDouble10 ;
       localBool19 = false ;
       if ( localDouble17>requestedEntryAdjustmentPips * pipSize && localDouble18>orderSlippageSetting * pipSize )
       {
         localBool19 = true ;
         if ( legacyGlobalInt039 == 2 )
         {
           legacyGlobalDouble247 = -1000.0 ;
           Print("Slippage Mode 2 active"); 
         }
       }
       if ( useRequestedEntryAsTrailReference )
       {
         localDouble05 = localDouble17 ;
       }
       else
       {
         localDouble05 = localDouble10 ;
       }
       // EX5 sync: max-loss nay chi la virtual close threshold;
       // khong day SL broker lien tuc bang OrderModify.
       if ( MarketInfo(currentSymbol,MODE_ASK)>(stopLossPips + legacyGlobalDouble064) * pipSize + localDouble10 + currentSpreadPrice )
       {
         RefreshRates(); 
         OrderClose(OrderTicket(),OrderLots(),MarketInfo(currentSymbol,MODE_ASK),(int)currentSpreadPrice,Red); 
