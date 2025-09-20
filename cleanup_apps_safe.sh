#!/bin/bash
# 🚀 macOS App Cache Cleanup Script
# 功能：
# 1. 清理微信/QQ缓存及重复图片（如果已安装）
# 2. 禁用 Office/WPS 更新并清理缓存（如果已安装）
# 3. 清理 Adobe 系列软件临时文件（如果已安装）

echo "🚀 Starting macOS App Cache Cleanup..."

##############################
# 1️⃣ 微信/QQ缓存及重复图片
##############################
if [ -d ~/Library/Containers/com.tencent.xinWeChat ]; then
    echo "🧹 Cleaning WeChat caches..."
    WECHAT_CACHE=~/Library/Containers/com.tencent.xinWeChat/Data/Library/Caches
    [ -d "$WECHAT_CACHE" ] && rm -rf "$WECHAT_CACHE"/*

    echo "🔍 Removing duplicate images in WeChat..."
    find ~/Library/Containers/com.tencent.xinWeChat/Data/Library/Application\ Support/com.tencent.xinWeChat/2.0b4.0.9/* -type f -name "*.jpg" -exec md5 {} \; | sort | uniq -w32 -d | while read md5sum file; do
        rm -f "$file"
    done
    echo "✅ WeChat cache and duplicate images cleaned."
else
    echo "⚠️ WeChat not installed, skipping..."
fi

if [ -d ~/Library/Containers/com.tencent.qq ]; then
    echo "🧹 Cleaning QQ caches..."
    QQ_CACHE=~/Library/Containers/com.tencent.qq/Data/Library/Caches
    [ -d "$QQ_CACHE" ] && rm -rf "$QQ_CACHE"/*
    echo "✅ QQ cache cleaned."
else
    echo "⚠️ QQ not installed, skipping..."
fi

##############################
# 2️⃣ Office/WPS 更新与缓存
##############################
if [ -d ~/Library/Containers/com.kingsoft.wpsoffice.mac ]; then
    echo "🧹 Cleaning WPS caches and disabling updates..."
    WPS_CACHE=~/Library/Containers/com.kingsoft.wpsoffice.mac/Data/Library/Caches
    [ -d "$WPS_CACHE" ] && rm -rf "$WPS_CACHE"/*
    defaults write com.kingsoft.wpsoffice.mac SUEnableAutomaticChecks -bool false
    defaults write com.kingsoft.wpsoffice.mac SUAutomaticallyUpdate -bool false
    echo "✅ WPS cache cleaned, updates disabled."
else
    echo "⚠️ WPS not installed, skipping..."
fi

if [ -d ~/Library/Group\ Containers/UBF8T346G9.Office ]; then
    echo "🧹 Cleaning Microsoft Office caches..."
    OFFICE_CACHE=~/Library/Group\ Containers/UBF8T346G9.Office
    [ -d "$OFFICE_CACHE" ] && rm -rf "$OFFICE_CACHE"/*
    echo "✅ Microsoft Office cache cleaned."
else
    echo "⚠️ Microsoft Office not installed, skipping..."
fi

##############################
# 3️⃣ Adobe 临时文件
##############################
ADOBE_APPS=("Photoshop" "Premiere Pro" "After Effects")
for APP in "${ADOBE_APPS[@]}"; do
    CACHE_DIR=~/Library/Caches/Adobe/"$APP"
    if [ -d "$CACHE_DIR" ]; then
        echo "🧹 Cleaning Adobe $APP temporary files..."
        rm -rf "$CACHE_DIR"/*
        echo "✅ Adobe $APP temp files cleaned."
    else
        echo "⚠️ Adobe $APP not installed, skipping..."
    fi
done

echo "🎉 macOS app cache cleanup finished!"
