install.packages("hexSticker")
library(hexSticker)
library(showtext)
library(ggplot2)
## Loading Google fonts (http://www.google.com/fonts)
font_add_google("Roboto mono")
## Automatically use showtext to render text for future devices
showtext_auto()

img <- "img/heximage.png"

sticker(img, 
        package="govscienceuseR", 
        h_fill="#03989e", h_color="#d9d9d9",
        p_size=4.5, p_color = "white",
        s_x=1, s_y=.82 ,
        s_width=.65,  
        p_family = "Roboto mono", filename="img/hexsticker.png")
