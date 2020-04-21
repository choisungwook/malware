
# 이 프로젝트는?
악성코드 분석 환경을 자동으로 설치하는 스크립트 입니다. <br/>
필요한 최소한 프로그램만 설치하는 목적이 있습니다. <br/>
자동 설치 원리는 chocloately 명령어를 활용하는 것입니다.

# 1. 설치방법

## 1.1 관리자 권한으로 파워쉘 실행 

## 1.2 파워쉘 보안설정 비활성화
 * 명령어 입력 후, A(Yes to ALL) 입력

```powershell
Set-ExecutionPolicy Unrestricted
```

## 1.3 chocolately 설치
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

## 1.4 파워쉘 스크립트 실행
### 1.4.1 한번에 설치
```powershell
.\allrun.ps1
```

### 1.4.2 단계별 수동 설치
```powershell
1_removeapps.ps1 ;윈도우 앱 제거
2_disable_securitysettings.ps1 ; 윈도우 보안설정
3_install_tools.ps1 ; 분석도구 설치
4_configure_tools.ps1 ; 분석도구 설정
```

# 2. 설치과정
## 2.1 윈도우 10 사용하지 않은 앱 제거
## 2.2 윈도우 보안설정
- 방화벽 비활성화
- 윈도우 디펜더 비활성화
- 알림센터 비활성화
## 2.3 분석도구 설치
- 헥사에디터
- 기드라
- ida-free
- visual studio code
- notepad++
- procexplorer
- procmon
- processhacker
- ollydbg
- x64dbg
- chrome
- everything
- autoruns
- 와이어샤크
- 버프슈트: 다운로드 속도가 매우 느려 설치중단
- hashmyfiles
- 7zip

# 3. 수동 설치 및 설정
## 3.1 수동 설치
* [확인필요] jre 환경변수 추가(burpsuite 사용을 위해): 경로->C:\Program Files\Java\jre[버전]\bin
* visual studio community
* pestudio 설치

## 3.2 수동 설정
* 올리 디버거 설정(x64dbg를 사용할 거면 안해도 무방)
* UAC 비활성화: 이 설정은 안하는 편이 좋다고 생각(참고자료:https://www.howtogeek.com/howto/windows-vista/disable-user-account-control-uac-the-easy-way-on-windows-vista)
* 방화벽 나머지 설정
* 작업 스케쥴러 전부 제거
* 백그라운드 앱 전부 비활성화
* 윈도우 부팅 프로그램 설정 제거 -> ctrl + alt + del 입력 후 작업 관리자 -> 시작프로그램에서 관리

# 4. 참고자료
> 설치 스크립트는 flare-vm, OALabs를 참고하였습니다. 환경변수 등 각 세부사항 설정은 파워쉘 스크립트에 각각 주석으로 표시했습니다.
* OALabs 설치 스크립트: https://gist.github.com/OALabs/afb619ce8778302c324373378abbaef5
* Flarm-VM 설치 스크립트: https://github.com/fireeye/flare-vm/blob/master/install.ps1