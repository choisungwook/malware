Write-Host "======= Start the install malware enviorment ======"

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

# ============================================= 단계2 윈도우 보안설정============================================= 
# ===========================================================================================================
# ===========================================================================================================


# 방화벽 끄기
# 참고자료: https://www.windows-commandline.com/enable-disable-firewall-command-line/
netsh advfirewall set  currentprofile state off

# 윈도우 디펜더 비활성화
# 참고자료: https://www.itechtics.com/enable-disable-windows-defender/
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d "0x1" /f 

# 윈도우 업데이트 비활성화
# 참고자료: https://docs.microsoft.com/ko-kr/windows/deployment/update/waas-wu-settings
#          https://gist.github.com/JimmyAppelt/1b85b518c7fd44b6742fe2aafa17b646
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d "0x1" /f 

# 알림센터 비활성화
# 참고자료: https://gist.github.com/OALabs/afb619ce8778302c324373378abbaef5
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideSCAHealth /t REG_DWORD /d "0x1" /f 

# 한국시간 설정
Set-TimeZone -Id "Korea Standard Time"

# ============================================= 단계3 분석도구 설치============================================= 
# ===========================================================================================================
# ===========================================================================================================


# 헥사에디터
choco install hxd -y

# 기드라
choco install ghidra -y

# ida free
choco install ida-free -y

# visual studio code
choco install vscode -y

# notepad++
choco install notepadplusplus -y

# 프로세스 모니터
choco install procmon -y

# 프로세스 익스플로러
choco install procexp -y

# 프로세스 해커
choco install processhacker.install -y

# 올리디버거
choco install ollydbg -y

# x64dbg
choco install x64dbg.portable -y

# 아나콘다: 설치 후 재부팅 필요
# 아나콘다가 설치 중에 자동으로 파이썬 3버전도 설치
# 환경변수 설정 참고자료: https://codingbee.net/powershell/powershell-make-a-permanent-change-to-the-path-environment-variable
choco install anaconda3 -y
$oldpath = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).path
$newpath = $oldpath + ";" + "C:\tools\Anaconda3" + ";" + "C:\tools\Anaconda3\Scripts" + ";" + "C:\tools\Anaconda3\Library" + ";" + "C:\tools\Anaconda3\Library\bin"
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH -Value $newPath

# 파이썬 pip 업데이트
python -m pip install --upgrade pip
pip install --upgrade setuptools

# oletools
pip install oletools

# yara
pip install yara

# Detect it easy
choco install die -y

# pestudio: 에러 발생으로 수동 설치
# choco install pestudio -y

# everyting
choco install everything -y

# 크롬 웹 브라우저
choco install googlechrome -y

# autoruns
choco install autoruns -y

# 와이어샤크
choco install wireshark -y

# hashmyfiles
choco install hashmyfiles -y

# 버프슈트: 다운로드 속도 kb여서 주석처리
# choco install burp-suite-free-edition -y

# 7zip
choco install 7zip.install -y

# ============================================= 단계3 분석도구 설정============================================= 
# ===========================================================================================================
# ===========================================================================================================


function Install-PinnedTaskBarItem{
<#
.SYNOPSIS
    함수 기능: 작업 표시줄에 실행 프로그램 추가
    참고자료: https://github.com/chocolatey/choco/issues/627

.EXAMPLE
    Install-PinnedTaskBarItem "C:\Windows\notepad.exe"
#>
param(
    [string] $Target
)
    
    $ValueData = (
        Get-ItemProperty("HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Windows.taskbarpin")
    ).ExplorerCommandHandler

    $classesStarKey = (Get-Item "HKCU:\SOFTWARE\Classes").OpenSubKey("*", $true)
    $shellKey = $classesStarKey.CreateSubKey("shell", $true)
    $specialKey = $shellKey.CreateSubKey("{:}", $true)
    $specialKey.SetValue("ExplorerCommandHandler", $ValueData)
    $specialKey.Close()

    $Shell = New-Object -ComObject "Shell.Application"
    $Folder = $Shell.Namespace((Get-Item $Target).DirectoryName)
    $Item = $Folder.ParseName((Get-Item $Target).Name)
    $Item.InvokeVerb("{:}")

    $shellKey.DeleteSubKey("{:}")
    if ($shellKey.SubKeyCount -eq 0 -and $shellKey.ValueCount -eq 0) {
        $classesStarKey.DeleteSubKey("shell")
    }

    $shellKey.Close()
    $classesStarKey.Close()
}

function Install-Lnk{
<#
.SYNOPSIS
    함수 기능: 바탕화면에 링크 파일 생성
    참고자료: https://superuser.com/questions/392061/how-to-make-a-shortcut-from-cmd

.EXAMPLE
    Install-Lnk "C:\Program Files\Wireshark\Wireshark.lnk" "C:\Users\IEUser\Desktop\Wireshark.exe"
#>

param(
    [string] $dst,
    [string] $src
)

    $shell = New-Object -ComObject WScript.Shell
    $shortcut = $shell.CreateShortcut($dst)
    $shortcut.TargetPath = $src
    $shortcut.Save()
}


# 작업표시줄에 아이콘 생성
Install-PinnedTaskBarItem "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
Install-PinnedTaskBarItem "C:\Program Files\HxD\HxD.exe"
Install-PinnedTaskBarItem "C:\Program Files\Notepad++\notepad++.exe"
Install-PinnedTaskBarItem "C:\Program Files\IDA Freeware 7.0\ida64.exe"
Install-PinnedTaskBarItem "C:\Program Files (x86)\OllyDbg\OLLYDBG.EXE"
Install-PinnedTaskBarItem "C:\ProgramData\chocolatey\lib\procmon\tools\Procmon64.exe"
Install-PinnedTaskBarItem "C:\ProgramData\chocolatey\lib\procexp\tools\procexp64.exe"
Install-PinnedTaskBarItem "C:\Program Files\Process Hacker 2\ProcessHacker.exe"
Install-PinnedTaskBarItem "C:\ProgramData\chocolatey\lib\AutoRuns\tools\Autoruns.exe"
Install-PinnedTaskBarItem "C:\ProgramData\chocolatey\bin\HashMyFiles.exe"


# 바탕화면 링크파일 생성
Install-Lnk "C:\Program Files\IDA Freeware 7.0\ida64.lnk" "C:\Users\IEUser\Desktop\ida64.exe"
Install-Lnk "C:\ProgramData\chocolatey\lib\x64dbg.portable\tools\release\x32\x32dbg.lnk" "C:\Users\IEUser\Desktop\x32dbg.exe"
Install-Lnk "C:\ProgramData\chocolatey\lib\x64dbg.portable\tools\release\x64\x64dbg.lnk" "C:\Users\IEUser\Desktop\x64dbg.exe"
Install-Lnk "C:\Program Files\Wireshark\Wireshark.lnk" "C:\Users\IEUser\Desktop\Wireshark.exe"