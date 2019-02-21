#FOR PDF FOR PDF
# powershell script for windows to /find PDF in selected directory/make new folder in directory/move found files there
<# HOW TO USE
Start powershell (type it in start menu)
if drive Z: is not mapped somehow and you cannot select it type: 
net use Z: "\\Ccserv-dc\design" 
to map it again
copy code and hit enter
if you don't have permissions, run powershell as an administrator	
#>
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
$drwdata = Get-ChildItem *[0-9][0-9][0-9][0-9][0-9][0-9]*.pdf | measure
# look if there is a folder named 'old drawings' already present
$olddrawings = Get-ChildItem -Attributes Directory | where Name -Match 'old drawings' | measure
# if there are drawings in directory
if ($drwdata.Count -gt 0){
# if there is no 'old version' folder present, make one
if ($olddrawings.Count -eq 0) {New-Item -Path . -Name 'old drawings' -ItemType 'directory'}
# move items to folder
Get-ChildItem *[0-9][0-9][0-9][0-9][0-9][0-9]*.pdf | Move-Item -Destination 'old drawings'
# old drawings path
$pathdrw= $path + '\old drawings'
#store and write moved files to console
$movedfiles = Get-ChildItem -Path $pathdrw -Recurse
Write-Output $movedfiles}}
# end loop if user did not hit ok 
else {$loop = $false}}