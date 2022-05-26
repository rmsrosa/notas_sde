@def title = "Integral de processos estocásticos"

# {{ get_title }}

Nessa primeira parte, vamos considerar integrais da forma
$$
Y_t = \int_a^t f(s, X_s) \;\mathrm{d}s, \qquad 0 \leq t \leq b
$$
onde $\{X_t\}_{t \in [a, b]}$ é um processo estocástico real definido em um intervalo $[a, b]\subset \mathbb{R}$.

Vamos considerar apenas processos em que

1. $f:[a, b]\times \mathbb{R} \rightarrow \mathbb{R}$ é contínuo; e
2. Quase certamente, os caminhos amostrais de $\{X_t\}_{t\in [a,b]}$ são contínuos.

Sob essas condições, basta definirmos $Y_t$ via integral de Riemann, para cada caminho amostral contínuo de $\{X_t\}_{t\in [a, b]}$:
$$
Y_t(\omega) = \int_a^t f(s, X_s(\omega)) \;\mathrm{d}s.
$$
O conjunto em que o caminho amostral não é contínuo tem medida nula e, nele, podemos definir $Y_t(\omega)$ como sendo zero ou qualquer outro valor. Não faz diferença, nesse sentido de medida.

Por construção, $\{Y_t\}_{t\in [a, b]}$ é um processo real com a propriedade de que cada caminho amostral também é contínuo, quase certamente.
