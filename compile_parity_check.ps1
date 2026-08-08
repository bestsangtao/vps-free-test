param(
    [Parameter(Mandatory=$true)]
    [string]$MetaEditorPath
)

$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $Root

if (-not (Test-Path $MetaEditorPath)) {
    throw "MetaEditor not found: $MetaEditorPath"
}

python .\reconstruct_source.py
python .\deobfuscate_source.py
python .\verify_logic_equivalence.py

$Original = Join-Path $Root 'The Gold Reaper OderSend v4.5_MarketClose_SessionFix.mq5'
$Deobf    = Join-Path $Root 'The Gold Reaper OderSend v4.5_MarketClose_SessionFix_Deobfuscated.mq5'

$Work = Join-Path $env:TEMP 'GoldReaperParity'
$OrigDir = Join-Path $Work 'original'
$DeobfDir = Join-Path $Work 'deobfuscated'
Remove-Item $Work -Recurse -Force -ErrorAction SilentlyContinue
New-Item $OrigDir -ItemType Directory -Force | Out-Null
New-Item $DeobfDir -ItemType Directory -Force | Out-Null

# Same basename minimizes filename-related compile metadata differences.
$CommonName = 'GoldReaperParity.mq5'
$OrigCompile = Join-Path $OrigDir $CommonName
$DeobfCompile = Join-Path $DeobfDir $CommonName
Copy-Item $Original $OrigCompile
Copy-Item $Deobf $DeobfCompile

$OrigLog = Join-Path $OrigDir 'compile.log'
$DeobfLog = Join-Path $DeobfDir 'compile.log'

& $MetaEditorPath "/compile:$OrigCompile" "/log:$OrigLog"
& $MetaEditorPath "/compile:$DeobfCompile" "/log:$DeobfLog"

$OrigEx5 = [IO.Path]::ChangeExtension($OrigCompile, '.ex5')
$DeobfEx5 = [IO.Path]::ChangeExtension($DeobfCompile, '.ex5')

if (-not (Test-Path $OrigEx5)) { throw "Original compile did not create EX5. See $OrigLog" }
if (-not (Test-Path $DeobfEx5)) { throw "Deobfuscated compile did not create EX5. See $DeobfLog" }

$OrigHash = (Get-FileHash $OrigEx5 -Algorithm SHA256).Hash
$DeobfHash = (Get-FileHash $DeobfEx5 -Algorithm SHA256).Hash

Write-Host "Original EX5:     $OrigEx5"
Write-Host "Deobfuscated EX5: $DeobfEx5"
Write-Host "Original SHA256:  $OrigHash"
Write-Host "Deobf SHA256:     $DeobfHash"
Write-Host ""

if ($OrigHash -eq $DeobfHash) {
    Write-Host 'EX5 BYTE PARITY: PASS (identical binaries)'
} else {
    Write-Host 'EX5 BYTE PARITY: DIFFERENT'
    Write-Host 'This alone is NOT a logic failure. Internal identifier/symbol/build metadata may change binary bytes.'
    Write-Host 'Use identical Strategy Tester inputs/data and compare deals/orders for runtime parity.'
}

Write-Host "Original compile log:     $OrigLog"
Write-Host "Deobfuscated compile log: $DeobfLog"
