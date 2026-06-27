Add-Type -AssemblyName System.Drawing

$folder = Split-Path -Parent $MyInvocation.MyCommand.Path
$pngs = Get-ChildItem -Path $folder -Filter "*.png"

if ($pngs.Count -eq 0) {
    Write-Host "No PNG files found in this folder."
    pause
    exit
}

foreach ($png in $pngs) {
    $outputPath = [System.IO.Path]::ChangeExtension($png.FullName, ".ico")
    
    $img = [System.Drawing.Image]::FromFile($png.FullName)
    $bmp = New-Object System.Drawing.Bitmap($img, 256, 256)
    
    $ms = New-Object System.IO.MemoryStream
    $bmp.Save($ms, [System.Drawing.Imaging.ImageFormat]::Png)
    $pngBytes = $ms.ToArray()
    $ms.Close()

    $writer = New-Object System.IO.BinaryWriter([System.IO.File]::OpenWrite($outputPath))
    
    # ICO header
    $writer.Write([int16]0)      # Reserved
    $writer.Write([int16]1)      # Type: ICO
    $writer.Write([int16]1)      # Number of images

    # Image directory
    $writer.Write([byte]0)       # Width (0 = 256)
    $writer.Write([byte]0)       # Height (0 = 256)
    $writer.Write([byte]0)       # Color palette
    $writer.Write([byte]0)       # Reserved
    $writer.Write([int16]1)      # Color planes
    $writer.Write([int16]32)     # Bits per pixel
    $writer.Write([int32]$pngBytes.Length)  # Image size
    $writer.Write([int32]22)     # Offset (header + directory = 22 bytes)

    # PNG data
    $writer.Write($pngBytes)
    $writer.Close()

    $img.Dispose()
    $bmp.Dispose()

    Write-Host "Converted: $($png.Name) -> $([System.IO.Path]::GetFileName($outputPath))"
}

Write-Host "`nDone! $($pngs.Count) file(s) converted."
pause