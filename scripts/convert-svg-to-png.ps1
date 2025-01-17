# Define base input and output directories
$inputBaseDir = "_site/assets/images/opengraph"
$outputBaseDir = "./assets/images/opengraph"

# Ensure the output base directory exists
if (-not (Test-Path -Path $outputBaseDir)) {
    New-Item -ItemType Directory -Path $outputBaseDir -Force | Out-Null
}

# Find all SVG files in the input directory, including nested subdirectories
Get-ChildItem -Path $inputBaseDir -Recurse -Filter "*.svg" | ForEach-Object {
    $svgFile = $_.FullName  # Full path to the SVG file

    # Compute the relative path of the file from the input base directory
    $relativePath = $svgFile.Substring((Get-Item $inputBaseDir).FullName.Length).TrimStart("\\")

    # Construct the corresponding output file path
    $outputFile = Join-Path $outputBaseDir ($relativePath -replace "\.svg$", ".png")

    # Ensure the output subdirectory exists
    $outputSubDir = Split-Path -Path $outputFile -Parent
    if (-not (Test-Path -Path $outputSubDir)) {
        New-Item -ItemType Directory -Path $outputSubDir -Force | Out-Null
    }

    # Check if the output file already exists
    if (-not (Test-Path -Path $outputFile)) {
        # Export the SVG as PNG using Inkscape
        Write-Host "Processing: $svgFile -> $outputFile"
        inkscape $svgFile --export-type=png --export-filename=$outputFile
    } else {
        Write-Host "Skipping (exists): $outputFile"
    }
}
