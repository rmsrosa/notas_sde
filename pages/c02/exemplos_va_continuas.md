@def title = "Variáveis aleatórias contínuas"

# {{ get_title }}

Uma variável aleatória contínua assume valores em $\mathbb{R}.$ A probabilidade de um determinado valor $x$ ocorrer é expressa por
$$
\mathbb{P}(X = x).
$$
Também podemos expressar a probabilidade de um certo conjunto $E$ de valores ocorrer:
$$
\mathbb{P}(X \in E).
$$
Em Teoria da Medida, escreveríamos isso simplesmente como $\mathbb{P}(E).$ De qualquer forma, não é necessário escrever o conjunto de forma explícita. Por exemplo, se quisermos saber a probabilidade da variável aleatória ser positiva, podemos escrever
$$
\mathbb{P}(X > 0)
$$
ao invés de $\mathbb{P}(X \in (0, \infty)).$ Aqui, estamos representando $E = \{ X > 0 \} = \{x \in \mathbb{R}; \;x > 0\} = (0, \infty).$

A **função acumulada de probabilidades** é dada, como no caso discreto, por
$$
f(x) = \mathbb{P}(X \leq x), \quad x \in \mathbb{R}.
$$

A função acumulada de probabilidade define unicamente a variável aleatória (a menos de um conjunto de medida nula).

Em muitos casos, podemos expressar uma probabilidade contínua em termos de uma **função de densidade de probabilidades** $p(x),$ de tal forma que
$$
\mathbb{P}(X \in E) = \int_\mathbb{R} \chi_E(x) p(x) \;\mathrm{d}x = \int_E p(x) \;\mathrm{d}x,
$$
onde $\chi_E(x)$ é a função característica de um conjunto $E,$ ou seja, vale $1,$ se $x\in E,$ caso contrário, vale $0.$

Se $E = \{a \leq X \leq b},$ temos, em particular,
$$
  \mathbb{P}(a \leq X \leq b) = \int_a^b p(x) \;\mathrm{d}x.
$$

Necessariamente, a função densidade de probabilidades deve ser não negativa e ter massa 1:
$$
p(x) \geq 0, \qquad \int p(x) \;\mathrm{d}x = 1.
$$

Observe que a função distribuição de probabilidades é a derivada da função acumulada de probabilidades. De fato, temos, formalmente,
$$
  f(x) = \mathbb{P}(X \leq x) = \int_{-\infty}^x p(x) \;\mathrm{d}x,
$$
de maneira que
$$
  p(x) = \frac{\mathrm{d}f(x)}{\mathrm{d}x}.
$$

Portanto, a função densidade de probabilidades só existe quando a função acumulada de probabilidades é derivável quase sempre. Esse resultado pode ser generalizado para contexto bem mais gerais de acordo com o **Teorema de Radon-Nikodym**.

Vejamos alguns exemplos de variáveis aleatórias contínuas.

## Distribuição uniforme

Dado um intervalo finito $I\subset \mathbb{R},$ a distribuição uniforme está associada a uma variável que pode assumir qualquer valor nesse intervalo, com a mesma probabilidade. A função de densidade de probabilidades é um múltiplo da função característica do intervalo $I$:
$$
f(x) = \frac{1}{|I|}\chi_I(x) = \begin{cases} \displaystyle \frac{1}{|I|}, & x \in I, \\ 0, & x \notin I, \end{cases}
$$
onde $|I|$ é o comprimento de $I,$ já que devemos ter massa um, $\int f = 1.$ Observe que, como o intervalo $I$ é contínuo, as chances de termos um valor específico $x_0$ é nula. Mas as chances de termos um valor em um determinado subintervalo $J\subset I$ são iguais à fração do comprimento desse intervalo no intervalo total, i.e.
$$
\mathbb{P}(X \in J) = \frac{|J|}{|I|}
$$

Uma distribuição uniforme em um intervalo $I$ é denotada por $\mathcal{U}_I$ e escrevemos
$$
X \sim \mathcal{U}_I.
$$

Por exemplo, caso $I = [\alpha, \beta),$ então a variável aleatória $X \sim \mathcal{U}_{[\alpha, \beta)}$ tem sua função densidade de probabilidades dada por
$$
f(x) = \begin{cases} \displaystyle \frac{1}{\beta - \alpha}, & \alpha \leq x < \beta, \\ 0, & x < \alpha \text{ ou } x \geq \beta. \end{cases}
$$

```julia:cdfuniform
#hideall
using Plots
theme(:ggplot2)
a = 1
b = 4
xx = 0:0.01:5
plot(xx, x -> (a <= x < b) / (b - a), ylims = (0, 1), fill = true, title = "Função densidade de probabilidades da distribuição uniforme em [$a, $b)", titlefont = 10, label = false)
savefig(joinpath(@OUTPUT, "cdfuniform.svg"))
```
\fig{cdfuniform}

## Distribuição normal

A distribuição normal com média $\mu$ e desvio padrão $\sigma,$ ou seja, variância $\sigma^2,$ é denotada por $\mathcal{N}(\mu, \sigma^2).$ Sua função densidade de probabilidades é
$$
  f(x) = \frac{1}{2\pi \sigma^2} e^{\displaystyle - \frac{x^2}{2\sigma^2}}.
$$
Uma variável aleatória cuja distribuição é dada por uma normal é designada por
$$
  X \sim \mathcal{N}(\mu, \sigma^2)
$$

Vimos, por exemplo, nos modelos para o movimento Browniano, que a variável aleatória $X_t$ para a posição da partícula no instante $t$ é uma normal com média $0$ e variância $2Dt,$ para algum $D > 0,$ ou seja
$$
  X_t \sim \mathcal{N}(0, 2Dt), \quad t > 0.
$$

```julia:cdfnormal
#hideall
using Plots
theme(:ggplot2)
μ = 2.0
σ = 1.0 
xx = -2.0:0.01:6.0
plot(xx, (2π * σ^2) .* exp.( - ( ( xx .- μ ).^ 2) ./ (2σ^2) ), fill = true, title = "Função densidade de probabilidades da distribuição normal (μ = $μ, σ = $σ)", titlefont = 10, label = false)
yy = [μ - 2σ μ - σ μ μ + σ μ + 2σ] |> xx -> (2π * σ^2) .* exp.( - ( ( xx .- μ ).^ 2) ./ (2σ^2) )
plot!([μ - 2σ μ - σ μ μ + σ μ + 2σ; μ - 2σ μ - σ μ μ + σ μ + 2σ], [0 0 0 0 0; yy], color = [:red :orange :cyan :orange :red], linewidth = 2, label = [nothing nothing "μ" "μ ± σ" "μ ± 2σ"])
savefig(joinpath(@OUTPUT, "cdfnormal.svg"))
```
\fig{cdfnormal}

## Delta de Dirac

Um exemplo fundamental e que não possui função densidade de probabilidades é a distribuição **delta de Dirac**. Em termos de variáveis aleatórias, ela aparece quando o valor é dado com probabilidade 1, e.g. $X = x_0$ com probabilidade 1. Nesse caso, temos
$$
\mathbb{P}(X = x_0) = 1, \qquad \mathbb{P}(X \neq x_0) = 0.
$$
A distribuição de probabilidades associada a essa variável é exatamente a delta de Dirac no ponto $x_0,$ denotada por $\delta_{x_0}.$ Ou seja,
$$
X \sim \delta_{x_0}.
$$

Vimos esse exemplo no caso do movimento Browniano, onde a posição inicial da partícula é a origem. Em termos de variáveis aleatórias, escrevemos $X_0 = 0,$  *quase certamente*, i.e.
$$
X_0 \sim \delta_0.
$$

A delta de Dirac também pode ser obtida como limite da distribuição normal, quando a variância converge para zero:
$$
\mathcal{N}(\mu, \sigma^2) \rightarrow \delta_\mu, \quad \text{quando } \sigma \rightarrow 0,
$$
para qualquer $\mu$ fixo (ou mesmo com $\mu$ variando e convergindo para um determinado valor $\mu_0,$ caso em que teríamos $\delta_{\mu_0},$ no limite).

O limite acontece *no sentido fraco* (veremos melhor isso posteriormente), i.e. para qualquer função contínua limitada $f:\mathbb{R} \rightarrow \mathbb{R},$ temos
$$
\mathbb{E}_{\mathcal{N}(\mu, \sigma^2)}(f) \rightarrow \mathbb{E}_{\delta_\mu}(f) = f(\mu);
$$

Essa convergência fraca não implica na convergência $\mathbb{P}_{\mathcal{N}(\mu, \sigma^2)}(E) \rightarrow \mathbb{P}_{\delta_0}(E),$ para qualquer conjunto mensurável $E.$ De fato, seja $\mu = 0,$ para simplificar, e considere $A = [0, \infty)$ e $B = (0, \infty).$ Então, $\mathbb{P}_{\delta_0}(A) = 1$ e $\mathbb{P}_{\delta_0}(B) = 0,$ enquanto que $\mathbb{P}_{\mathcal{N}(0, \sigma^2)}(A) = \mathbb{P}_{\mathcal{N}(0, \sigma^2)}(B) = 1/2,$ para todo $\sigma > 0.$ Tal convergência só acontece quando $E$ é um conjunto de continuidade em relação a $\delta_0,$ i.e. $\delta_0(\partial E) = 0,$ o que não é o caso de $A$ e $B.$
