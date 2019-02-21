# all from old drawings to 'Z:\- Old Drawing Files\'
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
# get number of drawings in directory with 6 digits
$drwok = Get-ChildItem *[0-9][0-9][0-9][0-9][0-9][0-9]*.slddrw -Recurse | measure
$pdfok = Get-ChildItem *[0-9][0-9][0-9][0-9][0-9][0-9]*.pdf -Recurse | measure
# if there are drawings in directory
if ($drwok.Count -gt 0 -or $pdfok.Count -gt 0){
# move items to folder
Get-ChildItem *[0-9][0-9][0-9][0-9][0-9][0-9]*.slddrw -Recurse | Move-Item -Destination 'Z:\- Old Drawing Files'
Get-ChildItem *[0-9][0-9][0-9][0-9][0-9][0-9]*.pdf -Recurse | Move-Item -Destination 'Z:\- Old Drawing Files'
}}
# end loop if user did not hit ok 
else {$loop = $false}}
