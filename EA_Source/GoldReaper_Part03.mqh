            g_selOrder.symbol=g_hist_symbol[i];
            g_selOrder.type=g_hist_type[i];
            g_selOrder.lots=g_hist_lots[i];
            g_selOrder.openPrice=g_hist_openPrice[i];
            g_selOrder.closePrice=g_hist_closePrice[i];
            g_selOrder.sl=0.0;
            g_selOrder.tp=0.0;
            g_selOrder.openTime=g_hist_openTime[i];
            g_selOrder.closeTime=g_hist_closeTime[i];
            g_selOrder.expiration=0;
            g_selOrder.profit=g_hist_profit[i];
            g_selOrder.swap=g_hist_swap[i];
            g_selOrder.commission=g_hist_commission[i];
            g_selOrder.comment=g_hist_comment[i];
            g_selOrder.magic=g_hist_magic[i];
            return true;
         }
      }
      return false;
   }

   // SELECT_BY_POS
   if(pool==MODE_HISTORY)
   {
      MT4BuildHistoryCache();
      if(index_or_ticket<0 || index_or_ticket>=g_hist_count) return false;
      int i=(int)index_or_ticket; // da kiem tra nam trong [0, g_hist_count)
      g_selOrder.ticket=g_hist_ticket[i];
      g_selOrder.symbol=g_hist_symbol[i];
      g_selOrder.type=g_hist_type[i];
      g_selOrder.lots=g_hist_lots[i];
      g_selOrder.openPrice=g_hist_openPrice[i];
      g_selOrder.closePrice=g_hist_closePrice[i];
      g_selOrder.sl=0.0;
      g_selOrder.tp=0.0;
      g_selOrder.openTime=g_hist_openTime[i];
      g_selOrder.closeTime=g_hist_closeTime[i];
      g_selOrder.expiration=0;
      g_selOrder.profit=g_hist_profit[i];
      g_selOrder.swap=g_hist_swap[i];
      g_selOrder.commission=g_hist_commission[i];
      g_selOrder.comment=g_hist_comment[i];
      g_selOrder.magic=g_hist_magic[i];
      return true;
   }

   // pool==MODE_TRADES: vi the dang mo (index 0..PositionsTotal()-1) roi
   // toi lenh cho dang mo (index PositionsTotal()..total-1)
   int posTotal=PositionsTotal();
   if(index_or_ticket>=0 && index_or_ticket<posTotal)
   {
      int posIdx=(int)index_or_ticket; // da kiem tra nam trong [0, posTotal)
      ulong ticket=PositionGetTicket(posIdx);
      if(ticket==0) return false;
      g_selOrder.ticket=(long)ticket;
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
   long ordIdx64=index_or_ticket-posTotal;
   int ordTotal=::OrdersTotal();
   if(ordIdx64>=0 && ordIdx64<ordTotal)
   {
      int ordIdx=(int)ordIdx64; // da kiem tra nam trong [0, ordTotal)
      ulong ticket=::OrderGetTicket(ordIdx);
      if(ticket==0) return false;
      g_selOrder.ticket=(long)ticket;
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
   return false;
}

//====================================================================
// Cac ham lay thuoc tinh cua "lenh dang chon" kieu MQL4
//====================================================================
long   OrderTicket()      { return g_selOrder.ticket;      }
string OrderSymbol()      { return g_selOrder.symbol;      }
int    OrderType()        { return g_selOrder.type;        }
double OrderLots()        { return g_selOrder.lots;        }
double OrderOpenPrice()   { return g_selOrder.openPrice;   }
double OrderClosePrice()  { return g_selOrder.closePrice;  }
double OrderStopLoss()    { return g_selOrder.sl;          }
double OrderTakeProfit()  { return g_selOrder.tp;          }
datetime OrderOpenTime()  { return g_selOrder.openTime;    }
datetime OrderCloseTime() { return g_selOrder.closeTime;   }
datetime OrderExpiration(){ return g_selOrder.expiration;  }
double OrderProfit()      { return g_selOrder.profit;      }
double OrderSwap()        { return g_selOrder.swap;        }
double OrderCommission()  { return g_selOrder.commission;  }
string OrderComment()     { return g_selOrder.comment;     }
int    OrderMagicNumber() { return g_selOrder.magic;       }

#endif // __MQL4COMPAT_MQH__


  enum enum_TradeFrequency      {Extreme_cons_Frequency = 0,//extreme conservative
                   Conservative_Frequency = 1,//conservative
                   Moderate_Frequency = 2,//moderate
                   Intens_Frequency = 3,//Intense
                   Extreme_Frequency = 4,//Extreme (high risk!)
                   Auto_Frequency = 5,//Auto (based on balance and risk)
                   Manual_Strategy_Selection = 6//Manual strategy selection
                     };
  enum e_SlippageControlMode      {SCT_1 = 1,SCT_2 = 2  };
  enum FakeoutFilters      {Filter_Off = 0,//OFF
                   Filter_Low = 1,//Low
                   Filter_Medium = 2,//Medium
                   Filter_High = 3//High
                     };
  enum e_VirtualStopMode      {VSL_OFF = 1,VSL_BASIC = 2,VSL_ADV = 3  };
  enum Select_Entry_Strategy      {Strategy_ONE = 1,Strategy_TWO = 2  };
  enum e_TimeFrame_St_ONE      {ST1_M1 = 1,ST1_M5 = 5,ST1_M15 = 15,ST1_M30 = 30,ST1_H1 = 60,ST1_H4 = 240,ST1_Daily = 1440,ST1_Chart = 0  };
  enum e_TimeFrame_Entry_Timing      {Entry_T_Tick = 0,Entry_T_M1 = 1,Entry_T_M5 = 5,Entry_T_M15 = 15,Entry_T_M30 = 30,Entry_T_H1 = 60,Entry_T_H4 = 240  };
  enum e_UseOfCompound      {no_compound = 0,one_trade = 1,Multi_trades = 2  };
  enum e_MonitorTradesFilter      {MT_all = 0,MT_PairOfChart = 1  };
  enum e_TimeFrame_Exit_Timing      {ET_Tick = 0,ET_M1 = 1,ET_M5 = 5,ET_M15 = 15,ET_M30 = 30,ET_H1 = 60  };
  enum e_Exit_HL_trailingSL_timeframe      {HLT_Chart = 0,HLT_M1 = 1,HLT_M5 = 5,HLT_M15 = 15,HLT_M30 = 30,HLT_H1 = 60,HLT_H4 = 240,HLT_D1 = 1440  };
  enum ST1_e_MagicTrail_Mode      {ST1_MT_M_O = 0,ST1_MT_M_F = 1,ST1_MT_M_B = 2  };
  enum e_Risk      {Manual_Lotsize = 0,//use StartLots
                   MaxHistoricalDD = 1234,//Max Allowed Total Drawdown
                   MaxRiskStrat = 3//Max Risk Per Strategy
                     };
  enum Performance_options      {NormalizedProfit = 2,RealProfit = 1  };
  enum RankingOptions      {ranking_profit = 1,ranking_pertrade = 2  };
  enum Reduction_choices      {Red_10 = 10,Red_20 = 20,Red_30 = 30,Red_40 = 40,Red_50 = 50,Red_60 = 60,Red_70 = 70,Red_80 = 80,Red_90 = 90  };
  enum e_factortype      {factor_type_1 = 1,factor_type_2 = 2,factor_type_3 = 3  };
  enum e_TimeSource      {TZ_GMT = 0,TZ_PC = 1,TZ_Broker = 2  };


//------------------
input string lijntje="=============================================================="  ;   //- - -
input bool UseVariableValues=true  ;   
input bool AdjustLotsizeToVariableValues=true  ;   
input bool ShowInfoPanel=true  ;   
input bool UpdateInfoTesting=false ;    //update infopanel during testing
input double InfoPanelSizeAdjust=1  ;    //Adjustment for Infopanel size
input int   SetFontSize=0  ;
input string spreadfilter="------------------------------ Settings ------------------------------"  ;   //- - -
input bool AllowBuyTrades=true  ;    //Allow Buy Trades
input bool AllowSellTrades=true  ;    //Allow Sell Trades
input  enum_TradeFrequency  TradeFrequency=5  ;   
input double MaxSpread=500  ;    //Maximum allowed spread
input bool UseHL_TrailingSL=true  ;   
input int   FridayStopHour=25  ;    //Friday stop hour (brokertime; close all trades)
input bool FridayClosePending=true  ;
input bool FridayCloseOpen=true  ;
input bool setSL_TP_After_Entry=false ;   
input bool Virtual_expiration=false  ;    //Use Virtual Expiration
input double Randomization=0  ;    //Randomization (entries and exit) in pips
input  FakeoutFilters  FakeOutFilter=2  ;    //Fake Breakout Filter
input int   ST1_MagicNumber=8000  ;    //BaseMagicnumber
input string ST1_Comment="The Gold Reaper"  ;   //Comment for trades
input bool RemoveCommentSuffix=false ;   
input string NFP_FILTER="----------------------- NFP Filter -----------------------"  ;  
input bool EnableNFP_Filter=true  ;
input bool UseMQL5Calendar=true  ;
input bool AutoGMT=true  ;
input int   Broker_GMT_OFFSET_Winter=2  ;    //GMT_OFFSET_Winter (AutoGMT=false or backtesting)
input int   Broker_GMT_OFFSET_Summer=3  ;    //MT_OFFSET_Summer (AutoGMT=false or backtesting)
input bool NFP_CloseOpenTrades=true  ;   
input bool NFP_ClosePendingOrders=true  ;   
input int   NFP_MinutesBefore=100  ;   
input int   NFP_MinutesAfter=60  ;   
input string propfirmsettings="----------------------- Propfirm unique trades settings -----------------------"  ;   //- - -
input double AdjustEntry=0  ;   
input double AdjustSL=0  ;   
input double AdjustTP=0  ;   
input double AdjustTrailSL=0  ;   
input double AdjustTrailTP=0  ;   
input double AdjustBreakEven=0  ;   
input string LotSizeSettings="----------------------- LotSize Settings -----------------------"  ;   //- - -
input double ManualBalance=0  ;    //manually set balance to use (if > 0)
input  e_Risk  Risk=1234  ;    //Lotsize Calculation method
input double StartLots=0.01  ;   
double g_startLots_rw=0.0;
input double MaxAllowedDD=30  ;    //Max Allowed TOTAL Drawdown
input bool UseWeightedLots=true  ;    //Weighted Lotsize
input double MaxRiskPerStrategy_=1  ;    //Max Risk Per Strat
input double PropFirmMaxDailyDD=0  ;    //Set Max DAILY Drawdown (Prop Firms)
input bool OnlyUp=true  ;   
input bool ResetHighestBalance=false ;
input bool CheckMargin=true  ;    //check for free margin before setting trades
input bool UseEquity=false ;    //Use Equity Instead of Balance
input string ManualStratSelect="------------------------- Manual Strategy Selection -------------------------"  ;   //- - -
input string ManStratWarn="!! DO NOT RUN MANUAL STRATEGIES WHILE USING 'MAX ALLOWED TOTAL DD' OPTION !! "  ;   //- - -
input bool RunStrat1=true  ;    //Run Strategy 1 (low risk)
input bool RunStrat2=true  ;    //Run Strategy 2 (low risk)
input bool RunStrat3=true  ;    //Run Strategy 3 (low risk)
input bool RunStrat4=true  ;    //Run Strategy 4 (med risk)
input bool RunStrat5=true  ;    //Run Strategy 5 (med risk)
input bool RunStrat6=true  ;    //Run Strategy 6 (med risk)
input bool RunStrat7=true  ;    //Run Strategy 7 (med risk)
input bool RunStrat8=true  ;    //Run Strategy 8 (high risk)
input bool RunStrat9=true  ;    //Run Strategy 9 (high risk)
  double    currentSpreadPrice = 0.0;
  double    legacyGlobalDouble002 = 0.0;
  int       legacyGlobalInt003 = 30;
  int       legacyGlobalInt004 = 1440;
  int       legacyGlobalInt005 = 0;
  double    legacyGlobalDouble006Array[];
  double    legacyGlobalDouble007 = 0.0;
  double    variableValueScaleFactor = 0.0;
  double    variableLotInverseScaleFactor = 0.0;
  bool      legacyGlobalBool010 = false;
  int       legacyGlobalInt011 = 3;
  int       legacyGlobalInt012 = 2;
  bool      legacyGlobalBool013 = false;
  bool      legacyGlobalBool014 = false;
  int       legacyGlobalInt015 = 0;
  string    legacyGlobalString016 = "------------------------------ trading filters ------------------------------";
  bool      oneChartSetupEnabled = false;
  string    legacyGlobalString018 = "EURUSD;GBPUSD;USDJPY;AUDJPY;AUDUSD;EURAUD;EURCAD;EURGBP;EURJPY;GBPJPY;USDCAD;USDCHF;";
  int       activeTradeFrequency = 5;
  bool      legacyGlobalBool020 = true;
  bool      legacyGlobalBool021 = false;
  bool      legacyGlobalBool022 = false;
  bool      legacyGlobalBool023 = true;
  bool      legacyGlobalBool024 = false;
  bool      legacyGlobalBool025 = false;
  bool      legacyGlobalBool026 = true;
  bool      legacyGlobalBool027 = false;
  bool      legacyGlobalBool028 = false;
  bool      legacyGlobalBool029 = false;
  bool      legacyGlobalBool030 = false;
  bool      legacyGlobalBool031 = false;
  bool      legacyGlobalBool032 = false;
  bool      legacyGlobalBool033 = false;
  bool      legacyGlobalBool034 = false;
  bool      suspendPendingOrdersOnHighSpread = true;
  int       legacyGlobalInt036 = 2;
  double    maxSpreadPips = 0.0;
  double    orderSlippageSetting = 5000.0;
  int       legacyGlobalInt039 = 1;
  double    slippageRecoveryTriggerPips = 400.0;
  double    slippageRecoveryTrailDistancePips = 100.0;
  double    slippageRecoveryMaximumStopPips = 300.0;
  bool      useRequestedEntryAsTrailReference = true;
  string    legacyGlobalString044 = "------------------------------ time filters ------------------------------";
  bool      fridayStopEnabled = false;
  bool      restorePendingOrdersAfterFridayPause = false;
  bool      legacyGlobalBool047 = false;
  int       legacyGlobalInt048 = 14;
  int       legacyGlobalInt049 = 17;
  string    legacyGlobalString050 = "------------------------------ other filters ------------------------------";
  int       legacyGlobalInt051 = 1;
  int       legacyGlobalInt052 = 1;
  bool      candleExitM1Enabled = false;
  int       legacyGlobalInt054 = 5;
  bool      candleExitM5Enabled = false;
  int       legacyGlobalInt056 = 15;
  bool      candleExitM15Enabled = false;
  int       legacyGlobalInt058 = 30;
  bool      candleExitM30Enabled = false;
  int       legacyGlobalInt060 = 60;
  bool      candleExitH1Enabled = false;
  bool      showTradeDebugComments = false;
  int       legacyGlobalInt063 = 1;
  double    legacyGlobalDouble064 = 0.0;
  int       legacyGlobalInt065 = 99;
  int       legacyGlobalInt066 = 5;
  bool      virtualPendingOrdersEnabled = false;
  int       legacyGlobalInt068 = 5;
  int       entryStrategyMode = 1;
  string    legacyGlobalString070 = "------------------------------ Trade Entry management ------------------------------";
  int       entryTimeframeMinutes = 0;
  int       legacyGlobalInt072 = 60;
  int       legacyGlobalInt073 = 10;
  int       legacyGlobalInt074 = 3;
  bool      fakeoutConfirmationEnabled = false;
  bool      legacyGlobalBool076 = false;
  int       legacyGlobalInt077 = 120;
  int       legacyGlobalInt078 = 0;
  int       legacyGlobalInt079 = 0;
  double    legacyGlobalDouble080 = 30.0;
  double    minimumEntryDistancePercent = 0.0;
  double    legacyGlobalDouble082 = 25.0;
  double    buyPendingEntryOffsetPips = 0.5;
  double    sellPendingEntryOffsetPips = 0.0;
  double    requestedEntryAdjustmentPips = 0.0;
  int       maxPendingOrders = 1;
  int       maxOpenTradesPerSide = 99;
  double    duplicatePendingTolerancePips = 1.0;
  int       pendingExpirationEnabledValue = 24;
  double    legacyGlobalDouble090 = 3.0;
  int       legacyGlobalInt091 = 0;
  int       lotSizePercentMultiplier = 100;
  int       strategyMagicNumber = 0;
  string    legacyGlobalString094 = "------------------------------ Strategy 2 - Manual Trade settings ------------------------------";
  int       legacyGlobalInt095 = 1;
  int       secondaryStrategyMagicNumber = 1991199118;
  string    legacyGlobalString097 = "";
  string    legacyGlobalString098 = "------------------------------ Trade Exit management ------------------------------";
  int       legacyGlobalInt099 = 0;
  double    stopLossPips = 20.0;
  double    takeProfitPips = 100.0;
  string    legacyGlobalString102 = "------------------------------ Trailing SL settings ------------------------------";
  double    legacyGlobalDouble103 = 10.0;
  double    legacyGlobalDouble104 = 10.0;
  double    legacyGlobalDouble105 = 100.0;
  double    trailingActivationBufferPips = 0.1;
  double    trailingPartialClosePercent = 0.0;
  double    legacyGlobalDouble108 = 0.0;
  double    legacyGlobalDouble109 = 0.0;
  double    legacyGlobalDouble110 = 0.0;
  double    legacyGlobalDouble111 = 0.0;
  string    legacyGlobalString112 = "------------------------------ Break-even SL management ------------------------------";
  double    legacyGlobalDouble113 = 0.0;
  double    legacyGlobalDouble114 = 0.0;
  string    legacyGlobalString115 = "------------------------------ HIGH/LOW Trailing SL settings ------------------------------";
  bool      legacyGlobalBool116 = false;
  int       legacyGlobalInt117 = 0;
  int       legacyGlobalInt118 = 0;
  int       legacyGlobalInt119 = 0;
  int       legacyGlobalInt120 = 0;
  int       legacyGlobalInt121 = 0;
  int       legacyGlobalInt122 = 0;
  double    legacyGlobalDouble123 = 2.0;
  string    legacyGlobalString124 = "------------------------------ recovery Trailing SL based on time ------------------------------";
  double    legacyGlobalDouble125 = 0.0;
  double    legacyGlobalDouble126 = 0.0;
  string    legacyGlobalString127 = "------------------------------ MagicTrail SL settings ------------------------------";
  int       legacyGlobalInt128 = 0;
  double    magicTrailActivationDistancePips = 0.1;
  int       legacyGlobalInt130 = 1;
  double    magicTrailStepPips = 0.1;
  double    magicTrailMode2SpreadBufferPips = 1.0;
  int       legacyGlobalInt133 = 0;
  double    magicTrailDelayedActivationPips = 0.0;
  bool      returnAfterStopModification = false;
  bool      legacyGlobalBool136 = false;
  int       legacyGlobalInt137 = 2024;
