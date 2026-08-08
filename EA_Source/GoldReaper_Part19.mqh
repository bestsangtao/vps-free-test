                                 tmpInt19 = OrderMagicNumber();
                                 tmpInt20=ST1_MagicNumber + 15;
                               if ( tmpInt19 != tmpInt20 )   continue;
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
     tmpInt03=tmpInt03 + 1;
     tmpDouble02 = tmpDouble02 + OrderProfit() + OrderSwap() + OrderCommission();
     if ( tmpInt03 >= 1000 )   break;
     
   }
   legacyGlobalDouble326Array30[currentStrategyIndex] = tmpDouble02;
   tmpDouble01 = tmpDouble02;
 }
 ObjectSetString(0,"linetp" + IntegerToString(0,0,32),OBJPROP_TEXT,"Total P/L so far: " + DoubleToString(NormalizeDouble(tmpDouble01,2),2));
 if ( EnableNFP_Filter )
 {
   ObjectSetString(0,"linenfp" + IntegerToString(0,0,32),OBJPROP_TEXT,GetNextNFPText());
 }
 if ( OnlyUp )
 {
   ObjectSetString(0,"lineup" + IntegerToString(0,0,32),OBJPROP_TEXT,"Highest Balance: " + DoubleToString(NormalizeDouble(highestBalanceBasis,2),2));
 }
 }
//lizong_29 <<==--------   --------
 int CountWinningClosedTrades( int argInt00,int argInt01)
 {
  double    localDouble02;
  int       localInt03;
  int       localInt04;
  int       localInt05;
//----- -----
 int        tmpInt01;
 int        tmpInt02;
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

 if ( MQLInfoInteger(MQL_TESTER) == 1 && !(UpdateInfoTesting) )
 {
   return(0); 
 }
 localDouble02 = 0.0 ;
 localInt03 = 0 ;
 localInt04 = 0 ;
 for (localInt05 = HistoryTotal() ; localInt05 >= 0 ; localInt05 --)
 {
   if ( OrderSelect(localInt05,0,1) != true )   continue;
   
   if ( ( OrderSymbol() != currentSymbol && !(oneChartSetupEnabled) ) )   continue;
   tmpInt01 = OrderMagicNumber();
   tmpInt02=ST1_MagicNumber + 1;
   if ( tmpInt01 != tmpInt02 )
   {
     tmpInt02 = OrderMagicNumber();
     tmpInt03=ST1_MagicNumber + 2;
     if ( tmpInt02 != tmpInt03 )
     {
       tmpInt03 = OrderMagicNumber();
       tmpInt04=ST1_MagicNumber + 3;
       if ( tmpInt03 != tmpInt04 )
       {
         tmpInt04 = OrderMagicNumber();
         tmpInt05=ST1_MagicNumber + 4;
         if ( tmpInt04 != tmpInt05 )
         {
           tmpInt05 = OrderMagicNumber();
           tmpInt06=ST1_MagicNumber + 5;
           if ( tmpInt05 != tmpInt06 )
           {
             tmpInt06 = OrderMagicNumber();
             tmpInt07=ST1_MagicNumber + 6;
             if ( tmpInt06 != tmpInt07 )
             {
               tmpInt07 = OrderMagicNumber();
               tmpInt08=ST1_MagicNumber + 7;
               if ( tmpInt07 != tmpInt08 )
               {
                 tmpInt08 = OrderMagicNumber();
                 tmpInt09=ST1_MagicNumber + 8;
                 if ( tmpInt08 != tmpInt09 )
                 {
                   tmpInt09 = OrderMagicNumber();
                   tmpInt10=ST1_MagicNumber + 9;
                   if ( tmpInt09 != tmpInt10 )
                   {
                     tmpInt10 = OrderMagicNumber();
                     tmpInt11=ST1_MagicNumber + 10;
                     if ( tmpInt10 != tmpInt11 )
                     {
                       tmpInt11 = OrderMagicNumber();
                       tmpInt12=ST1_MagicNumber + 11;
                       if ( tmpInt11 != tmpInt12 )
                       {
                         tmpInt12 = OrderMagicNumber();
                         tmpInt13=ST1_MagicNumber + 12;
                         if ( tmpInt12 != tmpInt13 )
                         {
                           tmpInt13 = OrderMagicNumber();
                           tmpInt14=ST1_MagicNumber + 13;
                           if ( tmpInt13 != tmpInt14 )
                           {
                             tmpInt14 = OrderMagicNumber();
                             tmpInt15=ST1_MagicNumber + 14;
                             if ( tmpInt14 != tmpInt15 )
                             {
                               tmpInt15 = OrderMagicNumber();
                               tmpInt16=ST1_MagicNumber + 15;
                             if ( tmpInt15 != tmpInt16 )   continue;
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
   localInt03 ++;
   if ( ( OrderType() == 0 || OrderType() == 1 ) )
   {
     if ( OrderType() == 0 )
     {
       localDouble02 = OrderClosePrice() - OrderOpenPrice() ;
     }
     else
     {
       if ( OrderType() == 1 )
       {
         localDouble02 = OrderOpenPrice() - OrderClosePrice() ;
       }
     }
     if ( localDouble02>0.0 )
     {
       localInt04 ++;
     }
   }
   if ( localInt03 >= argInt01 )   break;
   
 }
 legacyGlobalDouble324Array30[currentStrategyIndex] = localInt04;
 return(localInt04); 
 }
//lizong_30 <<==--------   --------
 int CountLosingClosedTrades( int argInt00,int argInt01)
 {
  double    localDouble02;
  int       localInt03;
  int       localInt04;
  int       localInt05;
//----- -----
 int        tmpInt01;
 int        tmpInt02;
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

 if ( MQLInfoInteger(MQL_TESTER) == 1 && !(UpdateInfoTesting) )
 {
   return(0); 
 }
 localDouble02 = 0.0 ;
 localInt03 = 0 ;
 localInt04 = 0 ;
 for (localInt05 = HistoryTotal() ; localInt05 >= 0 ; localInt05 --)
 {
   if ( OrderSelect(localInt05,0,1) != true )   continue;
   
   if ( ( OrderSymbol() != currentSymbol && !(oneChartSetupEnabled) ) )   continue;
   tmpInt01 = OrderMagicNumber();
   tmpInt02=ST1_MagicNumber + 1;
   if ( tmpInt01 != tmpInt02 )
   {
     tmpInt02 = OrderMagicNumber();
     tmpInt03=ST1_MagicNumber + 2;
     if ( tmpInt02 != tmpInt03 )
     {
       tmpInt03 = OrderMagicNumber();
       tmpInt04=ST1_MagicNumber + 3;
       if ( tmpInt03 != tmpInt04 )
       {
         tmpInt04 = OrderMagicNumber();
         tmpInt05=ST1_MagicNumber + 4;
         if ( tmpInt04 != tmpInt05 )
         {
           tmpInt05 = OrderMagicNumber();
           tmpInt06=ST1_MagicNumber + 5;
           if ( tmpInt05 != tmpInt06 )
           {
             tmpInt06 = OrderMagicNumber();
             tmpInt07=ST1_MagicNumber + 6;
             if ( tmpInt06 != tmpInt07 )
             {
               tmpInt07 = OrderMagicNumber();
               tmpInt08=ST1_MagicNumber + 7;
               if ( tmpInt07 != tmpInt08 )
               {
                 tmpInt08 = OrderMagicNumber();
                 tmpInt09=ST1_MagicNumber + 8;
                 if ( tmpInt08 != tmpInt09 )
                 {
                   tmpInt09 = OrderMagicNumber();
                   tmpInt10=ST1_MagicNumber + 9;
                   if ( tmpInt09 != tmpInt10 )
                   {
                     tmpInt10 = OrderMagicNumber();
                     tmpInt11=ST1_MagicNumber + 10;
                     if ( tmpInt10 != tmpInt11 )
                     {
                       tmpInt11 = OrderMagicNumber();
                       tmpInt12=ST1_MagicNumber + 11;
                       if ( tmpInt11 != tmpInt12 )
                       {
                         tmpInt12 = OrderMagicNumber();
                         tmpInt13=ST1_MagicNumber + 12;
                         if ( tmpInt12 != tmpInt13 )
                         {
                           tmpInt13 = OrderMagicNumber();
                           tmpInt14=ST1_MagicNumber + 13;
                           if ( tmpInt13 != tmpInt14 )
                           {
                             tmpInt14 = OrderMagicNumber();
                             tmpInt15=ST1_MagicNumber + 14;
                             if ( tmpInt14 != tmpInt15 )
                             {
                               tmpInt15 = OrderMagicNumber();
                               tmpInt16=ST1_MagicNumber + 15;
                             if ( tmpInt15 != tmpInt16 )   continue;
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
   localInt03 ++;
   if ( OrderType() == 0 )
   {
     localDouble02 = OrderClosePrice() - OrderOpenPrice() ;
   }
   else
   {
     if ( OrderType() == 1 )
     {
       localDouble02 = OrderOpenPrice() - OrderClosePrice() ;
     }
   }
   if ( localDouble02<0.0 )
   {
     localInt04 ++;
   }
   if ( localInt03 >= argInt01 )   break;
   
 }
 legacyGlobalDouble325Array30[currentStrategyIndex] = localInt04;
 return(localInt04); 
 }
//lizong_31 <<==--------   --------
 void CalculateStrategyPerformance()
 {
  int       localInt01 = 0;
  double    localDouble02Array99[99];
  double    localDouble03Array99[99];
  int       localInt04;
  int       localInt05;
  bool      localBool06;
  int       localInt07;
  double    localDouble08;
  int       localInt09;
  int       localInt10;
//----- -----
 long       tmpLong01;
 long       tmpLong02;
 long       tmpLong03;
 long       tmpLong04;
 long       tmpLong05;

 if ( ( MQLInfoInteger(MQL_TESTER) == 1 && !(UpdateInfoTesting) ) )   return;
 for (localInt04 = 0 ; localInt04 < strategySymbolCount ; localInt04 ++)
 {
   localDouble02Array99[localInt04] = 0.0;
   localDouble03Array99[localInt04] = 0.0;
   legacyGlobalBool342Array99[localInt04] = false;
   totalTradeCountByStrategy[localInt04] = 0;
   legacyGlobalInt344Array99[localInt04] = 0;
 }
 for (localInt05 = HistoryTotal() ; localInt05 >= 0 ; localInt05 --)
 {
   if ( OrderSelect(localInt05,0,1) != true || OrderMagicNumber() != strategyMagicNumber )   continue;
   localBool06 = true ;
   for (localInt07 = 0 ; localInt07 < strategySymbolCount ; localInt07 ++)
   {
     if ( !(legacyGlobalBool342Array99[localInt07]) )
     {
       localBool06 = false ;
     }
   }
   if ( ( OrderCloseTime() <  TimeCurrent() - legacyGlobalInt153 * 24 * 60 * 60 && localBool06 ) )   break;
   localDouble08 = OrderLots() * 100.0 ;
   if ( legacyGlobalInt151 == 1 )
   {
     localDouble08 = 1.0 ;
   }
   localInt09 = 0 ;
   if ( strategySymbolCount <= 0 )   continue;
   
   for ( ; localInt09 < strategySymbolCount ; localInt09 ++)
   {
     if ( legacyGlobalString347Array99[localInt09] != OrderSymbol() )   continue;
     
     if ( ( OrderType() != 0 && OrderType() != 1 ) )   continue;
     tmpLong01 = OrderCloseTime();
     tmpLong02=TimeCurrent() - legacyGlobalInt153 * 24 * 60 * 60;
     if ( tmpLong01 <  tmpLong02 )
     {
       tmpLong02 = OrderCloseTime();
       tmpLong03=TimeCurrent() - legacyGlobalInt153 * 24 * 60 * 60;
     if ( (tmpLong02 >= tmpLong03 || legacyGlobalBool342Array99[localInt09]) )   continue;
     }
     totalTradeCountByStrategy[localInt09] ++;
     if ( totalTradeCountByStrategy[localInt09] >= legacyGlobalInt155 )
     {
       legacyGlobalBool342Array99[localInt09] = true;
     }
     localDouble02Array99[localInt09] +=OrderProfit() / localDouble08;
     localDouble02Array99[localInt09] +=OrderSwap() / localDouble08;
     localDouble02Array99[localInt09] +=OrderCommission() / localDouble08;
     tmpLong04 = OrderCloseTime();
     tmpLong05=TimeCurrent() - legacyGlobalInt154 * 24 * 60 * 60;
     if ( tmpLong04 < tmpLong05 )   continue;
     localDouble03Array99[localInt09] +=OrderProfit() / localDouble08;
     localDouble03Array99[localInt09] +=OrderSwap() / localDouble08;
     localDouble03Array99[localInt09] +=OrderCommission() / localDouble08;
     legacyGlobalInt344Array99[localInt09] ++;
     
   }
   
 }
 for (localInt10 = 0 ; localInt10 < strategySymbolCount ; localInt10 ++)
 {
   totalProfitByStrategy[localInt10] = localDouble02Array99[localInt10];
   if ( totalTradeCountByStrategy[localInt10] >  0 )
   {
     averageProfitByStrategy[localInt10] = NormalizeDouble(localDouble02Array99[localInt10] / totalTradeCountByStrategy[localInt10],2);
   }
   else
   {
     averageProfitByStrategy[localInt10] = 0.0;
   }
   legacyGlobalDouble350Array99[localInt10] = localDouble03Array99[localInt10];
   if ( legacyGlobalInt344Array99[localInt10] >  0 )
   {
     legacyGlobalDouble346Array99[localInt10] = NormalizeDouble(localDouble03Array99[localInt10] / legacyGlobalInt344Array99[localInt10],2);
   }
   else
   {
     legacyGlobalDouble346Array99[localInt10] = 0.0;
   }
 }
 }
//lizong_32 <<==--------   --------
 void RankStrategiesByTotalProfit()
 {
  int       localInt01;
  double    localDouble02;
  int       localInt03;
  int       localInt04;
  int       localInt05;
  int       localInt06;
  bool      localBool07;
  int       localInt08;
  int       localInt09;
  int       localInt10;
  int       localInt11;
//----- -----

 CalculateStrategyPerformance(); 
 for (localInt01 = 0 ; localInt01 < strategySymbolCount ; localInt01 ++)
 {
   localDouble02 = totalProfitByStrategy[localInt01] ;
   localInt03 = 1 ;
   for (localInt04 = 0 ; localInt04 < strategySymbolCount ; localInt04 ++)
   {
     if ( localInt04 == localInt01 || !(totalProfitByStrategy[localInt04]>localDouble02) )   continue;
     localInt03 ++;
     
   }
   strategyRanks[localInt01] = localInt03;
 }
 for (localInt05 = 0 ; localInt05 < strategySymbolCount ; localInt05 ++)
 {
   localInt06 = strategyRanks[localInt05] ;
   localBool07 = true ;
   do
   {
     localBool07 = false ;
     localInt08 = 0 ;
     if ( strategySymbolCount <= 0 )   continue;
     
     for ( ; localInt08 < strategySymbolCount ; localInt08 ++)
     {
       if ( localInt08 == localInt05 || strategyRanks[localInt08] != strategyRanks[localInt05] )   continue;
       strategyRanks[localInt08] ++;
       localBool07 = true ;
       
     }
     
   }
   while(localBool07);
   
 }
 for (localInt09 = 0 ; localInt09 < strategySymbolCount ; localInt09 ++)
 {
   strategyLotWeights[localInt09] = 1.0;
 }
 for (localInt10 = 1 ; localInt10 <= strategySymbolCount ; localInt10 ++)
 {
   for (localInt11 = 0 ; localInt11 < strategySymbolCount ; localInt11 ++)
   {
     if ( strategyRanks[localInt11] == localInt10 )
     {
       legacyGlobalInt339Array99[localInt10 - 1] = localInt11;
     }
   }
 }
 }
//lizong_33 <<==--------   --------
 void RankStrategiesByAverageProfit()
 {
  int       localInt01;
  double    localDouble02;
  int       localInt03;
  int       localInt04;
  int       localInt05;
  int       localInt06;
  bool      localBool07;
  int       localInt08;
  int       localInt09;
  int       localInt10;
  int       localInt11;
//----- -----

 CalculateStrategyPerformance(); 
 for (localInt01 = 0 ; localInt01 < strategySymbolCount ; localInt01 ++)
 {
   localDouble02 = averageProfitByStrategy[localInt01] ;
   localInt03 = 1 ;
   for (localInt04 = 0 ; localInt04 < strategySymbolCount ; localInt04 ++)
   {
     if ( localInt04 == localInt01 || !(averageProfitByStrategy[localInt04]>localDouble02) )   continue;
     localInt03 ++;
     
   }
   strategyRanks[localInt01] = localInt03;
 }
 for (localInt05 = 0 ; localInt05 < strategySymbolCount ; localInt05 ++)
 {
   localInt06 = strategyRanks[localInt05] ;
   localBool07 = true ;
   do
   {
     localBool07 = false ;
     localInt08 = 0 ;
     if ( strategySymbolCount <= 0 )   continue;
     
     for ( ; localInt08 < strategySymbolCount ; localInt08 ++)
     {
       if ( localInt08 == localInt05 || strategyRanks[localInt08] != strategyRanks[localInt05] )   continue;
       strategyRanks[localInt08] ++;
       localBool07 = true ;
       
     }
     
   }
   while(localBool07);
   
 }
 for (localInt09 = 0 ; localInt09 < strategySymbolCount ; localInt09 ++)
 {
   strategyLotWeights[localInt09] = 1.0;
 }
 for (localInt10 = 1 ; localInt10 <= strategySymbolCount ; localInt10 ++)
 {
   for (localInt11 = 0 ; localInt11 < strategySymbolCount ; localInt11 ++)
   {
     if ( strategyRanks[localInt11] == localInt10 )
     {
       legacyGlobalInt339Array99[localInt10 - 1] = localInt11;
     }
   }
 }
 }
//lizong_34 <<==--------   --------
 double ConvertUsdToAccountCurrency( double argDouble00)
 {
  double    localDouble02;
  string    localString03;
//----- -----

 localDouble02 = argDouble00 ;
 if ( ( AccountCurrency() == "USD" || AccountCurrency() == "usd" ) )
 {
   localDouble02 = argDouble00 ;
 }
 if ( ( AccountCurrency() == "EUR" || AccountCurrency() == "eur" ) )
 {
   localString03="EURUSD" + legacyGlobalString299;
   if ( iClose(localString03,MT4Period(PERIOD_D1),1)>0.0 )
   {
     localDouble02 = argDouble00 / iClose(localString03,MT4Period(PERIOD_D1),1) ;
   }
 }
 if ( ( AccountCurrency() == "GBP" || AccountCurrency() == "gbp" ) )
 {
   localString03="GBPUSD" + legacyGlobalString299;
   if ( iClose(localString03,MT4Period(PERIOD_D1),1)>0.0 )
   {
     localDouble02 = argDouble00 / iClose(localString03,MT4Period(PERIOD_D1),1) ;
   }
 }
 if ( ( AccountCurrency() == "AUD" || AccountCurrency() == "aud" ) )
 {
   localString03="AUDUSD" + legacyGlobalString299;
   if ( iClose(localString03,MT4Period(PERIOD_D1),1)>0.0 )
   {
     localDouble02 = argDouble00 / iClose(localString03,MT4Period(PERIOD_D1),1) ;
   }
 }
 if ( ( AccountCurrency() == "JPY" || AccountCurrency() == "jpy" || AccountCurrency() == "YEN" || AccountCurrency() == "yen" ) )
 {
   localString03="USDJPY" + legacyGlobalString299;
   if ( iClose(localString03,MT4Period(PERIOD_D1),1)>0.0 )
   {
     localDouble02 = argDouble00 * iClose(localString03,MT4Period(PERIOD_D1),1) ;
   }
 }
 if ( ( AccountCurrency() == "CHF" || AccountCurrency() == "chf" ) )
 {
