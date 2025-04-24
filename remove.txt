$ErrorActionPreference=0
$ProgressPreference=0

write-host -fore green "Removing the mcafee agent (Change to non-managed mode, then remove)..."
Set-Location 'C:\Program Files\mcafee\Agent\x86' ;
Start-Process -Wait '.\FrmInst.exe' -ArgumentList '/remove=agent','/silent' -NoNewWindow
Start-Process -Wait '.\FrmInst.exe' -ArgumentList '/forceuninstall','/silent' -NoNewWindow

write-host -fore green "Removing the remainder of the mcafee products..."
(Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like 'mcafee*' } ).Uninstall() ;

write-host -fore green "Script complete. Check the Windows Installed Programs, and all McAfee should be gone."
