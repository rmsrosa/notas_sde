@def title = "Integração estocástica"

# {{ get_title }}

Como motivação, vimos modelos de crescimento natural,
$$
    \frac{\mathrm{d}x}{\mathrm{d}t} = \mu x,
$$
onde o parâmetro $\mu$ pode ser considerado de várias formas. Por exemplo, como uma constante
$$
    \mu = \mu_0, \qquad \mu_0 > 0;
$$
como uma função determinística
$$
    \mu = \mu(t) = \mu_0 + \sigma\sin(\varpi t), \quad \mu_0, \sigma, \varpi > 0;
$$
como uma função aleatória (processo estocástico de transporte)
$$
    \mu = \mu_t = \mu_0 + \sigma\sin(\varpi t), \qquad \sigma \sim \operatorname{Beta}(a, b), \; \varpi \sim \operatorname{Exponential}(\lambda), \;\mu_0, a, b, \lambda > 0;
$$
como um processo estocástico
$$
    \mu = \mu_t = \mu_0 + \sigma \frac{\sin(W_t)}{1 + \sin(W_t)}, \qquad \mu_0, \sigma > 0;
$$
ou com um "ruído branco"
$$
    \mu = \mu_t = \mu_0 + \sigma \dot \xi, \qquad \mu_0, \sigma > 0, \;\dot\xi \sim \frac{\mathrm{d}W_t}{\mathrm{d}t}.
$$

Assumindo uma condição inicial determinística $x(0) = x_0,$ os dois primeiros casos são equações diferenciais ordinárias clássicas, cujas soluções são
$$
    x(t) = x_0 e^{\mu_0 t}
$$
e
$$
    x(t) = x_0 e^{\int_0^t \mu(s)\;\mathrm{d}s}.
$$

No terceiro e no quarto casos, as soluções são processos estocásticos $\{X_t\}_{t\geq 0}$ dados por
$$
    X_t = x_0 e^{\int_0^t \mu_s\;\mathrm{d}s},
$$
onde $\{\mu_t\}_{t\geq 0}$ são, também, processos estocásticos, o que nos levam às integrais
$$
    \int_0^t \left(\mu_0 + \sigma\sin(\varpi s)\right) \;\mathrm{d}s
$$
e
$$
    \int_0^t \left(\mu_0 + \sigma \frac{\sin(W_s)}{1 + \sin(W_s)}\right) \;\mathrm{d}s.
$$
Como os caminhos amostrais de $\{\mu_t\}_{t\geq 0}$ são contínuous (quase certamente) em ambos os casos, essas integrais podem ser definidas por caminho, e.g.
$$
    \omega \mapsto \int_0^t \left(\mu_0 + \sigma \frac{\sin(W_s(\omega))}{1 + \sin(W_s(\omega))}\right) \;\mathrm{d}s.
$$

No quinto e último caso, podemos ficar tentados a escrever
$$
    X_t = x_0 e^{\int_0^t \mu_s\;\mathrm{d}s},
$$
com
$$
    \int_0^t \mu_s\;\mathrm{d}s = \mu_0 t + \sigma \int_0^t \frac{\mathrm{d}W_s}{\mathrm{d}s} \;\mathrm{d}s = \mu_0 t + \sigma \int_0^t \;\mathrm{d}W_s = \mu_0t + \sigma W_t.
$$
Mas as coisas não são tão simples assim... A equação
$$
    \frac{\mathrm{d}X_t}{\mathrm{d}t} = \left(\mu_0 + \sigma \frac{\mathrm{d}W_t}{\mathrm{d}t}\right) x
$$
não tem sentido como está e deve ser vista como uma equação
$$
    \mathrm{d}X_t = \mu_0 X_t\;\mathrm{d}t + \sigma X_t\;\mathrm{d}W_t,
$$
que por sua vez deve ser interpretada como uma equação integral
$$
    X_t = x_0 + \mu_0\int_0^t X_s\;\mathrm{d}s + \sigma \int_0^t X_s\;\mathrm{d}W_s.
$$
A integral *estocástica* mais à direita deve ser tratada com cuidado e nos levará a uma solução ligeiramente diferente da esperada acima.

Neste capítulo, vamos ver integração de processos no sentido de Riemann,
$$
    \int_0^t X_s\;\mathrm{d}s
$$
e, como objeto de maior interesse, a integração estocástica em relação ao processo de Wiener,
$$
    \int_0^t X_s\;\mathrm{d}W_s.
$$
Dessa forma, veremos a forma correta da solução da equação estocástica
$$
    \mathrm{d}X_t = \mu_0 X_t\;\mathrm{d}t + \sigma X_t\;\mathrm{d}W_t.
$$
Veremos também propriedades curiosas da integral estocástica com respeito a $\{W_t\}_{t\geq 0}.$ Veremos quais propriedades da integral clássica se estendem a essa integral e quais propriedades devem ser reformuladas.
