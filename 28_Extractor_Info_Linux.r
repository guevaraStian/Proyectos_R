# En este codigo, se muestra como cerar un software que extrae informacion
# De un sistema operativo Linux

timestamp <- format(Sys.time(), "%Y%m%d_%H%M%S")
hostname <- system("hostname", intern = TRUE)
dir_name <- paste0("Info_Linux_", hostname, "_", timestamp)
dir.create(dir_name)
setwd(dir_name)


guardar_salida <- function(comando, archivo) {
  salida <- tryCatch(system(comando, intern = TRUE), 
                    error = function(e) paste("ERROR:", e$message))
  writeLines(salida, archivo)
}

# Información general del sistema
guardar_salida("uname -a", "sistema.txt")
guardar_salida("lsb_release -a 2>/dev/null || cat /etc/os-release", "distro.txt")

# Información de red
guardar_salida("ip addr show", "red.txt")
guardar_salida("netstat -tulnp", "conexiones.txt")

# Información de procesos (ordenados por uso CPU)
guardar_salida("ps aux --sort=-%cpu", "procesos.txt")

# Información de hardware
guardar_salida("lscpu", "cpu.txt")
guardar_salida("free -h", "memoria.txt")
guardar_salida("lsblk -o NAME,SIZE,TYPE,MOUNTPOINT", "discos.txt")
guardar_salida("lspci", "hardware_pci.txt")

# Programas instalados (para Debian/Ubuntu)
guardar_salida("dpkg-query -W -f='${binary:Package} ${Version}\\n'", "programas.txt")
# O para RPM (CentOS/Fedora)
# guardar_salida("rpm -qa", "programas.txt")

# Servicios activos
guardar_salida("systemctl list-units --type=service --state=running", "servicios_activos.txt")

# Usuarios del sistema
guardar_salida("cat /etc/passwd", "usuarios.txt")

# Variables de entorno
guardar_salida("printenv", "entorno.txt")

# Información del BIOS
guardar_salida("sudo dmidecode -t bios", "bios.txt")

# Últimos eventos del sistema (últimas 20 líneas del syslog)
guardar_salida("tail -n 20 /var/log/syslog", "eventos.txt")

# Información de firewall (iptables)
guardar_salida("sudo iptables -L -v -n", "firewall.txt")

# Información de actualizaciones pendientes (Debian/Ubuntu)
guardar_salida("apt list --upgradable 2>/dev/null", "actualizaciones.txt")

cat("(+) Información del sistema guardada en la carpeta", dir_name, "\n")
# Rscript info_linux.R