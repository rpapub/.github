param (
    [string]$SourcePath = "_site/assets/images/opengraph/linkedin/"
)

Write-Host "Converting all SVG files to PNG in $SourcePath..."

# Define paths to fonts
$biolinumFontPath = "./assets/fonts/LinLibertineOTF/LinBiolinum_R.otf"
$libertineFontPath = "./assets/fonts/LinLibertineOTF/LinLibertine_R.otf"

# Debugging font paths
Write-Host "Biolinum font path: $biolinumFontPath"
Write-Host "Libertine font path: $libertineFontPath"

# Ensure fonts exist
if (-Not (Test-Path $biolinumFontPath)) {
    Write-Error "Biolinum font not found at $biolinumFontPath."
    exit 1
}
if (-Not (Test-Path $libertineFontPath)) {
    Write-Error "Libertine font not found at $libertineFontPath."
    exit 1
}

# Determine the executable to use
$magickPath = (Get-Command "magick" -ErrorAction SilentlyContinue)?.Source
$convertPath = (Get-Command "convert" -ErrorAction SilentlyContinue)?.Source

if ($magickPath) {
    $imageMagickCommand = "magick"
    Write-Host "Using magick for conversion."
} elseif ($convertPath) {
    $imageMagickCommand = "convert"
    Write-Host "Using convert for conversion."
} else {
    Write-Error "Neither magick nor convert is available. Install ImageMagick to proceed."
    exit 1
}

# Check if the source path exists
if (-Not (Test-Path $SourcePath)) {
    Write-Error "Source path $SourcePath does not exist."
    exit 1
}

# Process SVG files
Get-ChildItem -Path $SourcePath -Filter '*.svg' | ForEach-Object {
    $inputFile = $_.FullName -replace "\\", "/"
    $outputFile = (Join-Path -Path $_.DirectoryName -ChildPath "$($_.BaseName).png") -replace "\\", "/"

    Write-Host "Converting:" $inputFile "to" $outputFile

    # Execute the conversion command
    try {
        # Add explicit font paths for ImageMagick
        Start-Process -FilePath $imageMagickCommand -ArgumentList @(
            "-define", "font:LinBiolinum=$biolinumFontPath",
            "-define", "font:LinLibertine=$libertineFontPath",
            $inputFile,
            $outputFile
        ) -NoNewWindow -Wait
    } catch {
        Write-Error "Failed to convert $inputFile to PNG: $_"
    }
}

Write-Host "Conversion complete."
