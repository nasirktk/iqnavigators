# Ensure videos folder exists
$destDir = "d:\IQNavigator\videos"
if (!(Test-Path -Path $destDir)) {
    New-Item -ItemType Directory -Path $destDir -Force | Out-Null
}

$source = "C:\Users\nasir\Downloads\5200349-uhd_3840_2160_25fps.mp4"
$dest = "d:\IQNavigator\videos\hero-bg.mp4"

if (Test-Path -Path $source) {
    # Check if ffmpeg is available
    $ffmpeg = Get-Command ffmpeg -ErrorAction SilentlyContinue
    if ($ffmpeg) {
        Write-Host "FFmpeg found. Compressing 4K video to ultra-light 720p web MP4..." -ForegroundColor Cyan
        & ffmpeg -y -i $source -vf "scale=1280:-2" -c:v libx264 -crf 28 -preset medium -an -movflags +faststart $dest
        Write-Host "Optimized web video created at $dest!" -ForegroundColor Green
    } else {
        Write-Host "Copying original video to $dest..." -ForegroundColor Yellow
        Copy-Item -Path $source -Destination $dest -Force
        Write-Host "Copied! Note: For faster web loading, compress to 720p using Clipchamp or an online tool." -ForegroundColor Magenta
    }
} else {
    Write-Warning "Source file not found at $source"
}
