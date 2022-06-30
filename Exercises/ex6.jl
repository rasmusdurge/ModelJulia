#Exercise 6

#Lets do the rössler system

using DifferentialEquations , Plots, DynamicalSystems, CairoMakie, Plots

ds = Systems.roessler()

data = trajectory(ds , 1000.0 , Ttr = 100.0 , Δt = 0.05)

#Plot attractor

fig = Figure(resolution = (1000,700))

xs = data[:,1]
ys = data[:,2]
zs = data[:,3]
Axis(fig[1, 1])

#lines!(Axis(fig[1, 1], xlabel = "x", ylabel = "y"), xs, ys, linewidth=1)
#lines!(Axis(fig[1,2] , xlabel = "x" , ylabel = "z") , xs , zs , linewidth = 1 )
#lines!(Axis(fig[1,3] , xlabel = "y" , ylabel = "z") , ys , zs , linewidth = 1 )

fig

#One dimensional time series

timeseries_1d = data[:,1]

#Given your one-dimensional time series, use the
#pecuzal_embedding routine from DynamicalSystems.jl to 
#estimate the optimal embedding dimension and 
#delays for the Rössler system.

#theiler = estimate_delay(timeseries_1d, "mi_min")  # Estimate a Theiler window
#Y, τ_vals, ts_vals, Ls, εs = pecuzal_embedding(timeseries_1d, w = theiler)

#println()
#println("Optimal τ_vals = ", τ_vals)

#Lyapunov
τ_vals = τ_vals
data_embedded = embed(timeseries_1d , 3 , τ_vals[2:3])

#fig = Figure(resoluton = (1000,1200))
#ax = Axis(fig[1,1]; xlabel = "k (0.05*t)" , ylabel = "E - E(0)")
#ks = 1:1:50
#Δt = 0.05
#E = lyapunov_from_data(data_embedded , ks)
#λ = linear_region(ks.*Δt , E)[2]
#lines!(ax, E.-E[1], ks.*Δt, linewidth=1)


""""
Lets do a function that takes care of this:
Function should calculate the lyapunov_from_data
Calculate the slope λ
And plot.

data is input data
ks is interval
"""
    

function lyapunovexp(data, ks, Δt)
    fig = Figure(resolution = (1000,1200))
    ax = Axis(fig[1,1]; xlabel="k (0.05×t)", ylabel="E - E(0)")
    E = lyapunov_from_data(data , ks)
    λ = linear_region(ks .* Δt, E)[2]
    lines!(ks, E.-E[1]; label = "d=$(data_embedded), τ=$(τ_vals), λ=$(round(λ, digits = 3))")
    axislegend
    ax.title = "Continuous Reconstruction Lyapunov"
    fig
end
lyapunov(ds, 10000, Ttr = 100)

