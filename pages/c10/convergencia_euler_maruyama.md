@def title = "Convergência forte do método de Euler-Maruyama"

# {{ get_title }}

No caso determinístico, de uma equação diferencial
$$
\frac{\mathrm{d}x}{\mathrm{d}t} = f(t, x),
$$
com condição inicial $x(0) = x_0,$ o método de Euler
$$
x_{j}^n = x_{j-1}^n + \Delta t f(t_{j-1} x_{j-1}^n), \qquad x_j^n|_{j = 0} = x_0,
$$
em uma malha temporal uniforme $t_j = jT/n,$ $j = 0, \ldots, n,$ com $\Delta t = T/n,$ converge uniformemente, no intervalo $[0, T],$ para a solução do problema de valor inicial. Além disso, essa convergência é de ordem um. Mais precisamente, existem $C > 0$ e $\delta > 0$ tais que
$$
\max_{j}|x(t_j) - x_j| \leq C \Delta t, \qquad 0 < \Delta t \leq \delta.
$$
Isso sob a hipótese de $f$ ser localmente Lipschitz contínuas.

Por outro lado, no caso estocástico, com um ruído multiplicativo $g = g(t, X_t),$
$$
\mathrm{d}X_t = f(t, X_t)\mathrm{d}t + g(t, X_t)\mathrm{d}W_t, \qquad t \geq 0,
$$
com uma condição inicial
$$
\left.X_t\right|_{t = 0} = X_0,
$$
a convergência *forte* é apenas de ordem $1/2$ e isso sob a hipótese mais exigente de $f$ e $g$ serem *globalmente* Lipschitz contínuas. Mas é importante ressaltar que isso acontece no caso multiplicativo. Se o ruído for aditivo, $g = g(t, X_t) = g(t),$ então ainda temos a convergência forte de ordem $1.$

A diferença, no caso multiplicativo, vem, essencialmente, do fato de que, na equação estocástica, além dos termos de erro da ordem de $\Delta t,$ há termos da ordem de $\Delta W.$ Em um sentido apropriado, vale $(\Delta W)^2 \sim \Delta t,$ o que nos dá um erro da ordem de $(\Delta t)^{1/2}.$

Outro ponto importante é que, no caso discreto, a constante $C$ que aparece na ordem de convergência depende da condição inicial e explora o fato de que, com a condição inicial fixa, podemos limitar a solução exata e a aproximação. Por outro lado, no caso estocástico, considera-se, implicitamente, diversas condições iniciais $X_0(\omega)$ e não temos esse controle, por isso a necessidade de se assumir que os termos $f$ e $g$ sejam globalmente Lipschitz contínuos. Esse problema aparece mesmo no caso de ruído aditivo e apenas $f$ não globalmente Lipschitz.

Por último, um ponto um pouco mais técnico, é que, enquanto no caso discreto estimamos diretamente a diferença $|x(t_j) - x_j^n|,$ no caso estocástico precisamos nos ancorar na isometria de Itô, de modo que o mais natural é olharmos para $\mathbb{E}\left[|X_{t_j} - X_j^n|^2 \right].$

Em resumo, a hipótese de continuidade Lipschitz global é para garantir que o método convirja. E a presença de $\mathrm{d}W_t \sim \sqrt{\mathrm{d}t}$ nos dá uma convergência forte apenas de ordem $1/2,$ no caso multiplicativo. Vejamos os detalhes.

## Convergência no caso determinístico

Primeiramente, temos que
$$
x(t_j) = x(t_{j-1}) + \int_{t_{j-1}}^{t_j} x'(s)\;\mathrm{d}s = x(t_{j-1}) + \Delta t x'(t_{j-1}) + \int_{t_{j-1}}^{t_j} (x'(s) - x'(t_{j-1}))\;\mathrm{d}s.
$$
De acordo com a equação diferencial,
$$
x(t_j) = x(t_{j-1}) + \Delta t f(t_{j-1}, x(t_{j-1})) + \int_{t_{j-1}}^{t_j} (f(s, x(s)) - f(t_{j-1}, x(t_{j-1})))\;\mathrm{d}s.
$$

Assim, nos pontos $j = 1, \ldots, n$ da malha,
$$
\begin{align*}
|x(t_j) - x_j| & \leq | x(t_{j-1}) - x_{j-1} | + \Delta t |f(t_{j-1}, x(t_{j-1})) - f(t_{j-1}, x_{j-1})| \\
  & \quad + \int_{t_{j-1}}^{t_j} |f(s, x(s)) - f(t_{j-1}, x(t_{j-1}))|\;\mathrm{d}s.
\end{align*}
$$
Como a solução é contínua, ela é limitada no intervalo $[0, T],$ i.e.
$$
R_0 = \max_{0\leq t \leq T}|x(t)| < \infty.
$$
Seja $R > R_0$ e considere as constantes de Lipschitz $L_1 = L_1(R)$ e $L_2 = L_2(R)$ tais que
$$
  |f(t, x) - f(s, y)| \leq L_1(R)|t - s| + L_2(R)|x - y|, \quad \forall 0 \leq t, s \leq T, \;\forall x, y, \; |x|, |y| \leq R.
$$

Assuma, por indução, que $|x_{j-1}| \leq R.$ Com isso,
$$
\begin{align*}
|x(t_j) - x_j| & \leq |x(t_{j-1}) - x_{j-1}| + L_2 \Delta t |x(t_{j-1}) - x_{j-1}| \\
  & \quad +\int_{t_{j-1}}^{t_j} \left( L_1 |s - t_{j-1}| + L_2 |x(s) - x(t_{j-1})|\right)\;\mathrm{d}s \\
  & \leq |x(t_{j-1}) - x_{j-1}| + L_2 \Delta t |x(t_{j-1}) - x_{j-1}| \\
  & \quad + \frac{L_1}{2}|t_j - t_{j-1}|^2 + L_2 \int_{t_{j-1}}^{t_j}|x(s) - x(t_{j-1})|\;\mathrm{d}s.
\end{align*}
$$

O integrando do último termo pode ser estimado por
$$
\begin{align*}
\int_{t_{j-1}}^{t_j} |x(s) - x(t_{j-1})|\;\mathrm{d}s & \leq \int_{t_{j-1}}^{t_j} \int_{t_{j-1}}^s |x'(\tau)|\;\mathrm{d}\tau\;\mathrm{d}s \\
& \leq \int_{t_{j-1}}^{t_j} \int_{t_{j-1}}^s |f(\tau, x(\tau))|\;\mathrm{d}\tau\;\mathrm{d}s \\
& \quad + \int_{t_{j-1}}^{t_j} \int_{t_{j-1}}^s \left(|f(\tau, x(\tau)) - f(\tau, 0)| + |f(\tau, 0)|\right)\;\mathrm{d}\tau\;\mathrm{d}s \\
& \quad + \int_{t_{j-1}}^{t_j} \int_{t_{j-1}}^s \left(L_2|x(\tau)| + |f(\tau, 0)|\right) \;\mathrm{d}\tau\;\mathrm{d}s \\
& \leq (L_1 R_0 + C_0) \Delta t^2,
\end{align*}
$$
onde
$$
C_0 = \max_{0 \leq t \leq T} |f(\tau, 0)|.
$$
Assim,
$$
|x(t_j) - x_j| \leq (1 + L_2\Delta t)|x(t_{j-1}) - x_{j-1}| + M \Delta t^2,
$$
onde
$$
M = \frac{L_1}{2} + L_1 R_0 + C_0.
$$

Iterando essa estimativa, chegamos a
$$
\begin{align*}
|x(t_j) - x_j| & \leq (1 + L_2\Delta t)^2|x(t_{j-2}) - x_{j-2}| + M \Delta t^2(1 + (1 + L\Delta t)) \\
& \leq \ldots \\
& \leq (1 + L_2\Delta t)^j|x(t_0) - x_0| + M \Delta t^2(1 + (1 + L_2\Delta t) + \ldots + (1 + L_2\Delta t)^{j-1}).
\end{align*}
$$
Usando que $1 + a \leq e^a,$ para todo $a \geq 0,$ temos
$$
(1 + L_2\Delta t)^j \leq e^{L_2j\Delta t} = e^{L_2 t_j}.
$$
Além disso,
$$
1 + (1 + L_2\Delta t) + \ldots + (1 + L_2\Delta t)^{j-1} = \frac{(1 + L_2\Delta t)^j - 1}{(1 + L_2\Delta t) - 1} = \frac{1}{L_2\Delta t}(1 + L_2\Delta t)^j \leq \frac{1}{L_2\Delta t}e^{L_2 t_j}.
$$
Portanto,
$$
|x(t_j) - x_j| \leq e^{L_2T}|x(t_0) - x_0| + \frac{M}{L_2}e^{L_2T}\Delta t.
$$

Considerando que $x_0 = x(t_0),$ obtemos
$$
|x(t_j) - x_j| \leq \frac{M}{L_2}e^{L_2T}\Delta t.
$$
Lembrando que $L_2=L_2(R),$ para $\Delta t$ suficientemente pequeno tal que
$$
\frac{M}{L_2(R)}e^{L_2(R)T}\Delta t \leq R - R_0,
$$
podemos garantir que
$$
|x_j| \leq R,
$$
obtendo, por indução, que
$$
\max_{j=0, \ldots, n}|x_j^n| \leq R, \qquad \max_{j=0, \ldots, n} |x(t_j) - x_j| \leq \frac{M}{L_2}e^{L_2T}\Delta t,
$$
mostrando que o método de Euler é de primeira ordem.

## Convergência no caso aleatório

## Convergência no caso estocástico multiplicativo

Considere, agora, a equação estocástica
$$
\mathrm{d}X_t = f(t, X_t)\mathrm{d}t + g(t, X_t)\mathrm{d}W_t, \qquad t \geq 0,
$$
com uma condição inicial
$$
\left.X_t\right|_{t = 0} = X_0.
$$

Nesse caso, temos
$$
X_t = X_0 + \int_0^t f(s, X_s)\;\mathrm{d}s + \int_0^t g(s, X_s)\;\mathrm{d}W_s.
$$
Já a aproximação pelo método de Euler-Maruyama é dada por
$$
X_j^n = X_{j-1}^n + f(t_{j-1}, X_{j-1}^n) \Delta t + g(t_{j-1}, X_{j-1}^n) \Delta W_j,
$$
onde $X_0^n = X_0$ e $\Delta W_j.$

Assumimos $f$ e $g$ globalmente Lipschitz contínuas em $x$ e globalmente Hölder contínuas em $t.$ Mais precisamente, assumimos que
$$
|f(t, x) - f(t, y)| \leq L_f|x - y|
$$
e
$$
|f(t, x) - f(s, x)| \leq H_f(1 + |x|)|t - s|^{1/2}, \quad |g(t) - g(s)| \leq H_g(1 + |x|)|t - s|^{1/2},
$$
para $x, y\in\mathbb{R}$ e $0\leq t, s \leq T,$ onde $H_f,$ $L_f,$ $H_g,$ $L_g > 0$ são constantes apropriadas.

Para uma estimativa adequada do termo estocástico, precisamos da isometria de Itô, e para isso precisamos trabalhar com a média quadrática.  Mais precisamente, vamos estimar
$$
\max_{i = 0, \ldots, n} \mathbb{E}\left[ |X_{t_i} - X_i^n|^2\right].
$$

Em relação à média quadrática, lembremos das estimativas
$$
\mathbb{E}\left[X_t^2\right] \leq M_T,
$$
e
$$
\mathbb{E}\left[ |X_{t+\tau} - X_t|^2\right] \leq C_T^2\tau,
$$
para $0\leq t \leq t + \tau \leq T,$ para constantes apropriadas $C_T, M_T > 0.$

Agora, por conta também da necessidade de trabalharmos com a média quadrática, devemos considerar uma expressão global para o erro, escrevendo
$$
X_{t_j} = X_0 + \int_0^{t_j} f(s, X_s)\;\mathrm{d}s + \int_0^{t_j} g(s, X_s)\;\mathrm{d}W_s
$$
e
$$
X_j^n = X_0 + \sum_{i=1}^j f(t_{i-1}, X_{i-1}^n)\Delta t_{i-1} + \sum_{i=1}^j g(t_{i-1}, X_{i-1}^n)\Delta W_{i-1}.
$$

Não funciona estimarmos de maneira recursiva, pois, por conta da desigualdade $(a_1 + \cdots + a_k)^2 \leq k(a_1^2 + \cdots + a_k^2),$ teríamos algo do tipo $d_j \leq C_1d_{j-1} + C_0,$ com $C>1,$ de forma que as iterações nos dariam um termo acumulado $C^j,$ que explode à medida que a malha é refinada, pois não está acompanhado do passo de tempo $\Delta t.$

Assim, escrevendo o erro de $t=0$ a $t=t_j,$ temos
$$
X_{t_j} - X_j^n = \int_0^{t_j} f(s, X_s)\;\mathrm{d}s + \int_0^{t_j} g(s, X_s)\;\mathrm{d}W_s - \sum_{i=1}^j f(t_{i-1}, X_{i-1}^n) \Delta t_{i-1} - \sum_{i=1}^j g(t_{i-1}, X_{i-1}^n) \Delta W_{i-1}.
$$
Podemos escrever isso na forma
$$
\begin{align*}
X_{t_j} - X_j^n & = \int_0^{t_j} (f(s, X_s) - f(t^n(s), X_{t^n(s)}))\;\mathrm{d}s + \int_0^{t_j} (g(s, X_s) - g(t_{i^n(s)}, X_{t^n(s)}))\;\mathrm{d}W_s \\
& \quad + \sum_{i=1}^j (f(t_{i-1}, X_{t_{i-1}}) - f(t_{i-1}, X_{i-1}^n)) \Delta t_{i-1} + \sum_{i=1}^j (g(t_{i-1}, X_{t_{i-1}}) - g(t_{i-1}, X_{i-1}^n)) \Delta W_{i-1},
\end{align*}
$$
onde $t^n$ e $i^n$ são as funções de malha
$$
i^n(t) = \max_{j=0, \ldots, n}\{j; \;t_j \leq t\},
$$
e
$$
t^n(t) = t_{i^n(t)} = \max\{t_i \leq t; \; i = 0, \ldots, n\},
$$
que nos dão o índice $i^n(t)$ do ponto da malha que está mais próximo e à esquerda de um instante $t$ e o ponto correspondente $t^n(t) = t_{i^n(t)}$ da malha.

Elevando ao quadrado e usando que $(a_1 + \ldots + a_4)^2 \leq 4(a_1^2 + \ldots + a_4^2),$
$$
\begin{align*}
\left(X_{t_j} - X_j^n\right)^2 & = 4\left(\int_0^{t_j} (f(s, X_s) - f(t^n(s), X_{t^n(s)}))\;\mathrm{d}s\right)^2 + 4\left(\int_0^{t_j} (g(s, X_s) - g(t^n(s), X_{t^n(s)}))\;\mathrm{d}W_s\right)^2 \\
& \quad + 4\left(\sum_{i=1}^j (f(t_{i-1}, X_{t_{i-1}}) - f(t_{i-1}, X_{i-1}^n)) \Delta t_{i-1}\right) + 4\left(\sum_{i=1}^j (g(t_{i-1}, X_{t_{i-1}}) - g(t_{i-1}, X_{i-1}^n)) \Delta W_{i-1}\right)^2.
\end{align*}
$$
Usando a desigualdade de Cauchy-Schwartz na primeira integral e no primeiro somatório, obtemos
$$
\begin{align*}
\left(X_{t_j} - X_j^n\right)^2 & \leq 4t_j\int_0^{t_j} (f(s, X_s) - f(t^n(s), X_{t^n(s)}))^2\;\mathrm{d}s + 4\left(\int_0^{t_j} (g(s, X_s) - g(t^n(s), X_{t^n(s)}))\;\mathrm{d}W_s\right)^2 \\
& \quad + 4t_j\sum_{i=1}^j (f(t_{i-1}, X_{t_{i-1}}) - f(t_{i-1}, X_{i-1}^n))^2 \Delta t_{i-1} + 4\left(\sum_{i=1}^j (g(t_{i-1}, X_{t_{i-1}}) - g(t_{i-1}, X_{i-1}^n)) \Delta W_{i-1}\right)^2.
\end{align*}
$$

Tomando o valor esperado e usando a isometria de Itô na integral e no somatório (que é a isometria de Itô numa função escada e que também pode ser deduzido diretamente pelas independências dos saltos em intervalos distintos e pale condição de não antecipação),
$$
\begin{align*}
\mathbb{E}\left[\left(X_{t_j} - X_j^n\right)^2\right] & \leq 4t_j\int_0^{t_j} \mathbb{E}\left[(f(s, X_s) - f(t^n(s), X_{t^n(s)}))^2\right]\;\mathrm{d}s + 4\int_0^{t_j} \mathbb{E}\left[(g(s, X_s) - g(t^n(s), X_{t^n(s)}))^2\right]\;\mathrm{d}s \\
& \quad + 4t_j\sum_{i=1}^j \mathbb{E}\left[(f(t^n(s), X_{t_{i-1}}) - f(t_{i-1}, X_{i-1}^n))^2\right] \Delta t_{i-1} + 4\sum_{i=1}^j \mathbb{E}\left[(g(t_{i-1}, X_{t_{i-1}}) - g(t_{i-1}, X_{i-1}^n))^2\right] \Delta t_{i-1}.
\end{align*}
$$

Os dois primeiros termos integrais podem ser estimados por
$$
\begin{align*}
\int_0^{t_j} \mathbb{E}\left[(f(s, X_s) - f(t^n(s), X_{t^n(s)}))^2\right]\;\mathrm{d}s & \leq \sum_{i=1}^j\int_{t_{i-1}}^{t_i} \left(2H_f^2|s - t_{i-1}|(1 + \mathbb{E}\left[X_s^2\right]) + 2L_f^2\mathbb{E}\left[|X_s - X_{t_{i-1}}|^2\right]\right)\;\mathrm{d}s \\
& \leq \left(2H_f^2(1 + M_T) + 2L_f^2C_T\right)\sum_{i=1}^j\int_{t_{i-1}}^{t_i} (s - t_{i-1}) \;\mathrm{d}s \\
& \leq \left(H_f^2(1 + M_T) + L_f^2C_T\right)\sum_{i=1}^j(t_i - t_{i-1}) \\
& \leq t_j\left(H_f^2(1 + M_T) + L_f^2C_T\right)\max_i (t_i - t_{i-1}) \\
& \leq T\left(H_f^2(1 + M_T) + L_f^2C_T\right)\Delta t.
\end{align*}
$$
e, analogamente,
$$
\int_0^{t_j} \mathbb{E}\left[(g(s, X_s) - g(t^n(s), X_{t^n(s)}))^2\right]\;\mathrm{d}s \leq T\left(H_g^2(1 + M_T) + L_g^2C_T\right)\Delta t.
$$

Já os somatórios nos dão
$$
\sum_{i=1}^j \mathbb{E}\left[(f(t_{i-1}, X_{t_{i-1}}) - f(t_{i-1}, X_{i-1}^n))^2\right] \Delta t_{i-1} \leq L_{f, 2}^2\sum_{i=1}^j \mathbb{E}\left[(X_{t_{i-1}} - X_{i-1}^n)^2\right] \Delta t_{i-1}
$$
e
$$
\sum_{i=1}^j \mathbb{E}\left[(g(t_{i-1}, X_{t_{i-1}}) - g(t_{i-1}, X_{i-1}^n))^2\right] \Delta t_{i-1} \leq L_{g, 2}^2\sum_{i=1}^j \mathbb{E}\left[(X_{t_{i-1}} - X_{i-1}^n)^2\right] \Delta t_{i-1}.
$$

Juntando as estimativas,
$$
\begin{align*}
\mathbb{E}\left[\left(X_{t_j} - X_j^n\right)^2\right] & \leq 4t_j\left(L_{f,1}^2 + L_{f, 2}^2C_T\right)\Delta t + 4\left(L_{g,1}^2 + L_{g, 2}^2C_T\right)\Delta t \\
& \quad + 4t_jL_{f, 2}^2\sum_{i=1}^j \mathbb{E}\left[(X_{t_{i-1}} - X_{i-1}^n)^2\right] \Delta t_{i-1} + 4L_{g, 2}^2\sum_{i=1}^j \mathbb{E}\left[(X_{t_{i-1}} - X_{i-1}^n)^2\right] \Delta t_{i-1}.
\end{align*}
$$
Ou seja,
$$
\mathbb{E}\left[\left(X_{t_j} - X_j^n\right)^2\right] \leq C^2 \Delta t + 2L \sum_{i=1}^j \mathbb{E}\left[(X_{t_{i-1}} - X_{i-1}^n)^2\right] \Delta t_{i-1},
$$
para $C, L > 0$ apropriadas. Pela desigualdade de Gronwall discreta, isso nos dá
$$
\mathbb{E}\left[\left(X_{t_j} - X_j^n\right)^2\right] \leq C^2e^{2Lt_j}\Delta t.
$$
Considerando a norma forte, obtemos
$$
\mathbb{E}\left[\left|X_{t_j} - X_j^n\right|\right] \leq \mathbb{E}\left[\left(X_{t_j} - X_j^n\right)^2\right]^{1/2} \leq Ce^{Lt_j}\Delta t^{1/2}.
$$
mostrando que o método de Euler-Maruyama é de ordem forte $1/2.$

## Convergência no caso estocástico com ruído aditivo

Quando $g=g(t)$ não depende de $x$ e quando $f=f(t, x)$ e $g=g(t)$ são mais suaves, podemos mostrar que a convergência forte é, na verdade, de order 1. Mais precisamente, pedimos que $f$ e $g$ sejam continuamente diferenciáveis em $t$ e que $f$ seja duas vezes continuamente diferenciáveis em $x,$ com limitações uniformes,
$$
|(\partial_t f)(t, x)| \leq H_f, \quad |(\partial_x f)(t, x)| \leq L_f, \quad |(\partial_{xx} f)(t, x)| \leq L_{ff}.
$$
Isso tudo em $0\leq t \leq T,$ $x\in \mathbb{R}.$ Como $g=g(t)$ só depende de $t$ e o intevalo $[0, T]$ é limitado, temos, pela suavidade de $g,$ que
$$
|g(t)| \leq M_g, \quad |(\partial_t g)(t)| \leq H_g.
$$
em $0\leq t \leq T.$

Escrevemos a diferença entre a solução e a aproximação na forma
$$
\begin{align*}
X_{t_j} - X_j^n & = \int_0^{t_j} (f(s, X_s) - f(t^n(s), X_{t^n(s)}))\;\mathrm{d}s + \int_0^{t_j} (g(s, X_s) - g(t_{i^n(s)}, X_{t^n(s)}))\;\mathrm{d}W_s \\
& \quad + \sum_{i=1}^j (f(t_{i-1}, X_{t_{i-1}}) - f(t_{i-1}, X_{i-1}^n)) \Delta t_{i-1} + \sum_{i=1}^j (g(t_{i-1}, X_{t_{i-1}}) - g(t_{i-1}, X_{i-1}^n)) \Delta W_{i-1},
\end{align*}
$$
No caso em que $g=g(t),$ o último termo desaparece (mas que não é um termo problemático) e o segundo termo simplifica (esse sim é problemático),
$$
\begin{align*}
X_{t_j} - X_j^n & = \int_0^{t_j} (f(s, X_s) - f(t^n(s), X_{t^n(s)}))\;\mathrm{d}s + \int_0^{t_j} (g(s) - g(t_{i^n(s)}))\;\mathrm{d}W_s \\
& \quad + \sum_{i=1}^j (f(t_{i-1}, X_{t_{i-1}}) - f(t_{i-1}, X_{i-1}^n)) \Delta t_{i-1}.
\end{align*}
$$

O último termo é como antes e nos dá
$$
\sum_{i=1}^j \mathbb{E}\left[(f(t_{i-1}, X_{t_{i-1}}) - f(t_{i-1}, X_{i-1}^n))^2\right] \Delta t_{i-1} \leq L_{f, 2}^2\sum_{i=1}^j \mathbb{E}\left[(X_{t_{i-1}} - X_{i-1}^n)^2\right] \Delta t_{i-1}.
$$

O segundo termo, agora sem a dependência em $x$ e com continuidade Lipschitz em $t,$ nos dá
$$
\begin{align*}
\mathbb{E}\left[\left(\int_0^{t_j} (g(s) - g(t_{i^n(s)}))\;\mathrm{d}W_s\right)^2\right] & = \int_0^{t_j} \mathbb{E}\left[\left(g(s) - g(t_{i^n(s)})\right)^2\right]\;\mathrm{d}s \\
& \leq H_g^2 \int_0^{t_j} \left(s - t_{i^n(s)}\right)^2\;\mathrm{d}s \\
& \leq H_g^2 t_j \Delta t^2.
\end{align*}
$$

O primeiro termo é o mais delicado e requer o uso da fórmula de Itô. Com ela, temos
$$
\begin{align*}
f(s, X_s) - f(t^n(s), X_{t^n(s)}) & = \int_{t^n(s)}^s \left((\partial_t f)(\xi, X_{\xi})f(\xi, X_{\xi}) + \frac{1}{2}(\partial_{xx} f)(\xi, X_{\xi})g(\xi)^2 \right)\;\mathrm{d}\xi \\
& \quad + \int_{t^n(s)}^s (\partial_x f)(\xi, X_{\xi})g(\xi)\;\mathrm{d}W_\xi.
\end{align*}
$$
O ponto chave é trocar a ordem de integração, usando uma versão estocástica do Teorema de Fubini na segunda integral. Assim,
$$
\begin{align*}
\int_0^{t_j} (f(s, X_s) - f(t^n(s), X_{t^n(s)}))\;\mathrm{d}s & = \int_0^{t_j} \int_{t^n(s)}^s \left((\partial_t f)(\xi, X_{\xi})f(\xi, X_{\xi}) + \frac{1}{2}(\partial_{xx} f)(\xi, X_{\xi})g(\xi)^2 \right)\;\mathrm{d}\xi\;\mathrm{d}s \\
& \quad + \int_0^{t_j} \int_{t^n(s)}^s (\partial_x f)(\xi, X_{\xi})g(\xi)\;\mathrm{d}W_\xi\;\mathrm{d}s \\
& = \int_0^{t_j} \int_{\xi}^{\tilde t^{n}(\xi)} \left((\partial_t f)(\xi, X_{\xi})f(\xi, X_{\xi}) + \frac{1}{2}(\partial_{xx} f)(\xi, X_{\xi})g(\xi)^2 \right)\;\mathrm{d}s\;\mathrm{d}\xi \\
& \quad + \int_0^{t_j} \int_{\xi}^{\tilde t^{n}(\xi)} (\partial_x f)(\xi, X_{\xi})g(\xi)\;\mathrm{d}s\;\mathrm{d}W_\xi,
\end{align*}
$$
onde
$$
\tilde t^{n}(t) = \min\{t_i \geq t; \; i = 0, \ldots, n\}
$$
é o ponto da malha que está mais próximo e à direita do instante $t.$ Observe que o integrando não depende de $s,$ de modo que o fato da integral em $s$ ser no intervalo $[\xi, \tilde t^n(\xi)],$ ou seja, posterior a $\xi,$ viola nenhuma condição de não antecipação do integrando.

Usando Cauchy-Schwartz e a isometria de Itô, obtemos a seguinte estimativa para a média quadrática desse termo.
$$
\begin{align*}
\mathbb{E}&\left[\left(\int_0^{t_j} (f(s, X_s) - f(t^n(s), X_{t^n(s)}))\;\mathrm{d}s\right)^2\right] \\
& \leq t_j\int_0^{t_j} (t^{n}(\xi) - \xi) \int_{\xi}^{\tilde t^{n}(\xi)} \mathbb{E}\left[\left((\partial_t f)(\xi, X_{\xi})f(\xi, X_{\xi}) + \frac{1}{2}(\partial_{xx} f)(\xi, X_{\xi})g(\xi)^2 \right)^2\right]\;\mathrm{d}s\;\mathrm{d}\xi \\
& \quad + \int_0^{t_j} (\tilde t^{n}(\xi) - \xi) \int_{\xi}^{\tilde t^{n}(\xi)} \mathbb{E}\left[\left((\partial_x f)(\xi, X_{\xi})g(\xi)\right)^2\right]\;\mathrm{d}s\;\mathrm{d}\xi.
\end{align*}
$$
Usando as estimativas para $f,$ $g$ e suas derivadas, obtemos
$$
\begin{align*}
\mathbb{E}\left[\left(\int_0^{t_j} (f(s, X_s) - f(t^n(s), X_{t^n(s)}))\;\mathrm{d}s\right)^2\right] & \leq t_j\int_0^{t_j} (t^{n}(\xi) - \xi) \int_{\xi}^{\tilde t^{n}(\xi)} C_1\;\mathrm{d}s\;\mathrm{d}\xi \\
& \quad + \int_0^{t_j} (\tilde t^{n}(\xi) - \xi) \int_{\xi}^{\tilde t^{n}(\xi)} C_2\;\mathrm{d}s\;\mathrm{d}\xi \\
& = (t_jC_1 + C_2)\int_0^{t_j} (t^{n}(\xi) - \xi)^2 \;\mathrm{d}\xi \\
& \leq (TC_1 + C_2)\Delta t^2.
\end{align*}
$$
para constantes apropriadas $C_1, C_2 > 0.$ Juntando as estimativas, obtemos
$$
\mathbb{E}\left[\left(X_{t_j} - X_j^n\right)^2\right] \leq C^2 \Delta t^2 + 2L \sum_{i=1}^j \mathbb{E}\left[(X_{t_{i-1}} - X_{i-1}^n)^2\right] \Delta t_{i-1},
$$
para constante $C, L > 0$ apropriadas. Pela desigualdade de Gronwall discreta, isso nos dá
$$
\mathbb{E}\left[\left(X_{t_j} - X_j^n\right)^2\right] \leq C^2e^{2Lt_j}\Delta t^2.
$$
Considerando a norma forte, obtemos
$$
\mathbb{E}\left[\left|X_{t_j} - X_j^n\right|\right] \leq \mathbb{E}\left[\left(X_{t_j} - X_j^n\right)^2\right]^{1/2} \leq Ce^{Lt_j}\Delta t.
$$
mostrando que o método de Euler-Maruyama é de ordem forte $1.$
