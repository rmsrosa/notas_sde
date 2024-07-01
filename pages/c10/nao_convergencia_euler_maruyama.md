@def title = "Não convergência do método de Euler-Maruyama sem condição Lipschitz global"

# {{ get_title }}

Vejamos, agora, um exemplo de não convergência do método de Euler, mesmo no caso aditivo, quando o termo de *drift* é apenas localmente Lipschitz. Esse exemplo aparece na Seção 10.5 de Higham & Kloeden (2021) e é feita em detalhes e em maior generalidade em [Hutzenthaler, Jentzen & Kloeden (2011)](https://doi.org/10.1098/rspa.2010.0348).

## Interlúdio no caso determinístico

Considere, inicialmente, a equação diferencial ordinária
$$
\frac{\mathrm{d}x}{\mathrm{d}t} = - x^3,
$$
com condição inicial $x(0) = x_0 > 0.$ O método de Euler com passo constante tem a forma
$$
x_j = x_{j-1} - x_{j-1}^3 \Delta t  = x_{j-1}(1 - x_{j-1}^2 \Delta t).
$$
Seja $T > 0$ arbitrário e fixe um passo de tempo qualquer $\Delta t = T/N \leq 2,$ para algum $N\in\mathbb{N}.$ Suponha que a condição inicial seja tal que
$$
x_0 \geq \frac{2}{\Delta t} \geq 1.
$$
Nesse caso,
$$
1 - x_0^2 \Delta t \leq 1 - 2x_0 \leq x_0 - 2x_0 = -x_0.
$$
Assim, o primeiro passo de Euler nos dá
$$
x_1  =  x_0 - \Delta t x_0^3 =  x_0(1 - \Delta t x_0^2) \leq -x_0^2.
$$
Por indução, vamos supor que $|x_j| \geq x_{j-1}^2,$ com sinais alternados, $\mathrm{sgn}(x_j) = (-1)^j.$ Vamos separar em dois casos, dependendo da paridade de $j,$ ou seja, do sinal de $x_j.$

Quando $j$ é par, $x_j$ tem sinal positivo e
$$
x_j = |x_j| \geq x_0 \geq \frac{2}{\Delta t} \geq 1,
$$
de modo que
$$
1 - x_j^2 \Delta t \leq x_j - x_j^2 \Delta t = x_j (1 - x_j\Delta t) \leq x_j (1 - 2) = - x_j.
$$
Portanto,
$$
x_{j+1} = x_j (1 - x_j^2 \Delta t) \leq - x_j^2,
$$
ou seja $x_{j+1}$ é negativo e $|x_{j+1}| \geq x_j^2.$

Quando $j$ é impar, $x_j$ tem sinal negativo e
$$
x_j = - |x_j| \leq - x_0 \leq - \frac{2}{\Delta t} \leq -1,
$$
de modo que
$$
1 - x_j^2 \Delta t \leq - x_j - x_j^2 \Delta t = -x_j (1 + x_j\Delta t) \leq -x_j (1 - 2) = x_j.
$$
Portanto, como $x_j$ é negativo,
$$
x_{j+1} = x_j (1 - x_j^2 \Delta t) \geq x_j^2,
$$
ou seja $x_{j+1}$ é positivo e $|x_{j+1}| \geq x_j^2.$

Assim, em qualquer caso, temos $x_{j+1}$ de sinal contrário ao de $x_j$ e com
$$
|x_{j+1}| \geq x_j^2,
$$
completando a indução.

Iterando essa relação, obtemos que a aproximação de Euler alterna de sinal e diverge de maneira duplamente exponencial, com
$$
|x_j| \geq |x_{j-1}|^2 \geq (|x_{j-2}|^2)^2 \geq \cdots \geq x_0^{2^j},
$$
ao invés de convergir para zero, como a solução exata da equação.

No argumento acima, começamos com $x_0$ positivo, mas a mesma ideia se aplica quando $x_0$ é negativo com $x_0 \leq -2/\Delta t.$ Ou seja, mais geralmente, se
$$
|x_0| \geq \frac{2}{\Delta t} \geq 1,
$$
então vale que o sinal de $x_j$ alterna a cada iteração e
$$
|x_j| \geq |x_{j-1}|^2 \geq (|x_{j-2}|^2)^2 \geq \cdots \geq |x_0|^{2^j},
$$

Finalmente, observe que fixando $x_0$ e diminuindo o passo de tempo esse problema desaparece. Isso é compatível com o fato de que o método de Euler converge e é de ordem 1 no caso determinístico. Vamos ver agora como o problema acima pode ser explorado para nos dar que, no caso estocásticom o método de Euler-Maruyama não converge.

## Não convergência no caso aleatório

Considere, agora, a equação acima mas com uma condição inicial aleatória, i.e.
$$
\frac{\mathrm{d}X_t}{\mathrm{d}t} = - X_t^3,
$$
com $X_0 = X_0(\omega)$ variável aleatória. Caso $X_0$ tenha suporte compacto, digamos
$$
|X_0| \leq r,
$$
quase certamente, então basta tormarmos um passo $\Delta t$ suficientemente pequeno tal que
$$
\Delta t < \frac{2}{r},
$$
para evitar as oscilações das aproximações de Euler para um $\omega$ qualquer. Porém caso $X_0$ não tenha suporte limitado, podemos não ter esse controle global sobre erro. De fato, suponha que
$$
X_0 \sim \mathcal{N}(0, \sigma^2),
$$
para algum $\sigma > 0$ e que $T > 0.$ Dado $N\in\mathbb{N},$ seja $\Delta t = T/N$ e defina
$$
A_N = \left\{\omega; \;|X_0(\omega)| \geq \frac{2N}{T} \right\}.
$$
Como $X_0$ é normal, vale a estimativa
$$
\begin{align*}
\mathbb{P}(X_0 \geq r) & \geq \mathbb{P}(r \leq X_0 \leq 2r) \\
& = \frac{1}{\sqrt{2\pi \sigma^2}}\int_r^{2r} e^{-\frac{x^2}{2\sigma^2}}\;\mathrm{d}x \\
& \geq \frac{1}{\sqrt{2\pi \sigma^2}}r e^{-\frac{2r^2}{\sigma^2}}.
\end{align*}
$$
Em particular,
$$
\mathbb{P}(A_N) = 2\mathbb{P}\left(X_0 \geq \frac{2N}{T}\right) \geq \frac{4}{\sqrt{2\pi \sigma^2}}\frac{N}{T} e^{-\frac{8N^2}{\sigma^2T^2}}.
$$

Pelas estimativas acima, temos, para as aproximações de Euler $X_j(\omega),$ $j=0, \ldots, N,$ onde $\Delta t = T/N,$ que
$$
|X_j(\omega)| \geq |X_0(\omega)|^{2^j},
$$
para todo $\omega\in A_N.$ Em particular, para $j=N,$ temos
$$
|X_N(\omega)| \geq |X_0(\omega)|^{2^N} \geq \left(\frac{2N}{T}\right)^{2^N}.
$$
Assim, estimamos a norma forte por
$$
\mathbb{E}\left[|X_N|\right] \geq \left(\frac{2N}{T}\right)^{2^N} \mathbb{P}(A_N) \geq \left(\frac{2N}{T}\right)^{2^N}\frac{1}{\sqrt{2\pi \sigma^2}}\frac{4N}{T} e^{-\frac{8N^2}{\sigma^2T^2}} \rightarrow \infty,
$$
quando $N \rightarrow \infty.$ Da mesma forma,
$$
|X_N(\omega)|^k \geq |X_0(\omega)|^{k2^N} \geq \left(\frac{2N}{T}\right)^{k2^N},
$$
para $k\in\mathbb{N}$ qualquer, de modo que
$$
\mathbb{E}\left[|X_N|^k\right] \rightarrow \infty,
$$
quando $N\rightarrow \infty,$ também. Isso mostra que os momentos de $X_N$ não convergem para os momentos da solução exata $X_T$ no instante $t=T.$ Em outras palavras, a aproximação de Euler não converge fortemente nem fracamente para a solução exata, nesse caso.

## Não convergência no caso estocástico

Consideramos, agora, a perturbação estocástica da equação acima por um ruído aditivo, a saber
$$
\mathrm{d}X_t = -X_t^3\;\mathrm{d}t + \;\mathrm{d}W_t.
$$
Vamos assumir $X_0 = 0,$ para simplificar, mas o resultado vale de maneira mais geral. Dados $T > 0$ e $N\in\mathbb{N},$ temos o passo de tempo $\Delta t = T/N.$ Consideramos apenas $N$ suficientemente grande tal que
$$
\Delta t = \frac{T}{N} \leq \frac{1}{2}.
$$
A aproximação de Euler $X_j,$ nos instantes $t_j = j\Delta t,$ $j=0, \ldots, N,$ é dada por
$$
X_j = X_{j-1} - X_{j-1}^3\Delta t + \Delta W_{j-1}, \quad j = 1, \ldots, N,
$$
onde
$$
\Delta W_{j-1} = W_{t_j} - W_{t_{j-1}}.
$$

Seja
$$
r_N = \frac{N}{T} = \frac{1}{\Delta t} \geq 2.
$$
Considere o conjunto amostral
$$
A_N = \left\{\omega\in \Omega; \; |\Delta W_0(\omega)| \geq r_N^2 \textrm{ e } \frac{1}{r_N} \leq |\Delta W_j(\omega)| \leq \frac{2}{r_N}, \;j = 1, \ldots, N \right\}.
$$
A ideia é que o primeiro passo leva a aproximação para a região de "explosão" e os passos seguintes não são suficientes para tirá-la de lá. Há, na verdade, muita folga nessa construção. A explosão acontece em uma região muito maior. Mas o conjunto acima facilita as contas e é suficiente para mostrar a não convergência do método, nesse caso.

No que se segue, assumimo, então, que $\omega\in A_N.$ No primeiro passo, como $X_0 = 0,$ temos
$$
|X_1| = |\Delta W_0| \geq r_N^2.
$$
Agora, vamos assumir, por indução, que $|X_j| \geq |X_{j-1}|^2,$ para $j\in\mathbb{N}.$ Para $j=1,$ como $X_0 = 0,$ então isso vale trivialmente. Vamos, então, assumir que $|X_j| \geq |X_{j-1}|^2,$ até um certo $j\in\mathbb{N},$ e mostrar para $j+1.$ Observe que acabamos de ver que $|X_1| \geq r_N^2.$ Como $r_N\geq 2,$ então $|X_1|\geq 4.$ Até $j,$ também temos $|X_j|\geq |X_{j-1}|^2 \geq \ldots \geq |X_1|^{2^{j-1}} \geq r_N^{2^j} \geq 4.$

Agora, para $j+1,$ temos
$$
|X_{j+1}| = |X_j (1 - X_j^2\Delta t) + \Delta W_j| \geq |\Delta W_j - X_j^3\Delta t| - |X_j| \geq \max\{|\Delta W_j|, |X_j^3\Delta t|\} - \min\{|\Delta W_j|, |X_j^3\Delta t|\} - |X_j|.
$$

Como $\Delta t = 1/r_N$ e
$$
\frac{1}{r_N} \leq |\Delta W_j| \leq \frac{2}{r_N},
$$
então
$$
|X_{j+1}| \geq \max\{1, |X_j^3|\}\frac{1}{r_N} - \min\{2, |X_j^3|\}\frac{1}{r_N} - |X_j|.
$$
Pela a hipótese de indução, temos $|X_j| \geq 4 \geq 2,$ de modo que
$$
|X_{j+1}| \geq |X_j^3|\frac{1}{r_N} - \frac{2}{r_N} - |X_j|.
$$
Como $|X_j| \geq r_N \geq 2,$ então
$$
\frac{2}{r_N} \leq \frac{|X_j|}{r_N} \leq \frac{|X_j|^2}{r_N}
$$
e
$$
|X_j| \leq |X_j|\frac{|X_j|}{r_N}
$$
de modo que
$$
\frac{2}{r_N} + |X_j| \leq \frac{2|X_j|^2}{r_N}.
$$
Com isso,
$$
|X_{j+1}| \geq |X_j^3|\frac{1}{r_N} - \frac{2|X_j|^2}{r_N} = |X_j|^2\left(|X_j| - 2\right)\frac{1}{r_N}.
$$
Como $|X_j| \geq 4$ e $r_N \geq 2,$ então
$$
|X_{j+1}| \geq |X_j^3|\frac{1}{r_N} - \frac{2|X_j|^2}{r_N} = |X_j|^2\frac{2}{r_N} \geq |X_j|^2.
$$
Isso completa a indução.

Agora, precisamos estimar a medidade de $A_N.$ Como os passos de um processo de Wiener são independentes, temos
$$
\mathbb{P}(A_N) =  \mathbb{P}\left(|\Delta W_0(\omega)| \geq r_N^2\right)\prod_{j=1}^N\mathbb{P}\left(\frac{1}{r_N} \leq |\Delta W_j(\omega)| \leq \frac{2}{r_N}\right).
$$
Como os passos são normais, $\Delta W_j \sim \mathcal{N}(0, \Delta t),$ com $\Delta t = 1/r_N,$ usamos a estimativa acima, que nos diz que para $Z\sim \mathcal{N}(0, \sigma^2),$ vale
$$
\mathbb{P}(Z \geq r) \geq \frac{1}{\sqrt{2\pi \sigma^2}}r e^{-\frac{2r^2}{\sigma^2}}.
$$
Assim, com $\sigma^2 = 1/r_N,$
$$
\mathbb{P}\left(|\Delta W_0(\omega)| \geq r_N^2\right) \geq \sqrt{\frac{2r_N}{\pi}}r_N^2 e^{-2r_N^3} = \sqrt{\frac{2r_N^5}{\pi}} e^{-2r_N^3}
$$
e
$$
\mathbb{P}\left(\frac{1}{N} \leq |\Delta W_j(\omega)| \leq \frac{2}{r_N}\right) \geq \sqrt{\frac{2r_N}{\pi}}\frac{1}{r_N} e^{-\frac{2}{r_N^3}} = \sqrt{\frac{2}{\pi r_N}} e^{-\frac{2}{r_N^3}}.
$$
Deste modo,
$$
\mathbb{P}(A_N) \geq \sqrt{\frac{2r_N^5}{\pi}} e^{-2r_N^3} \left( \sqrt{\frac{2}{\pi r_N}} e^{-\frac{2}{r_N^3}}\right)^N = \left(\frac{2}{\pi}\right)^{(N-1)/2}\frac{1}{r_N^{(N-5)/2}}e^{-2(r_N^3 - N/r_N^3)}.
$$
Observe que essa medida vai rapidamente para zero, mas o crescimento de $|X_N|$ nessa região cresce extremamente mais rápido, de forma que
$$
\mathbb{E}\left[ |X_N| \right] \geq \mathbb{E}\left[ |X_N| \chi_{A_N} \right] \geq r_N^{2^N}\mathbb{P}\left(A_N\right) \geq r_N^{2^N}\left(\frac{2}{\pi}\right)^{(N-1)/2}\frac{1}{r_N^{(N-5)/2}}e^{-2(r_N^3 - N/r_N^3)} \rightarrow \infty,
$$
quando $N\rightarrow \infty.$ Da mesma forma,
$$
\mathbb{E}\left[ |X_N|^k \right] \rightarrow \infty,
$$
para todo $k\in \mathbb{N}.$ Ou seja, o método de Euler não converge nem fortemente, nem fracamente.

## Condições mais gerais

Esse resultado vale para equações estocásticas mais gerais, da forma
$$
\mathrm{d}X_t = f(X_t)\;\mathrm{d}t + g(X_t)\;\mathrm{d}W_t,
$$
sob condições apropriadas de crescimento em $f$ e $g,$ conforme demonstrado em [Hutzenthaler, Jentzen & Kloeden (2011)](https://doi.org/10.1098/rspa.2010.0348). Mais precisamente, devemos ter
$$
\max\{|f(x)|, |g(x)|\} \geq \frac{|x|^\beta}{R}, \quad \min\{|f(x)|, |g(x)|\} \leq R|x|^\alpha, \quad \mathbb{P}\left(g(X_0) \neq 0\right) > 0,
$$
para $|x| \geq R,$ com $R \geq 1,$ $\beta > \alpha > 1,$
Isso inclui equações como a equação de Ginzburg-Landau estocástica, a equação de Verhulst estocástica, a equação de difusão de Feller com crescimento logístico, equações cinéticas e outras tantas.
