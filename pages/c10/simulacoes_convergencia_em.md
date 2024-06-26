@def title = "Simulações ilustrando ordem de  convergência do método de Euler-Maruyama"

# {{ get_title }}

Podemos ilustrar e conferir a order de convergência do método de Euler-Maruyama considerando equações diferenciais estocásticas para as quais conhemos explicitamente a solução exata.

Vamos considerar duas equações, uma com ruído multiplicativo, que teoricamente nos dá uma convergência forte de ordem $1/2,$ e outra com ruído aditivo, que teoricamente nos dá uma convergência forte de ordem $1.$ Em ambas temos, também, convergência fraca de ordem $1.$

O caso com ruído multiplicativo é ilustrado com o movimento Browniano geométrico, enquanto que o caso com ruído aditivo é ilustrado com o processo de Orstein-Uhlenbeck.

## Convergência forte de ordem 1/2 no movimento browniano geométrico

Nesse caso, a equação do movimento browniano geométrico é
$$
\mathrm{d}X_t = \mu X_t \;\mathrm{d}t + \sigma X_t \;\mathrm{d}W_t,
$$
cuja solução é
$$
X_t = X_0 e^{(\mu + \sigma^2/2)t + \sigma W_t}.
$$

Aproximamos a solução pelo método de Euler-Maruyama, em um intervalo de tempo $[0, T],$ dado por
$$
X_j^n = X_{j-1}^n + \mu X_{j-1}^n\Delta t + \sigma X_{j-1}^n \Delta W_j, \quad j = 1, \ldots, n,
$$
onde
$$
n\in \mathbb{N}, \quad \Delta j = \frac{T}{n}, \quad \Delta W_j = Z_j \sqrt{\Delta t}, \quad Z_j \sim \mathcal{N}(0, 1).
$$

Os incrementos $\Delta W_j$ nos dão um processo discreto $\{W_j^n\}_{j = 0, \ldots, n}$ via
$$
W_0^n = 0, \quad W_j^n = W_{j-1}^n + \Delta W_j.
$$

Para cada $n$ fixo, podemos interpretar $\{W_j^n\}_j$ como, de fato, uma amostra exata de um processo de Wiener $\{W_t\}_{t \geq 0},$ com $W_j^n = W_{t_j}.$

De posse de $\{W_j^n\}_j,$ podemos considerar uma amostra da solução exata
$$
X_{t_j}^n = X_0 e^{(\mu + \sigma^2/2)t_j + \sigma W_j^n}.
$$

Usamos o método de Monte-Carlo para resolver a equação um certo número $M\in \mathbb{N}$ de vezes, obtendo caminhos amostrais $\{X_j^n(\omega_m)\}_{j = 1}^n$ do método de Euler-Maruyama, assim como amostras de $M$ caminhos amostrais $\{X_{t_j}^n\}_{j = 1}^n$ da solução exata.

Ao final, podemos estimar o erro forte via
$$
e_n^{\mathrm{forte}} = \max_{j = 0, \ldots, n} \mathbb{E}_m\left[ \left| X_j^n - X_{t_j}^n\right|\right] = \max_{j=0, \ldots, n}\frac{1}{M}\sum_{m=1}^M \left| X_j^n(\omega_m) - X_{t_j}^n(\omega_m)\right|,
$$
onde o valor esperado é tomado em relação às amostras $\omega_1, \ldots, \omega_M.$

Observe que devemos considerar o erro em relação ao passo $\Delta t,$ mas também temos o erro em relação à amostragem, que pode ser significativo se $M$ não for suficientemente grande.

Nas simulações abaixo, tomamos alguns valores de $\mu,$ $\sigma,$ $T,$ $M$ e $n$ para ilustrar os efeitos desse parâmetros. Fazemos uma regressão linear de mínimos quadrados nos $(\Delta t^n, e_n^{\mathrm{forte}})$ para encontrar $\ln(C)$ e a ordem de convergência $p$ tais que
$$
\ln(e_n^{\mathrm{forte}}) \approx \ln(C) + p \ln(\Delta t_n),
$$
de modo que
$$
e_n^{\mathrm{forte}} \approx C\Delta t_n^p,
$$
correspondendo a uma taxa de convergência da ordem de $\Delta t^p.$

As amostras do processo de Wiener são calculadas na malha mais fina. Os passos correspondentes são dados a partir dessas amostras, seja na malha mais fina ou nas mais grossas.

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
            (10_000, 0.5, 13.0),
            (20_000, 1.5, 2.0),
            (500, 1.5, 2.0)
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
        savefig(joinpath(@OUTPUT, "geometric_brownian_EMconvfig$nfig.svg"))
    end
end
```

Se o ruído for relativamente pequeno, o erro pode não sofrer tanto e acabar sendo de ordem um pouco melhor:

\fig{geometric_brownian_EMconvfig1}

Nesse caso, não é questão de falta de amostras. A ordem permanece mais alta, se aumentarmos o número de amostras:

\fig{geometric_brownian_EMconvfig2}

Mas se dermos mais tempo ao processo, para o ruído ter um efeito mais significativo, obtemos a ordem forte $1/2$:

\fig{geometric_brownian_EMconvfig3}

Ou, podemos manter um tempo mais curto mas aumentarmos a difusão, observando novamente a ordem forte $1/2$:

\fig{geometric_brownian_EMconvfig4}

Se por outro lado, diminuirmos a amostragem, enxergamos uma ordem forte diferente, mas isso é por conta do erro amostral, mascarando a taxa real de convergência:

\fig{geometric_brownian_EMconvfig5}

## Convergência fraca de ordem 1 no movimento Browniano geométrico

A ordem da convergência fraca também sofre influências do número de amostras e da intensidade de ruído. Mas não vamos ilustrar isso aqui. Exibimos apenas uma simulação, com uma ordem de convergência próxima de $1.$ Observe, também, que, além da ordem mais alta de convergência, o erro em si tem uma magnitude bem menor.

```julia:geometric_brownian_EMconv
#hideall
using Plots
using Random
theme(:ggplot2)
rng = Xoshiro(123)

let μ = 2.0, σ = 1.0, t0 = 0.0, tf = 1.0, x0 = 1.0, M = 20_000, Nmax = 1_600

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

    errosfracos = Vector{Float64}(undef, length(Ns))

    deltas = Vector{Float64}(undef, length(Ns))

    for (i, (nstep, N)) in enumerate(zip(nsteps, Ns))
        local tt = range(t0, tf, length = N)
        local dt = Float64(tt.step)
        deltas[i] = dt

        local Xt = Matrix{Float64}(undef, N, M)
        Xt[1, :] .= x0

        for n in 2:N
            dWt .= Wt[1 + nstep * (n - 1), :] - Wt[1 + nstep * (n - 2), :]
            Xt[n, :] .= Xt[n-1, :] .* (
                1 
                .+ μ * dt
                .+ σ * dWt
            )
        end

        local Yt = x0 * exp.((μ - σ^2/2) * tt .+ σ * @view(Wt[1:nstep:end, :]))

        errosfracos[i] = maximum(abs.(sum(Xt, dims=2) - sum(Yt, dims=2))) / M
    end

    lc, p = [one.(deltas) log.(deltas)] \ log.(errosfracos)
    linear_fit = exp(lc) * deltas .^ p

    plot(xscale = :log10, yscale = :log10, xaxis = "Δt", ylims = [0.1, 10.0] .* extrema(errosfracos), yaxis = "erro", title = "Erro fraco p = $(round(p, digits=2))\nX₀ = $x0, μ = $μ, σ = $σ, T = $tf, M = $M", titlefont = 12, legend = :topleft)
    scatter!(deltas, errosfracos, marker = :star, label = "erro fraco $M amostras")
    plot!(deltas, linear_fit, linestyle = :dash, label = "ajuste linear")
    savefig(joinpath(@OUTPUT, "geometric_brownian_EMconvfraca.svg"))
end
```
\fig{geometric_brownian_EMconvfraca}

## Convergência forte de ordem 1 no processo de Orstein-Uhlenbeck

A equação, nesse caso, é
$$
\mathrm{d}O_t = -\nu O_t \;\mathrm{d}t + \sigma \;\mathrm{d}W_t,
$$
cuja solução é
$$
O_t = e^{-\nu t} O_0 + \int_0^t e^{-\nu (t - s)} \;\mathrm{d}W_s.
$$

Como o ruído é aditivo, esperamos recuperar a convergência forte de ordem $1.$
