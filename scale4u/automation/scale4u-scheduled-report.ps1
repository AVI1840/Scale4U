# Scale4U - Automated Biweekly Portfolio Report
# ================================================
# Runs /s4u-scan and emails the executive summary.
# Schedule: Windows Task Scheduler, every 2 weeks (Sunday 08:00).
#
# Setup:
#   1. Edit $Config below (email, paths)
#   2. Run once manually: .\scale4u-scheduled-report.ps1
#   3. Register: .\scale4u-scheduled-report.ps1 -Register
#   4. To unregister: Unregister-ScheduledTask -TaskName "Scale4U-BiweeklyReport"
# ================================================

param(
    [switch]$Register,
    [switch]$DryRun
)

# --- Configuration ---
$Config = @{
    # Email
    RecipientEmail  = "AVIADi@nioi.GOV.il"
    SenderEmail     = "scale4u-reports@nioi.GOV.il"
    SmtpServer      = "smtp.nioi.GOV.il"    # Change to your org SMTP relay
    SmtpPort        = 25
    EmailSubject    = "Scale4U - דוח פורטפוליו דו-שבועי"

    # Paths
    Scale4uPath     = "C:\Users\06596870\Desktop\claude\תשתית למפעל\Scale4U\scale4u"
    OutputDir       = "C:\Users\06596870\Desktop\claude\תשתית למפעל\Scale4U\scale4u\assets\portfolio"
    ClaudePath      = "claude"  # Assumes claude CLI is in PATH

    # Schedule
    TaskName        = "Scale4U-BiweeklyReport"
    TriggerDay      = "Sunday"
    TriggerTime     = "08:00"
    RepeatWeeks     = 2
}

# --- Register as Scheduled Task ---
if ($Register) {
    $Action = New-ScheduledTaskAction `
        -Execute "powershell.exe" `
        -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$PSScriptRoot\scale4u-scheduled-report.ps1`"" `
        -WorkingDirectory $Config.Scale4uPath

    $Trigger = New-ScheduledTaskTrigger `
        -Weekly `
        -WeeksInterval $Config.RepeatWeeks `
        -DaysOfWeek $Config.TriggerDay `
        -At $Config.TriggerTime

    $Settings = New-ScheduledTaskSettingsSet `
        -StartWhenAvailable `
        -DontStopOnIdleEnd `
        -AllowStartIfOnBatteries

    Register-ScheduledTask `
        -TaskName $Config.TaskName `
        -Action $Action `
        -Trigger $Trigger `
        -Settings $Settings `
        -Description "Scale4U biweekly portfolio report - runs /s4u-scan and emails results" `
        -Force

    Write-Host "[OK] Scheduled task '$($Config.TaskName)' registered." -ForegroundColor Green
    Write-Host "     Runs every $($Config.RepeatWeeks) weeks on $($Config.TriggerDay) at $($Config.TriggerTime)." -ForegroundColor Cyan
    exit 0
}

# --- Main Execution ---
$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm"
$logFile = Join-Path $Config.OutputDir "report-log-$timestamp.txt"

function Log($msg) {
    $entry = "[$(Get-Date -Format 'HH:mm:ss')] $msg"
    Write-Host $entry
    Add-Content -Path $logFile -Value $entry -Encoding UTF8
}

Log "Scale4U Scheduled Report - Starting"
Log "Working directory: $($Config.Scale4uPath)"

# Step 1: Run /s4u-scan via Claude CLI
Log "Running /s4u-scan..."

$scanPrompt = @"
/s4u-scan
Read all opportunities/*.yaml files and generate the three output files:
1. assets/portfolio/portfolio-analysis.md
2. assets/portfolio/portfolio-executive.md
3. assets/portfolio/presentation-portfolio.html
Output the executive summary to stdout as well.
"@

if ($DryRun) {
    Log "[DRY RUN] Would execute: claude --print with /s4u-scan prompt"
    $scanOutput = "DRY RUN - no actual scan performed"
} else {
    try {
        Push-Location $Config.Scale4uPath
        $scanOutput = & $Config.ClaudePath --print $scanPrompt 2>&1
        Pop-Location
        Log "Scan completed successfully"
    } catch {
        Log "ERROR: Scan failed - $_"
        Pop-Location
        exit 1
    }
}

# Step 2: Read executive summary
$executiveFile = Join-Path $Config.OutputDir "portfolio-executive.md"
if (Test-Path $executiveFile) {
    $executiveContent = Get-Content $executiveFile -Raw -Encoding UTF8
    Log "Executive summary loaded ($((Get-Content $executiveFile).Count) lines)"
} else {
    $executiveContent = $scanOutput
    Log "No executive file found, using scan output"
}

# Step 3: Build email body
$emailBody = @"
<html dir="rtl">
<head><meta charset="utf-8"><style>
body { font-family: Segoe UI, Tahoma, sans-serif; direction: rtl; padding: 20px; background: #f5f5f5; }
.container { max-width: 700px; margin: 0 auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
h1 { color: #1e293b; border-bottom: 2px solid #38bdf8; padding-bottom: 10px; }
h2 { color: #334155; margin-top: 20px; }
pre { background: #f8fafc; padding: 15px; border-radius: 6px; font-size: 13px; overflow-x: auto; white-space: pre-wrap; direction: rtl; }
.footer { margin-top: 30px; padding-top: 15px; border-top: 1px solid #e2e8f0; color: #64748b; font-size: 12px; }
.badge { display: inline-block; background: #38bdf8; color: white; padding: 3px 10px; border-radius: 12px; font-size: 11px; }
</style></head>
<body>
<div class="container">
<h1>Scale4U - דוח פורטפוליו דו-שבועי</h1>
<span class="badge">$(Get-Date -Format 'dd/MM/yyyy')</span>

<pre>$executiveContent</pre>

<h2>קבצים מצורפים</h2>
<ul>
<li>portfolio-analysis.md - ניתוח מלא</li>
<li>portfolio-executive.md - סיכום הנהלה</li>
<li>dashboard-portfolio.html - דשבורד אינטראקטיבי (פתח בדפדפן)</li>
</ul>

<div class="footer">
דוח זה מופק אוטומטית על ידי Scale4U v1.1.<br>
לשאלות: מוביל AI - מינהל גמלאות.<br>
הדוח הבא: $(Get-Date (Get-Date).AddDays(14) -Format 'dd/MM/yyyy')
</div>
</div>
</body>
</html>
"@

# Step 4: Send email
Log "Sending email to $($Config.RecipientEmail)..."

if ($DryRun) {
    Log "[DRY RUN] Would send email to $($Config.RecipientEmail)"
    Log "[DRY RUN] Subject: $($Config.EmailSubject)"
} else {
    try {
        $mailParams = @{
            From       = $Config.SenderEmail
            To         = $Config.RecipientEmail
            Subject    = "$($Config.EmailSubject) - $(Get-Date -Format 'dd/MM/yyyy')"
            Body       = $emailBody
            BodyAsHtml = $true
            SmtpServer = $Config.SmtpServer
            Port       = $Config.SmtpPort
            Encoding   = [System.Text.Encoding]::UTF8
        }

        # Attach files if they exist
        $attachments = @(
            (Join-Path $Config.OutputDir "portfolio-analysis.md"),
            (Join-Path $Config.OutputDir "portfolio-executive.md"),
            (Join-Path $Config.OutputDir "dashboard-portfolio.html")
        ) | Where-Object { Test-Path $_ }

        if ($attachments.Count -gt 0) {
            $mailParams.Attachments = $attachments
        }

        Send-MailMessage @mailParams
        Log "Email sent successfully"
    } catch {
        Log "ERROR: Email failed - $_"
        Log "Tip: Verify SMTP server ($($Config.SmtpServer)) is accessible from this machine"
        exit 1
    }
}

Log "Scale4U Scheduled Report - Complete"
Log "Next run: $(Get-Date (Get-Date).AddDays(14) -Format 'yyyy-MM-dd') at $($Config.TriggerTime)"
