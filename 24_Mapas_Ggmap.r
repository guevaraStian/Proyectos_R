# En este codio se muestra un ejemplo de un mapa con R
# install.packages("ggmap")
# Instalar ggmap si no lo tienes
install.packages("ggmap")

# Cargar la librería
library(ggmap)


# Obtener un mapa de la ciudad de Buenos Aires
mapa_bsas <- get_map(location = "Buenos Aires", zoom = 12, source = "stadia", maptype = "terrain")

# Mostrar el mapa
ggmap(mapa_bsas)


# Crear un data frame con coordenadas
lugares <- data.frame(
  nombre = c("Obelisco", "Casa Rosada"),
  lon = c(-58.3816, -58.3702),
  lat = c(-34.6037, -34.6081)
)

# Mostrar el mapa con los puntos
ggmap(mapa_bsas) +
  geom_point(data = lugares, aes(x = lon, y = lat), color = "red", size = 3) +
  geom_text(data = lugares, aes(x = lon, y = lat, label = nombre), vjust = -1)


# Registrar la API key de Google
register_google(key = "TU_API_KEY")

# Obtener un mapa con Google Maps
mapa_google <- get_map(location = "Buenos Aires", zoom = 12, source = "google", maptype = "roadmap")
ggmap(mapa_google)


























