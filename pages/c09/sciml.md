@def title = "O ambiente SciML da linguagem Julia"

# {{ get_title }}

Estivemos, até agora, implementando diretamente os métodos numéricos, por motivos didáticos. Nas aplicações, porém, podemos utilizar pacotes numéricos que já têm esses e outros métodos implementados. Nos basta formular o problema de acordo com a interface de cada pacote (chamada de *api*, acrônimo de *application programming interface*).

Nesse sentido, o ambiente [SciML - The SciML Open Source Software Ecosystem](https://docs.sciml.ai/dev/) é um dos carros chefes da linguagem [Julia](The SciML Open Source Software Ecosystem), com uma ampla gama de métodos implementados e otimizados. Há não apenas métodos para aproximar os caminhos amostrais de soluções de equações estocásticas e aleatórias, mas também para serem usados em conjunto com métodos de determinação de parâmetros, quantificação de incertezas, redes neurais e modelagem simbólica.

Vamos ilustrar aqui como usar esse ambiente para resolver as equações tratadas até agora. Nos capítulos seguintes, exploraremos esse ambiente na resolução de problemas mais complexos, envolvendo sistemas de equações.

O ambiente contém pacotes para a resolução de [equações diferenciais estocásticas](https://docs.sciml.ai/dev/modules/DiffEqDocs/types/sde_types/), [equações estocástico-algébricas](https://docs.sciml.ai/dev/modules/DiffEqDocs/types/sdae_types/), [equações estocásticas com retardamento/atraso](https://docs.sciml.ai/dev/modules/DiffEqDocs/types/sdde_types/) e [equações diferenciais aleatórias](https://docs.sciml.ai/dev/modules/DiffEqDocs/types/rode_types/), além de diversos métodos para equações determinísticas (veja [Domains of SciML](https://docs.sciml.ai/dev/#Domains-of-SciML)).

O ambiente [SciML - The SciML Open Source Software Ecosystem](https://docs.sciml.ai/dev/) é uma [organização SciML no github](https://github.com/SciML) e mantém, mais precisamente, uma [longa lista de repositórios](https://github.com/orgs/SciML/repositories) com pacotes Julia. É possivel instalar o pacote [SciML/DifferentialEquations.jl](https://github.com/SciML/DifferentialEquations.jl) que é um *wrapper* para quase todos os pacotes. Isso facilita em um certo sentido, mas por outro lado torna a instalação mais lenta e pesada. Uma alternativa é instalar apenas os pacotes necessários para o problema em questão. Para os nossos objetivos, vamos instalar apenas os pacotes [SciML/OrdinaryDiffEq.jl](https://github.com/SciML/OrdinaryDiffEq.jl/tree/master/src), que contém os métodos para a resolução de equações diferenciais ordinárias determinísticas, e [SciML/StochasticDiffEq.jl](https://github.com/SciML/StochasticDiffEq.jl), que contém os pacotes para a resolução de equações diferenciais aleatórias e estocásticas.

## Resolvendo equações diferenciais ordinárias via SciML

Nesse caso, usamos o pacote [SciML/OrdinaryDiffEq.jl](https://github.com/SciML/OrdinaryDiffEq.jl), junto com o [JuliaPlots/Plots.jl](https://github.com/JuliaPlots/Plots.jl).
```julia
using OrdinaryDiffEq
using Plots
theme(:ggplot2)
```

Para aprender a usar o pacote, é útil ver os exemplos em [tutorial SciML - ODE](https://diffeq.sciml.ai/stable/tutorials/ode_example/). A interface considera um *problema de valor inicial,* da forma
$$
\frac{\mathrm{d}u}{\mathrm{d}t} = f(u, p, t), \quad t_0 \leq t \leq T,
$$
com uma condição inicial
$$
u(t_0) = u_0.
$$

Devemos informar a função `f(u, p, t)`, onde `u` é a variável dependente, `p` é um conjunto de parâmetros e `t` é a variável temporal. O conjunto de parâmetros `p` pode ser dado de várias maneiras, como, por exemplo, um escalar, um vetor ou uma lista de números ou de outros tipos. A variável temporal `t` deve ser um número.


A solução numérica é obtida através de um *problema* montado via `ODEProblem()`, que tem duas assinaturas:

1. `ODEProblem(f::ODEFunction,u0,tspan,p=NullParameters();kwargs...)`;
2. `ODEProblem{isinplace}(f,u0,tspan,p=NullParameters();kwargs...)`.

Na prática, a principal diferença é se o primeiro argumento é da forma `f(u, t, p)` ou da forma `f!(du, u, t, p)`. Lembre-se que a exclamação ao final do nome da função é apenas uma convenção, para informar se a função altera um dos seus argumentos ou não. O que distingue as duas funções é que a primeira tem três argumentos e a segunda tem quatro argumentos. Ao definirmos um `ODEProblem(f, u0, tspan, ...)` ou um `ODEProblem(f!, u0, tspan, ...)`, a interface irá escolher o método certo baseado na forma da função passada como primeiro argumento e não por conta da exclamação, que é indiferente para ela.

A primeira forma da função, `f(u, p, t)`, retorna um valor armazenado em uma nova variável `du`, que é usada como sendo a derivada temporal de `u`. A segunda forma recebe uma variável `du` já alocada na memória e apenas atualiza o valor dessa variável com a derivada de `u`. O primeiro caso é apropriado para equações escalares, em que `u` e `du` são variáveis imutáveis (e.g. `u::Float64` e `du::Float64`). O segundo caso é apropriado para sistemas de equações, onde `u` e `du` são vetores ou arrays (e.g. `u::Vector{Float64}`), portanto mutáveis, sendo muito mais eficiente atualizar o valor de `du` do que criar um novo vetor a cada iteração, gerando novas alocações e um acúmulo desnecessário de recursos computacionais.

Além de passarmos a função para `ODEProblem()`, devemos informar, também, a condição initial `u_0`, o intervalo de tempo `tspan` e, se necessário, o conjunto de parâmetros `p`.

Uma vez montado um problema `prob = ODEProblem(f, u0, tspan, ...)`, podemos resolvê-lo através da função `solve`. Se tivermos o pacote [SciML/DifferentialEquations.jl](https://github.com/SciML/DifferentialEquations.jl) carregado, basta escrevermos `solve(prob)` que a interface escolhe um método numérico apropriado para resolver o problema. Mas, como dissemos acima, esse pacote é muito pesado, pois carrega dezenas de pacotes do ambiente SciML. Além disso, um objetivo principal aqui é didático. Assim, optamos por não carregar esse pacote e escolher explicitamente o método numérico. Assim, devemos informar o método numérico e quaisquer outros parâmetros necessários para o método.

Vamos ilustrar isso resolvendo a equação logística
$$
\frac{\mathrm{d}u}{\mathrm{d}t} = (\alpha - \beta u) u, \quad 0 \leq t \leq T,
$$
com condição inicial
$$
u(0) = u_0.
$$

Definimos
```julia
function f_logistic(u, p, t)
    α, β = p
    du = (α - β  * u) * u
    return du
end
```

Para geramos o problema de valor inicial, escolhemos os parâmetros e chamamos `ODEProblem()`:
```julia
u0 = 0.01
α = 3.0
β = 2.0
p = (α, β)
tspan = (0.0, 5.0)
prob = ODEProblem(f_logistic, u0, tspan, p)
```

Uma vez montado esse problema, podemos resolvê-lo usando o método `Tsit5()` (veja mais sobre este e outros métodos em [ODE Solvers](https://diffeq.sciml.ai/stable/solvers/ode_solve/#ode_solve)):
```julia
sol = solve(prob, Tsit5())
```

Abaixo o código completo e o resultado da simulação

```julia:ode_via_sciml_pop
using OrdinaryDiffEq
using Plots
theme(:ggplot2)

function f_logistic(u, p, t)
    α, β = p
    du = (α - β * u) * u
    return du
end

u0 = 0.01
α = 3.0
β = 2.0
p = (α, β)
tspan = (0.0, 5.0)
prob = ODEProblem(f_logistic, u0, tspan, p)

sol = solve(prob, Tsit5())

plot(sol, title = "solução da equação logística determinística", titlefont = 10, xaxis = "t", yaxis = "x", label = false, size = (800, 600))

savefig(joinpath(@OUTPUT, "ode_via_sciml_pop.svg")) # hide
```

\output{ode_via_sciml_pop}

\fig{ode_via_sciml_pop}

## Resolvendo um conjunto de equações com parâmetros variados

Na análise de quantificação de incertezas e no estudo da sensibilidade do modelo nos parâmetros é útil considerar parâmetros com uma determinada incerteza, ou seja, com parâmetros como variáveis aleatórias.

Para isso, podemos usar o método de Monte-Carlo e inferir as estatísticas do processo estocástico através de um conjunto de soluções. Podemos fazer isso resolvendo uma série de problemas de valor inicial como acima. Para facilitar esse processo e, inclusive, a análise do conjunto de soluções, os pacotes do SciML disponibilizam um `EnsembleProblem()`, a ser montado a partir de um problema de valor inicial, como o `ODEProblem()`. Em seguida, podemos acessar um resumo do resultado do conjunto de simulações através de `EnsembleSummary()`. Mais informações na página [Parallel Ensemble Simulations](https://diffeq.sciml.ai/stable/features/ensemble/).

Para esse fim, o método `EnsembleProblem()` recebe o problema `prob` a ser resolvido e uma função `prob_func= (prob,i,repeat)->(prob)` que altera o problema de valor inicial a cada iteração. Por exemplo, podemos alterar a condição inicial ou um dos parâmetros da equação. Para alterar a condição inicial e/ou os parâmetros, temos algums opções. Caso sejam mutáveis (e.g. vetores, arrays, etc.), podemos redefinir diretamente `prob.u0` e/ou `prob.p`. Mas caso eles, ou algum deles, seja imutável, como no caso logístico acima, podemos montar um novo problema do zero ou montar alterando algum parâmetro através da função `remake()`. Por exemplo, `remake(prob, u0 = 1.0, p = (2.0, 1.0))` altera a condição inicial e os parâmetros.

Assim, se quisermos alterar a condição inicial $u_0$ uniformemente entre os valores $0.2$ e $0.3$ e os parâmetros $\alpha$ e $\beta$ também uniformemente entre determinados valores, definimos
```julia
prob_func(prob, i, repeat) = remake(prob, u0 = 0.2 + 0.1 * rand(), p = (3.0 + 0.01 * randn(), 2.0 + 0.02 * randn()))
```

Essa função é, então, passada para o `EnsembleProblem()`, i.e.
```julia
ensemble_prob = EnsembleProblem(prob; prob_func)
```

Com isso, podemos resolver esse conjunto de problemas com `solve()`, informando o número de trajetórias a serem simuladas, e.g.
```julia
sols = solve(ensemble_prob, Tsit5(), EnsembleThreads(), trajectories=100)
```

A cada iteração, um novo valor inicial e novos valores dos parâmetros são sorteados e uma trajetória correspondente é calculada. O conjunto de trajetórias pode ser visualizado via `plot()`. Além disso, um sumário estatístico das simulações, informando, por exemplo, os intervalos de confiança, pode ser obtido com a função `EnsembleSummary(sols; quantiles=[0.25,0.75])`. Se o argumento `quantiles` não for informado, o *default* é de 95%. Esse sumário pode ser visualizado com a função `plot()`. Vejamos o exemplo completo abaixo. Varias estatísticas podem ser obtidas diretamente e `sols`, como pode ser visto em [Summary Statistics](https://diffeq.sciml.ai/stable/features/ensemble/#Summary-Statistics).

```julia:ode_via_sciml_pop_ensemb
using OrdinaryDiffEq
using Plots
theme(:ggplot2)

function f_logistic(u, p, t)
    α, β = p
    du = (α - β * u) * u
    return du
end

u0 = 0.1
α = 3.0
β = 2.0
p = (α, β)
tspan = (0.0, 5.0)
prob = ODEProblem(f_logistic, u0, tspan, p)

prob_func(prob, i, repeat) = remake(prob, u0 = 0.2 + 0.1 * rand(), p = (3.0 + 0.01 * randn(), 2.0 + 0.02 * randn()))

ensemble_prob = EnsembleProblem(prob; prob_func)

sols = solve(ensemble_prob, Tsit5(), EnsembleThreads(), trajectories=20)

plot(title = "soluções da equação logística", titlefont = 12, xaxis = "t", yaxis = "população", size = (800, 600))
plot!(sols, color = 1, alpha = 0.1)
plot!(sols[1])
savefig(joinpath(@OUTPUT, "ode_via_sciml_pop_ensemb_trajectories.svg")) # hide

sols = solve(ensemble_prob, Tsit5(), EnsembleThreads(), trajectories=250, saveat = range(tspan..., length = 200))

summ95 = EnsembleSummary(sols)
summ50 = EnsembleSummary(sols; quantiles=[0.25,0.75])
plot(title = "valor esperado e intervalos de confiança", titlefont = 12, xaxis = "t", yaxis = "população", size = (800, 600))
plot!(summ95, label = "95%")
plot!(summ50, label = "50%", legend = :bottomright)

savefig(joinpath(@OUTPUT, "ode_via_sciml_pop_ensemb.svg")) # hide
```

\output{ode_via_sciml_pop_ensemb}

\fig{ode_via_sciml_pop_ensemb_trajectories}

\fig{ode_via_sciml_pop_ensemb}

## Resolvendo equações aleatórias via SciML

Vamos ver, agora, como usar [a interface para equações aleatórias](https://docs.sciml.ai/dev/modules/DiffEqDocs/types/rode_types/). Desta vez, usamos o pacote [SciML/StochasticDiffEq.jl](https://github.com/SciML/StochasticDiffEq.jl). Começamos carregando os pacotes.

```julia
using StochasticDiffEq
using Plots
theme(:ggplot2)
```

Para equações aleatórias, é útil ver os exemplos em [tutorial SciML - RODE](https://docs.sciml.ai/dev/modules/DiffEqDocs/tutorials/rode_example/). A interface considera um *problema de valor inicial,* da forma
$$
\frac{\mathrm{d}u}{\mathrm{d}t} = f(u, p, t, W(t)), \quad t_0 \leq t \leq T,
$$
com uma condição inicial
$$
u(t_0) = u_0.
$$

O objetivo da interface é disponibilizar métodos para aproximar um *caminho amostral* dessa equação, de maneira que a condição inicial deve ser informada como sendo uma variável do tipo `Number` (como `Float64`, `Float32`, `Int`, etc.), ou do tipo `AbstractArray{<:Number}` (no caso de sistemas de equações ou, até mesmo, de um conjunto amostral).

Além disso, devemos informar a função `f(u, p, t, W)`, onde `p` é um conjunto de parâmetros, `t` é a variável temporal, e `W` representa um processo estocástico. O processo `W` é um *ruído* conforme definido em [ScimML/DiffEqNoiseProcess.jl](https://noise.sciml.ai/stable/).

A solução numérica é obtida através de um *problema* montado via `RODEProblem()`, que tem duas assinaturas:

1. `RODEProblem(f::RODEFunction,u0,tspan,p=NullParameters();noise=WHITE_NOISE,rand_prototype=nothing,callback=nothing)`
2. `RODEProblem{isinplace}(f,u0,tspan,p=NullParameters();noise=WHITE_NOISE,rand_prototype=nothing,callback=nothing,mass_matrix=I)`.

Como no caso determinístico, a principal diferença é se o primeiro argumento é da forma `f(u, t, p, W)` ou da forma `f!(du, u, t, p, W)`. Ao definirmos um `RODEProblem(f, u0, tspan, ...)` ou um `RODEProblem(f!, u0, tspan, ...)`, a interface irá escolher o método certo baseado na forma da função passada como primeiro argumento.

Uma vez montado um problema `prob = RODEProblem(f, u0, tspan, ...)`, podemos resolvê-lo através da função `solve`, informando o método numérico apropriado. No caso de equações estocásticas aleatórias, o único método disponível é o de Euler-Maruyama. Outros métodos podem ser acessados convertendo a equação aleatória em uma equação estocástica, visto que há uma ampla gama de métodos implementados para estas equações, mas para equações aleatórias, especificamente, temos apenas o Euler-Maruyama. Para revolvermos via Euler-Maruyama, passamos o argumento `RandomEM()`, que identifica esse método. Este é um método de passo fixo e devemos, também, passar o tamanho do passo. Assim, podemos resolver o problema via `sol = solve(prob, RandomEM(), dt=1/100)`.

Uma vez resolvido o problema, podemos acessar os instantes de tempo via `sol.t`, os valores ao longo do tempo via `sol.u` e exibir a evolução da solução `u(t)` diretamente via `plot(sol)`. Podemos passar diversos argumentos da função `plot` para construir o gráfico.

Mais detalhes sobre a inferface podem ser vistos na página [RODE Problems](https://docs.sciml.ai/dev/modules/DiffEqDocs/types/rode_types/).

Agora, na prática, queremos inferir a evolução do processo como um todo, não apenas de um caminho amostral. Para isso, podemos usar o método de Monte-Carlo e inferir as estatísticas do processo estocástico através de um conjunto de caminhos amostrais. Podemos fazer isso resolvendo uma série de problemas de valor inicial como acima. Para facilitar esse processo e, inclusive, a análise do conjunto de soluções, os pacotes do SciML disponibilizam um `EnsembleProblem()`, a ser montado a partir de um problema de valor inicial, como o `RODEProblem()`. Em seguida, podemos acessar um resumo do resultado do conjunto de simulações através de `EnsembleSummary()`. Mais informações na página [Parallel Ensemble Simulations](https://diffeq.sciml.ai/stable/features/ensemble/).

### Resolvendo uma equação aleatória simples

Por exemplo, vamos considerar o problema concreto
$$
\frac{\mathrm{d}u}{\mathrm{d}t} = \sin(W) u, \quad t_0 \leq t \leq T,
$$
com uma condição inicial
$$
u(t_0) = x_0.
$$
Nesse caso, podemos definir a função da seguinte forma
```julia
f(u, p, t, W) = sin(W) * u
```

Para geramos o problema de valor inicial, escolhemos os parâmetros $x_0 = 1$, $t_0 = 0$ e $T = 5$ e definimos
```julia
u0 = 1.0
tspan = (0.0, 5.0)
prob = RODEProblem(f, u0, tspan)
```

Uma vez montado esse problema, podemos resolvê-lo via
```julia
sol = solve(prob, RandomEM(), dt=1/100)
```

Após a simulação, podemos exibir o gráfico da solução via `solve`. Abaixo o código completo e o resultado da simulação.

```julia:rode_via_sciml
using StochasticDiffEq
using Plots
theme(:ggplot2)

f(u, p, t, W) = sin(W) * u

u0 = 1.0
tspan = (0.0, 5.0)
prob = RODEProblem(f, u0, tspan)

sol = solve(prob, RandomEM(), dt=1/100)

plot(sol, title = "solução da equação diferencial aleatória `u' = sin(W)u` com `u(0) = 1.0`", titlefont = 10, xaxis = "t", yaxis = "x", label = false, size = (800, 600))

savefig(joinpath(@OUTPUT, "rode_via_sciml.svg")) # hide
```

\output{rode_via_sciml}

\fig{rode_via_sciml}

### Resolvendo a equação logística aleatória

Vejamos, agora, como implementar a equação logística aleatória discutida anteriormente. A equação tem a forma
$$
\frac{\mathrm{d}X_t}{\mathrm{d}t} = (A_t - B_t X_t)X_t,
$$
onde
$$
A_t = a + \delta Y_t, \qquad B_t = b + \varepsilon Z_t,
$$
com
$$
a, b, \delta, \varepsilon > 0, \quad a - \delta > 0, \quad b - \varepsilon > 0,
$$
e onde
$$
Y_t = \frac{W_t}{1 + |W_t|}, \quad Z_t = \sin(W_t).
$$

Assim, podemos definir a função `f(t, u, p, W)` como
```julia
function f(u, p, t, W)
    a, b, δ, ε = p
    Y = W / (1 + abs(W))
    Z = sin(W)
    A = a + δ * Y
    B = b + ε * Z
    du = (A - B * u) * u
    return du
end
```

Observe que poderíamos ter escrito diretamente
```julia
f(u, p, t, W) = (p[1] + p[3] * W / (1 + abs(W)) - (p[2] + p[3] * sin(W)) * u) * u
```
mas, nesse caso, não há custo computacional algum em se introduzir as variáveis auxiliares e deixar o código mais claro. Isso pode ser verificado através da função de introspecção `@code_typed` (leia mais sobre isso em [Intermediate and compiled representations](https://docs.julialang.org/en/v1/devdocs/reflection/#Intermediate-and-compiled-representations)), que exibe o mesmo conjunto de instruções para ambas as definições (verifique isso, por exemplo, através de `@code_typed f(1.0, (1.0, 2.0, 3.0, 4.0), 5.0, 6.0)` em ambas as formas da função `f`). Ou seja, as sintaxes adicionadas por nós para facilitar a leitura da função são otimizadas e descartadas pelo compilador.

O restante do código é essencialmente o mesmo diante, exceto que, agora, precisamos definir o conjunto `p` de parâmetros. Isso é feito no código completo, a seguir.

```julia:rode_via_sciml_pop
using StochasticDiffEq
using Plots
theme(:ggplot2)

function f(u, p, t, W)
    a, b, δ, ε = p
    Y = W / (1 + abs(W))
    Z = sin(W)
    A = a + δ * Y
    B = b + ε * Z
    du = (A - B * u) * u
    return du
end

u0 = 1.0
p = (3.0, 2.0, 0.1, 0.2)
tspan = (0.0, 5.0)
prob = RODEProblem(f, u0, tspan, p)

sol = solve(prob, RandomEM(), dt=1/100)

plot(sol, title = "solução da equação logística aleatória", titlefont = 10, xaxis = "t", yaxis = "x", label = false, size = (800, 600))

savefig(joinpath(@OUTPUT, "rode_via_sciml_pop.svg")) # hide
```

\output{rode_via_sciml_pop}

\fig{rode_via_sciml_pop}

Agora, na prática, queremos inferir a evolução do processo estocástico. Essa análise é facilitada pela função `EnsembleProblem()`. Isso é ilustrado a seguir.

```julia:rode_via_sciml_pop_ensemb
using StochasticDiffEq
using Plots
theme(:ggplot2)

function f(u, p, t, W)
    a, b, δ, ε = p
    Y = W / (1 + abs(W))
    Z = sin(W)
    A = a + δ * Y
    B = b + ε * Z
    du = (A - B * u) * u
    return du
end

u0 = 0.01
p = (3.0, 2.0, 0.1, 0.2)
tspan = (0.0, 8.0)
prob = RODEProblem(f, u0, tspan, p)

ensembleprob = EnsembleProblem(prob)
sols = solve(ensembleprob, RandomEM(), EnsembleThreads(), trajectories=100, dt=1/100)
plot(title = "soluções da equação logística aleatória", titlefont = 12, xaxis = "t", yaxis = "população", size = (800, 600))
plot!(sols, color = 1, alpha = 0.1)
plot!(sols[1])
savefig(joinpath(@OUTPUT, "rode_via_sciml_pop_ensemb_trajectories.svg")) # hide

sols = solve(ensembleprob, RandomEM(), EnsembleThreads(), trajectories=1000, dt=1/100)

summ95 = EnsembleSummary(sols)
summ50 = EnsembleSummary(sols; quantiles=[0.25,0.75])
plot(title = "valor esperado e intervalos de amostras", titlefont = 12, xaxis = "t", yaxis = "população", size = (800, 600))
plot!(summ95, label = "95% das amostras")
plot!(summ50, label = "50% das amostras", legend = :bottomright)

savefig(joinpath(@OUTPUT, "rode_via_sciml_pop_ensemb.svg")) # hide
```

\output{rode_via_sciml_pop_ensemb}

\fig{rode_via_sciml_pop_ensemb_trajectories}

\fig{rode_via_sciml_pop_ensemb}

## Resolvendo equações estocásticas via SciML

[A interface para a resolução de equações estocásticas](https://diffeq.sciml.ai/stable/types/sde_types/) é acessível pelo pacote [SciML/StochasticDiffEq.jl](https://github.com/SciML/StochasticDiffEq.jl). Nesse caso, precisamos informar a função de *drift* `f(u, p, t)` e a função de difusão `g(u, p, t)`. Veja os exemplos no [tutorial de SDE](https://diffeq.sciml.ai/stable/tutorials/sde_example/). A equação estocástica em questão tem a forma
$$
\mathrm{d}X_t = f(X_t, p, t)\;\mathrm{d}t + g(X_t, p, t)\;\mathrm{d}W_t
$$
onde agora incluímos explicitamente parâmetros $p$. Observe a troca de ordem dos argumentos $X_t$ e $t$, em relação ao formato tratado na parte teórica.

Há uma [série de métodos disponíveis para equações estocásticas](https://diffeq.sciml.ai/stable/solvers/sde_solve/). O Euler-Maruyama para equações estocásticas é definido simplesmente por `EM()`. Da mesma forma, podemos usar o método de Monte Carlo através do `EnsembleProblem()`, conforme descrito em [Parallel Ensemble Simulations](https://diffeq.sciml.ai/stable/features/ensemble/).

Vejamos um exemplo concreto, da ponte browniana, cuja equação tem a forma
$$
\mathrm{d}B_t = - \frac{B_t}{1-t}\;\mathrm{d}t + \;\mathrm{d}W_t,
$$
com condição inicial
$$
B_0 = 0.
$$

Nesse caso, resolvemos como feito a seguir.

```julia:sde_via_sciml_pop_ensemb
using StochasticDiffEq
using Plots
theme(:ggplot2)

let T = 1.0
    f(u, p, t) = - u / (T - t)
    g(u, p, t) = 1.0

    u0 = 0.0
    tspan = (0.0, T)
    prob = SDEProblem(f, g, u0, tspan)

    ensembleprob = EnsembleProblem(prob)
    sols = solve(ensembleprob, EM(), EnsembleThreads(), trajectories=100, dt=1/100)
    plot(title = "soluções da ponte browniana", titlefont = 12, xaxis = "t", yaxis = "x", size = (800, 600))
    plot!(sols, color = 1, alpha = 0.1)
    plot!(sols[1])
    savefig(joinpath(@OUTPUT, "sde_via_sciml_pop_ensemb_trajectories.svg")) # hide

    sols = solve(ensembleprob, EM(), EnsembleThreads(), trajectories=1000, dt=1/100)

    summ95 = EnsembleSummary(sols)
    summ50 = EnsembleSummary(sols; quantiles=[0.25,0.75])
    summ68 = EnsembleSummary(sols; quantiles=[0.16,0.84])
    plot(title = "valor esperado e intervalos de amostras", titlefont = 12, xaxis = "t", yaxis = "população", size = (800, 600))
    plot!(summ95, label = "95% das amostras")
    plot!(summ68, label = "68% das amostras")
    plot!(range(tspan..., length = 200), [t -> sqrt(t * (1 - t)), t -> - sqrt(t * (1 - t))], color = 3, label = ["desvio padrão" nothing], legend = :topright)

    savefig(joinpath(@OUTPUT, "sde_via_sciml_pop_ensemb.svg")) # hide
end
```

\output{sde_via_sciml_pop_ensemb}

\fig{sde_via_sciml_pop_ensemb_trajectories}

\fig{sde_via_sciml_pop_ensemb}