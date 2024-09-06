# Get a list of all printers with "Kyocera" in the name
$printers = Get-Printer | Where-Object { $_.Name -like "*Kyocera*" }

# Check if any printers were found
if ($printers.Count -eq 0) {
    Write-Host "No printers with 'Kyocera' in the name were found."
} else {
    # Loop through each printer and set it to black and white
    foreach ($printer in $printers) {
        # Set the printer to black and white (color set to false)
        Set-PrintConfiguration -PrinterName $printer.Name -Color $false
        Write-Host "Set printer '$($printer.Name)' to black and white (monochrome)."
    }
}
