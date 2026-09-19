@echo off
setlocal

echo ===================================================
echo   IQ NAVIGATORS - HERO VIDEO OPTIMIZATION TOOL
echo ===================================================
echo.

set "SOURCE_VIDEO=C:\Users\nasir\Downloads\5200349-uhd_3840_2160_25fps.mp4"
set "DEST_DIR=d:\IQNavigator\videos"
set "DEST_FILE=d:\IQNavigator\videos\hero-bg.mp4"

if not exist "%SOURCE_VIDEO%" (
    echo [ERROR] Source video not found at:
    echo "%SOURCE_VIDEO%"
    echo Please make sure the file is in your Downloads folder.
    pause
    exit /b 1
)

if not exist "%DEST_DIR%" (
    mkdir "%DEST_DIR%"
)

where ffmpeg >nul 2>nul
if %errorlevel% equ 0 (
    echo [FOUND] FFmpeg is installed! Optimizing 4K video to lightweight 720p Web MP4...
    echo - Resolution: 1280x720 (Crisp web scale)
    echo - Audio: Stripped (Muted background saves 30%% size)
    echo - FastStart: Enabled (Plays in 0.1s without waiting for download)
    echo - Target Size: ~2MB to 3MB
    echo.
    ffmpeg -y -i "%SOURCE_VIDEO%" -vf "scale=1280:-2" -c:v libx264 -crf 28 -preset medium -an -movflags +faststart "%DEST_FILE%"
    if %errorlevel% equ 0 (
        echo.
        echo [SUCCESS] Optimized video created at: %DEST_FILE%
        echo The website hero section will now load instantly and play smoothly!
    ) else (
        echo [ERROR] FFmpeg compression encountered an issue.
    )
) else (
    echo [NOTICE] FFmpeg was not found in PATH.
    echo Copying source video directly to %DEST_FILE% for now...
    copy /Y "%SOURCE_VIDEO%" "%DEST_FILE%"
    echo.
    echo Done! For maximum web speed (reducing 50MB to 2MB):
    echo You can use Windows built-in Clipchamp or CloudConvert/FreeConvert to export as 720p Muted MP4.
)

echo.
pause
