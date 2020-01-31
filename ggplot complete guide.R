data("iris")

library(ggplot2)

# Predefined Colors

color_space=data.frame(c=colors(), y=seq(0, length(colors())-1)%%66, x=seq(0, length(colors())-1)%/%66)
ggplot() +scale_x_continuous(name="", breaks=NULL, expand=c(0, 0)) +scale_y_continuous(name="", breaks=NULL, expand=c(0, 0)) +scale_fill_identity() +geom_rect(data=d, mapping=aes(xmin=x, xmax=x+1, ymin=y, ymax=y+1), fill="white") +geom_rect(data=d, mapping=aes(xmin=x+0.05, xmax=x+0.95, ymin=y+0.5, ymax=y+1, fill=c)) +geom_text(data=d, mapping=aes(x=x+0.5, y=y+0.5, label=c), colour="black", hjust=0.5, vjust=1, size=3)

# Hue & Saturation

color_space=expand.grid(h=seq(0,0.95,0.05), s=seq(0,0.95,0.05), v=seq(0,1,0.2))
ggplot() + coord_polar(theta="x") +facet_wrap(~v) +scale_x_continuous(name="hue", limits=c(0,1), breaks=seq(0.025,0.925,0.1), labels=seq(0,0.9,0.1)) +scale_y_continuous(name="saturation", breaks=seq(0, 1, 0.2)) +scale_fill_identity() +geom_rect(data=d, mapping=aes(xmin=h, xmax=h+resolution(h), ymin=s, ymax=s+resolution(s), fill=hsv(h,s,v)), color="white", size=0.1)

#Hue Chroma Luminance

color_space=expand.grid(h=seq(0,350,10), c=seq(0,100,5), l=seq(0,100,20))
ggplot() +coord_polar(theta="x")+facet_wrap(~l) +scale_x_continuous(name="hue", limits=c(0,360), breaks=seq(5,345,20), labels=seq(0,340,20)) +scale_y_continuous(name="chroma", breaks=seq(0, 100, 20)) +scale_fill_identity() +geom_rect(data=d, mapping=aes(xmin=h, xmax=h+resolution(h), ymin=c, ymax=c+resolution(c), fill=hcl(h,c,l)), color="white", size=0.1)

#RGB Colorspace

color_space=expand.grid(r=seq(0,1,0.1), g=seq(0,1,0.1), b=seq(0,1,0.1))
ggplot() +facet_wrap(~b) +scale_x_continuous(name="red", breaks=seq(0.05, 1.05, 0.2), labels=seq(0, 1, 0.2)) +scale_y_continuous(name="green", breaks=seq(0.05, 1.05, 0.2), labels=seq(0, 1, 0.2)) +scale_fill_identity() +geom_rect(data=d, mapping=aes(xmin=r, xmax=r+resolution(r), ymin=g, ymax=g+resolution(g), fill=rgb(r,g,b)), color="white", size=0.1)

#Plotting Lines

line_plot <- ggplot(iris, aes(Species,Sepal.Length)) + geom_point()  

# Using geom_vline()

line_plot + geom_vline(xintercept = 1:5)

# Using geom_hline()

line_plot + geom_hline(yintercept = 5)

# Using geom_abline()

line_plot + geom_abline(intercept = 5)

# Bar plot

ggplot(data=iris,aes(x=Species,y=Petal.Length,color=Species)) + geom_bar(stat = "summary", fun.y = "mean") 
  
# heat map of 2d bin

heat_map <- ggplot(diamonds, aes(x, y)) + xlim(1, 13) + ylim(12, 5)
heat_map + geom_bin2d()

# Box plots with notch

box_plot <- ggplot(iris, aes(Species, Sepal.Length))
box_plot + geom_boxplot(notch = TRUE)

#Flipped box plots with notches

box_plot + geom_boxplot(notch = TRUE) + coord_flip()

# 2d to 3d plots

vis <- ggplot(faithfuld, aes(waiting, eruptions, z = density))
vis + geom_raster(aes(fill = density)) + geom_contour(colour = "yellow")

# fill color:

k <- ggplot(iris, aes(iris$Species, fill = factor(iris$Sepal.Width)))
k + geom_bar()

# Line type

df <- data.frame(x = 1:10 , y = 1:10)
f <- ggplot(df, aes(x, y))
f + geom_line(linetype = 10)

# Scale Alpha

p <- ggplot(iris, aes(iris$Sepal.Length, iris$Sepal.Width)) +
  geom_point(aes(alpha = iris$Petal.Width))
p + scale_alpha("cylinders")

# Scale color fill

v <- ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
  geom_tile()
v + scale_fill_continuous(type = "viridis")

# labels with mathematical symbols

p <- ggplot(iris, aes(iris$Sepal.Length, iris$Sepal.Width)) + geom_point()
p + facet_grid(iris$Species ~ ., labeller = label_bquote(alpha ^ .(iris$Species)))

  