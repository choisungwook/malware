# ============================================= 단계1 윈도우10 앱 제거============================================= 
# ===========================================================================================================
# ===========================================================================================================

# 참고자료: https://gist.github.com/tkrotoff/830231489af5c5818b15
#          https://www.techsupportall.com/uninstall-built-apps-windows-10/
#          https://www.tenforums.com/tutorials/4689-uninstall-apps-windows-10-a.html

Get-AppxPackage Microsoft.3DBuilder | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsAlarms | Remove-AppxPackage
Get-AppxPackage *Autodesk* | Remove-AppxPackage
Get-AppxPackage Microsoft.BingFinance | Remove-AppxPackage
Get-AppxPackage Microsoft.BingNews | Remove-AppxPackage
Get-AppxPackage Microsoft.BingSports | Remove-AppxPackage
Get-AppxPackage Microsoft.BingWeather | Remove-AppxPackage
Get-AppxPackage *BubbleWitch* | Remove-AppxPackage
Get-AppxPackage king.com.CandyCrush* | Remove-AppxPackage
Get-AppxPackage Microsoft.CommsPhone | Remove-AppxPackage
Get-AppxPackage *Dell* | Remove-AppxPackage
Get-AppxPackage *Dropbox* | Remove-AppxPackage
Get-AppxPackage *Facebook* | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsFeedbackHub | Remove-AppxPackage
Get-AppxPackage Microsoft.Getstarted | Remove-AppxPackage
Get-AppxPackage *Keeper* | Remove-AppxPackage
Get-AppxPackage microsoft.windowscommunicationsapps | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsMaps | Remove-AppxPackage
Get-AppxPackage *MarchofEmpires* | Remove-AppxPackage
Get-AppxPackage Microsoft.Messaging | Remove-AppxPackage
Get-AppxPackage *Minecraft* | Remove-AppxPackage
Get-AppxPackage *Netflix* | Remove-AppxPackage
Get-AppxPackage Microsoft.MicrosoftOfficeHub | Remove-AppxPackage
Get-AppxPackage Microsoft.OneConnect | Remove-AppxPackage
Get-AppxPackage Microsoft.Office.OneNote | Remove-AppxPackage
Get-AppxPackage Microsoft.People | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsPhone | Remove-AppxPackage
Get-AppxPackage *Plex* | Remove-AppxPackage
Get-AppxPackage Microsoft.SkypeApp | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsSoundRecorder | Remove-AppxPackage
Get-AppxPackage *Solitaire* | Remove-AppxPackage
Get-AppxPackage Microsoft.MicrosoftStickyNotes | Remove-AppxPackage
Get-AppxPackage Microsoft.Office.Sway | Remove-AppxPackage
Get-AppxPackage *Twitter* | Remove-AppxPackage
Get-AppxPackage Microsoft.XboxApp | Remove-AppxPackage
Get-AppxPackage Microsoft.XboxIdentityProvider | Remove-AppxPackage
Get-AppxPackage Microsoft.ZuneMusic | Remove-AppxPackage
Get-AppxPackage Microsoft.ZuneVideo | Remove-AppxPackage
Get-AppxPackage *DisneyMagicKingdom* | Remove-AppxPackage
Get-AppxPackage *HiddenCityMysteryofShadows* | Remove-AppxPackage
Get-AppxPackage Microsoft.Microsoft3DViewer | Remove-AppxPackage
get-appxpackage *Microsoft.WindowsCamera* | remove-appxpackage
get-appxpackage *Microsoft.Wallet* | remove-appxpackage
get-appxpackage *Microsoft.Windows.Photos* | remove-appxpackage
get-appxpackage *Microsoft.Print3D* | remove-appxpackage
get-appxpackage *Microsoft.YourPhone* | remove-appxpackage
get-appxpackage *Microsoft.Wallet* | remove-appxpackage
get-appxpackage *Microsoft.ScreenSketch* | remove-appxpackage
get-appxpackage *Microsoft.Print3D* | remove-appxpackage
get-appxPackage Microsoft.MixedReality.Portal | remove-appxPackage
get-appxPackage Microsoft.BingNews | remove-appxPackage
get-appxPackage *Todos* | remove-appxPackage
get-appxPackage *Microsoft.Whiteboard* | remove-appxPackage
get-appxpackage *sway* | remove-appxpackage
get-appxpackage *Microsoft.RemoteDesktop* | remove-appxpackage
get-appxpackage *Microsoft.GetHelp* | remove-appxpackage
get-appxpackage *Microsoft.MSPaint*  | remove-appxpackage
Get-ProvisionedAppxPackage -Online | Where-Object { $_.PackageName -match "xbox" } | ForEach-Object { Remove-ProvisionedAppxPackage -Online -AllUsers -PackageName $_.PackageName }
taskkill /f /im OneDrive.exe
C:\Windows\SysWOW64\OneDriveSetup.exe /uninstall