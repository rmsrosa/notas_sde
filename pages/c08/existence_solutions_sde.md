@def title = "Existência de soluções globais"

# {{ get_title }}

Vamos considerar, agora, o caso geral de uma equação diferencial estocástica da forma
$$
\mathrm{d}X_t = f(t, X_t)\;\mathrm{d}t + g(t, X_t)\;\mathrm{d}W_t, \qquad t \geq 0,
$$
com uma condição inicial
$$
\left.X_t\right|_{t = 0} = X_0.
$$

## Hipóteses iniciais

Como antes, vamos assumir que $f = f(t, x),$ $g = g(t, x)$ são funções contínuas $f:[0, T]\times \mathbb{R} \times\mathbb{R} \rightarrow \mathbb{R}$ e $g:[0, T]\times \mathbb{R} \times\mathbb{R} \rightarrow \mathbb{R}$ com a propriedade de serem Lipschitz contínuas na variável $x,$ mas com a diferença que pedimos agora que essa continuidade Lipschitz seja *global.*

Mais precisamente, existem $L_f, L_g > 0$ tais que
$$
\begin{align*}
|f(t, x) - f(t, y)| \leq L_f|x - y|, \qquad \forall x, y \in \mathbb{R}, \\
|g(t, x) - g(t, y)| \leq L_g|x - y|, \qquad \forall x, y \in \mathbb{R}.
\end{align*}
$$

Observe que a desigualdade para $f$ implica em
$$
|f(t, x)| = |f(t, x) - f(t, 0) + f(t, 0)| \leq |f(t, 0)| + L_f|x| \leq C_f + L_f|x|,
$$
para $C_f = \max_{t\in [0, T]}|f(t, 0)|.$ Analogamente,
$$
|g(t, x)| = |g(t, x) - g(t, 0) + g(t, 0)| \leq |g(t, 0)| + L_g|x| \leq C_g + L_g|x|.
$$

Também assumimos que a condição inicial tem média quadrática finita:
$$
\mathbb{E}[X_0^2] < \infty.
$$

Essa condição global é fundamental, aqui. Por conta da perturbação causada pelo ruído proveniente de um processo de Wiener, os caminhos amostrais podem se afastar rapidamente da condição inicial e perdemos esse controle local. A condição inicial, sendo um processo, também impede a localização espacial das propriedades dos coeficientes. 

Essa condição global pode ser relaxada desde que se possa explorar alguma outra propriedade mais estrutural da equação. Em geral, no entanto, conseguimos a existência apenas sob essa condição global.

## Existência de solução

A forma integral equivalente é
$$
X_t = X_0 + \int_0^t f(s, X_s)\;\mathrm{d}s + \int_0^t g(s, X_s)\;\mathrm{d}W_s.
$$

A ideia é, novamente, resolver a equação integral via método de Picard, ou seja, via iterações sucessivas. Definimos, para todo $t \geq 0,$
$$
\begin{align*}
X_t^0 & = X_0, \\
X_t^m & = X_0 + \int_0^t f(s, X_s^{m-1})\;\mathrm{d}s + \int_0^t g(s, X_s^{m-1}) \;\mathrm{d}W_t, \quad m\in \mathbb{N}.
\end{align*}
$$

A diferença, agora, é que vamos mostrar que a família $\{X_t^m\}_{0 \leq t \leq T}$ de processos converge em média quadrática, não apenas em probabilidade, para um processo que é solução da equação integral, ao preço de exigir mais da condição inicial (ter média quadrática finita, ao invés de apenas ser finito quase certamente).

Considere, para isso, as funções determinísticas
$$
d_m(t) = \mathbb{E}\left[\left|X_t^{m+1} - X_t^m\right|^2\right], \quad m = 0, 1, 2, \ldots, \; 0 \leq t \leq T.
$$

Vamos mostrar, por indução, que
$$
d_m(t) \leq \frac{M K^m t^{m+1}}{(m+1)!},
$$
para $K = 2(T L_f^2 + L_g^2)$ e para alguma constante $M$ dependendo de $C_f,$ $C_g,$ $L_f,$ $L_g,$ $T$ e $X_0.$

Primeiramente, temos
$$
\begin{align*}
d_0(t) & = \mathbb{E}\left[ \left|X_t^1 - X_t^0\right|^2\right] \\
  & = \mathbb{E}\left[ \left| \int_0^t f(s, X_s^0)\;\mathrm{d}s + \int_0^t g(s, X_s^0) \;\mathrm{d}W_t \right|^2 \right] \\
  & \leq 2\mathbb{E}\left[ \left| \int_0^t f(s, X_s^0)\;\mathrm{d}s \right|^2\right] + 2\mathbb{E}\left[\left|\int_0^t g(s, X_s^0) \;\mathrm{d}W_t \right|^2 \right]
\end{align*}
$$
Usando a desigualdade de Cauchy-Schwarz, estimamos a primeira integral da seguinte forma.
$$
\int_0^t f(s, X_s^0)\;\mathrm{d}s \leq \left(\int_0^t \;\mathrm{d}s\right)^{1/2}\left(\int_0^t f(s, X_s^0)^2 \;\mathrm{d}s\right)^{1/2} = t^{1/2}\int_0^t f(s, X_s^0)^2 \;\mathrm{d}s \leq T^{1/2} \left(\int_0^t f(s, X_s^0)^2 \;\mathrm{d}s\right)^{1/2}.
$$
Usando esse estimativa e usando a isometria de Itô na segunda integral, obtemos
$$
d_0(t) \leq 2T\int_0^t\mathbb{E}\left[ f(s, X_s^0)^2 \right]\;\mathrm{d}s + 2\int_0^t\mathbb{E}\left[ g(s, X_s^0)^2 \right]\;\mathrm{d}t.
$$
Usando as estimativas para $f$ e $g$ e usando que $X_s^0 = X_0,$ chegamos a
$$
\begin{align*}
d_0(t) & \leq 2T\int_0^t\mathbb{E}\left[ \left(C_f + L_fX_0\right)^2 \right]\;\mathrm{d}t + 2\int_0^t\mathbb{E}\left[ \left(C_g + L_gX_0\right)^2 \right]\;\mathrm{d}t \\
& \leq 2t\left(T\mathbb{E}\left[ \left(C_f + L_fX_0\right)^2 \right] + 2\mathbb{E}\left[ \left(C_g + L_gX_0\right)^2 \right]\right).
\end{align*}
$$
Cada valor esperado pode ser estimado de forma apropriada:
$$
\mathbb{E}\left[ \left(C_f + L_fX_0\right)^2 \right] \leq 2C_f^2 + 2L_f^2\mathbb{E}\left[X_0^2\right], \quad \mathbb{E}\left[ \left(C_g + L_gX_0\right)^2 \right] \leq 2C_g^2 + 2L_g^2\mathbb{E}\left[X_0^2\right].
$$

Logo, obtemos a estimativa
$$
d_0(t) \leq 4t\left((TC_f^2 + C_g^2) + (TL_f^2 + L_g^2)\mathbb{E}\left[X_0^2\right]\right) \leq Mt,
$$
para
$$
M = 4\left((TC_f^2 + C_g^2) + (TL_f^2 + L_g^2)\mathbb{E}\left[X_0^2\right]\right).
$$

Agora, prosseguindo por indução, assumimos que a estimativa seja válida para $m-1$ e buscamos prová-la para $m.$ Temos
$$
\begin{align*}
d_m(t) & = \mathbb{E}\left[\left|X_t^{m+1} - X_t^m\right|^2\right] \\
& = \mathbb{E}\left[ \left( \int_0^t (f(s, X_s^m) - f(s, X_s^{m-1}))\;\mathrm{d}s + \int_0^t (g(s, X_s^m) - g(s, X_s^{m-1})) \;\mathrm{d}W_t\right)^2 \right] \\
& \leq \mathbb{E}\left[ 2\left( \int_0^t L_f |X_s^m - X_s^{m-1}|\;\mathrm{d}s \right)^2 + 2\left( \int_0^t L_g |X_s^m - X_s^{m-1}| \;\mathrm{d}W_t\right)^2\right] \\
& \leq 2L_f^2T\int_0^T\mathbb{E}\left[ |X_s^m - X_s^{m-1}|^2 \right]\;\mathrm{d}s + 2L_g^2\mathbb{E}\left[\left( \int_0^t |X_s^m - X_s^{m-1}| \;\mathrm{d}W_t\right)^2\right]
\end{align*}
$$
Usando a isometria de Itô no segundo termo, chegamos a
$$
d_m(t) \leq 2(TL_f^2 + L_g^2)\int_0^T \mathbb{E}\left[ |X_s^m - X_s^{m-1}|^2 \right]\;\mathrm{d}s \leq K\int_0^T d_{m-1}(s)\;\mathrm{d}s.
$$
Usando a hipótese de indução para $m-1,$ chegamos na estimativa para $d_m(t)$:
$$
d_m(t) \leq K\int_0^T \frac{MK^{m-1}s^m}{m!}\;\mathrm{d}s \leq \frac{MK^mt^{m+1}}{(m+1)!}.
$$

Agora, podemos fazer somas telescópias e provar que $\{X_t^m\}_{t \geq 0}$ converge em média quadrática para um processo $\{X_t\}_{t \geq 0}$ que é solução da equação integral e, portanto, da equação diferencial estocástica. De fato, para inteiros positivos $n > k,$
$$
  \begin{align*}
    \mathbb{E}[|X_t^n - X_t^k|^2]^{1/2} & = \|X_t^n - X_t^k\|_{L^2(\Omega)} \\
    & = \|\sum_{m=k}^{n-1} (X_t^{m+1} - X_t^m)\|_{L^2(\Omega)} \\
    & \leq \sum_{m=k}^{n-1} \| (X_t^{m+1} - X_t^m)\|_{L^2(\Omega)} \\
    & = \sum_{m=k}^{n-1} d_m(t)^{1/2} \\
    & \leq M^{1/2}\sum_{m=k}^{n-1} \left(\frac{K^{m+1}t^m}{(m+1)!}\right)^{1/2} \\
    & \leq M^{1/2}K^{1/2}\sum_{m=k}^{n-1} \left(\frac{K^{m}t^m}{m!}\right)^{1/2}
\end{align*}
$$
Usando a fórmula de Stirling
$$
m! \sim \sqrt{2\pi m}\left(\frac{m}{e}\right)^{m},
$$
obtemos
$$
  \mathbb{E}[|X_t^n - X_t^k|^2]^{1/2} \leq M^{1/2}K^{1/2}\sum_{m=k}^{n-1} \frac{(K^{1/2} t^{1/2})^m}{(2\pi m)^{1/4}(\frac{m}{e})^{m}} = M^{1/2}K^{1/2}\sum_{m=k}^{n-1} \frac{1}{(2\pi m)^{1/4}}\left(\frac{K^{1/2} t^{1/2} e}{m}\right)^m = \frac{M^{1/2}K^{1/2}}{(2\pi)^{1/4}}\sum_{m=k}^{n-1} \left(\frac{K^{1/2} t^{1/2} e}{m^{1/4m} m}\right)^m
$$
For $m$ sufficiently large,
$$
\frac{K^{1/2} t^{1/2} e}{m^{1/4m} m} \leq \frac{1}{2},
$$
and we see that this is the tail of a convergent series, so that
$$
  \mathbb{E}[|X_t^n - X_t^k|^2]^{1/2} \leq \frac{M^{1/2}K^{1/2}}{(2\pi)^{1/4}}\sum_{m=k}^{n-1} \left(\frac{1}{2}\right)^m \rightarrow 0.
$$
