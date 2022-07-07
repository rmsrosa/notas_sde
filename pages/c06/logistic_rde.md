@def title = "Equação logística aleatória"

# {{ get_title }}

Vamos considerar, agora, a equação diferencial aleatória
$$
\frac{\mathrm{d}X_t}{\mathrm{d}t} = (A_t + B_t X_t)X_t
$$
com uma condição inicial
$$
\left.X_t\right|_{t = 0} = X_0.
$$
Assumimos que $\{A_t\}_{t\geq 0}$ e $\{B_t\}_{t \geq 0}$ são processos limitados satisfazendo, quase certamente, as desigualdades
$$
a - \delta \leq A_t \leq a + \delta, \quad b - \varepsilon \leq B_t \leq b + \varepsilon,
$$
onde
$$
a, b, \delta, \varepsilon > 0, \quad a - \delta > 0, \quad b - \varepsilon > 0.
$$

Por exemplo, podemos considerar
$$
A_t = a + \delta Y_t, \qquad B_t = b + \varepsilon Z_t,
$$
onde
$$
Y_t = \frac{W_t}{1 + |W_t|}, \quad Z_t = \sin(W_t),
$$
já que ambos $\{Y_t\}_{t \geq 0}$ e $\{Z_t\}_{t \geq 0}$ estão concentrados no intervalo $[-1, 1]$.

Em relação a $X_0$, assumimos que $X_0 \geq 0$ quase certamente. Por exemplo, podemos tomar a condição como sendo uma log-normal:
$$
X_0 = e^{\mu + \sigma N},
$$
onde
$$
\mu \in \mathbb{R}, \quad \sigma > 0, \quad N \sim \mathcal{N}(0, 1).
$$

## Existência

Sob essas condições, temos, para quase todo $\omega$, que
$$
X_0(\omega), A_t(\omega), B_t(\omega) > 0.
$$
Dessa forma, a solução $t \mapsto X_t(\omega)$ do problema de valor inicial da equação diferencial ordinária
$$
\begin{cases}
\displaystyle \frac{\mathrm{d}X_t(\omega)}{\mathrm{d}t} = (A_t(\omega) + B_t(\omega)X_t(\omega))X_t(\omega), \quad t \geq 0, \\
X_t(\omega)|_{t = 0} = X_0(\omega),
\end{cases}
$$
está definida para todo $t \geq 0$.

Assim, $\{X_t\}_{t \geq 0}$ nos dá um processo definido em toda a reta e que é solução da equação diferencial aleatória.

## Comportamento assintótico

Além disso, para cada $\omega$, temos
$$
A_t(\omega) - B_t(\omega)x \geq a - \delta - (b + \delta) x > 0,
$$
para
$$
0 < x < \frac{a - \delta}{b + \delta}.
$$
Ou seja,
$$
\lim_{t \rightarrow \infty} X_t(\omega) \geq \frac{a - \delta}{b + \delta}.
$$

Analogamente,
$$
A_t(\omega) - B_t(\omega)x \leq a + \delta - (b - \delta) x < 0,
$$
para
$$
x > \frac{a + \delta}{b - \delta}.
$$
Ou seja,
$$
\lim_{t \rightarrow \infty} X_t(\omega) \leq \frac{a + \delta}{b - \delta}.
$$

Portanto, para quase todo caminho amostral, temos
$$
\frac{a - \delta}{b + \delta} \leq \lim_{t \rightarrow \infty} X_t(\omega) \leq \frac{a + \delta}{b - \delta}.
$$

