# This file was generated, do not modify it. # hide
#hideall
using Plots
theme(:ggplot2)

b1 = 2.4
b2 = 1.0
c = 2.0

t = range(0.0, 2π, length = 100)
x = c / sqrt(b1^2 + b2^2) .* cos.(t)
y = c / sqrt(b1^2 + b2^2) .* sin.(t)

p1 = plot(xlims = (-3, 3), ylims = (-3, 3), title = "b₁ Y₁ + b₂ Y₂ ≤ c; b₁ = $b1, b₂ = $b2, c = $c", titlefont = 10)
hline!(p1, [0], color = :gray70, linewidth = 1, label = false)
vline!(p1, [0], color = :gray70, linewidth = 1, label = false)
plot!(p1, -3:3, x -> (c - b1 * x) / b2, label = false, color = 1)
scatter!(p1, (0, 0), label = false, color = 2)
plot!(p1, x, y, label = false, color = 3)

p2 = plot(xlims = (-3, 3), ylims = (-3, 3), title = "x ≤ c / √(b₁² + b₂²); b₁ = $b1, b₂ = $b2, c = $c", titlefont = 10)
hline!(p2, [0], color = :gray70, linewidth = 1, label = false)
vline!(p2, [0], color = :gray70, linewidth = 1, label = false)
vline!(p2, [c / sqrt(b1^2 + b2^2)], color = 1, label = false)
scatter!(p2, (0, 0), label = false, color = 2)
plot!(p2, x, y, label = false, color = 3)
plot(p1, p2, layout = 2, size = (800, 400))

savefig(joinpath(@OUTPUT, "combinacao_linear_normais_rotacao.svg"))