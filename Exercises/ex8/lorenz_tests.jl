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

   @testset "lorenz63.jl" begin
    u = [1.0, 1.0, 1.0]
    p = [10.0, 8 / 3, 28.0]
    t = 0.0
    @test all(lorenz63(u, p, t) .≈ (0.0, 2/3, -27.0))
end
   
