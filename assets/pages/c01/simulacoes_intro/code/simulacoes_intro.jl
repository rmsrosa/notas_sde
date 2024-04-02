# This file was generated, do not modify it. # hide
μ̄ = 0.1
σ = 0.05

for m in 1:M
    x[1, m] = x₀
    for n in 2:N+1
        dw = randn(rng) * √Δt
        x[n, m] = (1.0 + μ̄ * Δt) * x[n-1, m] + σ * x[n-1, m] * dw
    end
end

plot(t, x, alpha = 0.2, title="Soluções SDE \$(x_0 = $x₀, \\bar\\mu = $μ̄, \\sigma = $σ, dW_t \\sim \\mathcal{N}(0, \\Delta t), T = $T, Δt = $Δt)\$", titlefont = 9, xlabel = "t", ylabel="x", label=permutedims(["soluções"; fill(nothing, M-1)]), color=1)
plot!(t, x[:, 1], label="uma realização", color=2)

savefig(joinpath(@OUTPUT, "intro_uma_realizacao_sde.svg")) # hide