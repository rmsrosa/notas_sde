@def title = "Funções de distribuição"

# {{ get_title }}

Considere uma variável estocástica contínua real $\{X_t\}_{t\in I}$, onde $I$ é um intervalo em $\mathbb{R}$ e o espaço de estados é $\Sigma = \mathbb{R}$, com o espaço de eventos sendo os Borelianos em $\mathbb{R}$.

A função distribuição de probabilidades acumulada no instante $t$ é definida por
$$
F_t(x) = \mathbb{P}(X_t \leq x)
$$

As distribuições conjuntas, em dois instantes distintos, é
$$
F_{t_1, t_2}(x_1, x_2) = \mathbb{P}(X_{t_1} \leq x_1, X_{t_2} \leq x_2)
$$
Analogamente, para $n$ instantes $t_1, \ldots, t_n$,
$$
F_{t_1, \ldots, t_n}(x_1, \ldots, x_n) = \mathbb{P}(X_{t_1} \leq x_1, \ldots X_{t_n} \leq x_n).
$$

Por construção, essa família de funções de distribuição $\{F_{t_1, \ldots, t_n}\}_{n\in \mathbb{N}, t_1, \ldots, t_n \in I}$ satisfaz duas condições fundamentais:

1. **Simetria:** Sejam $n\in \mathbb{N}$, $n \geq 2$, e $t_1, \ldots, t_n\in I$. Se $(i_1, \ldots, i_n)$ é uma permutação dos índices $(1, \ldots, n)$, então $F_{t_{i_1}, \ldots, t_{i_n}}(x_{i_1}, \ldots, x_{i_n}) = F_{t_1, \ldots, t_n}(x_1, \ldots, x_n)$, para quaisquer $x_1, \ldots, x_n \in \mathbb{R}$.
2. **Compatibilidade:** Para $m < n$, $m, n \in \mathbb{N}$, e $t_1, \ldots, t_n \in I$, vale $F_{t_1, \ldots, t_m}(x_1, \ldots, x_m) = F_{t_1, \ldots, t_m, t_{m+1}, \ldots, t_n}(x_1, \ldots, x_m, \infty, \ldots, \infty)$.

Por outro lado, um resultado importante de Kolmogorov, conhecido como o **Teorema Fundamental de Kolmogorov** garante que qualquer família de funções de distribuição satisfazendo as condições de simetria e compatibilidade definem um processo estocástico, ou seja, existe 