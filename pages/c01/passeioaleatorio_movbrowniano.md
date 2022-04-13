@def title = "Movimento Browniano e passeio aleatório"

# {{ get_title }}

Um fluido, seja um gás ou um líquido, é composto de átomos e/ou moléculas em constante movimento. Mesmo que o fluido pareça estar em repouso, os seus constituintes atômicos não estão. Este movimento se reflete, por exemplo, na temperatura do fluido. Mas aqui vamos explorar outro fato associado a esse movimento.

Qualquer objeto imerso, ou em contato, com um fluido será constantemente bombardeado por esses átomos/moléculas. Partículas microscópicos, em particular, serão significativamente afetas por esse bombardeamento, deslocando-se em um movimento errático. Esse movimento errático é denominado **movimento Browniano**.

O nome dado a esse movimento é em homenagem ao botânico Robert Brown, que, em 1927, observou e relatou esse movimento ao observar, em um microscópio, grãos de pólen imersos em água. O artigo original está disponível em [On the particles contained in the pollen of plants](https://sciweb.nybg.org/science2/pdfs/dws/Brownian.pdf). Veja, também, um interessante apanhado histórico sobre isso, em [August 1827: Robert Brown and Molecular Motion in a Pollen-filled Puddle](https://www.aps.org/publications/apsnews/201608/physicshistory.cfm).

O que Brown observou foram micro-partículas, menores que os grãos de pólen, se descolando erraticamente no meio aquoso. Primeiramente, achou que fosse um movimento ativo, de partículas "vivas", provenientes do pólen. Posteriormente, realizou diversos outros experimentos, com diferentes partículas suspensas em líquido e concluiu que era um movimento passivo, mas sem explicar o mecanismo por trás do movimento.

Podemos ver esse movimento com partículas de pólen, partículas de fumaça e outras micro-partículas, como capturado nos vídeos a seguir:

[![Pollen Grains in Water - Brownian Motion](http://img.youtube.com/vi/R5t-oA796to/0.jpg)](https://www.youtube.com/watch?v=R5t-oA796to "Pollen Grains in Water - Brownian Motion")

[![A Smoke Cell demonstrating Brownian Motion in Air.](http://img.youtube.com/vi/ygiCHALySmM/0.jpg)](https://www.youtube.com/watch?v=ygiCHALySmM "A Smoke Cell demonstrating Brownian Motion in Air.")

[![Brownian Motion - nanoparticles in water](http://img.youtube.com/vi/cDcprgWiQEY/0.jpg)](https://www.youtube.com/watch?v=cDcprgWiQEY "Brownian Motion - nanoparticles in water")

Posteriormente, Albert Einstein, em um dos seus cinco artigos fundamentais publicados em [1905: Um ano miraculoso](https://cienciahoje.org.br/artigo/1905-um-ano-miraculoso/), explicou esse movimento como resultado, de fato, do movimento térmico dos fluidos. Foi uma demonstração indireta da existência de átomos e moléculas. Einstein deu mais detalhes sobre o fenômeno em um outro artigo, de 1908. Uma simulação desse efeito pode ser vista [aqui](https://galileoandeinstein.phys.virginia.edu/more_stuff/Applets/Brownian/brownian.html).

Outros cientistas também analisaram e explicaram o fenônemo de ângulos diferentes, como Marian von Smoluchowski (veja [Smoluchowski, M. M. (1906). "Essai d'une théorie cinétique du mouvement Brownien et des milieux troubles"](https://archive.org/stream/bulletininternat1906pols#page/577/mode/2up), [Smoluchowski, M. M. (1906). "Sur le chemin moyen parcouru par les molécules d'un gaz et sur son rapport avec la théorie de la diffusion" Bulletin International de l'Académie des Sciences de Cracovie (in French): 202.](https://archive.org/stream/bulletininternat1906pols#page/202/mode/2up) e [von Smoluchowski, M. (1906). "Zur kinetischen Theorie der Brownschen Molekularbewegung und der Suspensionen". Annalen der Physik (in German). 326 (14): 756–780](https://zenodo.org/record/1424073)) e Norbert Wiener.

Há, de fato, várias maneiras de se modelar o movimento Browniano. Vamos, a seguir, vê-lo como limite de um passeio aleatório.
## Passeio aleatório

Podemos modelar os efeitos dos átomos e moléculas em um partícula através de um passeio aleatório (ou *random walk*). Vamos pensar em um passeio aleatório unidimensional, em *lattice* $\ell \mathbb{Z}$, onde $\ell > 0$.  A cada passo de tempo $\tau$, uma partícula pode se movimentar para a direita ou para a esquerda, por um passo espacial $\ell$, com probabilidade $1/2$ em cada sentido. A motivação é que, a cada passo de tempo, a partícula será bombardeada mais de um lado do que de outro, de maneira aleatória e independente. É uma situação bastante idealizada, porque não se leva em consideração possíveis variações relativas nas quantidades de bombardeamentos.

Denotamos por $p_n(m)$ a probabilidade da partícula estar na posição $x = m\ell$, no instante $t = n\tau$. Naturalmente, $0 \leq p_n(m) \leq 1$, com $\sum_{m\in \mathbb{Z}} p_n(m) = 1$, para todo $n\in \mathbb{Z}^*$.

Inicialmente, em $t = 0$, consideramos que a partícula está na *origem*, de modo que $p_0(0) = 1$ e $p_0(m) = 0$, para $m\ne 0$. Vamos escrever isso, simetricamente, na forma
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

Para uma partícula chegar na posição $x = \ell m$ ela deve dar $i$ passos para a direita e $j$ passos para a esquerda, com $i - j = m$. Para isso acontecer no passo $m$, devemos ter $i + j = n$. Logo, devemos ter $i = (n + m)/2$ passos para a direita e $j = (n - m)/2$ passos para a esquerda. Cada passo ocorre com probabilidade $1/2$. Assim, após $n$ passos, cada caminho ocorre com probabilidade $1/2^n$. Resta saber quantos caminhos existem até um determinado ponto $x = \ell m$.

Naturalmente, não há caminho caso $m < -n$ ou $m > n$. E há apenas um caminho para $m = -n$ e $m = n$. Mas pode haver vários caminhos ligando a outros pontos. Ou nenhum. De fato, se $n$ e $m$ tiverem paridades diferentes, então $n + m$ é ímpar e não tem como darmos $i = (n + m)/2$ passos para a direita, nem $j = (n - m)/2$ para a esquerda. Resta, agora, saber o número de caminhos possíveis quando $n$ e $m$ têm a mesma paridade e $|m| < n$.

Para ver isso, vamos focar no fato de que, para chegarmos em $x = m\ell$ após $n$ passos, devemos dar $(n + m)/2$ passos para a direita. Se, por exemplo, $n = 6$ e $m = 2$, devemos dar $(n + m)/2 = 4$ passos para a direita, mas eles podem acontecer a quaisquer quatro dos seis momentos entre $\tau$ e $n\tau$. Isso nos dá $\left(\begin{matrix} n \\ (n + m)/2 \end{matrix}\right) = \left(\begin{matrix} 6 \\ 4 \end{matrix}\right) = 15$ possibilidades de caminhos, de um total de $2^6$. Ou seja, $p_6(2) = 15 / 64$. Mais geralmente, temos
$$
p_n(m) = \frac{1}{2^n}\frac{n!}{\left(\frac{n + m}{2}\right)!\left(\frac{n-m}{2}\right)!}.
$$

Podemos reconhecer isso como a distribuição de Bernoulli, nos dando a probabilidade de $(n+m)/2$ sucessos em $n$ sorteios de Bernouilli com probabilidade $1/2$ de cada realização.

## Limite contínuo

Assintoticamente, temos $k! \simeq \sqrt{2\pi k} (k / e)^k$, quando $k \rightarrow \infty$. Aplicando isso a $n$ grande e $|m| \ll n$, de modo que $(n\pm m)/2$ também são grandes, obtemos
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
p(t, x) \approx \sqrt{\frac{\tau}{2\ell^2 \pi t}} e^{-\frac{\tau x^2}{2t\ell^2}} = \frac{1}{\sqrt{4\pi a^2 t}} e^{-\frac{x^2}{4a^2 t}},
$$
onde fizemos
$$
a = \frac{\ell^2}{2\tau}.
$$

Obtivemos, assim, que, para cada $t$, a função $x \mapsto p(t, x)$ é uma Gaussiana com variância $\sigma^2 = 2at$.

## Equação de diffusão

Podemos reconhecer, pela fórmula acima, que a evolução, no tempo, da distribuição de probabilidades $p(t, x)$ para a posição da partícula satisfaz a equação de difusão (e.g. equação do calor)
$$
\frac{\partial p}{\partial t^2} = a\frac{\partial p}{\partial x^2},
$$
onde $a$ representa o coeficiente de difusão (térmica, no caso do calor).

## Caminho percorrido

Sendo $x \mapsto p(t, x)$ uma Gaussiana com variância $\sigma^2 = 2at$. O valor esperado para a distância percorrida por um conjunto de partículas, após um instante $t$, é exatamente esse desvio padrão:
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

## Processo estocástico Browniano

Com a idealização acima, é natural postularmos que o movimento Browniano, ou seja, o movimento da partícula, seja modelado por um processo estocástico $\{B_t\}_{t\geq 0}$ dado pelas condições abaixo, com algum $a > 0$:
1. $B_0 = 0$;
2. $B_t \sim \mathcal{N}(0, 2at)$, $t > 0$;
3. Para $0 \leq t < s < q < r$, os incrementos $W_s - W_t$ e $W_r - W_q$ são independentes
4. Para $0 \leq t < s$, o incremento $W_s - W_t$ é uma variável aleatória com distribuição normal, média zero e variância $2a(t - s)$, ou seja, $W_s - W_t \sim \mathcal{N}(0, 2a(t - s)) = \sqrt{2a(t-s)}\mathcal{N}(0, 1)$.

A primeira condição indica que a posição inicial da partícula é, quase certamente, $x = 0$.

A segunda condição é a de que existe um $a>0$ tal que a posição da partícula em instantes $t>0$ seja dada pela normal com média zero e variância $2at$. Na prática, o valor de $a$ irá depender do fluido e da partícula.

A terceira condição diz que os incrementos são independentes entre si, ou seja, um incremento $W_q - W_r$ é indenpendente de outros incrementos $W_s - W_t$.

A última condição diz que cada incremento também é normal, com média zero e variância dada de acordo com o passo temporal, $2a(t-s)$, nos dando um desvio padrão proporcional à raiz quadrada do passo temporal.

## A teoria de Einstein

No modelo de Eistein, também unidimensional, a partícula pertence a um espaço contínuo $x\in \mathbb{R}$ e pode dar passos espaciais $\ell$ de tamanhos diferentes, com densidade de probabilidades $g(\ell)$.

Sendo $\rho(t, x)$ a função densidade de distribuição das partículas no instante $t$, uma expansão em série de Taylor nos dá, por um lado
$$
\rho(t + \tau, x) = \rho(t, x) + \tau \frac{\partial \rho}{\partial t}(x, t) + \mathcal{O}(\tau^2).
$$
Por outro lado, usando a densidade de probabilidades $g(\ell)$ do passo espacial, obtemos que
$$
\rho(t + \tau, x) = \int_{\mathbb{R}} \rho(t, x - \ell)g(\ell) \;\mathrm{d}\ell
$$

Usando novamente expansão em séries de Taylor, dessa vez na direção espacial, vemos que
$$
\rho(t, x - \ell) = \rho(t, x) - \frac{\partial \rho}{\partial t}(t, x)\ell + \frac{1}{2}\frac{\partial^2 \rho}{\partial t^2}(t, x)\ell^2 + \mathcal{O}(\ell^3).
$$
Logo,
$$
\rho(t + \tau, x) = \rho(t, x) \int_{\mathbb{R}} g(\ell) \;\mathrm{d}\ell - \frac{\partial \rho}{\partial t}(t, x) \int_{\mathbb{R}} \ell g(\ell) \;\mathrm{d}\ell + \frac{1}{2}\frac{\partial^2 \rho}{\partial t^2}(t, x) \int_{\mathbb{R}} \ell^2 g(\ell) \;\mathrm{d}\ell + \mathcal{O}(\ell^3).
$$

Usando que
$$
\int_{\mathbb{R}} g(\ell) \;\mathrm{d}\ell = 1, \quad \int_{\mathbb{R}} \ell g(\ell) \;\mathrm{d}\ell = \mathbb{E}(\ell) = 0,
$$
chegamos a
$$
\rho(t, x) + \tau \frac{\partial \rho}{\partial t}(x, t) + \mathcal{O}(\tau^2) = \rho(t, x)  + \frac{1}{2}\frac{\partial^2 \rho}{\partial t^2}(t, x) \int_{\mathbb{R}} \ell^2 g(\ell) \;\mathrm{d}\ell + \mathcal{O}(\ell^3).
$$
Ou seja,
$$
\frac{\partial \rho}{\partial t}(x, t) = D\frac{\partial^2 \rho}{\partial t^2}(t, x) + \textrm{ termos de ordem mais alta },
$$
onde
$$
D = \frac{1}{2\tau}\int_{\mathbb{R}} \ell^2 g(\ell) \;\mathrm{d}\ell = \frac{1}{2\tau}\mathbb{E}(\ell^2).
$$

Obtemos, assim, novamente, a equação de difusão (aproximadamente), cuja solução é
$$
\rho(t, x) = \frac{1}{\sqrt{4\pi D^2 t}} e^{-\frac{x^2}{4D^2 t}}.
$$

Novamente, vemos que o descolamento médio de uma partícula em movimento Browniano é proporcional à raiz quadrada do tempo decorrido:
$$
\mathbb{E}(x^2) = 2Dt.
$$

Posteriormente, argumentos mais detalhados (via pressão osmótica) levaram Einstein a relacionar o coeficiente de difusão $D$ com outras quantidades físicas (constante universal do gás, número de Avogadro, temperatura, etc.). Smoluchowski também seguiu argumentos semelhantes, mas com pequenas modificações, levando a uma relação considerada mais precisa.