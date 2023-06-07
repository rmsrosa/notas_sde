@def title = "Convergência do método de Euler-Maruyama"

# {{ get_title }}

No caso determinístico, de uma equação diferencial
$$
\frac{\mathrm{d}x}{\mathrm{d}t} = f(t, x),
$$
com condição inicial $x(0) = x_0$, o método de Euler
$$
x_{j}^n = x_{j-1}^n + \Delta t f(t_{j-1} x_{j-1}^n), \qquad x_j^n|_{j = 0} = x_0,
$$
em uma malha temporal uniforme $t_j = jT/n$, $j = 0, \ldots, n$, com $\Delta t = T/n$, converge uniformemente, no intervalo $[0, T]$, para a solução do problema de valor inicial. Além disso, essa convergência é de ordem um. Mais precisamente, existe $C > 0$ e $\delta > 0$ tais que
$$
\max_{j}|x(t_j) - x_j| \leq C \Delta t, \qquad 0 < \Delta t \leq \delta.
$$
Isso sob a hipótese de $f$ ser localmente Lipschitz contínua.

Por outro lado, no caso estocástico, com um ruído multiplicativo $g = g(t, X_t),$
$$
\mathrm{d}X_t = f(t, X_t)\mathrm{d}t + g(t, X_t)\mathrm{d}W_t, \qquad t \geq 0,
$$
com uma condição inicial
$$
\left.X_t\right|_{t = 0} = X_0,
$$
a convergência *forte* é apenas de ordem $1/2$ e isso sob as hipóteses de $f$ e $g$ serem *globalmente* Lipschitz contínua. Mas é importante ressaltar que isso acontece no caso multiplicativo. Se o ruído for aditivo, $g = g(t, X_t) = g(t)$, então ainda temos a convergência forte de ordem $1$.

A diferença, no caso multiplicativo, vem, essencialmente, do fato de que, na equação estocástica, além dos termos de erro da ordem de $\Delta t$, há termos da ordem de $\Delta W$. Em um sentido apropriado, vale $(\Delta W)^2 \sim \Delta t$, o que nos dá um erro da ordem de $(\Delta t)^{1/2}$.

Outro ponto importante é que, no caso discreto, a constante $C$ que aparece na ordem de convergência depende da condição inicial e explora o fato de que, com a condição inicial fixa, podemos limitar a solução exata e a aproximação. Por outro lado, no caso estocástico, considera-se, implicitamente, diversas condições iniciais $X_0(\omega)$ e não temos esse controle, por isso a necessidade de se assumir que os termos $f$ e $g$ sejam globalmente Lipschitz contínuos.

Por último, um detalhe um pouco mais técnico, é que, enquanto no caso discreto estimamos diretamente a diferença $|x(t_j) - x_j^n|$, no caso estocástico precisamos nos ancorar na isometria de Itô, de modo que o mais natural é olharmos para $\mathbb{E}\left[|X_{t_j} - X_j^n|^2 \right]$.

Vejamos os detalhes.

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
Como a solução é contínua, ela é limitada no intervalo $[0, T]$, i.e.
$$
R_0 = \max_{0\leq t \leq T}|x(t)| < \infty.
$$
Seja $R > R_0$ e considere as constantes de Lipschitz $L_1 = L_1(R)$ e $L_2 = L_2(R)$ tais que
$$
  |f(t, x) - f(s, y)| \leq L_1(R)|t - s| + L_2(R)|x - y|, \quad \forall 0 \leq t, s \leq T, \;\forall x, y, \; |x|, |y| \leq R.
$$

Assuma, por indução, que $|x_{j-1}| \leq R$. Com isso,
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
Usando que $1 + a \leq e^a$, para todo $a \geq 0$, temos
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

Considerando que $x_0 = x(t_0)$, obtemos
$$
|x(t_j) - x_j| \leq \frac{M}{L_2}e^{L_2T}\Delta t.
$$
Lembrando que $L_2=L_2(R)$, para $\Delta t$ suficientemente pequeno tal que
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
onde $X_0^n = X_0$ e $\Delta W_j$.

Assumimos $f$ e $g$ globalmente Lipschitz contínuas, ou seja,
$$
|f(t, x) - f(s, y)| \leq L_{f, 1}|t - s| + L_{f, 2}|x - y|,
$$
e
$$
|g(t, x) - g(s, y)| \leq L_{g, 1}|t - s| + L_{g, 2}|x - y|,
$$
para todo $0 \leq t, s \leq T$ e todo $x, y$.

Para uma estimativa adequada do termo estocástico, precisamos da isometria de Itô, e para isso precisamos trabalhar com a média quadrática.  Mais precisamente, vamos estimar
$$
d_j = \max_{i = 0, \ldots, j} \mathbb{E}\left[ |X_{t_i} - X_i^n|^2\right].
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

Não funciona estimarmos de maneira recursiva, pois, por conta da desigualdade $(a_1 + \cdots + a_k)^2 \leq k(a_1^2 + \cdots + a_k^2),$ teríamos algo do tipo $d_j \leq C_1d_{j-1} + C_0$, com $C>1$, de forma que as iterações nos dariam um termo acumulado $C^j$, que explode à medida que a malha é refinada, pois não está acompanhado do passo de tempo $\Delta t$.

Assim, escrevendo o erro de $t=0$ a $t=t_j,$ temos
$$
X_{t_j} - X_j^n = \int_0^{t_j} f(s, X_s)\;\mathrm{d}s + \int_0^{t_j} g(s, X_s)\;\mathrm{d}W_s - \sum_{i=1}^j f(t_{i-1}, X_{i-1}^n) \Delta t_{i-1} - \sum_{i=1}^j g(t_{i-1}, X_{i-1}^n) \Delta W_{i-1}.
$$
Podemos escrever isso na forma
$$
\begin{align*}
X_{t_j} - X_j^n & = \int_0^{t_j} (f(s, X_s) - f(t_{i-1}, X_{t_{i-1}}))\;\mathrm{d}s + \int_0^{t_j} (g(s, X_s) - g(t_{i-1}, X_{t_{i-1}}))\;\mathrm{d}W_s \\
& \quad + \sum_{i=1}^j (f(t_{i-1}, X_{t_{i-1}}) - f(t_{i-1}, X_{i-1}^n)) \Delta t_{i-1} + \sum_{i=1}^j (g(t_{i-1}, X_{t_{i-1}}) - g(t_{i-1}, X_{i-1}^n)) \Delta W_{i-1}.
\end{align*}
$$

Elevando ao quadrado e usando que $(a_1 + \ldots + a_4)^2 \leq 4(a_1^2 + \ldots + a_4^2)$,
$$
\begin{align*}
\left(X_{t_j} - X_j^n\right)^2 & = 4\left(\int_0^{t_j} (f(s, X_s) - f(t_{i-1}, X_{t_{i-1}}))\;\mathrm{d}s\right)^2 + 4\left(\int_0^{t_j} (g(s, X_s) - g(t_{i-1}, X_{t_{i-1}}))\;\mathrm{d}W_s\right)^2 \\
& \quad + 4\left(\sum_{i=1}^j (f(t_{i-1}, X_{t_{i-1}}) - f(t_{i-1}, X_{i-1}^n)) \Delta t_{i-1}\right) + 4\left(\sum_{i=1}^j (g(t_{i-1}, X_{t_{i-1}}) - g(t_{i-1}, X_{i-1}^n)) \Delta W_{i-1}\right)^2.
\end{align*}
$$
Usando a desigualdade de Cauchy-Schwartz na primeira integral e no primeiro somatório, obtemos
$$
\begin{align*}
\left(X_{t_j} - X_j^n\right)^2 & \leq 4t_j\int_0^{t_j} (f(s, X_s) - f(t_{i-1}, X_{t_{i-1}}))^2\;\mathrm{d}s + 4\left(\int_0^{t_j} (g(s, X_s) - g(t_{i-1}, X_{t_{i-1}}))\;\mathrm{d}W_s\right)^2 \\
& \quad + 4t_j\sum_{i=1}^j (f(t_{i-1}, X_{t_{i-1}}) - f(t_{i-1}, X_{i-1}^n))^2 \Delta t_{i-1} + 4\left(\sum_{i=1}^j (g(t_{i-1}, X_{t_{i-1}}) - g(t_{i-1}, X_{i-1}^n)) \Delta W_{i-1}\right)^2.
\end{align*}
$$

Tomando o valor esperado e usando a isometria de Itô na integral e no somatório (que é a isometria de Itô numa função escada e que também pode ser deduzido diretamente pelas independências dos saltos em intervalos distintos e pale condição de não antecipação),
$$
\begin{align*}
\mathbb{E}\left[\left(X_{t_j} - X_j^n\right)^2\right] & \leq 4t_j\int_0^{t_j} \mathbb{E}\left[(f(s, X_s) - f(t_{i-1}, X_{t_{i-1}}))^2\right]\;\mathrm{d}s + 4\int_0^{t_j} \mathbb{E}\left[(g(s, X_s) - g(t_{i-1}, X_{t_{i-1}}))^2\right]\;\mathrm{d}s \\
& \quad + 4t_j\sum_{i=1}^j \mathbb{E}\left[(f(t_{i-1}, X_{t_{i-1}}) - f(t_{i-1}, X_{i-1}^n))^2\right] \Delta t_{i-1} + 4\sum_{i=1}^j \mathbb{E}\left[(g(t_{i-1}, X_{t_{i-1}}) - g(t_{i-1}, X_{i-1}^n))^2\right] \Delta t_{i-1}.
\end{align*}
$$

Os dois primeiros termos integrais podem ser estimados por
$$
\begin{align*}
\int_0^{t_j} \mathbb{E}\left[(f(s, X_s) - f(t_{i-1}, X_{t_{i-1}}))^2\right]\;\mathrm{d}s & \leq \sum_{i=1}^j\int_{t_{i-1}}^{t_i} \left(2L_{f,1}^2|s - t_{i-1}|^2 + 2L_{f, 2}^2\mathbb{E}\left[|X_s - X_{t_{i-1}}|^2\right]\right)\;\mathrm{d}s \\
& \leq \left(2L_{f,1}^2 + 2L_{f, 2}^2C_T\right)\sum_{i=1}^j\int_{t_{i-1}}^{t_i} |s - t_{i-1}|^2 \;\mathrm{d}s \\
& \leq \left(L_{f,1}^2 + L_{f, 2}^2C_T\right)\sum_{i=1}^j(t_i - t_{i-1})^2 \\
& \leq \left(L_{f,1}^2 + L_{f, 2}^2C_T\right)\max_i (t_i - t_{i-1}) \\
& \leq \left(L_{f,1}^2 + L_{f, 2}^2C_T\right)\Delta t.
\end{align*}
$$
e, analogamente,
$$
\int_0^{t_j} \mathbb{E}\left[(g(s, X_s) - g(t_{i-1}, X_{t_{i-1}}))^2\right]\;\mathrm{d}s \leq \left(L_{g,1}^2 + L_{g, 2}^2C_T\right)\Delta t.
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
\mathbb{E}\left[\left(X_{t_j} - X_j^n\right)^2\right] \leq C \Delta t + L \sum_{i=1}^j \mathbb{E}\left[(X_{t_{i-1}} - X_{i-1}^n)^2\right] \Delta t_{i-1},
$$
para $C$ e $L$ apropriados. Pela desigualdade de Gronwall discreta, isso nos dá
$$
\mathbb{E}\left[\left(X_{t_j} - X_j^n\right)^2\right] \leq Ce^{Lt_j}\Delta t,
$$
mostrando que o método de Euler-Maruyama é de ordem forte $1.$

## Estimativa via interpolação

Observe que a ordem $1/2$ aparece nas estimativas dos dois primeiros termos da expressão global do erro, que envolvem tanto $f$ como $g$ e que acabam dependendo de $\mathbb{E}[(X_{t+\Delta t} -X_t)^2],$ que é da ordem de $\Delta t$, nos dando $\Delta t^{1/2}$ para a norma forte. No entanto, é possível estimar o erro de maneira diferente e não apenas melhorar a estimativa mas também caracterizar melhor os termos que afetam, de fato, o erro.

A ideia é estimar a diferença entre a solução $X_t$ em um instante qualquer $t$ e uma interpolação da aproximação. Para essa interpolação, primeiro definimos as funções de malha
$$
j^n(t) = \max_{j=0, \ldots, n}\{j; \;t_j \leq t\},
$$
e
$$
\tau^n(t) = t_{j^n(t)} = \max\{t_i \leq t; \; i = 0, \ldots, n\},
$$
que nos dão o índice do ponto da malha que está mais próximo e à esquerda de um instante $t$ e o ponto correspondente da malha. Com base nisso, definimos a interpolação constante por partes
$$
\tilde X_t^n = \tilde X_{\tau^n(t)}^n = X_{j^n(s)}^n.
$$

Agora, a ideia é estimar o erro
$$
\tilde e_t = \mathbb{E}\left[ |X_t - \tilde X_t^n|^2\right].
$$

Para essa estimativa, vamos assumir que $f$ e $g$ são globalmente Liptschiz contínuas em $x$, uniformemente em $t$, e que são Hölder contínuas no tempo, de tal forma que
$$
|f(t, x) - f(t, y)| \leq L_f|x - y|, \quad |g(t, x) - g(t, y)| \leq L_g|x - y|,
$$
e
$$
|f(t, x) - f(s, x)| \leq H_f(1 + |x|)|t - s|^{1/2}, \quad |g(t, x) - g(s, x)| \leq H_g(1 + |x|)|t - s|^{1/2},
$$
para $x, y\in\mathbb{R}$ e $0\leq t, s \leq T.$ Naturalmente,
$$
|f(t, x)| \leq |f(t, x) - f(t, 0)| + |f(t, 0)| \leq L_f|x| + C_f,
$$
onde 
$$
C_f = \max_{0\leq t \leq T}|f(t, 0)|.
$$
Usaremos, também, a estimativa
$$
\mathbb{E}\left[X_t^2\right] \leq M_T e^{L_T t},
$$
para $0\leq t \leq T.$

Para um instante qualquer $0\leq t \leq T,$ podemos escrever
$$
\tilde X_t^n =  X_0 + \int_0^{\tau^n(t)} f(\tau^n(s), \tilde X_s^n)\;\mathrm{d}s + \int_0^{\tau^n(t)} g(\tau^n(s), \tilde X_s^n)\;\mathrm{d}W_s.
$$
A diferença entre a solução exata e a interpolação é
$$
X_t - \tilde X_t^n = \int_0^t f(s, X_s)\;\mathrm{d}s + \int_0^t g(s, X_s)\;\mathrm{d}W_s - \int_0^{\tau^n(t)} f(\tau^n(s), \tilde X_{s}^n)\;\mathrm{d}s - \int_0^{\tau^n(t)} g(\tau^n(s), \tilde X_{s}^n)\;\mathrm{d}W_s.
$$

Somando e subtraindo $f(\tau^n(s), X_s)$ e $g(\tau^n(s), X_s)$ e observando a diferença nos limites de integração, obtemos
$$
\begin{align*}
X_t - \tilde X_t^n & = \int_{\tau^n(t)}^t f(s, X_s)\;\mathrm{d}s + \int_{\tau^n(t)}^t g(s, X_s)\;\mathrm{d}W_s \\
& \quad + \int_0^{\tau^n(t)} (f(s, X_s) - f(\tau^n(s), X_s))\;\mathrm{d}s \\
& \quad + \int_0^{\tau^n(t)} (g(s, X_s) - g(\tau^n(t), X_s)) \;\mathrm{d}W_s \\
& \quad + \int_0^{\tau^n(t)} (f(\tau^n(s), X_s) - f(\tau^n(s), \tilde X_{s}^n))\;\mathrm{d}s \\
& \quad + \int_0^{\tau^n(t)} (g(\tau^n(s), X_s) - g(\tau^n(s), \tilde X_{s}^n))\;\mathrm{d}W_s.
\end{align*}
$$

Elevando ao quadrado e tomando a esperança, obtemos
$$
\begin{align*}
\mathbb{E}\left[\left(X_t - \tilde X_t^n\right)^2\right] & \leq 6\mathbb{E}\left[\left(\int_{\tau^n(t)}^t f(s, X_s)\;\mathrm{d}s\right)^2\right] + 6\mathbb{E}\left[\left(\int_{\tau^n(t)}^t g(s, X_s)\;\mathrm{d}W_s\right)^2\right] \\
& \quad + 6\mathbb{E}\left[\left(\int_0^{\tau^n(t)} (f(s, X_s) - f(\tau^n(s), X_s))\;\mathrm{d}s\right)^2\right] \\
& \quad + 6\mathbb{E}\left[\left(\int_0^{\tau^n(t)} (g(s, X_s) - g(\tau^n(t), X_s)) \;\mathrm{d}W_s\right)^2\right] \\
& \quad + 6\mathbb{E}\left[\left(\int_0^{\tau^n(t)} (f(\tau^n(s), X_s) - f(\tau^n(s), \tilde X_{s}^n))\;\mathrm{d}s\right)^2\right] \\
& \quad + 6\mathbb{E}\left[\left(\int_0^{\tau^n(t)} (g(\tau^n(s), X_s) - g(\tau^n(s), \tilde X_{s}^n))\;\mathrm{d}W_s\right)^2\right].
\end{align*}
$$

Os dois últimos termos são estimados de maneira análoga à anterior, usando a continuidade Lipschitz de $f$ e $g$ na variável $x$, junto com a desigualdade de Cauchy-Schwartz e a isometria de Itô, respectivamente, ou seja
$$
\begin{align*}
\mathbb{E}\left[\left(\int_0^{\tau^n(t)} (f(\tau^n(s), X_s) - f(\tau^n(s), \tilde X_{s}^n))\;\mathrm{d}s\right)^2\right] & \leq \tau^n(t) \int_0^{\tau^n(t)} \mathbb{E}\left[\left(f(\tau^n(s), X_s) - f(\tau^n(t), \tilde X_s^n)\right)^2\right]\;\mathrm{d}s \\
& \leq \tau^n(t) L_{f, 2}^2\int_0^{\tau^n(t)} \mathbb{E}\left[\left(X_s - \tilde X_{s}^n\right)^2\right]\;\mathrm{d}s \\
& \leq t L_{f, 2}^2\int_0^{t} \mathbb{E}\left[\left(X_s - \tilde X_{s}^n\right)^2\right]\;\mathrm{d}s.
\end{align*}
$$
e
$$
\begin{align*}
\mathbb{E}\left[\left(\int_0^{\tau^n(t)} (g(\tau^n(s), X_s) - g(\tau^n(s), \tilde X_{s}^n))\;\mathrm{d}W_s\right)^2\right] & \leq \int_0^{\tau^n(t)} \mathbb{E}\left[\left(g(\tau^n(s), X_s) - g(\tau^n(t), \tilde X_s^n)\right)^2\right]\;\mathrm{d}s \\
& \leq L_{g, 2}^2\int_0^{\tau^n(t)} \mathbb{E}\left[\left(X_s - \tilde X_{s}^n\right)^2\right]\;\mathrm{d}s \\
& \leq t L_{f, 2}^2\int_0^{t} \mathbb{E}\left[\left(X_s - \tilde X_{s}^n\right)^2\right]\;\mathrm{d}s.
\end{align*}
$$

O primeiro termos estimamos usando a desigualdade de Cauchy-Schwartz e as estimativas para $f$ e $\mathbb{E}[X_t^2],$
$$
\begin{align*}
\mathbb{E}\left[\left(\int_{\tau^n(t)}^t f(s, X_s)\;\mathrm{d}s\right)^2\right] & \leq (t - \tau^n(t))\int_{\tau^n(t)}^t \mathbb{E}\left[f(s, X_s)^2\right]\;\mathrm{d}s \\
& \leq (t - \tau^n(t))\int_{\tau^n(t)}^t \mathbb{E}\left[2C_f^2 + 2L_f^2X_s^2\right]\;\mathrm{d}s \\
& \leq (t - \tau^n(t))\int_{\tau^n(t)}^t \left(2C_f^2 + 2L_f^2M_T\right)\;\mathrm{d}s \\
& \leq (t - \tau^n(t))^2\left(2C_f^2 + 2L_f^2M_T\right) \\
& \leq \Delta t^2 \left(2C_f^2 + 2L_f^2M_T\right) \\
& \leq C_1\Delta t^2,
\end{align*}
$$
para uma constante apropriada $C_1>0.$

Usando a isometria de Itô no lugar da estimativa de Cauchy-Schwartz, estimamos o segundo termo,
$$
\begin{align*}
\mathbb{E}\left[\left(\int_{\tau^n(t)}^t g(s, X_s)\;\mathrm{d}W_s\right)^2\right] & \leq \int_{\tau^n(t)}^t \mathbb{E}\left[g(s, X_s)^2\right]\;\mathrm{d}s \\
& \leq \int_{\tau^n(t)}^t \mathbb{E}\left[2C_g^2 + 2L_g^2X_s^2\right]\;\mathrm{d}s \\
& \leq \int_{\tau^n(t)}^t \left(2C_g^2 + 2L_g^2M_T\right)\;\mathrm{d}s \\
& \leq (t - \tau^n(t))\left(2C_g^2 + 2L_g^2M_T\right) \\
& \leq \Delta t \left(2C_g^2 + 2L_g^2M_T\right) \\
& \leq C_2\Delta t,
\end{align*}
$$
para uma outra constante $C_2>0.$

Finalmente, para o terceiro e o quarto termos, utilizamos a dependência Hölder no tempo dos termos $f$ e $g$. No terceiro termo, obtemos
$$
\begin{align*}
\mathbb{E}\left[\left(\int_0^{\tau^n(t)} (f(s, X_s) - f(\tau^n(s), X_s))\;\mathrm{d}s\right)^2\right] & \leq \tau^n(t) \int_0^{\tau^n(t)} \mathbb{E}\left[\left(f(s, X_s) - f(\tau^n(s), X_s)\right)^2\right]\;\mathrm{d}s \\
& \leq \tau^n(t) \int_0^{\tau^n(t)} \mathbb{E}\left[2H_f^2(1 + |X_s|)^2|s - \tau^n(s)|\right]\;\mathrm{d}s \\
& \leq 4H_f^2\tau^n(t)\Delta t \int_0^{\tau^n(t)} \left(1 + \mathbb{E}\left[X_s^2\right]\right)\;\mathrm{d}s \\
& \leq 4H_f^2\tau^n(t)\Delta t \int_0^{\tau^n(t)} \left(1 + M_Te^{L_T s} \right)\;\mathrm{d}s \\
& \leq 4H_f^2\tau^n(t)\Delta t \left(\tau^n(t) + \frac{M_T}{L_T}e^{L_T \tau^n(t)} \right) \\
& \leq C_1\Delta t,
\end{align*}
$$
para uma constante apropriada $C_3>0.$ No quarto termo,
$$
\begin{align*}
\mathbb{E}\left[\left(\int_0^{\tau^n(t)} (g(s, X_s) - g(\tau^n(s), X_s))\;\mathrm{d}s\right)^2\right] & \leq \int_0^{\tau^n(t)} \mathbb{E}\left[\left(g(s, X_s) - g(\tau^n(s), X_s)\right)^2\right]\;\mathrm{d}s \\
& \leq \int_0^{\tau^n(t)} \mathbb{E}\left[2H_g^2(1 + |X_s|)^2|s - \tau^n(s)|\right]\;\mathrm{d}s \\
& \leq 4H_g^2\Delta t \int_0^{\tau^n(t)} \left(1 + \mathbb{E}\left[X_s^2\right]\right)\;\mathrm{d}s \\
& \leq 4H_g^2\Delta t \int_0^{\tau^n(t)} \left(1 + M_Te^{L_T s} \right)\;\mathrm{d}s \\
& \leq 4H_g^2\Delta t \left(\tau^n(t) + \frac{M_T}{L_T}e^{L_T \tau^n(t)} \right) \\
& \leq C_2\Delta t,
\end{align*}
$$
para uma outra constante apropriada $C_4>0.$

Jutando as estimativas,
$$
\mathbb{E}\left[\left(X_t - \tilde X_t^n\right)^2\right] \leq C\Delta t + L \int_0^t \mathbb{E}\left[\left(X_s - \tilde X_s^n\right)^2\right]\;\mathrm{d}s,
$$
para constantes apropriadas $C, L > 0.$ Pela desigualdade de Grownall, obtemos
$$
\mathbb{E}\left[\left(X_t - \tilde X_t^n\right)^2\right] \leq C\Delta t e^{Lt},
$$
o que nos dá a convergência forte de ordem 1.


## Convergência no caso estocástico com ruído aditivo

Quando $g=g(t)$ não depende de $x$ e quando a dependência de $f=f(t, x)$ e $g=g(t)$ também é Lipschitz, podemos mostrar que a convergência forte é, na verdade, de order 1. Mais precisamente, consideramos
$$
\mathrm{d}X_t = f(t, X_s)\;\mathrm{d}t + g(t)\;\mathrm{d}W_t
$$
e assumimos
$$
|f(t, x) - f(t, y)| \leq L_f|x - y|
$$
e
$$
|f(t, x) - f(s, x)| \leq H_f(1 + |x|)|t - s|, \quad |g(t) - g(s)| \leq H_g(1 + |x|)|t - s|,
$$
para $x, y\in\mathbb{R}$ e $0\leq t, s \leq T.$

Nesse caso, obtemos
$$
\begin{align*}
X_t - \tilde X_t^n & = \int_{\tau^n(t)}^t f(s, X_s)\;\mathrm{d}s + \int_{\tau^n(t)}^t g(s)\;\mathrm{d}W_s \\
& \quad + \int_0^{\tau^n(t)} (f(s, X_s) - f(\tau^n(s), X_s))\;\mathrm{d}s \\
& \quad + \int_0^{\tau^n(t)} (g(s) - g(\tau^n(t))) \;\mathrm{d}W_s \\
& \quad + \int_0^{\tau^n(t)} (f(\tau^n(s), X_s) - f(\tau^n(s), \tilde X_{s}^n))\;\mathrm{d}s.
\end{align*}
$$
Observe que o último termo do caso anterior, envolvendo $g(\tau^n(s), X_s) - g(\tau^n(s), \tilde X_{s}^n) = g(\tau^n(s)) - g(\tau^n(s)) = 0$ desaparece, no caso de $g$ só depender de $t$.

Vale ressaltar que a hipótese, no caso anterior, da dependência Hölder no tempo, não é uma restrição séria à ordem de convergência. Ela foi imposta porque não adiantaria pedir dependência Lipschitz por conta da influência do termo $x.$



## Convergência no caso estocástico com ruído constante

Observe, no entanto, que quando $g(X_t) = \sigma$ é constante, os termos de ruído se cancelam, quando subtraímos $X_j^n$ de $X_{t_j}$. Sobram, então, apenas os termos que nos dão ordem $1$ de convergência forte.

Mesmo no caso autônomo, assumindo $g(t, X_t) = g(t)$, também se obtém ordem $1$ de convergência forte. Nesse caso, o termo de ruído contribui com um erro da forma
$$
\int_{t_{j-1}}^{t_j} (g(s) - g(t_{j-1}))\;\mathrm{d}W_s = \int_{t_{j-1}}^{t_j} \int_{t_{j-1}}^{s} g'(\tau)\;\mathrm{d}\tau\;\mathrm{d}W_s.
$$
Nesse caso, usando a isometria de Itô,
$$
\mathbb{E}\left[ \left| \int_{t_{j-1}}^{t_j} (g(s) - g(t_{j-1}))\;\mathrm{d}W_s\right|^2\right] = \int_{t_{j-1}}^{t_j} \mathbb{E}\left[ \left| \int_{t_{j-1}}^{s} g'(\tau)\;\mathrm{d}\tau \right|^2\right] \mathrm{d}s \leq \int_{t_{j-1}}^{t_j} (s - t_{j-1})\int_{t_{j-1}}^{s} |g'(\tau)|^2\;\mathrm{d}\tau \mathrm{d}s \leq M_g \Delta t^3,
$$
onde $M_g = \max |g'|^2 /3$.

Ao somarmos em $j$, um $\Delta t$ é aproveitando, restando $\Delta t^2$. Ao usarmos a desigualdade de Lyapunov, isso nos dá um termos também da ordem $\Delta t$, garantindo a ordem $1$ de convergência forte.

## Não-convergência no caso estocástico sem condição Lipschitz global