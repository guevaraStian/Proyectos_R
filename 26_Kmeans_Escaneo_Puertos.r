# En este codigo, se muestra un escaneo de puertos con la libreria kmeans de R
# install.packages("gggplot2")
# En la siguiente funcion se indicar el recorrido de los puestos con un for
scan_ports <- function(host, ports) {
  results <- data.frame(port = integer(), time = numeric(), status = character())

  for (port in ports) {
    start_time <- Sys.time()
    con <- try(socketConnection(host = host, port = port, timeout = 1, open = "r+"), silent = TRUE)
    end_time <- Sys.time()
    time_taken <- as.numeric(difftime(end_time, start_time, units = "secs")) * 1000  # en milisegundos

    # Si sale un error es porque esta closed, 
    # Si sale diferente a error es porque esta abierto
    if (!inherits(con, "try-error")) {
      status <- "open"
      close(con)
    } else {
      status <- "closed"
    }

    results <- rbind(results, data.frame(port = port, time = time_taken, status = status))
  }

  return(results)
}

# Se indica la ip o nombre del dispositivo a analizar
host <- "scanme.nmap.org"
# Se especifican los puestos a evaludar si estan abiertos
ports <- c(20, 43, 445)

# Se de clara la variable de escanear y se muestra en pantalla
# El resultado de la escaneada
port_data <- scan_ports(host, ports)
print(port_data)

# Clustering con kmeans (en el tiempo de respuesta)
set.seed(123)
km <- kmeans(port_data$time, centers = 2)  # Agrupar en 2 clusters

# Agregar cluster al dataframe
port_data$cluster <- as.factor(km$cluster)

# Mostrar resultados
print(port_data)

# Se muestra la grafica de los datos en ggplot2
if (requireNamespace("ggplot2", quietly = TRUE)) {
  library(ggplot2)
  ggplot(port_data, aes(x = port, y = time, color = cluster, shape = status)) +
    geom_point(size = 4) +
    labs(title = "Clustering de puertos por tiempo de respuesta",
         x = "Puerto", y = "Tiempo (ms)") +
    theme_minimal()
}














