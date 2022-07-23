# This file was generated, do not modify it. # hide
#hideall
using Plots
using Random
theme(:ggplot2)
rng = Xoshiro(123)

μ = 2.0

t0 = 0.0
x0 = 1.0

dec = 100

for (nfig, (M, σ, tf)) in enumerate(
    (
        (1_000, 0.5, 2.0),
        (10_000, 0.5, 2.0),
        (20_000, 1.5, 2.0),
        (1_000, 1.5, 2.0),
        (100, 1.5, 2.0)
    )
)

    Ns = (50, 100, 200, 400, 800, 1600)
    erros = Vector{Float64}(undef, length(Ns))
    errosdec = Vector{Float64}(undef, length(Ns))
    deltas = Vector{Float64}(undef, length(Ns))

    for (i, N) in enumerate(Ns)
        local tt = range(t0, tf, length = N)
        local dt = Float64(tt.step)
        deltas[i] = dt

        local Xt = Matrix{Float64}(undef, N, M)
        Xt[1, :] .= x0

        local Wt = Matrix{Float64}(undef, N, M)
        Wt[1, :] .= 0.0

        local dWt = zeros(M)
        for n in 2:N
            dWt .= √dt * randn(rng, M)
            Wt[n, :] .= Wt[n-1, :] .+ dWt
            Xt[n, :] .= Xt[n-1, :] .* (
                1 
                .+ μ * dt
                .+ σ * dWt
                .+ σ^2 * (dWt .^2 .- dt) / 2
            )
        end

        local Yt = x0 * exp.((μ - σ^2/2) * tt .+ σ * Wt)

        erros[i] = maximum(sum(abs, Xt - Yt, dims = 2)) / M
        errosdec[i] = maximum(sum(abs, Xt[:, 1:div(M, dec)] - Yt[:, 1:div(M, dec)], dims = 2)) / div(M, dec)
    end

    lc, p = [one.(deltas) log.(deltas)] \ log.(erros)
    linear_fit = exp(lc) * deltas .^ p

    plot(xscale = :log10, yscale = :log10, xaxis = "Δt", ylims = [0.1, 10.0] .* extrema(erros), yaxis = "erro", title = "Erro forte p = $(round(p, digits=2))\nM = $M, σ = $σ, T = $tf", titlefont = 12, legend = :topleft)
    scatter!(deltas, erros, marker = :star, label = "erro forte $M amostras")
    scatter!(deltas, errosdec, marker = :star, label = "erro forte $(div(M, dec)) amostras")
    plot!(deltas, linear_fit, linestyle = :dash, label = "ajuste linear")
    savefig(joinpath(@OUTPUT, "geometric_brownian_Milsteinconvfig$nfig.svg"))
end