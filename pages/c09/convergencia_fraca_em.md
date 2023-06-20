@def title = "Convergência fraca do método de Euler-Maruyama"

# {{ get_title }}

Para a convergência fraca, buscamos mostrar que
$$
\max_{j=1, \ldots, n} |\mathbb{E}[X_{t_j}] - \mathbb{E}[X_j^{\mathrm{\Delta t}}]| \rightarrow 0
$$