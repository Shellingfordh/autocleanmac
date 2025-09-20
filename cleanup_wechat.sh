#!/bin/bash
echo "🚀 开始清理 macOS 微信缓存和重复文件..."

# 微信缓存目录
WECHAT_CACHE="$HOME/Library/Containers/com.tencent.xinWeChat/Data/Library/Caches"
WECHAT_LOGS="$HOME/Library/Containers/com.tencent.xinWeChat/Data/Library/Logs"
WECHAT_APPDATA="$HOME/Library/Containers/com.tencent.xinWeChat/Data/Library/Application Support/com.tencent.xinWeChat"

# 1️⃣ 删除缓存文件
echo "🗑️ 删除缓存..."
rm -rf "$WECHAT_CACHE"/*

# 2️⃣ 删除日志文件
echo "🗑️ 删除日志..."
rm -rf "$WECHAT_LOGS"/*

# 3️⃣ 删除重复文件（主要是缩略图、重复图片）
echo "🗑️ 删除重复文件..."
# 使用 md5 校验文件，保留第一个，删除重复
find "$WECHAT_APPDATA" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.mp4" \) -print0 | \
  xargs -0 md5 | sort | uniq -w32 -d | awk '{print $2}' | xargs -I{} rm -f "{}" 2>/dev/null

echo "🎉 微信缓存和重复文件清理完成！"
