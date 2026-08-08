       {
         if ( OrderSelect(tmpInt06,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 5 || !(MathAbs(OrderOpenPrice() - (tmpDouble05 - sellPendingEntryOffsetPips * pipSize))<duplicatePendingTolerancePips * pipSize) )   continue;
         tmpBool07 = true;
          break;
         
       }
       if ( !(tmpBool07) && ( !(fakeoutConfirmationEnabled) || !(iClose(currentSymbol,MT4Period(argInt00),localInt05 - 1)<legacyGlobalDouble080 * pipSize + iLow(currentSymbol,MT4Period(argInt00),localInt05)) ) )
       {
         localBool02 = true ;
         sellEntryPrice = NormalizeDouble(iLow(currentSymbol,MT4Period(argInt00),localInt05),symbolDigits) ;
         legacyGlobalInt266 = localInt05 ;
         break;
       }
     }
   }
   localInt05 ++;
   if ( localInt05 <= legacyGlobalInt077 )   continue;
   sellEntryPrice = 0.0 ;
   break;
   
 }
 while(!(localBool02));
 
 return(sellEntryPrice); 
 }
//lizong_12 <<==--------   --------
 double FindConfirmedSwingHigh( int argInt00,int argInt01,int argInt02)
 {
  bool      localBool02 = false;
  double    localDouble03 = 0.0;
  bool      localBool04 = false;
  bool      localBool05;
  int       localInt06;
  int       localInt07;
  int       localInt08;
//----- -----

 localBool05 = false ;
 localInt06=argInt02 + 1;
 do
 {
   localBool04 = true ;
   localBool05 = true ;
   for (localInt07 = localInt06 ; localInt07 >= localInt06 - argInt02 ; localInt07 --)
   {
     if ( iHigh(currentSymbol,MT4Period(argInt00),localInt07)>iHigh(currentSymbol,MT4Period(argInt00),localInt06) )
     {
       localBool05 = false ;
     }
   }
   for (localInt08 = localInt06 ; localInt08 <= localInt06 + argInt01 ; localInt08 ++)
   {
     if ( iHigh(currentSymbol,MT4Period(argInt00),localInt08)>iHigh(currentSymbol,MT4Period(argInt00),localInt06) )
     {
       localBool04 = false ;
     }
   }
   if ( localBool05 && localBool04 && iHigh(currentSymbol,MT4Period(argInt00),localInt06)>stopLevelPriceDistance * pipSize + MarketInfo(currentSymbol,MODE_ASK) )
   {
     localBool02 = true ;
     localDouble03 = NormalizeDouble(iHigh(currentSymbol,MT4Period(argInt00),localInt06),symbolDigits) ;
     break;
   }
   localInt06 ++;
   if ( localInt06 <= legacyGlobalInt118 )   continue;
   localDouble03 = 9999.0 ;
   break;
   
 }
 while(!(localBool02));
 
 return(localDouble03); 
 }
//lizong_13 <<==--------   --------
 double FindConfirmedSwingLow( int argInt00,int argInt01,int argInt02)
 {
  bool      localBool02 = false;
  double    localDouble03 = 0.0;
  bool      localBool04 = false;
  bool      localBool05;
  int       localInt06;
  int       localInt07;
  int       localInt08;
//----- -----

 localBool05 = false ;
 localInt06=argInt02 + 1;
 do
 {
   localBool04 = true ;
   localBool05 = true ;
   for (localInt07 = localInt06 ; localInt07 >= localInt06 - argInt02 ; localInt07 --)
   {
     if ( iLow(currentSymbol,MT4Period(argInt00),localInt07)<iLow(currentSymbol,MT4Period(argInt00),localInt06) )
     {
       localBool05 = false ;
     }
   }
   for (localInt08 = localInt06 ; localInt08 <= localInt06 + argInt01 ; localInt08 ++)
   {
     if ( iLow(currentSymbol,MT4Period(argInt00),localInt08)<iLow(currentSymbol,MT4Period(argInt00),localInt06) )
     {
       localBool04 = false ;
     }
   }
   if ( localBool05 && localBool04 && iLow(currentSymbol,MT4Period(argInt00),localInt06)<MarketInfo(currentSymbol,MODE_BID) - stopLevelPriceDistance * pipSize )
   {
     localBool02 = true ;
     localDouble03 = NormalizeDouble(iLow(currentSymbol,MT4Period(argInt00),localInt06),symbolDigits) ;
     break;
   }
   localInt06 ++;
   if ( localInt06 <= legacyGlobalInt118 )   continue;
   localDouble03 = 0.0 ;
   break;
   
 }
 while(!(localBool02));
 
 return(localDouble03); 
 }
//lizong_14 <<==--------   --------
 void ManagePendingEntryOrders()
 {
  int       localInt01;
//----- -----
 long       tmpLong01;
 long       tmpLong02;
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

 if ( movingAverageTrendFilterEnabled )
 {
   fastMovingAverageValue = iMA(currentSymbol,0,legacyGlobalInt214,0,1,0,1) ;
   slowMovingAverageValue = iMA(currentSymbol,0,legacyGlobalInt217,0,1,0,1) ;
 }
 CalculateStrategyLotSize(stopLossPips,lotSizePercentMultiplier); 
 if ( lotSizeByStrategy[currentStrategyIndex]>maxCalculatedLotSize )
 {
   lotSizeByStrategy[currentStrategyIndex] = maxCalculatedLotSize;
 }
 if ( pendingExpirationEnabledValue >  0 )
 {
   legacyGlobalDatetime302=TimeCurrent() + pendingExpirationSeconds;
 }
 if ( Virtual_expiration )
 {
   legacyGlobalDatetime302 = 0 ;
   for (localInt01 = MT4OrdersTotal() ; localInt01 >= 0 ; localInt01 --)
   {
     if ( OrderSelect(localInt01,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol )   continue;
     
     if ( ( OrderType() != 4 && OrderType() != 5 ) )   continue;
     tmpLong01 = TimeCurrent();
     tmpLong02=OrderOpenTime() + pendingExpirationSeconds;
     if ( tmpLong01 < tmpLong02 )   continue;
     OrderDelete(OrderTicket(),Red); 
     
   }
 }
 tmpInt03 = 0;
 for (tmpInt04 = MT4OrdersTotal() ; tmpInt04 >= 0 ; tmpInt04=tmpInt04 - 1)
 {
   if ( OrderSelect(tmpInt04,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 0 )   continue;
   tmpInt03=tmpInt03 + 1;
   
 }
 if ( tmpInt03 <  maxOpenTradesPerSide )
 {
   PlaceBuyStopEntry(1); 
 }
 else
 {
   tmpInt05 = 1;
   for (tmpInt06 = MT4OrdersTotal() ; tmpInt06 >= 0 ; tmpInt06=tmpInt06 - 1)
   {
     if ( OrderSelect(tmpInt06,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 4 )   continue;
     OrderDelete(OrderTicket(),0xFFFFFFFF); 
     
   }
   if ( tmpInt05 == 2 )
   {
     for (tmpInt07 = MT4OrdersTotal() ; tmpInt07 >= 0 ; tmpInt07=tmpInt07 - 1)
     {
       if ( OrderSelect(tmpInt07,0,0) != true || OrderMagicNumber() != secondaryStrategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 4 )   continue;
       OrderDelete(OrderTicket(),0xFFFFFFFF); 
       
     }
   }
 }
 tmpInt08 = 0;
 for (tmpInt09 = MT4OrdersTotal() ; tmpInt09 >= 0 ; tmpInt09=tmpInt09 - 1)
 {
   if ( OrderSelect(tmpInt09,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 1 )   continue;
   tmpInt08=tmpInt08 + 1;
   
 }
 if ( tmpInt08 <  maxOpenTradesPerSide )
 {
   PlaceSellStopEntry(1); 
   return;
 }
 tmpInt10 = 1;
 for (tmpInt11 = MT4OrdersTotal() ; tmpInt11 >= 0 ; tmpInt11=tmpInt11 - 1)
 {
   if ( OrderSelect(tmpInt11,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 5 )   continue;
   OrderDelete(OrderTicket(),0xFFFFFFFF); 
   
 }
 if ( tmpInt10 != 2 )   return;
 for (tmpInt12 = MT4OrdersTotal() ; tmpInt12 >= 0 ; tmpInt12=tmpInt12 - 1)
 {
   if ( OrderSelect(tmpInt12,0,0) != true || OrderMagicNumber() != secondaryStrategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 5 )   continue;
   OrderDelete(OrderTicket(),0xFFFFFFFF); 
   
 }
 }
//lizong_15 <<==--------   --------
 bool PlaceBuyStopEntry( int argInt00)
 {
  bool      localBool02;
  double    localDouble03;
  double    localDouble04;
  double    localDouble05;
  double    localDouble06;
//----- -----
 bool       tmpBool01;
 int        tmpInt02;
 double     tmpDouble03;
 int        tmpInt04;
 bool       tmpBool05;
 int        tmpInt06;
 int        tmpInt07;
 double     tmpDouble08;
 int        tmpInt09;
 double     tmpDouble10;
 int        tmpInt11;
 bool       tmpBool12;
 bool       tmpBool13;
 int        tmpInt14;
 bool       tmpBool15;
 int        tmpInt16;
 double     tmpDouble17;
 long       tmpLong18;
 int        tmpInt19;

 if ( !(AllowBuyTrades) )
 {
   return(false); 
 }
 if ( allowMultipleOpenTradesPerSide )
 {
   tmpBool01 = false;
 }
 else
 {
   tmpBool01=false; 
   for (tmpInt02 = 0 ; tmpInt02 < MT4OrdersTotal() ; tmpInt02=tmpInt02 + 1)
   {
     if ( OrderSelect(tmpInt02,0,0) != true || OrderType() != 0 || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol )   continue;
     tmpBool01 = true;
      break;
     
   }
 }
 if ( tmpBool01 == true )
 {
   return(false); 
 }
 if ( movingAverageTrendFilterEnabled && fastMovingAverageValue<slowMovingAverageValue )
 {
   return(false); 
 }
 if ( argInt00 == 1 )
 {
   CalculateBuyEntryPrice(entryTimeframeMinutes); 
   localBool02 = false ;
   tmpDouble03 = buyEntryPrice;
   tmpBool05=false; 
   for (tmpInt04 = MT4OrdersTotal() ; tmpInt04 >= 0 ; tmpInt04=tmpInt04 - 1)
   {
     if ( OrderSelect(tmpInt04,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 4 || !(MathAbs(OrderOpenPrice() - (buyPendingEntryOffsetPips * pipSize + tmpDouble03))<duplicatePendingTolerancePips * pipSize) )   continue;
     tmpBool05 = true;
      break;
     
   }
   if ( !(tmpBool05) )
   {
     tmpInt06 = 0;
     for (tmpInt07 = MT4OrdersTotal() ; tmpInt07 >= 0 ; tmpInt07=tmpInt07 - 1)
     {
       if ( OrderSelect(tmpInt07,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 4 )   continue;
       tmpInt06=tmpInt06 + 1;
       
     }
     if ( tmpInt06 == maxPendingOrders )
     {
       tmpDouble08 = 9999.0;
       for (tmpInt09 = MT4OrdersTotal() ; tmpInt09 >= 0 ; tmpInt09=tmpInt09 - 1)
       {
         if ( OrderSelect(tmpInt09,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 4 || !(OrderOpenPrice()<tmpDouble08) )   continue;
         tmpDouble08 = OrderOpenPrice();
         
       }
       if ( buyEntryPrice>tmpDouble08 )
       {
         return(false); 
       }
     }
     legacyGlobalDouble264 = buyEntryPrice ;
     localBool02 = true ;
     cachedBuySignalPrice = NormalizeDouble(buyEntryPrice,symbolDigits) ;
   }
   if ( cachedBuySignalPrice==0.0 )
   {
     return(false); 
   }
   if ( localBool02 )
   {
     legacyGlobalDouble247 = magicTrailActivationDistancePips ;
     localDouble03 = NormalizeDouble(buyPendingEntryOffsetPips * pipSize + cachedBuySignalPrice,symbolDigits) ;
     tmpDouble10 = localDouble03;
     tmpBool12=false; 
     for (tmpInt11 = MT4OrdersTotal() ; tmpInt11 >= 0 ; tmpInt11=tmpInt11 - 1)
     {
       if ( OrderSelect(tmpInt11,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 4 || !(OrderOpenPrice()<=tmpDouble10) )   continue;
       tmpBool12 = true;
        break;
       
     }
     if ( tmpBool12 )
     {
       return(false); 
     }
     lastBuyPendingBasePrice = localDouble03 ;
     if ( !(virtualPendingOrdersEnabled) )
     {
       if ( CheckMargin && AccountFreeMarginCheck(currentSymbol,0,lotSizeByStrategy[currentStrategyIndex])<=0.0 )
       {
         Print("Free margin not sufficient for setting order with lotsize " + string(lotSizeByStrategy[currentStrategyIndex]) + "..."); 
         return(false); 
       }
       localDouble04 = NormalizeDouble(legacyGlobalInt015 * pipSize + localDouble03,symbolDigits) ;
       localDouble05 = NormalizeDouble(localDouble03 - (stopLossPips + legacyGlobalDouble064) * pipSize,symbolDigits) ;
       localDouble06 = NormalizeDouble(takeProfitPips * pipSize + localDouble03,symbolDigits) ;
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
       if ( MarketInfo(currentSymbol,MODE_ASK)<localDouble04 - freezeLevelPriceDistance * pipSize && MarketInfo(currentSymbol,MODE_ASK)<localDouble04 - stopLevelPriceDistance * pipSize )
       {
         if ( !(setSL_TP_After_Entry) )
         {
           legacyGlobalInt230 = OrderSend(currentSymbol,4,lotSizeByStrategy[currentStrategyIndex],localDouble04,int(orderSlippageSetting * pipSize),localDouble05,localDouble06,currentStrategyComment,strategyMagicNumber,legacyGlobalDatetime302,Green) ;
         }
         else
         {
           legacyGlobalInt230 = OrderSend(currentSymbol,4,lotSizeByStrategy[currentStrategyIndex],localDouble04,int(orderSlippageSetting * pipSize),0.0,0.0,currentStrategyComment,strategyMagicNumber,legacyGlobalDatetime302,Green) ;
         }
         legacyGlobalBool280 = false ;
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
                   legacyGlobalInt230 = OrderSend(currentSymbol,4,lotSizeByStrategy[currentStrategyIndex],localDouble04,tmpInt16,localDouble05,localDouble06,currentStrategyComment,strategyMagicNumber,legacyGlobalDatetime302,Green) ;
                 }
                 else
                 {
                   legacyGlobalInt230 = OrderSend(currentSymbol,4,lotSizeByStrategy[currentStrategyIndex],localDouble04,int(orderSlippageSetting * pipSize),0.0,0.0,currentStrategyComment,strategyMagicNumber,legacyGlobalDatetime302,Green) ;
                 }
                 legacyGlobalBool280 = false ;
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
     return(true); 
   }
 }
 return(false); 
 }
//lizong_16 <<==--------   --------
 bool PlaceSellStopEntry( int argInt00)
 {
  bool      localBool02;
  double    localDouble03;
  double    localDouble04;
  double    localDouble05;
  double    localDouble06;
//----- -----
 bool       tmpBool01;
 int        tmpInt02;
 double     tmpDouble03;
 int        tmpInt04;
 bool       tmpBool05;
 int        tmpInt06;
 int        tmpInt07;
 double     tmpDouble08;
 int        tmpInt09;
 double     tmpDouble10;
 int        tmpInt11;
 bool       tmpBool12;
 bool       tmpBool13;
 int        tmpInt14;
 bool       tmpBool15;
 int        tmpInt16;
 double     tmpDouble17;
 long       tmpLong18;
 int        tmpInt19;

 if ( !(AllowSellTrades) )
 {
   return(false); 
 }
 if ( allowMultipleOpenTradesPerSide )
 {
   tmpBool01 = false;
 }
 else
 {
   tmpBool01=false; 
   for (tmpInt02 = 0 ; tmpInt02 < MT4OrdersTotal() ; tmpInt02=tmpInt02 + 1)
   {
     if ( OrderSelect(tmpInt02,0,0) != true || OrderType() != 1 || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol )   continue;
     tmpBool01 = true;
      break;
     
   }
 }
 if ( tmpBool01 == true )
 {
   return(false); 
 }
 if ( movingAverageTrendFilterEnabled && fastMovingAverageValue>slowMovingAverageValue )
 {
   return(false); 
 }
 if ( argInt00 == 1 )
 {
   CalculateSellEntryPrice(entryTimeframeMinutes); 
   localBool02 = false ;
   tmpDouble03 = sellEntryPrice;
   tmpBool05=false; 
   for (tmpInt04 = MT4OrdersTotal() ; tmpInt04 >= 0 ; tmpInt04=tmpInt04 - 1)
   {
     if ( OrderSelect(tmpInt04,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 5 || !(MathAbs(OrderOpenPrice() - (tmpDouble03 - sellPendingEntryOffsetPips * pipSize))<duplicatePendingTolerancePips * pipSize) )   continue;
     tmpBool05 = true;
      break;
     
   }
   if ( !(tmpBool05) )
   {
     tmpInt06 = 0;
     for (tmpInt07 = MT4OrdersTotal() ; tmpInt07 >= 0 ; tmpInt07=tmpInt07 - 1)
     {
       if ( OrderSelect(tmpInt07,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 5 )   continue;
       tmpInt06=tmpInt06 + 1;
       
     }
     if ( tmpInt06 == maxPendingOrders )
     {
       tmpDouble08 = 0.0;
       for (tmpInt09 = MT4OrdersTotal() ; tmpInt09 >= 0 ; tmpInt09=tmpInt09 - 1)
       {
         if ( OrderSelect(tmpInt09,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 5 || !(OrderOpenPrice()>tmpDouble08) )   continue;
