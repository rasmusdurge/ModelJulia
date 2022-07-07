#Lorenz + Tests

using PkgTemplates
template = Template(
    plugins = [
        GitHubActions(),
          # See PkgTemplates docs for all of the configuration options
    ],
    user = "rasmusdurge"
);

function lorenz63(u, p, t)
    x, y, z = u
    σ, ρ, β = p
   
    dx = σ * (y - x)
    dy = x * (ρ - z) - y
    dz = x * y - β * z
   
    return dx, dy, dz
   end
   