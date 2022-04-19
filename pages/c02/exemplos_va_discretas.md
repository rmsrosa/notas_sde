@def title = "Variáveis aleatórias discretas"

# {{ get_title }}

Uma variável aleatória discreta finita possui um conjunto finito $\{x_1, \ldots, x_J\}$ de valores possíveis, $K\in \mathbb{N}$, com probabilidades
$$
P(X = x_j) = p_j, \quad j = 1, \ldots, J.
$$

O conjunto de probabilidades $\{p_j\}_j$ é chamada de **função massa de probabilidade** e, naturalmente, cada probabilidade deve ser não-negativa e a soma (massa) total deve ser 1:
$$
0 \leq p_j \leq 1, \qquad \sum_{j=1}^J p_j = 1.
$$

A **função distribuição acumulada** é definida por
$$
  f(x) = P(X \leq x) = \sum_{x_j \leq X} p_j
$$
e nos dá a probabilidade de termos uma realização menor ou igual a um dado valor $x$.

Vejamos alguns exemplos.

### Teste de Bernoulli

Uma **variável aleatória de Bernoulli** com parâmetro $p$, $0\leq p \leq 1$, possui dois resultados possíveis, $0$ e $1$, com probabilidades $p$ e $1-p$, respectivamente. Ou seja, $J = 2$, $x_1 = 0$, $x_2 = 1$, $p_1 = p$ e $p_2 = 1 - p$. Pode ser exemplificado como o resultado do lançamento de uma moeda, com $0$ e $1$ representando "cara" e "coroa", respectivamente. O resultado de teste de um exame de laboratório verificando a presença de um marcador para alguma doença pode ser "positivo" ou "negativo", podendo, também, ser modelado por uma variável de Bernoulli.

```julia:pmfbernoulli
#hideall
using Plots
theme(:ggplot2)
bar([0, 1], [1/2, 1/2], ylims = (0, 1), title = "Função massa de probabilidade da distribuição de Bernoulli", titlefont = 10, label = false)
savefig(joinpath(@OUTPUT, "pmfbernoulli.svg"))
```
\fig{pmfbernoulli}

```julia:pmfbernoullicum
#hideall
using Plots
theme(:ggplot2)
bar([0, 1], [1/2, 1], ylims = (0, 1), title = "Função distribuição acumulada de Bernoulli", titlefont = 10, label = false)
savefig(joinpath(@OUTPUT, "pmfbernoullicum.svg"))
```
\fig{pmfbernoullicum}

### Número de sucessos e a distribuição binomial

Podemos, também, jogar uma moeda $n$ vezes e contarmos o número de vezes em que o resultado é "cara", por exemplo. A probabilidade de não termos nenhuma cara é $1/2^n$, pois devemos ter exatamente $n$ coroas lançadas, sendo que cada uma tem probabilidade 1/2 de ocorrer. A probabilidade de termos exatamente uma cara é $n/2^n$, pois a cara pode vir em qualquer um dos $n$ lançamentos. Mais geralmente, temos um número
$$
  \left(\begin{matrix} n \\ i \end{matrix}\right) = \frac{n!}{i!(n-i)!}
$$
de combinações possíveis de exatamente $i$ resultados iguais (e.g. "caras"), em $n$ lançamentos. Assim, se $X$ é a variável aleatória contando o número de "caras" em $n$ lançamentos, então a probabilidade de termos $i$ caras é
$$
  P(X = i) = \frac{1}{2^n} \left(\begin{matrix} n \\ i \end{matrix}\right), \quad 1 \leq i \leq n.
$$

No caso de um dado viciado, ou, mais geralmente, de $n$ testes de Bernoulli com parâmetro $p$, $0\leq p \leq 1$, então a probabilidade de $i$ sucessos é
$$
  P(X = i) = p^i(1-p)^{n-i} \left(\begin{matrix} n \\ i \end{matrix}\right), \quad 1 \leq i \leq n.
$$

```julia:pmfbinomial
#hideall
using Plots
theme(:ggplot2)
p = 1//4
n = 6
ii = 1:n
bar(ii, p .^ ii .* ( 1 - p ) .^ (n .- ii), title = "Função massa de probabilidade da distribuição Binomial (n = $n, p = $p)", titlefont = 10, label = false)
savefig(joinpath(@OUTPUT, "pmfbinomial.svg"))
```
\fig{pmfbinomial}

```julia:pmfbinomialcum
#hideall
using Plots
theme(:ggplot2)
p = 1//4
n = 6
ii = 1:n
bar(ii, i -> sum(p .^ (1:i) .* ( 1 - p ) .^ (n .- (1:i))), title = "Função distribuição acumulada da Binomial (n = $n, p = $p)", titlefont = 10, label = false)
savefig(joinpath(@OUTPUT, "pmfbinomialcum.svg"))
```
\fig{pmfbinomialcum}

### Tempo de espera e a distribuição geométrica

Baseado no teste de Bernoulli, podemos considerar a variável aleatória que nos dá as chances de termos sucesso após $n$ tentativas fracassadas. Ou seja, em $n$ tentativas, temos insucesso nos primeiros $n-1$ testes e sucesso apenas no último teste. Se a chance de sucesso é $p$ e de fracasso é de $1-p$, com $0 < p \leq 1$, então temos probabilidade $(1-p)^{n-1}$ de insucessos nos $n$ primeiros testes e $p$ de sucesso no último teste, ou seja,
$$
P(X = n) = (1-p)^{n-1}p
$$
Essa distribuição é chamada de distribuição geométrica. Note que
$$
  \sum_{n=1}^\infty (1-p)^{n-1}p = p + (1-p)p + (1-p)^2p + \ldots = p(1 + (1-p) + (1-p)^2 + \ldots) = p \frac{1}{p} = 1.
$$

Observe que há uma questão de interpretação, aqui. A probabilidade $(1-p)^{n-1}p$ de termos sucesso *apenas* no $n$-ésimo é a mesma que a de termos apenas um sucesso em $n$ testes, independentemente de ser no último teste ou não.

Observe, ainda, que no caso da distribuição binomial discutida acima, fixamos o número $n$ de testes e analisamos a quantidade de sucessos nesses $n$ testes. Já na distribuição geométrica, podemos ter um número arbitrário de testes.

```julia:pmfgeometrica
#hideall
using Plots
theme(:ggplot2)
p = 1//4
n = 20
ii = 1:n
bar(ii, ( 1 - p ) .^ (ii .- 1) * p, title = "Função massa de probabilidade da distribuição Geométrica (p = $p)\nchance de sucesso só no lançamento n", titlefont = 10, label = false)
savefig(joinpath(@OUTPUT, "pmfgeometrica.svg"))
```
\fig{pmfgeometrica}

```julia:pmfgeometricacum
#hideall
using Plots
theme(:ggplot2)
p = 1//4
n = 20
ii = 1:n
bar(ii, i -> sum(( 1 - p ) .^ ((1:i) .- 1) * p), title = "Função distribuição acumulada da geométrica (p = $p)\nchance de sucesso até o lançamento n", titlefont = 10, label = false)
savefig(joinpath(@OUTPUT, "pmfgeometricacum.svg"))
```
\fig{pmfgeometricacum}

## Variávels aleatórias contínuas

