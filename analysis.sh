#! /bin/bash

msiserver
consult service state : sc query <service>
recreate : sc create msiserver binPath= "C:\Windows\System32\msiexec.exe /V" start= demand type= share error= normal DisplayName= "Windows Installer"
register : msiexec /regerver
unregister : msiexec /unregister 
dependencies : sc config msiserver depend= RpcSs
initialize : net start <service>

EVENTVWR
_____________________________________________________
Windows Logs>Application> Filter by MSInstaller or Application error
Windows Logs>System> Filter by Service Control Manager 
Event ID
Significado
7000
Servicio no pudo iniciar
7001
Dependencia falló
7009
Timeout del servicio
7023
Servicio terminó con error
7034
Servicio murió inesperadamente
7045
Servicio instalado
7003
Dependencia inexistente



//IDs comunes de Windows Installer
Event ID
Significado
11707
Instalación exitosa
11708
Instalación falló
1033
Inicio de instalación
10005
Error DCOM relacionado
1001
Fallo general MSI
