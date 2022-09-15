#install.packages('ragg')
library(cowplot)
library(ggthemes)
library(readxl)
library(hablar)
library(dplyr)
library(tidyr)
library(streamgraph)

# This script generates a streamgraph plot based on the Python word counter. 

# Datawranging

## Read Excel

#df = read_excel('../Dokumente/Publikationen DB/Auswertung Gesch?ftsberichte/freq_relative.xlsx')
#df <- data.frame(df)
# df

## Read CSV: 

df = read.csv(file= '../Dokumente/Publikationen DB/pdfs/frequency_count_relative_2022_.csv', encoding="UTF-8")

# df <- df[-c(6),] # Drop a column


## Transform from wide to long dataframe.

df_long <- gather(df, Schlagwort, Wert, Verkehrswende:Wettbewerb, factor_key=TRUE)
#df_long

## Transform df to tibble (simple df) and convert types of columns (dbl and chr) to improve performance.
df_long <- as_tibble(df_long)

df_long <- df_long %>% 
  convert(dbl(Jahr)) %>%
  convert(chr(Schlagwort))

# Generate streamgraph through ggplot2

library(ggstream)
library(ggplot2)
library(paletteer) # Helpful tipps via https://github.com/EmilHvitfeldt/r-color-palettes


# cols <- c("#627281", "#d8d4cf", "#d8d4cf", "#eff0f4", "#faf4e8", "#BFBDC0", "#d8d4cf", "#B29F91", "#CB8A58", "#B05C38") 
base <- ggplot(df_long, aes(x = Jahr, y = Wert, fill = Schlagwort)) +
  expand_limits(y = 50) +
  cowplot::theme_minimal_vgrid(font_size = 30) +
  ylab("relative Häufigkeit") + xlab("Jahresbericht") +
  theme(text = element_text(family = "Open Sans", size = 30),
        plot.margin = margin(2,0,0,.5, "cm")) +

  scale_colour_manual(values = paletteer::paletteer_d("werpals::jozi")) + # khroma::sunset
  scale_fill_manual(values = paletteer::paletteer_d("werpals::jozi") ) # don't forget to add "+"

  # remove the next hashtag to create the graph without extra span
  #geom_stream(color = "white", bw = 0.85) + # The higher `bw` value (standard: 0,7) makes the stream smoother.

  # additional manual options
  #theme(legend.position = "none") +
  #scale_fill_manual(values = cols)  

# Generate the final graph
(base  + geom_stream(bw = 0.85, extra_span = .15, sorting = "onset") + geom_stream(bw = 0.85, extra_span = .15, true_range = "none", alpha = .3, sorting = "onset")) 

# Save file with extra high res (via the 'cairo' package). Otherwise the lines will be rigged.
ggsave("../Dokumente/Publikationen DB/Auswertung Geschäftsberichte/streamgraph_Geschäftsberichte.png", type= "cairo", width = 20, height = 15, pointsize = 35)


