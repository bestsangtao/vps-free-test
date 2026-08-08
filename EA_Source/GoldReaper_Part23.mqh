   }
   if ( OrderType() == 1 )
   {
     OrderClose(OrderTicket(),OrderLots(),MarketInfo(currentSymbol,MODE_ASK),(int)orderSlippageSetting,Red); 
   }
   if ( ( OrderType() != 4 && OrderType() != 5 ) )   continue;
   OrderDelete(OrderTicket(),Red); 
   
 }
 dailyDrawdownLockActive = true ;
 }
//lizong_46 <<==--------   --------
 int FetchUtcOffsetHours()
 {
  string    localString01;
  char      localChar02Array0[];
  char      localChar03Array0[];
  string    localString04;
  int       localInt05;
  int       localInt06;
  int       localInt07;
  string    localString08;
  int       localInt09;
  int       localInt10;
//----- -----
 int        tmpInt01;

 localString01 = "https://www.worldtimeserver.com/current_time_in_UTC.aspx" ;
 ResetLastError();
 ArrayResize(localChar02Array0,0); 
 // In MQL5 WebRequest() returns the HTTP status code and fills the body
 // into the result buffer. Use the 7-argument overload so the request is
 // a normal GET and we can parse the returned HTML directly.
 localInt05 = WebRequest("GET",localString01,"",NULL,5000,localChar02Array0,0,localChar03Array0,localString04) ;
 if ( localInt05 < 0 )
 {
   Print("Could not get GMT (WebRequest error ",GetLastError(),"). Add https://www.worldtimeserver.com to Tools -> Options -> Expert Advisors -> Allow WebRequest for listed URL");
   ResetLastError();
   return(999);
 }
 if ( localInt05 != 200 )
 {
   Print("Could not get GMT (HTTP ",localInt05,"). Add https://www.worldtimeserver.com to Tools -> Options -> Expert Advisors -> Allow WebRequest for listed URL");
   return(999);
 }
 localString04 = CharArrayToString(localChar03Array0,0,-1,CP_UTF8) ;
 if ( localString04 == "" )
 {
   Print("Could not get GMT: empty response from worldtimeserver.com");
   return(999);
 }
 localInt06 = StringFind(localString04,"UTC/GMT is",0) ;
 if ( localInt06 < 0 )
 {
   // Alternate marker used by newer HTML variants on worldtimeserver.com
   localInt06 = StringFind(localString04,"UTC/GMT",0) ;
 }
 if ( localInt06 < 0 )
 {
   Print("Could not parse GMT from worldtimeserver.com response");
   return(999);
 }
 localInt07 = StringFind(localString04,"</span>",localInt06) ;
 if ( localInt07 < 0 )
 {
   return(999);
 }
 localString08 = StringSubstr(localString04,localInt06,localInt07 - localInt06) ;
 // Strip HTML tags/spaces around the time value and locate HH:MM:SS.
 for (localInt09 = 0 ; localInt09 < StringLen(localString08) - 7 ; localInt09 ++)
 {
   if ( StringGetCharacter(localString08,localInt09 + 2) != ':' || StringGetCharacter(localString08,localInt09 + 5) != ':' )
      continue;
   string hh = StringSubstr(localString08,localInt09,2);
   string mm = StringSubstr(localString08,localInt09 + 3,2);
   string ss = StringSubstr(localString08,localInt09 + 6,2);
   if ((StringToInteger(hh) >= 0 && StringToInteger(hh) <= 23) &&
       (StringToInteger(mm) >= 0 && StringToInteger(mm) <= 59) &&
       (StringToInteger(ss) >= 0 && StringToInteger(ss) <= 59))
   {
      string d = TimeToString(TimeCurrent(),TIME_DATE);
      datetime utcNow = StringToTime(d + " " + hh + ":" + mm + ":" + ss);
      long secDiff = (long)(TimeCurrent() - utcNow);
      if (secDiff > 43200) secDiff -= 86400;
      if (secDiff < -43200) secDiff += 86400;
      localInt10 = (int)MathRound((double)secDiff / 3600.0);
      return(localInt10);
   }
 }
 Print("Could not parse GMT time from worldtimeserver.com response");
 return(999);
 }
//lizong_47 <<==--------   --------
 bool IsAmericanDaylightSavingTime()
 {
  int       localInt01;
  datetime  localDatetime02;
  MqlDateTime legacyLocal_3_a_128;
  int       localInt04;
  datetime  localDatetime05;
  MqlDateTime legacyLocal_6_a_128;
//----- -----

 localInt01 = TimeYear(TimeCurrent()) ;
 localDatetime02 = StringToTime(IntegerToString(localInt01,0,32) + ".03.08 02:00") ;
 TimeToStruct(localDatetime02,legacyLocal_3_a_128); 
 localInt04 = legacyLocal_3_a_128.day_of_week ;
 if ( localInt04 != 0 )
 {
   localDatetime02=localDatetime02 + (7 - localInt04) * 86400;
 }
 localDatetime05 = StringToTime(IntegerToString(localInt01,0,32) + ".11.01 02:00") ;
 TimeToStruct(localDatetime05,legacyLocal_6_a_128); 
 localInt04 = legacyLocal_6_a_128.day_of_week ;
 if ( localInt04 != 0 )
 {
   localDatetime05=localDatetime05 + (7 - localInt04) * 86400;
 }
 if ( TimeCurrent()>=localDatetime02 && TimeCurrent()<localDatetime05 )
 {
   return(true); 
 }
 return(false); 
 }
//lizong_48 <<==--------   --------
