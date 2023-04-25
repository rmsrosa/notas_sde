@def title = "Integrais de Riemann-Stieltjes"

# {{ get_title }}

No caso de um processo $\{Y_t\}_{t\in [a, b]}$ cujos caminhos são, quase certamente, de variação limitada, podemos definir
$$
Z = \int_a^b f(t, X_t) \;\mathrm{d}Y_t,
$$
onde $\{X_t\}_{t \in [a, b]}$ é um processo estocástico real definido em um intervalo $[a, b]\subset \mathbb{R}$.

Vamos considerar, principalmente, funções e processos em que

1. $f:[a, b]\times \mathbb{R} \rightarrow \mathbb{R}$ é contínuo; e
2. Quase certamente, os caminhos amostrais de $\{X_t\}_{t\in [a,b]}$ são contínuos.

Sob essas condições, para quase todo $\omega$, a função
$$
t \mapsto f(t, X_t(\omega))
$$
é contínua e limitada no intervalo compacto $t\in [a, b]$. Portanto, a sua integral de Riemann-Stieltjes com respeito ao caminho de variação limitada $t \mapsto Y_t(\omega)$ está bem definida. Dessa forma, podemos definir $Z$ pontualmente, via essa integral:
$$
Z(\omega) = \int_a^b f(s, X_s(\omega)) \;\mathrm{d}Y_s(\omega).
$$

O conjunto em que o caminho amostral não é contínuo tem medida nula e, nele, podemos definir $Z(\omega)$ como sendo zero ou qualquer outro valor.

## Integração por partes

Se $\{X_t\}_t$ e $\{Y_t\}_t$ são processos com caminhos aleatórios de variação limitada, então $\{X_tY_t\}_t$ também tem seus caminhos de variação limitada.

Dada uma partição $0 = t_0 < t_1 < \ldots < t_n = T$, temos
$$
X_TY_T - X_0Y_0 = \sum_{j=1}^n \left(X_{t_j}Y_{t_j} - X_{t_{j-1}}Y_{t_{j-1}}\right) = \sum_{j=1}^n \left((X_{t_j} - X_{t_{j-1}})Y_{t_j} + X_{t_{j-1}}(Y_{t_j} - Y_{t_{j-1}})\right)
$$
Observe que, ao refinarmos a malha, obtemos, no lado direito, duas integrais de Riemann-Stieltjes:
$$
X_TY_T - X_0Y_0 = \int_0^T Y_t \;\mathrm{d}X_t + \int_0^T X_t \;\mathrm{d}X_t.
$$

Esta é a fórmula de integração por partes para a integral de Riemann-Stieltjes, aqui aplicada à integração envolvendo processos com caminhos de variação limitada, quase certamente.
