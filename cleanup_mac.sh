#!/bin/bash

echo "🚀 开始清理 macOS 系统垃圾和缓存 ..."

# 1. 用户缓存
echo "🗑️ 删除用户缓存..."
rm -rf ~/Library/Caches/*
rm -rf ~/Library/Logs/*
rm -rf ~/Library/Application\ Support/*/Cache/*
rm -rf ~/Library/Application\ Support/CrashReporter/*

# 2. 系统缓存（需要 sudo）
echo "🛡️ 删除系统缓存..."
sudo rm -rf /Library/Caches/*
sudo rm -rf /System/Library/Caches/*

# 3. Trash 垃圾
echo "🗑️ 清空废纸篓..."
rm -rf ~/.Trash/*
sudo rm -rf /Volumes/*/.Trashes/*

# 4. Python 缓存
echo "🐍 清理 Python 缓存..."
pip cache purge 2>/dev/null
find ~ -name "__pycache__" -type d -exec rm -rf {} +
find ~ -name "*.pyc" -type f -delete
rm -rf ~/.local/share/virtualenvs
rm -rf ~/.cache/pipenv
poetry cache clear pypi --all 2>/dev/null

# 5. Homebrew 缓存
echo "🍺 清理 Homebrew 缓存..."
brew cleanup -s

# 6. 浏览器缓存（可选）
echo "🌐 清理浏览器缓存..."
rm -rf ~/Library/Caches/Google/Chrome/*
rm -rf ~/Library/Caches/Firefox/Profiles/*
rm -rf ~/Library/Caches/com.apple.Safari/*

echo "🎉 清理完成！"
