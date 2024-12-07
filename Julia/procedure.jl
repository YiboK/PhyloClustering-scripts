using JLD
using FileIO
using SparseArrays
using CSV
using Distances
using Clustering
using DataFrames
using MultivariateStats
using PhyloClustering
using ParallelKMeans
using Hungarian
using MLBase
using LinearAlgebra

function ground_true(df_1, df_2)
    a = fill(1, size(df_1)[1])
    b = fill(2, size(df_2)[1])
    gt = cat(a, b, dims=1)
    return gt
end

function accuracy(n, gt, pred)
    matrix = confusmat(n, gt, pred)
    # Hungarian algorithm minimizes the cost, so we need to transform the matrix
    A = -matrix .+ maximum(matrix)
    matrix = matrix[:, hungarian(A)[1]]
    x = tr(matrix) / sum(matrix)
    return matrix, x
end

function rep_kmeans_matrix(trees, path)
    n = length(trees)
    result = zeros(n, n)
    for i in 2:n
        for j in 1:(i-1)
            gt = ground_true(trees[i], trees[j])
            tree = vcat(trees[i], trees[j])
            tree = standardize_tree(Matrix(tree))
            distances = distance(tree)
            M = fit(MDS, distances; maxoutdim=5, distances=true)
            Y = predict(M)
            for k in 1:5
                kmeans_pred = ParallelKMeans.kmeans(Yinyang(), Y, 2)
                m, x = accuracy(2, gt, kmeans_pred.assignments)
                if x > result[i, j]
                    result[i, j] = x
                    result[j, i] = x
                end
            end
        end
    end
    header = Vector(1:n)
    header = string.(header)
    CSV.write(path, DataFrame(result, :auto), header=header)
end

for i in 1:100
    print("$i ")
    trees = []
    for j in 1:15
        path = "data/4_diff_topo_" * string(j) * "_500_" * string(i) * ".csv"
        tree = CSV.read(path, DataFrame)
        push!(trees, tree)
    end
    hc_matrix(trees, "result/hc/hc_4_diff_topo_500_" * string(i) * ".csv")
end
