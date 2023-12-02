# PhyloClustering scripts

## Repo Description
This repo contains all scripts for testing models in [PhyloClustering.jl](https://github.com/solislemuslab/PhyloClustering.jl). All scripts in Python and Julia are writing in [Jupyter](http://jupyter.org) notebook.

## File Description
### Julia 
**4-taxa-tree-simulate.ipynb**: Simulates 4-taxon trees and 4-taxon network in bipartition format. Writes simulated trees into csv files. We set seeds for simulations so it can generate consistent trees.

**8-16-trees-simulate.ipynb**: Simulates 4-taxon trees and 4-taxon network in bipartition format. Writes simulated trees into csv or jld files. We set seeds for simulations so it can generate consistent trees.

**all-taxa-check.ipynb**: Tests repeating K-means and GMM on trees with all taxon number. Writes the clustering results into csv files. 

**bipartition-embedding-julia.ipynb**: Transforms trees from Newick format to bipartition format. Writes trees into csv files.

**bipartition-to-tree.ipynb**: Calculates the mean tree of the cluster. Transforms 4-taxon trees in bipartition fromat to unrooted trees. 

**clustering-julia.ipynb**: Checks if models work in Julia. Implements k-means, GMM, and DBSCAN. 

### Python

**biopython-ete-dendropy.ipynb**

**bipartition-embedding.ipynb**: Transforms trees from Newick format into bipartition format.
