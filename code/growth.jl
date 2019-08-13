#=
Autotrophic producers growth models
=#

using DifferentialEquations, ParameterizedFunctions, Plots

# Logistic growth

f = @ode_def logistic_growth begin
    dx = r * (1 - (x / K)) * x
end r K

b0 = [0.2]
tspan = (0.0, 15.0)
p = [1.0, 10.0]

prob = ODEProblem(f,b0,tspan,p)
sol = solve(prob)

plot(sol, ylabel = "biomass", label = "B(t)")
hline!([10], linestyle = :dash, c = :black, label = "Carrying capacity")

# Competition

function competitive_growth(derivative, b, parameters::Dict{Symbol,Any}, t)
    compete_with = sum(b' .* parameters[:α], dims = 2)
    G = 1 .- (compete_with ./ parameters[:K])
    growth = parameters[:r] .* G .* b
    for i in eachindex(growth)
        derivative[i] = growth[i]
    end
    return growth
end

#competitive community of 3 producers
parameters = Dict(:α => [1.0 1.0 1.0 ; 1.0 1.0 1.0 ; 1.0 1.0 1.0],  #competition matrix
                  :K => 10.0,                                       #carrying capacity
                  :r => [1.0, 1.0, 1.0])                            #intrinsic growth rate

b = rand(3)
tspan = (0.0, 100.0)

prob = ODEProblem(compet_growth, b, tspan, parameters)
sol = solve(prob)
plot(sol, labels = ["B1(t)" "B2(t)" "B3(t)"], ylabel = "biomass")
