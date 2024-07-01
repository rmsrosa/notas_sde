@def title = "Simulações ilustrando ordem de convergência do método de Heun para equações diferenciais aleatórias"

# {{ get_title }}

Vamos, agora, considerar o método de Heun, que pode ser visto como um ajuste do método de Euler, fazendo uma *correção* na *previsão* inicial do método de Euler. Nesse sentido, ele é visto como um método do tipo *previsor-corretor.* Ele também se enquadra na formulação geral de métodos do tipo Runge-Kutta explícitos.

No caso de uma equação diferencial ordinária
$$
\frac{\mathrm{d}x}{\mathrm{d}t} = f(t, x),
$$
a partir de uma aproximação $x_{j-1}$ da solução $x(t_{j-1})$ em um instante $t_{j-1},$ lembramso que o *método de Euler* nos dá a aproximação $x_j = x(t_{j-1}) + \Delta x_j$ no instante $t_j = t_{j-1} + \Delta t$ através de
$$
\frac{\Delta x_j}{\Delta t} = f(t_{j-1}, x_{j-1}),
$$
ou seja,
$$
x_j = x_{j-1} + \Delta t f(t_{j-1}, x_{j-1}).
$$

No **método de Heun,** usamos esse mesmo valor como uma *previsão* inicial
$$
\tilde x_j = x_{j-1} + \Delta t f(t_{j-1}, x_{j-1})
$$
e, em seguida, tomamos a média dos passos que seriam obtidos usando-se as inclinações $f(t_{j-1}, x_{j-1}),$ em $t_{j-1},$ e $f(t_j, \tilde x_j),$ em $t_j$:
$$
x_j = x_{j-1} + \frac{\Delta t}{2} \left(f(t_{j-1}, x_{j-1}) + f(t_j, \tilde x_j)\right).
$$

Mais explicitamente, podemos escrever
$$
x_j = x_{j-1} + \frac{\Delta t}{2} \left(f(t_{j-1}, x_{j-1}) + f(t_{j-1} + \Delta t, x_{j-1} + \Delta t f(t_{j-1}, x_{j-1}))\right).
$$

No caso de uma equação aleatória
$$
\frac{\mathrm{d}X_t}{\mathrm{d}t} = f(t, X_t, Y_t),
$$
o **método de Heun** toma a forma
$$
X_j^n = X_{j-1}^n + \frac{\Delta t}{2} \left(f(t_{j-1}, X_{j-1}^n, Y_{t_{j-1}}) + f(t_{j-1} + \Delta t, X_{j-1}^n + \Delta t f(t_{j-1}, X_{j-1}^n, Y_{t_{j-1}}))\right).
$$

O método de Euler é um método de ordem um, enquanto que o método de Heun é um método de ordem dois. Mas isso depende da regularidade da função $f(t, x),$ tanto no contexto determinístico como no contexto de equações aleatórias. Para uma equação aleatória definida em termos de um processo de Wiener, esperamos uma regularidade temporal do tipo Hölder com expoente 1/2, nos levando a uma convergência forte de ordem 1.5.


Ilustramos, a seguir, essa dependência da ordem de convergência na regularidade do processo $\{Y_t\}_{t\geq 0}.$

## Simulações

Vamos considerar, para efeito de ilustração, a equação
$$
\frac{\mathrm{d}X_t}{\mathrm{d}t} = - \mu (1 + Y_t) X_t,
$$
com diferentes processos estocásticos $\{Y_t\}_{t\geq 0},$ variando a regulardiade dos seus caminhos amostrais.

Mais precisamente, dado $\theta > 0,$ consideramos
$$
Y_t = \sin(2\pi U t)^\theta \cos(2\pi U t),
$$
onde
$$
U \sim \mathrm{Unif}(0, 1).
$$

Observe que, para cada frequência amostrada $U(\omega) = \omega \in [0, 1),$ obtemos um caminho amostral
$$
Y_t(\omega) = \sin(2\pi\omega t)^\theta \cos(2\pi \omega t), \qquad t \in \mathbb{R}.
$$

Esses caminhos são integráveis no tempo, com primitiva
$$
Z_t(\omega) = \frac{1}{2\pi \omega (1 + \theta)}\sin(2\pi\omega t)^{1 + \theta}.
$$
Esses caminhos nos dão, de fato, o processo $\{Z_t\}_{t \geq 0}$ dado por
$$
Z_t = \frac{1}{2\pi (1 + \theta) U} \sin(2\pi U t)^{1 + \theta}.
$$

Obtemos a solução exata da equação diferencial aleatória explicitamente em termos desse processo estocástico:
$$
X_t = X_0 e^{-\mu (t + Z_t)}.
$$

Com a solução exata em mãos, usamos o método de Monte-Carlo para resolver a equação pelos esquemas de Euler e de Heun, para um certo número $M\in \mathbb{N}$ de amostras do processo de Wiener, obtendo caminhos amostrais $\{X_j^n(\omega_m)\}_{j = 1}^n.$ Ao final, podemos estimar o erro forte via
$$
e_n^{\mathrm{forte}} = \max_{j = 0, \ldots, n} \mathbb{E}_m\left[ \left| X_j^n - X_{t_j}^n\right|\right] = \max_{j=0, \ldots, n}\frac{1}{M}\sum_{m=1}^M \left| X_j^n(\omega_m) - X_{t_j}(\omega_m)\right|,
$$
onde o valor esperado é tomado em relação às amostras $\omega_1, \ldots, \omega_M.$

Nas simulações abaixo, fixamos os valores de $\mu,$ $T,$ $M$ e variamos o valor do parâmetro de regularidade $\theta,$ para ilustrar os efeitos da regularidade na ordem de convergência. Fazemos uma regressão linear de mínimos quadrados nos $(\Delta t^n, e_n^{\mathrm{forte}})$ para encontrar $\ln(C)$ e a ordem de convergência $p$ tais que
$$
\ln(e_n^{\mathrm{forte}}) \approx \ln(C) + p \ln(\Delta t_n),
$$
de modo que
$$
e_n^{\mathrm{forte}} \approx C\Delta t_n^p,
$$
correspondendo a uma taxa de convergência da ordem de $\Delta t^p.$

Como os caminhos amostrais são relativamente bem comportados, não é necessário tomarmos um número grande amostras para visualizarmos a taxa correta de convergência.

```julia:geometric_brownian_Heunconv
#hideall
using Plots
using Random
theme(:ggplot2)
rng = Xoshiro(123)

let μ = 2.0; t0 = 0.0; tf = 2.0; x0 = 1.0; Nmax = 1_024; M = 10

    f(x, μ, t, y) = - μ * (1.0 + y) * x

    # Finest mesh
    ttfine = range(t0, tf, length = Nmax+1)

    for (nfig, θnum) in enumerate((6, 3, 2, 1)) ## force θ to be θnum / 3

        nsteps = (2^n for n in 4:-1:1)
        Ns = (div(Nmax, nstep) for nstep in nsteps)

        ## Yt = Matrix{Float64}(undef, Nmax+1, M)
        angfreqs = 2π * rand(M)
        Yt = (cbrt.(sin.(ttfine * angfreqs')) .^ θnum) .* cos.(ttfine * angfreqs')

        ## solução construída com a malha mais fina
        St = x0 * exp.(- μ * (ttfine .+ (3/(θnum+3)) * (cbrt.(sin.(ttfine * angfreqs')) .^ (θnum+3)) ./ angfreqs'))

        errosEM = Vector{Float64}(undef, length(Ns))
        erros = Vector{Float64}(undef, length(Ns))
        deltas = Vector{Float64}(undef, length(Ns))

        for (i, (nstep, N)) in enumerate(zip(nsteps, Ns))
            local tt = range(t0, tf, length=N+1)
            local dt = Float64(tt.step)
            deltas[i] = dt

            local XEMt = Matrix{Float64}(undef, N+1, M)
            XEMt[1, :] .= x0
            
            local Xt = Matrix{Float64}(undef, N+1, M)
            Xt[1, :] .= x0

            local fn = zeros(M)
            tn1 = t0
            tn = t0 + dt
            for m in 1:M
                for n in 2:N+1
                    # Euler
                    fn = f(XEMt[n-1, m], μ, tn1, Yt[1 + nstep * (n - 2), m])
                    XEMt[n, m] = XEMt[n-1, m] .+ fn * dt

                    # Heun
                    an = f(Xt[n-1, m], μ, tn1, Yt[1 + nstep * (n - 2), m])
                    xn = Xt[n-1, m] + dt * an
                    bn = f(xn, μ, tn, Yt[1 + nstep * (n - 1), m])
                    Xt[n, m] = Xt[n-1, m] + dt * (an + bn) / 2
                end
            end

            errosEM[i] = maximum(sum(abs, XEMt .- St[1:nstep:end, :], dims = 2)) / M
            erros[i] = maximum(sum(abs, Xt .- St[1:nstep:end, :], dims = 2)) / M
            
        end

        lcEM, pEM = [one.(deltas) log.(deltas)] \ log.(errosEM)
        linear_fit_EM = exp(lcEM) * deltas .^ pEM

        lc, p = [one.(deltas[1:end-1]) log.(deltas[1:end-1])] \ log.(erros[1:end-1])
        linear_fit = exp(lc) * deltas .^ p

        plot(xscale = :log10, yscale = :log10, xaxis = "Δt", ylims = [0.1, 10.0] .* extrema(errosEM), yaxis = "erro", title = "Erro forte EM p = $(round(pEM, digits=2))\nX₀ = $x0, μ = $μ, θ = $θnum/3, T = $tf, M = $M", titlefont = 12, legend = :topleft)
        scatter!(deltas, errosEM, marker = :star, label = "erro forte $M amostras")
        plot!(deltas, linear_fit_EM, linestyle = :dash, label = "ajuste linear")
        savefig(joinpath(@OUTPUT, "rode_EMconvfig$nfig.svg"))

        plot(xscale = :log10, yscale = :log10, xaxis = "Δt", ylims = [0.1, 10.0] .* extrema(erros), yaxis = "erro", title = "Erro forte Heun p = $(round(p, digits=2))\nX₀ = $x0, μ = $μ, θ = $θnum/3, T = $tf, M = $M", titlefont = 12, legend = :topleft)
        scatter!(deltas, erros, marker = :star, label = "erro forte $M amostras")
        plot!(deltas, linear_fit, linestyle = :dash, label = "ajuste linear")
        savefig(joinpath(@OUTPUT, "rode_Heunconvfig$nfig.svg"))
    end
end
```

Primeiramente, observe que, nesse caso, a regularidade não afeta a ordem de convergência do método de Euler, que é sempre um. Isso segue do fato dos caminhos amostrais da solução serem continuamente diferenciáveis.

\fig{rode_EMconvfig1}
\fig{rode_EMconvfig2}
\fig{rode_EMconvfig3}
\fig{rode_EMconvfig4}

Já o método de Euler precisa de regularidade suficiente da solução para apresentar o sua maior taxa de convergência, que é dois. Nos dois casos $\theta = 1$ e $\theta = 2,$ há regularidade suficiente da solução (duas vezes continuamente diferenciável), de modo que a ordem de convergência é dois

\fig{rode_Heunconvfig1}
\fig{rode_Heunconvfig2}

Agora, para $\theta = 2/3$ e $\theta = 1/3,$ a ordem de convergência é menor, sendo respectivamente $5/3$ e $4/3.$ Em geral, se $t \mapsto f(t, x, Y_t)$ é Hölder contínua em $t,$ para $x$ fixo, com expoente $0 < \theta < 1,$ então os caminhos amostrais da solução são de classe $\mathcal{C}^{1 + \theta},$ ou seja, continuamente diferenciáveis, com derivada Hölder contínua com expoente $\theta.$ Nesse caso, a ordem de convergência do método é $1 + \theta.$

\fig{rode_Heunconvfig3}
\fig{rode_Heunconvfig4}
