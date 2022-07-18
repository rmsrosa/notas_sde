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
em uma malha temporal $t_j = jT/n$, $j = 0, \ldots, n$, com $\Delta t = T/n$, converge uniformemente, no intervalo $[0, T]$, para a solução do problema de valor inicial. Além disso, essa convergência é de ordem um. Mais precisamente,
$$
\max_{j}|x(t_j) - x_j| \leq C \Delta t.
$$

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
Usando que $f$ é Lipschitz contínua e denotando por $L$ a constante de Lipschitz, obtemos
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

## Não-convergência no caso estocástico sem condição Lipschitz global