@def title = "Integrais via dualidade"

# {{ get_title }}

Quando $\{Y_t\}_t$ é um processo estocástico continuamente diferenciável quase sempre, vimos que vale a fórmula
$$
Y_t = Y_0 + \int_0^t \frac{\mathrm{d}Y_s}{\mathrm{d}s} \;\mathrm{d}s.
$$

Sendo os caminhos diferenciáveis, os mesmos são de variação limitada, de modo que podemos pensar no lado direito acima como uma integral de Riemann-Stieltjes e escrever
$$
Y_t = Y_0 + \int_0^t \mathrm{d}Y_s.
$$

Vamos estender isso para incluir a integral de funções $g(t, Y_t)$ continuamente diferenciáveis.

## Integrando funções determinísticas diferenciáveis

Considere, primeiramente, uma função real $g:\mathbb{R} \rightarrow\mathbb{R}$ continuamente diferenciável. Temos que $\{g(t)Y_t\}_t$ também é um processo continuamente diferenciável, com derivada dada quase sempre por
$$
\frac{\mathrm{d}}{\mathrm{d}t} g(t)Y_t = g'(t)Y_t + g(t)\frac{\mathrm{d}Y_t}{\mathrm{d}t}.
$$
Assim, podemos considerar a integral
$$
g(t)Y_t = g(0)Y_0 + \int_0^t g'(s)Y_s + g(s)\frac{\mathrm{d}Y_s}{\mathrm{d}s} \;\mathrm{d}s.
$$

Como o processo $\{Y_t\}_t$ é continuamente diferenciável, os seus caminhos amostrais são de variação limitada e a integral do segundo termo pode ser vista como uma integral de Riemann-Stieltjes:
$$
\int_0^t g(s)\frac{\mathrm{d}Y_s}{\mathrm{d}s} \;\mathrm{d}s = \int_0^t g(s)\;\mathrm{d}Y_s.
$$

Dessa forma, podemos escrever a *fórmula de integração por partes*
$$
\int_0^t g(s)\;\mathrm{d}Y_s = g(t)Y_t - g(0)Y_0 - \int_0^t g'(s)Y_s \;\mathrm{d}s.
$$

Observe, agora, que o lado direito não involve a derivada do processo $\{Y_t\}_t$ e faz sentido mesmo quando os seus caminhos amostrais são apenas contínuos. Com isso, podemos tomar o lado direito como a definição da integral à esquerda nesse caso mais geral.

Ou seja, **para uma função real $g:\mathbb{R}\rightarrow \mathbb{R}$ continuamente diferencial e um processo $\{Y_t\}_t$ com caminhos amostrais contínuos quase sempre, definimos a integral de $g$ com respeito a esse processo por**
$$
\int_0^t g(s)\;\mathrm{d}Y_s \stackrel{\mathrm{def}}{=} g(t)Y_t - g(0)Y_0 - \int_0^t g'(s)Y_s \;\mathrm{d}s.
$$

Nesse momento, estamos interpretando o lado direito da fórmula de integração por partes como uma outra forma de representar o termo à esquerda. Essa dupla representação é comumente denominada de representação dual. Ou de dualidade. Nesse sentido, dizemos que estamos usando essa dualidade para estender o conceito de integral. É uma definição por dualidade.

### Integral via dualidade de uma função determinística em relação a um processo de Wiener

Como exemplo, podemos integrar uma função determinística continuamente diferenciável $g=g(t)$ com respeito a um processo de Wiener $\{W_t\}_{t\geq 0}.$ Como $W_0 = 0,$ isso nos leva à fórmula
$$
    \int_0^t g(s)\;\mathrm{d}W_s \stackrel{\mathrm{def}}{=} g(t)W_t - \int_0^t g'(s)W_s \;\mathrm{d}s.
$$

Essa definição, usando dualidade, de integral com relação a um processo de Wiener, foi proposta por Paley, Wiener e Zygmund (veja Evans (2013)). Esta integral satisfaz as propriedades usuais de linearidade.

Como $\mathbb{E}[W_t] = 0,$ para todo $t \geq 0,$ o valor esperado da integral também é sempre nulo:
$$
\mathbb{E}\left[\int_0^t g(s)\;\mathrm{d}W_s\right] = g(t)\mathbb{E}[W_t] - \int_0^t g'(s)\mathbb{E}[W_s] \;\mathrm{d}s = 0, \quad \forall t \geq 0.
$$

Quanto ao momento de segunda ordem,
$$
\begin{align*}
    \mathbb{E}\left[\left(\int_0^t g(s)\;\mathrm{d}W_s\right)^2 \right] & = \mathbb{E}\left[\left(\int_0^t g(s)\;\mathrm{d}W_s\right)\left(\int_0^t g(\tau)\;\mathrm{d}W_\tau\right) \right] \\
    & = \mathbb{E}\left[\left(g(t)W_t - \int_0^t g'(s)W_s \;\mathrm{d}s\right)\left(g(t)W_t - \int_0^t g'(\tau) W_\tau \;\mathrm{d}\tau\right) \right] \\
    & = g(t)^2\mathbb{E}[W_t^2]  - \mathbb{E}\left[\int_0^t g(t)g'(\tau) W_t W_\tau \;\mathrm{d}\tau\right] \\
    & \quad - \mathbb{E}\left[\int_0^t g'(s)g(t)W_sW_t \;\mathrm{d}s\right] + \mathbb{E}\left[\int_0^t\int_0^t g'(s)g'(\tau)W_sW_\tau \;\mathrm{d}\tau\;\mathrm{d}s\right] \\
    & = g(t)^2\mathbb{E}[W_t^2]  - 2\int_0^t g(t)g'(s) \mathbb{E}\left[W_t W_s\right] \;\mathrm{d}s \\
    & \quad + \int_0^t\int_0^t g'(s)g'(\tau)\mathbb{E}\left[W_sW_\tau\right] \;\mathrm{d}\tau\;\mathrm{d}s.
\end{align*}
$$
Usando a propriedade $\mathbb{E}[W_tW_s] = \min\{t, s\},$ obtemos
$$
\begin{align*}
    \mathbb{E}\left[\left(\int_0^t g(s)\;\mathrm{d}W_s\right)^2 \right] & = g(t)^2t - 2g(t)\int_0^t g'(s) s \;\mathrm{d}s \\
    & \quad + \int_0^t\int_0^s g'(s)g'(\tau)\tau \;\mathrm{d}\tau\;\mathrm{d}s + \int_0^t\int_s^t g'(s)g'(\tau)s \;\mathrm{d}\tau\;\mathrm{d}s \\
    & = g(t)^2t - 2g(t)\int_0^t g'(s) s \;\mathrm{d}s \\
    & \quad + \int_0^t\int_\tau^t g'(s)g'(\tau)\tau \;\mathrm{d}s\;\mathrm{d}\tau + \int_0^t\int_s^t g'(s)g'(\tau)s \;\mathrm{d}\tau\;\mathrm{d}s \\
    & = g(t)^2t - 2g(t)\int_0^t g'(s) s \;\mathrm{d}s \\
    & \quad + \int_0^t (g(t) - g(\tau))g'(\tau)\tau\;\mathrm{d}\tau + \int_0^t g'(s)(g(t) - g(s))s \;\mathrm{d}s \\
    & = g(t)^2t - 2g(t)\int_0^t g'(s) s \;\mathrm{d}s \\
    & \quad + 2\int_0^t g(t)g'(s)s\;\mathrm{d}s - 2\int_0^t g'(s)g(s)s \;\mathrm{d}s \\
    & = g(t)^2t - 2\int_0^t g'(s)g(s)s \;\mathrm{d}s \\
    & = g(t)^2t - \int_0^t (g(s)^2)'s \;\mathrm{d}s \\
    & = g(t)^2 t - g(t)^2 t + \int_0^t g(s)^2 \;\mathrm{d}s.
\end{align*}
$$
Portanto, obtemos a igualdade
$$
\mathbb{E}\left[\left(\int_0^t g(s)\;\mathrm{d}W_s\right)^2 \right] = \int_0^t g(s)^2 \;\mathrm{d}s.
$$
Essa é a versão com integrando determinístico de uma identidade fundamental chamada de *isometria de Itô.*

Como a esperança da integral é nula, isso significa que podemos escrever
$$
\mathrm{Var}\left(\int_0^{t_1} g(s)\;\mathrm{d}W_s\right) = -\int_0^{t_1} \int_0^t g'(t)g(s)\;\mathrm{d}s\;\mathrm{d}t = - \int_0^{t_1}\int_s^{t_1} g'(t)g(s) \;\mathrm{d}t\;\mathrm{d}s = \int_0^{t_1} g(s)^2\;\mathrm{d}s.
$$

## Integrando composições diferenciáveis

Podemos adaptar essa ideia para o caso de uma composição com o processo $\{Y_t\}_t.$ Mais precisamente, considere uma função real $g:\mathbb{R}^2 \rightarrow\mathbb{R}$ continuamente diferenciável. Integrando-se essa função em relação apenas à variável $y,$ obtemos uma primitiva de $g,$ em relação a $y,$ ou seja, obtemos uma função $G:\mathbb{R}^2 \rightarrow \mathbb{R}$ tal que
$$
g(t, y) = \partial_y G(t, y).
$$

Temos que $\{G(t, Y_t)\}_t$ é um processo continuamente diferenciável, com derivada dada quase certamente por
$$
\frac{\mathrm{d}}{\mathrm{d}t} G(t, Y_t) = \partial_t G(t, Y_t) + \partial_y G(t, Y_t)\frac{\mathrm{d}Y_t}{\partial t} = \partial_t G(t, Y_t) + g(t, Y_t)\frac{\mathrm{d}Y_t}{\partial t}.
$$

Dessa forma, temos
$$
G(t, Y_t) = G(0, Y_0) + \int_0^t \left(\partial_s G(s, Y_s) + g(s, Y_s)\frac{\mathrm{d}Y_s}{\partial s}\right) \;\mathrm{d}s.
$$

Mais uma vez, como $\{Y_t\}_t$ é continuamente diferenciável, podemos reescrever a segunda integral como sendo uma integral de Riemann-Stieltjes:
$$
G(t, Y_t) = G(0, Y_0) + \int_0^t \partial_s G(s, Y_s) \;\mathrm{d}s + \int_0^t g(s, Y_s)\;\mathrm{d}Y_s.
$$

Agora, observe que, caso $\{Y_t\}_t$ tenha caminhos amostrais apenas contínuos, a primeira integral no lado direito acima continua fazendo sentido. Isso nos leva a pensar em definir a segunda integral, com respeito a esse processo, através dos termos restantes, usando novamente a ideia de dualidade.

No entanto, como está fórmula não será válida em geral, vamos usar uma notação ligeiramente diferente para a integral obtida dessa maneira.

Assim, **assumindo $\{Y_t\}_t$ com caminhos amostrais contínuos e $g:\mathbb{R}^2 \rightarrow\mathbb{R}$ uma função real continuamente diferenciável, definimos,** por dualidade
$$
\int_0^t g(s, Y_s)\circ\mathrm{d}Y_s = G(t, Y_t) - G(0, Y_0) - \int_0^t \partial_s G(s, Y_s) \;\mathrm{d}s.
$$

Observe o símbolo "$\circ$" utilizado na integração. Esse símbolo será novamente utilizado quando definirmos a *integral no sentido de Stratonovich.* Para essa integral, a fórmula acima também será válida, nesse caso especial de integrando da forma $g(s, Y_s).$ Mas a integral de Stratonovich será válida para funções mais gerais. Essa integral difere da *integral de Itô*, que será mais usada por nós e para a qual a fórmula acima não é válida.

### Caso independente de $y$

No caso em que $g(t, y) = g(t)$ independe de $y,$ temos $G(t, y) = g(t)y$ e recuperamos a integral anterior, também definida por dualidade:
$$
\int_0^t g(s)\circ\mathrm{d}Y_s = g(t)Y_t - g(0) Y_0 - \int_0^t g(s) Y_s \;\mathrm{d}s.
$$

### Caso independente de $t$

No caso em que $g(t, y) = g(y)$ independe de $t,$ a fórmula acima se reduz a
$$
\int_0^t g(Y_s)\circ\mathrm{d}Y_s = G(Y_t) - G(Y_0),
$$
onde $G$ é uma primitiva de $g.$

### Exemplos

No caso de $g$ ser constante igual a $1,$ recuperamos a identidade inicial e a igualdade das duas integrais definidas por dualidade:
$$
\int_0^t \mathrm{d}Y_s = Y_t - Y_0 = \int_0^t 1\circ\mathrm{d}Y_s.
$$

Já se $g(t,y) = g(y) = y,$ então podemos tomar $G(t, y) = y^2/2$ e obter
$$
\int_0^t Y_s \circ\mathrm{d}Y_s = \frac{1}{2}Y_t^2 - \frac{1}{2}Y_0^2.
$$

No caso particular de um processo de Wiener, temos
$$
\int_0^t W_s \circ\mathrm{d}W_s = \frac{1}{2}W_t^2.
$$

## E agora?

As construções acima já englobam uma boa parte de funções que podem ser integradas. No entanto, em várias aplicações, precisamos integrar, em relação a um dado processo $\{Y_t\}_t,$ uma função de outro processo $\{X_t\}_t,$ da forma $g(t, X_t).$ De fato, muitas vezes $\{X_t\}_t$ é um processo desconhecido, dado como solução de uma equação estocástica cuja lei de evolução envolve um dado processo $\{Y_t\}_t.$ Veremos como fazer isso a seguir, através das integrais de Itô e de Stratonovich.

## Exercícios

1. Seja $\{Y_t\}_{t \in [a,b]},$ $a < b,$ um processo com caminhos amostros contínuos quase certamente. Seja $g:\mathbb{R}\rightarrow \mathbb{R}$ uma função continuamente diferenciável. Considere a integral de $g$ em relação a $\{Y_t\}_{t\in [a,b]}$ como definida acima:
$$
\int_a^b g(s)\;\mathrm{d}Y_s \stackrel{\mathrm{def}}{=} g(b)Y_b - g(a)Y_a - \int_a^b g'(s)Y_s \;\mathrm{d}s.
$$

Mostre que essa integral possui as seguintes propriedades:

a) Para qualquer constante $c\in\mathbb{R}$ e qualquer função continuamente diferenciável $g:\mathbb{R}\rightarrow\mathbb{R},$ vale
$$
\int_a^b c g(s)\;\mathrm{d}Y_s = c\int_a^b g(s)\;\mathrm{d}Y_s.
$$

b) Para quaisquer funções continuamente diferenciáveis $g_1, g_2:\mathbb{R} \rightarrow \mathbb{R},$ vale
$$
\int_a^b (g_1(s) + g_2(s)) \;\mathrm{d}Y_s = \int_a^b g_1(s) \;\mathrm{d}Y_s + \int_a^b g_2(s) \;\mathrm{d}Y_s.
$$
