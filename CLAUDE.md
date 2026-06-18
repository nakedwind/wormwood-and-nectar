# 專案：苦艾與甘露（Wormwood & Dew）

> 這份檔案是「跨電腦共用的記憶」。作者用兩台電腦開發，靠這個檔（透過 GitHub 同步）讓 Claude 在任一台都記得專案脈絡。更新後請 commit + push，另一台 git pull 即可。

## 關於作者
- **沒有寫程式經驗**，是完全的新手。請用淺白、非技術的說明，重要決定先解釋再做。
- 回覆用**繁體中文**。

## 遊戲概況
- 單一 `index.html`（HTML + CSS + JS 全部寫在一起，超過一萬六千行）的網頁養成遊戲。
- 11 天的劇情：艾德林照顧被詛咒的孩子阿瓦倫。數值有疼痛、詛咒、心情、知識(trust)、飽食度、艾德林 HP／體力。
- **8 種結局**：甘露(nectar最佳)、囚禁(captivity)、苦艾(wormwood)、黑霧(mist)、詛咒(bad_curse)、血月之後(avaren_death)、倒下(eldrin_death)、覆寫(reid特殊)。
- 已上架 **itch.io** 和 **Netlify**。

## 發佈流程
**Netlify（手動拖拉，沒接 GitHub 自動部署）：**
1. 雙擊根目錄 `build_netlify.bat` → 產生／更新 `netlify_deploy` 資料夾（約 105MB，已排除 .git/PSD 等）。
2. 登入 app.netlify.com → 現有網站 → Deploys → 把 `netlify_deploy` 資料夾拖到虛線框。
- `build_netlify.bat` 內容必須**全英文**（中文路徑會讓 cmd 解析失敗）。
- 別用 zip（中文檔名如 music/音效 編碼會出問題），拖資料夾最保險。

**itch.io：** 重新打包必須用 make_zip.py，不可用 Compress-Archive。

## 玩家統計（GoatCounter）
- 免費、無 cookie。後台：https://naturalwind0.goatcounter.com（代碼 `naturalwind0`）。
- 片段在 `</body>` 前；自訂事件透過共用函式 `gcEvent(path, title)`（定義在 `endDay()` 上方，try/catch 包住，未載入時自動略過）。
- 已追蹤事件：
  - 瀏覽數（自動）
  - `ending/<key>`（8 種結局，在 endGame）
  - `day/<N>`（玩到第幾天，1~11，在每日重置區）
  - `potion/<type>`（cold/curse/stamina/forget，研究完成時）
  - `bloodmoon/calmed`（成功安撫血月；失敗看 ending/avaren_death）
- 改完統計程式碼要重新 build_netlify.bat 上架才生效；本機測試 GoatCounter 會忽略 localhost。
- **發現：玩家多用手機（iOS）玩 → 之後做手機版值得。**

## 遊戲技術重點
- **移動已做幀率校正**（`G._frameFactor`，以 60fps 為基準，上限 3）：玩家與所有 NPC／生物移動速度不受螢幕刷新率影響，避免高刷新率手機走太快。
- 主要狀態都在全域物件 `G`。

## 新遊戲模板
- `C:\Users\IEPC020\Documents\私人用\遊戲模板`：乾淨的起手骨架（分檔結構、幀率校正移動、對話範例、git 已初始化）。以後開新遊戲複製這個資料夾來用。

## 待辦／可做的方向（作者有興趣但尚未動手）
- 手機版（觸控按鈕 + 版面自適應）
- 英文版（建議做成同一份程式的中英切換，別分叉兩份檔）
- 更多統計（入睡選擇、力竭倒下、再玩一次、中途危機等）
- 把巨大的 index.html 拆成多個小檔，較好維護
