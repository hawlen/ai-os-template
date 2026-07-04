# AI OS install health check. Run from the project root:
#   powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
# Exit code = number of failed checks. [SKIP] lines are informational.

$fails = 0
function Check($name, $ok, [switch]$Skip) {
    if ($Skip) { Write-Host "[SKIP] $name" -ForegroundColor Yellow; return }
    if ($ok) { Write-Host "[PASS] $name" -ForegroundColor Green }
    else { Write-Host "[FAIL] $name" -ForegroundColor Red; $script:fails++ }
}

$root = Split-Path -Parent $PSScriptRoot

# --- structure -------------------------------------------------------------
Check "CLAUDE.md present" (Test-Path (Join-Path $root 'CLAUDE.md'))
Check "memory/system_map.md present (CLAUDE.md import target)" (Test-Path (Join-Path $root 'memory\system_map.md'))
foreach ($log in 'decision_log','bug_log','architecture_log') {
    Check "memory/$log.md present" (Test-Path (Join-Path $root "memory\$log.md"))
}
Check "architect agent present" (Test-Path (Join-Path $root '.claude\agents\architect.md'))
Check "executor agent present" (Test-Path (Join-Path $root '.claude\agents\executor.md'))

# --- settings ----------------------------------------------------------------
$settings = $null
try { $settings = Get-Content (Join-Path $root '.claude\settings.json') -Raw -ErrorAction Stop | ConvertFrom-Json } catch {}
Check ".claude/settings.json parses" ($null -ne $settings)
if ($settings) {
    Check "superpowers@claude-plugins-official enabled" ([bool]$settings.enabledPlugins.'superpowers@claude-plugins-official')
    Check "SessionStart hook configured" ($null -ne $settings.hooks.SessionStart)
}

# --- hook executes -----------------------------------------------------------
$hook = Join-Path $root 'scripts\hooks\session-start.ps1'
if (Test-Path $hook) {
    '{}' | powershell -NoProfile -ExecutionPolicy Bypass -File $hook | Out-Null
    Check "SessionStart hook pipe-test (exit 0)" ($LASTEXITCODE -eq 0)
} else {
    Check "SessionStart hook script present" $false
}

# --- git ---------------------------------------------------------------------
Check "git repository" (Test-Path (Join-Path $root '.git'))
$remote = ''
try { $remote = git -C $root remote get-url origin 2>$null } catch {}
Check "git remote 'origin' configured" (-not [string]::IsNullOrWhiteSpace("$remote"))

# --- machine layer (skipped when claude CLI is unavailable, e.g. CI) ---------
$claude = Get-Command claude -ErrorAction SilentlyContinue
if ($claude) {
    $plugins = ''
    try { $plugins = (& claude plugin list 2>$null | Out-String) } catch {}
    $count = ([regex]::Matches($plugins, 'superpowers@')).Count
    Check "exactly one superpowers plugin install (found $count)" ($count -eq 1)
} else {
    Check "claude CLI not found - plugin checks skipped" $true -Skip
}

Write-Host ""
if ($fails -eq 0) { Write-Host "AI OS install healthy - all checks passed." -ForegroundColor Green }
else { Write-Host "$fails check(s) FAILED." -ForegroundColor Red }
exit $fails
