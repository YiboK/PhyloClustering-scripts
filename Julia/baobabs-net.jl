# Julia script to plot the final version of the baobabs network
# for the paper
# Claudia (Dec 2023)

using PhyloNetworks, PhyloPlots

net1 = readTopology("(Smic:18.12505298,(Agre:8.747492442,(Adig:8.308140028,((#H1:0.0::0.117935,Arub:3.476676179):2.658717826,((Asua:3.171531094,Agra:3.171531094):2.767496398,((Azaa:1.381629136,(Aper:1.363263922,Amad:1.363263922):0.01836521346):2.095047043)#H1:2.460938604::0.882065):0.1963665132):2.172746023):0.4393524143):9.377560535);")
rootatnode!(net1, "Smic")

plot(net1, :R, showGamma=true)

tr = majorTree(net1)
writeTopology(tr)