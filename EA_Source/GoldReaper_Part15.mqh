         return(true); 
       }
       localBool20 = false ;
       if ( legacyGlobalBool159 )
       {
         tmpLong08 = localLong09;
         tmpInt09 = 0;
         for (tmpInt10 = MT4OrdersTotal() ; tmpInt10 >= 0 ; tmpInt10=tmpInt10 - 1)
         {
           if ( OrderSelect(tmpInt10,0,0) != true || OrderMagicNumber() != legacyGlobalInt169 || OrderSymbol() != currentSymbol )   continue;
           tmpString11 = OrderComment();
           if ( tmpString11 != IntegerToString(tmpLong08,0,32) )   continue;
           tmpInt09=tmpInt09 + 1;
           
         }
         localDouble21 = tmpInt09 ;
         localBool22 = false ;
         if ( !(sellZoneStateInitialized) )
         {
           sellZoneStateInitialized = true ;
           legacyGlobalInt193 = 1 ;
         }
         if ( localDouble21==0.0 )
         {
           legacyGlobalInt193 = 1 ;
         }
         if ( MathFloor(localDouble21 / 2.0)==localDouble21 / 2.0 )
         {
           legacyGlobalInt193 = 1 ;
         }
         else
         {
           legacyGlobalInt193 = 0 ;
         }
         if ( sellZoneStateInitialized )
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
               }
               tmpDouble15 = tmpDouble15 + OrderProfit();
               
             }
             if ( tmpDouble15>zoneRecoveryProfitTarget )
             {
               Print("Closing zone"); 
               tmpLong18 = localLong09;
               for (tmpInt19 = MT4OrdersTotal() ; tmpInt19 >= 0 ; tmpInt19=tmpInt19 - 1)
               {
                 if ( OrderSelect(tmpInt19,0,0) != true )   continue;
                 
                 if ( OrderMagicNumber() == strategyMagicNumber && OrderTicket() == tmpLong18 )
                 {
                   OrderClose(OrderTicket(),OrderLots(),MarketInfo(currentSymbol,MODE_ASK),3,Red); 
                 }
                 if ( OrderMagicNumber() != legacyGlobalInt169 )   continue;
                 tmpString11 = OrderComment();
                 if ( tmpString11 != IntegerToString(tmpLong18,0,32) )   continue;
                 
                 if ( OrderType() == 0 )
                 {
                   OrderClose(OrderTicket(),OrderLots(),MarketInfo(currentSymbol,MODE_BID),(int)orderSlippageSetting,Red); 
                 }
                 if ( OrderType() != 1 )   continue;
                 OrderClose(OrderTicket(),OrderLots(),MarketInfo(currentSymbol,MODE_ASK),(int)orderSlippageSetting,Red); 
                 
               }
               sellZoneStateInitialized = false ;
               localBool20 = true ;
             }
           }
           else
           {
             localDouble23 = localDouble12 * zoneRecoveryLotMultiplier ;
             if ( legacyGlobalInt164 == 2 )
             {
               localDouble23 = (localDouble21 + 1.0) * localDouble12 + localDouble12 ;
             }
             if ( legacyGlobalInt164 == 3 )
             {
               localDouble23 = localDouble12 * (MathPow(zoneRecoveryLotMultiplier,localDouble21 + 1.0)) ;
             }
             if ( legacyGlobalInt193 == 0 )
             {
               localDouble24 = localDouble17 ;
               if ( MarketInfo(currentSymbol,MODE_BID)<localDouble17 )
               {
                 if ( localDouble21>=legacyGlobalInt166 )
                 {
                   for (tmpInt20 = MT4OrdersTotal() ; tmpInt20 >= 0 ; tmpInt20=tmpInt20 - 1)
                   {
                     if ( OrderSelect(tmpInt20,0,0) != true )   continue;
                     
                     if ( OrderMagicNumber() == strategyMagicNumber && OrderTicket() == localLong09 )
                     {
                       OrderClose(OrderTicket(),OrderLots(),MarketInfo(currentSymbol,MODE_ASK),3,Red); 
                     }
                     if ( OrderMagicNumber() != legacyGlobalInt169 )   continue;
                     tmpString11 = OrderComment();
                     if ( tmpString11 != IntegerToString(localLong09,0,32) )   continue;
                     
                     if ( OrderType() == 0 )
                     {
                       OrderClose(OrderTicket(),OrderLots(),MarketInfo(currentSymbol,MODE_BID),(int)orderSlippageSetting,Red); 
                     }
                     if ( OrderType() != 1 )   continue;
                     OrderClose(OrderTicket(),OrderLots(),MarketInfo(currentSymbol,MODE_ASK),(int)orderSlippageSetting,Red); 
                     
                   }
                 }
                 else
                 {
                   OrderSend(currentSymbol,1,localDouble23,MarketInfo(currentSymbol,MODE_BID),(int)orderSlippageSetting,0.0,0.0,IntegerToString(localLong09,0,32),legacyGlobalInt169,0,Green); 
                   legacyGlobalInt193 = 1 ;
                   localBool22 = true ;
                 }
               }
             }
             else
             {
               localDouble25 = zoneRecoveryInitialDistancePips * pipSize + localDouble17 - localDouble21 * zoneRecoveryStepDistancePips * pipSize ;
               if ( localDouble25<zoneRecoveryMinimumDistancePips * pipSize + localDouble17 )
               {
                 localDouble25 = zoneRecoveryMinimumDistancePips * pipSize + localDouble17 ;
               }
               if ( MarketInfo(currentSymbol,MODE_ASK)>localDouble25 )
               {
                 if ( localDouble21>=legacyGlobalInt166 )
                 {
                   for (tmpInt21 = MT4OrdersTotal() ; tmpInt21 >= 0 ; tmpInt21=tmpInt21 - 1)
                   {
                     if ( OrderSelect(tmpInt21,0,0) != true )   continue;
                     
                     if ( OrderMagicNumber() == strategyMagicNumber && OrderTicket() == localLong09 )
                     {
                       OrderClose(OrderTicket(),OrderLots(),MarketInfo(currentSymbol,MODE_ASK),3,Red); 
                     }
                     if ( OrderMagicNumber() != legacyGlobalInt169 )   continue;
                     tmpString22 = OrderComment();
                     if ( tmpString22 != IntegerToString(localLong09,0,32) )   continue;
                     
                     if ( OrderType() == 0 )
                     {
                       OrderClose(OrderTicket(),OrderLots(),MarketInfo(currentSymbol,MODE_BID),(int)orderSlippageSetting,Red); 
                     }
                     if ( OrderType() != 1 )   continue;
                     OrderClose(OrderTicket(),OrderLots(),MarketInfo(currentSymbol,MODE_ASK),(int)orderSlippageSetting,Red); 
                     
                   }
                 }
                 else
                 {
                   OrderSend(currentSymbol,0,localDouble23,MarketInfo(currentSymbol,MODE_ASK),(int)orderSlippageSetting,0.0,0.0,IntegerToString(localLong09,0,32),legacyGlobalInt169,0,Green); 
                   legacyGlobalInt193 = 0 ;
                   localBool22 = true ;
                 }
               }
             }
           }
         }
         if ( ( localDouble21>0.0 || localBool22 ) )
         {
           localBool20 = true ;
         }
       }
       if ( !(localBool20) )
       {
         if ( ( legacyGlobalInt063 == 1 || (legacyGlobalInt063 != 2 && legacyGlobalInt063 != 3) ) )
         {
           tmpLong23 = localLong09;
           tmpDouble24 = stopLossPips;
           tmpDouble25 = localDouble10;
           tmpInt26 = 2;
           tmpDouble27 = 0.0;
           tmpBool28 = false;
           for (tmpInt29 = 0 ; tmpInt29 < legacyGlobalInt199 ; tmpInt29=tmpInt29 + 1)
           {
             if ( virtualStopByTicket[tmpInt29][0]==tmpLong23 )
             {
               tmpDouble27 = virtualStopByTicket[tmpInt29][1];
               tmpBool28 = true;
               break;
             }
           }
           if ( !(tmpBool28) )
           {
             if ( tmpInt26 == 1 )
             {
               tmpDouble27 = NormalizeDouble(tmpDouble25 - tmpDouble24 * pipSize,symbolDigits);
             }
             if ( tmpInt26 == 2 )
             {
               tmpDouble27 = NormalizeDouble(tmpDouble24 * pipSize + tmpDouble25,symbolDigits);
             }
             for (tmpInt30 = 0 ; tmpInt30 < legacyGlobalInt199 ; tmpInt30=tmpInt30 + 1)
             {
               if ( virtualStopByTicket[tmpInt30][0]==0.0 )
               {
                 virtualStopByTicket[tmpInt30][0] = (double)tmpLong23;
                 virtualStopByTicket[tmpInt30][1] = tmpDouble27;
                 break;
               }
             }
           }
           activeVirtualStopPrice = tmpDouble27 ;
           localDouble04 = activeVirtualStopPrice ;
           if ( MarketInfo(currentSymbol,MODE_ASK)>localDouble04 )
           {
             Print("Closing with virtual SL"); 
             RefreshRates(); 
             OrderClose(localLong09,localDouble12,MarketInfo(currentSymbol,MODE_ASK),(int)currentSpreadPrice,0xFFFFFFFF); 
             return(true); 
           }
           if ( legacyGlobalDouble125>0.0 && TimeCurrent() >= localDatetime13 + legacyGlobalInt304 && MarketInfo(currentSymbol,MODE_ASK)<localDouble07 - symbolPoint - legacyGlobalDouble126 * pipSize && MarketInfo(currentSymbol,MODE_ASK)>localDouble08 + freezeLevelPriceDistance && NormalizeDouble(MarketInfo(currentSymbol,MODE_ASK) + legacyGlobalDouble126 * pipSize,symbolDigits)<localDouble07 )
           {
             localDouble07 = NormalizeDouble(MarketInfo(currentSymbol,MODE_ASK) + legacyGlobalDouble126 * pipSize,symbolDigits) ;
             if ( localDouble07>MarketInfo(currentSymbol,MODE_ASK) + stopLevelPriceDistance )
             {
               legacyGlobalInt230 = OrderModify(localLong09,localDouble10,localDouble07,localDouble08,0,0xFFFFFFFF) ;
               if ( legacyGlobalInt230 <= 0 )
               {
                 Print("TrailStop error: '" + TradeErrorDescription(MT4_LastError()) + "' when setting trailing Exit_TrailSL_after_X_Minutes_size loss.  Trying again!"); 
               }
               localBool02 = true ;
             }
           }
           if ( legacyGlobalDouble103>0.0 && MarketInfo(currentSymbol,MODE_ASK)<localDouble07 - symbolPoint - (legacyGlobalDouble103 + trailingActivationBufferPips) * pipSize && MarketInfo(currentSymbol,MODE_ASK)<localDouble05 - legacyGlobalDouble104 * pipSize && MarketInfo(currentSymbol,MODE_ASK)>localDouble08 + freezeLevelPriceDistance && localDouble07>localDouble10 - legacyGlobalDouble105 * pipSize && NormalizeDouble(legacyGlobalDouble103 * pipSize + MarketInfo(currentSymbol,MODE_ASK),symbolDigits)<localDouble07 )
           {
             localDouble07 = NormalizeDouble(MarketInfo(currentSymbol,MODE_ASK) + legacyGlobalDouble103 * pipSize,symbolDigits) ;
             if ( localDouble07>MarketInfo(currentSymbol,MODE_ASK) + stopLevelPriceDistance )
             {
               legacyGlobalInt230 = OrderModify(localLong09,localDouble10,localDouble07,localDouble08,0,0xFFFFFFFF) ;
               if ( legacyGlobalInt230 <= 0 )
               {
                 Print("TrailStop error: '" + TradeErrorDescription(MT4_LastError()) + "' when setting trailing Exit_stop loss.  Trying again!"); 
               }
               else
               {
                 localDouble26 = NormalizeDouble(trailingPartialClosePercent / 100.0 * lotSizeByStrategy[currentStrategyIndex],2) ;
                 if ( localDouble26<localDouble12 && localDouble26>=MarketInfo(currentSymbol,MODE_LOTSTEP) )
                 {
                   OrderClose(localLong09,localDouble26,MarketInfo(currentSymbol,MODE_ASK),(int)orderSlippageSetting,Red); 
                   return(true); 
                 }
               }
               localBool02 = true ;
             }
           }
           if ( legacyGlobalDouble108>0.0 && MarketInfo(currentSymbol,MODE_BID)>NormalizeDouble(legacyGlobalDouble108 * pipSize + (localDouble08 + symbolPoint),symbolDigits) && MarketInfo(currentSymbol,MODE_BID)>NormalizeDouble(legacyGlobalDouble109 * pipSize + localDouble05,symbolDigits) && MarketInfo(currentSymbol,MODE_BID)>localDouble08 + freezeLevelPriceDistance )
           {
             localDouble08 = NormalizeDouble(MarketInfo(currentSymbol,MODE_BID) - legacyGlobalDouble108 * pipSize,symbolDigits) ;
             if ( localDouble08<MarketInfo(currentSymbol,MODE_BID) - stopLevelPriceDistance )
             {
               legacyGlobalInt230 = OrderModify(localLong09,localDouble10,localDouble07,localDouble08,0,0xFFFFFFFF) ;
               if ( legacyGlobalInt230 <= 0 )
               {
                 Print("TrailStop error: '" + TradeErrorDescription(MT4_LastError()) + "' when setting trailing Exit_TP.  Trying again!"); 
               }
               else
               {
                 localDouble27 = NormalizeDouble(trailingPartialClosePercent / 100.0 * lotSizeByStrategy[currentStrategyIndex],2) ;
                 if ( localDouble27<localDouble12 && localDouble27>=SymbolInfoDouble(currentSymbol,34) )
                 {
                   OrderClose(localLong09,localDouble27,MarketInfo(currentSymbol,MODE_ASK),(int)orderSlippageSetting,Red); 
                   return(true); 
                 }
               }
               localBool02 = true ;
             }
           }
           if ( localBool19 && legacyGlobalInt039 == 1 && slippageRecoveryTrailDistancePips>0.0 && MarketInfo(currentSymbol,MODE_ASK)<localDouble07 - symbolPoint - slippageRecoveryTrailDistancePips * pipSize && MarketInfo(currentSymbol,MODE_ASK)<localDouble17 - slippageRecoveryTriggerPips * pipSize && MarketInfo(currentSymbol,MODE_ASK)>localDouble08 + freezeLevelPriceDistance && localDouble07>localDouble10 - slippageRecoveryMaximumStopPips * pipSize && NormalizeDouble(MarketInfo(currentSymbol,MODE_ASK) + slippageRecoveryTrailDistancePips * pipSize,symbolDigits)<localDouble07 )
           {
             localDouble07 = NormalizeDouble(MarketInfo(currentSymbol,MODE_ASK) + slippageRecoveryTrailDistancePips * pipSize,symbolDigits) ;
             if ( localDouble07>MarketInfo(currentSymbol,MODE_ASK) + stopLevelPriceDistance )
             {
               legacyGlobalInt230 = OrderModify(localLong09,localDouble10,localDouble07,localDouble08,0,0xFFFFFFFF) ;
               if ( legacyGlobalInt230 <= 0 )
               {
                 Print("TrailStop error: '" + TradeErrorDescription(MT4_LastError()) + "' when setting Slip TL.  Trying again!"); 
               }
               else
               {
                 Print("Slippage controle active"); 
               }
               localBool02 = true ;
             }
           }
           if ( legacyGlobalInt119 >  0 && legacyGlobalInt120 >= 0 && UseHL_TrailingSL && legacyGlobalDouble241Array99[currentStrategyIndex]<localDouble07 - stopLevelPriceDistance - symbolPoint && legacyGlobalDouble241Array99[currentStrategyIndex]>legacyGlobalInt121 * pipSize + MarketInfo(currentSymbol,MODE_ASK) && ( legacyGlobalDouble241Array99[currentStrategyIndex]>localDouble10 || !(legacyGlobalBool116) ) && legacyGlobalDouble241Array99[currentStrategyIndex]>legacyGlobalInt122 * pipSize + MarketInfo(currentSymbol,MODE_ASK) + stopLevelPriceDistance + symbolPoint && MarketInfo(currentSymbol,MODE_ASK)>localDouble08 + freezeLevelPriceDistance && NormalizeDouble(legacyGlobalDouble241Array99[currentStrategyIndex],symbolDigits)<localDouble07 )
           {
             localDouble07 = NormalizeDouble(legacyGlobalDouble241Array99[currentStrategyIndex],symbolDigits) ;
             if ( localDouble07>MarketInfo(currentSymbol,MODE_ASK) + stopLevelPriceDistance )
             {
               legacyGlobalInt230 = OrderModify(localLong09,localDouble10,localDouble07,localDouble08,0,0xFFFFFFFF) ;
               if ( legacyGlobalInt230 <= 0 )
               {
                 Print("error: '" + TradeErrorDescription(MT4_LastError()) + "' when modifying stoploss"); 
               }
               localBool02 = true ;
             }
           }
           if ( legacyGlobalDouble113>0.0 && MarketInfo(currentSymbol,MODE_ASK)<localDouble10 - legacyGlobalDouble113 * pipSize && localDouble10 - legacyGlobalDouble114 * pipSize<localDouble07 - symbolPoint && MarketInfo(currentSymbol,MODE_ASK)<localDouble10 - legacyGlobalDouble114 * pipSize - stopLevelPriceDistance && MarketInfo(currentSymbol,MODE_ASK)>localDouble08 + freezeLevelPriceDistance && NormalizeDouble(localDouble10 - legacyGlobalDouble114 * pipSize,symbolDigits)<localDouble07 )
           {
             localDouble07 = NormalizeDouble(localDouble10 - legacyGlobalDouble114 * pipSize,symbolDigits) ;
