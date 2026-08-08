 int        tmpInt79;
 int        tmpInt80;
 int        tmpInt81;
 int        tmpInt82;
 int        tmpInt83;
 int        tmpInt84;
 int        tmpInt85;
 int        tmpInt86;
 int        tmpInt87;
 int        tmpInt88;
 int        tmpInt89;
 double     tmpDouble90;
 long       tmpLong91;
 int        tmpInt92;
 long       tmpLong93;
 int        tmpInt94;
 int        tmpInt95;
 int        tmpInt96;
 double     tmpDouble97;
 long       tmpLong98;
 int        tmpInt99;
 long       tmpLong100;
 int        tmpInt101;
 int        tmpInt102;
 int        tmpInt103;
 int        tmpInt104;
 int        tmpInt105;
 bool       tmpBool106;
 int        tmpInt107;
 int        tmpInt108;
 bool       tmpBool109;
 int        tmpInt110;
 long       tmpLong111;
 int        tmpInt112;
 long       tmpLong113;
 string     tmpString114;
 int        tmpInt115;
 int        tmpInt116;
 int        tmpInt117;
 int        tmpInt118;

 currentStrategyIndex = argInt00 ;
 localBool02 = false ;
if ( minimumEntryDistancePercent>0.0 )
 {
   legacyGlobalDouble080 = minimumEntryDistancePercent / 100.0 * MarketInfo(currentSymbol,MODE_ASK) * 10.0 ;
 }
 if ( legacyGlobalInt099 == 0 )
 {
   if ( ManageBuyTrades() )
   {
     localBool02 = true ;
   }
   if ( ManageSellTrades() )
   {
     localBool02 = true ;
   }
   if ( localBool02 )
   {
     return(0); 
   }
 }
 else
 {
   if ( legacyGlobalInt321Array99[currentStrategyIndex] != iBars(currentSymbol,MT4Period(legacyGlobalInt099)) )
   {
     legacyGlobalInt321Array99[currentStrategyIndex] = iBars(currentSymbol,MT4Period(legacyGlobalInt099));
     if ( ManageBuyTrades() )
     {
       localBool02 = true ;
     }
     if ( ManageSellTrades() )
     {
       localBool02 = true ;
     }
     if ( localBool02 )
     {
       return(0); 
     }
   }
 }
 ResizePendingOrderLots(false); 
 if ( MarketInfo(currentSymbol,MODE_TRADEALLOWED)==0.0 )
 {
   if ( !(marketPauseMessageLogged) )
   {
     Print("Market closed... waiting to continue"); 
   }
   marketPauseMessageLogged = true ;
   return(0); 
 }
 if ( legacyGlobalInt068 >  0 && ( ( Hour() == 0 && Minute() < legacyGlobalInt068 ) || (Hour() == 23 && legacyGlobalInt068 >  60 - legacyGlobalInt068) ) )
 {
   if ( !(marketPauseMessageLogged) )
   {
     Print("DAYSWITCH -> Market might be closed... waiting " + string(legacyGlobalInt068) + " minutes before setting order.."); 
   }
   marketPauseMessageLogged = true ;
   return(0); 
 }
 marketPauseMessageLogged = false ;
 if ( tradingHoursEnabled )
 {
   if ( IsTradingSessionOpen() && tradingHoursState )
   {
     if ( storePendingOrdersOutsideTradingHours )
     {
       RestoreStoredPendingOrders(); 
     }
     tradingHoursState = false ;
   }
   if ( !(IsTradingSessionOpen()) && !(tradingHoursState) )
   {
     Print("ENTERING NON-TRADING HOURS! Closing orders..."); 
     if ( storePendingOrdersOutsideTradingHours )
     {
       for (tmpInt01 = 0 ; tmpInt01 < orderBufferCapacity ; tmpInt01=tmpInt01 + 1)
       {
         for (tmpInt02 = 0 ; tmpInt02 < 2 ; tmpInt02=tmpInt02 + 1)
         {
           storedPendingOrders[tmpInt01][tmpInt02] = 0.0;
         }
       }
       tmpInt03 = 0;
       for (tmpInt04 = MT4OrdersTotal() ; tmpInt04 >= 0 ; tmpInt04=tmpInt04 - 1)
       {
         if ( OrderSelect(tmpInt04,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol )   continue;
         
         if ( ( OrderType() != 4 && OrderType() != 5 ) )   continue;
         Print("Storing pending order nr " + string(OrderTicket())); 
         storedPendingOrders[tmpInt03][1] = OrderType();
         storedPendingOrders[tmpInt03][0] = OrderOpenPrice();
         storedPendingOrders[tmpInt03][2] = OrderLots();
         tmpInt03=tmpInt03 + 1;
         
       }
     }
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
     tmpInt08 = 1;
     for (tmpInt09 = MT4OrdersTotal() ; tmpInt09 >= 0 ; tmpInt09=tmpInt09 - 1)
     {
       if ( OrderSelect(tmpInt09,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 5 )   continue;
       OrderDelete(OrderTicket(),0xFFFFFFFF); 
       
     }
     if ( tmpInt08 == 2 )
     {
       for (tmpInt10 = MT4OrdersTotal() ; tmpInt10 >= 0 ; tmpInt10=tmpInt10 - 1)
       {
         if ( OrderSelect(tmpInt10,0,0) != true || OrderMagicNumber() != secondaryStrategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 5 )   continue;
         OrderDelete(OrderTicket(),0xFFFFFFFF); 
         
       }
     }
     tmpInt11 = 2;
     if(1==0) //条件不成立
     {
       do
       {
         if ( OrderSelect(1,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 4 )   continue;
         OrderDelete(OrderTicket(),0xFFFFFFFF); 
         
       }
       while( - 1 >= 0);
       
     }
     if ( tmpInt11 == 2 )
     {
       for (tmpInt12 = MT4OrdersTotal() ; tmpInt12 >= 0 ; tmpInt12=tmpInt12 - 1)
       {
         if ( OrderSelect(tmpInt12,0,0) != true || OrderMagicNumber() != secondaryStrategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 4 )   continue;
         OrderDelete(OrderTicket(),0xFFFFFFFF); 
         
       }
     }
     tmpInt13 = 2;
     if(1==0) //条件不成立
     {
       do
       {
         if ( OrderSelect(1,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 5 )   continue;
         OrderDelete(OrderTicket(),0xFFFFFFFF); 
         
       }
       while( - 1 >= 0);
       
     }
     if ( tmpInt13 == 2 )
     {
       for (tmpInt14 = MT4OrdersTotal() ; tmpInt14 >= 0 ; tmpInt14=tmpInt14 - 1)
       {
         if ( OrderSelect(tmpInt14,0,0) != true || OrderMagicNumber() != secondaryStrategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 5 )   continue;
         OrderDelete(OrderTicket(),0xFFFFFFFF); 
         
       }
     }
     tradingHoursState = true ;
     return(0); 
   }
 }
 if ( EnableNFP_Filter )
 {
   if ( Year() <= 2026 || g_nfpFromCalendar )
   {
     localLong03 = 0 ;
     for (localInt04 = 0 ; localInt04 < 300 ; localInt04 ++)
     {
       tmpInt15 = TimeYear(nfpDatesGmt[localInt04]);
       if ( tmpInt15 != Year() )   continue;
       tmpInt16 = TimeMonth(nfpDatesGmt[localInt04]);
       if ( tmpInt16 != Month() )   continue;
       localLong03 = nfpDatesGmt[localInt04] ;
       break;
       
     }
     localInt05 = 60 ;
     if ( IsAmericanDaylightSavingTime() )
     {
       localInt05 = 0 ;
     }
     if ( legacyGlobalDatetime390 >= localLong03 - NFP_MinutesBefore * 60 + localInt05 * 60 && legacyGlobalDatetime390 <= localLong03 + NFP_MinutesAfter * 60 + localInt05 * 60 )
     {
       if ( NFP_ClosePendingOrders )
       {
         tmpInt17 = 1;
         for (tmpInt18 = MT4OrdersTotal() ; tmpInt18 >= 0 ; tmpInt18=tmpInt18 - 1)
         {
           if ( OrderSelect(tmpInt18,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 4 )   continue;
           OrderDelete(OrderTicket(),0xFFFFFFFF); 
           
         }
         if ( tmpInt17 == 2 )
         {
           for (tmpInt19 = MT4OrdersTotal() ; tmpInt19 >= 0 ; tmpInt19=tmpInt19 - 1)
           {
             if ( OrderSelect(tmpInt19,0,0) != true || OrderMagicNumber() != secondaryStrategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 4 )   continue;
             OrderDelete(OrderTicket(),0xFFFFFFFF); 
             
           }
         }
         tmpInt20 = 1;
         for (tmpInt21 = MT4OrdersTotal() ; tmpInt21 >= 0 ; tmpInt21=tmpInt21 - 1)
         {
           if ( OrderSelect(tmpInt21,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 5 )   continue;
           OrderDelete(OrderTicket(),0xFFFFFFFF); 
           
         }
         if ( tmpInt20 == 2 )
         {
           for (tmpInt22 = MT4OrdersTotal() ; tmpInt22 >= 0 ; tmpInt22=tmpInt22 - 1)
           {
             if ( OrderSelect(tmpInt22,0,0) != true || OrderMagicNumber() != secondaryStrategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 5 )   continue;
             OrderDelete(OrderTicket(),0xFFFFFFFF); 
             
           }
         }
         tmpInt23 = 2;
         if(1==0) //条件不成立
         {
           do
           {
             if ( OrderSelect(1,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 4 )   continue;
             OrderDelete(OrderTicket(),0xFFFFFFFF); 
             
           }
           while( - 1 >= 0);
           
         }
         if ( tmpInt23 == 2 )
         {
           for (tmpInt24 = MT4OrdersTotal() ; tmpInt24 >= 0 ; tmpInt24=tmpInt24 - 1)
           {
             if ( OrderSelect(tmpInt24,0,0) != true || OrderMagicNumber() != secondaryStrategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 4 )   continue;
             OrderDelete(OrderTicket(),0xFFFFFFFF); 
             
           }
         }
         tmpInt25 = 2;
         if(1==0) //条件不成立
         {
           do
           {
             if ( OrderSelect(1,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 5 )   continue;
             OrderDelete(OrderTicket(),0xFFFFFFFF); 
             
           }
           while( - 1 >= 0);
           
         }
         if ( tmpInt25 == 2 )
         {
           for (tmpInt26 = MT4OrdersTotal() ; tmpInt26 >= 0 ; tmpInt26=tmpInt26 - 1)
           {
             if ( OrderSelect(tmpInt26,0,0) != true || OrderMagicNumber() != secondaryStrategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 5 )   continue;
             OrderDelete(OrderTicket(),0xFFFFFFFF); 
             
           }
         }
       }
       if ( NFP_CloseOpenTrades )
       {
         for (tmpInt27 = MT4OrdersTotal() ; tmpInt27 >= 0 ; tmpInt27=tmpInt27 - 1)
         {
           if ( OrderSelect(tmpInt27,0,0) != true || OrderSymbol() != currentSymbol )   continue;
           tmpInt28 = OrderMagicNumber();
           tmpInt29=ST1_MagicNumber + 1;
           if ( tmpInt28 != tmpInt29 )
           {
             tmpInt29 = OrderMagicNumber();
             tmpInt30=ST1_MagicNumber + 2;
             if ( tmpInt29 != tmpInt30 )
             {
               tmpInt30 = OrderMagicNumber();
               tmpInt31=ST1_MagicNumber + 3;
               if ( tmpInt30 != tmpInt31 )
               {
                 tmpInt31 = OrderMagicNumber();
                 tmpInt32=ST1_MagicNumber + 4;
                 if ( tmpInt31 != tmpInt32 )
                 {
                   tmpInt32 = OrderMagicNumber();
                   tmpInt33=ST1_MagicNumber + 5;
                   if ( tmpInt32 != tmpInt33 )
                   {
                     tmpInt33 = OrderMagicNumber();
                     tmpInt34=ST1_MagicNumber + 6;
                     if ( tmpInt33 != tmpInt34 )
                     {
                       tmpInt34 = OrderMagicNumber();
                       tmpInt35=ST1_MagicNumber + 7;
                       if ( tmpInt34 != tmpInt35 )
                       {
                         tmpInt35 = OrderMagicNumber();
                         tmpInt36=ST1_MagicNumber + 8;
                         if ( tmpInt35 != tmpInt36 )
                         {
                           tmpInt36 = OrderMagicNumber();
                           tmpInt37=ST1_MagicNumber + 9;
                           if ( tmpInt36 != tmpInt37 )
                           {
                             tmpInt37 = OrderMagicNumber();
                             tmpInt38=ST1_MagicNumber + 10;
                             if ( tmpInt37 != tmpInt38 )
                             {
                               tmpInt38 = OrderMagicNumber();
                               tmpInt39=ST1_MagicNumber + 11;
                               if ( tmpInt38 != tmpInt39 )
                               {
                                 tmpInt39 = OrderMagicNumber();
                                 tmpInt40=ST1_MagicNumber + 12;
                                 if ( tmpInt39 != tmpInt40 )
                                 {
                                   tmpInt40 = OrderMagicNumber();
                                   tmpInt41=ST1_MagicNumber + 13;
                                   if ( tmpInt40 != tmpInt41 )
                                   {
                                     tmpInt41 = OrderMagicNumber();
                                     tmpInt42=ST1_MagicNumber + 14;
                                     if ( tmpInt41 != tmpInt42 )
                                     {
                                       tmpInt42 = OrderMagicNumber();
                                       tmpInt43=ST1_MagicNumber + 15;
                                     if ( tmpInt42 != tmpInt43 )   continue;
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
   else
   {
     if ( Day() <= 7 && DayOfWeek() == 5 )
     {
       localString06 = IntegerToString(Year(),0,32) + IntegerToString(Month(),0,32) + IntegerToString(Day(),0,32) + " " + IntegerToString(0x4CE,0,32) ;
       localDatetime07 = StringToTime(localString06) ;
       if ( legacyGlobalDatetime390 >= localDatetime07 - NFP_MinutesBefore * 60 && legacyGlobalDatetime390 <= localDatetime07 + NFP_MinutesAfter * 60 )
       {
         if ( NFP_ClosePendingOrders )
         {
           tmpInt44 = 1;
           for (tmpInt45 = MT4OrdersTotal() ; tmpInt45 >= 0 ; tmpInt45=tmpInt45 - 1)
           {
             if ( OrderSelect(tmpInt45,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 4 )   continue;
             OrderDelete(OrderTicket(),0xFFFFFFFF); 
             
           }
           if ( tmpInt44 == 2 )
           {
             for (tmpInt46 = MT4OrdersTotal() ; tmpInt46 >= 0 ; tmpInt46=tmpInt46 - 1)
             {
               if ( OrderSelect(tmpInt46,0,0) != true || OrderMagicNumber() != secondaryStrategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 4 )   continue;
               OrderDelete(OrderTicket(),0xFFFFFFFF); 
               
             }
           }
           tmpInt47 = 1;
           for (tmpInt48 = MT4OrdersTotal() ; tmpInt48 >= 0 ; tmpInt48=tmpInt48 - 1)
           {
             if ( OrderSelect(tmpInt48,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 5 )   continue;
             OrderDelete(OrderTicket(),0xFFFFFFFF); 
             
           }
           if ( tmpInt47 == 2 )
           {
             for (tmpInt49 = MT4OrdersTotal() ; tmpInt49 >= 0 ; tmpInt49=tmpInt49 - 1)
             {
               if ( OrderSelect(tmpInt49,0,0) != true || OrderMagicNumber() != secondaryStrategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 5 )   continue;
               OrderDelete(OrderTicket(),0xFFFFFFFF); 
               
             }
           }
           tmpInt50 = 2;
           if(1==0) //条件不成立
           {
             do
             {
               if ( OrderSelect(1,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 4 )   continue;
               OrderDelete(OrderTicket(),0xFFFFFFFF); 
               
             }
             while( - 1 >= 0);
             
           }
           if ( tmpInt50 == 2 )
           {
             for (tmpInt51 = MT4OrdersTotal() ; tmpInt51 >= 0 ; tmpInt51=tmpInt51 - 1)
             {
               if ( OrderSelect(tmpInt51,0,0) != true || OrderMagicNumber() != secondaryStrategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 4 )   continue;
               OrderDelete(OrderTicket(),0xFFFFFFFF); 
               
             }
           }
           tmpInt52 = 2;
           if(1==0) //条件不成立
           {
             do
             {
               if ( OrderSelect(1,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 5 )   continue;
               OrderDelete(OrderTicket(),0xFFFFFFFF); 
               
             }
             while( - 1 >= 0);
             
           }
           if ( tmpInt52 == 2 )
           {
             for (tmpInt53 = MT4OrdersTotal() ; tmpInt53 >= 0 ; tmpInt53=tmpInt53 - 1)
             {
               if ( OrderSelect(tmpInt53,0,0) != true || OrderMagicNumber() != secondaryStrategyMagicNumber || OrderSymbol() != currentSymbol || OrderType() != 5 )   continue;
               OrderDelete(OrderTicket(),0xFFFFFFFF); 
               
             }
           }
