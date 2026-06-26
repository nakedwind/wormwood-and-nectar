# -*- coding: utf-8 -*-
# 把英文版打包成 itch.io 可上傳的 zip。
# 先跑 build_netlify_en.bat 產生 netlify_deploy_en 資料夾，再雙擊/執行這支。
# zip 內的 index.html = 英文版，且放在最上層，itch.io 才會正確顯示。
import os, zipfile, sys

HERE = os.path.dirname(os.path.abspath(__file__))
SRC  = os.path.join(HERE, "netlify_deploy_en")
OUT  = os.path.join(HERE, "wormwood_en.zip")

if not os.path.isdir(SRC):
    print("找不到 netlify_deploy_en 資料夾。請先雙擊 build_netlify_en.bat。")
    sys.exit(1)

count = 0
with zipfile.ZipFile(OUT, "w", zipfile.ZIP_DEFLATED) as z:
    for root, dirs, files in os.walk(SRC):
        for f in files:
            full = os.path.join(root, f)
            # arcname：相對於 netlify_deploy_en，讓 index.html 落在 zip 最上層
            arc = os.path.relpath(full, SRC)
            z.write(full, arc)
            count += 1

print("完成！已打包 %d 個檔案。" % count)
print("輸出檔：%s" % OUT)
print("把這個 wormwood_en.zip 上傳到 itch.io 的英文版專案即可。")
