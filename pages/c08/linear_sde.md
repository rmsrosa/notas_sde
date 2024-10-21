@def title = "Resolução de equações lineares"

# {{ get_title }}

Sabemos que a equação diferencial ordinária linear homogênea
$$
\frac{\mathrm{d}x}{\mathrm{d}t} = b(t)x
$$
tem as suas soluções da forma
$$
x(t) = x(0)e^{\int_0^t b(s)\;\mathrm{d}s}.
$$
Mais geralmente, usando $e^{-\int_0^t b(s)\;\mathrm{d}s}$ como fator de integração, vemos que a equação linear não homogênea
$$
\frac{\mathrm{d}x}{\mathrm{d}t} = a(t) + b(t)x
$$
tem as suas soluções obtidas pela fórmula de variação de constantes,
$$
x(t) = x(0)e^{\int_0^t b(s)\;\mathrm{d}s} + \int_0^t e^{\int_s^t b(\tau) \;\mathrm{d}\tau}a(s)\;\mathrm{d}s.
$$

Vejamos, agora, como resolver versões estocásticas dessa equação linear.

De maneira geral, vamos ver modelos da forma
$$
\mathrm{d}X_t = f(t, X_t)\;\mathrm{d}t + g(t, X_t)\;\mathrm{d}W_t, \qquad t \geq 0,
$$
com $f$ e $g$ lineares, ou seja,
$$
f(t, x) = f_0(t) + f_1(t)x, \quad g(t, x) = g_0(t) + g_1(t)x.
$$

Junto a isso, consideramos uma condição inicial
$$
\left.X_t\right|_{t = 0} = X_0.
$$

Nas seções seguintes, veremos alguns modelos clássicos que tem essa forma linear. Aqui, nos limitaremos a encontrar as soluções dessas equações. 

## Equação estocástica linear sem drift e com ruído aditivo

Comecemos com a equação sem drift e com ruído "aditivo",
$$
\mathrm{d}X_t = g_0(t) \mathrm{d}W_t.
$$
Como $\{X_t\}_{t\geq 0}$ não aparece do lado direito, a solução é simplesmente a integral de $g$:
$$
X_t = X_0 + \int_0^t g_0(s) \;\mathrm{d}W_s.
$$

## Equação estocástica linear sem drift e com ruído multiplicativo

Mais interessante é o caso de ruído multiplicativo linear:
$$
\mathrm{d}X_t = g_1(t) X_t \;\mathrm{d}W_t.
$$

Nesse caso, a solução é dada por
$$
X_t = X_0 e^{-\frac{1}{2}\int_0^t g_1(s)^2\;\mathrm{d}s + \int_0^t g_1(s)\;\mathrm{d}W_s}.
$$

Se não houvesse o fator de correção da fórmula de Itô, esperaríamos obter uma solução com termo multiplicativo
$$
    e^{\int_0^t g_1(s)\;\mathrm{d}W_s}.
$$
Mas podemos tentar usar esse termo como fator de integração, para achar a soluçõa correta.

Considere, então, o processo
$$
    G_t = \int_0^t g_1(s)\;\mathrm{d}W_s,
$$
que satisfaz
$$
    \mathrm{d}G_t = g_1(t)\;\mathrm{d}W_t,
$$
e o fator de integração definido pelo processo
$$
    e^{-G_t}.
$$
Pela fórmula de Itô, com $e^{-G_t} = f(G_t),$ $f(x) = e^{-x},$ temos
$$
    \mathrm{d}(e^{-G_t}) = -e^{-G_t}\;\mathrm{d}G_t + \frac{1}{2}e^{-G_t}g_1(t)^2\;\mathrm{d}t = -e^{-G_t}g_1(t)\;\mathrm{d}W_t + \frac{1}{2}e^{-G_t}g_1(t)^2\;\mathrm{d}t .
$$

Assim, considerando o processo
$$
    Z_t = X_t e^{-G_t},
$$
temos
$$
    \begin{align*}
        \mathrm{d}Z_t & = e^{-G_t}\;\mathrm{d}X_t + X_t\mathrm{d}e^{-G_t} \\
        & = e^{-G_t} g_1(t) X_t \;\mathrm{d}W_t + X_t\left( -e^{-G_t}g_1(t)\;\mathrm{d}W_t + \frac{1}{2}e^{-G_t}g_1(t)^2\;\mathrm{d}t\right) \\
        & = \frac{1}{2}X_te^{-G_t}g_1(t)^2\;\mathrm{d}t \\
        & = \frac{1}{2}g_1(t)^2 Z_t\;\mathrm{d}t.
    \end{align*}
$$
Esse é uma equações diferencial ordinária (com condição inicial aleatória) para $Z_t,$ cuja solução é
$$
    Z_t = Z_0 e^{\frac{1}{2}\int_0^t g_1(s)^2\;\mathrm{d}s}.
$$
Como $Z_0 = X_0$ e $X_t = Z_t e^{G_t},$ obtemos a solução
$$
    X_t = X_0 e^{\frac{1}{2}\int_0^t g_1(s)^2\;\mathrm{d}s + \int_0^t g_1(s)\;\mathrm{d}W_s}.
$$

## Equação estocástica linear com drift determinístico e com ruído aditivo

Considere, agora,
$$
\mathrm{d}X_t = f_0(t) \;\mathrm{d}t + g_0(t) \;\mathrm{d}W_t.
$$
Novamente, a solução é simplesmente a "primitiva" do lado direito:
$$
X_t = X_0 + \int_0^t f_0(s)\;\mathrm{d}s + \int_0^t g_0(s) \;\mathrm{d}W_s.
$$

## Equação estocástica linear com drift e com ruído multiplicativo

Mais interessante, é a equação
$$
\mathrm{d}X_t = f_1(t)X_t \;\mathrm{d}t + g_1(t) X_t\;\mathrm{d}W_t.
$$

Nesse caso, a solução tem a forma
$$
X_t = X_0 e^{\int_0^t \left(f_1(s) - \frac{1}{2} g_1(s)^2\right)\;\mathrm{d}s + \int_0^t g_1(s)\;\mathrm{d}W_s}.
$$
Também podemos chegar nessa fórmula via fator de integração. Aqui, vamos apenas verificar que tal processo é, de fato, a solução. Escrevemos
$$
X_t = X_0 Y_t, \quad Y_t = e^{G_t},
$$
com
$$
G_t =  \int_0^t \left(f_1(s) -\frac{1}{2}g_1(s)^2\right)\;\mathrm{d}s + \int_0^t g_1(s)\;\mathrm{d}W_s.
$$

Como antes, $\{G_t\}_{t \geq 0}$ é um processo de Itô, nesse caso satisfazendo
$$
\mathrm{d}G_t = \left(f_1(t) - \frac{1}{2}g_1(t)^2\right)\;\mathrm{d}t + g_1(t)\;\mathrm{d}W_t.
$$

Assim,
$$
\begin{align*}
    \mathrm{d}X_t & = X_0\;\mathrm{d}Y_t = X_0e^{G_t}\;\mathrm{d}G_t + \frac{1}{2}g_1(t)^2e^{G_t}\;\mathrm{d}t \\
    & = X_0e^{G_t}\left(\left(f_1(t) - \frac{1}{2}g_1(t)^2\right)\;\mathrm{d}t + g_1(t)\;\mathrm{d}W_t\right) + \frac{1}{2}g_1(t)^2e^{G_t}\;\mathrm{d}t \\
    & = X_0 e^{G_t}f_1(t)\;\mathrm{d}t + X_0 e^{G_t}g_1(t)\;\mathrm{d}W_t \\
    & = f_1(t) X_t\;\mathrm{d}t + g_1(t) X_t\;\mathrm{d}W_t
\end{align*}
$$
mostrando que $X_t = X_0e^{G_t}$ é a solução.

## Caso geral 

No caso geral,
$$
    \mathrm{d}X_t = (f_0(t) + f_1(t)X_t)\;\mathrm{d}t + (g_0(t) + g_1(t)X_t)\;\mathrm{d}W_t,
$$
a ideia é, também, usar um fator de integracão. No caso, usar o fator $e^{-G_t},$ onde
$$
    G_t = \int_0^t f_1(s)\;\mathrm{d}s + \int_0^t g_1(s)\;\mathrm{d}W_s.
$$

Deixamos os detalhes para o leitor.

## Exponencial estocástica

Um caso particular do anterior é o processo
$$
X_t = X_0 e^{\lambda W_t  - \frac{1}{2}\lambda^2 t},
$$
que faz um papel semelhante ao da função $x(t) = x_0e^{\lambda t},$ que é solução de
$$
\frac{\mathrm{d}x}{\mathrm{d}t} = \lambda x,
$$
que pode ser escrita em forma diferencial como
$$
\mathrm{d}x = \lambda x \;\mathrm{d}t.
$$

Na versão estocástica, $\{X_t\}_{t \geq 0}$ é solução de
$$
\mathrm{d}X_t = \lambda X_t \;\mathrm{d}W_t.
$$
