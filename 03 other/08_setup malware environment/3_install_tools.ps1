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