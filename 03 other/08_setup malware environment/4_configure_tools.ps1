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
    [string] $src,
    [string] $dst
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
Install-PinnedTaskBarItem "C:\ProgramData\chocolatey\lib\die\tools\die_win32_portable\die.exe"


# 바탕화면 링크파일 생성
Install-Lnk "C:\Program Files\IDA Freeware 7.0\ida64.exe" "C:\Users\IEUser\Desktop\ida64.lnk"
Install-Lnk "C:\ProgramData\chocolatey\lib\x64dbg.portable\tools\release\x32\x32dbg.exe" "C:\Users\IEUser\Desktop\x32dbg.lnk"
Install-Lnk "C:\ProgramData\chocolatey\lib\x64dbg.portable\tools\release\x64\x64dbg.exe" "C:\Users\IEUser\Desktop\x64dbg.lnk"
Install-Lnk "C:\Program Files\Wireshark\Wireshark.exe" "C:\Users\IEUser\Desktop\Wireshark.lnk"

# chocolately 디렉터리 권한 설정
$CurTgt = "C:\ProgramData\chocolatey"
$CurUsr = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$acl = Get-Acl $CurTgt
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($CurUsr,"FullControl","ContainerInherit,ObjectInherit","None","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl $CurTgt