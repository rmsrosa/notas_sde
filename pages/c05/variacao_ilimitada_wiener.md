@def title = "Variação ilimitada dos caminhos amostrais"

# {{ get_title }}

Uma característica fundamental dos processos de Wiener é a de que os seus caminhos amostrais são, quase certamente, de *variação ilimitada.* Por esse motivo precisamos de conceitos diferentes de integração para dar sentido às equações estocásticas (as integrais de Itô e de Stratonovich). Caso contrário, usaríamos o conceito de *integral de Riemann-Stieltjes.*

Vejamos, abaixo, esses conceitos de variação limitada/ilimitada e de integral de Riemann-Stieltjes e o fato dos caminhos amostrais de um processo de Wiener serem, quase certamente, de variação ilimitada.

## Funções de variação limitada ou ilimitada

Se $g = g(t)$ representa a posição de um objeto ao longo do tempo, definida em um intervalo temporal $[a, b],$ com $a < b,$ a distância entre o ponto inicial e o ponto final é simplesmente $|g(b) - g(a)|.$ Mas, ao longo do caminho, o objeto pode ir para frente e para trás diversas vezes, como em um *zig-zag.* Nesse caso, podemos estimar a distância percorrida calculando
$$
\sum_{j=1}^n |g(t_j) - g(t_{j-1})|
$$
para instantes de tempo $a \leq t_0 < t_1 < \ldots < t_n \leq b.$ Caso $x$ seja continuamente diferenciável, isso pode ser estimado por
$$
\sum_{j=1}^n |g(t_j) - g(t_{j-1})| \leq \sum_{j=1}^n |g'(\theta_j)|\Delta t_j \leq \max\{|g'|\}(b-a), 
$$
onde $t_{j-1} \leq \theta_j \leq t_j$ e $\Delta t_j = t_j - t_{j-1}.$ Observe que a estimativa à direita independe da malha de tempo, de modo que
$$
\sup_{0\leq t_0 < t_1 < \ldots t_n \leq T}\sum_{j=1}^n |g(t_j) - g(t_{j-1})| \leq \max_{[a, b]}\{|g'|\}(b-a),
$$
onde o supremo é tomado em relação à todas as partições possíveis do intervalo $[a, b].$

Na verdade, podemos ser mais precisos em relação à distância percorrida. Sendo $g$ continuamente diferenciável, a soma
$$
\sum_{j=1}^n |g'(\theta_j)|\Delta t_j
$$
é, de fato, uma soma de Riemman, cujo limite é a integral
$$
\int_a^b |g'(t)| \;\mathrm{d}t.
$$

Voltando à estimativa relativa a uma partição arbitrária, caso a função seja Lipschitz contínua em $[a, b],$ com constante de Lipschitz $L \geq 0,$ ainda podemos limitar essa quantidade:
$$
\sup_{a\leq t_0 < t_1 < \ldots t_n \leq b}\sum_{j=1}^n |g(t_j) - g(t_{j-1})| \leq L(b-a).
$$

Mas podemos ter $g$ sem ser Lipschitz contínua e, ainda assim, essa quantidade ser limitada. Mesmo certas funções descontínuas são de variação limitada. Por exemplo, $g(t) = \chi_{[0,1]}(t)$ (vale $1$ no intervalo $[0, 1]$ e vale $0$ fora do intervalo) é de variação limitada. Em particular, qualquer função monótona limitada é de variação limitada. Funções de distribuição acumulada de probabilidade são monótonas não decrescentes e de variação limitada.

Essa quantidade é chamada de **variação** da função no intervalo $[a, b]$ e é denotada por $V(g; a, b)$:
$$
\mathrm{V}(g; a, b) = \sup_{a\leq t_0 < t_1 < \ldots t_n \leq b}\sum_{j=1}^n |g(t_j) - g(t_{j-1})|.
$$

Caso $V(g; a, b)$ seja finito, dizemos que a função é de **variação limitada,** no intervalo $[a, b].$ Caso contrário, ela é dita de **variação ilimitada.**

## Integral de Riemann-Stieltjes

Funções de variação limitada são úteis para se estender a integral de Riemann para a chamada *integral de Riemann-Stieltjes:*
$$
\int_a^b f(t)\;\mathrm{d}g(t) = \lim \sum_{j=1}^n f(\theta_i) (g(t_j) - g(t_{j-1})).
$$
O limite é tomado em relação ao refinamento das malhas: $\max_j\{t_j - t_{j-1}\} \rightarrow 0.$ Desde que $g$ seja de variação limitada, é possível mostrar que o limite converge, quando $f$ é contínua. Obtemos a integral de Riemann ao tomarmos $g(t) = t.$

Como a função de probabilidade acumulada $g(x) = \mathbb{P}(X \leq x)$ de uma variável aleatória $X$ é monónota e limitada, ela é de variação limitada, de modo que podemos representar a esperança de uma nova variável $Y = h(X)$ através de uma integral de Riemann-Stieltjes:
$$
\mathbb{E}(h(X)) = \int_\mathbb{R} h(x) \;\mathrm{d}g(x).
$$

Caso $g$ seja diferenciável, então $\mathrm{d}g = f\mathrm{d}x,$ onde $f$ é a função de densidade de probabilidade. Mas a integral acima independe de $g$ ser diferenciável ou não.

A integral de Riemann-Stieltjes possui diversas propriedades análogas à da integral de Riemann, como linearidade:
$$
\int_a^b (\lambda_1 f_1(t) + \lambda_2 f_2(t))\;\mathrm{d}g(t) = \lambda_1 \int_a^b f_1(t)\;\mathrm{d}g(t) + \lambda_2 \int_a^b f_2(t)\;\mathrm{d}g(t).
$$
Também podemos concatenar integrais
$$
\int_a^b f(t)\;\mathrm{d}g(t) + \int_b^c f(t)\;\mathrm{d}g(t) = \int_a^c f(t)\;\mathrm{d}g(t),
$$
independentemente da ordem de $a, b, c.$

Mas a integral de Riemann-Stieltjes não é positiva, i.e.
$$
\int_a^b f(t)\;\mathrm{d}g(t)
$$
pode ser negativa, mesmo que $f\geq 0.$ Para ver isso, basta considerar $g(t) = -t.$ Isso nos impede de estimar a integral de uma função em termos da integral de outra função que a limite.

Veremos que algo parecido ocorre com a integral de Itô.

## Caminhos amostrais de processos de Wiener

Vamos, agora, mostrar essa propriedade fundamental de processos de Wiener que é a de que os seus caminhos amostrais, em qualquer intervalo $[0, T],$ $T > 0,$ são, quase certamente, de variação ilimitada.

Queremos, para isso, estimar a variação
$$
\mathrm{V}(W_t; 0, T) = \sup_{0\leq t_0 < t_1 < \ldots t_n \leq T}\sum_{j=1}^n |W_{t_j} - W_{t_{j-1}}|.
$$

A ideia é considerar uma estimativa por baixo para mostrar que essa variação é ilimitada. Sejam, então, $0 = t_0 < t_1 < \ldots < t_n = T.$ Temos
$$
\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2 \leq \left(\max_{j=1, \ldots, n} |W_{t_j} - W_{t_{j-1}}|\right)\sum_{j=1}^n |W_{t_j} - W_{t_{j-1}}|.
$$

Para efeito de contradição, vamos assumir que a malha seja uniforme e em pontos diádicos, i.e. para cada $k\in \mathbb{N},$ tomamos $n = 2^k,$ $\tau = T/n = T/2^k$ e $t_j = j\tau=j/2^k,$ para $j = 0, \ldots, n.$

Vamos mostrar que, quando $k \rightarrow \infty,$ o lado esquerdo converge para um valor finito positivo e o primeiro termo do lado direito converge para zero, de modo que a variação tem que ser ilimitada.

O fato da malha ser uniforme facilita obtermos expressões mais explícitas para certas quantidades. Por outro lado, o uso dos pontos diádicos nos dá um decrescimento rápido o suficiente que nos permite usar o Lema de Borel-Cantelli. Nenhuma dessas duas condições é necessária. Há outras demonstrações mais delicadas que se aplicam a malhas arbitrárias. Mas o resultado com malhas diádicas é suficiente.

### Sobre a soma dos quadrados dos incrementos

Denote a soma dos quadrados dos incrementos por
$$
S_k = \sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2,
$$
lembrando que $n = 2^k$ e $t_j = j/2^k.$

O valor esperado da soma dos quadrados dos incrementos pode ser escrito como
$$
\mathbb{E}\left[S_k\right] = \mathbb{E}\left[\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2\right] = \sum_{j=1}^n \mathbb{E}\left[\left(W_{t_j} - W_{t_{j-1}}\right)^2\right].
$$
Observe que, usando-se a propriedade $\mathbb{E}(W_tW_s) = \mathrm{Cov}(W_t, W_s) = \min\{t, s\},$
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
\mathbb{E}\left[S_k\right] = \sum_{j=1}^n (t_j - t_{j-1}) = t_n - t_0 = T.
$$
Observe que, aqui, o resultado vale para uma malha arbitrária.

Agora, estimamos a sua variância. Primeiro, temos
$$
\mathbb{E}\left[S_k^2\right] = \mathbb{E}\left[\left(\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2\right)^2\right] = \sum_{i, j = 1}^n\mathbb{E}\left[\left(W_{t_i} - W_{t_{i-1}}\right)^2\left(W_{t_j} - W_{t_{j-1}}\right)^2\right]
$$
Para $i\neq j,$ como os incrementos são independentes e normais, temos
$$
\mathbb{E}\left[\left(W_{t_i} - W_{t_{i-1}}\right)^2\left(W_{t_j} - W_{t_{j-1}}\right)^2\right] = \mathbb{E}\left[\left(W_{t_i} - W_{t_{i-1}}\right)^2\right]\mathbb{E}\left[\left(W_{t_j} - W_{t_{j-1}}\right)^2\right] = (t_i - t_{i-1})(t_j - t_{j-1}).
$$
Para $i = j,$ como o incremento é normal, podemos calcular os seus momentos explicitamente, obtendo, em particular,
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
Os termos do primeiro somatório são separáveis em $i$ e $j,$ de modo que
$$
\begin{align*}
\mathbb{E}\left[\left(\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2\right)^2\right] & = \left(\sum_{i = 1}^n (t_i - t_{i-1})\right)\left(\sum_{j = 1}^n (t_j - t_{j-1})\right) + 2\sum_{j = 1}^n (t_j - t_{j-1})^2 \\
& = T^2 + 2\sum_{j = 1}^n (t_j - t_{j-1})^2.
\end{align*}
$$
Portanto, a variância é dada por
$$
\begin{align*}
\mathrm{Var}\left(\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2\right) & = \mathbb{E}\left[\left(\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2\right)^2\right] - \mathbb{E}\left[\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2\right]^2 \\
& = T^2 + 2\sum_{j = 1}^n (t_j - t_{j-1})^2 - T^2 \\
& = 2\sum_{j = 1}^n (t_j - t_{j-1})^2.
\end{align*}
$$

Podemos estimar
$$
\mathrm{Var}\left(\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2\right) \leq 2T\max_{j=1,\ldots, n}\{(t_j - t_{j-1})\}.
$$
Novamente, essa estimativa vale para uma malha arbitrária. No caso da malha uniforme, com $\tau = 1/2^k,$ temos, mais precisamente,
$$
\mathrm{Var}\left(\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2\right) \leq 2T\tau = \frac{T}{2^{k-1}}.
$$

No limite do refinamento da malha, temos
$$
\mathbb{E}[S_k] = T, \quad \mathrm{Var}(S_k) \rightarrow 0,
$$
portanto
$$
S_k \rightarrow T,
$$
quando $k\rightarrow \infty.$ Mais importante é a estimativa que segue da desigualdade de Chebyshev,
$$
    \mathbb{P}\left(|S_k - T| \geq \varepsilon \right) \leq \mathbb{E}\left[\frac{(S_k - T)^2}{\varepsilon^2}\right] \leq \frac{1}{\varepsilon^2}\frac{T}{2^{k-1}},
$$
para $\varepsilon>0$ arbitrário. Com isso,
$$
    \sum_{k = 1}^\infty \mathbb{P}\left(|S_{k} - T| \geq \varepsilon \right) \leq \frac{2T}{\varepsilon^2} < \infty.
$$
Portanto, pelo Lema de Borel-Cantelli,
$$
\mathbb{P}\left(\limsup_{k\rightarrow \infty} |S_k - T| \geq \varepsilon\right) = 0.
$$
Como $\varepsilon > 0$ é arbitrário, segue que
$$
\mathbb{P}\left( \limsup_{k\rightarrow \infty} |S_k - T| > 0 \right) = 0.
$$
Escrito de outra maneira,
$$
\mathbb{P}\left( \lim_{k\rightarrow \infty} |S_k - T| = 0 \right) = 1,
$$
ou seja,
$$
S_{k} \rightarrow T,
$$
quase certamente.

### Sobre o máximo dos incrementos

Por definição, quase todos os caminhos amostrais de um processo de Wiener são contínuos. Como o intervalo $[0, T]$ é fechado e limitado, segue, que, para quase todo $\omega,$ o caminho amostral $t \mapsto W_t(\omega)$ é uniformemente contínuo em $[0, T].$

Assim, dado $\varepsilon > 0,$ existe $\delta > 0$ tal que
$$
|W_s(\omega) - W_t(\omega)| < \varepsilon, \qquad \forall t, s\in [0, T), \;|t - s| \leq \delta.
$$

No caso da malha escolhida, temos, para $\varepsilon > 0$ e $k \geq \ln (1/\delta),$ que $t_j - t_{j-1} = 1/n = 1/2^k \leq \delta$ e, portanto,
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

Obtivemos que, para quase todo caminho amostral, quando a malha é refinada, ao limite $k\rightarrow \infty,$ o termo do lado esquerdo converge para $T,$ enquanto que o primeiro termo do lado direito converge para zero. Portanto, devemos ter
$$
\sum_{j=1}^n |W_{t_j} - W_{t_{j-1}}| \geq \frac{\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2}{\max_{j=1, \ldots, n} |W_{t_j} - W_{t_{j-1}}|} \rightarrow \infty, \qquad k \rightarrow \infty.
$$

Isso implica, em particular, que, para quase todo caminho amostral, a variação do caminho é ilimitada, i.e.
$$
    \mathbb{P}\left(\mathrm{V}(W_t; 0, T) = \infty\right) = 1.
$$
