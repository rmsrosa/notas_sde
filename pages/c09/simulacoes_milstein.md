@def title = "Simulações Milstein"

# {{ get_title }}

```julia:geometric_brownian_EMconv
#hideall
using Plots
using Random
theme(:ggplot2)
rng = Xoshiro(123)

let μ = 2.0, t0 = 0.0, x0 = 1.0, Nmax = 1_600

    for (nfig, (M, σ, tf)) in enumerate(
            (
                (1_000, 0.5, 2.0),
                (10_000, 0.5, 2.0),
                (20_000, 1.5, 2.0),
                (1_000, 1.5, 2.0),
                (100, 1.5, 2.0)
            )
        )

        nsteps = (2^n for n in 5:-1:0)
        Ns = (div(Nmax, nstep) for nstep in nsteps)

        Wt = Matrix{Float64}(undef, Nmax, M)
        Wt[1, :] .= 0.0

        dWt = zeros(M)
        dt = tf / (Nmax - 1)
        for n in 2:Nmax
            dWt .= √dt * randn(rng, M)
            Wt[n, :] .= Wt[n-1, :] .+ dWt
        end

        erros = Vector{Float64}(undef, length(Ns))
        deltas = Vector{Float64}(undef, length(Ns))

        for (i, (nstep, N)) in enumerate(zip(nsteps, Ns))
            local tt = range(t0, tf, length = N)
            local dt = Float64(tt.step)
            deltas[i] = dt

            local Xt = Matrix{Float64}(undef, N, M)
            Xt[1, :] .= x0

            local dWt = zeros(M)
            for n in 2:N
                dWt .= Wt[1 + nstep * (n - 1), :] - Wt[1 + nstep * (n - 2), :]
                Xt[n, :] .= Xt[n-1, :] .* (
                    1 
                    .+ μ * dt
                    .+ σ * dWt
                    .+ σ^2 * (dWt .^2 .- dt) / 2
                )
            end

            local Yt = x0 * exp.((μ - σ^2/2) * tt .+ σ * @view(Wt[1:nstep:end, :]))

            erros[i] = maximum(sum(abs, Xt - Yt, dims = 2)) / M
        end

        lc, p = [one.(deltas) log.(deltas)] \ log.(erros)
        linear_fit = exp(lc) * deltas .^ p

        plot(xscale = :log10, yscale = :log10, xaxis = "Δt", ylims = [0.1, 10.0] .* extrema(erros), yaxis = "erro", title = "Erro forte p = $(round(p, digits=2))\nM = $M, σ = $σ, T = $tf", titlefont = 12, legend = :topleft)
        scatter!(deltas, erros, marker = :star, label = "erro forte $M amostras")
        plot!(deltas, linear_fit, linestyle = :dash, label = "ajuste linear")
        savefig(joinpath(@OUTPUT, "geometric_brownian_Milsteinconvfigb$nfig.svg"))
    end
end
```

\fig{geometric_brownian_Milsteinconvfig1}
\fig{geometric_brownian_Milsteinconvfig2}
\fig{geometric_brownian_Milsteinconvfig3}
\fig{geometric_brownian_Milsteinconvfig4}
\fig{geometric_brownian_Milsteinconvfig5}
