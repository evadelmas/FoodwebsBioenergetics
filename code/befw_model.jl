using BioEnergeticFoodWebs, CSV, Plots

FWdata = CSV.read("data/Wood2015_foodwebdata.csv", header = false)
A = convert(Matrix, FWdata)

p = model_parameters(A, h = 1.0)
b = rand(size(A,1))

s = simulate(p, b, stop = 500)
plot(s[:B], leg = false, ylabel = "biomass", xlabel = "t", color_palette = :RdYlGn)
