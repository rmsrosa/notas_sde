@def title = "Convergência do método de Euler-Maruyama"

# {{ get_title }}

No caso determinístico, de uma equação diferencial
$$
\frac{\mathrm{d}x}{\mathrm{d}t} = f(x),
$$
com condição inicial $x(0) = x_0$, o método de Euler
$$
x_{j} = x_{j-1} + \Delta t f(x_j), \qquad x_j|_{j = 0} = x_0,
$$
em uma malha temporal uniforme $t_j = jT/n$, $j = 0, \ldots, n$, com $\Delta t = T/n$, converge uniformemente, no intervalo $[0, T]$, para a solução do problema de valor inicial. Além disso, essa convergência é de ordem um. Mais precisamente, existe $C > 0$ e $\delta > 0$ tais que
$$
\max_{j}|x(t_j) - x_j| \leq C \Delta t, \qquad 0 < \Delta t \leq \delta.
$$
Isso sob a hipótese de $f$ ser localmente Lipschitz contínua.

Por outro lado, no caso estocástico,
$$
\mathrm{d}X_t = f(X_t)\mathrm{d}t + g(X_t)\mathrm{d}W_t, \qquad t \geq 0,
$$
com uma condição inicial
$$
\left.X_t\right|_{t = 0} = X_0,
$$
a convergência *forte* é apenas de ordem $1/2$ e isso sob as hipóteses de $f$ e $g$ serem *globalmente* Lipschitz contínua.

A diferença vem, essencialmente, do fato de que no caso estocástico, além dos termos de erro da ordem de $\Delta t$, há os termos da ordem de $\Delta W$. Nesse caso, em um sentido apropriado, temos $(\Delta W)^2 \sim \Delta t$, o que nos dá um erro da ordem de $(\Delta t)^{1/2}$.

Outro ponto importante é que, no caso discreto, a constante $C$ que aparece na ordem de convergência depende da condição inicial e explora o fato de que, com a condição inicial fixa, podemos limitar a solução exata e aproximação. Por outro lado, no caso estocástico, considera-se, implicitamente, diversas condições iniciais $X_0(\omega)$ e não temos esse controle, por isso a necessidade de se assumir que os termos $f$ e $g$ sejam globalmente Lipschitz contínuos.

Por último, um detalhe um pouco mais técnico, é que, enquanto no caso discreto estimamos diretamente a diferença $|x(t_j) - x_j^n|$, no caso estocástico precisamos nos ancorar na isometria de Itô, de modo que o mais natural é olharmos para $\mathbb{E}\left[|X_{t_j} - X_j^n|^2 \right]$.

Vejamos os detalhes.

## Convergência no caso determinístico

Primeiramente, temos que
$$
x(t_j) = x(t_{j-1}) + \int_{t_{j-1}}^{t_j} x'(s)\;\mathrm{d}s = x(t_{j-1}) + \Delta t x'(t_{j-1}) + \int_{t_{j-1}}^{t_j} (x'(s) - x'(t_{j-1}))\;\mathrm{d}s.
$$
De acordo com a equação diferencial,
$$
x(t_j) = x(t_{j-1}) + \Delta t f(x(t_{j-1})) + \int_{t_{j-1}}^{t_j} (f(x(s)) - f(x(t_{j-1})))\;\mathrm{d}s.
$$

Assim, nos pontos $j = 1, \ldots, n$ da malha,
$$
|x(t_j) - x_j| \leq | x(t_{j-1}) - x_{j-1} | + \Delta t |f(x(t_{j-1})) - f(x_{j-1})| + \int_{t_{j-1}}^{t_j} |f(x(s)) - f(x(t_{j-1}))|\;\mathrm{d}s.
$$
Usando que $f$ é localmente Lipschitz contínua e denotando por $L$ a constante de Lipschitz em uma região limitada mas suficientemente grande para conter as soluções da equação diferencial original e de sua aproximação numérica, obtemos
$$
|x(t_j) - x_j| \leq |x(t_{j-1}) - x_{j-1}| + L \Delta t |x(t_{j-1}) - x_{j-1}| + L \int_{t_{j-1}}^{t_j} |x(s) - x(t_{j-1})|\;\mathrm{d}s.
$$

O integrando do último termo pode ser estimado por
$$
\begin{align*}
\int_{t_{j-1}}^{t_j} |x(s) - x(t_{j-1})|\;\mathrm{d}s & \leq \int_{t_{j-1}}^{t_j} \int_{t_{j-1}}^s |x'(\tau)|\;\mathrm{d}\tau\;\mathrm{d}s \\
& \leq \int_{t_{j-1}}^{t_j} \int_{t_{j-1}}^s |f(x(\tau))|\;\mathrm{d}\tau\;\mathrm{d}s \\
& \int_{t_{j-1}}^{t_j} \int_{t_{j-1}}^s \left(|f(x(\tau)) - f(0)| + |f(0)|\right)\;\mathrm{d}\tau\;\mathrm{d}s \\
& L \int_{t_{j-1}}^{t_j} \int_{t_{j-1}}^s \left(|x(\tau)| + |f(0)|\right) \;\mathrm{d}\tau\;\mathrm{d}s \\
& \leq L M \Delta t^2,
\end{align*}
$$
onde
$$
M = |f(0)| + \max_{0 \leq t \leq T} |x(t)|.
$$
Assim,
$$
|x(t_j) - x_j| \leq (1 + L\Delta t)|x(t_{j-1}) - x_{j-1}| + M \Delta t^2.
$$

Iterando essa estimativa, chegamos a
$$
\begin{align*}
|x(t_j) - x_j| & \leq (1 + L\Delta t)^2|x(t_{j-2}) - x_{j-2}| + M \Delta t^2(1 + (1 + L\Delta t)) \\
& \leq \ldots \\
& \leq (1 + L\Delta t)^j|x(t_0) - x_0| + M \Delta t^2(1 + (1 + L\Delta t) + \ldots + (1 + L\Delta t)^{j-1}) \\
& \leq e^{LT}|x(t_0) - x_0| + \frac{M}{L}e^{LT}\Delta t.
\end{align*}
$$

Considerando que $x_0 = x(t_0)$, obtemos
$$
\max_j |x(t_j) - x_j| \leq \frac{M}{L}e^{LT}\Delta t,
$$
mostrando que é o método de Euler é de primeira ordem.

## Convergência no caso aleatório

## Convergência no caso estocástico

Considere, agora, a equação estocástica
$$
\mathrm{d}X_t = f(X_t)\mathrm{d}t + g(X_t)\mathrm{d}W_t, \qquad t \geq 0,
$$
com uma condição inicial
$$
\left.X_t\right|_{t = 0} = X_0.
$$

Nesse caso, temos
$$
X_t = X_0 + \int_0^t f(X_s)\;\mathrm{d}s + \int_0^t g(X_s)\;\mathrm{d}W_s.
$$
Já a aproximação pelo método de Euler-Maruyama é dada por
$$
X_j^n = X_{j-1}^n + f(X_{j-1}^n) \Delta t + g(X_{j-1}^n) \Delta W_j,
$$
onde $X_0^n = X_0$ e $\Delta W_j$ (na prática, $\Delta W_j = Z_j \sqrt{\Delta t}$, onde $\{Z_j\}_{j = 1}^n$ são variáveis aleatórias i.i.d. com $Z_j \sim \mathcal{N}(0, 1)$).

Assumimos $f$ e $g$ globalmente Lipschitz contínuas, com constantes de Lipschitz $L_f$ e $L_g$, respectivamente.

Para fazermos uso da isometria de Itô, vamos estimar a média quadrática do erro. Mais precisamente, vamos estimar
$$
D_j = \max_{i = 0, \ldots, j} \mathbb{E}\left[ |X_{t_i} - X_i^n|^2\right]
$$

Para efeito de comparação, temos
$$
X_{t_j} = X_{t_{j-1}} + \int_{t_{j-1}}^{t_j} f(X_s)\;\mathrm{d}s + \int_0^t g(X_s)\;\mathrm{d}W_s.
$$

Assim,
$$
\begin{align*}
X_{t_j} - X_j^n & = X_{t_{j-1}} - X_{j-1}^n \\
& \qquad + \int_{t_{j-1}}^{t_j} f(X_s) \;\mathrm{d}s - f(X_{j-1}^n) \Delta t \\
& \qquad + \int_0^t g(X_s)\;\mathrm{d}W_s - g(X_{j-1}^n) Z_j \sqrt{\Delta t} \\
& = X_{t_{j-1}} - X_{j-1}^n \\
& \qquad + \int_{t_{j-1}}^{t_j} (f(X_s) - f(X_{j-1}^n))\;\mathrm{d}s \\
& \qquad + \int_0^t (g(X_s) - g(X_{j-1}^n))\;\mathrm{d}W_s. \\
\end{align*}
$$



## Não-convergência no caso estocástico sem condição Lipschitz global