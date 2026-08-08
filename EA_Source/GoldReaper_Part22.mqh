 }
 takeProfitPips = tmpDouble04 + tmpDouble05 ;
 tmpDouble05 = AdjustTrailSL + 495.0;
 if ( Randomization>0.0 )
 {
   tmpDouble06 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble06 = 0.0;
 }
 legacyGlobalDouble103 = tmpDouble05 + tmpDouble06 ;
 if ( Randomization>0.0 )
 {
   tmpDouble07 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble07 = 0.0;
 }
 legacyGlobalDouble104 = tmpDouble07 + 400.0 ;
 if ( Randomization>0.0 )
 {
   tmpDouble08 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble08 = 0.0;
 }
 legacyGlobalDouble105 = tmpDouble08 + 5000.0 ;
 trailingActivationBufferPips = 0.1 ;
 trailingPartialClosePercent = 0.0 ;
 if ( Randomization>0.0 )
 {
   tmpDouble09 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble09 = 0.0;
 }
 legacyGlobalDouble109 = tmpDouble09 + 1900.0 ;
 tmpDouble09 = AdjustTrailTP + 250.0;
 if ( Randomization>0.0 )
 {
   tmpDouble10 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble10 = 0.0;
 }
 legacyGlobalDouble108 = tmpDouble09 + tmpDouble10 ;
 if ( Randomization>0.0 )
 {
   tmpDouble11 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble11 = 0.0;
 }
 legacyGlobalDouble113 = tmpDouble11 + 260.0 ;
 tmpDouble11 = AdjustBreakEven + 80.0;
 if ( Randomization>0.0 )
 {
   tmpDouble12 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble12 = 0.0;
 }
 legacyGlobalDouble114 = tmpDouble11 + tmpDouble12 ;
 legacyGlobalInt117 = 60 ;
 legacyGlobalInt118 = 50 ;
 legacyGlobalInt119 = 0 ;
 legacyGlobalInt120 = 0 ;
 legacyGlobalInt121 = 100 ;
 legacyGlobalDouble123 = 0.0 ;
 maxOpenTradesPerSide = 99 ;
 if ( !(RemoveCommentSuffix) )
 {
   currentStrategyComment=ST1_Comment + "_XAUUSD_5";
 }
 strategyMagicNumber=ST1_MagicNumber + 12;
 legacyGlobalDouble397 = ConvertUsdToAccountCurrency(281.0) ;
 if ( !(UseVariableValues) )   return;
 legacyGlobalDouble007 = 2600.0 ;
 legacyGlobalDouble397 = ConvertUsdToAccountCurrency(110.0) ;
 }
//lizong_42 <<==--------   --------
 void LoadStrategy7Profile()
 {
 double     tmpDouble01;
 double     tmpDouble02;
 double     tmpDouble03;
 double     tmpDouble04;
 double     tmpDouble05;
 double     tmpDouble06;
 double     tmpDouble07;
 double     tmpDouble08;
 double     tmpDouble09;
 double     tmpDouble10;
 double     tmpDouble11;
 double     tmpDouble12;

 entryTimeframeMinutes = 60 ;
 legacyGlobalInt072 = 15 ;
 legacyGlobalInt073 = 7 ;
 legacyGlobalInt074 = 5 ;
 legacyGlobalInt077 = 200 ;
 legacyGlobalDouble080 = 40.0 ;
 minimumEntryDistancePercent = 0.0 ;
 tmpDouble01 = AdjustEntry + -150.0;
 if ( Randomization>0.0 )
 {
   tmpDouble02 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble02 = 0.0;
 }
 buyPendingEntryOffsetPips = tmpDouble01 + tmpDouble02 ;
 tmpDouble02 = AdjustEntry + -145.0;
 if ( Randomization>0.0 )
 {
   tmpDouble03 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble03 = 0.0;
 }
 sellPendingEntryOffsetPips = tmpDouble02 + tmpDouble03 ;
 maxPendingOrders = 3 ;
 duplicatePendingTolerancePips = 5.0 ;
 pendingExpirationEnabledValue = 15 ;
 legacyGlobalInt099 = 1 ;
 tmpDouble03 = AdjustSL + 3900.0;
 if ( Randomization>0.0 )
 {
   tmpDouble04 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble04 = 0.0;
 }
 stopLossPips = tmpDouble03 + tmpDouble04 ;
 tmpDouble04 = AdjustTP + 1350.0;
 if ( Randomization>0.0 )
 {
   tmpDouble05 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble05 = 0.0;
 }
 takeProfitPips = tmpDouble04 + tmpDouble05 ;
 tmpDouble05 = AdjustTrailSL + 445.0;
 if ( Randomization>0.0 )
 {
   tmpDouble06 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble06 = 0.0;
 }
 legacyGlobalDouble103 = tmpDouble05 + tmpDouble06 ;
 if ( Randomization>0.0 )
 {
   tmpDouble07 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble07 = 0.0;
 }
 legacyGlobalDouble104 = tmpDouble07 + 355.0 ;
 if ( Randomization>0.0 )
 {
   tmpDouble08 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble08 = 0.0;
 }
 legacyGlobalDouble105 = tmpDouble08 + 5000.0 ;
 trailingActivationBufferPips = 0.1 ;
 trailingPartialClosePercent = 0.0 ;
 if ( Randomization>0.0 )
 {
   tmpDouble09 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble09 = 0.0;
 }
 legacyGlobalDouble109 = tmpDouble09 + 1850.0 ;
 tmpDouble09 = AdjustTrailTP + 250.0;
 if ( Randomization>0.0 )
 {
   tmpDouble10 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble10 = 0.0;
 }
 legacyGlobalDouble108 = tmpDouble09 + tmpDouble10 ;
 if ( Randomization>0.0 )
 {
   tmpDouble11 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble11 = 0.0;
 }
 legacyGlobalDouble113 = tmpDouble11 + 160.0 ;
 tmpDouble11 = AdjustBreakEven + 50.0;
 if ( Randomization>0.0 )
 {
   tmpDouble12 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble12 = 0.0;
 }
 legacyGlobalDouble114 = tmpDouble11 + tmpDouble12 ;
 legacyGlobalInt117 = 60 ;
 legacyGlobalInt118 = 50 ;
 legacyGlobalInt119 = 1 ;
 legacyGlobalInt120 = 9 ;
 legacyGlobalInt121 = 1500 ;
 legacyGlobalDouble123 = 46.0 ;
 maxOpenTradesPerSide = 99 ;
 if ( !(RemoveCommentSuffix) )
 {
   currentStrategyComment=ST1_Comment + "_XAUUSD_9";
 }
 strategyMagicNumber=ST1_MagicNumber + 13;
 legacyGlobalDouble397 = ConvertUsdToAccountCurrency(968.0) ;
 if ( !(UseVariableValues) )   return;
 legacyGlobalDouble007 = 1900.0 ;
 legacyGlobalDouble397 = ConvertUsdToAccountCurrency(700.0) ;
 }
//lizong_43 <<==--------   --------
 void LoadStrategy8Profile()
 {
 double     tmpDouble01;
 double     tmpDouble02;
 double     tmpDouble03;
 double     tmpDouble04;
 double     tmpDouble05;
 double     tmpDouble06;
 double     tmpDouble07;
 double     tmpDouble08;
 double     tmpDouble09;
 double     tmpDouble10;
 double     tmpDouble11;
 double     tmpDouble12;

 entryTimeframeMinutes = 60 ;
 legacyGlobalInt072 = 15 ;
 legacyGlobalInt073 = 25 ;
 legacyGlobalInt074 = 23 ;
 legacyGlobalInt077 = 145 ;
 legacyGlobalDouble080 = 10.0 ;
 minimumEntryDistancePercent = 0.0 ;
 // Strategy 7 BUY entry sync with original EX5 behavior.
 // UseVariableValues van giu nguyen; chi sua nominal BUY offset -60 -> -10.
 tmpDouble01 = AdjustEntry + -10.0;
 if ( Randomization>0.0 )
 {
   tmpDouble02 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble02 = 0.0;
 }
 buyPendingEntryOffsetPips = tmpDouble01 + tmpDouble02 ;
 tmpDouble02 = AdjustEntry + -145.0;
 if ( Randomization>0.0 )
 {
   tmpDouble03 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble03 = 0.0;
 }
 sellPendingEntryOffsetPips = tmpDouble02 + tmpDouble03 ;
 maxPendingOrders = 5 ;
 duplicatePendingTolerancePips = 90.0 ;
 pendingExpirationEnabledValue = 60 ;
 legacyGlobalInt099 = 1 ;
 tmpDouble03 = AdjustSL + 2250.0;
 if ( Randomization>0.0 )
 {
   tmpDouble04 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble04 = 0.0;
 }
 stopLossPips = tmpDouble03 + tmpDouble04 ;
 tmpDouble04 = AdjustTP + 1450.0;
 if ( Randomization>0.0 )
 {
   tmpDouble05 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble05 = 0.0;
 }
 takeProfitPips = tmpDouble04 + tmpDouble05 ;
 tmpDouble05 = AdjustTrailSL + 450.0;
 if ( Randomization>0.0 )
 {
   tmpDouble06 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble06 = 0.0;
 }
 legacyGlobalDouble103 = tmpDouble05 + tmpDouble06 ;
 if ( Randomization>0.0 )
 {
   tmpDouble07 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble07 = 0.0;
 }
 legacyGlobalDouble104 = tmpDouble07 + 900.0 ;
 if ( Randomization>0.0 )
 {
   tmpDouble08 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble08 = 0.0;
 }
 legacyGlobalDouble105 = tmpDouble08 + 5000.0 ;
 trailingActivationBufferPips = 0.1 ;
 trailingPartialClosePercent = 0.0 ;
 if ( Randomization>0.0 )
 {
   tmpDouble09 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble09 = 0.0;
 }
 legacyGlobalDouble109 = tmpDouble09 + 2800.0 ;
 tmpDouble09 = AdjustTrailTP + 350.0;
 if ( Randomization>0.0 )
 {
   tmpDouble10 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble10 = 0.0;
 }
 legacyGlobalDouble108 = tmpDouble09 + tmpDouble10 ;
 if ( Randomization>0.0 )
 {
   tmpDouble11 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble11 = 0.0;
 }
 legacyGlobalDouble113 = tmpDouble11 + 340.0 ;
 tmpDouble11 = AdjustBreakEven + 30.0;
 if ( Randomization>0.0 )
 {
   tmpDouble12 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble12 = 0.0;
 }
 legacyGlobalDouble114 = tmpDouble11 + tmpDouble12 ;
 legacyGlobalInt117 = 60 ;
 legacyGlobalInt118 = 50 ;
 legacyGlobalInt119 = 12 ;
 legacyGlobalInt120 = 17 ;
 legacyGlobalInt121 = 1000 ;
 legacyGlobalDouble123 = 45.0 ;
 maxOpenTradesPerSide = 5 ;
 if ( !(RemoveCommentSuffix) )
 {
   currentStrategyComment=ST1_Comment + "_XAUUSD_7";
 }
 strategyMagicNumber=ST1_MagicNumber + 14;
 legacyGlobalDouble397 = ConvertUsdToAccountCurrency(149.0) ;
 if ( !(UseVariableValues) )   return;
 legacyGlobalDouble007 = 2600.0 ;
 legacyGlobalDouble397 = ConvertUsdToAccountCurrency(90.0) ;
 }
//lizong_44 <<==--------   --------
 void LoadStrategy9Profile()
 {
 double     tmpDouble01;
 double     tmpDouble02;
 double     tmpDouble03;
 double     tmpDouble04;
 double     tmpDouble05;
 double     tmpDouble06;
 double     tmpDouble07;
 double     tmpDouble08;
 double     tmpDouble09;
 double     tmpDouble10;
 double     tmpDouble11;
 double     tmpDouble12;

 entryTimeframeMinutes = 60 ;
 legacyGlobalInt072 = 15 ;
 legacyGlobalInt073 = 26 ;
 legacyGlobalInt074 = 20 ;
 legacyGlobalInt077 = 235 ;
 legacyGlobalDouble080 = 80.0 ;
 minimumEntryDistancePercent = 0.0 ;
 tmpDouble01 = AdjustEntry + -140.0;
 if ( Randomization>0.0 )
 {
   tmpDouble02 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble02 = 0.0;
 }
 buyPendingEntryOffsetPips = tmpDouble01 + tmpDouble02 ;
 tmpDouble02 = AdjustEntry + -170.0;
 if ( Randomization>0.0 )
 {
   tmpDouble03 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble03 = 0.0;
 }
 sellPendingEntryOffsetPips = tmpDouble02 + tmpDouble03 ;
 maxPendingOrders = 5 ;
 duplicatePendingTolerancePips = 5.0 ;
 pendingExpirationEnabledValue = 55 ;
 legacyGlobalInt099 = 1 ;
 tmpDouble03 = AdjustSL + 1900.0;
 if ( Randomization>0.0 )
 {
   tmpDouble04 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble04 = 0.0;
 }
 stopLossPips = tmpDouble03 + tmpDouble04 ;
 tmpDouble04 = AdjustTP + 1200.0;
 if ( Randomization>0.0 )
 {
   tmpDouble05 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble05 = 0.0;
 }
 takeProfitPips = tmpDouble04 + tmpDouble05 ;
 tmpDouble05 = AdjustTrailSL + 1250.0;
 if ( Randomization>0.0 )
 {
   tmpDouble06 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble06 = 0.0;
 }
 legacyGlobalDouble103 = tmpDouble05 + tmpDouble06 ;
 if ( Randomization>0.0 )
 {
   tmpDouble07 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble07 = 0.0;
 }
 legacyGlobalDouble104 = tmpDouble07 + 650.0 ;
 if ( Randomization>0.0 )
 {
   tmpDouble08 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble08 = 0.0;
 }
 legacyGlobalDouble105 = tmpDouble08 + 5000.0 ;
 trailingActivationBufferPips = 0.1 ;
 trailingPartialClosePercent = 0.0 ;
 if ( Randomization>0.0 )
 {
   tmpDouble09 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble09 = 0.0;
 }
 legacyGlobalDouble109 = tmpDouble09 + 1950.0 ;
 tmpDouble09 = AdjustTrailTP + 250.0;
 if ( Randomization>0.0 )
 {
   tmpDouble10 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble10 = 0.0;
 }
 legacyGlobalDouble108 = tmpDouble09 + tmpDouble10 ;
 if ( Randomization>0.0 )
 {
   tmpDouble11 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble11 = 0.0;
 }
 legacyGlobalDouble113 = tmpDouble11 + 270.0 ;
 tmpDouble11 = AdjustBreakEven;
 if ( Randomization>0.0 )
 {
   tmpDouble12 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble12 = 0.0;
 }
 legacyGlobalDouble114 = tmpDouble11 + tmpDouble12 ;
 legacyGlobalInt117 = 60 ;
 legacyGlobalInt118 = 50 ;
 legacyGlobalInt119 = 15 ;
 legacyGlobalInt120 = 3 ;
 legacyGlobalInt121 = 1200 ;
 legacyGlobalDouble123 = 16.0 ;
 maxOpenTradesPerSide = 20 ;
 if ( !(RemoveCommentSuffix) )
 {
   currentStrategyComment=ST1_Comment + "_XAUUSD_8";
 }
 strategyMagicNumber=ST1_MagicNumber + 15;
 legacyGlobalDouble397 = ConvertUsdToAccountCurrency(276.0) ;
 if ( !(UseVariableValues) )   return;
 legacyGlobalDouble007 = 2800.0 ;
 legacyGlobalDouble397 = ConvertUsdToAccountCurrency(130.0) ;
 }
//lizong_45 <<==--------   --------
 void EnforcePropFirmDailyDrawdown()
 {
  double    localDouble01;
  int       localInt02;
  double    localDouble03;
  double    localDouble04;
  double    localDouble05;
//----- -----
 double     tmpDouble01;
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
 int        tmpInt13;
 int        tmpInt14;
 int        tmpInt15;
 int        tmpInt16;
 int        tmpInt17;
 int        tmpInt18;
 int        tmpInt19;

 tmpDouble01 = AccountEquity();
 if ( tmpDouble01==AccountBalance() )   return;
 localDouble01 = 0.0 ;
 if ( AccountEquity()>legacyGlobalDouble384 )
 {
   legacyGlobalDouble384 = AccountEquity() ;
 }
 for (localInt02 = HistoryTotal() ; localInt02 >= 0 ; localInt02 --)
 {
   if ( OrderSelect(localInt02,0,1) != true )   continue;
   tmpLong02 = OrderCloseTime();
   if ( tmpLong02 < iTime(currentSymbol,MT4Period(PERIOD_D1),0) )   continue;
   localDouble03 = OrderProfit() + OrderSwap() + OrderCommission() ;
   localDouble01 = localDouble03 + localDouble01 ;
   
 }
 localDouble04 = AccountEquity() - AccountBalance() ;
 localDouble05 = localDouble04 + localDouble01 ;
 if ( !( -(localDouble05)>legacyGlobalDouble384 * PropFirmMaxDailyDD / 100.0) )   return;
 
 if ( !(dailyDrawdownLockActive) )
 {
   Print("Max Daily Drawdown reached, closing trades and skipping rest of the day"); 
 }
 for (tmpInt03 = MT4OrdersTotal() ; tmpInt03 >= 0 ; tmpInt03=tmpInt03 - 1)
 {
   if ( OrderSelect(tmpInt03,0,0) != true || OrderSymbol() != currentSymbol )   continue;
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
   if ( OrderType() == 0 )
   {
     OrderClose(OrderTicket(),OrderLots(),MarketInfo(currentSymbol,MODE_BID),(int)orderSlippageSetting,Red); 
