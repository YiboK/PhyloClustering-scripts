library(phytools)
trees <- read.tree("dog-data/100k_taxa_cluster_1.trees")
for (i in 1:length(trees)){
  trees[[i]] = reroot(trees[[i]], which(trees[[i]]$tip.label=="Africanhuntingdog"))
}

writeNexus(trees, file="dog-data/100k_taxa_cluster_rooted_1.trees")

trees <- read.tree("dog-data/100k_taxa_cluster_2.trees")
for (i in 1:length(trees)){
  trees[[i]] = reroot(trees[[i]], which(trees[[i]]$tip.label=="Africanhuntingdog"))
}

writeNexus(trees, file="dog-data/100k_taxa_cluster_rooted_2.trees")

trees <- read.tree("dog-data/200k_taxa_cluster_1.trees")
for (i in 1:length(trees)){
  trees[[i]] = reroot(trees[[i]], which(trees[[i]]$tip.label=="Africanhuntingdog"))
}

writeNexus(trees, file="dog-data/200k_taxa_cluster_rooted_1.trees")

trees <- read.tree("dog-data/200k_taxa_cluster_2.trees")
for (i in 1:length(trees)){
  trees[[i]] = reroot(trees[[i]], which(trees[[i]]$tip.label=="Africanhuntingdog"))
}

writeNexus(trees, file="dog-data/200k_taxa_cluster_rooted_2.trees")


trees <- read.tree("dog-data/sample_100k.trees")
for (i in 1:length(trees)){
  if (i %% 1000 == 0){
    print(i)
  }
  trees[[i]] = reroot(trees[[i]], which(trees[[i]]$tip.label=="1"))
}
write.tree(trees, file='./dog-data/sample_100k_rooted.trees') 


trees <- read.tree("dog-data/sample_200k.trees")
for (i in 1:length(trees)){
  if (i / 1000 == 0){
    print(i)
  }
  trees[[i]] = reroot(trees[[i]], which(trees[[i]]$tip.label=="1"))
}
write.tree(trees, file='./dog-data/sample_200k_rooted.trees') 

trees <- read.tree("../../baobabs/kmeans_1.trees")
for (i in 1:length(trees)){
  trees[[i]] = reroot(trees[[i]], which(trees[[i]]$tip.label=="Smi165"))
}
write.tree(trees, file="../../baobabs/kmeans_rooted_1.trees") 

trees <- read.tree("../../baobabs/kmeans_2.trees")
for (i in 1:length(trees)){
  
  trees[[i]] = reroot(trees[[i]], which(trees[[i]]$tip.label=="Smi165"))
}
write.tree(trees, file="../../baobabs/kmeans_rooted_2.trees") 


trees <- read.tree("../../baobabs/hc_1.trees")
for (i in 1:length(trees)){
  
  trees[[i]] = reroot(trees[[i]], which(trees[[i]]$tip.label=="Smi165"))
}
write.tree(trees, file="../../baobabs/hc_rooted_1.trees") 


trees <- read.tree("../../baobabs/hc_2.trees")
for (i in 1:length(trees)){
  
  trees[[i]] = reroot(trees[[i]], which(trees[[i]]$tip.label=="Smi165"))
}
write.tree(trees, file="../../baobabs/hc_rooted_2.trees") 


trees <- read.tree("../../baobabs/trees.trees")
for (i in 1:length(trees)){
  
  trees[[i]] = reroot(trees[[i]], which(trees[[i]]$tip.label=="Smi165"))
}
write.tree(trees, file="../../baobabs/trees.trees") 