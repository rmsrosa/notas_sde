@def title = "Variação ilimitada quase sempre dos caminhos amostrais"

# {{ get_title }}

Uma propriedade fundamental do processo de Wiener é que os seus caminhos são, quase sempre, de *variação ilimitada*. Por esse motivo precisaremos de conceitos diferentes de integração para dar sentido às equações estocásticas (as integrais de Itô e de Stratonovich). Caso contrário, usaríamos o conceito de *integral de Riemann-Stieltjes*.

Vejamos, abaixo, esses conceitos de variação limitada/ilimitada e de integral de Riemann-Stieltjes e o fato dos caminhos amostrais do processo de Wiener serem, quase sempre, de variação ilimitada.

## Funções de variação limitada ou ilimitada

Se $g = g(t)$ representa a posição de um objeto ao longo do tempo, definida em um intervalo $[a, b]$, $a < b$, podemos estimar a distância percorrida calculando-se
$$
\sum_{j=1}^n |g(t_j) - g(t_{j-1})|
$$
para instantes de tempo $a \leq t_0 < t_1 < \ldots < t_n \leq b$. Caso $x$ seja continuamente diferenciável, isso pode ser estimado por
$$
\sum_{j=1}^n |g(t_j) - g(t_{j-1})| \leq \sum_{j=1}^n |g'(\theta_j)|\Delta_j t \leq \max\{|g'|\}(b-a), 
$$
onde $t_{j-1} \leq \theta_j \leq t_j$ e $\Delta_j t = t_j - t_{j-1}$. Observe que a estimativa à direita independe da malha de tempo, de modo que
$$
\sup_{0\leq t_0 < t_1 < \ldots t_n \leq T}\sum_{j=1}^n |g(t_j) - g(t_{j-1})| \leq \max_{[a, b]}\{|g'|\}(b-a),
$$
onde o supremo é tomado em relação à todas as partições possíveis do intervalo $[a, b]$.

Na verdade, podemos ser mais precisos em relação à distância percorrida. Sendo $g$ continuamente diferenciável, a soma
$$
\sum_{j=1}^n |g'(\theta_j)|\Delta_j t
$$
é, de fato, uma soma de Riemman, cujo limite é a integral
$$
\int_a^b |g'(t)| \;\mathrm{d}t.
$$

Voltando à estimativa relativa a uma partição arbitrária, caso a função seja Lipschitz contínua em $[a, b]$, com constante de Lipschitz $L \geq 0$, ainda podemos limitar essa quantidade:
$$
\sup_{a\leq t_0 < t_1 < \ldots t_n \leq b}\sum_{j=1}^n |g(t_j) - g(t_{j-1})| \leq L(b-a).
$$

Mas podemos ter $g$ sem ser Lipschitz contínua e, ainda assim, essa quantidade ser limitada. Mesmo certas funções descontínuas são de variação limitada. Por exemplo, $g(t) = \chi_{[0,1]}(t)$ (vale $1$ no intervalo $[0, 1]$ e vale $0$ fora do intervalo) é de variação limitada. Em particular, qualquer função monótona limitada é de variação limitada. Funções de distribuição acumulada são monótonas não decrescentes e de variação limitada.

Essa quantidade é chamada de **variação** da função no intervalo $[a, b]$ e é denotada por $V(g; a, b)$:
$$
\mathrm{V}(g; a, b) = \sup_{a\leq t_0 < t_1 < \ldots t_n \leq b}\sum_{j=1}^n |g(t_j) - g(t_{j-1})|.
$$

Caso $V(g; a, b)$ seja finito, dizemos que a função é de **variação limitada**, no intervalo $[a, b]$. Caso contrário, ela é dita de **variação ilimitada**.

## Integral de Riemann-Stieltjes

Funções de variação limitada são úteis para se estender a integral de Riemann para a chamada *integral de Riemann-Stieltjes*:
$$
\int_a^b f(t)\;\mathrm{d}g(t) = \lim \sum_{j=1}^n f(\theta_i) (g(t_j) - g(t_{j-1})).
$$
O limite é tomado em relação ao refinamento das malhas: $\max_j\{t_j - t_{j-1}\} \rightarrow 0$. Desde que $g$ seja de variação limitada, é possível mostrar que o limite converge, quando $f$ é contínua. Obtemos a integral de Riemann ao tomarmos $g(t) = t$.

Como a função de probabilidade acumulada $g(x) = \mathbb{P}(X \leq x)$ de uma variável aleatória $X$ é monónota e limitada, ela é de variação limitada, de modo que podemos representar a esperança de uma nova variável $Y = h(X)$ através de uma integral de Riemann-Stieltjes:
$$
\mathbb{E}(h(X)) = \int_\mathbb{R} h(x) \;\mathrm{d}g(x).
$$

Caso $g$ seja diferenciável, então $\mathrm{d}g = f\mathrm{d}x$, onde $f$ é a função de densidade de probabilidade. Mas a integral acima independe de $g$ ser diferenciável ou não.

## Caminhos amostrais do processo de Wiener

Vamos, agora, mostrar essa propriedade fundamental do processo de Wiener que é a de que os seus caminhos amostrais, em qualquer intervalo $[0, T]$, $T > 0$, são, quase sempre, de variação ilimitada.

Queremos, para isso, estimar a variação
$$
\mathrm{V}(W_t; a, b) = \sup_{0\leq t_0 < t_1 < \ldots t_n \leq T}\sum_{j=1}^n |W_{t_j} - W_{t_{j-1}}|.
$$

A ideia é considerar uma estimativa por baixo para mostrar que essa variação é ilimitada. Sejam, então, $0 = t_0 < t_1 < \ldots < t_n = T.$ Temos
$$
\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2 \leq \left(\max_{j=1, \ldots, n} |W_{t_j} - W_{t_{j-1}}|\right)\sum_{j=1}^n |W_{t_j} - W_{t_{j-1}}|.
$$

Para efeito de contradição, vamos assumir que a malha é uniforme e em pontos diádicos, i.e. para cada $k\in \mathbb{N}$, tomamos $n = 2^k$, $\tau = T/n = T/2^k$ e $t_j = j\tau$, para $j = 0, \ldots, n$.

Vamos mostrar que, quando $k \rightarrow \infty$, o lado esquerdo converge para um valor finito positivo e o primeiro termo do lado direito converge para zero, de modo que a variação tem que ser ilimitada.

O fato da malha ser uniforme facilita obtermos expressões mais explícitas para certas quantidades. Por outro lado, o uso dos pontos diádicos garante que uma determinada malha seja um refinamento das malhas anteriores, algo que será fundamental para garantirmos a convergência quase sempre a partir da convergência em probabilidade.

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
\mathbb{E}\left[\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2\right] = \sum_{j=1}^n (t_j - t_{j-1}) = t_n - t_0 = T.
$$

Agora, estimamos a sua variância. Primeiro, temos
$$
\mathbb{E}\left[\left(\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2\right)^2\right] = \sum_{i, j = 1}^n\mathbb{E}\left[\left(W_{t_i} - W_{t_{i-1}}\right)^2\left(W_{t_j} - W_{t_{j-1}}\right)^2\right]
$$
Para $i\neq j$, como os incrementos são independentes e normais, temos
$$
\mathbb{E}\left[\left(W_{t_i} - W_{t_{i-1}}\right)^2\left(W_{t_j} - W_{t_{j-1}}\right)^2\right] = \mathbb{E}\left[\left(W_{t_i} - W_{t_{i-1}}\right)^2\right]\mathbb{E}\left[\left(W_{t_j} - W_{t_{j-1}}\right)^2\right] = (t_i - t_{i-1})(t_j - t_{j-1}).
$$
Para $i = j$, como o incremento é normal, podemos calcular os seus momentos explicitamente, obtendo, em particular,
$$
\mathbb{E}\left[\left(W_{t_j} - W_{t_{j-1}}\right)^4\right] = 3(t_j - t_{j-1})^2.
$$
Assim,
$$
\begin{align*}
\mathbb{E}\left[\left(\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2\right)^2\right] & = \sum_{i \neq j = 1}^n (t_i - t_{i-1})(t_j - t_{j-1}) + \sum_{j = 1}^n 3(t_j - t_{j-1})^2 \\
& = \sum_{i, j = 1}^n (t_i - t_{i-1})(t_j - t_{j-1}) + 2\sum_{j = 1}^n (t_j - t_{j-1})^2.
\end{align*}
$$
Como a malha é uniforme, temos
$$
\mathbb{E}\left[\left(\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2\right)^2\right] = n^2\tau^2 + 2n\tau^2 = T^2 + 2\tau T.
$$

Assim, a variância é dada por
$$
\mathrm{Var}\left(\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2\right) = \mathbb{E}\left[\left(\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2\right)^2\right] - \mathbb{E}\left[\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2\right]^2 = T^2 + 2\tau T - T^2 = 2\tau T.
$$

Dessa forma, vemos que a soma dos quadrados dos incrementos
$$
S_k = \sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2
$$
tem valor esperado constante igual a $T$ e variância $2\tau T.$ Quando $k \rightarrow \infty$, temos $\tau \rightarrow 0$, de modo que $S_k$ converge, em probabilidade, para a constante $T$:
$$
\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2 \rightarrow T, \qquad k \rightarrow \infty.
$$
Agora, vamos explorar o fato das malhas serem em pontos diádicos. Observe que
$$
W_{j/2^k} - W_{(j-1)/2^k} \leq W_{j/2^k} - W_{j/2^k + 1/2^{k+1}} + W_{j/2^k + 1/2^{k+1}} - W_{(j-1)/2^k},
$$
de modo que
$$
\begin{align*}
\left(W_{j/2^k} - W_{(j-1)/2^k}\right)^2 & = \left(W_{j/2^k} - W_{j/2^k + 1/2^{k+1}} + W_{j/2^k + 1/2^{k+1}} - W_{(j-1)/2^k}\right)^2 \\
& \leq \left(W_{j/2^k} - W_{j/2^k + 1/2^{k+1}}\right)^2 + \left(W_{j/2^k + 1/2^{k+1}} - W_{(j-1)/2^k}\right)^2.
\end{align*}
$$
Logo, para qualquer caminho amostral, temos
$$
S_{k+1} \geq S_k.
$$
A convergência em probabilidade em conjunto com a monotonicidade implica em convergência quase sempre. Logo,
$$
S_k \rightarrow T, \qquad k \rightarrow \infty,
$$
para quase todo caminho amostral.

### Sobre o máximo dos incrementos

Por definição, quase todos os caminhos amostrais de um processo de Wiener são contínuos. Como o intervalo $[0, T]$ é fechado e limitado, segue, que, para quase todo $\omega$, o caminho amostral $t \mapsto W_t(\omega)$ é uniformemente contínuo em $[0, T]$.

Assim, dado $\varepsilon > 0$, existe $\delta > 0$ tal que
$$
|W_s(\omega) - W_t(\omega)| < \varepsilon, \qquad \forall t, s\in [0, T), \;|t - s| \leq \delta.
$$

No caso da malha escolhida, temos, para $\varepsilon > 0$ e $k \geq \ln (1/\delta)$, temos $1/n = 1/2^k \leq \delta$ e, portanto,
$$
\max_{j=1, \ldots, n} |W_{t_j} - W_{t_{j-1}}| \leq \delta.
$$
Dessa forma, vemos que
$$
\max_{j=1, \ldots, n} |W_{t_j} - W_{t_{j-1}}| \rightarrow 0, \qquad k \rightarrow \infty,
$$
para quase todo caminho amostral.

### Variação ilimitada

Voltemos, agora, à identidade
$$
\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2 \leq \left(\max_{j=1, \ldots, n} |W_{t_j} - W_{t_{j-1}}|\right)\sum_{j=1}^n |W_{t_j} - W_{t_{j-1}}|.
$$

Obtivemos que, para quase todo caminho amostral, quando a malha é refinada, ao limite $k\rightarrow \infty$, o termo do lado esquerdo converge para $T$, enquanto que o primeiro termo do lado direito converge para zero. Portanto, devemos ter
$$
\sum_{j=1}^n |W_{t_j} - W_{t_{j-1}}| \geq \frac{\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2}{\max_{j=1, \ldots, n} |W_{t_j} - W_{t_{j-1}}|} \rightarrow \infty, \qquad k \rightarrow \infty.
$$

Isso implica, em particular, que, para quase todo caminho amostral, a variação do caminho é ilimitada.