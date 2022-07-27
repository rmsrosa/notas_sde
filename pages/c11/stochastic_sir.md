@def title = "Modelo epidemiológico SIR estocástico estruturado em rede"

# {{ get_title }}

Uma componente importante em epidemiologia é a característica heterogênea dos parâmetros epidemiológicos e sociais. Os indivíduos têm, naturalmente, diferentes comportamentos e diferentes capacidades de serem infectados e de se recuperarem de uma doença. Os modelos compartimentais são homogêneos por princípio e não são capazes de capturar essa heterogeneidade.

Modelos mais realistas devem levar esse heterogeneidade em consideração. Num caso extremo, podemos modelar cada indivíduo separadamente. Isso é custoso, tanto no aspecto da simulação computacional (imagine modelar milhões de indivíduos em uma cidade grande ou em estado ou país) como no de ajuste e escolha dos parâmetros apropriados.

Uma modelagem intermediária é dividir a população em grupos e assumir a homogeneidade apenas dentro desse grupos. A divisão pode ser feita em termos geográficos (e.g. diferentes bairros em uma cidade), comportamentais (e.g. diferentes grupos sociais ou de trabalho), sociais (e.g. diferentes condições de vida), de saúde (e.g. diferentes grupos de risco), etc.

Nesses casos, os grupos podem ser vistos como vértices de um grafo e a interação entre os diferentes grupos pode ser vista como sendo as arestas do grafo. Tais modelos são classificados como modelos em rede. Em cima dessa estrutura de grafo/rede, podemos considerar uma dinâmica determinística ou estocástica. E a evolução pode ser discreta ou contínua, no tempo. Além disso, a natureza da epidemia também pode ser variada (se há reinfecção ou não, se leva expostos em consideração ou não, etc.)

Aqui, vamos construir um modelo do tipo SIR, considerando os estados epidemiológicos  *suscetíveis,* *infectados* e *recuperados*, em cada grupo. No que se segue, podemos pensar nas regiões como sendo diferentes áreas residenciais, mas vale ressaltar que, em termos do sistema de equações, é indiferente o que cada grupo representa. Isso é relevante, apenas, na definição e na interpretação dos diferentes parâmetros que aparecem no modelo. 

Vamos, então, imaginar que a população está estruturada em diferentes regiões geográficas e que os parâmetros epidemiológicos (taxas de contágio e de recuperação) variam de região para região. Vamos imaginar que, ao longo de cada unidade de tempo (e.g. um dia), parte da população de uma região passe parte do tempo em uma das outras regiões. E vamos assumir que esse deslocamento não seja sempre o mesmo, todos os dias, permitindo que ele varie estocásticamente ao longo do tempo.

Vamos construir isso aos poucos:

1. Primeiro definimos o modelo SIR compartimental determinístico clássico;
1. Depois consideremos o SIR compartimental estocástico;
1. Em seguida consideramos o SIR em rede determinístico; e
1. Finalmente consideramos o SIR em rede estocástico.

## Carregando os pacotes necessários

Nas simulações, vamos usar o ambiente [SciML](https://sciml.ai), da [linguagem Julia](https://sciml.ai). Como vamos simular tanto sistema determinísticos como estocásticos, carregamos o [SciML/OrdinaryDiffEq](https://github.com/SciML/OrdinaryDiffEq.jl) e o [SciML/StochasticDiffEq](https://github.com/SciML/StochasticDiffEq.jl).

```julia:packages
using OrdinaryDiffEq
using StochasticDiffEq

using Plots
```

\output{packages}

## Modelo SIR compartimental clássico

Esse é o modelo clássico, com a população toda dividida em três compartimentos: suscetíveis, infectados e recuperados. A população em cada compartimento, em cada instante de tempo $t$, é dada por $S(t)$, $I(t)$, $R(t)$, respectivamente. A evolução dessas quantidades é dada pelo sistema
$$
\begin{cases}
S' & = - \beta \frac{I}{N}S, \\
I' & = \beta \frac{I}{N}S - \gamma I, \\
R' & = \gamma I.
\end{cases}
$$

Os parâmetros $\beta$ e $\gamma$ são positivos e determinam as taxas de infeção e recuperação, respectivamente. A população total $N = S(t) + I(t) + R(t)$ é constante ao longo do tempo; não há natalidade nem mortalidade, no intervalo de tempo considerado. Por conta disso, podemos escrever $R(t) = N - S(t) - I(t)$ e reduzir o sistema a um modelo bidimensional
$$
\begin{cases}
S' & = - \beta \frac{I}{N}S, \\
I' & = \beta \frac{I}{N}S - \gamma I.
\end{cases}
$$

### Implementando a lei de evolução

Definimos a função `SIR!(du, u, p, t)` como o lado direito do sistema. Como é um sistema, consideramos a versão *inplace,* que recebe o vetor `du` de derivadas e altera os seus elementos.
```julia:sir
function SIR!(du, u, p, t)
    S, I = u
    N, beta, gamma = p
    du[1] = -beta * S * I / N 
    du[2] = beta * S * I / N - gamma * I
end
```
\output{sir}

### Parâmetros

Fixamos a população total e os parâmetros epidemiológicos, além do número inicial de infectados e o intervalo de tempo de interesse. Com isso em mãos, definimos o problema de valor inicial via `ODEProblem()`.
```julia:setup_sir
N = 100_000
beta = 0.2
gamma = 0.15

parm_sir = (N, beta, gamma)

t0 = 0.0
tf = 360.0
tspan = (t0, tf)

inf0 = 10
u0 = Float64[N - inf0, inf0]

SIR_prob = ODEProblem(SIR!, u0, tspan, parm_sir)
```
\output{setup_sir}

### Solução

Com o problema montado, resolvemos o via `solve`, com o algoritmo `Tsit5()`, que é um método Runge-Kutta 5/4 de Tsitouras.

```julia:solve_sir
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

Podemos visualizar a evolução dos dois compartimentos nos gráficos a seguir.
\fig{solve_sir_1}

\fig{solve_sir_2}

## Modelo SIR compartimental estocástico

Aqui, consideramos a versão estocástica do modelo SIR clássico. Assumimos que cada parâmetro epidemiológico é dado de maneira estocástica, como uma perturbação de um valor base por um ruído branco:
$$
\begin{align*}
\beta & = \beta_0 + \sigma_\beta \dot \eta_1 \\
\gamma & = \gamma_0 + \sigma_\gamma \dot\eta_2.
\end{align*}
$$
onde $\beta_0$ e $\gamma_0$ são os varlores de base e $\dot \eta_1$ e $\dot \eta_2$ representam dois ruídos brancos independentes. Isso é formalmente definido através das equações
$$
\begin{align*}
  \beta\mathrm{d}t & = \beta_0 \mathrm{d}t + \sigma_\beta \mathrm{d}W^1, \\
  \gamma\mathrm{d}t & = \gamma_0 \mathrm{d}t + \sigma_\gamma \mathrm{d}W^2,
\end{align*}
$$
onde $\{W_t^1\}_{t \geq 0}$ e $\{W_t^2\}_{t \geq 0}$ são dois processos de Wiener independentes.

Isso nos leva ao seguinte sistema de equações com ruído não diagonal.
$$
\begin{cases}
  dS & = - \beta_0 \frac{I}{N}S \mathrm{d}t - \sigma_\beta \frac{I}{N}S \mathrm{d}W_1, \\
  dI & = \beta_0 \frac{I}{N}S \mathrm{d}t - \gamma_0 I \mathrm{d}t + \sigma_\beta \frac{I}{N}S \mathrm{d}W_1 - \sigma_\gamma I \mathrm{d}W_2.
\end{cases}
$$

Em forma vetorial, temos
$$
 \mathrm{d}\left( \begin{matrix} S \\ I \end{matrix} \right) = \left( \begin{matrix} - \beta_0 \frac{I}{N}S \\ \beta_0 \frac{I}{N}S - \gamma_0 I\end{matrix}\right) \mathrm{d}t + \left[ \begin{matrix} - \sigma_\beta \frac{I}{N}S & 0 \\ \sigma_\beta \frac{I}{N}S & - \sigma_\gamma I \end{matrix} \right] \mathrm{d}\left( \begin{matrix} W_1 \\ W_2 \end{matrix} \right)
$$

### Implementando a lei de evolução

A parte determinística é a mesma, dada pela função `SIR!(du, u, p, t)`. Falta implementar a parte do ruído. A parte de ruído é uma função matricial, com componentes $(g_{ij})_{i,j=1}^2$.
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

### Parâmetros

```julia:parms_SIR_noise
sigma_beta = 0.05
sigma_gamma = 0.05
parm_sir_noise = (N, beta, gamma, sigma_beta, sigma_gamma)
```

\output{parms_SIR_noise}

### Solução

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

## Modelo SIR determinístico em rede

Agora, passamos para o modelo SIR em rede, no caso determinístico. Vamos assumir três sítios, denotados por $A$, $B$ e $C$.

## Modelo SIR em rede de sítios

### Representação do sistema

Nesse caso, consideramos 

* $m$ **sítios**.

* Em cada sítio, uma **população total** $N_i$, com um número $S_i$ de **suscetíveis**, $I_i$ de **infectados** e $R_i$ de **recuperados**, $i=1, \ldots, m$.

* Sem vitalidade, de forma que $S_i + I_i + R_i = N_i$ é constante, para cada $i=1, \ldots, m$.

### Dinâmica

- Denominamos por **um ciclo** cada unidade de tempo, digamos um dia.

- O **ciclo** possui uma fase **ativa**, onde a infeção pode ocorrer, e uma fase **inativa**, onde não há transmissão da infecção.

- Na fase **ativa** de cada ciclo, uma **fração** $\alpha_{ij}$ da população $N_i$ migra **do sítio $i$ para o sítio $j$**, voltando ao sítio $i$ na fase **inativa**.

- Naturalmente, $0\leq \alpha_{ij} \leq 1$, para cada $i,j=1, \ldots, m$, e $\sum_{j=1}^m\alpha_{ij} = 1$, para cada $i=1,\ldots, m$.

- Em cada sítio $j=1, \ldots, m$, os indivíduos **suscetíveis** que lá se encontram podem se tornar **infectados** ao encontrar um indivíduo infectado no mesmo sítio, com um **fator de transmissão** $\beta_j$ característico do sítio $j$ em que se encontram.

- Os indivíduos **infectados** de cada sítio, podem se recuperar com um **fator de recuperação** $\gamma_i$, característico do ambiente e dos indivíduos que habitam o sítio.

### Sistema de equações diferenciais

Temos o sistema

$$
\begin{cases}
  \displaystyle \frac{\rm d S_i}{\rm d t} = - \sum_{j=1}^m \sum_{k=1}^m \beta_j\alpha_{kj}\alpha_{ij}\frac{I_k}{\tilde N_j}S_i, & i = 1, \ldots, m, \\
  \displaystyle \frac{\rm d I_i}{\rm d t} = \sum_{j=1}^m \sum_{k=1}^m \beta_j\alpha_{kj}\alpha_{ij}\frac{I_k}{\tilde N_j}S_i - \gamma_i I_i, & i = 1, \ldots, m, \\
  \displaystyle \frac{\rm d R_i}{\rm d t} = \gamma_i I_i, & i = 1, \ldots, m,
\end{cases}
$$

onde

$$ \tilde N_j = \sum_{i=1}^n \alpha_{ij}N_i, \qquad j = 1, \ldots, m,
$$

é a população existente no sítio $j$ durante a fase ativa do ciclo.

### Conservação da população total de cada sítio

Podemos verificar, como esperado da modelagem, que a população total originária de cada sítio permanece constante:

$$ \frac{\rm d N_i}{\rm d t}  = \frac{\rm d}{\rm d t}\left( S_i + I_i + R_i \right) = 0.
$$

Assim, 

$$ N_i = S_i + I_i + R_i = \text{ constante}, \qquad \forall i =1, \ldots, m.
$$

Como consequência, também temos que a população em cada sítio durante a fase ativa do ciclo também é constante:

$$ \tilde N_j = \sum_{i=1}^n \alpha_{ij}N_i = \text{ constante}, \qquad \forall j = 1, \ldots, m.
$$

### Redução do sistema

Como no caso do modelo SIR clássico, podemos reduzir o sistema a um subsistema envolvendo apenas **suscetíveis** e **infectados**, considerando que a população total é constante.

Temos 

$$ R_i = N_i - S_i - I_i
$$

e basta consideramos

$$
\begin{cases}
  \displaystyle \frac{\rm d S_i}{\rm d t} = - \sum_{j=1}^m \sum_{k=1}^m \beta_j\alpha_{kj}\alpha_{ij}\frac{I_k}{\tilde N_j}S_i, & i = 1, \ldots, m, \\
  \displaystyle \frac{\rm d I_i}{\rm d t} = \sum_{j=1}^m \sum_{k=1}^m \beta_j\alpha_{kj}\alpha_{ij}\frac{I_k}{\tilde N_j}S_i - \gamma_i I_i, & i = 1, \ldots, m,
\end{cases}
$$

onde

$$ \tilde N_j = \sum_{i=1}^n \alpha_{ij}N_i, \qquad j=1, \ldots, m,
$$

são constantes.

### Representação vetorial

Considerando os estados na forma de vetores, 

$$ S=(S_1, \ldots, S_m), \qquad I = (I_1, \ldots, I_m),
$$

podemos escrever as equações na forma vetorial

$$
\begin{cases}
  \displaystyle \frac{\rm d S}{\rm d t} = - \rm{diag}(AI)S, \\
  \displaystyle \frac{\rm d I}{\rm d t} = \rm{diag}(AI)S - \Gamma I,
\end{cases}
$$

onde 
- $\Gamma$ é a matriz diagonal $\Gamma = \rm{diag}(\gamma_1, \ldots, \gamma_m)$, 
- $A$ é a matriz

$$ A = \left(\sum_{j=1}^m\frac{\beta_j\alpha_{kj}\alpha_{ij}}{\tilde N_j}\right)_{ik}
$$

- $\rm{diag}(AI)$ é a matriz diagonal formada pelo vetor obtido da aplicação da matriz $A$ ao vetor $I$,

$$ AI = \left(\sum_{k=1}^m\sum_{j=1}^m\frac{\beta_j\alpha_{kj}\alpha_{ij}}{\tilde N_j} I_k\right)_i
$$

### Matriz de fluxo

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

### Parâmetros para os sítios A, B e C.

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

## Modelos SIR estocástico em rede
