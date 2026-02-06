param([string]$action)

$desktopPath = [System.IO.Path]::Combine($env:USERPROFILE, "Desktop")
$screenshotPath = [System.IO.Path]::Combine($desktopPath, "live_screen.png")

# --- БЛОК: СКРИНШОТ ---
if ($action -eq "screenshot") {
    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Drawing
    
    $screen = [System.Windows.Forms.Screen]::PrimaryScreen
    $bitmap = New-Object System.Drawing.Bitmap($screen.Bounds.Width, $screen.Bounds.Height)
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.CopyFromScreen($screen.Bounds.X, $screen.Bounds.Y, 0, 0, $bitmap.Size)
    
    $bitmap.Save($screenshotPath, [System.Drawing.Imaging.ImageFormat]::Png)
    $graphics.Dispose()
    $bitmap.Dispose()
    
    Write-Host "Success: Screenshot saved to $screenshotPath"
}

# --- БЛОК: КЛИК МЫШЬЮ ---
elseif ($action -eq "click") {
    Add-Type -AssemblyName System.Windows.Forms
    $x = [int]$args[0]
    $y = [int]$args[1]
    
    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)
    
    $signature = '[DllImport("user32.dll")] public static extern void mouse_event(int flags, int dx, int dy, int data, int extra);'
    $type = Add-Type -MemberDefinition $signature -Name "Win32Mouse" -Namespace "Win32" -PassThru
    
    $type::mouse_event(0x0002, 0, 0, 0, 0)
    $type::mouse_event(0x0004, 0, 0, 0, 0)
    
    Write-Host "Success: Clicked at $x, $y"
}

# --- БЛОК: ЗАПУСК ПРОГРАММ ---
elseif ($action -eq "run") {
    $app = $args[0]
    if ($app) {
        Start-Process $app
        Write-Host "Success: Started $app"
    } else {
        Write-Host "Error: No application specified"
    }
}
# Конец скрипта