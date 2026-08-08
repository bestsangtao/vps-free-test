               OrderDelete(OrderTicket(),0xFFFFFFFF); 
               
             }
           }
         }
         if ( NFP_CloseOpenTrades )
         {
           for (tmpInt54 = MT4OrdersTotal() ; tmpInt54 >= 0 ; tmpInt54=tmpInt54 - 1)
           {
             if ( OrderSelect(tmpInt54,0,0) != true || OrderSymbol() != currentSymbol )   continue;
             tmpInt55 = OrderMagicNumber();
             tmpInt56=ST1_MagicNumber + 1;
             if ( tmpInt55 != tmpInt56 )
             {
               tmpInt56 = OrderMagicNumber();
               tmpInt57=ST1_MagicNumber + 2;
               if ( tmpInt56 != tmpInt57 )
               {
                 tmpInt57 = OrderMagicNumber();
                 tmpInt58=ST1_MagicNumber + 3;
                 if ( tmpInt57 != tmpInt58 )
                 {
                   tmpInt58 = OrderMagicNumber();
                   tmpInt59=ST1_MagicNumber + 4;
                   if ( tmpInt58 != tmpInt59 )
                   {
                     tmpInt59 = OrderMagicNumber();
                     tmpInt60=ST1_MagicNumber + 5;
                     if ( tmpInt59 != tmpInt60 )
                     {
                       tmpInt60 = OrderMagicNumber();
                       tmpInt61=ST1_MagicNumber + 6;
                       if ( tmpInt60 != tmpInt61 )
                       {
                         tmpInt61 = OrderMagicNumber();
                         tmpInt62=ST1_MagicNumber + 7;
                         if ( tmpInt61 != tmpInt62 )
                         {
                           tmpInt62 = OrderMagicNumber();
                           tmpInt63=ST1_MagicNumber + 8;
                           if ( tmpInt62 != tmpInt63 )
                           {
                             tmpInt63 = OrderMagicNumber();
                             tmpInt64=ST1_MagicNumber + 9;
                             if ( tmpInt63 != tmpInt64 )
                             {
                               tmpInt64 = OrderMagicNumber();
                               tmpInt65=ST1_MagicNumber + 10;
                               if ( tmpInt64 != tmpInt65 )
                               {
                                 tmpInt65 = OrderMagicNumber();
                                 tmpInt66=ST1_MagicNumber + 11;
                                 if ( tmpInt65 != tmpInt66 )
                                 {
                                   tmpInt66 = OrderMagicNumber();
                                   tmpInt67=ST1_MagicNumber + 12;
                                   if ( tmpInt66 != tmpInt67 )
                                   {
                                     tmpInt67 = OrderMagicNumber();
                                     tmpInt68=ST1_MagicNumber + 13;
                                     if ( tmpInt67 != tmpInt68 )
                                     {
                                       tmpInt68 = OrderMagicNumber();
                                       tmpInt69=ST1_MagicNumber + 14;
                                       if ( tmpInt68 != tmpInt69 )
                                       {
                                         tmpInt69 = OrderMagicNumber();
                                         tmpInt70=ST1_MagicNumber + 15;
                                       if ( tmpInt69 != tmpInt70 )   continue;
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
               OrderClose(OrderTicket(),OrderLots(),MarketInfo(currentSymbol,MODE_BID),99999,Red); 
             }
             if ( OrderType() != 1 )   continue;
             OrderClose(OrderTicket(),OrderLots(),MarketInfo(currentSymbol,MODE_ASK),99999,Red); 
             
           }
         }
         if ( !(nfpTradingSuspended) )
         {
           Print("NFP!! deleting trades!!"); 
         }
         nfpTradingSuspended = true ;
       }
       else
       {
         nfpTradingSuspended = false ;
       }
     }
   }
 }
 if ( nfpTradingSuspended )
 {
   return(0); 
 }
 if ( fridayStopEnabled )
 {
   if ( DayOfWeek() == 5 && Hour() >= FridayStopHour && !(fridayTradingSuspended) )
   {
     for (tmpInt71 = MT4OrdersTotal() ; tmpInt71 >= 0 ; tmpInt71=tmpInt71 - 1)
     {
       if ( OrderSelect(tmpInt71,0,0) != true || OrderSymbol() != currentSymbol )   continue;
       tmpInt72 = OrderMagicNumber();
       tmpInt73=ST1_MagicNumber + 1;
       if ( tmpInt72 != tmpInt73 )
       {
         tmpInt73 = OrderMagicNumber();
         tmpInt74=ST1_MagicNumber + 2;
         if ( tmpInt73 != tmpInt74 )
         {
           tmpInt74 = OrderMagicNumber();
           tmpInt75=ST1_MagicNumber + 3;
           if ( tmpInt74 != tmpInt75 )
           {
             tmpInt75 = OrderMagicNumber();
             tmpInt76=ST1_MagicNumber + 4;
             if ( tmpInt75 != tmpInt76 )
             {
               tmpInt76 = OrderMagicNumber();
               tmpInt77=ST1_MagicNumber + 5;
               if ( tmpInt76 != tmpInt77 )
               {
                 tmpInt77 = OrderMagicNumber();
                 tmpInt78=ST1_MagicNumber + 6;
                 if ( tmpInt77 != tmpInt78 )
                 {
                   tmpInt78 = OrderMagicNumber();
                   tmpInt79=ST1_MagicNumber + 7;
                   if ( tmpInt78 != tmpInt79 )
                   {
                     tmpInt79 = OrderMagicNumber();
                     tmpInt80=ST1_MagicNumber + 8;
                     if ( tmpInt79 != tmpInt80 )
                     {
                       tmpInt80 = OrderMagicNumber();
                       tmpInt81=ST1_MagicNumber + 9;
                       if ( tmpInt80 != tmpInt81 )
                       {
                         tmpInt81 = OrderMagicNumber();
                         tmpInt82=ST1_MagicNumber + 10;
                         if ( tmpInt81 != tmpInt82 )
                         {
                           tmpInt82 = OrderMagicNumber();
                           tmpInt83=ST1_MagicNumber + 11;
                           if ( tmpInt82 != tmpInt83 )
                           {
                             tmpInt83 = OrderMagicNumber();
                             tmpInt84=ST1_MagicNumber + 12;
                             if ( tmpInt83 != tmpInt84 )
                             {
                               tmpInt84 = OrderMagicNumber();
                               tmpInt85=ST1_MagicNumber + 13;
                               if ( tmpInt84 != tmpInt85 )
                               {
                                 tmpInt85 = OrderMagicNumber();
                                 tmpInt86=ST1_MagicNumber + 14;
                                 if ( tmpInt85 != tmpInt86 )
                                 {
                                   tmpInt86 = OrderMagicNumber();
                                   tmpInt87=ST1_MagicNumber + 15;
                                 if ( tmpInt86 != tmpInt87 )   continue;
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
       if ( FridayCloseOpen && OrderType() == 0 )
       {
         OrderClose(OrderTicket(),OrderLots(),MarketInfo(currentSymbol,MODE_BID),(int)orderSlippageSetting,Red); 
       }
       if ( FridayCloseOpen && OrderType() == 1 )
       {
         OrderClose(OrderTicket(),OrderLots(),MarketInfo(currentSymbol,MODE_ASK),(int)orderSlippageSetting,Red); 
       }
       if ( ( OrderType() != 4 && OrderType() != 5 ) || !(FridayClosePending) )   continue;
       OrderDelete(OrderTicket(),Red); 
       
     }
     Print("Weekend starting! closing trades.."); 
     fridayTradingSuspended = true ;
     return(0); 
   }
   if ( DayOfWeek() != 5 && fridayTradingSuspended == true )
   {
     fridayTradingSuspended = false ;
     if ( restorePendingOrdersAfterFridayPause )
     {
       RestoreStoredPendingOrders(); 
       return(0); 
     }
   }
 }
 currentSpreadPrice = MarketInfo(currentSymbol,MODE_ASK) - MarketInfo(currentSymbol,MODE_BID) ;
 if ( suspendPendingOrdersOnHighSpread )
 {
   if ( currentSpreadPrice>MaxSpread * pipSize )
   {
     SuspendPendingOrdersOnHighSpread(); 
     return(0); 
   }
   if ( currentSpreadPrice<=maxSpreadPips * pipSize && ( !(fridayStopEnabled) || DayOfWeek() != 5 || Hour() <  FridayStopHour ) && ( !(tradingHoursEnabled) || IsTradingSessionOpen() ) )
   {
     RestoreStoredPendingOrders(); 
   }
 }
 if ( entryStrategyMode == 1 )
 {
   tmpInt88 = 0;
   for (tmpInt89 = MT4OrdersTotal() ; tmpInt89 >= 0 ; tmpInt89=tmpInt89 - 1)
   {
     if ( OrderSelect(tmpInt89,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 4 )   continue;
     tmpInt88=tmpInt88 + 1;
     
   }
   if ( tmpInt88 >  maxPendingOrders )
   {
     tmpDouble90 = 0.0;
     tmpLong91 = 0;
     for (tmpInt92 = MT4OrdersTotal() ; tmpInt92 >= 0 ; tmpInt92=tmpInt92 - 1)
     {
       if ( OrderSelect(tmpInt92,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 4 || !(OrderOpenPrice()>tmpDouble90) )   continue;
       tmpLong91 = OrderTicket();
       tmpDouble90 = OrderOpenPrice();
       
     }
     if ( tmpLong91 != 0 )
     {
       OrderDelete(tmpLong91,Green); 
       tmpLong93 = tmpLong91;
       for (tmpInt94 = 0 ; tmpInt94 < 100 ; tmpInt94=tmpInt94 + 1)
       {
         if ( !(pendingTicketPriceMap[tmpInt94][0]==tmpLong93) )   continue;
         pendingTicketPriceMap[tmpInt94][0] = 0.0;
         pendingTicketPriceMap[tmpInt94][1] = 0.0;
         break;
         
       }
       Print("Max number of pending buy orders reached... deleting highest buystop order!"); 
     }
   }
   tmpInt95 = 0;
   for (tmpInt96 = MT4OrdersTotal() ; tmpInt96 >= 0 ; tmpInt96=tmpInt96 - 1)
   {
     if ( OrderSelect(tmpInt96,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 5 )   continue;
     tmpInt95=tmpInt95 + 1;
     
   }
   if ( tmpInt95 >  maxPendingOrders )
   {
     tmpDouble97 = 9999.0;
     tmpLong98 = 0;
     for (tmpInt99 = MT4OrdersTotal() ; tmpInt99 >= 0 ; tmpInt99=tmpInt99 - 1)
     {
       if ( OrderSelect(tmpInt99,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 5 || !(OrderOpenPrice()<tmpDouble97) )   continue;
       tmpLong98 = OrderTicket();
       tmpDouble97 = OrderOpenPrice();
       
     }
     if ( tmpLong98 != 0 )
     {
       OrderDelete(tmpLong98,Green); 
       tmpLong100 = tmpLong98;
       for (tmpInt101 = 0 ; tmpInt101 < 100 ; tmpInt101=tmpInt101 + 1)
       {
         if ( !(pendingTicketPriceMap[tmpInt101][0]==tmpLong100) )   continue;
         pendingTicketPriceMap[tmpInt101][0] = 0.0;
         pendingTicketPriceMap[tmpInt101][1] = 0.0;
         break;
         
       }
       Print("Max number of pending sell orders reached... deleting lowest sellstop order!"); 
     }
   }
 }
 if ( !(fridayTradingSuspended) && entryStrategyMode == 1 && !(tradingHoursState) )
 {
   if ( ( legacyGlobalInt322Array99[currentStrategyIndex] != iBars(currentSymbol,MT4Period(legacyGlobalInt072)) || legacyGlobalInt072 == 0 ) )
   {
     legacyGlobalInt322Array99[currentStrategyIndex] = iBars(currentSymbol,MT4Period(legacyGlobalInt072));
     if ( legacyGlobalInt119 >  0 && legacyGlobalInt120 >= 0 )
     {
       legacyGlobalDouble241Array99[currentStrategyIndex] = legacyGlobalDouble123 * pipSize + (FindConfirmedSwingHigh(legacyGlobalInt117,legacyGlobalInt119,legacyGlobalInt120) + currentSpreadPrice);
       legacyGlobalDouble242Array99[currentStrategyIndex] = FindConfirmedSwingLow(legacyGlobalInt117,legacyGlobalInt119,legacyGlobalInt120) - legacyGlobalDouble123 * pipSize;
     }
     if ( legacyGlobalInt187 >  0 )
     {
       localInt08=MathRand() * legacyGlobalInt187 / 32768 + 1;
       legacyGlobalInt015 = localInt08 ;
       Print("Slippage: " + (string(localInt08))); 
     }
     if ( legacyGlobalInt063 != 1 )
     {
       tmpInt102 = 0;
       for (tmpInt103 = MT4OrdersTotal() ; tmpInt103 >= 0 ; tmpInt103=tmpInt103 - 1)
       {
         if ( OrderSelect(tmpInt103,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 0 )   continue;
         tmpInt102=tmpInt102 + 1;
         
       }
       if ( tmpInt102 == 0 )
       {
         tmpInt104 = 0;
         for (tmpInt105 = MT4OrdersTotal() ; tmpInt105 >= 0 ; tmpInt105=tmpInt105 - 1)
         {
           if ( OrderSelect(tmpInt105,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 1 )   continue;
           tmpInt104=tmpInt104 + 1;
           
         }
         if ( tmpInt104 == 0 )
         {
           tmpBool106 = false;
           for (tmpInt107 = 0 ; tmpInt107 < legacyGlobalInt199 ; tmpInt107=tmpInt107 + 1)
           {
             if ( !(virtualStopByTicket[tmpInt107][0]>0.0) )   continue;
             tmpBool106 = false;
             for (tmpInt108 = MT4OrdersTotal() ; tmpInt108 >= 0 ; tmpInt108=tmpInt108 - 1)
             {
               if ( OrderSelect(tmpInt108,0,0) != true )   continue;
               
               if ( ( OrderType() != 0 && OrderType() != 1 ) || !(OrderTicket()==virtualStopByTicket[tmpInt107][0]) )   continue;
               tmpBool106 = true;
               
             }
             if ( tmpBool106 )   continue;
             virtualStopByTicket[tmpInt107][0] = 0.0;
             virtualStopByTicket[tmpInt107][1] = 0.0;
             
           }
         }
       }
     }
     for (localInt09 = 0 ; localInt09 < maxPendingOrders ; localInt09 ++)
     {
       ManagePendingEntryOrders(); 
     }
   }
   UpdateInfoPanelTotals(); 
   if ( legacyGlobalInt267 != Hour() )
   {
     legacyGlobalInt267 = Hour() ;
     tmpBool109 = false;
     for (tmpInt110 = 0 ; tmpInt110 < 100 ; tmpInt110=tmpInt110 + 1)
     {
       tmpLong111 = (long)pendingTicketPriceMap[tmpInt110][0];
       tmpBool109 = false;
       for (tmpInt112 = MT4OrdersTotal() ; tmpInt112 >= 0 ; tmpInt112=tmpInt112 - 1)
       {
         if ( !(OrderSelect(tmpInt112,0,0)) )   continue;
         tmpLong113 = OrderTicket();
         if ( tmpLong111 != tmpLong113 )   continue;
         tmpBool109 = true;
         
       }
       if ( tmpBool109 )   continue;
       pendingTicketPriceMap[tmpInt110][0] = 0.0;
       pendingTicketPriceMap[tmpInt110][1] = 0.0;
       
     }
   }
 }
 if ( showTradeDebugComments )
 {
   tmpString114="Current spread: " + string(NormalizeDouble(currentSpreadPrice / pipSize,1)) + "\nPending Buy Order: ";
   tmpInt115 = 0;
   for (tmpInt116 = MT4OrdersTotal() ; tmpInt116 >= 0 ; tmpInt116=tmpInt116 - 1)
   {
     if ( OrderSelect(tmpInt116,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 4 )   continue;
     tmpInt115=tmpInt115 + 1;
     
   }
   tmpString114=tmpString114 + string(tmpInt115);
   tmpString114=tmpString114 + "\nPending Sell Orders: ";
   tmpInt117 = 0;
   for (tmpInt118 = MT4OrdersTotal() ; tmpInt118 >= 0 ; tmpInt118=tmpInt118 - 1)
   {
     if ( OrderSelect(tmpInt118,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 5 )   continue;
     tmpInt117=tmpInt117 + 1;
     
   }
   tmpString114=tmpString114 + string(tmpInt117);
   Comment(tmpString114); 
 }
 return(0); 
 }
//lizong_7 <<==--------   --------
 void RestoreStoredPendingOrders()
 {
  int       localInt01;
//----- -----
 double     tmpDouble01;
 long       tmpLong02;
 int        tmpInt03;
 double     tmpDouble04;
 long       tmpLong05;
 int        tmpInt06;
 double     tmpDouble07;
 long       tmpLong08;
 int        tmpInt09;
 double     tmpDouble10;
 long       tmpLong11;
 int        tmpInt12;
 int        tmpInt13;

 for (localInt01 = 0 ; localInt01 < orderBufferCapacity ; localInt01 ++)
 {
   if ( !(storedPendingOrders[localInt01][0]>0.0) )   continue;
   
   if ( storedPendingOrders[localInt01][1]==4.0 && MarketInfo(currentSymbol,MODE_ASK)<storedPendingOrders[localInt01][0] - stopLevelPriceDistance )
   {
     Print("Restoring pending buy-order"); 
     legacyGlobalInt230 = OrderSend(currentSymbol,4,storedPendingOrders[localInt01][2],storedPendingOrders[localInt01][0],int(orderSlippageSetting * pipSize),storedPendingOrders[localInt01][0] - (stopLossPips + legacyGlobalDouble064) * pipSize,takeProfitPips * pipSize + storedPendingOrders[localInt01][0],currentStrategyComment,strategyMagicNumber,legacyGlobalDatetime302 + 0x2A300,Green) ;
     legacyGlobalBool280 = false ;
     tmpDouble01 = storedPendingOrders[localInt01][0];
     tmpLong02 = legacyGlobalInt230;
     for (tmpInt03 = 0 ; tmpInt03 < 100 ; tmpInt03=tmpInt03 + 1)
     {
       if ( !(pendingTicketPriceMap[tmpInt03][0]==0.0) )   continue;
       pendingTicketPriceMap[tmpInt03][0] = (double)tmpLong02;
       pendingTicketPriceMap[tmpInt03][1] = tmpDouble01;
       break;
       
     }
     if ( legacyGlobalInt230 <= 0 )
     {
       if ( MT4_LastError() == 132 )
       {
         ResetLastError();
         if(1==0) //条件不成立
         {
           do
           {
             Sleep(2500); 
             legacyGlobalInt230 = OrderSend(currentSymbol,4,storedPendingOrders[localInt01][2],storedPendingOrders[localInt01][0],int(orderSlippageSetting * pipSize),storedPendingOrders[localInt01][0] - (stopLossPips + legacyGlobalDouble064) * pipSize,takeProfitPips * pipSize + storedPendingOrders[localInt01][0],currentStrategyComment,strategyMagicNumber,legacyGlobalDatetime302 + 0x2A300,Green) ;
