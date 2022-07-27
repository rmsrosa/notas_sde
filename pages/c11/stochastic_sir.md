@def title = "Modelo epidemiológico SIR estocástico estruturado em rede"

# {{ get_title }}

## Introduction

Uma componente importante em epidemiologia é característica heterogênea dos parâmetros epidemiológicos. Os indivíduos têm, naturalmente, diferentes comportamentos e diferentes capacidades de ser infectados e de se recuperarem de uma doença. Os modelos compartimentais não são capazes de capturar essa heterogeneidade pois, por princípio, são baseados na hipótese das características serem homogêneas, de todos os indíviduos terem o mesmo comportamente e os mesmos atributos.

Modelos mais realistas devem levar esse heterogeneidade em consideração. Num extremo, podemos modelar cada indivíduo separadamente. Isso é custoso, tanto no aspecto da simulação computacional (imagine modelar milhões de indivíduos em uma cidade grande ou em estado ou país) como no de ajuste de parâmetros.

Uma modelagem intermediária é dividir a população em grupos e assumir a homogeneidade apenas dentro desse grupos. A divisão pode ser feita em termos geográficos (e.g. diferentes bairros em uma cidade), comportamentais (e.g. diferentes grupos sociais ou de trabalho), sociais (e.g. diferentes condições de vida), de saúde (e.g. diferentes grupos de risco), etc.

Nesses casos, os grupos podem ser vistos como vértices de um grafo e a interação entre os diferentes grupos pode ser vista como sendo as arestas do grafo. Tais modelos são classificados como modelos em rede. Em cima dessa estrutura de grafo/rede, podemos considerar uma dinâmica determinística ou estocástica. E a evolução pode ser discreta ou contínua, no tempo. Além disso, a natureza da epidemia também pode ser variada (se há reinfecção ou não, se leva expostos em consideração ou não, etc.)

Aqui, vamos construir um modelo do tipo SIR, considerando os estados epidemiológicos  *suscetíveis,* *infectados* e *recuperados*, em cada grupo. No que se segue, podemos pensar nas regiões como sendo diferentes áreas residenciais, mas vale ressaltar que, em termos do sistema de equações, é indiferente o que cada grupo representa. Isso é relevante, apenas, na definição e na interpretação dos diferentes parâmetros que aparecem no modelo. 

Vamos, então, imaginar que a população está estruturada em diferentes regiões geográficas e que os parâmetros epidemiológicos (taxas de contágio e de recuperação) variam de região para região. Vamos imaginar que, ao longo de cada unidade de tempo (e.g. um dia), parte da população de uma região passe parte do tempo em uma das outras regiões. E vamos assumir que esse deslocamento não seja sempre o mesmo, todos os dias, permitindo que ele varie estocásticamente ao longo do tempo.

Vamos construir isso aos poucos.

1. We first define a classic one-site compartmental SIR model;
1. Next we make this model stochastic;
1. Then we build a deterministic network-structured compartmental SIR model;
1. Finally we make that stochastic

## Loading the necessary packages


```julia:packages
using OrdinaryDiffEq
using StochasticDiffEq

using Plots
```

\output{packages}

## Modelo SIR compartimental clássico

This is the classic model, with the population divided into compartments with the
number of Susceptibles, Infected, and Removed/Recovered individuals.

With $S(t)$, $I(t)$, $R(t)$ denoting the population in each compartment at time $t$,
the evolution equation for these quantities is defined by
$$
\begin{cases}
S' & = - \beta \frac{I}{N}S, \\
I' & = \beta \frac{I}{N}S - \gamma I, \\
R' & = \gamma I.
\end{cases}
$$

The parameters $\beta$ and $\gamma$ are positive and stand for the infection
and recovery rates, respectively, while $N = S + I + R$ is the total population

In this model, there is no birth or death (or at least no birth since one may include
the deceased in the removed compartment). Hence, the sum $S(t) + I(t) + R(t) = N$ is
constant for all times. Due to that, we may reduce the model to a two-dimensional
system

$$
\begin{cases}
S' & = - \beta \frac{I}{N}S, \\
I' & = \beta \frac{I}{N}S - \gamma I.
\end{cases}
$$

### Implementing the evolution law

```julia:sir
function SIR!(du, u, p, t)
    S, I = u
    N, beta, gamma = p
    du[1] = -beta * S * I / N 
    du[2] = beta * S * I / N - gamma * I
end
```

\output{sir}

### Setup

In this example, we set the whole population and fix the epidemiological parameters.

```julia:setup_sir
N = 100_000
beta = 0.2
gamma = 0.15

# Here we prepare the parameters for the solver

parm_sir = (N, beta, gamma)

inf0 = 10
u0 = Float64[N - inf0, inf0]
tspan = (0., 360.)
```

\output{setup_sir}

### Solution

```julia:solve_sir
SIR_prob = ODEProblem(SIR!, u0, tspan, parm_sir)
SIR_sol = solve(SIR_prob, Tsit5())

plot(
    SIR_sol, ylims = (0.0, N),
    xlabel = "time (days)", ylabel = "population", label = ["suscetíveis" "infectados"]
)
savefig(joinpath(@OUTPUT, "solve_sir_1.svg")) # hide

plot(
    SIR_sol, vars = 2, c = :red,
    xlabel = "time (days)", ylabel = "population", label = "Infected"
)
savefig(joinpath(@OUTPUT, "solve_sir_2.svg")) # hide
```

\output{solve_sir}

\fig{solve_sir_1}
\fig{solve_sir_2}

## Stochastic compartmental SIR model

Here we write a stochastic (random) version of the classic compartmental SIR model.

We keep the same parameters, changing only the evolution law, to account for randomness
on the epidemiologic parameters.

We assume each parameter, $\beta$ and $\gamma$ is a random process, with means
$\beta_0$ and $\gamma_0$, respectively, and satisfying
$$
  \begin{align}
    \dot\beta \sim \beta_0 \mathrm{d}t + \sigma_\beta \mathrm{d}W_1, \\
    \dot\gamma \sim \gamma_0 \mathrm{d}t + \sigma_\gamma \mathrm{d}W_2,
  \end{align}
$$

where $W_1$ and $W_2$ are two (independent) Wiener processes:


This leads us to the stochastic system with non-diagonal noise

$$
\begin{cases}
  dS & = - \beta_0 \frac{I}{N}S \mathrm{d}t - \sigma_\beta \frac{I}{N}S \mathrm{d}W_1, \\
  dI & = \beta_0 \frac{I}{N}S \mathrm{d}t - \gamma_0 I \mathrm{d}t + \sigma_\beta \frac{I}{N}S \mathrm{d}W_1 - \sigma_\gamma I \mathrm{d}W_2.
\end{cases}
$$

In vectorial form, we have

$$
 \mathrm{d}\left( \begin{matrix} I \\ S \end{matrix} \right) = \left( \begin{matrix} - \beta_0 \frac{I}{N}S \\ \beta_0 \frac{I}{N}S - \gamma_0 I\end{matrix}\right) \mathrm{d}t + \left[ \begin{matrix} - \sigma_\beta \frac{I}{N}S & 0 \\ \sigma_\beta \frac{I}{N}S & - \sigma_\gamma I \end{matrix} \right] \mathrm{d}\left( \begin{matrix} W_1 \\ W_2 \end{matrix} \right)
$$

### Evolution law



The deterministic part is the same, we only need to define the noise term

```julia:SIR_noise
function SIR_noise!(du, u, p, t)
    S, I = u
    N, _, _, sigma_beta, sigma_gamma = p
    bW = sigma_beta * S * I / N
    gW = sigma_gamma * I
    du[1, 1] = -bW
    du[1, 2] = 0.0
    du[2, 1] = bW
    du[2, 2] = -gW
end
```

\output{SIR_noise}

### Parameters

```julia:parms_SIR_noise
sigma_beta = 0.05
sigma_gamma = 0.05
parm_sir_noise = (N, beta, gamma, sigma_beta, sigma_gamma)
```

\output{parms_SIR_noise}

### Solution

```julia:solve_SIR_noise
SIR_stochastic_prob = SDEProblem(SIR!, SIR_noise!, u0, tspan, parm_sir_noise, noise_rate_prototype=zeros(2,2))
SIR_stochastic_sol = solve(SIR_stochastic_prob, EM(), dt=0.01)

plot(
    SIR_stochastic_sol, ylims = (0.0, N),
    xlabel = "time (days)", ylabel = "population", label = ["suscetíveis" "infectados"]
)
savefig(joinpath(@OUTPUT, "solve_sir_noise_1.svg")) # hide

plot(
    SIR_stochastic_sol, vars = 2, c = :red,
    xlabel = "time (days)", ylabel = "population", label = "Infected"
)
savefig(joinpath(@OUTPUT, "solve_sir_noise_2.svg")) # hide
```

\output{solve_sir_noise}

\fig{solve_sir_noise_1}
\fig{solve_sir_noise_2}

```julia:solve_SIR_noise_ensemble
num_trajectories = 100
SIR_stochastic_ensemble_prob = EnsembleProblem(SIR_stochastic_prob)
SIR_stochastic_ensemble_sol = solve(SIR_stochastic_ensemble_prob, EM(), dt=0.1, EnsembleThreads(), trajectories=num_trajectories)

plot(SIR_stochastic_ensemble_sol, color =  repeat(1:2, 200)', alpha = 0.2)
# plot!(SIR_stochastic_ensemble_sol[2], color = 2, alpha = 0.2)
savefig(joinpath(@OUTPUT, "solve_SIR_noise_ensemble.svg")) # hide
```

\fig{solve_SIR_noise_ensemble}

```julia:SIR_noise_ensemble_summ
summ95 = EnsembleSummary(SIR_stochastic_ensemble_sol, 0:1:360)
summ50 = EnsembleSummary(SIR_stochastic_ensemble_sol, 0:1:360; quantiles=[0.25,0.75])
summ3 = EnsembleSummary(SIR_stochastic_ensemble_sol, 0:1:360; quantiles=[0.49,0.51])

plot(summ95, labels=["" "Middle 95%"])
plot!(summ50, labels=["" "Middle 50%"], legend=true)
plot!(summ3, labels=["" "Median"], legend=true)
savefig(joinpath(@OUTPUT, "SIR_noise_ensemble_summ.svg")) # hide
```

\fig{SIR_noise_ensemble_summ}


```julia:SIR_noise_ensemble_summ_closeup
plot(summ95, labels=["" "Middle 95%"], ylims = (0.0, 5000.0))
plot!(summ50, labels=["" "Middle 50%"], legend=true)
plot!(summ3, labels=["" "Median"], legend=true)
savefig(joinpath(@OUTPUT, "SIR_noise_ensemble_summ_closeup.svg")) # hide
```

\fig{SIR_noise_ensemble_summ_closeup}

## Network SIR model

Now we build a network model with three sites.

### Flux matrix

A key component of the network model is the flux matrix, defining the fraction
of the population and of the time that the residents of a given site spend
in another site.

We denote this matrix by $\phi = (\phi_{ij})_{i,j}$.

More precisely, each individual $k=1, \ldots, N_i$ in site $i$ may spend a time
$\theta^k_{i,j}$ in site $j$, during a specified unit of time. In this case,
$$
  0 \leq \theta^k_{ij} \leq 1, \qquad \sum_j \theta^k_{i,j} = 1.
$$

We then define $\phi_{ij} = (1/N_i)\sum_{k=1}^{N_i} \theta^k_{i,j}$. Notice

$$
0 \leq \phi_{ij} \leq 1, \qquad \sum_j \phi_{ij} = 1.
$$

### Parameters for sites A, B, and C.

Population in each site:

```julia:pop_sites
pop = [0.1; 0.7; 0.2] * N
```

\output{pop_sites}

Flux (commuting) matrix

```julia:commuting_matrix
phi = [
    0.6 0.1 0.3
    0.3 0.4 0.3
    0.2 0.3 0.5
]
```

\output{commuting_matrix}

Infectivity and recovery rates in each site

```julia:site_inf_rec_rates
sites_beta = [
    0.2
    0.4
    0.3
]

sites_gamma = [
    0.3
    0.1
    0.2
]
```

\output{site_inf_rec_rates}


### Evolution law

```julia:sir_network
function SIR_network!(du, u, p, t)
    S, I = eachrow(u)
    M = length(S)
    Nd, phi, beta, gamma = p
    for i in 1:M
        infections_i = sum(
            [beta[j] * phi[i,j] * phi[k,j] * S[i] * I[k] / Nd[j] for k=1:M, j=1:M]
        )
        du[1,i] = dS = - infections_i
        du[2,i] = dI = infections_i - gamma[i] * I[i]
    end
end
```

\output{sir_network}

### Setup

Collecting the parameters

```julia:sir_network_params
Nd = transpose(phi) * pop # population in each site "during the day"
parm_network = (Nd, phi, sites_beta, sites_gamma)
```

\output{sir_network_params}

Initial conditions

```julia:sir_network_ivp
popinf0 = [0.8, 0.2, 0.0] * inf0

pop0 = [pop' - popinf0'; popinf0']
tspan = (0., 360.)

SIR_network_prob = ODEProblem(SIR_network!, pop0, tspan, parm_network)
```

\output{sir_network_ivp}



### Solution

```julia:solve_sir_network
SIR_network_sol = solve(SIR_network_prob, Tsit5())

SIR_network_sol.retcode
```

\output{solve_sir_network}

```julia:plot_sol_sir_network
plot(xlabel = "time (days)", ylabel = "population fraction", ylims = (0.0, 1.0))
for (j, s) in zip(1:3, 'A':'C')
    plot!(getindex.(SIR_network_sol.u, 1, j)/pop[j], label = "Site $s")
end
plot!(title = "Fraction of susceptible individuals in each site", titlefont = 10)
savefig(joinpath(@OUTPUT, "plot_sol_sir_network_1.svg")) # hide

plot(xlabel = "time (days)", ylabel = "population fraction")
for (j, s) in zip(1:3, 'A':'C')
    plot!(getindex.(SIR_network_sol.u, 2, j)/pop[j], label = "Site $s")
end
plot!(title = "Fraction of infected individuals in each site", titlefont = 10)
savefig(joinpath(@OUTPUT, "plot_sol_sir_network_2.svg")) # hide
```

\fig{plot_sol_sir_network_1}
\fig{plot_sol_sir_network_2}
