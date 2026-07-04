# SessionStart hook: inject recent memory-layer entries into session context (stdout becomes context).
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$root = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$sections = @(
    @{ Title = "Recent decisions (memory/decision_log.md)";                Path = Join-Path $root "memory\decision_log.md";      Tail = 25 },
    @{ Title = "Recent bugs (memory/bug_log.md)";                          Path = Join-Path $root "memory\bug_log.md";           Tail = 20 },
    @{ Title = "Recent architecture decisions (memory/architecture_log.md)"; Path = Join-Path $root "memory\architecture_log.md"; Tail = 20 }
)

Write-Output "## AI OS memory layer (auto-injected at session start)"
foreach ($s in $sections) {
    if (Test-Path -LiteralPath $s.Path) {
        Write-Output ""
        Write-Output ("### " + $s.Title)
        Get-Content -LiteralPath $s.Path -Tail $s.Tail -Encoding UTF8
    }
}
exit 0
