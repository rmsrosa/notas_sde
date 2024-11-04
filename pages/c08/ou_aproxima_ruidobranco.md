
@def title = "O processo de Ornstein-Uhlenbeck como aproximação de um ruído branco"

# {{ get_title }}

O "ruído branco", como modelado pela "derivada" de um processo de Wiener, em um sentido apropriado de distribuições, é um processo comumente encontrado em diversos modelos. Em várias situações, no entanto, o ruído é "colorido", com algum decaimento característico do espectro de amplitudes.

Aqui, exploramos o processo de Ornstein-Uhlenbeck (OU) como aproximação de um ruído branco. Isso é obtido controlando-se uma *escala temporal* $\tau.$ Mais precisamente, consideramos um processo $\{O_t\}_t$ satisfazendo a equação diferencial estocástica
$$
    \tau \mathrm{d}O_t = - \mathrm{d}t + \varsigma \mathrm{d}W_t,
$$
onde $\{W_t\}_t.$ Isso nos dá um processo de Ornstein-Uhlenbeck com termo de deriva $\nu = 1/\tau$ e difusão $\sigma = \varsigma/\tau.$ Esse processo tem média e covariância dadas por
$$
\mathbb{E}[O_t] = \mathbb{E}[O_0] e^{-t/\tau}, \quad
\mathrm{Cov}(O_{t}, O_{t+s}) = e^{-(2t + s)/\tau}\mathrm{Var}(O_0) + \frac{\varsigma^2}{2\tau}e^{- s/\tau}\left( 1 - e^{-2\nu t}\right)
$$
Assintoticamente em $t\rightarrow \infty,$ temos
$$
\mathbb{E}[O_t] \rightarrow 0  \quad
\mathrm{Cov}(O_{t}, O_{t+s}) \rightarrow \frac{\varsigma^2}{2\tau}e^{- s/\tau}.
$$

Pensando como uma família de processo $O_t = O_t^{\tau, \varsigma},$ temos, no limite em que
$$
\tau \rightarrow 0, \quad \textrm{com} \quad \varsigma \rightarrow 1,
$$
que esses processos se aproximam de um ruído branco, que é uma distribuição delta de Dirac, com espectro constante (veja Seção {{link_section pages/c05/ruido_branco}}). 

Em termos dos parâmetros usuais de deriva e de difusão do processo de Ornstein-Uhlenbeck, as condições acima são equivalentes a
$$
\nu \rightarrow \infty, \quad \frac{\sigma}{\nu} \rightarrow 1,
$$

De fato, considerando a função de correlação
$$
    g(s) = \mathrm{Cov}(O_{t+s},O_t) = \frac{\varsigma^2}{2\tau} e^{-\frac{\displaystyle |s|}{\displaystyle \tau}},
$$
temos, para uma função teste $\varphi$ suave e de suporte compacto na reta,
$$
    \int_{-\infty}^\infty g(s)\varphi(s)\;\mathrm{d}s = \frac{\varsigma^2}{2\tau} \int_{-\infty}^\infty g(s) e^{-\frac{\displaystyle |s|}{\displaystyle \tau}} \;\mathrm{d}s \rightarrow g(0),
$$
visto que a função
$$
    \frac{g(s)}{\varsigma^2} = \frac{1}{2\tau}e^{-\frac{\displaystyle |s|}{\displaystyle \tau}}
$$
é uma aproximação da distribuição delta de Dirac (verifique isso provando o limite acima!).

Ilustramos alguns caminhos amostrais variando os parâmetros.

```julia:ou_approx_whitenoise
#hideall
using Random
using Statistics
using FFTW
using LinearAlgebra
using Plots

rng = Xoshiro(123)
```

```julia:ou_approx_whitenoise
#hideall
y0 = 0.0
t0 = 0.0
tf = 2.0
n = 2^10
tt = range(t0, tf, length=n+1)
dt = (tf - t0) / n

τs = (1.0, 0.1, 0.01, 0.001, 0.0001, 0.00001)
@assert iseven(length(τs)) # even number for plot layout

ous_t = [Vector{Float64}(undef, n+1) for τ in τs] # for the OU noises

nothing # hide
```

```julia:ou_approx_whitenoise
#hideall
function OrnsteinUhlenbeckProcess!(rng, yt, t0, tf, y0, ν, σ)
    n = length(yt)
    dt = (tf - t0) / (n - 1)
    a = exp(-ν * dt)
    b = σ * √((1 - a ^ 2) / (2 * ν))
    i1 = firstindex(yt)
    yt[i1] = y0
    for i in Iterators.drop(eachindex(yt), 1)
        yt[i] = a * yt[i1] + b * randn(rng)
        i1 = i
    end
end
```

```julia:ou_approx_whitenoise
#hideall
for (i, τ) in enumerate(τs)
    OrnsteinUhlenbeckProcess!(rng, ous_t[i], t0, tf, y0, 1/τ, 1/τ)
end
nothing # hide
```

```julia:ou_approx_whitenoise
#hideall
plts = [plot(tt, ou_t, xlabel="\$t\$", ylabel="\$y\$", guidefont=10, label="OU τ = $τ", legend=:topright) for (τ, ou_t) in zip(τs, ous_t)]
plot(plts..., layout=(div(length(plts), 2), 2), size=(900, 600))
savefig(joinpath(@OUTPUT, "ou_approx_whitenoise.svg"))
```
\fig{ou_approx_whitenoise}

E os espectros correspondentes dos caminhos amostrais. (Para uma análise mais apropriadada do espectro, deveríamos, na verdade, considerar vários caminhos amostrais.)

```julia:ou_approx_whitenoise
#hideall
plts = [plot(abs2.(rfft(ou_t)./n), xlabel="\$k\$", ylabel="\$\\hat y\$", guidefont=10, label="OU τ = $τ spectrum", legend=:topright) for (τ, ou_t) in zip(τs, ous_t)]
plot(plts..., layout=(div(length(plts), 2), 2), size=(900, 600))
savefig(joinpath(@OUTPUT, "ou_approx_whitenoise_spectrum.svg"))
```
\fig{ou_approx_whitenoise_spectrum}

## Cor do processo de Ornstein-Uhlenbeck

Considerando a correlação (assintótica)
$$
\mathrm{Cov}(O_{t}, O_{t+s}) \rightarrow f(s) = \frac{\sigma^2}{2\nu}e^{-\nu |s|},
$$
vemos que
$$
\hat f(\omega) = \frac{1}{2\pi}\int_{-\infty}^\infty f(s) e^{-i\omega s} \;\mathrm{d}s = \frac{\sigma^2}{2\nu}\frac{1}{2\pi}\int_{-\infty}^\infty e^{-\nu |s|} e^{-i\omega s} \;\mathrm{d}s = \frac{\sigma^2}{2\nu}\frac{1}{2\pi}\left( \frac{1}{\nu - i\omega} - \frac{1}{\nu + i\omega}\right) = \frac{\sigma^2}{2\nu}\frac{1}{\pi}\frac{\nu}{\nu^2 + \omega^2}.
$$
Portanto, 
$$
\hat f(\omega) \sim \frac{1}{\omega^2}, \quad \omega \rightarrow \pm \infty.
$$