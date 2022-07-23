@def title = "Evolução no caso de equações determinísticas"

# {{ get_title }}

Considere uma equação diferencial determinística
$$
\frac{\mathrm{d}x}{\mathrm{d}t} = f(t, x).
$$

Suponha que haja uma incerteza em relação à condição inicial e que saibamos, apenas, a distribuição de probabilidades da mesma. Isso nos dá a condição inicial como uma variável aleatória $X_0$. Nesse caso, para cada amostra realização $X_0(\omega)$, temos uma solução $t \mapsto X_t(\omega)$ da equação diferencial ordinária. Suponhamos, para todos os efeitos, que essas soluções estejam definidas pelo menos em um intervalo de tempo $[0, T]$. Isso nos leva a um processo $\{X_t\}_{t\in [0, T]}$.

Suponhamos, mais ainda, que cada $X_t$ tenha uma função densidade de probabilidade $p(t, x)$ bem definida. A questão que queremos investigar é sobre a evolução dessa função.

$$
\mathrm{E}[\varphi] = \int_\mathbb{R} \varphi(X_t(\omega))\;\mathrm{d}\mathbb{P}(\omega) = \int_\mathbb{R} \varphi(x)p(t, x) \;\mathrm{d}x.
$$

Derivando em relação ao tempo, obtemos
$$
\frac{\mathrm{d}}{\mathrm{d}t}  \mathrm{E}[\varphi] = \frac{\mathrm{d}}{\mathrm{d}t}  \int_\mathbb{R} \varphi(x)p(t, x) \;\mathrm{d}x = \int_\mathbb{R} \varphi(x)\frac{\partial p}{\partial t}(t, x) \;\mathrm{d}x.
$$

Por outro lado, também temos
$$
\frac{\mathrm{d}}{\mathrm{d}t} \mathbb{E}[\varphi] = \int_\mathbb{R} \varphi'(X_t(\omega))\frac{\mathrm{d}}{\mathrm{d}t}X_t(\omega)\;\mathrm{d}\omega = \int_\mathbb{R} \varphi'(X_t(\omega))f(t, X_t(\omega))\;\mathrm{d}\omega = \int_\mathbb{R} \varphi'(x)f(t, x) p(t, x)\;\mathrm{d}x.
$$
Integrando por partes,
$$
\frac{\mathrm{d}}{\mathrm{d}t} \mathbb{E}[\varphi] = - \int_\mathbb{R} \varphi(x)\frac{\partial}{\partial x}\left(f(t, x) p(t, x)\right)\;\mathrm{d}x.
$$

Igualando as duas identidades, temos
$$
\int_\mathbb{R} \varphi(x)\frac{\partial p}{\partial t}(t, x) \;\mathrm{d}x = - \int_\mathbb{R} \varphi(x)\frac{\partial}{\partial x}\left(f(t, x) p(t, x)\right)\;\mathrm{d}x.
$$

Como isso é válido para qualquer $\varphi$, obtemos a equação
$$
\frac{\partial p}{\partial t}(t, x) + \frac{\partial}{\partial x}\left(f(t, x) p(t, x)\right) = 0,
$$
para a evolução da função densidade de probabilidade $p(t, x)$.
