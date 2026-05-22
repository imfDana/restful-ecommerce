@echo off
setlocal enabledelayedexpansion

echo ====================================================
echo Running Restful E-Commerce API Tests via Newman
echo ====================================================

:: Create timestamp for the report folder
set "TIMESTAMP=%date:~-4%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%"
set "TIMESTAMP=%TIMESTAMP: =0%"
set "REPORT_DIR=reports\%TIMESTAMP%"

:: Create reports directory if it doesn't exist
if not exist "%REPORT_DIR%" mkdir "%REPORT_DIR%"

echo.
echo Running tests...
echo.

:: Run newman
call newman run restful-ecommerce-collection.json ^
  -e environments\environment-qa.json ^
  -r cli,htmlextra,junitfull ^
  --reporter-htmlextra-export "%REPORT_DIR%\report.html" ^
  --reporter-junitfull-export "%REPORT_DIR%\results.xml" ^
  --timeout-request 10000 ^
  --delay-request 100

echo.
echo ====================================================
echo Tests completed.
echo Report generated at: %REPORT_DIR%\report.html
echo XML Results for CI/CD saved at: %REPORT_DIR%\results.xml
echo ====================================================
pause
