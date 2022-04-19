# This file was generated, do not modify it. # hide
#hideall
using Plots
theme(:ggplot2)
μ = 2.0
σ = 1.0 
xx = -2.0:0.01:6.0
plot(xx, (2π * σ^2) .* exp.( - ( ( xx .- μ ).^ 2) ./ (2σ^2) ), fill = true, title = "Função densidade de probabilidades da distribuição normal (μ = $μ, σ = $σ)", titlefont = 10, label = false)
yy = [μ - 2σ μ - σ μ μ + σ μ + 2σ] |> xx -> (2π * σ^2) .* exp.( - ( ( xx .- μ ).^ 2) ./ (2σ^2) )
plot!([μ - 2σ μ - σ μ μ + σ μ + 2σ; μ - 2σ μ - σ μ μ + σ μ + 2σ], [0 0 0 0 0; yy], color = [:red :orange :cyan :orange :red], linewidth = 2, label = [nothing nothing "μ" "μ ± σ" "μ ± 2σ"])
savefig(joinpath(@OUTPUT, "cdfnormal.svg"))