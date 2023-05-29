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

Como antes, vamos assumir que $f = f(t, x)$, $g = g(t, x)$ são funções contínuas $f:[0, T]\times \mathbb{R} \times\mathbb{R} \rightarrow \mathbb{R}$ e $g:[0, T]\times \mathbb{R} \times\mathbb{R} \rightarrow \mathbb{R}$ com a propriedade de serem Lipschitz contínuas na variável $x$, mas com a diferença que pedimos agora que essa continuidade Lipschitz seja *global.*

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
para $C_f = \max_{t\in [0, T]}|f(t, 0)|$. Analogamente,
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

A ideia é, novamente, resolver a equação integral via método de Picard, ou seja, via iterações sucessivas. Definimos, para todo $t \geq 0$,
$$
\begin{align*}
X_t^0 & = X_0, \\
X_t^m & = X_0 + \int_0^t f(s, X_s^{m-1})\;\mathrm{d}s + \int_0^t g(s, X_s^{m-1}) \;\mathrm{d}W_t, \quad m\in \mathbb{N}.
\end{align*}
$$

A diferença, agora, é que vamos mostrar que a família $\{X_t^m\}_{0 \leq t \leq T}$ de processos converge em média quadrática, não apenas em probabilidade, para um processo que é solução da equação integral, ao preço de exigir mais da condição inicial (ter média quadrática finita, ao invés de apenas ser finito quase certamente).

Considere, para isso, as funções determinísticas
$$
d^m(t) = \mathbb{E}\left[\left|X_t^{m+1} - X_t^m\right|^2\right], \quad m = 0, 1, 2, \ldots, \; 0 \leq t \leq T.
$$

Vamos mostrar, por indução, que
$$
d^m(t) \leq \frac{M K^m t^{m+1}}{(m+1)!},
$$
para $K = 2(L_f^2 + L_g^2)$ e para alguma constante $M$ dependendo de $C_f$, $C_g$, $L_f$, $L_g$, $T$ e $X_0$.

Primeiramente, temos
$$
\begin{align*}
d^0(t) & = \mathbb{E}\left[ \left|X_t^1 - X_t^0\right|^2\right] \\
  & = \mathbb{E}\left[ \left| \int_0^t f(s, X_s^0)\;\mathrm{d}s + \int_0^t g(s, X_s^0) \;\mathrm{d}W_t \right|^2 \right] \\
  & \leq 2\mathbb{E}\left[ \left| \int_0^t f(s, X_s^0)\;\mathrm{d}s \right|^2\right] + 2\mathbb{E}\left[\left|\int_0^t g(s, X_s^0) \;\mathrm{d}W_t \right|^2 \right]
\end{align*}
$$
Estimando a primeira integral de maneira usual e usando a isometria de Itô na segunda integral, obtemos
$$
d^0(t) \leq 2\int_0^t\mathbb{E}\left[ f(s, X_s^0)^2 \right]\;\mathrm{d}s + 2\int_0^t\mathbb{E}\left[ g(s, X_s^0)^2 \right]\;\mathrm{d}t.
$$
Usando as estimativas para $f$ e $g$ e usando que $X_s^0 = X_0$, chegamos a
$$
\begin{align*}
d^0(t) & \leq 2\int_0^t\mathbb{E}\left[ \left(C_f + L_fX_0\right)^2 \right]\;\mathrm{d}t + 2\int_0^t\mathbb{E}\left[ \left(C_g + L_gX_0\right)^2 \right]\;\mathrm{d}t \\
& \leq 2t\left(\mathbb{E}\left[ \left(C_f + L_fX_0\right)^2 \right] + 2\mathbb{E}\left[ \left(C_g + L_gX_0\right)^2 \right]\right).
\end{align*}
$$
Cada valor esperado pode ser estimado de forma apropriada:
$$
\mathbb{E}\left[ \left(C_f + L_fX_0\right)^2 \right] \leq 2C_f^2 + 2L_f^2\mathbb{E}\left[X_0^2\right], \quad \mathbb{E}\left[ \left(C_g + L_gX_0\right)^2 \right] \leq 2C_g^2 + 2L_g^2\mathbb{E}\left[X_0^2\right].
$$

Logo, obtemos a estimativa
$$
d^0(t) \leq 2t\left((C_f^2 + C_g^2) + (L_f^2 + L_g^2)\mathbb{E}\left[X_0^2\right]\right) \leq \frac{Mt}{2},
$$
para
$$
M = 4\left((C_f^2 + C_g^2) + (L_f^2 + L_g^2)\mathbb{E}\left[X_0^2\right]\right).
$$

Agora, prosseguindo por indução, assumimos que a estimativa seja válida para $m-1$ e buscamos prová-la para $m$. Temos
$$
\begin{align*}
d^m(t) & = \mathbb{E}\left[\left|X_t^{m+1} - X_t^m\right|^2\right] \\
& = \mathbb{E}\left[ \left( \int_0^t (f(s, X_s^m) - f(s, X_s^{m-1}))\;\mathrm{d}s + \int_0^t (g(s, X_s^m) - g(s, X_s^{m-1})) \;\mathrm{d}W_t\right)^2 \right] \\
& \leq \mathbb{E}\left[ 2\left( \int_0^t L_f |X_s^m - X_s^{m-1}|\;\mathrm{d}s \right)^2 + 2\left( \int_0^t L_g |X_s^m - X_s^{m-1}| \;\mathrm{d}W_t\right)^2\right] \\
& \leq 2L_f^2\int_0^T\mathbb{E}\left[ |X_s^m - X_s^{m-1}|^2 \right]\;\mathrm{d}s + 2L_g^2\mathbb{E}\left[\left( \int_0^t |X_s^m - X_s^{m-1}| \;\mathrm{d}W_t\right)^2\right]
\end{align*}
$$
Usando a isometria de Itô no segundo termo, chegamos a
$$
d^m(t) \leq 2(L_f^2 + L_g^2)\int_0^T \mathbb{E}\left[ |X_s^m - X_s^{m-1}|^2 \right]\;\mathrm{d}s \leq K\int_0^T d^{m-1}(s)\;\mathrm{d}s.
$$
Usando a hipótese de indução para $m-1$, chegamos na estimativa para $d^m(t)$:
$$
d^m(t) \leq K\int_0^T \frac{MK^{m-1}s^m}{m!}\;\mathrm{d}s \leq \frac{MK^mt^{m+1}}{(m+1)!}.
$$

Agora, podemos fazer somas telescópias, como de costume, e provar que $\{X_t^m\}_{t \geq 0}$ converge em média quadrática para um processo $\{X_t\}_{t \geq 0}$ que é solução da equação integral e, portanto, da equação diferencial estocástica.
