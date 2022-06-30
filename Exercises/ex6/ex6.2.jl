#2

#Fractals

#1. Estimate the fractal dimension of the 
#Lorenz attractor with the Grassberger Procaccia 
#Correlation dimension and the Kaplan-Yorke dimension.

using DifferentialEquations , DynamicalSystems , Distances , StatsBase , CairoMakie , Plots

ds = Systems.lorenz()
tr = trajectory(ds , 1000.0 , Ttr = 100.0, Δt = 0.05)

mat = Matrix(tr)
N_p = size(mat,1)

dist = pairwise(Euclidean(),mat,mat,dims=1); # we compute the pairwise distance of each point in the trajectory to each other
N(i,ϵ) = length(findall(dist[i,:] .< ϵ)) - 1# we can use this pairwise distance to find all points within ϵ of point i (but don't count the point itself)
C(ϵ) = sum([N(i,ϵ) for i=1:N_p]) # the definition says to average over x, but when we have the attractor sufficiently densely covered in points, there is no differnece in just averages over b

ϵ_range = exp.(-3:0.25:3) # exponential, so that its uniformly distributed in log(ϵ)
C_vals = zeros(length(ϵ_range))
Threads.@threads for i ∈ eachindex(ϵ_range) # this is a threadsafe loop, there are no race conditions as each thread writes in a different part of the array
    C_vals[i] = C(ϵ_range[i])
end
scatter(log.(ϵ_range),log.(C_vals))
3.97792