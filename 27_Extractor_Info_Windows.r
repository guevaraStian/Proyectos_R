# En este codigo, se muestra como cerar un software que extrae informacion
# De un sistema operativo windows

timestamp <- format(Sys.time(), "%Y%m%d_%H%M%S")
hostname <- Sys.info()["nodename"]
dir_name <- paste0("Info_Windows_", hostname, "_", timestamp)
dir.create(dir_name)
setwd(dir_name)


guardar_salida <- function(comando, archivo) {
  salida <- tryCatch(system(comando, intern = TRUE), error = function(e) paste("ERROR:", e$message))
  writeLines(salida, archivo)
}


# Información general del sistema
guardar_salida("systeminfo", "sistema.txt")

# Información de red
guardar_salida("ipconfig /all", "red.txt")
guardar_salida("netstat -anob", "conexiones.txt")

# Procesos
guardar_salida("tasklist", "procesos.txt")
guardar_salida('powershell -Command "Get-Process | Sort-Object CPU -Descending"', "procesos_detallados.txt")

# Hardware
guardar_salida("wmic cpu get name,NumberOfCores,NumberOfLogicalProcessors", "cpu.txt")
guardar_salida("wmic memorychip get capacity,manufacturer,speed", "memoria.txt")
guardar_salida("wmic diskdrive get model,size,serialnumber", "discos.txt")
guardar_salida('powershell -Command "Get-PhysicalDisk | Format-Table"', "discos_detallado.txt")

# Programas instalados
guardar_salida("wmic product get name,version", "programas.txt")
guardar_salida('powershell -Command "Get-WmiObject -Class Win32_Product | Select-Object Name, Version"', "programas_detallado.txt")

# Servicios
guardar_salida("sc query", "servicios.txt")
guardar_salida('powershell -Command "Get-Service | Where-Object { $_.Status -eq \'Running\' }"', "servicios_activos.txt")

# Usuarios
guardar_salida("net user", "usuarios.txt")
guardar_salida('powershell -Command "Get-LocalUser"', "usuarios_detallado.txt")

# Variables de entorno
guardar_salida("set", "entorno.txt")

# BIOS
guardar_salida("wmic bios get manufacturer, smbiosbiosversion", "bios.txt")

# Eventos recientes
guardar_salida('powershell -Command "Get-EventLog -LogName System -Newest 20"', "eventos.txt")

# Firewall
guardar_salida("netsh advfirewall show allprofiles", "firewall.txt")

# Actualizaciones
guardar_salida('powershell -Command "Get-HotFix"', "actualizaciones.txt")

cat("(+) Información del sistema guardada en la carpeta", dir_name, "\n")
# Rscript info_windows.R