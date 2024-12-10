# convert-svg.ps1
param (
    [string]$SourcePath = "_site/assets/images/opengraph/linkedin/"
)

Write-Host "Converting all SVG files to PNG in $SourcePath..."

Get-ChildItem -Path $SourcePath -Filter '*.svg' | ForEach-Object {
    $outputFile = Join-Path -Path $_.Directory -ChildPath "$($_.BaseName).png"
    Write-Host "Converting:" $_.FullName "to" $outputFile
    $fontPath = "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf"
    magick "$($_.FullName)" -define "font=$fontPath" -font "$fontPath" "$outputFile"
}
