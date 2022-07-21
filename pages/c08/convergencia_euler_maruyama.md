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

Por outro lado, no caso estocástico, com um ruído multiplicativo $g = g(X_t),$
$$
\mathrm{d}X_t = f(X_t)\mathrm{d}t + g(X_t)\mathrm{d}W_t, \qquad t \geq 0,
$$
com uma condição inicial
$$
\left.X_t\right|_{t = 0} = X_0,
$$
a convergência *forte* é apenas de ordem $1/2$ e isso sob as hipóteses de $f$ e $g$ serem *globalmente* Lipschitz contínua. Mas é importante ressaltar que isso acontece no caso multiplicativo. Se o ruído for aditivo, $g(X_t) = \sigma$ (ou, mais geralmente, $g(t, X_t) = g(t)$), então ainda temos a convergência forte de ordem $1$.

A diferença, no caso multiplicativo, vem, essencialmente, do fato de que, na equação estocástica, além dos termos de erro da ordem de $\Delta t$, há termos da ordem de $\Delta W$. Em um sentido apropriado, vale $(\Delta W)^2 \sim \Delta t$, o que nos dá um erro da ordem de $(\Delta t)^{1/2}$.

Outro ponto importante é que, no caso discreto, a constante $C$ que aparece na ordem de convergência depende da condição inicial e explora o fato de que, com a condição inicial fixa, podemos limitar a solução exata e a aproximação. Por outro lado, no caso estocástico, considera-se, implicitamente, diversas condições iniciais $X_0(\omega)$ e não temos esse controle, por isso a necessidade de se assumir que os termos $f$ e $g$ sejam globalmente Lipschitz contínuos.

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

## Convergência no caso estocástico multiplicativo

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
onde $X_0^n = X_0$ e $\Delta W_j$.

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
& \qquad + \int_{t_{j-1}}^{t_j} g(X_s)\;\mathrm{d}W_s - g(X_{j-1}^n) \Delta W_j \\
& = X_{t_{j-1}} - X_{j-1}^n \\
& \qquad + \int_{t_{j-1}}^{t_j} (f(X_s) - f(X_{j-1}^n))\;\mathrm{d}s \\
& \qquad + \int_{t_{j-1}}^{t_j} (g(X_s) - g(X_{j-1}^n))\;\mathrm{d}W_s \\
& = X_{t_{j-1}} - X_{j-1}^n \\
& \qquad + \int_{t_{j-1}}^{t_j} (f(X_s) - f(X_{t_{j-1}}))\;\mathrm{d}s \\
& \qquad + \int_{t_{j-1}}^{t_j} (f(X_{t_{j-1}}) - f(X_{j-1}^n))\;\mathrm{d}s \\
& \qquad + \int_{t_{j-1}}^{t_j} (g(X_s) - g(X_{t_{j-1}}))\;\mathrm{d}W_s \\
& \qquad + \int_{t_{j-1}}^{t_j} (g(X_{t_{j-1}}) - g(X_{j-1}^n))\;\mathrm{d}W_s
\end{align*}
$$

Elevando ao quadrado e usando que $(a_1 + \ldots + a_5)^2 \leq 5(a_1^2 + \ldots + a_5^2)$, 
$$
\begin{align*}
\left| X_{t_j} - X_j^n \right|^2 & \leq 5\left| X_{t_{j-1}} - X_{j-1}^n \right|^2 \\
& \qquad + 5\left| \int_{t_{j-1}}^{t_j} (f(X_s) - f(X_{t_{j-1}}))\;\mathrm{d}s \right|^2 \\
& \qquad + 5\left| \int_{t_{j-1}}^{t_j} (f(X_{t_{j-1}}) - f(X_{j-1}^n))\;\mathrm{d}s \right|^2 \\
& \qquad + 5\left| \int_{t_{j-1}}^{t_j} (g(X_s) - g(X_{t_{j-1}}))\;\mathrm{d}W_s \right|^2 \\
& \qquad + 5\left| \int_{t_{j-1}}^{t_j} (g(X_{t_{j-1}}) - g(X_{j-1}^n))\;\mathrm{d}W_s \right|^2 
\end{align*}
$$

Os dois primeiros termos integrais podem ser estimados por
$$
\begin{align*}
\left| \int_{t_{j-1}}^{t_j} (f(X_s) - f(X_{t_{j-1}}))\;\mathrm{d}s \right|^2 & \leq (t_j - t_{j-1})\int_{t_{j-1}}^{t_j} (f(X_s) - f(X_{t_{j-1}}))^2\;\mathrm{d}s \\
& \leq L_f^2(t_j - t_{j-1})\int_{t_{j-1}}^{t_j} |X_s - X_{t_{j-1}}|^2\;\mathrm{d}s
\end{align*}
$$
e
$$
\begin{align*}
\left| \int_{t_{j-1}}^{t_j} (f(X_{t_{j-1}}) - f(X_{j-1}^n))\;\mathrm{d}s \right|^2 & \leq (t_j - t_{j-1})\int_{t_{j-1}}^{t_j} (f(X_{t_{j-1}}) - f(X_{j-1}^n))^2\;\mathrm{d}s \\
& \leq L_f^2(t_j - t_{j-1})\int_{t_{j-1}}^{t_j} |X_{t_{j-1}} - X_{j-1}^n|^2\;\mathrm{d}s \\
& \leq L_f^2(t_j - t_{j-1})^2|X_{t_{j-1}} - X_{j-1}^n|^2
\end{align*}
$$

O nosso objetivo é estimar a média quadrática. Com isso em mente, vemos que
$$
\mathbb{E}\left[\left| \int_{t_{j-1}}^{t_j} (f(X_s) - f(X_{t_{j-1}}))\;\mathrm{d}s \right|^2\right] \leq L_f^2(t_j - t_{j-1})\int_{t_{j-1}}^{t_j} \mathbb{E}\left[|X_s - X_{t_{j-1}}|^2\right]\;\mathrm{d}s
$$
e
$$
\mathbb{E}\left[\left| \int_{t_{j-1}}^{t_j} (f(X_{t_{j-1}}) - f(X_{j-1}^n))\;\mathrm{d}s \right|^2\right] \leq L_f^2(t_j - t_{j-1})^2\mathbb{E}\left[|X_{t_{j-1}} - X_{j-1}^n|^2\right].
$$

Nas integrais estocásticas, usamos a isometria de Itô:
$$
\mathbb{E}\left[\left| \int_{t_{j-1}}^{t_j} (g(X_s) - g(X_{t_{j-1}}))\;\mathrm{d}W_s \right|^2\right] = \int_{t_{j-1}}^{t_j} \mathbb{E}\left[(g(X_s) - g(X_{t_{j-1}}))^2\right]\;\mathrm{d}s \leq L_g^2 \int_{t_{j-1}}^{t_j} \mathbb{E}\left[(X_s - X_{t_{j-1}})^2\right]\;\mathrm{d}s
$$
e
$$
\begin{align*}
\mathbb{E}\left[\left| \int_{t_{j-1}}^{t_j} (g(X_{t_{j-1}}) - g(X_{j-1}^n))\;\mathrm{d}W_s \right|^2\right] & = \int_{t_{j-1}}^{t_j} \mathbb{E}\left[(g(X_{t_{j-1}}) - g(X_{j-1}^n))^2\right]\;\mathrm{d}s \\
& \leq L_g^2 \int_{t_{j-1}}^{t_j} \mathbb{E}\left[(X_{t_{j-1}} - X_{j-1}^n)^2\right]\;\mathrm{d}s \\
& \leq L_g^2 (t_j - t_{j-1})\mathbb{E}\left[(X_{t_{j-1}} - X_{j-1}^n)^2\right].
\end{align*}
$$

Juntando as estimativas, obtemos
$$
\begin{align*}
\mathbb{E}\left[\left| X_{t_j} - X_j^n \right|^2\right] & \leq 5\mathbb{E}\left[\left| X_{t_{j-1}} - X_{j-1}^n \right|^2\right] \\
& \qquad + 5L_f^2(t_j - t_{j-1})\int_{t_{j-1}}^{t_j} \mathbb{E}\left[|X_s - X_{t_{j-1}}|^2\right]\;\mathrm{d}s \\
& \qquad + 5L_f^2(t_j - t_{j-1})^2\mathbb{E}\left[|X_{t_{j-1}} - X_{j-1}^n|^2\right] \\
& \qquad + 5L_g^2 \int_{t_{j-1}}^{t_j} \mathbb{E}\left[(X_s - X_{t_{j-1}})^2\right]\;\mathrm{d}s \\
& \qquad + 5L_g^2 (t_j - t_{j-1}) \mathbb{E}\left[(X_{t_{j-1}} - X_{j-1}^n)^2\right].
\end{align*}
$$

Agora, usamos a continuidade da solução $\{X_t\}_{t \geq 0}$ em média quadrática para estimar as integrais restantes.

## Convergência no caso estocástico com ruído constante

Observe, no entanto, que quando $g(X_t) = \sigma$ é constante, os termos de ruído se cancelam, quando subtraímos $X_j^n$ de $X_{t_j}$. Sobram, então, apenas os termos que nos dão ordem $1$ de convergência forte.

Mesmo no caso autônomo, assumindo $g(t, X_t) = g(t)$, também se obtém ordem $1$ de convergência forte. Nesse caso, o termo de ruído contribui com um erro da forma
$$
\int_{t_{j-1}}^{t_j} (g(s) - g(t_{j-1}))\;\mathrm{d}W_s = \int_{t_{j-1}}^{t_j} \int_{t_{j-1}}^{s} g'(\tau)\;\mathrm{d}\tau\;\mathrm{d}W_s.
$$
Nesse caso, usando a isometria de Itô,
$$
\mathbb{E}\left[ \left| \int_{t_{j-1}}^{t_j} (g(s) - g(t_{j-1}))\;\mathrm{d}W_s\right|^2\right] = \int_{t_{j-1}}^{t_j} \mathbb{E}\left[ \left| \int_{t_{j-1}}^{s} g'(\tau)\;\mathrm{d}\tau \right|^2\right] \mathrm{d}s \leq \int_{t_{j-1}}^{t_j} (s - t_{j-1})\int_{t_{j-1}}^{s} |g'(\tau)|^2\;\mathrm{d}\tau \mathrm{d}s \leq M_g \Delta t^3,
$$
onde $M_g = \max |g'|^2 /3$.

Ao somarmos em $j$, um $\Delta t$ é aproveitando, restando $\Delta t^2$. Ao usarmos a desigualdade de Lyapunov, isso nos dá um termos também da ordem $\Delta t$, garantindo a ordem $1$ de convergência forte.

## Não-convergência no caso estocástico sem condição Lipschitz global