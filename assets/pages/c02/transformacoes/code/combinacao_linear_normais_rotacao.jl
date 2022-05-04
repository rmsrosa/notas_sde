# This file was generated, do not modify it. # hide
#hideall
using Plots
theme(:ggplot2)

b1 = 2.4
b2 = 1.0
c = 2.0

p1 = plot(xx, x -> (c - b1 * x) / b2, xlims = (-3, 3), ylims = (-3, 3), label = false, title = "b₁ Y₁ + b₂ Y₂ ≤ c; b₁ = $b1, b₂ = $b2, c = $c", titlefont = 10)
p2 = vline([c / sqrt(b1^2 + b2^2)], xlims = (-3, 3), ylims = (-3, 3), label = false, title = "x ≤ c / √(b₁² + b₂²); b₁ = $b1, b₂ = $b2, c = $c", titlefont = 10)
plot(p1, p2, layout = 2, size = (800, 400))

savefig(joinpath(@OUTPUT, "combinacao_linear_normais_rotacao.svg"))