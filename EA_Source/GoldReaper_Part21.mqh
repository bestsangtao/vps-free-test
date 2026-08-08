 }
 else
 {
   tmpDouble12 = 0.0;
 }
 legacyGlobalDouble114 = tmpDouble11 + tmpDouble12 ;
 legacyGlobalInt117 = 60 ;
 legacyGlobalInt118 = 50 ;
 legacyGlobalInt119 = 14 ;
 legacyGlobalInt120 = 12 ;
 legacyGlobalInt121 = 300 ;
 legacyGlobalDouble123 = 22.0 ;
 maxOpenTradesPerSide = 5 ;
 if ( !(RemoveCommentSuffix) )
 {
   currentStrategyComment=ST1_Comment + "_XAUUSD_1";
 }
 strategyMagicNumber=ST1_MagicNumber + 1;
 legacyGlobalDouble397 = ConvertUsdToAccountCurrency(145.0) ;
 if ( !(UseVariableValues) )   return;
 legacyGlobalDouble007 = 2000.0 ;
 legacyGlobalDouble397 = ConvertUsdToAccountCurrency(60.0) ;
 }
//lizong_37 <<==--------   --------
 void LoadStrategy2Profile()
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
 double     tmpDouble13;

 entryTimeframeMinutes = 240 ;
 legacyGlobalInt072 = 60 ;
 legacyGlobalInt073 = 12 ;
 legacyGlobalInt074 = 8 ;
 legacyGlobalInt077 = 90 ;
 legacyGlobalDouble080 = 1050.0 ;
 minimumEntryDistancePercent = 0.0 ;
 tmpDouble01 = AdjustEntry + -40.0;
 if ( Randomization>0.0 )
 {
   tmpDouble02 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble02 = 0.0;
 }
 buyPendingEntryOffsetPips = tmpDouble01 + tmpDouble02 ;
 tmpDouble02 = AdjustEntry + -100.0;
 if ( Randomization>0.0 )
 {
   tmpDouble03 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble03 = 0.0;
 }
 sellPendingEntryOffsetPips = tmpDouble02 + tmpDouble03 ;
 maxPendingOrders = 2 ;
 duplicatePendingTolerancePips = 130.0 ;
 pendingExpirationEnabledValue = 192 ;
 legacyGlobalInt099 = 5 ;
 if ( !(UseHL_TrailingSL) )
 {
   tmpDouble03 = AdjustSL + 700.0;
   if ( Randomization>0.0 )
   {
     tmpDouble04 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
   }
   else
   {
     tmpDouble04 = 0.0;
   }
   stopLossPips = tmpDouble03 + tmpDouble04 ;
 }
 else
 {
   tmpDouble04 = AdjustSL + 800.0;
   if ( Randomization>0.0 )
   {
     tmpDouble05 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
   }
   else
   {
     tmpDouble05 = 0.0;
   }
   stopLossPips = tmpDouble04 + tmpDouble05 ;
 }
 tmpDouble05 = AdjustTP + 4900.0;
 if ( Randomization>0.0 )
 {
   tmpDouble06 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble06 = 0.0;
 }
 takeProfitPips = tmpDouble05 + tmpDouble06 ;
 tmpDouble06 = AdjustTrailSL + 1300.0;
 if ( Randomization>0.0 )
 {
   tmpDouble07 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble07 = 0.0;
 }
 legacyGlobalDouble103 = tmpDouble06 + tmpDouble07 ;
 if ( Randomization>0.0 )
 {
   tmpDouble08 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble08 = 0.0;
 }
 legacyGlobalDouble104 = tmpDouble08 + 1450.0 ;
 if ( Randomization>0.0 )
 {
   tmpDouble09 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble09 = 0.0;
 }
 legacyGlobalDouble105 = tmpDouble09 + 2000.0 ;
 trailingActivationBufferPips = 0.1 ;
 trailingPartialClosePercent = 0.0 ;
 if ( Randomization>0.0 )
 {
   tmpDouble10 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble10 = 0.0;
 }
 legacyGlobalDouble109 = tmpDouble10 + 1400.0 ;
 tmpDouble10 = AdjustTrailTP + 200.0;
 if ( Randomization>0.0 )
 {
   tmpDouble11 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble11 = 0.0;
 }
 legacyGlobalDouble108 = tmpDouble10 + tmpDouble11 ;
 if ( Randomization>0.0 )
 {
   tmpDouble12 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble12 = 0.0;
 }
 legacyGlobalDouble113 = tmpDouble12 + 500.0 ;
 tmpDouble12 = AdjustBreakEven + 200.0;
 if ( Randomization>0.0 )
 {
   tmpDouble13 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble13 = 0.0;
 }
 legacyGlobalDouble114 = tmpDouble12 + tmpDouble13 ;
 legacyGlobalInt117 = 60 ;
 legacyGlobalInt118 = 50 ;
 legacyGlobalInt119 = 14 ;
 legacyGlobalInt120 = 6 ;
 legacyGlobalInt121 = 400 ;
 legacyGlobalDouble123 = 32.0 ;
 maxOpenTradesPerSide = 99 ;
 if ( !(RemoveCommentSuffix) )
 {
   currentStrategyComment=ST1_Comment + "_XAUUSD_4";
 }
 strategyMagicNumber=ST1_MagicNumber + 2;
 legacyGlobalDouble397 = ConvertUsdToAccountCurrency(57.0) ;
 if ( !(UseVariableValues) )   return;
 legacyGlobalDouble007 = 1600.0 ;
 legacyGlobalDouble397 = ConvertUsdToAccountCurrency(52.0) ;
 }
//lizong_38 <<==--------   --------
 void LoadStrategy3Profile()
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

 entryTimeframeMinutes = 1440 ;
 legacyGlobalInt072 = 60 ;
 legacyGlobalInt073 = 15 ;
 legacyGlobalInt074 = 3 ;
 legacyGlobalInt077 = 230 ;
 legacyGlobalDouble080 = 550.0 ;
 minimumEntryDistancePercent = 0.0 ;
 tmpDouble01 = AdjustEntry + -170.0;
 if ( Randomization>0.0 )
 {
   tmpDouble02 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble02 = 0.0;
 }
 buyPendingEntryOffsetPips = tmpDouble01 + tmpDouble02 ;
 tmpDouble02 = AdjustEntry + -70.0;
 if ( Randomization>0.0 )
 {
   tmpDouble03 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble03 = 0.0;
 }
 sellPendingEntryOffsetPips = tmpDouble02 + tmpDouble03 ;
 maxPendingOrders = 1 ;
 duplicatePendingTolerancePips = 480.0 ;
 pendingExpirationEnabledValue = 480 ;
 legacyGlobalInt099 = 1 ;
 tmpDouble03 = AdjustSL + 1000.0;
 if ( Randomization>0.0 )
 {
   tmpDouble04 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble04 = 0.0;
 }
 stopLossPips = tmpDouble03 + tmpDouble04 ;
 tmpDouble04 = AdjustTP + 4100.0;
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
 legacyGlobalDouble104 = tmpDouble07 + 1400.0 ;
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
 legacyGlobalDouble109 = tmpDouble09 + 1600.0 ;
 tmpDouble09 = AdjustTrailTP + 400.0;
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
 legacyGlobalDouble113 = tmpDouble11 + 500.0 ;
 tmpDouble11 = AdjustBreakEven + 100.0;
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
 legacyGlobalInt120 = 5 ;
 legacyGlobalInt121 = 700 ;
 legacyGlobalDouble123 = 22.0 ;
 maxOpenTradesPerSide = 99 ;
 if ( !(RemoveCommentSuffix) )
 {
   currentStrategyComment=ST1_Comment + "_XAUUSD_2";
 }
 strategyMagicNumber=ST1_MagicNumber + 5;
 legacyGlobalDouble397 = ConvertUsdToAccountCurrency(30.0) ;
 if ( !(UseVariableValues) )   return;
 legacyGlobalDouble007 = 2000.0 ;
 legacyGlobalDouble397 = ConvertUsdToAccountCurrency(30.0) ;
 }
//lizong_39 <<==--------   --------
 void LoadStrategy4Profile()
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
 double     tmpDouble13;

 entryTimeframeMinutes = 1440 ;
 legacyGlobalInt072 = 60 ;
 legacyGlobalInt073 = 7 ;
 legacyGlobalInt074 = 2 ;
 legacyGlobalInt077 = 20 ;
 legacyGlobalDouble080 = 250.0 ;
 minimumEntryDistancePercent = 0.0 ;
 tmpDouble01 = AdjustEntry + -130.0;
 if ( Randomization>0.0 )
 {
   tmpDouble02 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble02 = 0.0;
 }
 buyPendingEntryOffsetPips = tmpDouble01 + tmpDouble02 ;
 tmpDouble02 = AdjustEntry + -120.0;
 if ( Randomization>0.0 )
 {
   tmpDouble03 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble03 = 0.0;
 }
 sellPendingEntryOffsetPips = tmpDouble02 + tmpDouble03 ;
 maxPendingOrders = 1 ;
 duplicatePendingTolerancePips = 980.0 ;
 pendingExpirationEnabledValue = 432 ;
 legacyGlobalInt099 = 1 ;
 if ( !(UseHL_TrailingSL) )
 {
   tmpDouble03 = AdjustSL + 600.0;
   if ( Randomization>0.0 )
   {
     tmpDouble04 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
   }
   else
   {
     tmpDouble04 = 0.0;
   }
   stopLossPips = tmpDouble03 + tmpDouble04 ;
 }
 else
 {
   tmpDouble04 = AdjustSL + 700.0;
   if ( Randomization>0.0 )
   {
     tmpDouble05 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
   }
   else
   {
     tmpDouble05 = 0.0;
   }
   stopLossPips = tmpDouble04 + tmpDouble05 ;
 }
 tmpDouble05 = AdjustTP + 3300.0;
 if ( Randomization>0.0 )
 {
   tmpDouble06 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble06 = 0.0;
 }
 takeProfitPips = tmpDouble05 + tmpDouble06 ;
 tmpDouble06 = AdjustTrailSL + 500.0;
 if ( Randomization>0.0 )
 {
   tmpDouble07 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble07 = 0.0;
 }
 legacyGlobalDouble103 = tmpDouble06 + tmpDouble07 ;
 if ( Randomization>0.0 )
 {
   tmpDouble08 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble08 = 0.0;
 }
 legacyGlobalDouble104 = tmpDouble08 + 400.0 ;
 if ( Randomization>0.0 )
 {
   tmpDouble09 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble09 = 0.0;
 }
 legacyGlobalDouble105 = tmpDouble09 + 5000.0 ;
 if ( Randomization>0.0 )
 {
   tmpDouble10 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble10 = 0.0;
 }
 legacyGlobalDouble109 = tmpDouble10 + 1000.0 ;
 tmpDouble10 = AdjustTrailTP + 2000.0;
 if ( Randomization>0.0 )
 {
   tmpDouble11 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble11 = 0.0;
 }
 legacyGlobalDouble108 = tmpDouble10 + tmpDouble11 ;
 trailingActivationBufferPips = 0.1 ;
 trailingPartialClosePercent = 0.0 ;
 if ( Randomization>0.0 )
 {
   tmpDouble12 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble12 = 0.0;
 }
 legacyGlobalDouble113 = tmpDouble12 + 400.0 ;
 tmpDouble12 = AdjustBreakEven;
 if ( Randomization>0.0 )
 {
   tmpDouble13 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble13 = 0.0;
 }
 legacyGlobalDouble114 = tmpDouble12 + tmpDouble13 ;
 legacyGlobalInt117 = 60 ;
 legacyGlobalInt118 = 50 ;
 legacyGlobalInt119 = 7 ;
 legacyGlobalInt120 = 4 ;
 legacyGlobalInt121 = 100 ;
 legacyGlobalDouble123 = 0.0 ;
 maxOpenTradesPerSide = 99 ;
 if ( !(RemoveCommentSuffix) )
 {
   currentStrategyComment=ST1_Comment + "_XAUUSD_3";
 }
 strategyMagicNumber=ST1_MagicNumber + 8;
 legacyGlobalDouble397 = ConvertUsdToAccountCurrency(32.0) ;
 if ( !(UseVariableValues) )   return;
 legacyGlobalDouble007 = 2000.0 ;
 legacyGlobalDouble397 = ConvertUsdToAccountCurrency(35.0) ;
 }
//lizong_40 <<==--------   --------
 void LoadStrategy5Profile()
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
 legacyGlobalInt072 = 5 ;
 legacyGlobalInt073 = 26 ;
 legacyGlobalInt074 = 24 ;
 legacyGlobalInt077 = 140 ;
 legacyGlobalDouble080 = 120.0 ;
 minimumEntryDistancePercent = 0.0 ;
 tmpDouble01 = AdjustEntry + -115.0;
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
 duplicatePendingTolerancePips = 55.0 ;
 pendingExpirationEnabledValue = 20 ;
 legacyGlobalInt099 = 1 ;
 tmpDouble03 = AdjustSL + 10100.0;
 if ( Randomization>0.0 )
 {
   tmpDouble04 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble04 = 0.0;
 }
 stopLossPips = tmpDouble03 + tmpDouble04 ;
 tmpDouble04 = AdjustTP + 800.0;
 if ( Randomization>0.0 )
 {
   tmpDouble05 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble05 = 0.0;
 }
 takeProfitPips = tmpDouble04 + tmpDouble05 ;
 tmpDouble05 = AdjustTrailSL + 500.0;
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
 legacyGlobalDouble104 = tmpDouble07 + 1200.0 ;
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
 legacyGlobalDouble113 = tmpDouble11 + 330.0 ;
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
 maxOpenTradesPerSide = 5 ;
 if ( !(RemoveCommentSuffix) )
 {
   currentStrategyComment=ST1_Comment + "_XAUUSD_6";
 }
 strategyMagicNumber=ST1_MagicNumber + 9;
 legacyGlobalDouble397 = ConvertUsdToAccountCurrency(348.0) ;
 if ( !(UseVariableValues) )   return;
 legacyGlobalDouble007 = 2400.0 ;
 legacyGlobalDouble397 = ConvertUsdToAccountCurrency(140.0) ;
 }
//lizong_41 <<==--------   --------
 void LoadStrategy6Profile()
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
 legacyGlobalInt073 = 30 ;
 legacyGlobalInt074 = 19 ;
 legacyGlobalInt077 = 110 ;
 legacyGlobalDouble080 = 160.0 ;
 minimumEntryDistancePercent = 0.0 ;
 tmpDouble01 = AdjustEntry + -120.0;
 if ( Randomization>0.0 )
 {
   tmpDouble02 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble02 = 0.0;
 }
 buyPendingEntryOffsetPips = tmpDouble01 + tmpDouble02 ;
 tmpDouble02 = AdjustEntry + -110.0;
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
 duplicatePendingTolerancePips = 55.0 ;
 pendingExpirationEnabledValue = 30 ;
 legacyGlobalInt099 = 1 ;
 tmpDouble03 = AdjustSL + 5300.0;
 if ( Randomization>0.0 )
 {
   tmpDouble04 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble04 = 0.0;
 }
 stopLossPips = tmpDouble03 + tmpDouble04 ;
 tmpDouble04 = AdjustTP + 900.0;
 if ( Randomization>0.0 )
 {
   tmpDouble05 = Randomization * 2.0 * MathRand() / 32768.0 + (0.0 - Randomization);
 }
 else
 {
   tmpDouble05 = 0.0;
 }
