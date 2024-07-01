@def title = "Simulações Milstein"

# {{ get_title }}

Consideramos, novamente, o movimento browniano geométrico, a título de ilustrar a ordem de convergência do método de Milstein. Enquanto que o método de Euler tem ordem forte $1/2,$ o de Milstein tem ordem $1,$ conforme podemos verificar nas simulações abaixo.

Relembramos, aqui, a equação, que tem a forma
$$
\mathrm{d}X_t = \mu X_t \;\mathrm{d}t + \sigma X_t \;\mathrm{d}W_t,
$$
e cuja solução é
$$
X_t = X_0 e^{(\mu + \sigma^2/2)t + \sigma W_t}.
$$

Tomamos a condição inicial $X_0 = 1.0$ e fixamos $\mu = 2.0$ e o tempo final $T = 2.0.$ Variamos o coeficiente de difusão $\sigma$ e o número $M$ de amostras, além do número de pontos da malha, determinando o passo de tempo, que aparece no eixo das abscissas. O erro forte aparece no eixo das ordenadas.

Novamente, a ordem $p$ do método é estimada via regressão linear. Observe como está próxima de $1,$ nos primeiros exemplos, com um número relativamente grande de amostras, enquanto que nos últimos exemplos a ordem fica ligeiramente mascarada pelo baixo número de amostras.

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

        plot(xscale = :log10, yscale = :log10, xaxis = "Δt", ylims = [0.1, 10.0] .* extrema(erros), yaxis = "erro", title = "Erro forte p = $(round(p, digits=2))\nX₀ = $x0, μ = $μ, σ = $σ, T = $tf, M = $M", titlefont = 12, legend = :topleft)
        scatter!(deltas, erros, marker = :star, label = "erro forte $M amostras")
        plot!(deltas, linear_fit, linestyle = :dash, label = "ajuste linear")
        savefig(joinpath(@OUTPUT, "geometric_brownian_Milsteinconvfig$nfig.svg"))
    end
end
```

\fig{geometric_brownian_Milsteinconvfig1}
\fig{geometric_brownian_Milsteinconvfig2}
\fig{geometric_brownian_Milsteinconvfig3}
\fig{geometric_brownian_Milsteinconvfig4}
\fig{geometric_brownian_Milsteinconvfig5}
