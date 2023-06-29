@def title = "Estabilidade assintótica"

# {{ get_title }}

Dado um processo $\{X_t\}_{t\geq 0},$ como em muitos problemas dinâmicos, uma questão de interesse é o comportamento assintótico do mesmo, quando $t\rightarrow \infty.$ Em particular, em alguns casos, é interessante estudar a *estabilidade* do processo, i.e. como, e sob que condições, $X_t \rightarrow 0.$

## Tipos de estabilidade assintótica

Quando
$$
\lim_{t\rightarrow \infty}\mathbb{E}[X_t^2] = 0,
$$
dizemos que o processo é **assintoticamente estável em média quadrática,** ou apenas **estável em média quadrática.** Analogamente, podemos examinar a estabilidade assintótica em momentos de ordem $p$ qualquer.

Outra sentido útil é no sentido *quase certamente,* i.e. se
$$
\lim_{t\rightarrow \infty} X_t = 0
$$
quase certamente. Nesse caso dizemos que o processo é **assintoticamente estável quase certamente** ou apenas **assintoticamente estável.**

Nenhum dos dois sentidos implica, necessariamente, no outro.

## Estabilidade assintótica do movimento Browniano geométrico

A título de ilustração, considere um movimento Browniano geométrico, definido por
$$
\mathrm{d}X_t = \mu X_t\;\mathrm{d}t + \sigma X_t \;\mathrm{d}W_t,
$$
com $\mu, \sigma$ reais constantes. Já vimos que a solução é dada por
$$
X_t = X_0 e^{(\mu - \frac{1}{2}\sigma^2)t + \sigma W_t}.
$$
Já vimos, também, que
$$
\mathbb{E}[X_t^2] = \mathbb{E}[X_0]e^{(2\mu + \sigma^2)t}.
$$
Portanto,
$$
\lim_{t\rightarrow \infty}\mathbb{E}[X_t^2] = 0 \quad \Leftrightarrow \quad \mu + \frac{1}{2}\sigma^2 < 0.
$$

Ou seja, um movimento Brownian geométrico é assintoticamente estável em média quadrática se, e somente se, $\mu + \sigma^2/2 < 0.$

Por outro lado, já vimos que um processo de Wiener tem um crescimento sublinear, i.e.
$$
\lim_{t\rightarrow \infty} \frac{W_t}{t} = 0
$$
quase certamente. Assim, quando $t\rightarrow \infty,$
$$
X_t = X_0 e^{(\mu - \frac{1}{2}\sigma^2)t + \sigma W_t} = X_0 e^{(\mu - \frac{1}{2}\sigma^2 + W_t/t)t} \rightarrow 0,
$$
quase certamente se, e somente se,
$$
\mu - \frac{1}{2}\sigma^2 < 0.
$$

Assim, no caso do movimento Brownian geométrico,
$$
\textrm{assintoticamente estável em média quadrática} \quad \Leftrightarrow \quad \mu + \frac{1}{2}\sigma^2 < 0
$$
e
$$
\textrm{assintoticamente estável quase certamente} \quad \Leftrightarrow \quad \mu - \frac{1}{2}\sigma^2 < 0
$$
sendo que, obviamente,
$$
\mu + \frac{1}{2}\sigma^2 < 0 \quad \Rightarrow \quad \mu - \frac{1}{2}\sigma^2 < 0.
$$
