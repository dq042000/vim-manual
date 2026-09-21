# 我的 Neovim 手冊

依 `~/.config/nvim` 設定整理的快速鍵手冊。直接用瀏覽器開 `index.html` 即可（不需要伺服器）。

- 上半部：依情境整理的卡片（跳視窗、檔案樹、上方檔名列、標籤頁⋯），手動維護，寫在 `index.html`。
- 下半部：從 nvim 實際匯出的全部全域快速鍵，存在 `keymaps.js`。

改過 nvim 設定後，重新匯出：

```bash
./update.sh
```

檔案說明：

| 檔案               | 用途                                            |
| ------------------ | ----------------------------------------------- |
| `index.html`       | 手冊頁面                                        |
| `keymaps.js`       | 自動產生的快速鍵資料，不要手改                  |
| `desc-zh.js`       | 說明欄的中文翻譯對照表，手動維護                |
| `update.sh`        | 以 `nvim --headless` 執行 `dump-keymaps.lua`    |
| `dump-keymaps.lua` | 讀取 `nvim_get_keymap()` 並寫出 `keymaps.js`    |
