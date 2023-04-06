@def title = "Do passeio aleatório ao movimento Browniano"

# {{ get_title }}

Uma outra maneira de modelar o movimento Browniano é através de um processo conhecido como *passeio aleatório*, no caso em que consideramos escalas de tempo e de comprimento para os passos temporais e espaciais e quando tomamos os limites quando essas escalas vão para zero de forma apropriada.

Vamos pensar em um passeio aleatório unidimensional, em um conjunto discreto $\ell \mathbb{Z}$, onde $\ell > 0$ é uma escala de comprimento. Usamos, também, uma escala de tempo $\tau > 0$. Assumimos que, a cada passo de tempo $\tau$, uma partícula pode se movimentar de uma distância $\ell$, para a direita ou para a esquerda, com probabilidade $1/2$ em cada sentido. A motivação é que, a cada passo de tempo, a partícula será bombardeada mais de um lado do que de outro, de maneira aleatória e independente. É uma situação bastante idealizada, porque não se leva em consideração possíveis variações relativas nas quantidades de bombardeamentos e no tamanho do passo, nem do momento adquirido pela partícula.

Denotamos, então, por $p_n(m)$ a probabilidade da partícula estar na posição $x = m\ell$, no instante $t = n\tau$. Naturalmente, $0 \leq p_n(m) \leq 1$, com $\sum_{m\in \mathbb{Z}} p_n(m) = 1$, para todo $n = 0, 1, \ldots$.

Inicialmente, em $t = 0$, consideramos que a partícula está na *origem*, de modo que $p_0(0) = 1$ e $p_0(m) = 0$, para $m\ne 0.$ Vamos escrever isso, simetricamente, na forma
$$
p_0 = (\ldots, 0, 0, 1, 0, 0, \ldots).
$$
Após o primeiro passo, temos $p_1(\pm 1) = 1/2$ e o $p_1(m) = 0$ para $m \neq \pm 1$. De outra forma, temos
$$
p_1 = (\ldots, 0, 1/2, 0, 1/2, 0, \ldots).
$$
No instante seguinte,
$$
p_2 = (\ldots, 0, 1/4, 0, 1/2, 0, 1/4, 0, \ldots),
$$
e assim por diante:
$$
p_3 = (\ldots, 0, 1/4, 0, 1/2, 0, 1/4, 0, \ldots),
$$
$$
p_4 = (\ldots, 0, 1/8, 0, 3/8, 0, 3/8, 0, 1/8, 0, \ldots),
$$
$$
p_5 = (\ldots, 0, 1/16, 0, 5/16, 0, 3/8, 0, 5/16, 0, 1/16, 0, \ldots),
$$
etc. Podemos continuar e buscar um padrão para a sequência, mas podemos deduzir os valores de uma forma mais simples.

Para uma partícula chegar na posição $x = \ell m$, ela deve dar $i$ passos para a direita e $j$ passos para a esquerda, com $i - j = m$. Para isso acontecer no passo $n$, devemos ter $i + j = n$. Logo, devemos ter $i = (n + m)/2$ passos para a direita e $j = (n - m)/2$ passos para a esquerda. Cada passo ocorre com probabilidade $1/2$. Assim, após $n$ passos, cada caminho ocorre com probabilidade $1/2^n$. Resta saber quantos caminhos existem até um determinado ponto $x = \ell m$.

Naturalmente, não há caminho caso $m < -n$ ou $m > n$. E há apenas um caminho para $m = -n$ e $m = n$. Mas pode haver vários caminhos ligando a outros pontos. Ou nenhum. De fato, se $n$ e $m$ tiverem paridades diferentes, então $n + m$ é ímpar e não tem como darmos $i = (n + m)/2$ passos para a direita, nem $j = (n - m)/2$ para a esquerda. Resta, agora, saber o número de caminhos possíveis quando $n$ e $m$ têm a mesma paridade e $|m| < n$.

Para ver isso, vamos focar no fato de que, para chegarmos em $x = m\ell$ após $n$ passos, devemos dar $(n + m)/2$ passos para a direita. Se, por exemplo, $n = 6$ e $m = 2$, devemos dar $(n + m)/2 = 4$ passos para a direita, mas eles podem acontecer em quaisquer quatro dos seis momentos entre $\tau$ e $n\tau$. Isso nos dá $\left(\begin{matrix} n \\ (n + m)/2 \end{matrix}\right) = \left(\begin{matrix} 6 \\ 4 \end{matrix}\right) = 15$ possibilidades de caminhos, de um total de $2^6$. Ou seja, $p_6(2) = 15 / 64$. Mais geralmente, temos
$$
p_n(m) = \frac{1}{2^n}\frac{n!}{\left(\frac{n + m}{2}\right)!\left(\frac{n-m}{2}\right)!}.
$$

Podemos reconhecer isso como a distribuição binomial, nos dando a probabilidade de $(n+m)/2$ sucessos em $n$ sorteios de Bernoulli, com probabilidade $1/2$ de cada realização, com as realizações sendo os passos $\ell$ e $-\ell$.

Denotando por $X_n$ a posição da partícula no passo $n \in \mathbb{Z}^* = \{0, 1, 2, \ldots\}$, temos que $\{X_n\}_{n \in \mathbb{N}}$ é um processo estocástico discreto, com cada passo $\Delta X = X_{n + 1} - X_n \sim \mathrm{Bernoulli}(\pm \ell, 1/2)$, representando o teste de Bernoulli com valores possíveis $\pm \ell$. Temos, ainda, que cada $X_n$ é uma distribuição binomial com possíveis valores $-n\ell, \ldots, n\ell$, que podemos denotar por
$$
X_n \sim B(\{-n\ell, \ldots, n\ell\}, 1/2),
$$
com $X_0 = 0$ quase sempre, ou seja,
$$
X_0 \sim \delta_0.
$$

## Limite contínuo

Assintoticamente, temos, pela fórmula de Stirling, $k! \simeq \sqrt{2\pi k} (k / e)^k$, quando $k \rightarrow \infty$. Mais precisamente, vale a desigualdade
$$
\sqrt{2\pi k} \left( \frac{k}{e} \right)^k e^{\frac{1}{12k+1}} < k! < \sqrt{2\pi k} \left( \frac{k}{e} \right)^k e^{\frac{1}{12k}}, \quad \forall k\in\mathbb{N}.
$$
Assim, para $k = 10$, temos $e^{1/12k} \approx 1.00829$, de modo que o erro relativo já é da ordem de 0,823%.

Assumindo, então, $n \gg 1$ e $|m| \ll n$, de modo que $(n\pm m)/2 \gg 1$ também, obtemos
$$
p_n(m) \simeq \frac{1}{2^n}\frac{\sqrt{2\pi n} (n / e)^n}{\sqrt{\pi (n + m)} ((n + m) / 2e)^{(n + m)/2}\sqrt{\pi (n - m)} ((n - m) / 2e)^{(n - m)/2}}.
$$
Simplificando, obtemos
$$
p_n(m) \simeq \sqrt{\frac{2n}{\pi(n^2 - m^2)}}\frac{n^n}{(n + m)^{(n + m)/2}(n - m)^{(n - m)/2}}.
$$
Separando a potência do numerador, obtemos
$$
p_n(m) \simeq \sqrt{\frac{2n}{\pi(n^2 - m^2)}}\left(\frac{n}{n+m}\right)^{(n + m)/2}\left(\frac{n}{n-m}\right)^{(n - m)/2}.
$$

Temos
$$ \ln\left(\left(\frac{n}{n+m}\right)^{(n + m)/2}\left(\frac{n}{n-m}\right)^{(n - m)/2}\right) = \frac{n + m}{2}\ln\left(\frac{n}{n+m}\right) + \frac{n - m}{2}\ln\left(\frac{n}{n-m}\right) \\ = -\frac{n + m}{2}\ln\left(1 + \frac{m}{n}\right) - \frac{n - m}{2}\ln\left(1 - \frac{m}{n}\right).
$$

Sendo $|m| \ll n$, obtemos, pela expansão $\ln(1 + x) = 0 + x - x^2/2 + \mathcal{O}(x^3) \approx x - x^2/2$,
$$ \ln\left(\left(\frac{n}{n+m}\right)^{(n + m)/2}\left(\frac{n}{n-m}\right)^{(n - m)/2}\right) \approx -\frac{n + m}{2}\left(\frac{m}{n} + \frac{1}{2}\frac{m^2}{n^2}\right) - \frac{n - m}{2}\left(-\frac{m}{n} + \frac{1}{2}\frac{m^2}{n^2}\right) = -\frac{m^2}{2n}.
$$
Portanto,
$$
\left(\frac{n}{n+m}\right)^{(n + m)/2}\left(\frac{n}{n-m}\right)^{(n - m)/2} \approx e^{-\frac{m^2}{2n}}.
$$
Por outro lado, usando novamente que $|m| \ll n$, temos $n^2 - m^2 \approx n^2$, de maneira que
$$
\sqrt{\frac{2n}{\pi(n^2 - m^2)}} \approx \sqrt{\frac{2}{\pi n}}.
$$

Portanto, para $n \gg 1$ e $|m| \ll n$, obtemos
$$
p_n(m) \approx \sqrt{\frac{2}{\pi n}}e^{-\frac{m^2}{2n}}.
$$

Passando para o contínuo, com $t = n \tau$ e $x = m \ell$ e interpretando $p_n(m)$ como a probabilidade da partícula estar no intervalo $(m-1)\ell \leq x \leq (m+1)\ell$, no instante $t$ e sendo $p(t, x)$ a densidade de probabilidades no instante $t$, temos
$$ 2\ell p(t, x) \approx \sqrt{\frac{2}{\pi n}}e^{-\frac{m^2}{2n}} = \sqrt{\frac{2\tau}{\pi t}}e^{-\frac{\tau x^2}{2t\ell^2}}.
$$
Logo,
$$
p(t, x) \approx \sqrt{\frac{\tau}{2\ell^2 \pi t}} e^{-\frac{\tau x^2}{2t\ell^2}} = \frac{1}{\sqrt{4\pi a t}} e^{-\frac{x^2}{4a t}},
$$
onde fizemos
$$
a = \frac{\ell^2}{2\tau}.
$$

Obtivemos, assim, que, para cada $t$, a função $x \mapsto p(t, x)$ é uma Gaussiana com variância $\sigma^2 = 2at$.

Observe que podemos pensar esse processo limite como tomando $\ell, \tau \rightarrow 0$ mas mantendo a relação $a = \ell^2/2\tau$ fixa. Ou seja, $\tau$ converge para zero muito mais rápido do que $\ell$. Em particular, fixados $x \approx m\ell$ e $t \approx n\tau$, e fazendo $\ell, \tau$ irem para zero, com $a = \ell^2/2\tau$ fixo, vemos que $m, n\rightarrow \infty$ (exceto quando $t$ e/ou $x$ são nulos), com $n$ crescendo muito mais rápido que $m$, garantindo a condição de que $|m| \ll n$. Assim, a aproximação acima para $p_n(m)/2\ell$ converge, de fato, para $p(t, x)$.

Observe, ainda, a semelhança entre a definição de $a$ acima e de $D$ no modelo de Einstein, onde, no primeiro caso, o passo é fixo, enquanto que, no segundo caso, o passo é uma variável aleatória:
$$
a = \frac{\ell^2}{2\tau}, \qquad D = \frac{\mathbb{E}(\ell^2)}{2\tau}.
$$

Pensando nesse limite contínuo, e abusando da notação, já que já definimos $X_n$, podemos escrever $X_t$ como a variável aleatória indicando a posição da partícula no instante $t \sim n\tau$.

## Equação de difusão

Podemos reconhecer, pela fórmula acima, que a evolução, no tempo, da distribuição de probabilidades $p(t, x)$ para a posição da partícula satisfaz a equação de difusão (e.g. equação do calor)
$$
\frac{\partial p}{\partial t^2} = a\frac{\partial p}{\partial x^2},
$$
onde $a$ representa o coeficiente de difusão (térmica, no caso do calor).

## Distância média percorrida

Como no modelo de Einstein, sendo $x \mapsto p(t, x)$ uma Gaussiana com variância $\sigma^2 = 2at$, a **distância quadrática média** percorrida pelas partículas, após um instante $t$, é exatamente esse desvio padrão:
$$
\sqrt{\mathbb{E}[x^2]} = \left( \int_{\mathbb{R}} x^2 p(t, x) \;\mathrm{d}x \right)^{1/2} = \sigma = \sqrt{2 a t}.
$$

Se, por outro lado, observarmos $\mathbb{E}(|x|)$, obtemos uma distância da mesma ordem: $\mathbb{E}(|x|) = 2\int_0^\infty x p(t, x) \;\mathrm{d}x = \sigma\sqrt{2/\pi}$.

## Incrementos

Em um instante $t$, a distribuição normal $\mathcal{N}(0, 2at)$ nos dá a probabilidade de encontrarmos a partícula em uma determinada posição (tendo ela partido de $x = 0$ em $t = 0$). Mas dada a posição da partícula no instante $t$, a posição dessa partícula em um instante $t + \Delta t$, com $\Delta t > 0$ não é dada por $\mathcal{N}(0, 2a(t+\Delta t))$ pura e simplesmente.  Temos, na verdade, uma probabilidade condicionada.

Pensando, novamente, no passeio aleatório, podemos imaginar um novo processo iniciando-se em $x = X_t$ e caminhando para $x \pm \ell$ no instante $t + \tau$ e para algum ponto entre $x - n\ell \leq x + m\ell \leq x + n\ell$, em instantes $t + n\tau$. Assim, o incremento $\Delta X = X_{t + \Delta t} - X_t$ é dado, novamente, por um passeio aleatório, só que começando de $X_t$ e durando um intervalo de tempo $\Delta t$. Ou seja, a lei de probabilidades para a posição $X_{t + \Delta t}$ da partícula dado $X_t$ é
$$
X_{t + \Delta t} \sim \mathcal{N}(X_t, 2a\Delta t) = X_t + \mathcal{N}(0, 2a\Delta t).
$$
Ou seja, a lei de probabilidades do incremento é
$$
\Delta X = X_{t + \Delta t} - X_t \sim \mathcal{N}(0, 2a\Delta t).
$$

## Caminhos

Como no modelo de Einstein, podemos ter, no limite, caminhos se deslocando cada vez mais rápido. De fato, ao longo de $n$ passos de tempo $\tau$ até um instante $t$, podemos ter exatos $n$ passos $\ell$ no mesmo sentido, digamos até $x = n\ell$, de modo que a velocidade é $x/t = \ell/\tau$. Fazemos $\ell, \tau \rightarrow 0$, com $a = \ell^2/2\tau$ constante, enquanto aumentamos $n$ e $m$ para chegarmos ao ponto mais longe possível $x$, no mesmo instante $t$. Assim, temos a velocidade $v = x/t = \ell/\tau = \sqrt{2a\tau}/\tau = \sqrt{2a/\tau} \rightarrow \infty$. Ou seja, não há como limitar a velocidade dos caminhos.

Porém, como feito no modelo de Einstein, é possível mostrar que, com probabilidade um, os caminhos são Hölder contínuos, com expoente arbitrariamente próximos de um.

## Diferenças finitas

Uma outra maneira de se trabalhar o limíte contínuo do passeio aleatório é via diferenças finitas. Pense em $p(t, x) \sim p_n(m)$ como uma função densidade de partículas, como se cada $m\in \mathbb{N}$ representasse um sítio, com um certo número $u_n(m)$ de partículas, cuja densidade é $p_n(m) = u_n(m) / U$, onde $U$ é o número total de partículas. A cada passo de tempo, em média metade das partículas em um sítio $m$ se encaminha para o sítio $m-1$ e a outra metade, para o sítio $m+1$. Por um outro ponto de vista, todas as partículas de um determinado sítio vão para os sítios vizinhos e metade das partículas de cada um dos sítios vizinhos se encaminha para aquele sítio. Ou seja, o total $u_{n+1}(m)$ de partículas no sítio $m$, no passo $n+1$, é inteiramente constituído pelas partículas advindas dos sítios vizinhos, de forma que
$$
  u_{n+1}(m) = \frac{1}{2}u_n(m-1) + \frac{1}{2}u_n(m+1).
$$
Subtraindo $u_n(m)$ dos dois lados, multiplicando a equação resultante por $1/\tau = 2a/\ell^2$ e dividindo-a por $U$, obtemos
$$
\frac{p_{n+1}(m) - p_n(m)}{\tau} = a\frac{p_n(m+1) - 2p_n(m) + p_n(m-1)}{\ell^2}
$$
No limite quando $\tau, \ell \rightarrow 0$, com $a = \ell^2/2\tau$ constante e com $x \sim m\ell$ e $t \sim n\tau$, obtemos a equação em derivadas parciais
$$
\frac{\partial p}{\partial t} = a\frac{\partial^2 p}{\partial x^2}.
$$

## Exercícios

1. Considere um passeio aleatório em três dimensões, onde o espaço é $\ell \mathbb{Z}^3$. Cada passo pode ser em qualquer direção, com oito possíveis destinos, $(\pm \ell, \pm \ell, \pm \ell)$, cada um com probabilidade $1/2^3 = 1/8$. Mostre que, no limite, a densidade de probabilidades $p(t, \mathbf{x})$ da posição da partícula é dada por
$$
p(t, \mathbf{x}) = \frac{1}{(4\pi a t)^{3/2}} e^{-\frac{|\mathbf{x}|^2}{4Dt}}.
$$
onde $\mathbf{x} = (x, y, z)$, $|\mathbf{x}| = \sqrt{x^2 + y^2 + z^2}$ e $a$ é como no caso unidimensional.

2. Uma versão bidimensional pode ser feita com passos dados por $\ell(\cos\theta, \sin\theta)$, com $\ell > 0$ fixo indicando o tamanho do passo e $\theta$ uma variável aleatória com probabilidade uniforme em $[0, 2\pi]$ indicando a direção do passo. Um passeio aleatório com $n$ passos nos leva a
$$
(X_n, Y_n) = \ell \sum_{i = 1, \ldots, n} (\cos\theta_i, \sin\theta_i).
$$
onde $\theta_i$ são $n$ realizações da variável ângulo. Como $\theta$ segue uma distribuição uniforme, temos $\mathbb{E}(\cos\theta) = \mathbb{E}(\sin\theta) = 0$. Com isso, mostre que
$$
\mathbb{E}((X_n, Y_n)) = (0, 0).
$$
Mostre, ainda, usando também as relações $\cos^2\theta = (1 + \cos(2\theta))/2$ e  $\sin^2\theta = (1 - \cos(2\theta))/2$, que
$$
\mathbb{E}(X_n^2 + Y_n^2) = n \frac{\ell^2}{2}.
$$
Ou seja, a média quadrática da distância cresce linearmente com o número de passos.
