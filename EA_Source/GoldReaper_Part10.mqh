             legacyGlobalBool280 = false ;
             tmpDouble04 = storedPendingOrders[localInt01][0];
             tmpLong05 = legacyGlobalInt230;
             for (tmpInt06 = 0 ; tmpInt06 < 100 ; tmpInt06=tmpInt06 + 1)
             {
               if ( !(pendingTicketPriceMap[tmpInt06][0]==0.0) )   continue;
               pendingTicketPriceMap[tmpInt06][0] = (double)tmpLong05;
               pendingTicketPriceMap[tmpInt06][1] = tmpDouble04;
               break;
               
             }
           }
           while(MT4_LastError() == 132);
           
         }
       }
       Print("error: '" + TradeErrorDescription(MT4_LastError()) + "' when setting entry order"); 
     }
   }
   if ( !(storedPendingOrders[localInt01][1]==5.0) || !(MarketInfo(currentSymbol,MODE_BID)>storedPendingOrders[localInt01][0] + stopLevelPriceDistance) )   continue;
   Print("Restoring pending sell-order"); 
   legacyGlobalInt230 = OrderSend(currentSymbol,5,storedPendingOrders[localInt01][2],storedPendingOrders[localInt01][0],int(orderSlippageSetting * pipSize),(stopLossPips + legacyGlobalDouble064) * pipSize + storedPendingOrders[localInt01][0],storedPendingOrders[localInt01][0] - takeProfitPips * pipSize,currentStrategyComment,strategyMagicNumber,legacyGlobalDatetime302 + 0x2A300,Green) ;
   legacyGlobalBool281 = false ;
   tmpDouble07 = storedPendingOrders[localInt01][0];
   tmpLong08 = legacyGlobalInt230;
   for (tmpInt09 = 0 ; tmpInt09 < 100 ; tmpInt09=tmpInt09 + 1)
   {
     if ( !(pendingTicketPriceMap[tmpInt09][0]==0.0) )   continue;
     pendingTicketPriceMap[tmpInt09][0] = (double)tmpLong08;
     pendingTicketPriceMap[tmpInt09][1] = tmpDouble07;
     break;
     
   }
   if ( legacyGlobalInt230 > 0 )   continue;
   
   if ( MT4_LastError() == 132 )
   {
     ResetLastError();
     if(1==0) //条件不成立
     {
       do
       {
         Sleep(2500); 
         legacyGlobalInt230 = OrderSend(currentSymbol,5,storedPendingOrders[localInt01][2],storedPendingOrders[localInt01][0],int(orderSlippageSetting * pipSize),(stopLossPips + legacyGlobalDouble064) * pipSize + storedPendingOrders[localInt01][0],storedPendingOrders[localInt01][0] - takeProfitPips * pipSize,currentStrategyComment,strategyMagicNumber,legacyGlobalDatetime302 + 0x2A300,Green) ;
         legacyGlobalBool281 = false ;
         tmpDouble10 = storedPendingOrders[localInt01][0];
         tmpLong11 = legacyGlobalInt230;
         for (tmpInt12 = 0 ; tmpInt12 < 100 ; tmpInt12=tmpInt12 + 1)
         {
           if ( !(pendingTicketPriceMap[tmpInt12][0]==0.0) )   continue;
           pendingTicketPriceMap[tmpInt12][0] = (double)tmpLong11;
           pendingTicketPriceMap[tmpInt12][1] = tmpDouble10;
           break;
           
         }
       }
       while(MT4_LastError() == 132);
       
     }
   }
   Print("error: '" + TradeErrorDescription(MT4_LastError()) + "' when setting entry order"); 
   
 }
 for (tmpInt13 = 0 ; tmpInt13 < orderBufferCapacity ; tmpInt13=tmpInt13 + 1)
 {
   storedPendingOrders[tmpInt13][0] = 0.0;
   storedPendingOrders[tmpInt13][1] = 0.0;
   storedPendingOrders[tmpInt13][2] = 0.0;
 }
 }
//lizong_8 <<==--------   --------
 bool SuspendPendingOrdersOnHighSpread()
 {
  int       localInt02;
  int       localInt03;
  int       localInt04;
//----- -----
 long       tmpLong01;
 int        tmpInt02;
 long       tmpLong03;
 int        tmpInt04;
 double     tmpDouble05;
 double     tmpDouble06;
 long       tmpLong07;
 int        tmpInt08;
 long       tmpLong09;
 int        tmpInt10;

 for (localInt02 = MT4OrdersTotal() ; localInt02 >= 0 ; localInt02 --)
 {
   if ( OrderSelect(localInt02,0,0) != true )   continue;
   
   if ( ( OrderMagicNumber() != strategyMagicNumber && OrderMagicNumber() != secondaryStrategyMagicNumber ) || OrderSymbol() != currentSymbol )   continue;
   
   if ( OrderType() == 4 && OrderOpenPrice()<legacyGlobalInt036 * pipSize + MarketInfo(currentSymbol,MODE_ASK) && MarketInfo(currentSymbol,MODE_ASK)<OrderOpenPrice() - freezeLevelPriceDistance )
   {
     if ( maxSpreadPips>0.0 )
     {
       Print("Spread too high..(" + string(currentSpreadPrice) + ") storing and deleting order " + string(OrderTicket())); 
       for (localInt03 = 0 ; localInt03 < orderBufferCapacity ; localInt03 ++)
       {
         if ( storedPendingOrders[localInt03][0]==0.0 )
         {
           Print("Storing pending order nr " + string(OrderTicket())); 
           storedPendingOrders[localInt03][1] = OrderType();
           storedPendingOrders[localInt03][0] = OrderOpenPrice();
           storedPendingOrders[localInt03][2] = OrderLots();
           break;
         }
       }
       tmpLong01 = OrderTicket();
       for (tmpInt02 = 0 ; tmpInt02 < 100 ; tmpInt02=tmpInt02 + 1)
       {
         if ( !(pendingTicketPriceMap[tmpInt02][0]==tmpLong01) )   continue;
         pendingTicketPriceMap[tmpInt02][0] = 0.0;
         pendingTicketPriceMap[tmpInt02][1] = 0.0;
         break;
         
       }
       OrderDelete(OrderTicket(),Green); 
     }
     else
     {
       Print("Spread too high..(" + string(currentSpreadPrice) + ") deleting order " + string(OrderTicket())); 
       tmpLong03 = OrderTicket();
       for (tmpInt04 = 0 ; tmpInt04 < 100 ; tmpInt04=tmpInt04 + 1)
       {
         if ( !(pendingTicketPriceMap[tmpInt04][0]==tmpLong03) )   continue;
         pendingTicketPriceMap[tmpInt04][0] = 0.0;
         pendingTicketPriceMap[tmpInt04][1] = 0.0;
         break;
         
       }
       OrderDelete(OrderTicket(),Green); 
     }
   }
   if ( OrderType() != 5 )   continue;
   tmpDouble05 = OrderOpenPrice();
   if ( !(tmpDouble05>MarketInfo(currentSymbol,MODE_BID) - legacyGlobalInt036 * pipSize) )   continue;
   tmpDouble06 = MarketInfo(currentSymbol,MODE_BID);
   if ( !(tmpDouble06>OrderOpenPrice() + freezeLevelPriceDistance) )   continue;
   
   if ( maxSpreadPips>0.0 )
   {
     Print("Spread too high..(" + string(currentSpreadPrice) + ") storing and deleting order " + string(OrderTicket())); 
     for (localInt04 = 0 ; localInt04 < orderBufferCapacity ; localInt04 ++)
     {
       if ( storedPendingOrders[localInt04][0]==0.0 )
       {
         Print("Storing pending order nr " + string(OrderTicket())); 
         storedPendingOrders[localInt04][1] = OrderType();
         storedPendingOrders[localInt04][0] = OrderOpenPrice();
         storedPendingOrders[localInt04][2] = OrderLots();
         break;
       }
     }
     tmpLong07 = OrderTicket();
     for (tmpInt08 = 0 ; tmpInt08 < 100 ; tmpInt08=tmpInt08 + 1)
     {
       if ( !(pendingTicketPriceMap[tmpInt08][0]==tmpLong07) )   continue;
       pendingTicketPriceMap[tmpInt08][0] = 0.0;
       pendingTicketPriceMap[tmpInt08][1] = 0.0;
       break;
       
     }
     OrderDelete(OrderTicket(),Green); 
      continue;
   }
   Print("Spread too high..(" + string(currentSpreadPrice) + ") deleting order " + string(OrderTicket())); 
   tmpLong09 = OrderTicket();
   for (tmpInt10 = 0 ; tmpInt10 < 100 ; tmpInt10=tmpInt10 + 1)
   {
     if ( !(pendingTicketPriceMap[tmpInt10][0]==tmpLong09) )   continue;
     pendingTicketPriceMap[tmpInt10][0] = 0.0;
     pendingTicketPriceMap[tmpInt10][1] = 0.0;
     break;
     
   }
   OrderDelete(OrderTicket(),Green); 
   
 }
 return(false); 
 }
//lizong_9 <<==--------   --------
 void CalculateStrategyLotSize( double argDouble00,int argInt01)
 {
  double    localDouble01;
  double    localDouble02;
  double    localDouble03;
  double    localDouble04;
  double    localDouble05;
  double    localDouble06;
  double    localDouble07;
//----- -----

 localDouble01 = lotSizeByStrategy[currentStrategyIndex] ;
 localDouble02 = lotSizeByStrategy[currentStrategyIndex] ;
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
 localDouble03 = argDouble00 ;
 if ( ( symbolDigits == 2 || symbolDigits == 4 ) )
 {
   localDouble03 = argDouble00 / 10.0 ;
 }
 if ( Risk <  999 && Risk >  0 )
 {
   localDouble04 = Risk ;
   localDouble05 = localDouble04 / 1000.0 * currentBalanceBasis ;
   if ( MarketInfo(currentSymbol,MODE_LOTSTEP)==0.1 )
   {
     localDouble02 = NormalizeDouble(argInt01 * 0.01 * (localDouble05 / (MarketInfo(currentSymbol,MODE_TICKVALUE) * localDouble03) * 0.1),1) ;
   }
   if ( MarketInfo(currentSymbol,MODE_LOTSTEP)==0.01 )
   {
     localDouble02 = NormalizeDouble(argInt01 * 0.01 * (localDouble05 / (MarketInfo(currentSymbol,MODE_TICKVALUE) * localDouble03) * 0.1),2) ;
   }
 }
 if ( Risk == 999 )
 {
   localDouble06 = fixedRiskPercent / 100.0 * currentBalanceBasis ;
   if ( MarketInfo(currentSymbol,MODE_LOTSTEP)==0.1 )
   {
     localDouble02 = NormalizeDouble(argInt01 * 0.01 * (localDouble06 / (MarketInfo(currentSymbol,MODE_TICKVALUE) * localDouble03) * 0.1),1) ;
   }
   if ( MarketInfo(currentSymbol,MODE_LOTSTEP)==0.01 )
   {
     localDouble02 = NormalizeDouble(argInt01 * 0.01 * (localDouble06 / (MarketInfo(currentSymbol,MODE_TICKVALUE) * localDouble03) * 0.1),2) ;
   }
 }
 if ( Risk == 0 )
 {
   if ( MarketInfo(currentSymbol,MODE_LOTSTEP)==0.1 )
   {
     localDouble02 = NormalizeDouble(argInt01 * 0.01 * g_startLots_rw,1) ;
   }
   if ( MarketInfo(currentSymbol,MODE_LOTSTEP)==0.01 )
   {
     localDouble02 = NormalizeDouble(argInt01 * 0.01 * g_startLots_rw,2) ;
   }
 }
 if ( Risk == 9999 )
 {
   if ( MarketInfo(currentSymbol,MODE_LOTSTEP)==0.1 )
   {
     localDouble02 = NormalizeDouble(argInt01 * 0.01 * (currentBalanceBasis / lotSizingBalanceDivisor * 0.01),1) ;
   }
   if ( MarketInfo(currentSymbol,MODE_LOTSTEP)==0.01 )
   {
     localDouble02 = NormalizeDouble(argInt01 * 0.01 * (currentBalanceBasis / lotSizingBalanceDivisor * 0.01),2) ;
   }
 }
 if ( Risk == 1234 )
 {
   if ( UseWeightedLots )
   {
     if ( legacyGlobalDouble397==0.0 )
     {
       legacyGlobalDouble397 = 100000.0 ;
     }
     weightedRiskPercentPerStrategy = MaxAllowedDD / legacyGlobalDouble398 ;
     if ( SymbolInfoDouble(currentSymbol,36)==0.1 )
     {
       localDouble02 = NormalizeDouble(weightedRiskPercentPerStrategy / legacyGlobalDouble397 * currentBalanceBasis / 100.0 * 0.01,1) ;
     }
     if ( SymbolInfoDouble(currentSymbol,36)==0.01 )
     {
       localDouble02 = NormalizeDouble(weightedRiskPercentPerStrategy / legacyGlobalDouble397 * currentBalanceBasis / 100.0 * 0.01,2) ;
     }
   }
   else
   {
     if ( legacyGlobalDouble397==0.0 )
     {
       legacyGlobalDouble397 = 100000.0 ;
     }
     localDouble07 = ConvertAccountCurrencyToUsdRounded(currentBalanceBasis) ;
     if ( activeTradeFrequency == 0 )
     {
       lotSizingBalanceDivisor = (int)(autoFrequencyThreshold1 / (MaxAllowedDD / 100.0)) ;
     }
     if ( activeTradeFrequency == 1 )
     {
       lotSizingBalanceDivisor = (int)(autoFrequencyThreshold2 / (MaxAllowedDD / 100.0)) ;
     }
     if ( activeTradeFrequency == 2 )
     {
       lotSizingBalanceDivisor = (int)(autoFrequencyThreshold3 / (MaxAllowedDD / 100.0)) ;
     }
     if ( activeTradeFrequency == 3 )
     {
       lotSizingBalanceDivisor = (int)(autoFrequencyThreshold4 / (MaxAllowedDD / 100.0)) ;
     }
     if ( activeTradeFrequency == 4 )
     {
       lotSizingBalanceDivisor = (int)(autoFrequencyThreshold5 / (MaxAllowedDD / 100.0)) ;
     }
     if ( SymbolInfoDouble(currentSymbol,36)==0.1 )
     {
       localDouble02 = NormalizeDouble(argInt01 * 0.01 * (localDouble07 / lotSizingBalanceDivisor * 0.01),1) ;
     }
     if ( SymbolInfoDouble(currentSymbol,36)==0.01 )
     {
       localDouble02 = NormalizeDouble(argInt01 * 0.01 * (localDouble07 / lotSizingBalanceDivisor * 0.01),2) ;
     }
   }
 }
 if ( Risk == 3 )
 {
   if ( SymbolInfoDouble(currentSymbol,36)==0.1 )
   {
     localDouble02 = NormalizeDouble(MaxRiskPerStrategy_ / legacyGlobalDouble397 * currentBalanceBasis / 100.0 * 0.01,1) ;
   }
   if ( SymbolInfoDouble(currentSymbol,36)==0.01 )
   {
     localDouble02 = NormalizeDouble(MaxRiskPerStrategy_ / legacyGlobalDouble397 * currentBalanceBasis / 100.0 * 0.01,2) ;
   }
 }
 localDouble02 = localDouble02 * variableLotInverseScaleFactor ;
 if ( localDouble02<MarketInfo(currentSymbol,MODE_LOTSTEP) )
 {
   localDouble02 = MarketInfo(currentSymbol,MODE_LOTSTEP) ;
 }
 if ( localDouble02>maxCalculatedLotSize )
 {
   localDouble02 = maxCalculatedLotSize ;
 }
 if ( localDouble02<MarketInfo(currentSymbol,MODE_MINLOT) )
 {
   localDouble02 = MarketInfo(currentSymbol,MODE_MINLOT) ;
 }
 if ( localDouble02>MarketInfo(currentSymbol,MODE_MAXLOT) && MarketInfo(currentSymbol,MODE_MAXLOT)!=0.0 )
 {
   localDouble02 = MarketInfo(currentSymbol,MODE_MAXLOT) ;
 }
 if ( MarketInfo(currentSymbol,MODE_LOTSTEP)==0.1 )
 {
   lotSizeByStrategy[currentStrategyIndex] = NormalizeDouble((MathFloor(localDouble02 * 10.0)) / 10.0,1);
   return;
 }
 lotSizeByStrategy[currentStrategyIndex] = NormalizeDouble(MathFloor(localDouble02 * 100.0) / 100.0,2);
 }
//lizong_10 <<==--------   --------
 double CalculateBuyEntryPrice( int argInt00)
 {
  bool      localBool02 = false;
  bool      localBool03 = false;
  bool      localBool04;
  int       localInt05;
  int       localInt06;
  int       localInt07;
//----- -----
 double     tmpDouble01;
 int        tmpInt02;
 double     tmpDouble03;
 int        tmpInt04;
 double     tmpDouble05;
 int        tmpInt06;
 bool       tmpBool07;

 localBool04 = false ;
 localInt05=legacyGlobalInt074 + 1;
 do
 {
   localBool03 = true ;
   localBool04 = true ;
   for (localInt06 = localInt05 ; localInt06 >= localInt05 - legacyGlobalInt074 ; localInt06 --)
   {
     if ( iHigh(currentSymbol,MT4Period(argInt00),localInt06)>iHigh(currentSymbol,MT4Period(argInt00),localInt05) )
     {
       localBool04 = false ;
     }
   }
   for (localInt07 = localInt05 ; localInt07 <= localInt05 + legacyGlobalInt073 ; localInt07 ++)
   {
     if ( iHigh(currentSymbol,MT4Period(argInt00),localInt07)>iHigh(currentSymbol,MT4Period(argInt00),localInt05) )
     {
       localBool03 = false ;
     }
   }
   if ( localBool04 && localBool03 && iHigh(currentSymbol,MT4Period(argInt00),localInt05)>legacyGlobalDouble080 * pipSize + MarketInfo(currentSymbol,MODE_ASK) )
   {
     tmpDouble01 = iHigh(currentSymbol,MT4Period(argInt00),localInt05);
     tmpInt02 = localInt05;
     tmpDouble03 = iHigh(currentSymbol,MT4Period(entryTimeframeMinutes),0);
     for (tmpInt04 = 1 ; tmpInt04 <= tmpInt02 ; tmpInt04=tmpInt04 + 1)
     {
       if ( iHigh(currentSymbol,MT4Period(entryTimeframeMinutes),tmpInt04)>tmpDouble03 )
       {
         tmpDouble03 = iHigh(currentSymbol,MT4Period(entryTimeframeMinutes),tmpInt04);
       }
     }
     if ( tmpDouble01>=tmpDouble03 )
     {
       tmpDouble05 = NormalizeDouble(iHigh(currentSymbol,MT4Period(argInt00),localInt05),symbolDigits);
       tmpBool07=false; 
       for (tmpInt06 = MT4OrdersTotal() ; tmpInt06 >= 0 ; tmpInt06=tmpInt06 - 1)
       {
         if ( OrderSelect(tmpInt06,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 4 || !(MathAbs(OrderOpenPrice() - (buyPendingEntryOffsetPips * pipSize + tmpDouble05))<duplicatePendingTolerancePips * pipSize) )   continue;
         tmpBool07 = true;
          break;
         
       }
       if ( !(tmpBool07) && ( !(fakeoutConfirmationEnabled) || !(iClose(currentSymbol,MT4Period(argInt00),localInt05 - 1)>iHigh(currentSymbol,MT4Period(argInt00),localInt05) - legacyGlobalDouble080 * pipSize) ) )
       {
         localBool02 = true ;
         buyEntryPrice = NormalizeDouble(iHigh(currentSymbol,MT4Period(argInt00),localInt05),symbolDigits) ;
         legacyGlobalInt265 = localInt05 ;
         break;
       }
     }
   }
   localInt05 ++;
   if ( localInt05 <= legacyGlobalInt077 )   continue;
   buyEntryPrice = 0.0 ;
   break;
   
 }
 while(!(localBool02));
 
 return(buyEntryPrice); 
 }
//lizong_11 <<==--------   --------
 double CalculateSellEntryPrice( int argInt00)
 {
  bool      localBool02 = false;
  bool      localBool03 = false;
  bool      localBool04;
  int       localInt05;
  int       localInt06;
  int       localInt07;
//----- -----
 double     tmpDouble01;
 int        tmpInt02;
 double     tmpDouble03;
 int        tmpInt04;
 double     tmpDouble05;
 int        tmpInt06;
 bool       tmpBool07;

 localBool04 = false ;
 localInt05=legacyGlobalInt074 + 1;
 do
 {
   localBool03 = true ;
   localBool04 = true ;
   for (localInt06 = localInt05 ; localInt06 >= localInt05 - legacyGlobalInt074 ; localInt06 --)
   {
     if ( iLow(currentSymbol,MT4Period(argInt00),localInt06)<iLow(currentSymbol,MT4Period(argInt00),localInt05) )
     {
       localBool04 = false ;
     }
   }
   for (localInt07 = localInt05 ; localInt07 <= localInt05 + legacyGlobalInt073 ; localInt07 ++)
   {
     if ( iLow(currentSymbol,MT4Period(argInt00),localInt07)<iLow(currentSymbol,MT4Period(argInt00),localInt05) )
     {
       localBool03 = false ;
     }
   }
   if ( localBool04 && localBool03 && iLow(currentSymbol,MT4Period(argInt00),localInt05)<MarketInfo(currentSymbol,MODE_BID) - legacyGlobalDouble080 * pipSize )
   {
     tmpDouble01 = iLow(currentSymbol,MT4Period(argInt00),localInt05);
     tmpInt02 = localInt05;
     tmpDouble03 = iLow(currentSymbol,MT4Period(entryTimeframeMinutes),0);
     for (tmpInt04 = 1 ; tmpInt04 <= tmpInt02 ; tmpInt04=tmpInt04 + 1)
     {
       if ( iLow(currentSymbol,MT4Period(entryTimeframeMinutes),tmpInt04)<tmpDouble03 )
       {
         tmpDouble03 = iLow(currentSymbol,MT4Period(entryTimeframeMinutes),tmpInt04);
       }
     }
     if ( tmpDouble01<=tmpDouble03 )
     {
       tmpDouble05 = NormalizeDouble(iLow(currentSymbol,MT4Period(argInt00),localInt05),symbolDigits);
       tmpBool07=false; 
       for (tmpInt06 = MT4OrdersTotal() ; tmpInt06 >= 0 ; tmpInt06=tmpInt06 - 1)
