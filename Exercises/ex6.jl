#Exercise 6

#Lets do the rössler system

using DifferentialEquations , Plots, DynamicalSystems, CairoMakie

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

traj_1d = data[:,1]

#Given your one-dimensional time series, use the
#pecuzal_embedding routine from DynamicalSystems.jl to 
#estimate the optimal embedding dimension and 
#delays for the Rössler system.

#theiler = estimate_delay(timeseries_1d, "mi_min")  # Estimate a Theiler window
#Y, τ_vals, ts_vals, Ls, εs = pecuzal_embedding(timeseries_1d, w = theiler)

#println()
#println("Optimal τ_vals = ", τ_vals)

#Lyapunov


E = lyapunov_from_data(τ_vals , ks) 