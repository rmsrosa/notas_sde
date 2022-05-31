@def title = "Integrais de funções diferenciáveis com respeito a processos estocásticos"

# {{ get_title }}

Quando $\{Y_t\}_t$ é um processo estocástico continuamente diferenciável quase sempre, vimos que vale a fórmula
$$
Y_t = Y_0 + \int_0^t \frac{\mathrm{d}Y_s}{\mathrm{d}s} \;\mathrm{d}s.
$$

Sendo $g:\mathbb{R} \rightarrow\mathbb{R}$ uma função continuamente diferenciável, temos que $\{g(Y_t)\}_t$ também é um processo continuamente diferenciável e vale
$$
g(Y_t) = g(Y_0) + \int_0^t g'(Y_s)\frac{\mathrm{d}Y_s}{\mathrm{d}s} \;\mathrm{d}s.
$$

Se $g$ for duas vezes continuamente diferenciável, podemos usar integração por partes e escrever
$$
g(Y_t) = g(Y_0) + g'(Y_t)Y_t - g'(Y_0)Y_0 - \int_0^t g''(Y_s)Y_s \;\mathrm{d}s.
$$
De outra forma, podemos escrever
$$
\int_0^t g'(Y_s)\frac{\mathrm{d}Y_s}{\mathrm{d}s} \;\mathrm{d}s = g'(Y_t)Y_t - g'(Y_0)Y_0 - \int_0^t g''(Y_s)Y_s \;\mathrm{d}s.
$$