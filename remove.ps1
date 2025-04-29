[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]'Tls,Tls11,Tls12'

Invoke-WebRequest -Uri 'https://ninite.com/chrome-googledrivefordesktop-zoom/ninite.exe' -OutFile ninite.exe

.\ninite.exe
