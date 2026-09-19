-- 由 update.sh 以 nvim --headless 執行：把目前 nvim 實際生效的全域 keymap 匯出成 keymaps.js
local modes = { n = "normal", x = "visual", i = "insert", t = "terminal", o = "operator" }
local seen, out = {}, {}

for _, m in ipairs({ "n", "x", "i", "t", "o" }) do
  for _, k in ipairs(vim.api.nvim_get_keymap(m)) do
    local lhs = k.lhs:gsub(" ", "<Space>")
    local desc = k.desc or ""
    local skip = lhs:find("^<Plug>") or desc == "which_key_ignore" or (desc == "" and (k.rhs or "") == "")
    local key = m .. lhs
    if not skip and not seen[key] then
      seen[key] = true
      table.insert(out, { mode = modes[m], lhs = lhs, desc = desc ~= "" and desc or k.rhs })
    end
  end
end

table.sort(out, function(a, b)
  return a.mode == b.mode and a.lhs < b.lhs or a.mode ~= b.mode and a.mode < b.mode
end)

local f = assert(io.open(vim.env.OUT, "w"))
f:write("// 自動產生，請勿手改；重新產生請執行 ./update.sh\n")
f:write("window.KEYMAPS_UPDATED = " .. vim.json.encode(os.date("%Y-%m-%d %H:%M")) .. ";\n")
f:write("window.KEYMAPS = " .. vim.json.encode(out) .. ";\n")
f:close()
