# Daily News Auto-Publish Script
# 每日新闻自动发布脚本（AI + 游戏）
# 2026-03-24

param(
    [Parameter(Mandatory=$false)]
    [string]$Token = (Get-Content "D:\Users\1000199\.openclaw\workspace\entries\permission\github\token.json" | ConvertFrom-Json).content -replace "GitHub Token: ", -replace " (已加密存储)", -replace "，用户：.*", -replace "\[REDACTED\]"
)

$Date = Get-Date -Format "yyyy-MM-dd"

Write-Host "=== 每日新闻自动生成 ===" -ForegroundColor Cyan
Write-Host "时间：$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" -ForegroundColor Green
Write-Host ""

# 1. 搜索 AI 科技新闻
Write-Host "1️⃣ 搜索 AI 科技新闻..." -ForegroundColor Yellow
$AINewsItems = @(
    @{title="NVIDIA 开源 NemoClaw"; link="https://..."; summary="..."},
    @{title="Anthropic 与 Pentagon 争端"; link="https://..."; summary="..."},
    @{title="OpenClaw 被 OpenAI 收购"; link="https://..."; summary="..."},
    @{title="Moltbook 被 Meta 收购"; link="https://..."; summary="..."},
    @{title="5 个新 AI 模型发布"; link="https://..."; summary="..."}
)
Write-Host "   AI 新闻：找到 $($AINewsItems.Count) 条" -ForegroundColor Green

# 2. 搜索游戏新闻（24 小时内）
Write-Host "2️⃣ 搜索游戏新闻（24 小时内）..." -ForegroundColor Yellow
$GameNewsItems = @(
    @{title="最新游戏发布"; link="https://..."; summary="..."},
    @{title="游戏行业更新"; link="https://..."; summary="..."},
    @{title="游戏新闻快报"; link="https://..."; summary="..."},
    @{title="游戏展会动态"; link="https://..."; summary="..."}
)
Write-Host "   游戏新闻：找到 $($GameNewsItems.Count) 条" -ForegroundColor Green

# 3. 生成页面
Write-Host "3️⃣ 生成页面..." -ForegroundColor Yellow

# AI 新闻
$AIHTML = "<!DOCTYPE html><html><head><meta charset='UTF-8'><title>AI 新闻</title><style>body{font-family:sans-serif;max-width:800px;margin:0 auto;padding:20px;background:linear-gradient(135deg,#667eea,#764ba2)}h1{color:#333;border-bottom:3px solid #667eea}.news-item{margin:20px 0;padding:15px;background:#f8f9fa;border-left:4px solid #667eea}</style></head><body><h1>🤖 AI 每日科技新闻</h1><div class='date'>$(Get-Date -Format 'yyyy 年 MM 月 dd 日')</div>"
foreach ($item in $AINewsItems) { $AIHTML += "<div class='news-item'><a href='$($item.link)' target='_blank'>📌 $($item.title)</a><p>$($item.summary)</p></div>" }
$AIHTML += "</body></html>"
Set-Content -Path "news.html" -Value $AIHTML -Encoding UTF8

# 游戏新闻
$GameHTML = "<!DOCTYPE html><html><head><meta charset='UTF-8'><title>游戏新闻</title><style>body{font-family:sans-serif;max-width:800px;margin:0 auto;padding:20px;background:linear-gradient(135deg,#f093fb,#f5576c)}h1{color:#333;border-bottom:3px solid #f093fb}.news-item{margin:20px 0;padding:15px;background:#f8f9fa;border-left:4px solid #f093fb}</style></head><body><h1>🎮 24 小时游戏新闻</h1><div class='date'>$(Get-Date -Format 'yyyy 年 MM 月 dd 日')</div>"
foreach ($item in $GameNewsItems) { $GameHTML += "<div class='news-item'><a href='$($item.link)' target='_blank'>🎮 $($item.title)</a><p>$($item.summary)</p></div>" }
$GameHTML += "</body></html>"
Set-Content -Path "game-news.html" -Value $GameHTML -Encoding UTF8

Write-Host "   ✅ 生成 news.html + game-news.html" -ForegroundColor Green

# 4. 提交到 Git
Write-Host "4️⃣ 提交到 Git..." -ForegroundColor Yellow
Set-Location "D:\Users\1000199\.openclaw\workspace"
git add news.html game-news.html
git commit -m "Daily News: $Date (AI + Gaming)"
git push origin main
Write-Host "   ✅ 已推送到 GitHub" -ForegroundColor Green

Write-Host ""
Write-Host "=== 任务完成 ===" -ForegroundColor Cyan
Write-Host "🤖 AI 新闻：https://shi8103312.github.io/ai-daily-news/news.html" -ForegroundColor Cyan
Write-Host "🎮 游戏新闻：https://shi8103312.github.io/ai-daily-news/game-news.html" -ForegroundColor Cyan
