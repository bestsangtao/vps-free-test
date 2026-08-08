         tmpDouble08 = OrderOpenPrice();
         
       }
       if ( sellEntryPrice<tmpDouble08 )
       {
         return(false); 
       }
     }
     legacyGlobalDouble263 = sellEntryPrice ;
     localBool02 = true ;
     cachedSellSignalPrice = NormalizeDouble(sellEntryPrice,symbolDigits) ;
   }
   if ( cachedSellSignalPrice==0.0 )
   {
     return(false); 
   }
   if ( localBool02 )
   {
     legacyGlobalDouble247 = magicTrailActivationDistancePips ;
     localDouble03 = NormalizeDouble(cachedSellSignalPrice - sellPendingEntryOffsetPips * pipSize,symbolDigits) ;
     tmpDouble10 = localDouble03;
     tmpBool12=false; 
     for (tmpInt11 = MT4OrdersTotal() ; tmpInt11 >= 0 ; tmpInt11=tmpInt11 - 1)
     {
       if ( OrderSelect(tmpInt11,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 5 || !(OrderOpenPrice()>=tmpDouble10) )   continue;
       tmpBool12 = true;
        break;
       
     }
     if ( tmpBool12 )
     {
       return(false); 
     }
     lastSellPendingBasePrice = localDouble03 ;
     if ( !(virtualPendingOrdersEnabled) )
     {
       if ( CheckMargin && AccountFreeMarginCheck(currentSymbol,1,lotSizeByStrategy[currentStrategyIndex])<=0.0 )
       {
         Print("Free margin not sufficient for setting order with lotsize " + string(lotSizeByStrategy[currentStrategyIndex]) + "..."); 
         return(false); 
       }
       localDouble04 = NormalizeDouble(localDouble03 - legacyGlobalInt015 * pipSize,symbolDigits) ;
       localDouble05 = NormalizeDouble((stopLossPips + legacyGlobalDouble064) * pipSize + localDouble03,symbolDigits) ;
       localDouble06 = NormalizeDouble(localDouble03 - takeProfitPips * pipSize,symbolDigits) ;
       if ( lotSizeByStrategy[currentStrategyIndex]<SymbolInfoDouble(currentSymbol,34) )
       {
         Print("Volume is less than the minimal allowed SYMBOL_VOLUME_MIN=" + string(SymbolInfoDouble(currentSymbol,34))); 
         tmpBool13 = false;
       }
       else
       {
         if ( lotSizeByStrategy[currentStrategyIndex]>SymbolInfoDouble(currentSymbol,35) )
         {
           Print("Volume is greater than the maximal allowed SYMBOL_VOLUME_MAX=" + string(SymbolInfoDouble(currentSymbol,35))); 
           tmpBool13 = false;
         }
         else
         {
           if ( MathAbs(NormalizeDouble(lotSizeByStrategy[currentStrategyIndex] / SymbolInfoDouble(currentSymbol,36),0) * SymbolInfoDouble(currentSymbol,36) - lotSizeByStrategy[currentStrategyIndex])>0.0000001 )
           {
             Print("Volume " + string(lotSizeByStrategy[currentStrategyIndex]) + " is not a multiple of the minimal step SYMBOL_VOLUME_STEP=" + string(SymbolInfoDouble(currentSymbol,36))); 
             tmpBool13 = false;
           }
           else
           {
             tmpBool13 = true;
           }
         }
       }

       tmpInt14 = (int)AccountInfoInteger(ACCOUNT_LIMIT_ORDERS);
       if ( tmpInt14 == 0 )
       {
         tmpBool15 = true;
       }
       else
       {
         tmpBool15 = MT4OrdersTotal()<tmpInt14;
       }
       if ( ( !(tmpBool13) || !(tmpBool15) ) )
       {
         return(false); 
       }
       if ( MarketInfo(currentSymbol,MODE_BID)>freezeLevelPriceDistance * pipSize + localDouble04 && MarketInfo(currentSymbol,MODE_BID)>stopLevelPriceDistance * pipSize + localDouble04 )
       {
         if ( !(setSL_TP_After_Entry) )
         {
           legacyGlobalInt230 = OrderSend(currentSymbol,5,lotSizeByStrategy[currentStrategyIndex],localDouble04,int(orderSlippageSetting * pipSize),localDouble05,localDouble06,currentStrategyComment,strategyMagicNumber,legacyGlobalDatetime302,Red) ;
         }
         else
         {
           legacyGlobalInt230 = OrderSend(currentSymbol,5,lotSizeByStrategy[currentStrategyIndex],localDouble04,int(orderSlippageSetting * pipSize),0.0,0.0,currentStrategyComment,strategyMagicNumber,legacyGlobalDatetime302,Red) ;
         }
         legacyGlobalBool281 = false ;
         if ( legacyGlobalInt230 <= 0 )
         {
           tmpInt16 = MT4_LastError();
           if ( tmpInt16 == 132 )
           {
             ResetLastError();
             if(1==0) //条件不成立
             {
               do
               {
                 Sleep(2500); 
                 if ( !(setSL_TP_After_Entry) )
                 {
                   tmpInt16 = (int)(orderSlippageSetting * pipSize);
                   legacyGlobalInt230 = OrderSend(currentSymbol,5,lotSizeByStrategy[currentStrategyIndex],localDouble04,tmpInt16,localDouble05,localDouble06,currentStrategyComment,strategyMagicNumber,legacyGlobalDatetime302,Red) ;
                 }
                 else
                 {
                   legacyGlobalInt230 = OrderSend(currentSymbol,5,lotSizeByStrategy[currentStrategyIndex],localDouble04,int(orderSlippageSetting * pipSize),0.0,0.0,currentStrategyComment,strategyMagicNumber,legacyGlobalDatetime302,Red) ;
                 }
                 legacyGlobalBool281 = false ;
               }
               while(MT4_LastError() == 132);
               
             }
           }
           Print("error: '" + TradeErrorDescription(MT4_LastError()) + "' when setting entry order"); 
         }
         else
         {
           tmpDouble17 = localDouble03;
           tmpLong18 = legacyGlobalInt230;
           for (tmpInt19 = 0 ; tmpInt19 < 100 ; tmpInt19=tmpInt19 + 1)
           {
             if ( !(pendingTicketPriceMap[tmpInt19][0]==0.0) )   continue;
             pendingTicketPriceMap[tmpInt19][0] = (double)tmpLong18;
             pendingTicketPriceMap[tmpInt19][1] = tmpDouble17;
             break;
             
           }
         }
       }
     }
   }
 }
 return(false); 
 }
//lizong_17 <<==--------   --------
 bool ManageBuyTrades()
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
     if ( ( localInt14 == 4 || localInt14 == 2 ) && entryStrategyMode == 2 && ( legacyGlobalInt095 == 0 || (legacyGlobalInt095 == 1 && localString16 == currentSymbol) ) && ( localInt15 == secondaryStrategyMagicNumber || secondaryStrategyMagicNumber == 0 ) && ( localString11 == legacyGlobalString097 || legacyGlobalString097 == "" ) )
     {
       if ( ( localDouble07==0.0 || localDouble07==0.0 ) )
       {
         localDouble07 = NormalizeDouble(localDouble10 - stopLossPips * pipSize,symbolDigits) ;
         OrderModify(localLong09,localDouble10,localDouble07,localDouble08,0,Green); 
       }
       if ( ( localDouble08==0.0 || localDouble08==0.0 ) )
       {
         localDouble08 = NormalizeDouble(takeProfitPips * pipSize + localDouble10,symbolDigits) ;
         OrderModify(localLong09,localDouble10,localDouble07,localDouble08,0,Green); 
       }
     }
     if ( localInt14 == 0 && ( ( localInt15 == strategyMagicNumber && entryStrategyMode == 1 && localString16 == currentSymbol ) || (entryStrategyMode == 2 && ( legacyGlobalInt095 == 0 || (legacyGlobalInt095 == 1 && localString16 == currentSymbol) ) && ( localInt15 == secondaryStrategyMagicNumber || secondaryStrategyMagicNumber == 0 ) && (localString11 == legacyGlobalString097 || legacyGlobalString097 == "")) ) )
     {
       if ( ( localDouble07==0.0 || localDouble07==0.0 ) )
       {
         localDouble07 = NormalizeDouble(localDouble10 - stopLossPips * pipSize,symbolDigits) ;
         OrderModify(localLong09,localDouble10,localDouble07,localDouble08,0,Green); 
       }
       if ( ( localDouble08==0.0 || localDouble08==0.0 ) )
       {
         localDouble08 = NormalizeDouble(takeProfitPips * pipSize + localDouble10,symbolDigits) ;
         OrderModify(localLong09,localDouble10,localDouble07,localDouble08,0,Green); 
       }
       if ( candleExitM1Enabled && iTime(currentSymbol,MT4Period(legacyGlobalInt052),legacyGlobalInt051) <= localDatetime13 && iTime(currentSymbol,MT4Period(legacyGlobalInt052),0) >  localDatetime13 && iClose(currentSymbol,MT4Period(legacyGlobalInt052),1)<iOpen(currentSymbol,MT4Period(legacyGlobalInt052),1) && iClose(currentSymbol,MT4Period(legacyGlobalInt052),1)<localDouble10 )
       {
         OrderClose(localLong09,localDouble12,MarketInfo(currentSymbol,MODE_BID),0,Red); 
         Print("closing candle confirmation"); 
         continue; // ticket da dong: khong OrderModify tiep tren cung position
       }
       if ( candleExitM5Enabled && iTime(currentSymbol,MT4Period(legacyGlobalInt054),legacyGlobalInt051) <= localDatetime13 && iTime(currentSymbol,MT4Period(legacyGlobalInt054),0) >  localDatetime13 && iClose(currentSymbol,MT4Period(legacyGlobalInt054),1)<iOpen(currentSymbol,MT4Period(legacyGlobalInt054),1) && iClose(currentSymbol,MT4Period(legacyGlobalInt054),1)<localDouble10 )
       {
         OrderClose(localLong09,localDouble12,MarketInfo(currentSymbol,MODE_BID),0,Red); 
         Print("closing candle confirmation"); 
         continue; // ticket da dong: khong OrderModify tiep tren cung position
       }
       if ( candleExitM15Enabled && iTime(currentSymbol,MT4Period(legacyGlobalInt056),legacyGlobalInt051) <= localDatetime13 && iTime(currentSymbol,MT4Period(legacyGlobalInt056),0) >  localDatetime13 && iClose(currentSymbol,MT4Period(legacyGlobalInt056),1)<iOpen(currentSymbol,MT4Period(legacyGlobalInt056),1) && iClose(currentSymbol,MT4Period(legacyGlobalInt056),1)<localDouble10 )
       {
         OrderClose(localLong09,localDouble12,MarketInfo(currentSymbol,MODE_BID),0,Red); 
         Print("closing candle confirmation"); 
         continue; // ticket da dong: khong OrderModify tiep tren cung position
       }
       if ( candleExitM30Enabled && iTime(currentSymbol,MT4Period(legacyGlobalInt058),legacyGlobalInt051) <= localDatetime13 && iTime(currentSymbol,MT4Period(legacyGlobalInt058),0) >  localDatetime13 && iClose(currentSymbol,MT4Period(legacyGlobalInt058),1)<iOpen(currentSymbol,MT4Period(legacyGlobalInt058),1) && iClose(currentSymbol,MT4Period(legacyGlobalInt058),1)<localDouble10 )
       {
         OrderClose(localLong09,localDouble12,MarketInfo(currentSymbol,MODE_BID),0,Red); 
         Print("closing candle confirmation"); 
         continue; // ticket da dong: khong OrderModify tiep tren cung position
       }
       if ( candleExitH1Enabled && iTime(currentSymbol,MT4Period(legacyGlobalInt060),legacyGlobalInt051) <= localDatetime13 && iTime(currentSymbol,MT4Period(legacyGlobalInt060),0) >  localDatetime13 && iClose(currentSymbol,MT4Period(legacyGlobalInt060),1)<iOpen(currentSymbol,MT4Period(legacyGlobalInt060),1) && iClose(currentSymbol,MT4Period(legacyGlobalInt060),1)<localDouble10 )
       {
         OrderClose(localLong09,localDouble12,MarketInfo(currentSymbol,MODE_BID),0,Red); 
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
       localDouble18 = localDouble10 - localDouble17 ;
       localBool19 = false ;
       if ( localDouble17>0.0 - requestedEntryAdjustmentPips * pipSize && localDouble18>orderSlippageSetting * pipSize )
       {
         localBool19 = true ;
         if ( legacyGlobalInt039 == 2 )
         {
           legacyGlobalDouble247 = -1000.0 ;
           Print("SlippageMode 2 active"); 
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
       if ( MarketInfo(currentSymbol,MODE_BID)<localDouble10 - (stopLossPips + legacyGlobalDouble064) * pipSize - currentSpreadPrice )
       {
         RefreshRates(); 
         OrderClose(OrderTicket(),OrderLots(),MarketInfo(currentSymbol,MODE_BID),(int)currentSpreadPrice,Red); 
         return(true); 
       }
       localBool20 = false ;
       if ( legacyGlobalBool159 )
       {
         tmpLong08 = localLong09;
         tmpInt09 = 0;
         for (tmpInt10 = MT4OrdersTotal() ; tmpInt10 >= 0 ; tmpInt10=tmpInt10 - 1)
         {
           if ( OrderSelect(tmpInt10,0,0) != true || OrderMagicNumber() != legacyGlobalInt168 || OrderSymbol() != currentSymbol )   continue;
           tmpString11 = OrderComment();
           if ( tmpString11 != IntegerToString(tmpLong08,0,32) )   continue;
           tmpInt09=tmpInt09 + 1;
           
         }
         localDouble21 = tmpInt09 ;
         localBool22 = false ;
         if ( !(buyZoneStateInitialized) )
         {
           buyZoneStateInitialized = true ;
           legacyGlobalInt192 = 0 ;
         }
         if ( localDouble21==0.0 )
         {
           legacyGlobalInt192 = 0 ;
         }
         if ( MathFloor(localDouble21 / 2.0)==localDouble21 / 2.0 )
         {
           legacyGlobalInt192 = 0 ;
         }
         else
         {
           legacyGlobalInt192 = 1 ;
         }
         if ( buyZoneStateInitialized )
         {
           if ( localDouble21>0.0 )
           {
             tmpDouble12 = AccountEquity();
             if ( tmpDouble12>AccountBalance() + zoneRecoveryProfitTarget )
             {
               for (tmpInt13 = MT4OrdersTotal() ; tmpInt13 >= 0 ; tmpInt13=tmpInt13 - 1)
               {
                 if ( OrderSelect(tmpInt13,0,0) != true )   continue;
                 
                 if ( ( OrderMagicNumber() != strategyMagicNumber && OrderMagicNumber() != legacyGlobalInt169 && OrderMagicNumber() != legacyGlobalInt168 ) )   continue;
                 
                 if ( OrderType() == 0 )
                 {
                   OrderClose(OrderTicket(),OrderLots(),MarketInfo(currentSymbol,MODE_BID),(int)orderSlippageSetting,Red); 
                 }
                 if ( OrderType() != 1 )   continue;
                 OrderClose(OrderTicket(),OrderLots(),MarketInfo(currentSymbol,MODE_ASK),(int)orderSlippageSetting,Red); 
                 
               }
             }
           }
           if ( localDouble21>0.0 )
           {
             tmpLong14 = localLong09;
             tmpDouble15 = 0.0;
             for (tmpInt16 = MT4OrdersTotal() ; tmpInt16 >= 0 ; tmpInt16=tmpInt16 - 1)
             {
               if ( OrderSelect(tmpInt16,0,0) != true )   continue;
               tmpLong17 = OrderTicket();
               if ( tmpLong17 != tmpLong14 )
               {
                 tmpString11 = OrderComment();
               if ( tmpString11 != IntegerToString(tmpLong14,0,32) )   continue;
