             if ( localDouble07>MarketInfo(currentSymbol,MODE_ASK) + stopLevelPriceDistance )
             {
               legacyGlobalInt230 = OrderModify(localLong09,localDouble10,localDouble07,localDouble08,0,0xFFFFFFFF) ;
               if ( legacyGlobalInt230 <= 0 )
               {
                 Print("error when setting breakeven: '" + TradeErrorDescription(MT4_LastError()) + "' ..'Exit_BE_start' to close to 'Exit_BE_extra_pips' ..trying again!"); 
               }
               localBool02 = true ;
             }
           }
           if ( !(localBool02) && ( legacyGlobalInt128 == 1 || (legacyGlobalInt128 == 2 && localDouble07 - magicTrailStepPips * pipSize>=localDouble05 - currentSpreadPrice - magicTrailMode2SpreadBufferPips * pipSize) ) )
           {
             legacyGlobalInt250 ++;
             if ( MarketInfo(currentSymbol,MODE_ASK)<localDouble07 - magicTrailStepPips * pipSize - stopLevelPriceDistance && MarketInfo(currentSymbol,MODE_ASK)>localDouble08 + freezeLevelPriceDistance && ( magicTrailActivationDistancePips==0.0 || MarketInfo(currentSymbol,MODE_ASK)<localDouble05 - legacyGlobalDouble247 * pipSize ) && legacyGlobalInt250 >= legacyGlobalInt130 && NormalizeDouble(localDouble07 - magicTrailStepPips * pipSize,symbolDigits)<localDouble07 )
             {
               legacyGlobalInt250 = 0 ;
               localDouble07 = NormalizeDouble(localDouble07 - magicTrailStepPips * pipSize,symbolDigits) ;
               OrderModify(localLong09,localDouble10,localDouble07,localDouble08,0,0xFFFFFFFF); 
               localBool02 = true ;
             }
           }
           activeVirtualStopPrice = localDouble07 ;
           if ( MarketInfo(currentSymbol,MODE_ASK)>localDouble07 )
           {
             Print("Closing with virtual SL"); 
             RefreshRates(); 
             OrderClose(localLong09,localDouble12,MarketInfo(currentSymbol,MODE_ASK),(int)currentSpreadPrice,0xFFFFFFFF); 
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
           tmpDouble36 = localDouble10;
           tmpInt37 = 2;
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
           if ( MarketInfo(currentSymbol,MODE_ASK)>=localDouble04 )
           {
             RefreshRates(); 
             OrderClose(localLong09,localDouble12,MarketInfo(currentSymbol,MODE_ASK),(int)currentSpreadPrice,0xFFFFFFFF); 
             return(true); 
           }
           localInt28 = (int)(TimeCurrent() - lastVirtualStopSyncTime) ;
           if ( localInt28 >= legacyGlobalInt065 )
           {
             if ( NormalizeDouble(activeVirtualStopPrice,symbolDigits)<localDouble07 - symbolPoint )
             {
               OrderModify(localLong09,localDouble10,NormalizeDouble(activeVirtualStopPrice,symbolDigits),localDouble08,0,0xFFFFFFFF); 
             }
             lastVirtualStopSyncTime = TimeCurrent() ;
           }
           if ( legacyGlobalDouble125>0.0 && TimeCurrent() >= localDatetime13 + legacyGlobalInt304 && MarketInfo(currentSymbol,MODE_ASK)<activeVirtualStopPrice - symbolPoint - legacyGlobalDouble126 * pipSize && MarketInfo(currentSymbol,MODE_ASK)>localDouble08 + freezeLevelPriceDistance )
           {
             activeVirtualStopPrice = MarketInfo(currentSymbol,MODE_ASK) + legacyGlobalDouble126 * pipSize ;
             localBool02 = true ;
           }
           if ( legacyGlobalDouble103>0.0 && MarketInfo(currentSymbol,MODE_ASK)<activeVirtualStopPrice - symbolPoint - (legacyGlobalDouble103 + trailingActivationBufferPips) * pipSize && MarketInfo(currentSymbol,MODE_ASK)<localDouble05 - legacyGlobalDouble104 * pipSize && activeVirtualStopPrice>localDouble10 - legacyGlobalDouble105 * pipSize )
           {
             activeVirtualStopPrice = legacyGlobalDouble103 * pipSize + MarketInfo(currentSymbol,MODE_ASK) ;
             localDouble29 = NormalizeDouble(trailingPartialClosePercent / 100.0 * lotSizeByStrategy[currentStrategyIndex],2) ;
             if ( localDouble29<localDouble12 && localDouble29>=MarketInfo(currentSymbol,MODE_LOTSTEP) )
             {
               OrderClose(localLong09,localDouble29,MarketInfo(currentSymbol,MODE_BID),(int)orderSlippageSetting,Red); 
               return(true); 
             }
             localBool02 = true ;
           }
           if ( localBool19 && legacyGlobalInt039 == 1 && slippageRecoveryTrailDistancePips>0.0 && MarketInfo(currentSymbol,MODE_ASK)<activeVirtualStopPrice - symbolPoint - slippageRecoveryTrailDistancePips * pipSize && MarketInfo(currentSymbol,MODE_ASK)<localDouble17 - slippageRecoveryTriggerPips * pipSize && MarketInfo(currentSymbol,MODE_ASK)>localDouble08 + freezeLevelPriceDistance && activeVirtualStopPrice>localDouble10 - slippageRecoveryMaximumStopPips * pipSize )
           {
             Print("Slippage controle active"); 
             localBool02 = true ;
             activeVirtualStopPrice = MarketInfo(currentSymbol,MODE_ASK) + slippageRecoveryTrailDistancePips * pipSize ;
           }
           if ( legacyGlobalInt119 >  0 && legacyGlobalInt120 >= 0 && legacyGlobalDouble241Array99[currentStrategyIndex]<activeVirtualStopPrice - stopLevelPriceDistance - symbolPoint && ( legacyGlobalDouble241Array99[currentStrategyIndex]>localDouble10 || !(legacyGlobalBool116) ) && legacyGlobalDouble241Array99[currentStrategyIndex]>legacyGlobalInt122 * pipSize + MarketInfo(currentSymbol,MODE_ASK) + stopLevelPriceDistance + symbolPoint && MarketInfo(currentSymbol,MODE_ASK)>localDouble08 + freezeLevelPriceDistance )
           {
             activeVirtualStopPrice = legacyGlobalDouble241Array99[currentStrategyIndex] ;
             localBool02 = true ;
           }
           if ( legacyGlobalDouble113>0.0 && legacyGlobalInt063 == 3 && MarketInfo(currentSymbol,MODE_ASK)<localDouble10 - legacyGlobalDouble113 * pipSize && localDouble10 - legacyGlobalDouble114 * pipSize<localDouble07 - symbolPoint && MarketInfo(currentSymbol,MODE_ASK)<localDouble10 - legacyGlobalDouble114 * pipSize - stopLevelPriceDistance && MarketInfo(currentSymbol,MODE_ASK)>localDouble08 + freezeLevelPriceDistance && NormalizeDouble(localDouble10 - legacyGlobalDouble114 * pipSize,symbolDigits)<activeVirtualStopPrice )
           {
             activeVirtualStopPrice = NormalizeDouble(localDouble10 - legacyGlobalDouble114 * pipSize,symbolDigits) ;
             legacyGlobalInt230 = OrderModify(localLong09,localDouble10,activeVirtualStopPrice,localDouble08,0,0xFFFFFFFF) ;
             if ( legacyGlobalInt230 <= 0 )
             {
               Print("error when setting breakeven: '" + TradeErrorDescription(MT4_LastError()) + "' ..'Exit_BE_start' to close to 'Exit_BE_extra_pips' ..trying again!"); 
             }
             localBool02 = true ;
           }
           if ( legacyGlobalDouble113>0.0 && legacyGlobalInt063 == 2 && MarketInfo(currentSymbol,MODE_ASK)<localDouble10 - legacyGlobalDouble113 * pipSize && localDouble10 - legacyGlobalDouble114 * pipSize<activeVirtualStopPrice - symbolPoint && MarketInfo(currentSymbol,MODE_ASK)<localDouble10 - legacyGlobalDouble114 * pipSize - stopLevelPriceDistance && MarketInfo(currentSymbol,MODE_ASK)>localDouble08 + freezeLevelPriceDistance )
           {
             activeVirtualStopPrice = localDouble10 - legacyGlobalDouble114 * pipSize ;
             localBool02 = true ;
           }
           if ( !(localBool02) && ( legacyGlobalInt128 == 1 || (legacyGlobalInt128 == 2 && activeVirtualStopPrice - magicTrailStepPips * pipSize>=localDouble05 - currentSpreadPrice - magicTrailMode2SpreadBufferPips * pipSize) ) )
           {
             legacyGlobalInt250 ++;
             if ( MarketInfo(currentSymbol,MODE_ASK)<activeVirtualStopPrice - magicTrailStepPips * pipSize - stopLevelPriceDistance && MarketInfo(currentSymbol,MODE_ASK)>localDouble08 + freezeLevelPriceDistance && ( magicTrailActivationDistancePips==0.0 || MarketInfo(currentSymbol,MODE_ASK)<localDouble05 - legacyGlobalDouble247 * pipSize ) && legacyGlobalInt250 >= legacyGlobalInt130 )
             {
               legacyGlobalInt250 = 0 ;
               activeVirtualStopPrice = activeVirtualStopPrice - magicTrailStepPips * pipSize ;
               localBool02 = true ;
             }
           }
           if ( MarketInfo(currentSymbol,MODE_ASK)>=activeVirtualStopPrice )
           {
             RefreshRates(); 
             OrderClose(localLong09,localDouble12,MarketInfo(currentSymbol,MODE_ASK),(int)currentSpreadPrice,0xFFFFFFFF); 
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
//lizong_19 <<==--------   --------
 bool IsTradingSessionOpen()
 {
  bool      localBool02;
  datetime  localDatetime03;
  int       localInt04;
//----- -----
 bool       tmpBool01;
 bool       tmpBool02;
 bool       tmpBool03;
 bool       tmpBool04;
 bool       tmpBool05;
 bool       tmpBool06;

 if ( !(tradingHoursEnabled) )
 {
   return(true); 
 }
 localBool02 = false ;
 localDatetime03 = 0 ;
 if ( legacyGlobalInt172 == 2 )
 {
   localDatetime03 = TimeCurrent() ;
 }
 if ( legacyGlobalInt172 == 0 )
 {
   TimeGMT(); 
 }
 if ( legacyGlobalInt172 == 1 )
 {
   TimeLocal(); 
 }
 localInt04 = TimeHour(localDatetime03) ;
 if ( TimeDayOfWeek(localDatetime03) == 0 )
 {
   if ( legacyGlobalInt174 <  legacyGlobalInt175 && ( localInt04 < legacyGlobalInt174 || localInt04 >= legacyGlobalInt175 ) )
   {
     tmpBool01 = false;
   }
   else
   {
     if ( legacyGlobalInt174 >  legacyGlobalInt175 && localInt04 <  legacyGlobalInt174 && localInt04 >= legacyGlobalInt175 )
     {
       tmpBool01 = false;
     }
     else
     {
       if ( legacyGlobalInt174 == legacyGlobalInt175 )
       {
         tmpBool01 = false;
       }
       else
       {
         tmpBool01 = true;
       }
     }
   }
   if ( tmpBool01 )
   {
     localBool02 = true ;
   }
 }
 if ( TimeDayOfWeek(localDatetime03) == 1 )
 {
   if ( legacyGlobalInt176 <  legacyGlobalInt177 && ( localInt04 < legacyGlobalInt176 || localInt04 >= legacyGlobalInt177 ) )
   {
     tmpBool02 = false;
   }
   else
   {
     if ( legacyGlobalInt176 >  legacyGlobalInt177 && localInt04 <  legacyGlobalInt176 && localInt04 >= legacyGlobalInt177 )
     {
       tmpBool02 = false;
     }
     else
     {
       if ( legacyGlobalInt176 == legacyGlobalInt177 )
       {
         tmpBool02 = false;
       }
       else
       {
         tmpBool02 = true;
       }
     }
   }
   if ( tmpBool02 )
   {
     localBool02 = true ;
   }
 }
 if ( TimeDayOfWeek(localDatetime03) == 2 )
 {
   if ( legacyGlobalInt178 <  legacyGlobalInt179 && ( localInt04 < legacyGlobalInt178 || localInt04 >= legacyGlobalInt179 ) )
   {
     tmpBool03 = false;
   }
   else
   {
     if ( legacyGlobalInt178 >  legacyGlobalInt179 && localInt04 <  legacyGlobalInt178 && localInt04 >= legacyGlobalInt179 )
     {
       tmpBool03 = false;
     }
     else
     {
       if ( legacyGlobalInt178 == legacyGlobalInt179 )
       {
         tmpBool03 = false;
       }
       else
       {
         tmpBool03 = true;
       }
     }
   }
   if ( tmpBool03 )
   {
     localBool02 = true ;
   }
 }
 if ( TimeDayOfWeek(localDatetime03) == 3 )
 {
   if ( legacyGlobalInt180 <  legacyGlobalInt181 && ( localInt04 < legacyGlobalInt180 || localInt04 >= legacyGlobalInt181 ) )
   {
     tmpBool04 = false;
   }
   else
   {
     if ( legacyGlobalInt180 >  legacyGlobalInt181 && localInt04 <  legacyGlobalInt180 && localInt04 >= legacyGlobalInt181 )
     {
       tmpBool04 = false;
     }
     else
     {
       if ( legacyGlobalInt180 == legacyGlobalInt181 )
       {
         tmpBool04 = false;
       }
       else
       {
         tmpBool04 = true;
       }
     }
   }
   if ( tmpBool04 )
   {
     localBool02 = true ;
   }
 }
 if ( TimeDayOfWeek(localDatetime03) == 4 )
 {
   if ( legacyGlobalInt182 <  legacyGlobalInt183 && ( localInt04 < legacyGlobalInt182 || localInt04 >= legacyGlobalInt183 ) )
   {
     tmpBool05 = false;
   }
   else
   {
     if ( legacyGlobalInt182 >  legacyGlobalInt183 && localInt04 <  legacyGlobalInt182 && localInt04 >= legacyGlobalInt183 )
     {
       tmpBool05 = false;
     }
     else
     {
       if ( legacyGlobalInt182 == legacyGlobalInt183 )
       {
         tmpBool05 = false;
       }
       else
       {
         tmpBool05 = true;
       }
     }
   }
   if ( tmpBool05 )
   {
     localBool02 = true ;
   }
 }
 if ( TimeDayOfWeek(localDatetime03) == 5 )
 {
   if ( legacyGlobalInt184 <  legacyGlobalInt185 && ( localInt04 < legacyGlobalInt184 || localInt04 >= legacyGlobalInt185 ) )
   {
     tmpBool06 = false;
   }
   else
   {
     if ( legacyGlobalInt184 >  legacyGlobalInt185 && localInt04 <  legacyGlobalInt184 && localInt04 >= legacyGlobalInt185 )
     {
       tmpBool06 = false;
     }
     else
     {
       if ( legacyGlobalInt184 == legacyGlobalInt185 )
       {
         tmpBool06 = false;
       }
       else
       {
         tmpBool06 = true;
       }
     }
   }
   if ( tmpBool06 )
   {
     localBool02 = true ;
   }
 }
 return(localBool02); 
 }
//lizong_20 <<==--------   --------
 string TradeErrorDescription( int argInt00)
 {
  string    localString01;
//----- -----

 legacyGlobalInt274 ++;
 switch(argInt00)
 {
   case 0 : case 1 :
   localString01 = "no error" ;
     break;
   case 2 :
   localString01 = "common error" ;
     break;
   case 3 :
   localString01 = "invalid trade parameters" ;
     break;
   case 4 :
   localString01 = "trade server is busy" ;
     break;
   case 5 :
   localString01 = "old version of the client terminal" ;
     break;
   case 6 :
   localString01 = "no connection with trade server" ;
     break;
   case 7 :
   localString01 = "not enough rights" ;
     break;
   case 8 :
   localString01 = "too frequent requests" ;
     break;
   case 9 :
   localString01 = "malfunctional trade operation (never returned error)" ;
     break;
   case 64 :
   localString01 = "account disabled" ;
     break;
   case 65 :
   localString01 = "invalid account" ;
     break;
   case 128 :
   localString01 = "trade timeout" ;
     break;
   case 129 :
   localString01 = "invalid price" ;
     break;
   case 130 :
   localString01 = "invalid stops" ;
     break;
   case 131 :
   localString01 = "invalid trade volume" ;
     break;
   case 132 :
   localString01 = "market is closed" ;
     break;
   case 133 :
   localString01 = "trade is disabled" ;
     break;
   case 134 :
   localString01 = "not enough money" ;
     break;
   case 135 :
   localString01 = "price changed" ;
     break;
   case 136 :
   localString01 = "off quotes" ;
     break;
   case 137 :
   localString01 = "broker is busy (never returned error)" ;
     break;
   case 138 :
   localString01 = "requote" ;
     break;
   case 139 :
   localString01 = "order is locked" ;
     break;
   case 140 :
   localString01 = "long positions only allowed" ;
     break;
   case 141 :
   localString01 = "too many requests" ;
     break;
   case 145 :
   localString01 = "modification denied because order too close to market" ;
     break;
   case 146 :
   localString01 = "trade context is busy" ;
     break;
   case 147 :
   localString01 = "expirations are denied by broker" ;
     break;
   case 148 :
   localString01 = "amount of open and pending orders has reached the Exit_limit" ;
     break;
   case 149 :
   localString01 = "hedging is prohibited" ;
     break;
