@def title = "Exemplos básicos"

# {{ get_title }}

Vamos considerar alguns exemplos básicos de equações diferenciais aleatórias.

## Exemplo linear autônomo

Começemos com o problema de valor inicial
$$
\begin{cases}
\displaystyle \frac{\mathrm{d} X_t}{\mathrm{d} t} = A X_t, & t \geq 0, \\
X_t|_{t = 0} = X_0,
\end{cases}
$$
onde $X_0$ e $A$ são variáveis aleatórias reais. Definimos
$$
X_t = X_0e^{tA}, \qquad t \geq 0.
$$
Como $f(t, a, c) = ce^{ta}$ é uma função contínua de $\mathbb{R}^3$ em $\mathbb{R},$ segue que $X_t$ está bem definido e é uma variável aleatória. Além disso, para quase todo $\omega,$ temos $A(\omega), X_0(\omega) \in \mathbb{R}$ e, com isso, temos os caminhos amostrais
$$
X_t(\omega) = X_0(\omega) e^{A(\omega)t}, \qquad \forall t\geq 0,
$$
que são (infinitamente) diferenciáveis em $t$ e são soluções da equação diferencial ordinária
$$
\begin{cases}
\displaystyle \frac{\mathrm{d} X_t(\omega)}{\mathrm{d} t} = A(\omega) X_t(\omega), & t \geq 0, \\
X_t(\omega)|_{t = 0} = X_0(\omega).
\end{cases}
$$

Logo, $\{X_t\}_{t\geq 0}$ é um processo que é uma solução por caminhos da equação diferencial aleatória acima, com a condição inicial desejada.

## Exemplo linear não autônomo com um processo como parâmetro

Vejamos, agora, o problema de valor inicial
$$
\begin{cases}
\displaystyle \frac{\mathrm{d} X_t}{\mathrm{d} t} = A_t X_t, & t \geq 0, \\
X_t|_{t = 0} = X_0,
\end{cases}
$$
onde $X_0$ é uma variável aleatória real e $\{A_t\}_{t \geq 0}$ é um processo real. Definimos
$$
X_t = X_0e^{\int_0^t A_s \;\mathrm{d}s}, \qquad t \geq 0.
$$
Assumimos que $t \mapsto A_t(\omega)$ é contínuo quase certamente, de maneira que os caminhos amostrais
$$
X_t(\omega) = X_0(\omega) e^{\int_0^t A_s(\omega) \;\mathrm{d}s}, \qquad \forall t\geq 0,
$$
são diferenciáveis em $t$ e são soluções da equação diferencial ordinária
$$
\begin{cases}
\displaystyle \frac{\mathrm{d} X_t(\omega)}{\mathrm{d} t} = A_t(\omega) X_t(\omega), & t \geq 0, \\
X_t(\omega)|_{t = 0} = X_0(\omega).
\end{cases}
$$

Logo, $\{X_t\}_{t\geq 0}$ é um processo que é uma solução por caminhos da equação diferencial aleatória acima, com a condição inicial desejada.

## Exemplo não linear com existência local

Considere
$$
\begin{cases}
\displaystyle \frac{\mathrm{d} X_t}{\mathrm{d} t} = A X_t^2, & t \geq 0, \\
X_0 = 1,
\end{cases}
$$
onde $A$ é uma variável aleatória com distribuição beta, por exemplo.

A distribuição beta está concentrada no intervalo $(0, 1),$ ou seja, para quase todo $\omega,$ temos $0 < A(\omega) < 1.$ Assim, para quase todo $\omega,$ a equação diferencial ordinária
$$
\begin{cases}
\displaystyle \frac{\mathrm{d} x(t)}{\mathrm{d} t} = A(\omega) x(t)^2, & t \geq 0, \\
x(0) = 1,
\end{cases}
$$
tem uma solução única
$$
x(t) = \frac{1}{1 - A(\omega)t}, \qquad 0 \leq t < \frac{1}{A(\omega)}.
$$
Como
$$
\frac{1}{A(\omega)} > 1,
$$
para quase todo $\omega,$ podemos definir, para todo $0 \leq t < 1,$ o processo aleatório $\{X_t\}_{t\in [0, 1)}$ por
$$
X_t = \frac{1}{1 - At},
$$
cujos caminhos amostrais são
$$
X_t(\omega) = \frac{1}{1 - A(\omega)t}, \qquad 0 \leq t < 1.
$$

Observe que $(t, a) \mapsto 1/(1 - at)$ é uma função contínua em $(t,a) \in [0, 1)\times [0, 1].$ Como $A$ tem suporte em $[0, 1],$ então essa função é Lebesgue-mensurável em $\mathbb{R}.$ Assim, $X_t$ é uma variável aleatória bem definida.

A função de distribuição acumulada de cada $X_t$ é dada por
$$
\mathbb{P}(X_t \leq x) = \mathbb{P}\left( \frac{1}{1 - A} \leq x\right) = \mathbb{P}\left( A \leq \frac{x - 1}{x}\right), \qquad 0 < x < 1,
$$
com $\mathbb{P}(X_t \leq x) = 0,$ para $x\leq 0$ e $\mathbb{P}(X_t \leq x) = 1,$ para $x\geq 1.$

A distribuição conjunta $\mathbb{P}(X_{t_1} \leq x_1, \ldots, X_{t_n} \leq x_n)$ também pode ser obtida de forma semelhante.

## Não existência

Vamos ver um exemplo clássico de não existência de solução por caminhos de uma equação diferencial aleatória.

Considere o problema de valor inicial
$$
\begin{cases}
\displaystyle \frac{\mathrm{d} X_t}{\mathrm{d} t} = A X_t^2, & t \geq 0 \\
X_0 = 1.
\end{cases}
$$
Mas, dessa vez, assumimos que $A$ seja uma variável aleatória com distribuição sem suporte limitado, digamos normal ou exponencial, etc.. Isso significa que $A(\omega)$ não é limitado quase sempre. Com isso, os caminhos amostrais
$$
x(t) = \frac{1}{1 - A(\omega)t}, \qquad 0 \leq t < \frac{1}{A(\omega)},
$$
estão definidos em intervalos arbitrariamente pequenos. Isso nos impede de definir um processo $\{X_t\}_{t \in [0, \varepsilon)}$ para todos os caminhos, por menor que seja $\varepsilon > 0.$ Ou seja, não existe solução por caminhos dessa equação.

## Múltiplas soluções e não solução

Agora, considere o problema de valor inicial
$$
\begin{cases}
\displaystyle \frac{\mathrm{d} X_t}{\mathrm{d} t} = 3X_t^{2/3}, & t \geq 0 \\
X_0 = 0.
\end{cases}
$$
Aqui, devemos especificar onde "mora" $X_0.$ Podemos tomar $X_0 = 0$ em $\Omega = \mathbb{R},$ com $\mathcal{A}$ sendo, por exemplo, a $\sigma$-álgebra de Lebesgue.

Naturalmente, temos a solução trivial $X_t^{(0)} = 0,$ $\forall t \geq 0.$ Também temos
$$
X_t^{(1)}(\omega) = t^3, \qquad t \geq 0
$$
como solução.

Agora, para qualquer conjunto $E\subset \Omega,$ temos, ainda que $\{X_t^{(E)}\}_{t\geq 0}$ definido através dos caminhos
$$
X_t^{(E)}(\omega) = \begin{cases}
t^3, &\omega \in E, \\
0, & \omega \notin E,
\end{cases}
$$
é tal que cada caminho $X_t^{(E)}(\omega)$ satisfaz a equação diferencial ordinária $x' = 3x^{2/3}.$ Se $E$ for mensurável, então $\{X_t^{(E)}\}_{t \geq 0}$ é, de fato, um processo que satisfaz a condição inicial $X_0^{(E)} = 0$ e é uma solução por caminhos da equação diferencial aleatória.

No entanto, se $E$ não for mensurável, então os caminhos satisfazem a equação diferencial ordinária mas $\{X_t^{(E)}\}_{t \geq 0}$ não define um processo.

## Outros tipos de solução

Outros tipos de solução podem ser obtidas relaxando-se o sentido de convergência do limite
$$
\frac{\mathrm{d}X_t}{\mathrm{d}t} = \lim_{\tau \rightarrow 0} \frac{X_{t+\tau} - X_t}{\tau}.
$$

No caso acima, de soluções por caminhos, o limite vale quase certamente, i.e.
$$
\mathbb{P}\left(\exists \frac{\mathrm{d}X_t}{\mathrm{d}t} = \lim_{\tau \rightarrow 0} \frac{X_{t+\tau} - X_t}{\tau} = f(t, X_t, Y_t) \right) = 1.
$$

Mas, em princípio, a noção de derivada de um processo pode ser relaxada para convergência em probabilidade, convergência em distribuição, convergência em média-quadrática, convergência em média $p\geq 1,$ etc. A dificuldade é obtermos condições em $f$ e em $Y_t,$ mais fracas, que garantam a existência de soluções da equação diferencial aleatória nesse sentido (também) mais fraco que convergência quase certamente.

Uma sentido bastante utilizado é o de solução no sentido de média quadrática, em que existe um processo $\{\mathrm{d}X_t/\mathrm{d}t\}_{t \in [0, T)}$ tal que
$$
\mathbb{E}\left( \left| \frac{X_{t+\tau} - X_t}{\tau} - \frac{\mathrm{d}X_t}{\mathrm{d}t}\right|\right) \rightarrow 0, \quad \tau \rightarrow 0.
$$
