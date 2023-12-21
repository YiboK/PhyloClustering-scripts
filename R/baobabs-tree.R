# R Script to visualize baobabs tree
#devtools::install_github("YuLab-SMU/ggtree")

## try http:// if https:// URLs are not supported
#if (!requireNamespace("BiocManager", quietly=TRUE))
#  install.packages("BiocManager")
## BiocManager::install("BiocUpgrade") ## you may need this
#BiocManager::install("treeio")

library(ggimage)
library(ggtree)

### Tree created to add hybrid edge later:

x <- read.tree(text="(Smic:18.12505298,(Agre:8.747492442,(Adig:8.308140028,(((Asua:3.171531094,Agra:3.171531094):2.767496398,(Azaa:1.381629136,(Aper:1.363263922,Amad:1.363263922):0.01836521346):4.555985647):0.1963665132,Arub:6.135394005):2.172746023):0.4393524143):9.377560535);")

ggtree(x) + geom_text(aes(label=node), hjust=-.3)

imgs <- data.frame(tips.label = x$tip.label ,img = paste0("./images/",x$tip.label,".png"))

p <- ggtree(x, size=2) %<+% imgs #+ xlim(NA, 6)
p <- flip(p, 15, 16)

png("./baobabs.png", width = 12, height = 6, units = "in", res = 600)
p + geom_tiplab(aes(image = img), geom="image", offset=0.2, align=F, size=.09, hjust=0)+
  geom_tiplab(geom='label', offset=1.75, hjust=.5, size=9.4)
dev.off()


## Tree for cluster 1

x <- read.tree(text="(Smic:18.12505298,(Agre:8.747492442,(Adig:8.308140028,(((Asua:3.171531094,Agra:3.171531094):2.767496398,(Aper:1.381629136,(Azaa:1.363263922,Amad:1.363263922):0.01836521346):4.555985647):0.1963665132,Arub:6.135394005):2.172746023):0.4393524143):9.377560535);")

## Checking node numbers:
ggtree(x) + geom_text(aes(label=node), hjust=-.3) + geom_tiplab(geom='label')
## we want to highlight clade at node 14


p1 <- ggtree(x, branch.length = "none", size=2) 
p1 <- flip(p1, 15, 16)

png("./baobabs-c1.png", width = 8, height = 6, units = "in", res = 600)
p1 + geom_tiplab(geom='label', offset=0.4, hjust=.5, size=5.5) + geom_hilight(node=14, fill="blue", alpha=0.2)
#geom_cladelabel(node=16, label="A different clade", ="blue", offset=.8, align=TRUE)
dev.off()

## Tree for cluster 2

x <- read.tree(text="(Smic:18.12505298,(Agre:8.747492442,((Asua:3.171531094,Agra:3.171531094):2.9638629112,(Adig:8.308140028,((((Azaa:1.381629136,(Aper:1.363263922,Amad:1.363263922):0.01836521346):2.095047043),Arub:3.476676179):2.658717826):0.4393524143):9.377560535)));")

## Checking node numbers:
ggtree(x) + geom_text(aes(label=node), hjust=-.3)
## we want to highlight clade at node 14

p2 <- ggtree(x, branch.length = "none", size=2) 
p2 <- flip(p2, 13, 14)

png("./baobabs-c2.png", width = 8, height = 6, units = "in", res = 600)
p2 + geom_tiplab(geom='label', offset=0.4, hjust=.5, size=5.5) + geom_hilight(node=16, fill="darkgreen", alpha=0.2)
#geom_cladelabel(node=16, label="A different clade", ="blue", offset=.8, align=TRUE)
dev.off()


## PCA plot
library(ggplot2)

dat = read.csv("cluster_PCA.csv", header=TRUE)

p <- ggplot(data=dat) + geom_point(aes(x=PC1, y=PC2, color=as.factor(label)),size=5, alpha=0.5)+
  xlim(c(-10,3))+ylim(c(-5,4))+xlab("")+ylab("")+theme_bw()+
  scale_color_manual(values=c("blue", "darkgreen"))+
  theme(legend.position = "none",
        axis.text.x=element_blank(),
        axis.text.y=element_blank())

png("./baobabs-pca.png", width = 6, height = 6, units = "in", res = 600)
p
dev.off()

## Other tree options

p <- ggtree(x, size=2) %<+% imgs #+ xlim(NA, 6)

png("./baobabs2.png", width = 12, height = 6, units = "in", res = 600)
p + geom_tiplab(aes(image = img), geom="image", offset=0.4, align=F, size=.05, hjust=0)+
  geom_tiplab(geom='label', offset=1, hjust=.5, size=5)
dev.off()