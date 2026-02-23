library(ggplot2)
data(mpg)
mpg

# ggplot(data = DATA) + GEOM_FUNCTION(mapping = aes(MAPPINGS))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy,color=class))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = manufacturer, y = hwy ,color=year))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy),color="2")

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv, colour = drv))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(col = class)) +
  geom_smooth(inherit.aes = TRUE) # default is TRUE, so we can omit it

?geom_smooth

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, col = class)) +
  geom_point(size = 3, alpha = 0.7) + # Larger points with transparency
  geom_smooth(se = FALSE, linetype = "dashed", linewidth = 1.2, span = 1.5) + # Smoother lines without confidence interval
  scale_color_brewer(palette = "Set1") + # Use a colorblind-friendly palette
  labs(
    title = "Fuel Efficiency vs Engine Displacement",
    subtitle = "Relationship between engine size and highway fuel efficiency across car types",
    x = "Engine Displacement (liters)",
    y = "Highway Fuel Efficiency (mpg)",
    color = "Vehicle Class"
  ) +
  theme_minimal(base_size = 15) + # Clean minimalistic theme
  theme(
    plot.title = element_text(face = "bold", size = 18, hjust = 0.5),
    plot.subtitle = element_text(size = 14, hjust = 0.5),
    legend.position = "bottom", # Move legend to the bottom
    legend.title = element_text(size = 12),
    legend.text = element_text(size = 10)
  )

library(maps)
ind<-map_data("india")
