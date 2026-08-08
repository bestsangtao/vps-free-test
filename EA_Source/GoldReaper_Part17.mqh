   case 150 :
   localString01 = "prohibited by FIFO rules" ;
     break;
   case 4000 :
   localString01 = "no error (never generated code)" ;
     break;
   case 4001 :
   localString01 = "wrong function pointer" ;
     break;
   case 4002 :
   localString01 = "array index is out of range" ;
     break;
   case 4003 :
   localString01 = "no memory for function call stack" ;
     break;
   case 4004 :
   localString01 = "recursive stack overflow" ;
     break;
   case 4005 :
   localString01 = "not enough stack for parameter" ;
     break;
   case 4006 :
   localString01 = "no memory for parameter string" ;
     break;
   case 4007 :
   localString01 = "no memory for temp string" ;
     break;
   case 4008 :
   localString01 = "not initialized string" ;
     break;
   case 4009 :
   localString01 = "not initialized string in array" ;
     break;
   case 4010 :
   localString01 = "no memory for array' string" ;
     break;
   case 4011 :
   localString01 = "too long string" ;
     break;
   case 4012 :
   localString01 = "remainder from zero divide" ;
     break;
   case 4013 :
   localString01 = "zero divide" ;
     break;
   case 4014 :
   localString01 = "unknown command" ;
     break;
   case 4015 :
   localString01 = "wrong jump (never generated error)" ;
     break;
   case 4016 :
   localString01 = "not initialized array" ;
     break;
   case 4017 :
   localString01 = "dll calls are not allowed" ;
     break;
   case 4018 :
   localString01 = "cannot load library" ;
     break;
   case 4019 :
   localString01 = "cannot call function" ;
     break;
   case 4020 :
   localString01 = "expert function calls are not allowed" ;
     break;
   case 4021 :
   localString01 = "not enough memory for temp string returned from function" ;
     break;
   case 4022 :
   localString01 = "system is busy (never generated error)" ;
     break;
   case 4050 :
   localString01 = "invalid function parameters count" ;
     break;
   case 4051 :
   localString01 = "invalid function parameter value" ;
     break;
   case 4052 :
   localString01 = "string function internal error" ;
     break;
   case 4053 :
   localString01 = "some array error" ;
     break;
   case 4054 :
   localString01 = "incorrect series array using" ;
     break;
   case 4055 :
   localString01 = "custom indicator error" ;
     break;
   case 4056 :
   localString01 = "arrays are incompatible" ;
     break;
   case 4057 :
   localString01 = "global variables processing error" ;
     break;
   case 4058 :
   localString01 = "global variable not found" ;
     break;
   case 4059 :
   localString01 = "function is not allowed in testing mode" ;
     break;
   case 4060 :
   localString01 = "function is not confirmed" ;
     break;
   case 4061 :
   localString01 = "send mail error" ;
     break;
   case 4062 :
   localString01 = "string parameter expected" ;
     break;
   case 4063 :
   localString01 = "integer parameter expected" ;
     break;
   case 4064 :
   localString01 = "double parameter expected" ;
     break;
   case 4065 :
   localString01 = "array as parameter expected" ;
     break;
   case 4066 :
   localString01 = "requested history data in update state" ;
     break;
   case 4099 :
   localString01 = "end of file" ;
     break;
   case 4100 :
   localString01 = "some file error" ;
     break;
   case 4101 :
   localString01 = "wrong file name" ;
     break;
   case 4102 :
   localString01 = "too many opened files" ;
     break;
   case 4103 :
   localString01 = "cannot open file" ;
     break;
   case 4104 :
   localString01 = "incompatible access to a file" ;
     break;
   case 4105 :
   localString01 = "no order selected" ;
     break;
   case 4106 :
   localString01 = "unknown symbol" ;
     break;
   case 4107 :
   localString01 = "invalid price parameter for trade function" ;
     break;
   case 4108 :
   localString01 = "invalid ticket" ;
     break;
   case 4109 :
   localString01 = "trade is not allowed in the expert properties" ;
     break;
   case 4110 :
   localString01 = "longs are not allowed in the expert properties" ;
     break;
   case 4111 :
   localString01 = "shorts are not allowed in the expert properties" ;
     break;
   case 4200 :
   localString01 = "object is already exist" ;
     break;
   case 4201 :
   localString01 = "unknown object property" ;
     break;
   case 4202 :
   localString01 = "object is not exist" ;
     break;
   case 4203 :
   localString01 = "unknown object type" ;
     break;
   case 4204 :
   localString01 = "no object name" ;
     break;
   case 4205 :
   localString01 = "object coordinates error" ;
     break;
   case 4206 :
   localString01 = "no specified subwindow" ;
     break;
   default :
   localString01 = "unknown error" ;
 }
 return(localString01);
 }
//lizong_21 <<==--------   --------
 void ResizePendingOrderLots( bool argBool00)
 {
  double    localDouble01;
  int       localInt02;
  int       localInt03;
  double    localDouble04;
  long      localLong05;
  double    localDouble06;
  double    localDouble07;
  datetime  localDatetime08;
  string    localString09;
  long      localInt10; // ticket 64-bit
  double    localDouble11;
  long      localLong12;
  double    localDouble13;
  double    localDouble14;
  datetime  localDatetime15;
  string    localString16;
  long      localInt17; // ticket 64-bit
//----- -----
 long       tmpLong01;
 long       tmpLong02;
 int        tmpInt03;
 long       tmpLong04;
 long       tmpLong05;
 int        tmpInt06;

 localDouble01 = legacyGlobalDouble140 / 100.0 + 1.0 ;
 if ( ( !(AccountBalance()!=legacyGlobalDouble318) && !(argBool00) ) )   return;
 
 if ( ( !(AccountBalance()>legacyGlobalDouble318 * localDouble01) && !(AccountBalance()<legacyGlobalDouble318 / localDouble01) && !(argBool00) ) )   return;
 CalculateStrategyLotSize(stopLossPips,lotSizePercentMultiplier); 
 localInt02 = MT4OrdersTotal() ;
 for (localInt03 = localInt02 ; localInt03 >= 0 ; localInt03 --)
 {
   if ( OrderSelect(localInt03,0,0) != true || OrderMagicNumber() != strategyMagicNumber || OrderSymbol() != currentSymbol )   continue;
   
   if ( OrderType() == 4 && OrderLots()!=lotSizeByStrategy[currentStrategyIndex] )
   {
     localDouble04 = OrderStopLoss() ;
     localLong05 = OrderTicket() ;
     localDouble06 = OrderTakeProfit() ;
     localDouble07 = OrderOpenPrice() ;
     localDatetime08 = OrderExpiration() ;
     localString09 = OrderComment() ;
     OrderDelete(localLong05,Red); 
     localInt10 = OrderSend(currentSymbol,4,lotSizeByStrategy[currentStrategyIndex],localDouble07,(int)orderSlippageSetting,localDouble04,localDouble06,localString09,strategyMagicNumber,localDatetime08,Green) ;
     tmpLong01 = localInt10;
     tmpLong02 = localLong05;
     for (tmpInt03 = 0 ; tmpInt03 < 100 ; tmpInt03=tmpInt03 + 1)
     {
       if ( !(pendingTicketPriceMap[tmpInt03][0]==tmpLong02) )   continue;
       pendingTicketPriceMap[tmpInt03][0] = (double)tmpLong01;
       break;
       
     }
     Print("Lotsize changed more than " + string(legacyGlobalDouble140) + "%... adjusting lotsize of pending orders"); 
     Sleep(1000); 
   }
   if ( OrderType() != 5 || !(OrderLots()!=lotSizeByStrategy[currentStrategyIndex]) )   continue;
   localDouble11 = OrderStopLoss() ;
   localLong12 = OrderTicket() ;
   localDouble13 = OrderTakeProfit() ;
   localDouble14 = OrderOpenPrice() ;
   localDatetime15 = OrderExpiration() ;
   localString16 = OrderComment() ;
   OrderDelete(localLong12,Red); 
   localInt17 = OrderSend(currentSymbol,5,lotSizeByStrategy[currentStrategyIndex],localDouble14,(int)orderSlippageSetting,localDouble11,localDouble13,localString16,strategyMagicNumber,localDatetime15,Green) ;
   tmpLong04 = localInt17;
   tmpLong05 = localLong12;
   for (tmpInt06 = 0 ; tmpInt06 < 100 ; tmpInt06=tmpInt06 + 1)
   {
     if ( !(pendingTicketPriceMap[tmpInt06][0]==tmpLong05) )   continue;
     pendingTicketPriceMap[tmpInt06][0] = (double)tmpLong04;
     break;
     
   }
   Print("Lotsize changed more than " + string(legacyGlobalDouble140) + "%... adjusting lotsize of pending orders"); 
   Sleep(1000); 
   
 }
 }

 void CreateInfoPanel()
 {
  int       localInt01 = 0;
  int       localInt02 = 0;
  int       localInt03;
  int       localInt04;
  int       localInt05;
  double    localDouble06;
  int       localInt07;
  int       localInt08;
  int       localInt09;
  int       localInt10;
  int       localInt11;
  int       localInt12;
  int       localInt13;
  uint      localUint14;
  bool      localBool15;
  int       localInt16;
  string    localString17;
  int       localInt18;
  int       localInt19;
  int       localInt20;
  string    localString21;
  int       localInt22;
  int       localInt23;
  int       localInt24;
//----- -----

 localInt03 = 20 ;
 localInt04 = 300 ;
 localInt05 = 7 ;
 localDouble06 = InfoPanelSizeAdjust ;
 localInt07 = 6 ;
 localInt08 = 4 ;
 localInt09 = 350 ;
 localInt10 = 366 ;
 localInt11 = 0 ;
 localInt12 = 5 ;
 localInt13 = 20 ;
 localUint14 = LightSteelBlue ;
 localBool15 = false ;
 localInt16 = 0 ;
 if ( oneChartSetupEnabled )
 {
   localInt16 = (int)((strategySymbolCount + 3) * panelRowHeight) ;
 }
 ObjectCreate(0,"infopanel_rectangle",OBJ_RECTANGLE_LABEL,0,0,0.0); 
 ObjectSetInteger(0,"infopanel_rectangle",OBJPROP_XDISTANCE,localInt12); 
 ObjectSetInteger(0,"infopanel_rectangle",OBJPROP_YDISTANCE,localInt13); 
 ObjectSetInteger(0,"infopanel_rectangle",OBJPROP_XSIZE,long(localInt09 * InfoPanelSizeAdjust)); 
 ObjectSetInteger(0,"infopanel_rectangle",OBJPROP_YSIZE,long(localInt10 * InfoPanelSizeAdjust + localInt16)); 
 ObjectSetInteger(0,"infopanel_rectangle",OBJPROP_CORNER,0); 
 ObjectSetInteger(0,"infopanel_rectangle",OBJPROP_COLOR,0xFF0000); 
 ObjectSetInteger(0,"infopanel_rectangle",OBJPROP_BGCOLOR,localUint14); 
 ObjectSetInteger(0,"infopanel_rectangle",OBJPROP_BACK,0); 
 ObjectSetInteger(0,"infopanel_rectangle",OBJPROP_BORDER_COLOR,0xFF0000); 
 ObjectSetInteger(0,"infopanel_rectangle",OBJPROP_COLOR,0xFF0000); 
 ObjectSetInteger(0,"infopanel_rectangle",OBJPROP_BORDER_TYPE,0); 
 ObjectSetInteger(0,"infopanel_rectangle",OBJPROP_STYLE,0); 
 ObjectSetInteger(0,"infopanel_rectangle",OBJPROP_WIDTH,0x2); 
 ObjectSetInteger(0,"infopanel_rectangle",OBJPROP_SELECTABLE,0); 
 ObjectCreate(0,"line1",OBJ_LABEL,0,0,0.0); 
 ObjectSetInteger(0,"line1",OBJPROP_CORNER,localInt11); 
 ObjectSetInteger(0,"line1",OBJPROP_YDISTANCE,localInt13 + localInt08); 
 ObjectSetInteger(0,"line1",OBJPROP_XDISTANCE,localInt12 + localInt07); 
 if ( !(oneChartSetupEnabled) )
 {
   ObjectSetString(0,"line1",OBJPROP_TEXT,"The Gold Reaper V4.5"); 
 }
 else
 {
   ObjectSetString(0,"line1",OBJPROP_TEXT,"The Gold Reaper V4.5 - OneChartSetup"); 
 }
 ObjectSetInteger(0,"line1",OBJPROP_COLOR,panelTextColor);
 // Ban decompile goc thieu set co chu rieng cho cac dong tieu de/tom tat panel
 // (chi co bang chien luoc phia duoi duoc set), trong khi kich thuoc khung panel
 // lai duoc tinh dua tren dung hang so co chu nay -> khien cac dong nay hien thi
 // to hon binh thuong (dung co mac dinh cua nen tang) so voi thiet ke that su cua
 // khung panel. Set khop voi co chu cua bang chien luoc de dong bo.
 ObjectSetInteger(0,"line1",OBJPROP_FONTSIZE,panelFontSize);
 ObjectCreate(0,"linec",OBJ_LABEL,0,0,0.0);
 ObjectSetInteger(0,"linec",OBJPROP_CORNER,localInt11); 
 ObjectSetInteger(0,"linec",OBJPROP_YDISTANCE,long(localInt13 + InfoPanelSizeAdjust * 20.0 + localInt08)); 
 ObjectSetInteger(0,"linec",OBJPROP_XDISTANCE,localInt12 + localInt07); 
 ObjectSetString(0,"linec",OBJPROP_TEXT,"EA developer by Pham Duy Linh - 2026"); 
 ObjectSetInteger(0,"linec",OBJPROP_COLOR,panelTextColor);
 ObjectSetInteger(0,"linec",OBJPROP_FONTSIZE,panelFontSize);
 ObjectCreate(0,"line2",OBJ_LABEL,0,0,0.0);
 ObjectSetInteger(0,"line2",OBJPROP_CORNER,localInt11); 
 ObjectSetInteger(0,"line2",OBJPROP_YDISTANCE,long(localInt13 + InfoPanelSizeAdjust * 32.0 + localInt08)); 
 ObjectSetInteger(0,"line2",OBJPROP_XDISTANCE,localInt12 + localInt07); 
 ObjectSetString(0,"line2",OBJPROP_TEXT,"------------------------------------------------------"); 
 ObjectSetInteger(0,"line2",OBJPROP_COLOR,panelTextColor);
 ObjectSetInteger(0,"line2",OBJPROP_FONTSIZE,panelFontSize);
 ObjectCreate(0,"lines",OBJ_LABEL,0,0,0.0);
 ObjectSetInteger(0,"lines",OBJPROP_CORNER,localInt11); 
 ObjectSetInteger(0,"lines",OBJPROP_YDISTANCE,long(localInt13 + InfoPanelSizeAdjust * 44.0 + localInt08)); 
 ObjectSetInteger(0,"lines",OBJPROP_XDISTANCE,localInt12 + localInt07); 
 if ( activeTradeFrequency == 1 )
 {
   localString17 = "conservative" ;
 }
 else
 {
   if ( activeTradeFrequency == 2 )
   {
     localString17 = "moderate" ;
   }
   else
   {
     if ( activeTradeFrequency == 3 )
     {
       localString17 = "intense" ;
     }
     else
     {
       if ( activeTradeFrequency == 4 )
       {
         localString17 = "extreme" ;
       }
       else
       {
         if ( activeTradeFrequency == 0 )
         {
           localString17 = "extreme conservative" ;
         }
         else
         {
           localString17 = "manual strategy selection" ;
         }
       }
     }
   }
 }
 ObjectSetString(0,"lines",OBJPROP_TEXT,"Trade Frequency: " + localString17);
 ObjectSetInteger(0,"lines",OBJPROP_COLOR,panelTextColor);
 ObjectSetInteger(0,"lines",OBJPROP_FONTSIZE,panelFontSize);
 if ( Risk == 1234 )
 {
   ObjectCreate(0,"linet",OBJ_LABEL,0,0,0.0); 
   ObjectSetInteger(0,"linet",OBJPROP_CORNER,localInt11); 
   ObjectSetInteger(0,"linet",OBJPROP_YDISTANCE,long(localInt13 + InfoPanelSizeAdjust * 60.0 + localInt08)); 
   ObjectSetInteger(0,"linet",OBJPROP_XDISTANCE,localInt12 + localInt07); 
   ObjectSetString(0,"linet",OBJPROP_TEXT,"Max allowed DD: " + string(MaxAllowedDD) + "%");
   ObjectSetInteger(0,"linet",OBJPROP_COLOR,panelTextColor);
   ObjectSetInteger(0,"linet",OBJPROP_FONTSIZE,panelFontSize);
 }
 else
 {
   if ( Risk == 3 )
   {
     ObjectCreate(0,"linet",OBJ_LABEL,0,0,0.0); 
     ObjectSetInteger(0,"linet",OBJPROP_CORNER,localInt11); 
     ObjectSetInteger(0,"linet",OBJPROP_YDISTANCE,long(localInt13 + InfoPanelSizeAdjust * 60.0 + localInt08)); 
     ObjectSetInteger(0,"linet",OBJPROP_XDISTANCE,localInt12 + localInt07); 
     ObjectSetString(0,"linet",OBJPROP_TEXT,"Max risk per strategy: " + string(MaxRiskPerStrategy_) + "%");
     ObjectSetInteger(0,"linet",OBJPROP_COLOR,panelTextColor);
     ObjectSetInteger(0,"linet",OBJPROP_FONTSIZE,panelFontSize);
   }
   else
   {
     ObjectCreate(0,"linet",OBJ_LABEL,0,0,0.0);
     ObjectSetInteger(0,"linet",OBJPROP_CORNER,localInt11); 
     ObjectSetInteger(0,"linet",OBJPROP_YDISTANCE,long(localInt13 + InfoPanelSizeAdjust * 60.0 + localInt08)); 
     ObjectSetInteger(0,"linet",OBJPROP_XDISTANCE,localInt12 + localInt07); 
     ObjectSetString(0,"linet",OBJPROP_TEXT,"Manual lotsize: " + string(g_startLots_rw) + "lots");
     ObjectSetInteger(0,"linet",OBJPROP_COLOR,panelTextColor);
     ObjectSetInteger(0,"linet",OBJPROP_FONTSIZE,panelFontSize);
   }
 }
 ObjectCreate(0,"lineopl" + IntegerToString(0,0,32),OBJ_LABEL,0,0,0.0);
 ObjectSetInteger(0,"lineopl" + IntegerToString(0,0,32),OBJPROP_CORNER,localInt11); 
 ObjectSetInteger(0,"lineopl" + IntegerToString(0,0,32),OBJPROP_YDISTANCE,(long)(localInt13 + InfoPanelSizeAdjust * 76.0 + localInt08)); 
 ObjectSetInteger(0,"lineopl" + IntegerToString(0,0,32),OBJPROP_XDISTANCE,localInt12 + localInt07); 
 ObjectSetString(0,"lineopl" + IntegerToString(0,0,32),OBJPROP_TEXT,"Open P/L: -");
 ObjectSetInteger(0,"lineopl" + IntegerToString(0,0,32),OBJPROP_COLOR,panelTextColor);
 ObjectSetInteger(0,"lineopl" + IntegerToString(0,0,32),OBJPROP_FONTSIZE,panelFontSize);
 ObjectCreate(0,"linea" + IntegerToString(0,0,32),OBJ_LABEL,0,0,0.0);
 ObjectSetInteger(0,"linea" + IntegerToString(0,0,32),OBJPROP_CORNER,localInt11); 
 ObjectSetInteger(0,"linea" + IntegerToString(0,0,32),OBJPROP_YDISTANCE,(long)(localInt13 + InfoPanelSizeAdjust * 108.0 + localInt08)); 
 ObjectSetInteger(0,"linea" + IntegerToString(0,0,32),OBJPROP_XDISTANCE,localInt12 + localInt07); 
 ObjectSetString(0,"linea" + IntegerToString(0,0,32),OBJPROP_TEXT,"Account Balance: -");
 ObjectSetInteger(0,"linea" + IntegerToString(0,0,32),OBJPROP_COLOR,panelTextColor);
 ObjectSetInteger(0,"linea" + IntegerToString(0,0,32),OBJPROP_FONTSIZE,panelFontSize);
 ObjectCreate(0,"linetp" + IntegerToString(0,0,32),OBJ_LABEL,0,0,0.0);
 ObjectSetInteger(0,"linetp" + IntegerToString(0,0,32),OBJPROP_CORNER,localInt11);
 ObjectSetInteger(0,"linetp" + IntegerToString(0,0,32),OBJPROP_YDISTANCE,(long)(localInt13 + InfoPanelSizeAdjust * 124.0 + localInt08));
 ObjectSetInteger(0,"linetp" + IntegerToString(0,0,32),OBJPROP_XDISTANCE,localInt12 + localInt07);
 ObjectSetString(0,"linetp" + IntegerToString(0,0,32),OBJPROP_TEXT,"Total P/L so far: -");
 ObjectSetInteger(0,"linetp" + IntegerToString(0,0,32),OBJPROP_COLOR,panelTextColor);
 ObjectSetInteger(0,"linetp" + IntegerToString(0,0,32),OBJPROP_FONTSIZE,panelFontSize);
 if ( EnableNFP_Filter )
 {
   ObjectCreate(0,"linenfp" + IntegerToString(0,0,32),OBJ_LABEL,0,0,0.0);
   ObjectSetInteger(0,"linenfp" + IntegerToString(0,0,32),OBJPROP_CORNER,localInt11);
   ObjectSetInteger(0,"linenfp" + IntegerToString(0,0,32),OBJPROP_YDISTANCE,(long)(localInt13 + InfoPanelSizeAdjust * 140.0 + localInt08));
   ObjectSetInteger(0,"linenfp" + IntegerToString(0,0,32),OBJPROP_XDISTANCE,localInt12 + localInt07);
   ObjectSetString(0,"linenfp" + IntegerToString(0,0,32),OBJPROP_TEXT,"No News Coming Up");
   ObjectSetInteger(0,"linenfp" + IntegerToString(0,0,32),OBJPROP_COLOR,panelTextColor);
   ObjectSetInteger(0,"linenfp" + IntegerToString(0,0,32),OBJPROP_FONTSIZE,panelFontSize);
 }
 if ( OnlyUp )
 {
   ObjectCreate(0,"lineup" + IntegerToString(0,0,32),OBJ_LABEL,0,0,0.0);
   ObjectSetInteger(0,"lineup" + IntegerToString(0,0,32),OBJPROP_CORNER,localInt11);
   ObjectSetInteger(0,"lineup" + IntegerToString(0,0,32),OBJPROP_YDISTANCE,(long)(localInt13 + InfoPanelSizeAdjust * 92.0 + localInt08));
   ObjectSetInteger(0,"lineup" + IntegerToString(0,0,32),OBJPROP_XDISTANCE,localInt12 + localInt07);
