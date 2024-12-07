library('Quartet')
library("profmem")

file = "../../data/8_concat.trees"

start.time <- Sys.time()
tree_8 <- AllPairsQuartetDistance(file) # 160048 bytes
end.time <- Sys.time()
time.taken_2 <- end.time - start.time # 14.61s
time.taken_2
write.table(tree_8,file="../../data/QD_8_200.txt", sep = ",",row.names=FALSE)


file = "../../data/8_2000_concat.trees"

start.time <- Sys.time()
tree_8 <- AllPairsQuartetDistance(file) # 160048 bytes
end.time <- Sys.time()
time.taken_2 <- end.time - start.time 
time.taken_2
write.table(tree_8,file="../../data/QD_8_2000.txt", sep = ",",row.names=FALSE)