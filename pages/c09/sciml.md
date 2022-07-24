@def title = "O ambiente SciML da linguagem Julia"

# {{ get_title }}

Estivemos, até agora, implementando diretamente os métodos numéricos, por motivos didáticos. Nas aplicações, porém, podemos utilizar pacotes numéricos que já têm esses e outros métodos implementados. Nos basta formular o problema de acordo com a interface de cada pacote (chamada de *api*, acrônimo de *application programming interface*).

Nesse sentido, o ambiente [SciML - The SciML Open Source Software Ecosystem](https://docs.sciml.ai/dev/) é um dos cavalos de força da linguagem [Julia](The SciML Open Source Software Ecosystem), com uma ampla gama de métodos implementados e otimizados. Há não apenas métodos para aproximar os caminhos amostrais de soluções de equações estocásticas e aleatórias, mas também para serem usados em conjunto com métodos de determinação de parâmetros, quantificação de incertezas, redes neurais e modelagem simbólica.

Vamos ilustrar aqui como usar esse ambiente para resolver as equações tratadas até agora. Nos capítulos seguintes, exploraremos esse ambiente na resolução de problemas mais complexos, envolvendo sistemas de equações.

O ambiente contém pacotes para a resolução de [equações diferenciais estocásticas](https://docs.sciml.ai/dev/modules/DiffEqDocs/types/sde_types/), [equações estocástico-algébricas](https://docs.sciml.ai/dev/modules/DiffEqDocs/types/sdae_types/), [equações estocásticas com retardamento/atraso](https://docs.sciml.ai/dev/modules/DiffEqDocs/types/sdde_types/) e [equações diferenciais aleatórias](https://docs.sciml.ai/dev/modules/DiffEqDocs/types/rode_types/), além de diversos métodos para equações determinísticas (veja [Domains of SciML](https://docs.sciml.ai/dev/#Domains-of-SciML)).

O ambiente [SciML - The SciML Open Source Software Ecosystem](https://docs.sciml.ai/dev/) é uma [organização SciML no github](https://github.com/SciML) e mantém, mais precisamente, uma [longa lista de repositórios](https://github.com/orgs/SciML/repositories) com pacotes Julia. É possivel instalar o pacote [SciML/DifferentialEquations.jl](https://github.com/SciML/DifferentialEquations.jl) que é um *wrapper* para quase todos os pacotes. Isso facilita em um certo sentido, mas por outro lado torna a instalação mais lenta e pesada. Uma alternativa é instalar apenas os pacotes necessários para o problema em questão. Para os nossos objetivos, vamos instalar apenas os pacotes [SciML/OrdinaryDiffEq.jl](https://github.com/SciML/OrdinaryDiffEq.jl/tree/master/src), que contém os métodos para a resolução de equações diferenciais ordinárias determinísticas, e [SciML/StochasticDiffEq.jl](https://github.com/SciML/StochasticDiffEq.jl), que contém os pacotes para a resolução de equações diferenciais aleatórias e estocásticas.

## Resolvendo equações aleatórias

Vamos ver como usar [a interface para equações aleatórias](https://docs.sciml.ai/dev/modules/DiffEqDocs/types/rode_types/), acessível pelo pacote [SciML/StochasticDiffEq.jl](https://github.com/SciML/StochasticDiffEq.jl). Além dele, usamos o pacote [JuliaPlots/Plots.jl](https://github.com/JuliaPlots/Plots.jl), com o tema `:ggplot2`, para os gráficos. Para utilizar esses pacotes, usamos as seguintes linhas de código.

```julia
using StochasticDiffEq
using Plots
theme(:ggplot2)
```

Para ver como usar o pacote de equações estocásticas, é útil ver os exemplos em [tutorial SciML - RODE](https://docs.sciml.ai/dev/modules/DiffEqDocs/tutorials/rode_example/). A interface considera uma equação da forma
$$
\frac{\mathrm{d}u}{\mathrm{d}t} = f(u, p, t, W(t)),
$$
com uma condição inicial
$$
u(t_0) = u_0.
$$

O objetivo da interface é disponibilizar métodos para aproximar um *caminho amostral* dessa equação, de maneira que a condição inicial deve ser informada como sendo uma variável do tipo `Number` (como `Float64`, `Float32`, `Int`, etc.), ou do tipo `AbstractArray{<:Number}` (no caso de sistemas de equações ou, até mesmo, de um conjunto amostral).

Além disso, devemos informar a função `f(u, p, t, W)`, onde `p` é um conjunto de parâmetros, `t` é a variável temporal, e `W` representa um processo estocástico.

O conjunto de parâmetros `p` pode ser dado de várias maneiras, como, por exemplo, um vetor ou uma lista de números ou outros tipos. A variável temporal `t` deve ser um número. E o processo `W` é um *ruído* conforme definido em [ScimML/DiffEqNoiseProcess.jl](https://noise.sciml.ai/stable/).

A solução numérica é obtida através de um *problema* montado via `RODEProblem()`, que tem duas assinaturas:

1. `RODEProblem(f::RODEFunction,u0,tspan,p=NullParameters();noise=WHITE_NOISE,rand_prototype=nothing,callback=nothing)`
2. `RODEProblem{isinplace}(f,u0,tspan,p=NullParameters();noise=WHITE_NOISE,rand_prototype=nothing,callback=nothing,mass_matrix=I)`.

A primeira é apropriada para problemas escalares, junto com uma função `f` definida da forma `f(u, p, t, W)`. Essa forma é apropriada para o caso em que `u` é imutável, como no caso escalar, e uma imutável `du` do mesmo tipo é retornado (e.g. `u::Float64` e `du::Float64`). No caso de um sistema, com `u` sendo um vetor ou um array (e.g. `u::Vector{Float64}`), então o ideal é usar a versão `f!(du, u, p, t, W)`, onde um vetor, ou array, `du`, do mesmo tipo que `u`, é utilizado para conter o resultado da função, evitando novas alocações e um acúmulo desnecessário de alocações e recursos computacionais, a cada iteração.


Mais detalhes sobre a inferface em [RODE Problems](https://docs.sciml.ai/dev/modules/DiffEqDocs/types/rode_types/).

```julia:rode_via_sciml
using StochasticDiffEq
using Plots
theme(:ggplot2)

function f(u, p, t, W)
    du = 2 * u * sin(W)
    return du
end

u0 = 1.00
tspan = (0.0, 5.0)
prob = RODEProblem(f, u0, tspan)

sol = solve(prob, RandomEM(), dt=1/100)

plot(sol)

#hide savefig(joinpath(@OUTPUT, "rode_via_sciml.svg"))
```

\output{rode_via_sciml}

\fig{rode_via_sciml}

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

plot(sol)

#hide savefig(joinpath(@OUTPUT, "rode_via_sciml_pop.svg"))
```

\output{rode_via_sciml_pop}

\fig{rode_via_sciml_pop}