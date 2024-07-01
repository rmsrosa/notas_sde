@def title = "Existência e unicidade de soluções"

# {{ get_title }}

Vamos considerar, nesse capítulo, equações diferenciais aleatórias da forma
$$
\frac{\mathrm{d}X_t}{\mathrm{d}t} = f(t, X_t, Y_t), \quad 0 \leq t \leq T,
$$
onde $T > 0,$ $\{Y_t\}_{t\in [0, T]}$ é um processo real com caminhos amostrais contínuos e $f:[0, T]\times \mathbb{R} \times\mathbb{R} \rightarrow \mathbb{R}$ é contínuo.

Junte-se à essa equação uma condição inicial
$$
\left.X_t\right|_{t = 0} = X_0,
$$
onde $X_0$ é uma variável aleatória real.

Sob essas condições, podemos considerar soluções por caminho da equação diferencial aleatória. Essas condições são suficientes para os nossos objetivos, no momento, mas podem ser relaxadas.

## Definição de solução por caminhos

Uma **solução por caminhos** *(ou pathwise solution)* da equação diferencial aleatória acima é um processo aleatório real $\{X_t\}_{t\in [0, T]}$ tal que quase todo caminho amostral $t\mapsto X_t(\omega)$ é continuamente diferenciável e satisfaz a equação diferencial ordinária
$$
\frac{\mathrm{d} X_t(\omega)}{\mathrm{d} t} = f(t, X_t(\omega), Y_t(\omega)), \qquad 0 \leq t \leq T.
$$
No caso do problema de valor inicial, pedimos, ainda, que
$$
\left.X_0\right|_{t = 0}(\omega) = X_0(\omega),
$$
quase certamente.

## Existência de solução

No caso de uma equação diferencial ordinária $x' = f(t, x, \lambda),$ sabemos que se $f$ for contínua na vizinhança de um ponto $(t_0, x_0, \lambda),$ então existe pelo menos uma solução local do problema de valor inicial $x(t_0) = x_0.$ 

No caso da equação diferencial aleatória, precisamos resolver isso para cada amostra $\omega,$ ou seja, precisaríamos de soluções locais para cada $x' = f(t, x, Y_t(\omega)),$ com condição inicial $x(0) = X_0(\omega).$ O problema é que o Teorema de Peano nos dá, para cada $\omega,$ uma solução local $x = x(t, \omega)$ em um intervalo $(-\delta(\omega), \delta(\omega)),$ com $\delta(\omega) > 0.$ E não temos, em princípio, como controlar $\delta(\omega)$ para que fique, sempre, estritamente maior do que zero, de modo a nos garantir um intervalo mínimo no qual a equação pode ser resolvida para todo $\omega.$ Mesmo que isso possa ser feito, não temos, sob essa hipótese (de mera continuidade da $f$), que a função $\omega \mapsto x(t, \omega)$ esteja bem definida e seja contínua. Desse jeito, não temos como garantir que $\omega \mapsto X_t(\omega) = x(t, \omega)$ seja mensurável e, portanto, seja uma variável aleatória.

Continuando a pensar na teoria de equações diferenciais ordinárias, se assumirmos um pouco mais, que $f$ seja localmente Lipschitz contínua na variável $x,$ então $\omega \mapsto X_t(\omega) = x(t, \omega)$ está bem definido e é contínuo, pelo menos para os valores $\omega$ em que a solução está definida até o instante $t.$ Mas, novamente, não temos como garantir, em geral, que a soluções existem num intervalo de tempo mínimo. Ou seja, $\delta(\omega) > 0$ pode não estar limitado inferiormente por um valor estritamente positivo.

Uma solução é pedir que a função $f=f(t, x, y)$ seja globalmente Lipscthiz na variável $x,$ i.e. que exista $L > 0$ tal que
$$
|f(t, x_1, y) - f(t, x_2, y)| \leq L |x_1 - x_2|, \qquad \forall t, x_1, x_2, y.
$$

Nesse caso, $\delta(\omega) = \infty,$ para todo $\omega\in \Omega,$ e a função-solução $\omega \mapsto x(t, \omega)$ do problema de valor inicial. Assim, o processo $\{X_t\}_{t\geq 0}$ definido por $X_t(\omega) = x(t, \omega)$ é um processo com caminhos continuamente diferenciáveis e que é uma solução por caminhos da equação diferencial aleatória.

Outra solução é exigir apenas que $f=f(t, x, y)$ seja localmente Lipschitz em $x$ mas que tenha alguma estrutura adicional que nos permita garantir a existência de solução por um tempo mínimo comum a todos os valores amostrais $\omega\in\Omega.$

Veremos exemplos na seção seguinte.

## Unicidade

A unicidade de soluções por caminho de equações diferenciais aleatórias segue diretamente do resultado para equações diferenciais ordinárias clássicas.

Sob a condição de $f = f(t, x, y)$ ser contínua nas variáveis $(t, x, y),$ em um domínio $[0, T] \times \mathbb{R}\times \mathbb{R}$ e *localmente* Lipschhitz na variável $x$ e com $\{Y_t\}_{t\in [0, T]}$ com caminhos amostrais contínuos, a solução por caminhos, quando existe, é única em um sentido quase sempre, i.e. se $\{X_t\}_{t \geq 0}$ e $\{\tilde X_t\}_{t \geq 0}$ são soluções por caminho, então
$$
\mathbb{P}\left(\{X_t = \tilde X_t\}_t\right) = \mathbb{P}\left(\left\{\omega \in \Omega; \;X_t(\omega) = \tilde X_t(\omega), \;\forall t\in [0, T]\right\}\right) = 1.
$$

Aqui, a continuidade Lipschitz local significa que, para cada $R > 0,$ existe $L_R > 0$ tal que
$$
|f(t, x_1, y) - f(t, x_2, y)| \leq L_R|x_1 - x_2|, \qquad \forall t\in [0, T], \;\forall x_1, x_2, y \in [-R, R].
$$

De fato, suponha que, para quase todo $\omega,$ temos
$$
\frac{\mathrm{d} X_t(\omega)}{\mathrm{d} t} = f(t, X_t(\omega), Y_t(\omega)), \qquad 0 \leq t \leq T.
$$
e
$$
\frac{\mathrm{d} \tilde X_t(\omega)}{\mathrm{d} t} = f(t, \tilde X_t(\omega), Y_t(\omega)), \qquad 0 \leq t \leq T.
$$
com
$$
\left.X_0\right|_{t = 0}(\omega) = \left.\tilde X_0\right|_{t = 0}(\omega).
$$

Como $t \mapsto X_t(\omega)$ e $t \mapsto \tilde X_t$ satisfazem a mesma equação diferencial ordinária, com a mesma condição inicial, e $f$ é localmente Lipschitz contínuo na variável $x$ e o caminho $t\mapsto Y_t(\omega)$ é contínuo, então a solução é contínua e limitada e, portanto, é única, ou seja $X_t(\omega) = \tilde X_t(\omega)$ em $t\in [0, T].$ Como isso vale quase certamente em $\omega,$ então a unicidade vale nesse sentido.

Ressaltamos, aqui, que utilizamos, anteriormente, a continuidade Lipschitz *global* para garantir a *existência,* mas apenas a continuidade Lipschitz *local* é necessária, aqui, para garantir a unicidade, desde que seja possível mostrar a existência de alguma outra forma, explorando outras estruturas do termo $f.$

## Outros tipos de solução

Outros tipos de solução podem ser obtidas relaxando o sentido de convergência do limite
$$
\frac{\mathrm{d}X_t}{\mathrm{d}t} = \lim_{\tau \rightarrow 0} \frac{X_{t+\tau} - X_t}{\tau}.
$$

No caso acima, de soluções por caminhos, o limite vale quase certamente, i.e.
$$
\mathbb{P}\left(\exists \frac{\mathrm{d}X_t}{\mathrm{d}t} = \lim_{\tau \rightarrow 0} \frac{X_{t+\tau} - X_t}{\tau} = f(t, X_t, Y_t) \right) = 1.
$$

Mas, em princípio, a noção de derivada de um processo pode ser relaxada para convergência em probabilidade, convergência em distribuição, convergência em média-quadrática, convergência em média $p\geq 1,$ etc. A dificuldade é obtermos condições em $f$ e em $Y_t,$ mais fracas, que garantam a existência de soluções da equação diferencial aleatória nesse sentido (também) mais fraco que convergência quase certamente.

Uma sentido bastante utilizado é o de solução no sentido de média quadrática, em que existe um processo $\{\mathrm{d}X_t/\mathrm{d}t\}_{t \in [0, T)}$ tal que
$$
\mathbb{E}\left( \left| \frac{X_{t+\tau} - X_t}{\tau} - \frac{\mathrm{d}X_t}{\mathrm{d}t}\right|\right) \rightarrow 0, \quad \tau \rightarrow 0.
$$

No entanto, não exploraremos esse caminho aqui.
