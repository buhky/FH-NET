@echo off
set ssid=FH-Lisle
set password=qui3tHome22

netsh wlan delete profile name="P2P Oakbrook" >nul 2>&1

echo ^<?xml version="1.0"?^> > "%TEMP%\WiFiProfile.xml"
echo ^<WLANProfile xmlns="http://www.microsoft.com/networking/WLAN/profile/v1"^> >> "%TEMP%\WiFiProfile.xml"
echo     ^<name^>%ssid%^</name^> >> "%TEMP%\WiFiProfile.xml"
echo     ^<SSIDConfig^> >> "%TEMP%\WiFiProfile.xml"
echo         ^<SSID^> >> "%TEMP%\WiFiProfile.xml"
echo             ^<name^>%ssid%^</name^> >> "%TEMP%\WiFiProfile.xml"
echo         ^</SSID^> >> "%TEMP%\WiFiProfile.xml"
echo     ^</SSIDConfig^> >> "%TEMP%\WiFiProfile.xml"
echo     ^<connectionType^>ESS^</connectionType^> >> "%TEMP%\WiFiProfile.xml"
echo     ^<connectionMode^>auto^</connectionMode^> >> "%TEMP%\WiFiProfile.xml"
echo     ^<MSM^> >> "%TEMP%\WiFiProfile.xml"
echo         ^<security^> >> "%TEMP%\WiFiProfile.xml"
echo             ^<authEncryption^> >> "%TEMP%\WiFiProfile.xml"
echo                 ^<authentication^>WPA2PSK^</authentication^> >> "%TEMP%\WiFiProfile.xml"
echo                 ^<encryption^>AES^</encryption^> >> "%TEMP%\WiFiProfile.xml"
echo                 ^<useOneX^>false^</useOneX^> >> "%TEMP%\WiFiProfile.xml"
echo             ^</authEncryption^> >> "%TEMP%\WiFiProfile.xml"
echo             ^<sharedKey^> >> "%TEMP%\WiFiProfile.xml"
echo                 ^<keyType^>passPhrase^</keyType^> >> "%TEMP%\WiFiProfile.xml"
echo                 ^<protected^>false^</protected^> >> "%TEMP%\WiFiProfile.xml"
echo                 ^<keyMaterial^>%password%^</keyMaterial^> >> "%TEMP%\WiFiProfile.xml"
echo             ^</sharedKey^> >> "%TEMP%\WiFiProfile.xml"
echo         ^</security^> >> "%TEMP%\WiFiProfile.xml"
echo     ^</MSM^> >> "%TEMP%\WiFiProfile.xml"
echo ^</WLANProfile^> >> "%TEMP%\WiFiProfile.xml"

netsh wlan add profile filename="%TEMP%\WiFiProfile.xml" >nul 2>&1

del "%TEMP%\WiFiProfile.xml" >nul 2>&1
