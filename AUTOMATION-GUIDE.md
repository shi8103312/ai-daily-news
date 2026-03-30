# AI 每日新闻自动化发布流程

*2026-03-24 更新*

---

## 🔄 自动化流程

### 1. 触发方式

| 方式 | 说明 | 时间 |
|------|------|------|
| GitHub Schedule | 自动触发 | 每天 08:30 上海时间 |
| GitHub Actions | 手动触发 | workflow_dispatch |
| OpenClaw Cron | 定时执行 | 配置中 |

### 2. 执行步骤

```
1️⃣ 搜索 AI 科技新闻 (Tavily API)
   ↓
2️⃣ 搜索游戏新闻 (24 小时内)
   ↓
3️⃣ 生成页面文件
   - news.html (AI 科技新闻)
   - game-news.html (游戏新闻)
   ↓
4️⃣ 提交到 Git
   - git commit -m "Daily News: YYYY-MM-DD"
   ↓
5️⃣ 推送到 GitHub
   - git push origin main
   ↓
6️⃣ GitHub Pages 自动构建
   - 1-2 分钟后页面更新
   ↓
7️⃣ 页面可访问
```

---

## 📊 当前发布页面

### AI 科技新闻
```
URL: https://shi8103312.github.io/ai-daily-news/news.html
Markdown: https://raw.githubusercontent.com/shi8103312/ai-daily-news/main/news-YYYY-MM-DD.md
```

### 游戏新闻 (24 小时)
```
URL: https://shi8103312.github.io/ai-daily-news/game-news.html
Markdown: https://raw.githubusercontent.com/shi8103312/ai-daily-news/main/game-news-YYYY-MM-DD.md
```

---

## 📋 配置文件

### GitHub Workflow
- **文件:** `.github/workflows/deploy.yml`
- **触发:** `cron: '30 0 * * *'` (UTC 0:30 = 上海时间 08:30)
- **分支:** `main`
- **部署类型:** `workflow`

### 发布脚本
- **文件:** `daily-news-publish.ps1`
- **功能:** 同时生成 AI 新闻 + 游戏新闻页面
- **权限:** 需要 GitHub Token

### API 认证
- **Token:** 存储在 `entries/permission/github/token.json` (已加密)
- **权限:** `repo`, `write:pages`

---

## 📊 当前状态

| 项目 | 状态 | 说明 |
|------|------|------|
| GitHub Pages | ✅ 已开启 | API 自动配置成功 |
| AI 新闻页面 | ✅ 已发布 | news.html |
| 游戏新闻页面 | ✅ 已添加 | game-news.html |
| 自动化脚本 | ✅ 已更新 | 包含 AI + 游戏新闻 |
| 定时任务 | ✅ 已配置 | 每天 08:30 自动运行 |

---

## 🚀 使用方法

### 手动执行
```powershell
cd D:\Users\1000199\.openclaw\workspace
.\daily-news-publish.ps1
```

### 自动执行
- GitHub Actions 每天 08:30 自动触发
- 需要配置 Tavily API KEY 才能获取实时新闻

---

## 🔧 扩展建议

1. **添加 API 配置:** 在脚本中配置 Tavily/Brave API KEY
2. **增加通知:** 发布成功后发送邮件/飞书消息
3. **历史记录:** 创建索引页面汇总每日新闻
4. **RSS 订阅:** 提供 RSS feed 供用户订阅

---

*由 Tiara ✨ 自动生成*
