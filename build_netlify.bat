@echo off
echo ============================================
echo   Building Netlify deploy folder...
echo ============================================
echo.

set "SRC=%~dp0"
set "DST=%~dp0netlify_deploy"

robocopy "%SRC%." "%DST%" /MIR /XD "%SRC%.git" "%SRC%PSD" "%SRC%.claude" "%DST%" /XF "*.py" "*.psd" "build_netlify.bat" /R:1 /W:1 /NJH /NJS /NDL /NFL >nul

echo.
if exist "%DST%\index.html" (
  echo [OK] Done. Clean deploy folder is ready at:
  echo      %DST%
  echo.
  echo Next step: drag the "netlify_deploy" folder onto the
  echo dashed drop area on your site's Deploys page in Netlify.
) else (
  echo [ERROR] index.html not found. Build may have failed.
)
echo.
pause
