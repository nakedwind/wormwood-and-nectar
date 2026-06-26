@echo off
echo ============================================
echo   Building ENGLISH Netlify deploy folder...
echo ============================================
echo.

set "SRC=%~dp0"
set "DST=%~dp0netlify_deploy_en"

rem Mirror everything EXCEPT git/PSD/claude, scripts, the two index html files,
rem and both deploy folders. We add the English index.html ourselves below.
robocopy "%SRC%." "%DST%" /MIR /XD "%SRC%.git" "%SRC%PSD" "%SRC%.claude" "%SRC%netlify_deploy" "%DST%" /XF "*.py" "*.psd" "*.bat" "index.html" "index_en.html" /R:1 /W:1 /NJH /NJS /NDL /NFL >nul

rem Place the English file AS index.html so the site serves it by default.
copy /Y "%SRC%index_en.html" "%DST%\index.html" >nul

echo.
if exist "%DST%\index.html" (
  echo [OK] Done. Clean ENGLISH deploy folder is ready at:
  echo      %DST%
  echo.
  echo Next step: drag the "netlify_deploy_en" folder onto the
  echo dashed drop area on your ENGLISH site's Deploys page in Netlify.
) else (
  echo [ERROR] index.html not found. Build may have failed.
)
echo.
pause
