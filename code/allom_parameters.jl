#=
Model parameterization: example with the max. cons. rate
=#

#allometric relationship
function metab_rate(a, M)
    x = a * M ^ -0.25
end

X = []
for M in 1:1:100
    x = metab_rate(0.88, M)
    append!(X, x)
end

plot(collect(1:1:100), float.(X))
