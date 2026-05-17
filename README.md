# AI API Relay — One API 中转站

基于 [One API](https://github.com/songquanpeng/one-api) 搭建的多厂商 AI API 统一管理 & 转发平台，支持内网穿透公网访问。

## 架构

```
用户 / 应用                   中转服务器                        原始 API
───────                      ──────────                      ─────────
你的代码 ──HTTP 请求──▶   One API (管理平台)     ──转发──▶  OpenAI / Claude
                         + ngrok (隧道)                    Google / 文心 / 通义
                                                           DeepSeek / Moonshot …
                         ├─ 多 Key 池 + 负载均衡
                         ├─ Token 用量统计
                         ├─ 用户鉴权 & 配额管理
                         └─ Web 管理面板
```

## 快速启动

```bash
# 1. 启动 One API
one-api.exe --port 3000

# 2. 启动 ngrok 隧道（公网访问）
ngrok.exe http 3000
```

或双击 `start.bat` 一键启动。

## 管理面板

| 地址 | 说明 |
|------|------|
| http://localhost:3000 | 本地管理面板 |
| http://localhost:4040 | ngrok 流量监控 |
| ngrok 分配的 URL | 公网访问地址 |

默认账号: `root` / `123456`（首次登录后请立即修改密码）

## 已对接的 AI 厂商

OpenAI · Anthropic Claude · Google Gemini · Azure OpenAI · 百度文心 · 阿里通义 · 腾讯混元 · DeepSeek · Moonshot · 智谱 ChatGLM · 讯飞星火 · MiniMax · Cohere · Groq · Ollama · xAI 等 30+ 厂商

## 功能特性

- ✅ 统一 API 格式（兼容 OpenAI SDK）
- ✅ 多 Key 自动轮换 & 负载均衡
- ✅ Token 用量统计 & 配额管理
- ✅ 多用户 & 权限管理
- ✅ Web 管理面板
- ✅ 内网穿透公网访问（ngrok）
