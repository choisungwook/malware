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