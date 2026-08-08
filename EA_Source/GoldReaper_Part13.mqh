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
                   OrderClose(OrderTicket(),OrderLots(),MarketInfo(currentSymbol,MODE_BID),3,Red); 
                 }
                 if ( OrderMagicNumber() != legacyGlobalInt168 )   continue;
                 tmpString11 = OrderComment();
                 if ( tmpString11 != IntegerToString(tmpLong18,0,32) )   continue;
                 
                 if ( OrderType() == 0 )
                 {
                   OrderClose(OrderTicket(),OrderLots(),MarketInfo(currentSymbol,MODE_BID),(int)orderSlippageSetting,Red); 
                 }
                 if ( OrderType() != 1 )   continue;
                 OrderClose(OrderTicket(),OrderLots(),MarketInfo(currentSymbol,MODE_ASK),(int)orderSlippageSetting,Red); 
                 
               }
               buyZoneStateInitialized = false ;
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
             if ( legacyGlobalInt192 == 0 )
             {
               localDouble24 = localDouble21 * zoneRecoveryStepDistancePips * pipSize + (localDouble17 - zoneRecoveryInitialDistancePips * pipSize) ;
               if ( localDouble24>localDouble17 - zoneRecoveryMinimumDistancePips * pipSize )
               {
                 localDouble24 = localDouble17 - zoneRecoveryMinimumDistancePips * pipSize ;
               }
               if ( MarketInfo(currentSymbol,MODE_BID)<localDouble24 )
               {
                 if ( localDouble21>=legacyGlobalInt166 )
                 {
                   for (tmpInt20 = MT4OrdersTotal() ; tmpInt20 >= 0 ; tmpInt20=tmpInt20 - 1)
                   {
                     if ( OrderSelect(tmpInt20,0,0) != true )   continue;
                     
                     if ( OrderMagicNumber() == strategyMagicNumber && OrderTicket() == localLong09 )
                     {
                       OrderClose(OrderTicket(),OrderLots(),MarketInfo(currentSymbol,MODE_BID),3,Red); 
                     }
                     if ( OrderMagicNumber() != legacyGlobalInt168 )   continue;
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
                   OrderSend(currentSymbol,1,localDouble23,MarketInfo(currentSymbol,MODE_BID),(int)orderSlippageSetting,0.0,0.0,IntegerToString(localLong09,0,32),legacyGlobalInt168,0,Green); 
                   legacyGlobalInt192 = 1 ;
                   localBool22 = true ;
                 }
               }
             }
             else
             {
               localDouble25 = localDouble17 ;
               if ( MarketInfo(currentSymbol,MODE_ASK)>localDouble17 )
               {
                 if ( localDouble21>=legacyGlobalInt166 )
                 {
                   for (tmpInt21 = MT4OrdersTotal() ; tmpInt21 >= 0 ; tmpInt21=tmpInt21 - 1)
                   {
                     if ( OrderSelect(tmpInt21,0,0) != true )   continue;
                     
                     if ( OrderMagicNumber() == strategyMagicNumber && OrderTicket() == localLong09 )
                     {
                       OrderClose(OrderTicket(),OrderLots(),MarketInfo(currentSymbol,MODE_BID),3,Red); 
                     }
                     if ( OrderMagicNumber() != legacyGlobalInt168 )   continue;
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
                   OrderSend(currentSymbol,0,localDouble23,MarketInfo(currentSymbol,MODE_ASK),(int)orderSlippageSetting,0.0,0.0,IntegerToString(localLong09,0,32),legacyGlobalInt168,0,Green); 
                   legacyGlobalInt192 = 0 ;
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
         if ( ( legacyGlobalInt063 == 1 || (legacyGlobalInt063 != 3 && legacyGlobalInt063 != 2) ) )
         {
           tmpLong23 = localLong09;
           tmpDouble24 = stopLossPips;
           tmpDouble25 = localDouble10;
           tmpInt26 = 1;
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
           if ( MarketInfo(currentSymbol,MODE_BID)<localDouble04 )
           {
             Print("Closing with virtual SL"); 
             RefreshRates(); 
             OrderClose(localLong09,localDouble12,MarketInfo(currentSymbol,MODE_BID),(int)currentSpreadPrice,0xFFFFFFFF); 
             return(true); 
           }
           if ( legacyGlobalDouble125>0.0 && TimeCurrent() >= localDatetime13 + legacyGlobalInt304 && MarketInfo(currentSymbol,MODE_BID)>NormalizeDouble(legacyGlobalDouble126 * pipSize + (localDouble07 + symbolPoint),symbolDigits) && MarketInfo(currentSymbol,MODE_BID)<localDouble08 - freezeLevelPriceDistance )
           {
             localDouble07 = NormalizeDouble(MarketInfo(currentSymbol,MODE_BID) - legacyGlobalDouble126 * pipSize,symbolDigits) ;
             if ( localDouble07<MarketInfo(currentSymbol,MODE_BID) - stopLevelPriceDistance )
             {
               legacyGlobalInt230 = OrderModify(localLong09,localDouble10,localDouble07,localDouble08,0,0xFFFFFFFF) ;
               if ( legacyGlobalInt230 <= 0 )
               {
                 Print("TrailStop error: '" + TradeErrorDescription(MT4_LastError()) + "' when setting trailing Exit_TrailSL_after_X_Minutes_size loss.  Trying again!"); 
               }
               localBool02 = true ;
             }
           }
           if ( legacyGlobalDouble103>0.0 && MarketInfo(currentSymbol,MODE_BID)>NormalizeDouble((legacyGlobalDouble103 + trailingActivationBufferPips) * pipSize + (localDouble07 + symbolPoint),symbolDigits) && MarketInfo(currentSymbol,MODE_BID)>NormalizeDouble(legacyGlobalDouble104 * pipSize + localDouble05,symbolDigits) && MarketInfo(currentSymbol,MODE_BID)<localDouble08 - freezeLevelPriceDistance && localDouble07<NormalizeDouble(legacyGlobalDouble105 * pipSize + localDouble10,symbolDigits) )
           {
             localDouble07 = NormalizeDouble(MarketInfo(currentSymbol,MODE_BID) - legacyGlobalDouble103 * pipSize,symbolDigits) ;
             if ( localDouble07<MarketInfo(currentSymbol,MODE_BID) - stopLevelPriceDistance )
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
                   OrderClose(localLong09,localDouble26,MarketInfo(currentSymbol,MODE_BID),(int)orderSlippageSetting,Red); 
                   return(true); 
                 }
               }
               localBool02 = true ;
             }
           }
           if ( legacyGlobalDouble108>0.0 && MarketInfo(currentSymbol,MODE_ASK)<NormalizeDouble(localDouble08 - symbolPoint - legacyGlobalDouble108 * pipSize,symbolDigits) && MarketInfo(currentSymbol,MODE_ASK)<NormalizeDouble(localDouble05 - legacyGlobalDouble109 * pipSize,symbolDigits) && MarketInfo(currentSymbol,MODE_BID)<localDouble08 - freezeLevelPriceDistance )
           {
             localDouble08 = NormalizeDouble(MarketInfo(currentSymbol,MODE_BID) + legacyGlobalDouble108 * pipSize,symbolDigits) ;
             if ( localDouble08>MarketInfo(currentSymbol,MODE_ASK) + stopLevelPriceDistance )
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
                   OrderClose(localLong09,localDouble27,MarketInfo(currentSymbol,MODE_BID),(int)orderSlippageSetting,Red); 
                   return(true); 
                 }
               }
               localBool02 = true ;
             }
           }
           if ( localBool19 && legacyGlobalInt039 == 1 && slippageRecoveryTrailDistancePips>0.0 && MarketInfo(currentSymbol,MODE_BID)>NormalizeDouble(slippageRecoveryTrailDistancePips * pipSize + (localDouble07 + symbolPoint),symbolDigits) && MarketInfo(currentSymbol,MODE_BID)>NormalizeDouble(slippageRecoveryTriggerPips * pipSize + localDouble17,symbolDigits) && MarketInfo(currentSymbol,MODE_BID)<localDouble08 - freezeLevelPriceDistance && localDouble07<NormalizeDouble(slippageRecoveryMaximumStopPips * pipSize + localDouble10,symbolDigits) )
           {
             localDouble07 = NormalizeDouble(MarketInfo(currentSymbol,MODE_BID) - slippageRecoveryTrailDistancePips * pipSize,symbolDigits) ;
             if ( localDouble07<MarketInfo(currentSymbol,MODE_BID) - stopLevelPriceDistance )
             {
               legacyGlobalInt230 = OrderModify(localLong09,localDouble10,localDouble07,localDouble08,0,0xFFFFFFFF) ;
               if ( legacyGlobalInt230 <= 0 )
               {
                 Print("TrailStop error: '" + TradeErrorDescription(MT4_LastError()) + "' when setting Slip TL.  Trying again!"); 
               }
               else
               {
                 Print("Slippage control active"); 
               }
               localBool02 = true ;
             }
           }
           if ( legacyGlobalInt119 >  0 && legacyGlobalInt120 >= 0 && UseHL_TrailingSL && legacyGlobalDouble242Array99[currentStrategyIndex]>NormalizeDouble(localDouble07 + stopLevelPriceDistance + symbolPoint,symbolDigits) && legacyGlobalDouble242Array99[currentStrategyIndex]<MarketInfo(currentSymbol,MODE_BID) - legacyGlobalInt121 * pipSize && ( legacyGlobalDouble242Array99[currentStrategyIndex]<localDouble10 || !(legacyGlobalBool116) ) && legacyGlobalDouble242Array99[currentStrategyIndex]<NormalizeDouble(MarketInfo(currentSymbol,MODE_BID) - legacyGlobalInt122 * pipSize - stopLevelPriceDistance - symbolPoint,symbolDigits) && MarketInfo(currentSymbol,MODE_BID)<localDouble08 - freezeLevelPriceDistance )
           {
             localDouble07 = NormalizeDouble(legacyGlobalDouble242Array99[currentStrategyIndex],symbolDigits) ;
             if ( localDouble07<MarketInfo(currentSymbol,MODE_BID) - stopLevelPriceDistance )
             {
               legacyGlobalInt230 = OrderModify(localLong09,localDouble10,localDouble07,localDouble08,0,0xFFFFFFFF) ;
               if ( legacyGlobalInt230 <= 0 )
               {
                 Print("error: '" + TradeErrorDescription(MT4_LastError()) + "' when modifying stoploss"); 
               }
               localBool02 = true ;
             }
           }
           if ( legacyGlobalDouble113>0.0 && MarketInfo(currentSymbol,MODE_BID)>NormalizeDouble(legacyGlobalDouble113 * pipSize + localDouble10,symbolDigits) && NormalizeDouble(legacyGlobalDouble114 * pipSize + localDouble10,symbolDigits)>localDouble07 + symbolPoint && MarketInfo(currentSymbol,MODE_BID)>NormalizeDouble(legacyGlobalDouble114 * pipSize + localDouble10 + stopLevelPriceDistance,symbolDigits) && MarketInfo(currentSymbol,MODE_BID)<localDouble08 - freezeLevelPriceDistance )
           {
             localDouble07 = NormalizeDouble(legacyGlobalDouble114 * pipSize + localDouble10,symbolDigits) ;
             if ( localDouble07<MarketInfo(currentSymbol,MODE_BID) - stopLevelPriceDistance )
             {
               legacyGlobalInt230 = OrderModify(localLong09,localDouble10,localDouble07,localDouble08,0,0xFFFFFFFF) ;
               if ( legacyGlobalInt230 <= 0 )
               {
                 Print("error when setting breakeven: '" + TradeErrorDescription(MT4_LastError()) + "' ..'Exit_BE_start' to close to 'Exit_BE_extra_pips' ..trying again!"); 
               }
               localBool02 = true ;
             }
           }
           if ( !(localBool02) && ( legacyGlobalInt128 == 1 || (legacyGlobalInt128 == 2 && magicTrailStepPips * pipSize + localDouble07<=magicTrailMode2SpreadBufferPips * pipSize + (localDouble05 + currentSpreadPrice)) ) )
           {
             legacyGlobalInt250 ++;
             if ( MarketInfo(currentSymbol,MODE_BID)>magicTrailStepPips * pipSize + localDouble07 + stopLevelPriceDistance && MarketInfo(currentSymbol,MODE_BID)<localDouble08 - freezeLevelPriceDistance && ( magicTrailActivationDistancePips==0.0 || MarketInfo(currentSymbol,MODE_BID)>legacyGlobalDouble247 * pipSize + localDouble05 ) && legacyGlobalInt250 >= legacyGlobalInt130 && NormalizeDouble(magicTrailStepPips * pipSize + localDouble07,symbolDigits)>localDouble07 )
             {
               legacyGlobalInt250 = 0 ;
               localDouble07 = NormalizeDouble(magicTrailStepPips * pipSize + localDouble07,symbolDigits) ;
               OrderModify(localLong09,localDouble10,localDouble07,localDouble08,0,0xFFFFFFFF); 
               localBool02 = true ;
             }
           }
           activeVirtualStopPrice = localDouble07 ;
           if ( MarketInfo(currentSymbol,MODE_BID)<localDouble07 )
           {
             Print("Closing with virtual SL"); 
             RefreshRates(); 
             OrderClose(localLong09,localDouble12,MarketInfo(currentSymbol,MODE_BID),(int)currentSpreadPrice,0xFFFFFFFF); 
             return(true); 
           }
           if ( NormalizeDouble(localDouble04,symbolDigits)!=NormalizeDouble(activeVirtualStopPrice,symbolDigits) )
           {
             tmpDouble31 = NormalizeDouble(activeVirtualStopPrice,symbolDigits);
             tmpLong32 = localLong09;
             for (tmpInt33 = 0 ; tmpInt33 < legacyGlobalInt199 ; tmpInt33=tmpInt33 + 1)
             {
               if ( virtualStopByTicket[tmpInt33][0]==tmpLong32 )
               {
                 virtualStopByTicket[tmpInt33][1] = tmpDouble31;
                 break;
               }
             }
           }
           if ( localBool02 && returnAfterStopModification )
           {
             return(true); 
           }
         }
         if ( ( legacyGlobalInt063 == 2 || legacyGlobalInt063 == 3 ) )
         {
           tmpLong34 = localLong09;
           tmpDouble35 = stopLossPips;
