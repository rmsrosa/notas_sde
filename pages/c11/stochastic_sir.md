@def title = "Modelo SIR estocástico"

# {{ get_title }}

O modelo SIR é um modelo compartimental clássico, em que três estágios epidemiológicos são considerados, dividindo a população entre suscetíveis, infectados e recuperados/removidos. Cada grupo é tratado uniformemente, com os mesmos parâmetros epidemiológicos. Na versão determinística, a taxa é uniforme, com a mesma proporção de suscetíveis se tornando infectados, dependendo da proporção de infectados existentes correntes e com a mesma proporção de infectados se tornando recuperados.

É natural, no entanto, que essas taxas não sejam tão precisas assim. Há um alto grau de aleatoriedade no comportamento social e nas características imunológicas dos indivíduos.Uma maneira de introduzir alguma aleatoriedade no sistema é assumir que esses parâmetros sejam perturbados estocasticamente em torno de um valor base. Dependendo da modelagem, isso pode nos levar a uma equação aleatória ou estocástica. Vejamos, aqui, uma versão estocástica do modelo SIR. Vamos começar, na verdade, relembrando e fazendo a versão determinística. Em seguida, acrescentamos os termos estocásticos.

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

## Performance das funções

Aqui, vamos apenas conferir que as funções `SIR!(du, u, p, t)` e `SIR_noise!(du, u, p, t)` estão bem construídas e não alocam memória. Fazemos isso com a macro `BenchmarkTools.@btime`.
```julia:btime_sir
using BenchmarkTools

let u = [800.0, 200.0]; p = (1000.0, 0.2, 0.15, 0.15, 0.1); t = 1.0; du = Vector{Float64}(undef, 2); du_noise = Matrix{Float64}(undef, 2, 2)
    println("Benchmark SIR!")
    println(@btime SIR!($du, $u, $p, $t))
    println("\nBenchmark SIR_noise!")
    println(@btime SIR_noise!($du_noise, $u, $p, $t))
end
```

\output{btime_sir}

Bom, tudo indica que as funções estão em ordem. Mas também podemos usar a macro `InteractiveUtils.@code_warntype` para verificar se há alguma instabilidade de tipo. Observe que, mesmo usando um vetor de inteiros na variável `u` e um rational em um dos parâmetros, não há problema de instabilidade de tipo. Isso não quer dizer que isso não afete a performance. Há um certo custo computacional nas conversões entre tipos diferentes, mesmo que para variáveis diferentes, ou seja, sem instabilidade de tipo de uma mesma variável (verifique isso usando `@btime` com os parâmetros abaixo!).

```julia:code_warntype_sir
using InteractiveUtils

let u = [800, 200]; p = (1000.0, 0.2, 0.15, 0.15, 1//10); t = 1.0; du = Vector{Float64}(undef, 2); du_noise = Matrix{Float64}(undef, 2, 2)
    println("@code_warntype for SIR!")
    println(@code_warntype SIR!(du, u, p, t))
    println("\n@code_warntype for SIR_noise!")
    println(@code_warntype SIR_noise!(du_noise, u, p, t))
end
```

\output{code_warntype_sir}
