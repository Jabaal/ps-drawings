# Show Folders in specific Depth
# Choose directory where to apply the script
$FileDialog = New-Object -Typename System.Windows.Forms.FolderBrowserDialog
$dialogResult = $FileDialog.ShowDialog()
# save path to variable
$path = $FileDialog.SelectedPath
# add ,$path\* to Get-Childitem to add more layers
$Folders = Get-ChildItem $path\*\* -Directory | Select FullName
Write-Output $Folders