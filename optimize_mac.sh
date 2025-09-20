#!/bin/bash
# 🚀 macOS Performance Optimization Script
# 功能：清理启动项缓存、系统缓存，列出高占用进程

echo "🚀 Starting macOS Performance Optimization..."

# 1️⃣ 清理启动项缓存
echo "🧹 Clearing LaunchAgents and LaunchDaemons cache..."
sudo rm -rf ~/Library/Preferences/com.apple.loginitems.plist
sudo rm -rf ~/Library/Preferences/ByHost/com.apple.loginitems.*
sudo rm -rf /Library/Preferences/com.apple.loginitems.plist
echo "✅ Startup items cache cleared."

# 2️⃣ 清理系统缓存
echo "🧹 Clearing system and user caches..."
sudo rm -rf /Library/Caches/*
rm -rf ~/Library/Caches/*
echo "✅ System and user caches cleared."

# 3️⃣ 列出高占用 CPU/内存进程
echo "🔍 Listing top 10 memory consuming processes:"
ps -Ao pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 11

echo "🔍 Listing top 10 CPU consuming processes:"
ps -Ao pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 11

# 4️⃣ 提示用户清理临时文件或杀掉占用高的进程
echo "💡 Tip: Consider closing high memory or CPU processes manually if needed."
echo "💡 You can use 'kill -9 PID' to terminate a process (replace PID with process ID)."

echo "🎉 macOS performance optimization script finished!"
