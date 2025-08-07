@echo off
REM Rails Blog - Windows Port Forwarding
REM Run as Administrator

echo Setting up LAN access for Rails Blog...

REM Get WSL IP
for /f %%i in ('wsl hostname -I') do set WSL_IP=%%i

REM Remove old rule
netsh interface portproxy delete v4tov4 listenport=3000 listenaddress=0.0.0.0 2>nul

REM Add forwarding: Windows:3000 -> WSL:3000
netsh interface portproxy add v4tov4 listenport=3000 listenaddress=0.0.0.0 connectport=3000 connectaddress=%WSL_IP%

REM Allow firewall
netsh advfirewall firewall delete rule name="Rails App" 2>nul
netsh advfirewall firewall add rule name="Rails App" dir=in action=allow protocol=TCP localport=3000

echo.
echo ✅ Done! Your Rails app is now accessible from LAN
echo.
echo Test URLs:
echo   Local: http://localhost:3000
echo   LAN:   http://[YOUR_IP]:3000
echo.
echo Run 'ipconfig' to find your IP address
pause
