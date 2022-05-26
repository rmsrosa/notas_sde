@def title = "Soluções por caminhos"

# {{ get_title }}

## Definição

*Pathwise solutions* ...

## Exemplo linear

Considere o problema de valor inicial
$$
\begin{cases}
\displaystyle \frac{\mathrm{d} X_t}{\mathrm{d} t} = A X_t, & t \geq 0, \\
X_0 = C,
\end{cases}
$$
onde $A$ e $C$ são variáveis aleatória reais. Para quase todo $\omega$, temos $A(\omega), C(\omega) \in \mathbb{R}$ e, com isso, podemos definir os caminhos amostrais
$$
X_t(\omega) = C(\omega) e^{A(\omega)t}, \qquad \forall t\geq 0,
$$
que são soluções da equação diferencial ordinária
$$
\begin{cases}
\displaystyle \frac{\mathrm{d} X_t(\omega)}{\mathrm{d} t} = A(\omega) X_t(\omega), & t \geq 0 \\
X_0(\omega) = C(\omega).
\end{cases}
$$

## Exemplo com existência local

Considere
$$
\begin{cases}
\displaystyle \frac{\mathrm{d} X_t}{\mathrm{d} t} = A X_t^2, & t \geq 0 \\
X_0 = 1,
\end{cases}
$$
onde $A$ é uma variável aleatória com distribuição beta, por exemplo.

A distribuição beta está concentrada no intervalo $[0, 1]$ e de forma que, para quase todo $\omega$, temos $0 < A(\omega) < 1$. Assim, para quase todo $\omega$, a equação diferencial ordinária
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
para quase todo $\omega$, podemos definir, para todo $0 \leq t < 1$, o processo aleatório $\{X_t\}_{t\in [0, 1)}$ através dos caminhos amostrais
$$
X_t(\omega) = \frac{1}{1 - A(\omega)t}, \qquad 0 \leq t < 1.
$$

A função de distribuição acumulada de cada $X_t$ é dada por
$$
\mathbb{P}(X_t \leq x) = \mathbb{P}\left( \frac{1}{1 - A} \leq x\right) = \mathbb{P}\left( A \leq \frac{x - 1}{x}\right), \qquad 0 < x < 1,
$$
com $\mathbb{P}(X_t \leq x) = 0$, para $x\leq 0$ e $\mathbb{P}(X_t \leq x) = 1$, para $x\geq 1$.

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
estão definidos em intervalos arbitrariamente pequenos. Isso nos impede de definir um processo $\{X_t\}_{t \in [0, \varepsilon)}$ para todos os caminhos, por menor que seja $\varepsilon > 0$. Ou seja, não existe solução por caminhos dessa equação.

## Múltiplas soluções e não-solução

Agora, considere o problema de valor inicial
$$
\begin{cases}
\displaystyle \frac{\mathrm{d} X_t}{\mathrm{d} t} = 3X_t^{2/3}, & t \geq 0 \\
X_0 = 0.
\end{cases}
$$
Aqui, devemos especificar onde "mora" $X_0$. Podemos tomar $X_0 = 0$ em $\Omega = \mathbb{R}$, com $\mathcal{A}$ sendo, por exemplo, a $\sigma$-álgebra de Lebesgue.

Naturalmente, temos a solução trivial $X_t^{(0)} = 0$, $\forall t \geq 0$. Também temos
$$
X_t^{(1)}(\omega) = t^3, \qquad t \geq 0
$$
como solução.

Agora, para qualquer conjunto $E\subset \Omega$, temos, ainda que $\{X_t^{(E)}\}_{t\geq 0}$ definido através dos caminhos
$$
X_t^{(E)}(\omega) = \begin{cases}
t^3, &\omega \in E, \\
0, & \omega \notin E,
\end{cases}
$$
é tal que cada caminho $X_t^{(E)}(\omega)$ satisfaz a equação diferencial ordinária $x' = 3x^{2/3}$. Se $E$ for mensurável, então $\{X_t^{(E)}\}_{t \geq 0}$ é, de fato, um processo que satisfaz a condição inicial $X_0^{(E)} = 0$ e é uma solução por caminhos da equação diferencial aleatória.

No entanto, se $E$ não for mensurável, então os caminhos satisfazem a equação diferencial ordinária mas $\{X_t^{(E)}\}_{t \geq 0}$ não define um processo.
