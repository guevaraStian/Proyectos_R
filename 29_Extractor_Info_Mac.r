# En este codigo, se muestra como cerar un software que extrae informacion
# De un sistema operativo MAC

timestamp <- format(Sys.time(), "%Y%m%d_%H%M%S")
hostname <- system("hostname", intern = TRUE)
dir_name <- paste0("Info_Mac_", hostname, "_", timestamp)
dir.create(dir_name)
setwd(dir_name)


guardar_salida <- function(comando, archivo) {
  salida <- tryCatch(system(comando, intern = TRUE), error = function(e) paste("ERROR:", e$message))
  writeLines(salida, con = archivo)
}


# Información general del sistema
guardar_salida("system_profiler SPSoftwareDataType", "sistema.txt")

# Información de red
guardar_salida("ifconfig", "red.txt")
guardar_salida("netstat -anv", "conexiones.txt")

# Información de procesos
guardar_salida("ps aux", "procesos.txt")
guardar_salida("top -l 1 -o cpu", "procesos_detallados.txt")

# Información de hardware
guardar_salida("sysctl -n machdep.cpu.brand_string", "cpu.txt")
guardar_salida("vm_stat", "memoria.txt")
guardar_salida("df -h", "discos.txt")
guardar_salida("diskutil list", "discos_detallado.txt")

# Programas instalados
guardar_salida("ls /Applications", "programas.txt")

# Servicios (launch daemons)
guardar_salida("launchctl list", "servicios.txt")

# Usuarios locales
guardar_salida("dscl . list /Users", "usuarios.txt")

# Variables de entorno
guardar_salida("printenv", "entorno.txt")

# Información de BIOS (firmware)
guardar_salida("system_profiler SPHardwareDataType", "bios.txt")

# Eventos recientes (última hora)
guardar_salida("log show --predicate 'eventType == logEvent' --last 1h", "eventos.txt")

# Información de firewall (estado global)
guardar_salida("defaults read /Library/Preferences/com.apple.alf globalstate", "firewall.txt")

# Actualizaciones disponibles
guardar_salida("softwareupdate --list", "actualizaciones.txt")


cat("(+) Información del sistema guardada en la carpeta", dir_name, "\n")
# Rscript recolector_mac.R