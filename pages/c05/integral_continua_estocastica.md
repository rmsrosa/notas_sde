@def title = "Integrais de funções diferenciáveis com respeito a processos estocásticos"

# {{ get_title }}

Quando $\{Y_t\}_t$ é um processo estocástico continuamente diferenciável quase sempre, vimos que vale a fórmula
$$
Y_t = Y_0 + \int_0^t \frac{\mathrm{d}Y_s}{\mathrm{d}s} \;\mathrm{d}s.
$$

Sendo os caminhos diferenciáveis, os mesmos são de variação limitada, de modo que podemos pensar no lado direito acima como uma integral de Riemann-Stieltjs e escrever
$$
Y_t = Y_0 + \int_0^t \mathrm{d}Y_s.
$$

Considere, agora, uma função real $g:\mathbb{R} \rightarrow\mathbb{R}$ continuamente diferenciável.Defina $G:\mathbb{R} \rightarrow\mathbb{R}$ como sendo uma primitiva qualquer de $g$. Temos que $\{G(Y_t)\}_t$ também é um processo continuamente diferenciável e vale
$$
G(Y_t) = G(Y_0) + \int_0^t g(Y_s)\frac{\mathrm{d}Y_s}{\mathrm{d}s} \;\mathrm{d}s.
$$

Novamente, podemos pensar nessa integral como uma integra de Riemann-Stieltjes e escrever
$$
G(Y_t) = G(Y_0) + \int_0^t g(Y_s) \;\mathrm{d}Y_s.
$$

Vamos ver, agora, como podemos estender essa integral ao caso em que o processo $\{Y_t\}_t$ não tenha caminhos de variação limitada, como é o caso do processo de Wiener. Para isso, vamos, no momento, continuar assumindo que os caminhos amostrais são continuamente diferenciáveis.

Assim, sendo $g$ continuamente diferenciável, podemos usar integração por partes e escrever
$$
G(Y_t) = G(Y_0) + g(Y_t)Y_t - g(Y_0)Y_0 - \int_0^t g'(Y_s)Y_s \;\mathrm{d}s.
$$
Substituindo $G(Y_t)$, podemos escrever
$$
\int_0^t g(Y_s)\frac{\mathrm{d}Y_s}{\mathrm{d}s} \;\mathrm{d}s = g(Y_t)Y_t - g(Y_0)Y_0 - \int_0^t g'(Y_s)Y_s \;\mathrm{d}s.
$$

Agora, observe que, caso $\{Y_t\}_t$ tenha caminhos amostrais apenas contínuos, o lado direito acima continua fazendo sentido. Isso nos leva a pensar em definir uma integral com respeito a esse processo através da fórmula a direita.

De fato, isso nos leva a definir
$$
\int_0^t g(Y_s)\;\mathrm{d}Y_s \stackrel{\mathrm{def}}{=} g(Y_t)Y_t - g(Y_0)Y_0 - \int_0^t g'(Y_s)Y_s \;\mathrm{d}s.
$$
