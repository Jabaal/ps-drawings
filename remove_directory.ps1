# delete old drawing directory
# Make sure you can use the folderbrowser
Add-Type -AssemblyName System.Windows.Forms
# Choose directory where to apply the script
$FileDialog = New-Object -Typename System.Windows.Forms.FolderBrowserDialog
# LOOP variable
$loop = $true
# start loop and dialog in loop
while($loop){$dialogResult = $FileDialog.ShowDialog()
# save path to variable
$path = $FileDialog.SelectedPath
# start working if user hit ok in dialog, change directory to selected one
if($DialogResult -eq "OK"){cd $path
# for each item delete the directory named old drawings
$olddrwdir = Get-ChildItem -Attributes Directory -Recurse | where Name -Match 'old drawings' | Select-Object -ExpandProperty FullName
ForEach ($path in $olddrwdir) {Remove-Item $path}
}
# end loop if user did not hit ok 
else {$loop = $false}}