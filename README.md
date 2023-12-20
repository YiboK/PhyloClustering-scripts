# PhyloClustering scripts

## Repo Description
This repo contains all scripts for testing models in [PhyloClustering.jl](https://github.com/solislemuslab/PhyloClustering.jl). All scripts in Python and Julia are writing in [Jupyter](http://jupyter.org) notebook.

## File Description
### Julia 
**4-taxa-tree-simulate.ipynb**: Simulate 4-taxon trees and 4-taxon network in bipartition format. Writes simulated trees into csv files. We set seeds for simulations so it can generate consistent trees.

**8-16-trees-simulate.ipynb**: Simulate 4-taxon trees and 4-taxon network in bipartition format. Writes simulated trees into csv or jld files. We set seeds for simulations so it can generate consistent trees.

**all-taxa-check.ipynb**: Test repeating K-means and GMM on trees with all taxon number. Writes the clustering results into csv files. 

**baobabs-test.ipynb**: Test K-means and hierarchical clustering on Baobabs dataset.

**bipartition-embedding-julia.ipynb**: Transform trees from Newick format to bipartition format. Writes trees into csv files.

**bipartition-to-tree.ipynb**: Calculate the mean tree of the cluster. Transforms 4-taxon trees in bipartition fromat to unrooted trees. 

**clustering-julia.ipynb**: Check if models work in Julia. Implements k-means, GMM, and DBSCAN. 

**dog-data-test.ipynb**(Deprecated): Test K-means on Canis dataset.

**hierarchical-clustering.ipynb**: Implement and tests hierarchical clustering.

**nni-move-check.ipynb**: Test K-means and hierarchical clustering on trees with 0-5 NNIs.

**number-to-name.ipynb**(Deprecated): Change names of taxa from numbers to Canis species.

**random-sample-tree.ipynb**: Randomly choose 15 8-taxon trees and 15 16 taxon trees.

**tree-investigation.ipynb**: Investigate the visualization of the 16-taxon trees to determine if they are indeed separate clusters.

### Python

**bipartition-embedding.ipynb**: Transform trees from Newick format into bipartition format using the same algorithm in **bipartition-embedding-julia.ipynb**. Also check the performance of the algorithm.

**clustering-visualize.ipynb***: Test models (K-mean, GMM, and spectral clustering) and dimensionality reduction algorithms (PCA and t-SNE) for visulazation.

**clutering-check-python.ipynb**: Check performance of models (K-mean, GMM, and spectral clustering)

**data-clean.ipynb**(Deprecated): Change names of taxa from Canis species to numbers.

**hc-nni-heatmap.ipynb**: Visualize the results of hierarchical clustering and NNI tests.

**plot-heatmap.ipynb**: Visualize the results of K-means and GMM.

**print-bipartition.ipynb**: Transform trees from Newick format to bipartition format. Writes trees into csv files.

### R

**reroot-tree.R**: Reroot trees from Canis and Baobabs datasets.
