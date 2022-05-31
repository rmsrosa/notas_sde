@def title = "Integrais de processos estocásticos"

# {{ get_title }}

## Integral definida

Vamos considerar integrais da forma
$$
Y = \int_a^b f(s, X_s) \;\mathrm{d}s,
$$
onde $\{X_t\}_{t \in [a, b]}$ é um processo estocástico real definido em um intervalo $[a, b]\subset \mathbb{R}$.

Vamos considerar, principalmente, funções e processos em que

1. $f:[a, b]\times \mathbb{R} \rightarrow \mathbb{R}$ é contínuo; e
2. Quase certamente, os caminhos amostrais de $\{X_t\}_{t\in [a,b]}$ são contínuos.

Sob essas condições, para quase todo $\omega$, a função
$$
t \mapsto f(t, X_t(\omega))
$$
é contínua e limitada no intervalo compacto $t\in [a, b]$. Portanto, a sua integral de Riemann está bem definida e podemos definir $Y$ pontualmente, via essa integral:
$$
Y(\omega) = \int_a^b f(s, X_s(\omega)) \;\mathrm{d}s.
$$
O conjunto em que o caminho amostral não é contínuo tem medida nula e, nele, podemos definir $Y(\omega)$ como sendo zero ou qualquer outro valor. Não faz diferença, no sentido de medida.

A questão que não é imediata é se $\omega \mapsto Y(\omega)$, assim definido, é mensurável e, portanto, é uma variável aleatória. Para isso, podemos mostrar que $Y$ é o limite, quase sempre, de somas de Riemann.

Seja $a = t_0 < t_1 < \cdots < t_n = b$ uma partição do intervalo $[a, b]$ e defina
$$
Y^n = \sum_{j=1}^{n} f(t_{j-1}, X_{t_{j-1}}(\omega)) (t_j - t_{j-1}).
$$

Como $f$ é contínuo, cada $\omega \mapsto f(t_{j-1}, X_{t_{j-1}}(\omega))$ é mensurável. Como a combinação linear de funções mensuráveis é mensurável, segue que $Y^n$ é mensurável. 

Finalmente, para quase todo $\omega$, $Y^n(\omega)$ é a soma de Riemann da integral de Riemann $Y(\omega)$. Portanto, $Y^n(\omega)$ converge para $Y(\omega)$, para quase todo $\omega$. Assim, vemos que $Y$ é o limite pontual das funções mensurávels $Y^n$. Como o limite de funções mensuráveis reais é mensurável, segue que $Y$ é mensurável. Portanto, $Y$ é uma variável aleatória.

## Processos integrais

Sob as mesmas hipóteses em $f$ e $\{X_t\}_{t\in [a, b]}$, podemos, também, considerar as integrais
$$
Y_t = \int_a^t f(s, X_s) \;\mathrm{d}s.
$$
Naturalmente, $Y_a = 0$.

Para cada $t \in [a, b]$, vimos, acima, que $Y_t$ é uma variável aleatória no mesmo espaço de probabilidades do processo $\{X_t\}_{t\in [a, b]}$. Isso faz de $\{Y_t\}_{t\in [a, b]}$ um processo contínuo.

Além disso, observe que, para quase todo $\omega$, os caminhos amostrais de $\{Y_t\}_{t\in [a, b]}$ são dados por
$$
t \mapsto Y_t(\omega) = \int_a^t f(s, X_s(\omega)) \;\mathrm{d}s.
$$
Como $t \mapsto f(t, X_t(\omega))$ é contínuo, portanto, integrável, segue que cada caminho amostral é contínuo em $[a, b]$.
