#Exercise 5

using Plots , DynamicalSystems, DifferentialEquations

#Defining function
function lorenz!(du,u,p,t)
    x , y ,z = u
    σ , ρ , β = p

    du[1] = dx = σ*(y-x)
    du[2] = dy = x*(ρ-z) - y
    du[3] = dz = x*y - β*z

end

#Plot lorenz
