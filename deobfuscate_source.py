from pathlib import Path
import re, runpy, hashlib

SOURCE = Path("The Gold Reaper OderSend v4.5_MarketClose_SessionFix.mq5")
OUTPUT = Path("The Gold Reaper OderSend v4.5_MarketClose_SessionFix_Deobfuscated.mq5")

if not SOURCE.exists():
    runpy.run_path("reconstruct_source.py", run_name="__main__")

FUNCTION_MAP = {'lizong_6': 'LoadStrategyRuntimeContext', 'lizong_7': 'RunStrategyCycle', 'lizong_8': 'RestoreStoredPendingOrders', 'lizong_9': 'SuspendPendingOrdersOnHighSpread', 'lizong_10': 'CalculateStrategyLotSize', 'lizong_11': 'CalculateBuyEntryPrice', 'lizong_12': 'CalculateSellEntryPrice', 'lizong_13': 'FindConfirmedSwingHigh', 'lizong_14': 'FindConfirmedSwingLow', 'lizong_15': 'ManagePendingEntryOrders', 'lizong_16': 'PlaceBuyStopEntry', 'lizong_17': 'PlaceSellStopEntry', 'lizong_18': 'ManageBuyTrades', 'lizong_19': 'ManageSellTrades', 'lizong_20': 'IsTradingSessionOpen', 'lizong_21': 'TradeErrorDescription', 'lizong_22': 'ResizePendingOrderLots', 'lizong_24': 'CreateInfoPanel', 'lizong_25': 'CreatePanelCell', 'lizong_26': 'DeleteInfoPanel', 'lizong_27': 'UpdateInfoPanelSummary', 'lizong_28': 'UpdateInfoPanelStrategyRows', 'lizong_29': 'UpdateInfoPanelTotals', 'lizong_30': 'CountWinningClosedTrades', 'lizong_31': 'CountLosingClosedTrades', 'lizong_32': 'CalculateStrategyPerformance', 'lizong_33': 'RankStrategiesByTotalProfit', 'lizong_34': 'RankStrategiesByAverageProfit', 'lizong_35': 'ConvertUsdToAccountCurrency', 'lizong_36': 'ConvertAccountCurrencyToUsdRounded', 'lizong_37': 'LoadStrategy1Profile', 'lizong_38': 'LoadStrategy2Profile', 'lizong_39': 'LoadStrategy3Profile', 'lizong_40': 'LoadStrategy4Profile', 'lizong_41': 'LoadStrategy5Profile', 'lizong_42': 'LoadStrategy6Profile', 'lizong_43': 'LoadStrategy7Profile', 'lizong_44': 'LoadStrategy8Profile', 'lizong_45': 'LoadStrategy9Profile', 'lizong_46': 'EnforcePropFirmDailyDrawdown', 'lizong_47': 'FetchUtcOffsetHours', 'lizong_48': 'IsAmericanDaylightSavingTime'}
SEMANTIC_GLOBALS = {'总_1_do_0': 'currentSpreadPrice', '总_8_do_58': 'variableValueScaleFactor', '总_9_do_60': 'variableLotInverseScaleFactor', '总_17_bo_8C': 'oneChartSetupEnabled', '总_19_in_9C': 'activeTradeFrequency', '总_35_bo_AF': 'suspendPendingOrdersOnHighSpread', '总_37_do_B8': 'maxSpreadPips', '总_38_do_C0': 'orderSlippageSetting', '总_40_do_D0': 'slippageRecoveryTriggerPips', '总_41_do_D8': 'slippageRecoveryTrailDistancePips', '总_42_do_E0': 'slippageRecoveryMaximumStopPips', '总_43_bo_E8': 'useRequestedEntryAsTrailReference', '总_45_bo_FC': 'fridayStopEnabled', '总_46_bo_FD': 'restorePendingOrdersAfterFridayPause', '总_53_bo_11C': 'candleExitM1Enabled', '总_55_bo_124': 'candleExitM5Enabled', '总_57_bo_12C': 'candleExitM15Enabled', '总_59_bo_134': 'candleExitM30Enabled', '总_61_bo_13C': 'candleExitH1Enabled', '总_62_bo_13D': 'showTradeDebugComments', '总_67_bo_158': 'virtualPendingOrdersEnabled', '总_69_in_160': 'entryStrategyMode', '总_71_in_174': 'entryTimeframeMinutes', '总_75_bo_184': 'fakeoutConfirmationEnabled', '总_81_do_1A0': 'minimumEntryDistancePercent', '总_83_do_1B0': 'buyPendingEntryOffsetPips', '总_84_do_1B8': 'sellPendingEntryOffsetPips', '总_85_do_1C0': 'requestedEntryAdjustmentPips', '总_86_in_1C8': 'maxPendingOrders', '总_87_in_1CC': 'maxOpenTradesPerSide', '总_88_do_1D0': 'duplicatePendingTolerancePips', '总_89_in_1D8': 'pendingExpirationEnabledValue', '总_92_in_1EC': 'lotSizePercentMultiplier', '总_93_in_1F0': 'strategyMagicNumber', '总_96_in_208': 'secondaryStrategyMagicNumber', '总_100_do_230': 'stopLossPips', '总_101_do_238': 'takeProfitPips', '总_106_do_268': 'trailingActivationBufferPips', '总_107_do_270': 'trailingPartialClosePercent', '总_129_do_318': 'magicTrailActivationDistancePips', '总_131_do_328': 'magicTrailStepPips', '总_132_do_330': 'magicTrailMode2SpreadBufferPips', '总_134_do_340': 'magicTrailDelayedActivationPips', '总_135_bo_348': 'returnAfterStopModification', '总_141_do_3F8': 'maxCalculatedLotSize', '总_145_in_40C': 'lotSizingBalanceDivisor', '总_146_do_410': 'weightedRiskPercentPerStrategy', '总_148_do_420': 'fixedRiskPercent', '总_160_do_468': 'zoneRecoveryInitialDistancePips', '总_161_do_470': 'zoneRecoveryStepDistancePips', '总_162_do_478': 'zoneRecoveryMinimumDistancePips', '总_163_do_480': 'zoneRecoveryProfitTarget', '总_165_do_490': 'zoneRecoveryLotMultiplier', '总_171_bo_4BC': 'tradingHoursEnabled', '总_173_bo_4C4': 'storePendingOrdersOutsideTradingHours', '总_188_do_508': 'cachedBuySignalPrice', '总_189_do_510': 'cachedSellSignalPrice', '总_190_in_518': 'symbolDigits', '总_191_do_520': 'activeVirtualStopPrice', '总_194_bo_530': 'buyZoneStateInitialized', '总_195_bo_531': 'sellZoneStateInitialized', '总_196_do_568_si20si2': 'virtualStopByTicket', '总_197_do_6DC_si100si3': 'storedPendingOrders', '总_198_do_1070_si100si2': 'pendingTicketPriceMap', '总_200_in_16B4': 'orderBufferCapacity', '总_213_bo_1710': 'movingAverageTrendFilterEnabled', '总_218_bo_1A74': 'allowMultipleOpenTradesPerSide', '总_221_do_1A80': 'stopLevelPriceDistance', '总_223_do_1AC4_si99': 'lotSizeByStrategy', '总_229_do_1E00': 'pipSize', '总_230_lo_1E08': 'lastTradeTicket', '总_234_in_1E20': 'pendingExpirationSeconds', '总_256_bo_2564': 'marketPauseMessageLogged', '总_261_do_2578': 'sellEntryPrice', '总_262_do_2580': 'buyEntryPrice', '总_268_do_25A8': 'fastMovingAverageValue', '总_269_do_25B0': 'slowMovingAverageValue', '总_303_bo_2878': 'tradingHoursState', '总_305_bo_2880': 'fridayTradingSuspended', '总_309_do_2898': 'freezeLevelPriceDistance', '总_310_do_28A0': 'lastBuyPendingBasePrice', '总_311_do_28A8': 'lastSellPendingBasePrice', '总_312_bo_28B0': 'demoAccountDetectedFlag', '总_319_da_28E0': 'lastVirtualStopSyncTime', '总_320_bo_28E8': 'nfpTradingSuspended', '总_328_in_3100': 'currentStrategyIndex', '总_329_ui_3104': 'panelTextColor', '总_334_st_3120': 'currentStrategyComment', '总_336_st_3130': 'currentSymbol', '总_337_do_3140': 'symbolPoint', '总_340_in_3310': 'panelStrategyRowStartIndex', '总_343_in_372C_si99': 'totalTradeCountByStrategy', '总_345_do_3AAC_si99': 'averageProfitByStrategy', '总_349_do_46B4_si99': 'totalProfitByStrategy', '总_354_do_5730_si99': 'strategyLotWeights', '总_356_in_5B14_si99': 'strategyRanks', '总_362_do_5CC8': 'panelRowHeight', '总_372_in_5CFC': 'panelFontSize', '总_376_do_5D70': 'panelWidthScaleFactor', '总_377_do_5D78': 'panelHeightScaleFactor', '总_378_in_5D80': 'strategySymbolCount', '总_379_da_5D88': 'lastPanelRefreshM5BarTime', '总_382_bo_5D98': 'dailyDrawdownLockActive', '总_385_in_5DA8': 'autoFrequencyThreshold1', '总_386_in_5DAC': 'autoFrequencyThreshold2', '总_387_in_5DB0': 'autoFrequencyThreshold3', '总_388_in_5DB4': 'autoFrequencyThreshold4', '总_389_in_5DB8': 'autoFrequencyThreshold5', '总_391_da_5DFC_si300': 'nfpDatesGmt', '总_392_bo_675C': 'usDaylightSavingState', '总_393_bo_675D': 'europeDaylightSavingState', '总_394_bo_675E': 'gmtDetectionInitialized', '总_399_da_6778': 'lastPerformanceRefreshH1BarTime', '总_400_do_67B4_si99': 'strategyDisplayProfit', '总_401_do_6AD0': 'currentBalanceBasis', '总_402_do_6AD8': 'highestBalanceBasis'}
TYPE_MAP = {'do': 'Double', 'in': 'Int', 'bo': 'Bool', 'st': 'String', 'da': 'Datetime', 'lo': 'Long', 'ui': 'Uint', 'ch': 'Char'}

def array_suffix(name):
    dims = re.findall(r"_si(\d+)", name)
    if dims:
        return "Array" + "x".join(dims)
    if name.endswith("_ko") or "_ko_" in name:
        return "Array"
    return ""

def generic_name(tok):
    m = re.match(r"^总_(\d+)_(do|in|bo|st|da|lo|ui|ch)(?:_[0-9A-Fa-f]+)?(?:_si\d+)*(?:_ko)?$", tok)
    if m:
        num, typ = m.groups()
        return f"legacyGlobal{TYPE_MAP[typ]}{int(num):03d}{array_suffix(tok)}"
    m = re.match(r"^子_(\d+)_(do|in|bo|st|da|lo|ui|ch)(?:_si\d+)*(?:_ko)?$", tok)
    if m:
        num, typ = m.groups()
        return f"local{TYPE_MAP[typ]}{int(num):02d}{array_suffix(tok)}"
    m = re.match(r"^木_(\d+)_(do|in|bo|st|da|lo|ui|ch)(?:_si\d+)*(?:_ko)?$", tok)
    if m:
        num, typ = m.groups()
        return f"arg{TYPE_MAP[typ]}{int(num):02d}{array_suffix(tok)}"
    m = re.match(r"^临_(do|in|bo|st|da|lo|ui|ch)_(\d+)(?:_si\d+)*(?:_ko)?$", tok)
    if m:
        typ, num = m.groups()
        return f"tmp{TYPE_MAP[typ]}{int(num):02d}{array_suffix(tok)}"
    if tok.startswith("临_"): return "legacyTemp_" + tok[2:]
    if tok.startswith("总_"): return "legacyGlobal_" + tok[2:]
    if tok.startswith("子_"): return "legacyLocal_" + tok[2:]
    if tok.startswith("木_"): return "legacyArg_" + tok[2:]
    return tok

def ident_start(c):
    return c == "_" or c.isalpha() or ord(c) >= 128

def ident_cont(c):
    return c == "_" or c.isalnum() or ord(c) >= 128

def identifiers(s):
    out=[]; i=0; n=len(s); state="code"
    while i<n:
        c=s[i]
        if state=="code":
            if c=="/" and i+1<n and s[i+1]=="/": state="line"; i+=2; continue
            if c=="/" and i+1<n and s[i+1]=="*": state="block"; i+=2; continue
            if c=='"': state="string"; i+=1; continue
            if c=="'": state="squote"; i+=1; continue
            if ident_start(c):
                j=i+1
                while j<n and ident_cont(s[j]): j+=1
                out.append(s[i:j]); i=j; continue
            i+=1
        elif state=="line":
            if c=="\n": state="code"
            i+=1
        elif state=="block":
            if c=="*" and i+1<n and s[i+1]=="/": state="code"; i+=2
            else: i+=1
        else:
            quote = '"' if state=="string" else "'"
            if c=="\\": i+=2
            elif c==quote: state="code"; i+=1
            else: i+=1
    return out

def rewrite(s, mp):
    out=[]; i=0; n=len(s); state="code"
    while i<n:
        c=s[i]
        if state=="code":
            if c=="/" and i+1<n and s[i+1]=="/": out.append("//"); state="line"; i+=2; continue
            if c=="/" and i+1<n and s[i+1]=="*": out.append("/*"); state="block"; i+=2; continue
            if c=='"': out.append(c); state="string"; i+=1; continue
            if c=="'": out.append(c); state="squote"; i+=1; continue
            if ident_start(c):
                j=i+1
                while j<n and ident_cont(s[j]): j+=1
                tok=s[i:j]; out.append(mp.get(tok,tok)); i=j; continue
            out.append(c); i+=1
        elif state=="line":
            out.append(c)
            if c=="\n": state="code"
            i+=1
        elif state=="block":
            if c=="*" and i+1<n and s[i+1]=="/": out.append("*/"); state="code"; i+=2
            else: out.append(c); i+=1
        else:
            quote = '"' if state=="string" else "'"
            out.append(c)
            if c=="\\" and i+1<n: out.append(s[i+1]); i+=2
            elif c==quote: state="code"; i+=1
            else: i+=1
    return "".join(out)

raw = SOURCE.read_bytes()
bom = raw.startswith(b"\xef\xbb\xbf")
text = raw.decode("utf-8-sig")
targets = sorted({t for t in identifiers(text) if t.startswith(("总_","子_","木_","临_","lizong_"))})
mapping = {}
for tok in targets:
    mapping[tok] = FUNCTION_MAP.get(tok, SEMANTIC_GLOBALS.get(tok, generic_name(tok)))

if len(set(mapping.values())) != len(mapping):
    raise SystemExit("Target identifier collision detected")
existing = set(identifiers(text)) - set(mapping)
bad = [(a,b) for a,b in mapping.items() if b in existing]
if bad:
    raise SystemExit(f"Collision with existing identifiers: {bad[:10]}")

result = rewrite(text, mapping)
reverse = {v:k for k,v in mapping.items()}
if rewrite(result, reverse) != text:
    raise SystemExit("Reverse-rename verification failed")
residual = [t for t in identifiers(result) if t.startswith(("总_","子_","木_","临_","lizong_"))]
if residual:
    raise SystemExit(f"Residual obfuscated executable identifiers: {residual[:20]}")

out_bytes = (b"\xef\xbb\xbf" if bom else b"") + result.encode("utf-8")
OUTPUT.write_bytes(out_bytes)
print(f"Created: {OUTPUT}")
print(f"Identifiers renamed: {len(mapping)}")
print(f"SHA-256: {hashlib.sha256(out_bytes).hexdigest()}")
print("Reverse-rename: PASS")
