# This file was generated, do not modify it. # hide
#hideall
using Plots
theme(:ggplot2)
a = 10
b = 1
m = 9999
x0 = 0

X = Vector{Float64}(undef, m - 1)
X[1] = x0 
for i in 2:m-1
    X[i] = mod( a * X[i-1] + b, m)
end

p1 = scatter(1:m-1, X, title = "Sequência gerada\n(a = $a, b = $b, m = $m)", titlefont = 10, label = false, markersize = 1)

p2 = histogram(X, label = false, xaxis = "X", yaxis = "contagem", title = "Histograma", titlefont = 10, bins = 50)

plot(p1, p2, layout = 2, size = (800, 400))
savefig(joinpath(@OUTPUT, "randomlcg1.svg"))