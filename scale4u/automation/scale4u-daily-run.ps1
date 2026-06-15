# Scale4U Daily Automation
# ========================
# Runs: collect CSV → scan portfolio → upload dashboard to GitHub
# Usage: .\scale4u-daily-run.ps1 [-CsvPath "path.csv"] [-ScanOnly] [-DryRun]
# ========================

param(
    [string]$CsvPath,
    [switch]$ScanOnly,
    [switch]$DryRun
)

$Config = @{
    Scale4uPath = "C:\Users\06596870\Desktop\claude\תשתית למפעל\Scale4U\scale4u"
    GitHubToken = $env:GITHUB_TOKEN  # Set via: $env:GITHUB_TOKEN = "your-token"
    GitHubRepo  = "AVI1840/Scale4U"
    DashboardSource = "C:\Users\06596870\Desktop\claude\תשתית למפעל\Scale4U\scale4u\assets\portfolio\dashboard-portfolio.html"
    ClaudeCli   = "claude"
}

if (-not $Config.GitHubToken) {
    LogErr "GITHUB_TOKEN not set. Run: `$env:GITHUB_TOKEN = 'ghp_...'"
    exit 1
}

function Log($msg) { Write-Host "[$(Get-Date -Format 'HH:mm:ss')] $msg" -ForegroundColor Cyan }
function LogOk($msg) { Write-Host "[$(Get-Date -Format 'HH:mm:ss')] OK: $msg" -ForegroundColor Green }
function LogErr($msg) { Write-Host "[$(Get-Date -Format 'HH:mm:ss')] ERROR: $msg" -ForegroundColor Red }

# Step 1: Collect (if CSV provided)
if ($CsvPath -and -not $ScanOnly) {
    if (-not (Test-Path $CsvPath)) { LogErr "CSV not found: $CsvPath"; exit 1 }
    Log "Collecting from CSV: $CsvPath"

    if (-not $DryRun) {
        Push-Location $Config.Scale4uPath
        $collectPrompt = "/s4u-collect`nPath: $CsvPath"
        & $Config.ClaudeCli --print $collectPrompt 2>&1 | Tee-Object -Variable collectOutput
        Pop-Location
        LogOk "Collection complete"
    } else {
        Log "[DRY RUN] Would run /s4u-collect on $CsvPath"
    }
}

# Step 2: Scan portfolio
Log "Running /s4u-scan..."
if (-not $DryRun) {
    Push-Location $Config.Scale4uPath
    $scanPrompt = @"
/s4u-scan
Read all opportunities/*.yaml and produce:
1. Update assets/portfolio/dashboard-portfolio.html with current data
2. Output executive summary
"@
    & $Config.ClaudeCli --print $scanPrompt 2>&1 | Tee-Object -Variable scanOutput
    Pop-Location
    LogOk "Scan complete"
} else {
    Log "[DRY RUN] Would run /s4u-scan"
}

# Step 3: Upload dashboard to GitHub
Log "Uploading dashboard to GitHub..."
if (-not $DryRun) {
    $dashPath = $Config.DashboardSource
    if (Test-Path $dashPath) {
        $contentBytes = [System.IO.File]::ReadAllBytes($dashPath)
        $contentBase64 = [Convert]::ToBase64String($contentBytes)

        # Get current SHA
        $headers = @{ Authorization = "token $($Config.GitHubToken)" }
        try {
            $existing = Invoke-RestMethod -Uri "https://api.github.com/repos/$($Config.GitHubRepo)/contents/dashboard.html" -Headers $headers -Method Get
            $sha = $existing.sha
        } catch { $sha = $null }

        # Upload
        $body = @{
            message = "Auto-update dashboard - $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
            content = $contentBase64
        }
        if ($sha) { $body.sha = $sha }

        $bodyJson = $body | ConvertTo-Json
        try {
            Invoke-RestMethod -Uri "https://api.github.com/repos/$($Config.GitHubRepo)/contents/dashboard.html" `
                -Headers $headers -Method Put -Body $bodyJson -ContentType "application/json"
            LogOk "Dashboard uploaded to GitHub"
        } catch {
            LogErr "Dashboard upload failed: $_"
        }

        # Trigger Pages rebuild
        try {
            Invoke-RestMethod -Uri "https://api.github.com/repos/$($Config.GitHubRepo)/pages/builds" `
                -Headers $headers -Method Post
            LogOk "Pages rebuild triggered"
        } catch {
            LogErr "Pages rebuild failed: $_"
        }
    } else {
        LogErr "Dashboard file not found: $dashPath"
    }
} else {
    Log "[DRY RUN] Would upload dashboard to GitHub"
}

Log "Done. Site: https://avi1840.github.io/Scale4U/"
