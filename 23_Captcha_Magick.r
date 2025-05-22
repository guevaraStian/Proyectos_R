# En este codio se muestra un ejemplo de un captcha sencillo
# install.packages("magick")

library(magick)

# Función para generar texto aleatorio
generate_captcha_text <- function(length = 5) {
  paste0(sample(c(LETTERS, 0:9), length, replace = TRUE), collapse = "")
}

# Crear la imagen del captcha
generate_captcha_image <- function(text) {
  # Crear una imagen blanca
  img <- image_blank(width = 200, height = 80, color = "white")

  # Escribir el texto en una posición aleatoria
  img <- image_annotate(img, text,
                        size = 40,
                        font = "Arial",
                        color = "black",
                        location = "+20+50",
                        gravity = "northwest",
                        degrees = runif(1, -10, 10)) # rotación leve

  # Añadir ruido o distorsión (opcional)
  img <- image_noise(img, noisetype = "gaussian")
  img <- image_implode(img, factor = 0.2)

  return(img)
}

# Generar texto y CAPTCHA
captcha_text <- generate_captcha_text()
captcha_image <- generate_captcha_image(captcha_text)

# Mostrar
print(paste("Texto CAPTCHA generado:", captcha_text))
print(captcha_image)









































