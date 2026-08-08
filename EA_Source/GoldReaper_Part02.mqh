               double stoploss,double takeprofit,string comment="",int magic=0,
               datetime expiration=0,color arrow_color=clrNONE)
{
   MqlTradeRequest request;
   MqlTradeResult  result;
   ZeroMemory(request);
   ZeroMemory(result);
   request.symbol=symbol;
   request.volume=volume;
   request.sl=stoploss;
   request.tp=takeprofit;
   request.comment=comment;
   request.magic=(ulong)magic;
   request.deviation=(ulong)MathMax(slippage,0);
   request.type_filling=MT4SelectFilling(symbol);

   // HARD SAFETY GATE: never place a new market/pending order while the
   // broker trade session is closed. This runs inside the common OrderSend
   // wrapper so every strategy and every restore/re-entry path is protected.
   if(!MT4SessionMarket(symbol))
   {
      g_mt4_lastError=132; // ERR_MARKET_CLOSED
      g_mt4_lastTicket=-1;
      static datetime last_market_closed_log=0;
      datetime log_now=IsTesting()?TimeCurrent():TimeTradeServer();
      if(log_now<=0) log_now=TimeCurrent();
      if(last_market_closed_log==0 || log_now-last_market_closed_log>=60)
      {
         PrintFormat("Market closed - OrderSend blocked for %s (cmd=%d)",symbol,cmd);
         last_market_closed_log=log_now;
      }
      return -1;
   }

   if(cmd==OP_BUY || cmd==OP_SELL)
   {
      request.action=TRADE_ACTION_DEAL;
      request.type=(cmd==OP_BUY)?ORDER_TYPE_BUY:ORDER_TYPE_SELL;
      request.price=(cmd==OP_BUY)?SymbolInfoDouble(symbol,SYMBOL_ASK):SymbolInfoDouble(symbol,SYMBOL_BID);
   }
   else
   {
      request.action=TRADE_ACTION_PENDING;
      switch(cmd)
      {
         case OP_BUYLIMIT:  request.type=ORDER_TYPE_BUY_LIMIT;  break;
         case OP_SELLLIMIT: request.type=ORDER_TYPE_SELL_LIMIT; break;
         case OP_BUYSTOP:   request.type=ORDER_TYPE_BUY_STOP;   break;
         case OP_SELLSTOP:  request.type=ORDER_TYPE_SELL_STOP;  break;
      }
      request.price=price;
      request.type_time=(expiration>0)?ORDER_TIME_SPECIFIED:ORDER_TIME_GTC;
      request.expiration=expiration;
      request.type_filling=ORDER_FILLING_RETURN;
   }

   bool ok=::OrderSend(request,result);
   if(!ok && result.retcode==0) result.retcode=TRADE_RETCODE_ERROR;
   g_mt4_lastError=TradeRetcodeToMT4Error(result.retcode);
   if(ok && (result.retcode==TRADE_RETCODE_DONE || result.retcode==TRADE_RETCODE_DONE_PARTIAL || result.retcode==TRADE_RETCODE_PLACED))
   {
      g_mt4_lastError=0;
      ulong ticket=result.order;
      if(ticket==0) ticket=result.deal;
      g_mt4_lastTicket=(long)ticket;
      MT4PrintTradeOk("open",g_mt4_lastTicket,request);
      return g_mt4_lastTicket;
   }
   MT4PrintTradeReject("open",request,result);
   g_mt4_lastTicket=-1;
   return -1;
}

//====================================================================
// OrderModify() kieu MQL4
//====================================================================
bool OrderModify(long ticket,double price,double stoploss,double takeprofit,datetime expiration,color arrow_color=clrNONE)
{
   MqlTradeRequest request;
   MqlTradeResult  result;
   ZeroMemory(request);
   ZeroMemory(result);

   // TRADE_ACTION_SLTP khong su dung request.price, vi vay request.price luon bang 0.
   // Luu rieng gia de ghi log: vi the thi hien thi gia mo, lenh cho thi hien thi gia sua.
   double log_price=price;

   if(PositionSelectByTicket((ulong)ticket))
   {
      request.action=TRADE_ACTION_SLTP;
      request.position=(ulong)ticket;
      request.symbol=PositionGetString(POSITION_SYMBOL);
      request.sl=stoploss;
      request.tp=takeprofit;
      log_price=PositionGetDouble(POSITION_PRICE_OPEN);
   }
   else if(::OrderSelect((ulong)ticket))
   {
      request.action=TRADE_ACTION_MODIFY;
      request.order=(ulong)ticket;
      request.symbol=OrderGetString(ORDER_SYMBOL);
      request.price=price;
      request.sl=stoploss;
      request.tp=takeprofit;
      request.type_time=(expiration>0)?ORDER_TIME_SPECIFIED:ORDER_TIME_GTC;
      request.expiration=expiration;
      log_price=request.price;
   }
   else
   {
      g_mt4_lastError = 4108; // ERR_INVALID_TICKET
      return false;
   }

   bool ok=::OrderSend(request,result);
   if(!ok && result.retcode==0) result.retcode=TRADE_RETCODE_ERROR;
   g_mt4_lastError=TradeRetcodeToMT4Error(result.retcode);
   if(ok && (result.retcode==TRADE_RETCODE_DONE || result.retcode==TRADE_RETCODE_DONE_PARTIAL))
   {
      g_mt4_lastError=0;
      PrintFormat("modify #%I64d %s price: %.5f sl: %.5f tp: %.5f ok",
                  ticket,request.symbol,log_price,request.sl,request.tp);
      return true;
   }
   MT4PrintTradeReject("modify",request,result);
   return false;
}

//====================================================================
// OrderClose() kieu MQL4 (dong vi the theo ticket, ho tro dong 1 phan)
//====================================================================
bool OrderClose(long ticket,double lots,double price,int slippage,color arrow_color=clrNONE)
{
   if(!PositionSelectByTicket((ulong)ticket))
   {
      g_mt4_lastError = 4108; // ERR_INVALID_TICKET
      return false;
   }
   string symbol=PositionGetString(POSITION_SYMBOL);
   double volume=PositionGetDouble(POSITION_VOLUME);
   long   posType=PositionGetInteger(POSITION_TYPE);
   double closeLots=(lots>0.0 && lots<volume)?lots:volume;

   MqlTradeRequest request;
   MqlTradeResult  result;
   ZeroMemory(request);
   ZeroMemory(result);
   request.action=TRADE_ACTION_DEAL;
   request.position=(ulong)ticket;
   request.symbol=symbol;
   request.volume=closeLots;
   request.deviation=(ulong)MathMax(slippage,0);
   request.type_filling=MT4SelectFilling(symbol);
   if(posType==POSITION_TYPE_BUY)
   {
      request.type=ORDER_TYPE_SELL;
      request.price=SymbolInfoDouble(symbol,SYMBOL_BID);
   }
   else
   {
      request.type=ORDER_TYPE_BUY;
      request.price=SymbolInfoDouble(symbol,SYMBOL_ASK);
   }

   bool ok=::OrderSend(request,result);
   if(!ok && result.retcode==0) result.retcode=TRADE_RETCODE_ERROR;
   g_mt4_lastError=TradeRetcodeToMT4Error(result.retcode);
   if(ok && (result.retcode==TRADE_RETCODE_DONE || result.retcode==TRADE_RETCODE_DONE_PARTIAL))
   {
      g_mt4_lastError=0;
      // MT4 in "close #ticket <chieu vi the goc> lots symbol at gia ok"
      PrintFormat("close #%I64d %s %.2f %s at %.5f ok",
                  ticket,(posType==POSITION_TYPE_BUY)?"buy":"sell",
                  closeLots,symbol,request.price);
      return true;
   }
   MT4PrintTradeReject("close",request,result);
   return false;
}

//====================================================================
// OrderDelete() kieu MQL4 (huy lenh cho)
//====================================================================
bool OrderDelete(long ticket,color arrow_color=clrNONE)
{
   MqlTradeRequest request;
   MqlTradeResult  result;
   ZeroMemory(request);
   ZeroMemory(result);
   request.action=TRADE_ACTION_REMOVE;
   request.order=(ulong)ticket;
   // Lay thong tin lenh TRUOC khi xoa de log giong MT4
   // ("delete #123 buy stop 0.14 XAUUSD at 3962.66 ok")
   string delName="order"; double delVol=0.0,delPrice=0.0; string delSym="";
   if(::OrderSelect((ulong)ticket))
   {
      delName=MT4OrderTypeName((int)::OrderGetInteger(ORDER_TYPE));
      delVol=::OrderGetDouble(ORDER_VOLUME_CURRENT);
      delPrice=::OrderGetDouble(ORDER_PRICE_OPEN);
      delSym=::OrderGetString(ORDER_SYMBOL);
   }

   bool ok=::OrderSend(request,result);
   if(!ok && result.retcode==0) result.retcode=TRADE_RETCODE_ERROR;
   g_mt4_lastError=TradeRetcodeToMT4Error(result.retcode);
   if(ok && result.retcode==TRADE_RETCODE_DONE)
   {
      g_mt4_lastError=0;
      PrintFormat("delete #%I64d %s %.2f %s at %.5f ok",
                  ticket,delName,delVol,delSym,delPrice);
      return true;
   }
   MT4PrintTradeReject("delete",request,result);
   return false;
}

//====================================================================
// Vung du lieu "lenh dang chon" hien tai kieu MQL4 (OrderSelect/
// OrderTicket/OrderType/OrderLots/...). Ho tro ca vi the dang mo,
// lenh cho dang mo (pool=MODE_TRADES) va lich su (pool=MODE_HISTORY).
//====================================================================
// Trang thai "lenh dang chon" kieu MQL4 - gom vao 1 struct cho gon
// (truoc day la 16 bien toan cu roi g_selOrder.*). OrderSelect() dien
// vao day; OrderTicket()/OrderLots()/OrderType()/... doc ra tu day.
struct MT4SelectedOrder
{
   long     ticket;
   string   symbol;
   int      type;
   double   lots;
   double   openPrice;
   double   closePrice;
   double   sl;
   double   tp;
   datetime openTime;
   datetime closeTime;
   datetime expiration;
   double   profit;
   double   swap;
   double   commission;
   string   comment;
   int      magic;
};
MT4SelectedOrder g_selOrder;

//--- danh sach cache cho pool=MODE_HISTORY (xay tu HistoryDealsTotal) ---
long     g_hist_ticket[];
string   g_hist_symbol[];
int      g_hist_type[];
double   g_hist_lots[];
double   g_hist_openPrice[];
double   g_hist_closePrice[];
datetime g_hist_openTime[];
datetime g_hist_closeTime[];
double   g_hist_profit[];
double   g_hist_swap[];
double   g_hist_commission[];
string   g_hist_comment[];
int      g_hist_magic[];
datetime g_hist_expiration[];
int      g_hist_count=0;
datetime g_hist_builtAt=0;

void MT4BuildHistoryCache()
{
   // Xay lai toi da 1 lan / giay de tranh qua tai khi vong lap goi lien tuc
   if(TimeCurrent()==g_hist_builtAt) return;
   g_hist_builtAt=TimeCurrent();

   ArrayResize(g_hist_ticket,0);
   ArrayResize(g_hist_symbol,0);
   ArrayResize(g_hist_type,0);
   ArrayResize(g_hist_lots,0);
   ArrayResize(g_hist_openPrice,0);
   ArrayResize(g_hist_closePrice,0);
   ArrayResize(g_hist_openTime,0);
   ArrayResize(g_hist_closeTime,0);
   ArrayResize(g_hist_profit,0);
   ArrayResize(g_hist_swap,0);
   ArrayResize(g_hist_commission,0);
   ArrayResize(g_hist_comment,0);
   ArrayResize(g_hist_magic,0);
   ArrayResize(g_hist_expiration,0);
   g_hist_count=0;

   if(!HistorySelect(0,TimeCurrent())) return;
   int deals=HistoryDealsTotal();

   long     posIds[];
   int      idxByPos_pos[]; // song song voi posIds: vi tri trong mang cache
   ArrayResize(posIds,0);

   for(int i=0;i<deals;i++)
   {
      ulong dealTicket=HistoryDealGetTicket(i);
      if(dealTicket==0) continue;
      long entry=HistoryDealGetInteger(dealTicket,DEAL_ENTRY);
      long posId=HistoryDealGetInteger(dealTicket,DEAL_POSITION_ID);
      long dealType=HistoryDealGetInteger(dealTicket,DEAL_TYPE);
      if(dealType!=DEAL_TYPE_BUY && dealType!=DEAL_TYPE_SELL) continue; // bo qua balance/credit/...

      int pos=-1;
      for(int k=0;k<ArraySize(posIds);k++)
      {
         if(posIds[k]==posId) { pos=k; break; }
      }
      if(pos<0)
      {
         pos=ArraySize(posIds);
         ArrayResize(posIds,pos+1);
         posIds[pos]=posId;
         int n=g_hist_count+1;
         ArrayResize(g_hist_ticket,n);
         ArrayResize(g_hist_symbol,n);
         ArrayResize(g_hist_type,n);
         ArrayResize(g_hist_lots,n);
         ArrayResize(g_hist_openPrice,n);
         ArrayResize(g_hist_closePrice,n);
         ArrayResize(g_hist_openTime,n);
         ArrayResize(g_hist_closeTime,n);
         ArrayResize(g_hist_profit,n);
         ArrayResize(g_hist_swap,n);
         ArrayResize(g_hist_commission,n);
         ArrayResize(g_hist_comment,n);
         ArrayResize(g_hist_magic,n);
         ArrayResize(g_hist_expiration,n);
         g_hist_ticket[g_hist_count]=(long)posId;
         g_hist_symbol[g_hist_count]="";
         g_hist_type[g_hist_count]=0;
         g_hist_lots[g_hist_count]=0.0;
         g_hist_openPrice[g_hist_count]=0.0;
         g_hist_closePrice[g_hist_count]=0.0;
         g_hist_openTime[g_hist_count]=0;
         g_hist_closeTime[g_hist_count]=0;
         g_hist_profit[g_hist_count]=0.0;
         g_hist_swap[g_hist_count]=0.0;
         g_hist_commission[g_hist_count]=0.0;
         g_hist_comment[g_hist_count]="";
         g_hist_magic[g_hist_count]=0;
         g_hist_expiration[g_hist_count]=0;
         g_hist_count=n;
      }

      if(entry==DEAL_ENTRY_IN)
      {
         g_hist_symbol[pos]=HistoryDealGetString(dealTicket,DEAL_SYMBOL);
         g_hist_type[pos]=(dealType==DEAL_TYPE_BUY)?OP_BUY:OP_SELL;
         g_hist_lots[pos]=HistoryDealGetDouble(dealTicket,DEAL_VOLUME);
         g_hist_openPrice[pos]=HistoryDealGetDouble(dealTicket,DEAL_PRICE);
         g_hist_openTime[pos]=(datetime)HistoryDealGetInteger(dealTicket,DEAL_TIME);
         g_hist_magic[pos]=(int)HistoryDealGetInteger(dealTicket,DEAL_MAGIC);
         g_hist_comment[pos]=HistoryDealGetString(dealTicket,DEAL_COMMENT);
         g_hist_profit[pos]+=HistoryDealGetDouble(dealTicket,DEAL_PROFIT);
         g_hist_swap[pos]+=HistoryDealGetDouble(dealTicket,DEAL_SWAP);
         g_hist_commission[pos]+=HistoryDealGetDouble(dealTicket,DEAL_COMMISSION);
      }
      else // DEAL_ENTRY_OUT hoac DEAL_ENTRY_OUT_BY (dong 1 phan/toan bo)
      {
         g_hist_closePrice[pos]=HistoryDealGetDouble(dealTicket,DEAL_PRICE);
         datetime ct=(datetime)HistoryDealGetInteger(dealTicket,DEAL_TIME);
         if(ct>g_hist_closeTime[pos]) g_hist_closeTime[pos]=ct;
         g_hist_profit[pos]+=HistoryDealGetDouble(dealTicket,DEAL_PROFIT);
         g_hist_swap[pos]+=HistoryDealGetDouble(dealTicket,DEAL_SWAP);
         g_hist_commission[pos]+=HistoryDealGetDouble(dealTicket,DEAL_COMMISSION);
         if(g_hist_symbol[pos]=="") g_hist_symbol[pos]=HistoryDealGetString(dealTicket,DEAL_SYMBOL);
         if(g_hist_magic[pos]==0)   g_hist_magic[pos]=(int)HistoryDealGetInteger(dealTicket,DEAL_MAGIC);
      }
   }
   // sap xep tang dan theo thoi gian dong (gan giong thu tu ticket MQL4)
   for(int a=0;a<g_hist_count;a++)
   for(int b=a+1;b<g_hist_count;b++)
   {
      if(g_hist_closeTime[b]<g_hist_closeTime[a])
      {
         long lt; string ss; int it; double dd; datetime dt;
         lt=g_hist_ticket[a]; g_hist_ticket[a]=g_hist_ticket[b]; g_hist_ticket[b]=lt;
         ss=g_hist_symbol[a]; g_hist_symbol[a]=g_hist_symbol[b]; g_hist_symbol[b]=ss;
         it=g_hist_type[a]; g_hist_type[a]=g_hist_type[b]; g_hist_type[b]=it;
         dd=g_hist_lots[a]; g_hist_lots[a]=g_hist_lots[b]; g_hist_lots[b]=dd;
         dd=g_hist_openPrice[a]; g_hist_openPrice[a]=g_hist_openPrice[b]; g_hist_openPrice[b]=dd;
         dd=g_hist_closePrice[a]; g_hist_closePrice[a]=g_hist_closePrice[b]; g_hist_closePrice[b]=dd;
         dt=g_hist_openTime[a]; g_hist_openTime[a]=g_hist_openTime[b]; g_hist_openTime[b]=dt;
         dt=g_hist_closeTime[a]; g_hist_closeTime[a]=g_hist_closeTime[b]; g_hist_closeTime[b]=dt;
         dd=g_hist_profit[a]; g_hist_profit[a]=g_hist_profit[b]; g_hist_profit[b]=dd;
         dd=g_hist_swap[a]; g_hist_swap[a]=g_hist_swap[b]; g_hist_swap[b]=dd;
         dd=g_hist_commission[a]; g_hist_commission[a]=g_hist_commission[b]; g_hist_commission[b]=dd;
         ss=g_hist_comment[a]; g_hist_comment[a]=g_hist_comment[b]; g_hist_comment[b]=ss;
         it=g_hist_magic[a]; g_hist_magic[a]=g_hist_magic[b]; g_hist_magic[b]=it;
      }
   }
}

//====================================================================
// OrdersTotal() kieu MQL4 (vi the dang mo + lenh cho) -> doi ten thanh
// MT4OrdersTotal() vi OrdersTotal() da la ham co san cua MQL5 (chi dem
// lenh cho) nen khong the dinh nghia chong len.
//====================================================================
int MT4OrdersTotal()
{
   return PositionsTotal()+OrdersTotal();
}

int HistoryTotal()
{
   MT4BuildHistoryCache();
   return g_hist_count;
}

//====================================================================
// OrderSelect() kieu MQL4 (3 tham so, khac chu ky voi ham OrderSelect
// 1-tham-so co san cua MQL5 nen khong xung dot).
//====================================================================
bool OrderSelect(long index_or_ticket,int select,int pool=MODE_TRADES)
{
   if(select==SELECT_BY_TICKET)
   {
      long ticket=(long)index_or_ticket;
      if(PositionSelectByTicket((ulong)ticket))
      {
         g_selOrder.ticket=ticket;
         g_selOrder.symbol=PositionGetString(POSITION_SYMBOL);
         g_selOrder.type=(int)PositionGetInteger(POSITION_TYPE);
         g_selOrder.lots=PositionGetDouble(POSITION_VOLUME);
         g_selOrder.openPrice=PositionGetDouble(POSITION_PRICE_OPEN);
         g_selOrder.closePrice=PositionGetDouble(POSITION_PRICE_CURRENT);
         g_selOrder.sl=PositionGetDouble(POSITION_SL);
         g_selOrder.tp=PositionGetDouble(POSITION_TP);
         g_selOrder.openTime=(datetime)PositionGetInteger(POSITION_TIME);
         g_selOrder.closeTime=0;
         g_selOrder.expiration=0;
         g_selOrder.profit=PositionGetDouble(POSITION_PROFIT);
         g_selOrder.swap=PositionGetDouble(POSITION_SWAP);
         g_selOrder.commission=0.0;
         g_selOrder.comment=PositionGetString(POSITION_COMMENT);
         g_selOrder.magic=(int)PositionGetInteger(POSITION_MAGIC);
         return true;
      }
      if(::OrderSelect((ulong)ticket))
      {
         g_selOrder.ticket=ticket;
         g_selOrder.symbol=::OrderGetString(ORDER_SYMBOL);
         g_selOrder.type=(int)::OrderGetInteger(ORDER_TYPE);
         g_selOrder.lots=::OrderGetDouble(ORDER_VOLUME_CURRENT);
         g_selOrder.openPrice=::OrderGetDouble(ORDER_PRICE_OPEN);
         g_selOrder.closePrice=0.0;
         g_selOrder.sl=::OrderGetDouble(ORDER_SL);
         g_selOrder.tp=::OrderGetDouble(ORDER_TP);
         g_selOrder.openTime=(datetime)::OrderGetInteger(ORDER_TIME_SETUP);
         g_selOrder.closeTime=0;
         g_selOrder.expiration=(datetime)::OrderGetInteger(ORDER_TIME_EXPIRATION);
         g_selOrder.profit=0.0;
         g_selOrder.swap=0.0;
         g_selOrder.commission=0.0;
         g_selOrder.comment=::OrderGetString(ORDER_COMMENT);
         g_selOrder.magic=(int)::OrderGetInteger(ORDER_MAGIC);
         return true;
      }
      MT4BuildHistoryCache();
      for(int i=0;i<g_hist_count;i++)
      {
         if(g_hist_ticket[i]==ticket)
         {
            g_selOrder.ticket=g_hist_ticket[i];
