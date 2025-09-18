# En este codigo, se muestra como cerar un software que extrae informacion
# De un sistema operativo Android

timestamp <- format(Sys.time(), "%Y%m%d_%H%M%S")
hostname <- system("adb shell getprop ro.product.model", intern = TRUE)
dir_name <- paste0("Info_Android_", gsub(" ", "_", hostname), "_", timestamp)
dir.create(dir_name)
setwd(dir_name)


guardar_salida_adb <- function(comando, archivo) {
  salida <- tryCatch(system(paste("adb shell", comando), intern = TRUE),
                    error = function(e) paste("ERROR:", e$message))
  writeLines(salida, archivo)
}


# Información general del sistema
guardar_salida_adb("getprop", "sistema.txt")

# Información de red
guardar_salida_adb("ip addr show", "red.txt")
guardar_salida_adb("netstat -an", "conexiones.txt")

# Información de procesos
guardar_salida_adb("ps -A", "procesos.txt")
guardar_salida_adb("top -n 1 -b", "procesos_detallados.txt")

# Información de hardware
guardar_salida_adb("cat /proc/cpuinfo", "cpu.txt")
guardar_salida_adb("cat /proc/meminfo", "memoria.txt")
guardar_salida_adb("df -h", "discos.txt")

# Programas instalados (apps)
guardar_salida_adb("pm list packages -f", "programas.txt")

# Servicios en Android (muy diferente a Windows)
guardar_salida_adb("service list", "servicios.txt")

# Usuarios (Android suele tener pocos usuarios)
guardar_salida_adb("pm list users", "usuarios.txt")

# Variables de entorno
guardar_salida_adb("printenv", "entorno.txt")

# Información del BIOS/firmware
guardar_salida_adb("cat /proc/version", "bios.txt")

# Eventos recientes (logs del sistema)
guardar_salida_adb("logcat -d -t 20", "eventos.txt")

# Información del firewall (Android usa iptables)
guardar_salida_adb("iptables -L -v -n", "firewall.txt")

# Actualizaciones (no hay comando directo, pero puedes listar actualizaciones de apps)
guardar_salida_adb("pm list packages -u", "actualizaciones.txt")




cat("(+) Información del sistema guardada en la carpeta", dir_name, "\n")
# Rscript recolector_mac.R