
@def title = "O processo de Ornstein-Uhlenbeck como aproximação de um ruído branco"

# {{ get_title }}

White noise, as modeled by the "derivative" of the Wiener process, in a suitable distributional sense, is an ubiquotous noise in modelling stochastic behavior in evolutionary systems.

In many situations, however, the actual noise is a colored noise, sometimes with a characteristic amplitude decay, giving a certain hue to the noise, or some other amplitude form.

Here, we explore the approximation of a white noise by an Ornstein-Uhlenbeck (OU) process $\{O_t\}_t$. This is achieved by controlling a *time-scale* $\tau$ for the process. More precisely, we assume $\{O_t\}_t$ satisfies the stochastic differential equation (SDE)

$$
    \tau \mathrm{d}O_t = - \mathrm{d}t + \varsigma \mathrm{d}W_t,
$$
where $\{W_t\}_t$ is a standard Wiener process. This leads to an Ornstein-Uhlenbeck process with drift $\nu = 1/\tau$ and diffusion $\sigma = \varsigma/\tau$. This process has mean, variance, and covariance given by

$$
   \mathbb{E}[O_t] = O_0 e^{-\frac{\displaystyle t}{\displaystyle\tau}}, \quad \mathrm{Var}(O_t) = \frac{\varsigma^2}{2\tau}, \quad \mathrm{Cov}(O_t,O_s) = \frac{\varsigma^2}{2\tau} e^{-\frac{\displaystyle |t - s|}{\displaystyle \tau}}.
$$

Hence, $O_t$ and $O_s$ are significantly correlated only within the time scale $|t - s| \lesssim \tau$.

Moreover, when
$$
\tau \rightarrow 0, \quad \textrm{with} \quad \varsigma \rightarrow 1,
$$
this process approximates a Gaussian white noise. This is equivalent to 
$$
\nu \rightarrow \infty, \quad \sigma\nu \rightarrow 1,
$$
in the usual drift and diffusion Ornstein-Uhlenbeck parameters.

The approximation of $\{O_t\}_t$ to the white noise is in the sense that the time correlations of the Ornstein-Uhlenbeck process converges to the correlation of the white noise, which is the delta distribution, with constant spectra (veja Seção {{link_section pages/c05/ruido_branco}}).

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
    \frac{g(s)}{\zeta^2} = \frac{1}{2}e^{-\frac{\displaystyle |s|}{\displaystyle \tau}}
$$
é uma aproximação da distribuição delta de Dirac (verifique isso provando o limite acima!).

Below, we illustrate this approximation with a few numerical simulations.

## Loading the packages

We start by loading the necessary packages:

```julia:ou_approx_whitenoise
#hideall
using Random
using Statistics
using FFTW
using LinearAlgebra
using Plots
```

## Setup

We fix the initial condition `y0` and the initial and final times `t0` and `tf` of the time interval of the desired simulations. We also fix the size `n` of the sample paths. The sample paths will be generated for a set of `n` times uniformly distributed within the time interval from `t0` to `tf`, which yields a time mesh which we define as `tt`:

```julia:ou_approx_whitenoise
y0 = 0.0
t0 = 0.0
tf = 2.0
n = 2^10
tt = range(t0, tf, length=n+1)
dt = (tf - t0) / n
nothing # hide
```

We also choose a few set of parameters for the Ornstein-Uhlenbeck process, to illustrate the convergence process.

```julia:ou_approx_whitenoise
τs = (1.0, 0.1, 0.01, 0.001, 0.0001, 0.00001)
@assert iseven(length(τs)) # even number for plot layout
nothing # hide
```

With this setup, we create the corresponding OU processes:

```julia:ou_approx_whitenoise
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

This `noises` is a `Tuple` where each element is an OU sampler. With each sampler `noises[i]`, we draw a sample path with `rand!(rng, noises[i], yt)`, with a given random number generator `rng` and a vector of floats `yt` of size `n+1`, so that this sampling fills up the pre-allocated vector `yt` with a sample path over the interval `t0` to `tf`, with the corresponding resolution `dt = (tf - t0) / n`. For that, we set up the `rng`, used for reproducibility.

```julia:ou_approx_whitenoise
rng = Xoshiro(123)
```

Let us visualize a sample path of these process. We define the resolution, pre-allocate some vectors, and compute the sample paths.

```julia:ou_approx_whitenoise
ous_t = [Vector{Float64}(undef, n+1) for τ in τs] # for the OU noises
nothing # hide
```

Now we draw sample paths of the OU noise

```julia:ou_approx_whitenoise
for (i, τ) in enumerate(τs)
    OrnsteinUhlenbeckProcess!(rng, ous_t[i], t0, tf, y0, 1/τ, 1/τ)
end
nothing # hide
```

```julia:ou_approx_whitenoise
plts = [plot(tt, ou_t, xlabel="\$t\$", ylabel="\$y\$", guidefont=10, label="OU τ = $τ", legend=:topright) for (τ, ou_t) in zip(τs, ous_t)]
plot(plts..., layout=(div(length(plts), 2), 2), size=(900, 600))
savefig(joinpath(@OUTPUT, "ou_approx_whitenoise.svg"))
```
\fig{ou_approx_whitenoise}

We can also check the spectrum of each sample path signal, using [JuliaMath/FFTW.jl](https://juliamath.github.io/FFTW.jl/stable/).

```julia:ou_approx_whitenoise
plts = [plot(abs2.(rfft(ou_t)./n), xlabel="\$k\$", ylabel="\$\\hat y\$", guidefont=10, label="OU τ = $τ spectrum", legend=:topright) for (τ, ou_t) in zip(τs, ous_t)]
plot(plts..., layout=(div(length(plts), 2), 2), size=(900, 600))
savefig(joinpath(@OUTPUT, "ou_approx_whitenoise_spectrum.svg"))
```
\fig{ou_approx_whitenoise_spectrum}

For a proper evaluation of the statistics of the processes above, we should draw many samples and average them, but the above suffices for illustrative purposes.
