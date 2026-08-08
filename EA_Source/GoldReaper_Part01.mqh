#property copyright  "Copyright 2026 - Pham Duy Linh"
#property link       "https://t.me/Khonglamdoicoan96"
#property version    "4.5"
#property description "- Fixed the www.worldtimeserver GMT fetch bug"
#property description "- Fixed the OnlyUp bug"
#property description "- Hardcoded NFP dates -> now automatic (MT5 Economic Calendar), auto-retries on error"
#property description "- Added input to close trades at end of Friday session"
#property description "- Highest Balance shown on panel"
#property description "- Warns the exact missing allowed URL"
#property description "- Full MT4-style trade logging"
#property description "- A few handy inputs (all default to the original behavior)"
#property description "Telegram: t.me/Khonglamdoicoan96"

//==================================================================
// MQL4Compat: lop tuong thich MQL4->MQL5 (truoc day la file include
// rieng MQL4Compat.mqh) - da GOP truc tiep vao day de EA chi con 1
// file .mq5 duy nhat, khong can copy file include rieng.
//==================================================================
//+------------------------------------------------------------------+
//| MQL4Compat.mqh                                                    |
//|                                                                    |
//| Lop tuong thich MQL4 -> MQL5 danh rieng cho The Gold Reaper.       |
//| Muc dich: cho phep GIU NGUYEN 100% logic goc viet theo phong cach  |
//| MQL4 (OrderSend/OrderModify/OrderClose/OrderDelete/OrderSelect,    |
//| OrdersTotal/HistoryTotal, MarketInfo, AccountBalance/Equity,       |
//| Time*()/Year()/Month()/Day()/Hour()/Minute()/Seconds()/DayOfWeek(),|
//| iMA()/iFractals() kieu tra ve gia tri truc tiep...) trong khi thuc |
//| thi ben duoi hoan toan bang API MQL5 (Position/Order/Deal,         |
//| OrderSend(MqlTradeRequest&,MqlTradeResult&) dong bo truc tiep -    |
//| khong qua CTrade - de gui/sua/dong/huy lenh, SymbolInfo*,          |
//| AccountInfo*, TimeToStruct...).                                    |
//|                                                                    |
//| QUAN TRONG:                                                        |
//|  - EA nay mo dong thoi nhieu lenh/vi the tren cung 1 symbol voi    |
//|    nhieu magic number khac nhau (multi-strategy). Vi vay tai khoan |
//|    MT5 chay EA nay BAT BUOC phai o che do HEDGING. O che do        |
//|    Netting, moi lenh cung symbol se bi gop thanh 1 vi the duy nhat |
//|    va lam sai toan bo logic quan ly lenh cua EA.                   |
//|  - Cac ham lay lich su lenh (pool=MODE_HISTORY) duoc dung lai tu   |
//|    HistoryDealsTotal(): moi cap deal (DEAL_ENTRY_IN + DEAL_ENTRY_  |
//|    OUT/OUT_BY cung POSITION_ID) duoc ghep thanh 1 "lenh lich su"   |
//|    kieu MQL4. Neu 1 vi the bi dong nhieu lan (dong 1 phan), cac    |
//|    deal dong se duoc GOM lai thanh 1 ban ghi duy nhat (tong loi/lo)|
//|    -> khac biet nho so voi MQL4 (MQL4 tao 1 ticket rieng cho moi   |
//|    lan dong 1 phan). EA nay khong dung dong 1 phan lenh nen anh    |
//|    huong la khong dang ke.                                        |
//+------------------------------------------------------------------+
#ifndef __MQL4COMPAT_MQH__
#define __MQL4COMPAT_MQH__

//====================================================================
// Hang so kieu MQL4
//====================================================================
#define OP_BUY        0
#define OP_SELL       1
#define OP_BUYLIMIT   2
#define OP_SELLLIMIT  3
#define OP_BUYSTOP    4
#define OP_SELLSTOP   5

#define SELECT_BY_POS    0
#define SELECT_BY_TICKET 1
#define MODE_TRADES      0
#define MODE_HISTORY     1

// Ma so MarketInfo() kieu MQL4 (chi gom cac ma EA nay su dung)
#define MODE_BID              9
#define MODE_ASK              10
#define MODE_POINT            11
#define MODE_DIGITS           12
#define MODE_STOPLEVEL        14
#define MODE_TICKVALUE        16
#define MODE_TRADEALLOWED     22
#define MODE_MINLOT           23
#define MODE_LOTSTEP          24
#define MODE_MAXLOT           25
#define MODE_FREEZELEVEL      33

//====================================================================
// Bien trang thai noi bo
//====================================================================
long g_mt4_lastTicket = -1;
// MT5 ticket/order/deal IDs are 64-bit. Khong ep ket qua OrderSend/OrderTicket ve int.

int  g_mt4_lastError  = 0;

//====================================================================
// Quy doi timeframe kieu "so phut" (MQL4 cu) -> ENUM_TIMEFRAMES MQL5.
// Neu tham so da la hang PERIOD_xxx cua MQL5 (gia tri >= 16385) thi
// tra ve nguyen (pass-through) vi da dung.
//====================================================================
ENUM_TIMEFRAMES MT4Period(int minutes)
{
   switch(minutes)
   {
      case 0:     return PERIOD_CURRENT;
      case 1:     return PERIOD_M1;
      case 2:     return PERIOD_M2;
      case 3:     return PERIOD_M3;
      case 4:     return PERIOD_M4;
      case 5:     return PERIOD_M5;
      case 6:     return PERIOD_M6;
      case 10:    return PERIOD_M10;
      case 12:    return PERIOD_M12;
      case 15:    return PERIOD_M15;
      case 20:    return PERIOD_M20;
      case 30:    return PERIOD_M30;
      case 60:    return PERIOD_H1;
      case 120:   return PERIOD_H2;
      case 180:   return PERIOD_H3;
      case 240:   return PERIOD_H4;
      case 360:   return PERIOD_H6;
      case 480:   return PERIOD_H8;
      case 720:   return PERIOD_H12;
      case 1440:  return PERIOD_D1;
      case 10080: return PERIOD_W1;
      case 43200: return PERIOD_MN1;
      default:    return (ENUM_TIMEFRAMES)minutes; // da la PERIOD_xxx cua MQL5
   }
}

//====================================================================
// MarketInfo() kieu MQL4
//====================================================================
double MarketInfo(string symbol,int mode)
{
   switch(mode)
   {
      case MODE_BID:          return SymbolInfoDouble(symbol,SYMBOL_BID);
      case MODE_ASK:           return SymbolInfoDouble(symbol,SYMBOL_ASK);
      case MODE_POINT:         return SymbolInfoDouble(symbol,SYMBOL_POINT);
      case MODE_DIGITS:        return (double)SymbolInfoInteger(symbol,SYMBOL_DIGITS);
      case MODE_STOPLEVEL:     return (double)SymbolInfoInteger(symbol,SYMBOL_TRADE_STOPS_LEVEL);
      case MODE_TICKVALUE:     return SymbolInfoDouble(symbol,SYMBOL_TRADE_TICK_VALUE);
      case MODE_TRADEALLOWED:  return MT4SessionMarket(symbol)?1.0:0.0;
      case MODE_MINLOT:        return SymbolInfoDouble(symbol,SYMBOL_VOLUME_MIN);
      case MODE_LOTSTEP:       return SymbolInfoDouble(symbol,SYMBOL_VOLUME_STEP);
      case MODE_MAXLOT:        return SymbolInfoDouble(symbol,SYMBOL_VOLUME_MAX);
      case MODE_FREEZELEVEL:   return (double)SymbolInfoInteger(symbol,SYMBOL_TRADE_FREEZE_LEVEL);
   }
   return 0.0;
}

//====================================================================
// Account*() kieu MQL4
//====================================================================
double AccountBalance()  { return AccountInfoDouble(ACCOUNT_BALANCE); }
double AccountEquity()   { return AccountInfoDouble(ACCOUNT_EQUITY);  }
string AccountCurrency() { return AccountInfoString(ACCOUNT_CURRENCY);}

double AccountFreeMarginCheck(string symbol,int cmd,double volume)
{
   MqlTradeRequest request;
   MqlTradeCheckResult check;
   ZeroMemory(request);
   ZeroMemory(check);

   request.action = TRADE_ACTION_DEAL;
   request.symbol = symbol;
   request.volume = volume;
   request.type_filling = MT4SelectFilling(symbol);

   if(cmd==OP_BUY)
   {
      request.type = ORDER_TYPE_BUY;
      request.price = SymbolInfoDouble(symbol,SYMBOL_ASK);
   }
   else
   {
      request.type = ORDER_TYPE_SELL;
      request.price = SymbolInfoDouble(symbol,SYMBOL_BID);
   }

   if(!::OrderCheck(request,check))
   {
      g_mt4_lastError = TradeRetcodeToMT4Error(check.retcode);
      if(check.retcode==TRADE_RETCODE_NO_MONEY)
         return -1.0;
      return check.margin_free;
   }

   g_mt4_lastError = 0;
   return check.margin_free;
}

//====================================================================
// RefreshRates() - khong con can thiet trong MQL5 (gia luon la moi),
// giu lai de code cu bien dich duoc, luon tra ve true.
//====================================================================
bool RefreshRates() { return true; }

//====================================================================
// IsDemo()/IsTesting() kieu MQL4 (khong con la ham co san trong MQL5)
//====================================================================
bool IsDemo()    { return AccountInfoInteger(ACCOUNT_TRADE_MODE)==ACCOUNT_TRADE_MODE_DEMO; }
bool IsTesting() { return (bool)MQLInfoInteger(MQL_TESTER); }


//====================================================================
// MT4SessionMarket: Market/session gate for BOTH live/demo and Strategy Tester.
//
// IMPORTANT:
//  - This is the SINGLE Market Close gate used before OrderSend().
//  - Uses broker trade-session metadata, not OrderCheck().
//  - Uses TimeTradeServer() on live/demo so a stale last tick cannot make
//    a closed weekend/session look open.
//  - If session metadata is unavailable, fail CLOSED: no new order is sent.
//====================================================================
bool MT4SessionMarket(string symbol,datetime when=0)
{
   long trade_mode=SymbolInfoInteger(symbol,SYMBOL_TRADE_MODE);
   // Preserve the original EA rule: MODE_TRADEALLOWED was true only in FULL mode.
   if(trade_mode!=SYMBOL_TRADE_MODE_FULL)
      return false;

   if(when<=0)
   {
      if(IsTesting())
         when=TimeCurrent();
      else
         when=TimeTradeServer();

      if(when<=0)
         when=TimeCurrent();
   }

   if(when<=0)
      return false;

   MqlDateTime now_struct;
   TimeToStruct(when,now_struct);
   ENUM_DAY_OF_WEEK dow=(ENUM_DAY_OF_WEEK)now_struct.day_of_week;
   int now_seconds=now_struct.hour*3600 + now_struct.min*60 + now_struct.sec;

   datetime session_from=0;
   datetime session_to=0;
   for(uint session_index=0; session_index<64; session_index++)
   {
      if(!SymbolInfoSessionTrade(symbol,dow,session_index,session_from,session_to))
         break;

      MqlDateTime from_struct;
      MqlDateTime to_struct;
      TimeToStruct(session_from,from_struct);
      TimeToStruct(session_to,to_struct);
      int from_seconds=from_struct.hour*3600 + from_struct.min*60 + from_struct.sec;
      int to_seconds=to_struct.hour*3600 + to_struct.min*60 + to_struct.sec;

      // Some brokers encode a 24-hour session as 00:00 -> 00:00.
      if(from_seconds==to_seconds)
         return true;

      if(from_seconds<to_seconds)
      {
         if(now_seconds>=from_seconds && now_seconds<to_seconds)
            return true;
      }
      else
      {
         // Session crosses midnight.
         if(now_seconds>=from_seconds || now_seconds<to_seconds)
            return true;
      }
   }

   // No matching session means market closed. If the broker/tester does not
   // expose session metadata, fail closed instead of risking an unwanted order.
   return false;
}

//====================================================================
// Cac ham thoi gian kieu MQL4 (khong con trong MQL5)
//====================================================================
int TimeYear(datetime t)      { MqlDateTime s; TimeToStruct(t,s); return s.year; }
int TimeMonth(datetime t)     { MqlDateTime s; TimeToStruct(t,s); return s.mon;  }
int TimeDay(datetime t)       { MqlDateTime s; TimeToStruct(t,s); return s.day;  }
int TimeHour(datetime t)      { MqlDateTime s; TimeToStruct(t,s); return s.hour; }
int TimeMinute(datetime t)    { MqlDateTime s; TimeToStruct(t,s); return s.min;  }
int TimeSeconds(datetime t)   { MqlDateTime s; TimeToStruct(t,s); return s.sec;  }
int TimeDayOfWeek(datetime t) { MqlDateTime s; TimeToStruct(t,s); return s.day_of_week; }
int TimeDayOfYear(datetime t) { MqlDateTime s; TimeToStruct(t,s); return s.day_of_year;  }

// Ban khong doi so (ngam dinh TimeCurrent()) - kieu MQL4 rat cu
int Year()      { return TimeYear(TimeCurrent());      }
int Month()     { return TimeMonth(TimeCurrent());     }
int Day()       { return TimeDay(TimeCurrent());       }
int Hour()      { return TimeHour(TimeCurrent());      }
int Minute()    { return TimeMinute(TimeCurrent());    }
int Seconds()   { return TimeSeconds(TimeCurrent());   }
int DayOfWeek() { return TimeDayOfWeek(TimeCurrent());  }

//====================================================================
// iMA()/iFractals() ban tra ve gia tri truc tiep (kieu MQL4), du lieu
// lay qua CopyBuffer tu handle indicator (MQL5 tu dong cache handle
// theo bo tham so nen goi lai moi tick khong gay ro ri tai nguyen).
//====================================================================
ENUM_APPLIED_PRICE MT4AppliedPrice(int p) { return (ENUM_APPLIED_PRICE)(p+1); }

double iMA(string symbol,int timeframe,int period,int ma_shift,int ma_method,int applied_price,int shift)
{
   int handle=iMA(symbol,MT4Period(timeframe),period,ma_shift,(ENUM_MA_METHOD)ma_method,MT4AppliedPrice(applied_price));
   if(handle==INVALID_HANDLE) return 0.0;
   double buf[];
   ArraySetAsSeries(buf,true);
   if(CopyBuffer(handle,0,shift,1,buf)<=0) return 0.0;
   return buf[0];
}

double iFractals(string symbol,int timeframe,int mode,int shift)
{
   int handle=iFractals(symbol,MT4Period(timeframe));
   if(handle==INVALID_HANDLE) return 0.0;
   int bufIndex=(mode==1)?0:1; // 1=MODE_UPPER->buffer0, 2=MODE_LOWER->buffer1
   double buf[];
   ArraySetAsSeries(buf,true);
   if(CopyBuffer(handle,bufIndex,shift,1,buf)<=0) return 0.0;
   return buf[0];
}

//====================================================================
// Chuyen doi retcode cua MQL5 -> ma loi kieu MQL4 (de cac doan retry
// "if(MT4_LastError()==132) ..." trong code goc hoat dong dung y nghia)
//====================================================================
int MT4_LastError() { return g_mt4_lastError; }

int TradeRetcodeToMT4Error(uint retcode)
{
   switch(retcode)
   {
      case TRADE_RETCODE_REQUOTE:        return 138; // ERR_REQUOTE
      case TRADE_RETCODE_REJECT:         return 134; // ERR_NOT_ENOUGH_MONEY (xap xi)
      case TRADE_RETCODE_CONNECTION:     return 137; // ERR_BROKER_BUSY (xap xi)
      case TRADE_RETCODE_MARKET_CLOSED:  return 132; // ERR_MARKET_CLOSED
      case TRADE_RETCODE_TRADE_DISABLED: return 133; // ERR_TRADE_DISABLED
      case TRADE_RETCODE_NO_MONEY:       return 134; // ERR_NOT_ENOUGH_MONEY
      case TRADE_RETCODE_PRICE_CHANGED:  return 135; // ERR_PRICE_CHANGED
      case TRADE_RETCODE_PRICE_OFF:      return 136; // ERR_OFF_QUOTES
      case TRADE_RETCODE_INVALID_STOPS:  return 130; // ERR_INVALID_STOPS
      case TRADE_RETCODE_INVALID_PRICE:  return 129; // ERR_INVALID_PRICE
      case TRADE_RETCODE_TIMEOUT:        return 128; // ERR_TRADE_TIMEOUT
      case TRADE_RETCODE_INVALID_VOLUME: return 131; // ERR_INVALID_TRADE_VOLUME
      case TRADE_RETCODE_DONE:           return 0;
      case TRADE_RETCODE_DONE_PARTIAL:   return 0;
      case TRADE_RETCODE_PLACED:         return 0;
   }
   return (int)retcode;
}

//====================================================================
// Gui lenh truc tiep bang OrderSend(MqlTradeRequest&,MqlTradeResult&)
// dong bo nguyen sinh cua MQL5 - KHONG qua lop CTrade. CTrade them 1
// lop trung gian (kiem tra trang thai, log, tach rieng ham cho tung
// loai lenh...) phia tren cung 1 loi goi OrderSend() nay, nen ban than
// no khong lam lenh "vao nhanh hon" ma chi lam cham hon so voi tu xay
// MqlTradeRequest va goi thang OrderSend() nhu 1 EA MQL5 viet tay (goi
// la "lenh tho"). Ham nay van dong bo 100% (cho server tra loi that
// truoc khi return, giong CTrade truoc day) nen an toan/logic khong
// doi - chi bo bot lop trung gian de dat toc do bang lenh tho.
//====================================================================
ENUM_ORDER_TYPE_FILLING MT4SelectFilling(string symbol)
{
   long mask=SymbolInfoInteger(symbol,SYMBOL_FILLING_MODE);
   if((mask&SYMBOL_FILLING_FOK)!=0)  return ORDER_FILLING_FOK;
   if((mask&SYMBOL_FILLING_IOC)!=0)  return ORDER_FILLING_IOC;
   return ORDER_FILLING_RETURN;
}

//====================================================================
// Log thao tac lenh GIONG TERMINAL MT4: MT4 tu dong in moi thao tac
// cua EA vao tab Experts ("open #123 buy stop 0.11 XAUUSD at ... ok"),
// ca thanh cong lan that bai. MT5 khong tu in nhu vay cho ::OrderSend
// tho, nen tu in lai o day de log giong het MT4. Chi log, khong doi logic.
//====================================================================
string MT4OrderTypeName(int t)
{
   switch(t)
   {
      case ORDER_TYPE_BUY:        return "buy";
      case ORDER_TYPE_SELL:       return "sell";
      case ORDER_TYPE_BUY_LIMIT:  return "buy limit";
      case ORDER_TYPE_SELL_LIMIT: return "sell limit";
      case ORDER_TYPE_BUY_STOP:   return "buy stop";
      case ORDER_TYPE_SELL_STOP:  return "sell stop";
   }
   return "order";
}

void MT4PrintTradeOk(string op,long ticket,const MqlTradeRequest &request)
{
   PrintFormat("%s #%I64d %s %.2f %s at %.5f sl: %.5f tp: %.5f ok",
               op,ticket,MT4OrderTypeName((int)request.type),request.volume,
               request.symbol,request.price,request.sl,request.tp);
}

void MT4PrintTradeReject(string op,const MqlTradeRequest &request,const MqlTradeResult &result)
{
   PrintFormat("failed %s %s %.2f %s at %.5f sl: %.5f tp: %.5f [%s] (retcode=%u, ticket=%I64u)",
               op,MT4OrderTypeName((int)request.type),request.volume,request.symbol,
               request.price,request.sl,request.tp,result.comment,result.retcode,
               (request.position>0)?request.position:request.order);
}

//====================================================================
// OrderSend() kieu MQL4 (11 tham so) -> tra ve ticket (>=0) hoac -1
//====================================================================
long OrderSend(string symbol,int cmd,double volume,double price,int slippage,
