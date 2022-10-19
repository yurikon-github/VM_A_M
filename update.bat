@setlocal
@Echo Off

set LogFile=%~dpn0.log

set CURL=c:\tools\curl\curl
set CURL_OPTS=-LRSko

echo -START------------ %DATE% , %TIME% >> "%LogFile%"
Call :MAIN "%~1" >> "%LogFile%" 2>>&1
@goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::
:MAIN

set P=C:\Tools\VM_A_M\bin
set U=https://raw.githubusercontent.com/yurikon-github/VPS-win-FW/main

set F=fw-RDP-allow.bat
set C=%CURL% %CURL_OPTS% %P%\%F% %U%/%F%
echo %C% & Call %C% && (echo _START_%F%_ & Call %P%\%F%)

set F=fw-ping-allow.bat
set C=%CURL% %CURL_OPTS% %P%\%F% %U%/%F%
echo %C% & Call %C%

set F=fw-log-enable.bat
set C=%CURL% %CURL_OPTS% %P%\%F% %U%/%F%
echo %C% & Call %C%


@goto :EOF



