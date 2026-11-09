@echo off
setlocal
cd /d "%~dp0"

echo ==========================================
echo   Android project -> GitHub (ek click)
echo ==========================================
echo.

where git >nul 2>nul
if errorlevel 1 (
  echo Git installed nahi hai. Pehle https://git-scm.com/download/win se install karo, phir ye file dobara chalao.
  pause
  exit /b 1
)

if not exist "settings.gradle.kts" (
  echo Galat folder! Ye file project folder ke andar honi chahiye jahan settings.gradle.kts hai.
  pause
  exit /b 1
)

echo 1) github.com par NAYA EMPTY PRIVATE repo banao (README/license mat add karna)
echo 2) Uska URL yahan paste karo
echo.
set /p REPO=Repo URL (https://github.com/username/repo.git): 
if "%REPO%"=="" (
  echo URL khali hai.
  pause
  exit /b 1
)

if not exist ".git" git init
git branch -M main
git add -A
git commit -m "Android project"
git remote remove origin >nul 2>nul
git remote add origin %REPO%
git push -u origin main

echo.
if errorlevel 1 (
  echo Push fail hua. Ya to repo EMPTY nahi hai, ya login/URL galat hai.
) else (
  echo Done! Ab GitHub par Actions tab kholo, Build APK chal raha hoga.
)
pause
