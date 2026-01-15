# setwd("alignment_1/bam1/")

library(dplyr)
library(ggplot2)
library(tidyverse)

direction_colors <- c("blue", "red")
direction_labels <- c("reverse", "forward")

bam_list <- read.delim("bam_list.txt", header = FALSE)

for (bam in bam_list$V1){
  strain_name <- sub(".bam","", bam)
  txt_file <- sub("$", ".txt", strain_name)
  strain <- read.delim(txt_file) 
  far_plot_file_name <- paste(strain_name,"far.png", sep = "_")
  close_plot_file_name <- paste(strain_name,"close.png", sep = "_")
  
  far_plot <- ggplot(data = strain, aes(x = position, y = length, color = as.factor(direction)))+
    geom_point()+
    scale_colour_manual(values = direction_colors, labels = direction_labels, name = "Direction")+
    geom_vline(xintercept = 5336, linetype = 2, linewidth = 1)+
    #8852597 - 8847261 = 5336 (insert start pos - first read start pos)
    geom_vline(xintercept = 14199, linetype = 2, linewidth = 1)+
    #8861461 - 8847261 = 14199 (insert end pos - first read start pos)
    labs(caption = strain_name)+
    theme_bw(base_size = 14)
  ggsave(far_plot_file_name, far_plot, width = 14, height = 7, units = "in")
  
  close_plot <- ggplot(data = strain, aes(x = position, y = length, color = as.factor(direction)))+
    geom_point()+
    scale_colour_manual(values = direction_colors, labels = direction_labels, name = "Direction")+
    geom_vline(xintercept = 5336, linetype = 2, linewidth = 2)+
    #8852597 - 8847261 = 5336 (insert start pos - first read start pos)
    geom_vline(xintercept = 14199, linetype = 2, linewidth = 2)+
    #8861460 - 8847261 = 14199 (insert end pos - first read start pos)
    labs(caption = strain_name)+
    theme_bw(base_size = 14)+
    ylim(-300, 300)
  ggsave(close_plot_file_name, close_plot, width = 14, height = 7, units = "in")

}


  
  






