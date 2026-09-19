#!/usr/bin/env bash
# 從目前的 nvim 設定重新匯出所有快速鍵到 keymaps.js
set -euo pipefail
cd "$(dirname "$0")"

OUT="$PWD/keymaps.js" nvim --headless \
  -c 'doautocmd User VeryLazy' \
  -c "lua vim.defer_fn(function() dofile('$PWD/dump-keymaps.lua'); vim.cmd('qa!') end, 3000)"

echo "已更新 keymaps.js（$(grep -o '"lhs"' keymaps.js | wc -l) 個快速鍵）"
