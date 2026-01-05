@echo off
echo 正在清理临时文件，请稍候...
:: 清理用户临时文件夹
if exist "%TEMP%\" (
    del /f /s /q "%TEMP%\*.*"
    for /d %%p in ("%TEMP%\*") do rmdir "%%p" /s /q
)
:: 清理系统临时文件夹
if exist "%SystemRoot%\Temp\" (
    del /f /s /q "%SystemRoot%\Temp\*.*" >nul 2>&1
    for /d %%p in ("%SystemRoot%\Temp\*") do rmdir "%%p" /s /q >nul 2>&1
)
:: 清理浏览器缓存（Edge/Chrome）
if exist "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache\" (
    del /f /s /q "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache\*.*"
)
if exist "%LocalAppData%\Google\Chrome\User Data\Default\Cache\" (
    del /f /s /q "%LocalAppData%\Google\Chrome\User Data\Default\Cache\*.*"
)
:: 重建临时文件夹（防止程序报错）
if not exist "%TEMP%\" mkdir "%TEMP%"
if not exist "%SystemRoot%\Temp\" mkdir "%SystemRoot%\Temp\"
echo 临时文件清理完成！
pause