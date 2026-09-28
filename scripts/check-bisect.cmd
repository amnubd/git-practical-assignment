@echo off
findstr /b /x /c:"BUG" src\bisect-demo.txt >nul
if %errorlevel%==0 exit /b 1
exit /b 0
