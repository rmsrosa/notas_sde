@def title = "Variação ilimitada quase sempre dos caminhos amostrais"

# {{ get_title }}

Uma propriedade fundamental do processo de Wiener é que os seus caminhos são, quase sempre, de *variação ilimitada*. Por esse motivo precisaremos de conceitos diferentes de integração para dar sentido às equações estocásticas (as integrais de Itô e de Stratonovich). Caso contrário, usaríamos o conceito de *integral de Riemann-Stieltjes*.

Vejamos, abaixo, esses conceitos de variação limitada/ilimitada e de integral de Riemann-Stieltjes e o fato dos caminhos amostrais do processo de Wiener serem, quase sempre, de variação ilimitada.

## Funções de variação limitada ou ilimitada

Se $g = g(t)$ representa a posição de um objeto ao longo do tempo, definida em um intervalo $[a, b]$, $a < b$, podemos estimar a distância percorrida calculando-se
$$
\sum_{j=1}^n |g(t_j) - g(t_{j-1})|
$$
para instantes de tempo $a \leq t_0 < t_1 < \ldots < t_n \leq b$. Caso $x$ seja diferenciável, isso pode ser estimado por
$$
\sum_{j=1}^n |g(t_j) - g(t_{j-1})| \leq \sum_{j=1}^n |g'(\theta_j)|\Delta_j t \leq \max\{|g'|\}(b-a), 
$$
onde $t_{j-1} \leq \theta_j \leq t_j$ e $\Delta_j t = t_j - t_{j-1}$. Observe que a estimativa à direita independe da malha de tempo, de modo que
$$
\sup_{0\leq t_0 < t_1 < \ldots t_n \leq T}\sum_{j=1}^n |g(t_j) - g(t_{j-1})| \leq \max_{[a, b]}\{|g'|\}(b-a),
$$
onde o supremo é tomado em relação à todas as partições possíveis do intervalo $[a, b]$.

Caso a função seja Lipschitz contínua em $[a, b]$, com constante de Lipschitz $L \geq 0$, ainda podemos limitar essa quantidade:
$$
\sup_{0\leq t_0 < t_1 < \ldots t_n \leq T}\sum_{j=1}^n |g(t_j) - g(t_{j-1})| \leq L(b-a).
$$

Mas podemos ter $g$ sem ser Lipschitz contínua e, ainda assim, essa quantidade ser limitada. Mesmo certas funções descontínuas são de variação limitada. Por exemplo, $g(t) = \chi_{[0,1]}(t)$ (vale $1$ no intervalo $[0, 1]$ e vale $0$ fora do intervalo) é de variação limitada. Em particular, qualquer função monótona limitada é de variação limitada. Em particular, funções de distribuição acumulada são monótonas não-decrescentes e de variação limitada.

Essa quantidade é chamada de **variação** da função no intervalo $[a, b]$ e é denotada por $V(g; a, b)$:
$$
\mathrm{V}(g; a, b) = \sup_{0\leq t_0 < t_1 < \ldots t_n \leq T}\sum_{j=1}^n |g(t_j) - g(t_{j-1})|.
$$

Caso $V(g; a, b)$ seja finito, dizemos que a função é de **variação limitada**, no intervalo $[a, b]$. Caso contrário, ela é dita de **variação ilimitada**.

## Integral de Riemann-Stieltjes

Funções de variação limitada são úteis para se estender a integral de Riemann para a chamada *integral de Riemann-Stieltjes*:
$$
\int_a^b f(t)\;\mathrm{d}g(t) = \lim \sum_{j=1}^n f(\theta_i) (g(t_j) - g(t_{j-1})).
$$
O limite é tomado em relação ao refinamento das malhas. (Mais detalhes depois...) Desde que $g$ seja de variação limitada, é possível mostrar que o limite converge, quando $f$ é contínua. Obtemos a integral de Riemann ao tomarmos $g(t) = t$.

Como a função de densidade de probabilidade é monónota e limitada, ela é de variação limitada, de modo que podemos representar a probabilidade de um evento $h(X) \in (a, b)$ de uma variável aleatória $X$ através de uma integral de Riemann-Stieltjes:
$$
\mathbb{P}(h(X) \in (a, b)) = \int_a^b h(x) \;\mathrm{d}g(x),
$$
onde $g$ é a função de probabilidade acumulada de $X$:
$$
g(x) = \mathbb{P}(X \leq x)
$$
Caso $g$ seja diferenciável, então $\mathrm{d}g = f\mathrm{d}x$, onde $f$ é a função de densidade de probabilidade. Mas a integral acima independe de $g$ ser diferenciável ou não.

## Caminhos amostrais do processo de Wiener

Vamos, agora, mostrar essa propriedade fundamental do processo de Wiener que é a de que os seus caminhos amostrais são, quase sempre, de variação ilimitada.

Queremos, então, estimar a variação
$$
\mathrm{V}(W_t; a, b) = \sup_{0\leq t_0 < t_1 < \ldots t_n \leq T}\sum_{j=1}^n |W_{t_j} - W_{t_{j-1}}|.
$$

A ideia é considerar uma estimativa por baixo para mostrar que essa variação é ilimitada.

Sejam $0 \leq t_0 < t_1 < \ldots < t_n$. Temos
$$
\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2 \leq \left(\max_{j=1, \ldots, n} |W_{t_j} - W_{t_{j-1}}|\right)\sum_{j=1}^n |W_{t_j} - W_{t_{j-1}}|.
$$

### Sobre a soma dos quadrados dos incrementos

O valor esperado da soma dos quadrados dos incrementos pode ser escrito como
$$
\mathbb{E}\left[\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2\right] = \sum_{j=1}^n \mathbb{E}\left[\left(W_{t_j} - W_{t_{j-1}}\right)^2\right].
$$
Observe que, usando-se a propriedade $\mathbb{E}(W_tW_s) = \mathrm{Cov}(W_t, W_s) = \min\{t, s\}$,
$$
\begin{align*}
\mathbb{E}\left[\left(W_{t_j} - W_{t_{j-1}}\right)^2\right] & = \mathbb{E}\left[W_{t_j}^2 - 2W_{t_j}W_{t_{j-1}} + W_{t_{j-1}}^2\right] \\
& = \mathbb{E}\left[W_{t_j}^2\right] -2\mathbb{E}\left[W_{t_j}W_{t_{j-1}}\right] + \mathbb{E}\left[W_{t_{j-1}}^2\right] \\
& = t_j - 2t_{j-1} + t_{j-1} \\
& = t_j - t_{j-1}.
\end{align*}
$$
Assim, obtemos a identidade
$$
\mathbb{E}\left[\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2\right] = \sum_{j=1}^n (t_j - t_{j-1}) = t_n - t_0.
$$

Agora, estimamos a sua variância.
$$
\mathbb{E}\left[\left(\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2\right)^2\right] = \sum_{i, j = 1}^n\mathbb{E}\left[\left(W_{t_i} - W_{t_{i-1}}\right)^2\left(W_{t_j} - W_{t_{j-1}}\right)^2\right]
$$
Para $i\neq j$, como os incrementos são independentes e normais, temos
$$
\mathbb{E}\left[\left(W_{t_i} - W_{t_{i-1}}\right)^2\left(W_{t_j} - W_{t_{j-1}}\right)^2\right] = \mathbb{E}\left[\left(W_{t_i} - W_{t_{i-1}}\right)^2\right]\mathbb{E}\left[\left(W_{t_j} - W_{t_{j-1}}\right)^2\right] = (t_i - t_{i-1})(t_j - t_{j-1}).
$$
Para $i = j$, como o incremento é normal, podemos calcular os seus momentos explicitamente, obtendo
$$
\mathbb{E}\left[\left(W_{t_j} - W_{t_{j-1}}\right)^4\right] = 3(t_j - t_{j-1})^2.
$$
Assim,
$$
\mathbb{E}\left[\left(\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2\right)^2\right] = \sum_{i \neq j = 1}^n (t_i - t_{i-1})(t_j - t_{j-1}) + \sum_{j = 1}^n 3(t_j - t_{j-1})^2
$$



