# Este codigo nos muestra una forma sencilla de realizar
# Escaneo de puertos con socket de R

# Se crea la funcion que lleva la direccion victima y los puertos a escanear
scan_ports <- function(host, ports) {
  open_ports <- c()
  for (port in ports) {
    con <- try(socketConnection(host = host, port = port, timeout = 1, open = "r+"), silent = TRUE)
    if (!inherits(con, "try-error")) {
      open_ports <- c(open_ports, port)
      close(con)
    }
  }
  return(open_ports)
}

# Variables que se le ingresan a la funcion
host <- "scanme.nmap.org"  # Host público de prueba (de Nmap)
ports <- 20, 43, 445  # Rango de puertos
print(open_ports <- scan_ports(host, ports))

cat("Puertos abiertos encontrados:\n")
print(open_ports)






















