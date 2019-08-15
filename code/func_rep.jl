#=
Functional response
=#

using DifferentialEquations, ParameterizedFunctions, Plots

# The basic functional response

function HollingFR(p, R)
    Rq = R ^ (1+p[:q])
    fr = (p[:a] * Rq) / (1 + (p[:h] * p[:a] * Rq))
    return fr
end

p = Dict(:a => 0.9, :h => 1.5, :q => 1.0)

C = []
R = 0:0.01:5.0
for i in R
    cons = HollingFR(p, i)
    append!(C, [cons])
end

plot(collect(R), float.(C), ylabel = "consumer biomass", xlabel = "prey biomass", label = "f(R)", leg = :bottomright)

hline!([1/p[:h]], linestyle = :dash, c = :black, label = "max. biomass = 1/h")
vline!([1/(p[:h] * p[:a])], linestyle = :dash, c = :red, label = "R0 = 1/(h*a)")

plot(collect(R), float.(C) ./ collect(R), ylabel = "prey mortality rate", xlabel = "prey biomass", leg = false)

# Multi-species functional response

function FR(p, R)
    Rq = R .^ (1 .+ p[:q])
    num = p[:a] .* Rq
    denom = 1 + sum(p[:h] .* p[:a] .* Rq)
    fr = num ./ denom
    return fr
end

p = Dict(:a => [0.9, 0.8, 0.5], :h => [1.2, 1.5, 0.9], :q => 0.0)

C = []
R = 0:0.01:5.0
for i in R
    cons = FR(p, i)
    append!(C, [hcat(cons)])
end
C = vcat(C'...)

plot(collect(R), C, ylabel = "consumer biomass", xlabel = "prey biomass", label = ["f(R1)" "f(R2)" "f(R3)"], leg = :bottomright)
