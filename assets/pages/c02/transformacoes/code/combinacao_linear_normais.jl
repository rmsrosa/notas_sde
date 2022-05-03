# This file was generated, do not modify it. # hide
#hideall
using Plots
theme(:ggplot2)

xx = range(-3, 3, length = 100)
yy = range(-3, 3, length = 100)

b1 = 1.2
b2 = 0.5
c = 0.2

f(x, y) = exp(-(x^2 + y^2)/2) / sqrt(2π)

wireframe(xx, yy, (x, y) -> (b1 * x + b2 * y ≤ c) * f(x, y), zlims=(0, 1), display_option=Plots.GR.OPTION_SHADED_MESH, color = :reds, title = "ℙ(b₁ Y₁ + b₂ Y₂ ≤ c); b₁ = $b1, b₂ = $b2, c = $c", titlefont = 10)
savefig(joinpath(@OUTPUT, "combinacao_linear_normais1.svg"))

wireframe(xx, yy, (x, y) -> (x ≤ c / sqrt(b1^2 + b2^2)) * f(x, y), zlims=(0, 1), display_option=Plots.GR.OPTION_SHADED_MESH, color = :reds, title = "ℙ( Y₁  ≤ c / √(b₁² + b₂²)); b₁ = $b1, b₂ = $b2, c = $c", titlefont = 10)
savefig(joinpath(@OUTPUT, "combinacao_linear_normais2.svg"))