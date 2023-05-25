@def title = "Relações entre equações estocásticas e equações aleatórias"

# {{ get_title }}

Em muitas situações, é possível transformar uma equação estocástica em uma aleatória, e vice-versa.

## De equações aleatórias para estocásticas

Considere uma equação diferencial aleatória da forma
$$
\frac{\mathrm{d}X_t}{\mathrm{d}t} = f(t, X_t, \Lambda_t),
$$
e suponha que o processo $\{\Lambda_t\}_t$ seja um processo de Itô satisfazendo uma equação diferencial estocástica
$$
\mathrm{d}\Lambda_t = a(t, \Lambda_t)\mathrm{d}t + \sigma(t, \Lambda_t)\mathrm{d}W_t,
$$
para um dado processo de Wiener $\{W_t\}_t$.

Formalmente, podemos reescrever a equação diferencial aleatória como um sistema de equações estocásticas,
$$
\mathrm{d}\left(\begin{matrix} X_t \\ \Lambda_t \end{matrix}\right) = \left(\begin{matrix} f(t, X_t, \Lambda_t) \\ a(t, \Lambda_t) \end{matrix}\right) + \left(\begin{matrix} 0 \\ \sigma(t, \Lambda_t) \end{matrix}\right)\mathrm{d}W_t.
$$

Este é um sistema da forma
$$
\mathrm{d}U_t = F(t, U_t) + \Sigma(t, U_t)\mathrm{d}W_t,
$$
onde 
$$
U_t = \left(\begin{matrix} X_t \\ \Lambda_t\end{matrix}\right), \quad F(t, U_t) = \left(\begin{matrix} f(t, X_t, \Lambda_t) \\ a(t, \Lambda_t)\end{matrix}\right), \quad \Sigma(t, U_t) = \left(\begin{matrix} 0 \\ \sigma(t, \Lambda_t)\end{matrix}\right).
$$

Observe que o processo $Y_t$ entra, na equação aleatória, como um termo externo, enquanto que, na equação estocástica, ela é uma variável dependente; uma "incógnita" da equação.

## De estocásticas com ruído aditivo para aleatórias

Considere uma equação diferencial estocástica com **ruído aditivo**, na forma
$$
\mathrm{d}X_t = f(t, X_t)\mathrm{d}t + \sigma(t)\mathrm{d}W_t.
$$
Observe que, aqui, estamos assumindo que o termo de ruído $\sigma(t)$ é independente do processo $X_t$, daí o termo "aditivo". Caso contrário, sendo $\sigma = \sigma(t, X_t)$, o termo de rúido é denominado **multiplicativo.**

No caso aditivo, é possível transformar facilmente essa equação estocástica em uma aleatória. Nessa passagem, um elemento importante é o **processo de Ornstein-Uhlenbeck** $\{O_t\}_t$, que satisfaz à equação diferencial estocástica
$$
\mathrm{d}O_t = - O_t \mathrm{d}t + \sigma(t) \mathrm{d}W_t.
$$

Considerando um "mudança de variáveis" para o processo $Z_t = X_t - O_t$, temos, formalmente,
$$
\mathrm{d}Z_t = \mathrm{d}X_t - \mathrm{d}O_t = f(t, X_t)\mathrm{d}t + \sigma(t)\mathrm{d}W_t + O_t \mathrm{d}t - \sigma(t) \mathrm{d}W_t = (f(t, X_t) + O_t)\mathrm{d}t,
$$
o que nos leva, finalmente, à equação diferencial aleatória
$$
\mathrm{d}Z_t = (f(t, Z_t + O_t) + O_t)\mathrm{d}t,
$$
ou seja,
$$
\frac{\mathrm{d}Z_t}{\mathrm{d}t} = g(t, Z_t, O_t),
$$
com
$$
g(t, Z_t, O_t) = f(t, Z_t + O_t) + O_t.
$$

O caso multiplicativo em que o ruído é linear, i.e. $\sigma(t, X_t) = \sigma_0(t) + \sigma_1(t)X_t$, também pode ser considerado, através da transformação de Doss-Sussmann. Generalizações para o caso de um ruído multiplicativo qualquer também foram obtidas recentemente, mas a técnica é bem mais envolvida.
