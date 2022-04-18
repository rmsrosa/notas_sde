@def title = "Movimento Browniano"

# {{ get_title }}

Um fluido, seja um gás ou um líquido, é composto de átomos e/ou moléculas em constante movimento. Mesmo que o fluido pareça estar em repouso, os seus constituintes atômicos não estão. Este movimento se reflete, por exemplo, na temperatura do fluido. Mas aqui vamos explorar outro fato associado a esse movimento.

Qualquer objeto imerso, ou em contato, com um fluido será constantemente bombardeado por esses átomos/moléculas. Partículas microscópicos, em particular, serão significativamente afetas por esse bombardeamento, deslocando-se em um movimento errático. Esse movimento errático é denominado **movimento Browniano**.

## Exemplos de movimento Browniano

O nome dado a esse movimento é em homenagem ao botânico Robert Brown, que, em 1927, observou e relatou esse movimento ao observar, em um microscópio, grãos de pólen imersos em água. O artigo original está disponível em [On the particles contained in the pollen of plants](https://sciweb.nybg.org/science2/pdfs/dws/Brownian.pdf). Veja, também, um interessante apanhado histórico sobre isso, em [August 1827: Robert Brown and Molecular Motion in a Pollen-filled Puddle](https://www.aps.org/publications/apsnews/201608/physicshistory.cfm).

O que Brown observou foram micro-partículas, menores que os grãos de pólen, se descolando erraticamente no meio aquoso. Primeiramente, achou que fosse um movimento ativo, de partículas "vivas", provenientes do pólen. Posteriormente, realizou diversos outros experimentos, com diferentes partículas suspensas em líquido e concluiu que era um movimento passivo, mas sem explicar o mecanismo por trás do movimento.

Podemos ver esse movimento com partículas de pólen, partículas de fumaça e outras micro-partículas, como capturado nos vídeos a seguir:

[![Pollen Grains in Water - Brownian Motion](http://img.youtube.com/vi/R5t-oA796to/0.jpg)](https://www.youtube.com/watch?v=R5t-oA796to "Pollen Grains in Water - Brownian Motion")

[![A Smoke Cell demonstrating Brownian Motion in Air.](http://img.youtube.com/vi/ygiCHALySmM/0.jpg)](https://www.youtube.com/watch?v=ygiCHALySmM "A Smoke Cell demonstrating Brownian Motion in Air.")

[![Brownian Motion - nanoparticles in water](http://img.youtube.com/vi/cDcprgWiQEY/0.jpg)](https://www.youtube.com/watch?v=cDcprgWiQEY "Brownian Motion - nanoparticles in water")

## Os trabalhos de Einstein e de Smoluchowski

Posteriormente, Albert Einstein, em um dos seus cinco artigos fundamentais publicados em [1905: Um ano miraculoso](https://cienciahoje.org.br/artigo/1905-um-ano-miraculoso/), explicou esse movimento como resultado, de fato, do movimento térmico dos fluidos. Foi uma demonstração indireta da existência de átomos e moléculas. Einstein deu mais detalhes sobre o fenômeno em um outro artigo, de 1908. Uma simulação desse efeito pode ser vista no link a seguir:

[![Brownian motion simulator](/assets/images/BrownianMotionSimulator.png)](https://galileoandeinstein.phys.virginia.edu/more_stuff/Applets/Brownian/brownian.html).

Outros cientistas também analisaram e explicaram o fenônemo de ângulos diferentes, como Marian von Smoluchowski (veja [Smoluchowski, M. M. (1906). "Essai d'une théorie cinétique du mouvement Brownien et des milieux troubles"](https://archive.org/stream/bulletininternat1906pols#page/577/mode/2up), [Smoluchowski, M. M. (1906). "Sur le chemin moyen parcouru par les molécules d'un gaz et sur son rapport avec la théorie de la diffusion" Bulletin International de l'Académie des Sciences de Cracovie (in French): 202.](https://archive.org/stream/bulletininternat1906pols#page/202/mode/2up) e [von Smoluchowski, M. (1906). "Zur kinetischen Theorie der Brownschen Molekularbewegung und der Suspensionen". Annalen der Physik (in German). 326 (14): 756–780](https://zenodo.org/record/1424073)) e Norbert Wiener.

## O modelo de Einstein

No modelo de Eistein, para explicar o movimento Browniano, temos uma partícula em um espaço contínuo unidimensional. Inicialmente, a partícula está na posição $x = 0$. A partir daí, a partícula pode se deslocar para um lado ou para o outro, de maneira aleatória. A cada instante $t \geq 0$, temos uma *função densidade de probabilidades* $\rho(t, x)$, para a posição da partícula.

A regra para o movimento é que, a cada instante $t$, a partícula pode dar passos espaciais de tamanhos $\ell$ diferentes, para um lado ou para o outro, de acordo com uma certa densidade de probabilidades $g$.

Assume-se que essa densidade é estacionária (independente do tempo), homogênea (não depende da posição da partícula), isotrópica (não depende da direção/sentido de movimento) e que os passos são independentes entre si (o passo num instante $s > 0$ independe do passo dado em $0 \leq t < s$).

Assim, $\ell$ assume valores em $\mathbb{R}$; $g$ é não negativa; $g$ independe de $x$ e de $t$; satisfaz $\int_{\mathbb{R}} g(\ell) \;\mathrm{d}\ell = 1$; e é simétrica em relação à origem, i.e. $g(-\ell) = g(\ell)$.

Sendo $\rho(t, x)$ a função densidade de distribuição das partículas no instante $t$, uma expansão em série de Taylor nos dá, por um lado
$$
\rho(t + \tau, x) = \rho(t, x) + \tau \frac{\partial \rho}{\partial t}(x, t) + \mathcal{O}(\tau^2).
$$
Por outro lado, usando a densidade de probabilidades $g(\ell)$ do passo espacial, obtemos que
$$
\rho(t + \tau, x) = \int_{\mathbb{R}} \rho(t, x - \ell)g(\ell) \;\mathrm{d}\ell
$$

Usando novamente expansão em série de Taylor, dessa vez na direção espacial, vemos que
$$
\rho(t, x - \ell) = \rho(t, x) - \frac{\partial \rho}{\partial t}(t, x)\ell + \frac{1}{2}\frac{\partial^2 \rho}{\partial t^2}(t, x)\ell^2 + \mathcal{O}(\ell^3).
$$
Logo,
$$
\rho(t + \tau, x) = \int_{\mathbb{R}} \left(\rho(t, x) - \frac{\partial \rho}{\partial t}(t, x) \ell + \frac{1}{2}\frac{\partial^2 \rho}{\partial t^2}(t, x) \ell^2 + \mathcal{O}(\ell^3) \right)g(\ell) \;\mathrm{d}\ell.
$$

Usando que $g$ é uma densidade de probabilidades e que é simétrica em relação a origem, temos
$$
\int_{\mathbb{R}} g(\ell) \;\mathrm{d}\ell = 1, \quad \int_{\mathbb{R}} \ell g(\ell) \;\mathrm{d}\ell = \mathbb{E}(\ell) = 0.
$$
Com isso, chegamos a
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

Obtemos, assim (aproximadamente), a equação de difusão
$$
\frac{\partial \rho}{\partial t}(x, t) = D\frac{\partial^2 \rho}{\partial t^2}(t, x),
$$
cuja solução é
$$
\rho(t, x) = \frac{1}{\sqrt{4\pi D t}} e^{-\frac{x^2}{4D t}}.
$$

Ou seja, em qualquer instante $t$, a posição da partícula é dada de acordo com uma distribuição normal $\mathcal{N}(0, 2Dt)$, com média zero e variância $2Dt$.

## Distância quadrática média percorrida

Sendo $x \mapsto p(t, x)$ uma Gaussiana com variância $\sigma^2 = 2Dt$, a **distância quadrática média** percorrida pelas partículas, após um instante $t$, é exatamente esse desvio padrão:
$$
\sqrt{\mathbb{E}[x^2]} = \left( \int_{\mathbb{R}} x^2 p(t, x) \;\mathrm{d}x \right)^{1/2} = \sigma = \sqrt{2 D t}.
$$

Se, por outro lado, observarmos $\mathbb{E}(|x|)$, obtemos uma distância da mesma ordem: $\mathbb{E}(|x|) = 2\int_0^\infty x p(t, x) \;\mathrm{d}x = \sigma\sqrt{2/\pi}$.

Esse foi um dos resultados fundamentais obtidos por Einstein: a distância média percorrida pelas partículas é proporcional à raiz quadrada do tempo decorrido.

Isso acontece, nesse caso, pelo movimento frenético das partículas elementares do fluido. Um fenômeno macroscópico análogo acontece em escoamentos turbulentos, que pode ser apreciado no formato de rastros de fumaça em chaminés (pelo menos em condições onde movimentos advectivos não dominam).

## Incrementos

Em um instante $t$, a distribuição normal $\mathcal{N}(0, 2Dt)$ nos dá a probabilidade de encontrarmos a partícula em uma determinada posição (tendo ela partido de $x = 0$ em $t = 0$). Mas dada a posição da partícula no instante $t$, a posição dessa partícula em um instante $t + \Delta t$, com $\Delta t > 0$ não é dada por $\mathcal{N}(0, 2a(t+\Delta t))$ pura e simplesmente. Temos, na verdade, uma probabilidade condicionada. No modelo, isso se reflete nas hipóteses de homogeneidade espacial e temporal. Assim, conhecendo-se $X_t = x$, temos que a posição futura da partícula será dada por
$$
P(X_{t + \Delta t} | X_t = x) = \mathcal{N}(x, 2D\Delta t) = x + \mathcal{N}(0, 2D\Delta t),
$$
ou seja, o incremento é dado por
$$
\Delta X = X_{t + \Delta t} - X_t \sim \mathcal{N}(0, 2D\Delta t).
$$

## Paradoxo da velocidade infinita de deslocamento

Como os passos podem ser dados a qualquer momento e podem se acumular em uma mesma direção/sentido, não há limite para a distância a ser percorrida por uma partícula, em um determinado intervalo de tempo. Vimos acima, um resultado a respeito da distância quadrática *média* percorrida por uma partícula, mas nada impede que existam algumas partículas que se movam muito mais rápido. Em um determinado intervalo arbitrariamente curto de tempo, podemos ter passos arbitrariamente grandes. Mesmo que o passo fosse limitado, não há limitação de quão frequentes eles podem ser, de forma que eles podem se acumular, numa mesma direção e sentido, levando a partícula a distâncias sem limite. Algo contra-intuitivo.

## Regularidade dos caminhos amostrais

O que salva é que esses possíveis caminhos são raros. De fato, o modelo de Einstein nos garante que, quase sempre, com probabilidade um, os caminhos são Hölder contínuos, com expoente arbitrariamente próximo de 1/2. Ou seja, probabilidade nula de "encontrarmos" caminhos descontínuos, com velocidade infinita de deslocamento.

Um caminho amostral $t \rightarrow x(t, \omega)$, em um intervalo $t\in I$, é Hölder contínuo com expoente $\theta > 0$ se existe $C>0$ tal que
$$
  |x(s, \omega) - x(t, \omega)| \leq C|s - t|^\theta,
$$
para todo $s, t \in I$. O conjunto de caminhos Hölder-contínuos com expoente $\theta$ é a união, em $C > 0$, dos caminhos satisfazendo a desigualdade acima. Os caminhos que não são Hölder-contínuos com expoente $\theta$ pertencem à interseção dos complementos dos caminhos satisfazendo a desigualdade acima.

Vamos considerar $I=[0, \infty)$ e estimar a probabilidade de termos uma relação como a acima em, pelo menos, um dado passo $\Delta t > 0$, em um instante $t\geq 0$:
$$
  |\Delta x| = |x(t + \Delta t, \omega) - x(t, \omega)| \leq C\Delta t^\theta.
$$
Mais precisamente, queremos estimar a probabilidade de termos um caminho com um passo não satisfazendo essa desigualdade:
$$
  \mathcal{P}\left(|\Delta x| \geq C\Delta t^\theta\right).
$$

Temos,
$$
  \mathcal{P}\left(|\Delta x| \geq C\Delta t^\theta)\right) = \int_{|\Delta x| \geq C\Delta t^\theta} \frac{1}{\sqrt{4\pi D \Delta t}} e^{-\frac{\Delta x^2}{4D \Delta t}} \;\mathrm{d}\Delta x \\
  \leq \int_{|\Delta x| \geq C\Delta t^\theta} \frac{|\Delta x|^2}{C^2\Delta t^{2\theta}} \frac{1}{\sqrt{4\pi D \Delta t}} e^{-\frac{\Delta x^2}{4D \Delta t}} \;\mathrm{d}\Delta x \\
  \leq \frac{1}{C^2\Delta t^{2\theta}}\int_{|\Delta x| \geq C\Delta t^\theta} |\Delta x|^2 \frac{1}{\sqrt{4\pi D \Delta t}} e^{-\frac{\Delta x^2}{4D \Delta t}} \;\mathrm{d}\Delta x \\
  \leq \frac{1}{C^2\Delta t^{2\theta}} \mathbb{E}[\Delta x^2] \\
  \leq \frac{2D\Delta t}{C^2\Delta t^{2\theta}}.
$$
Usamos, acima, uma desigualdade chamada de **desigualdade de Chebyshev**, explorando a condição $|\Delta x| \geq C\Delta t^\theta$ para escrever $1 \leq |\Delta x| / C\Delta t^\theta \leq |\Delta x|^2 / C^2\Delta t^{2\theta}$ e, em seguida, a finitude da distância quadrática média.

Assim,
$$
  \mathcal{P}\left(|\Delta x| \geq C\Delta t^\theta)\right) \leq \frac{2D\Delta t^{1-2\theta}}{C^2} \rightarrow 0, \quad C \rightarrow \infty.
$$

Com base nisso, usando um resultado conhecido como **Teorema de Borel-Cantelli**, podemos tirar
$$
  \mathcal{P}\left(\frac{|\Delta x|}{\Delta t^\theta} < \infty\right) = \mathcal{P}\left(\bigcap_{C > 0} \frac{|\Delta x|}{\Delta t^\theta} < C\right) = 1 - \mathcal{P}\left(\bigcap_{C > 0} \frac{|\Delta x|}{\Delta t^\theta} \geq C\right) \\ = 1 - \lim_{C\rightarrow \infty} \mathcal{P}\left(\frac{|\Delta x|}{\Delta t^\theta} \geq C\right) = 1.
$$

Ou seja, quase sempre, teremos ${|\Delta x|}/{\Delta t^\theta}$ limitado, portanto existindo $C > 0$ tal que $|x(t + \Delta t) - x(t)| = |\Delta x| \leq C \Delta t^\theta $.

O argumento acima, na verdade, não é uma demonstração completa, pois a desigualdade de Hölder deve valer para *todo* $t$ e *todo* $\Delta t$, *para cada caminho*. Mas esse é a estimativa principal que garante isso. O resto depende mais de argumentos topológicos. Esse resultado pode ser visto como um caso particular do **Teorema de Continuidade de Kolmogorov**, que mencionaremos novamente ao falarmos de processos estocásticos.

## Processo estocástico Browniano

Com a idealização acima, é natural postularmos que o movimento Browniano, ou seja, o movimento da partícula, seja modelado por um processo estocástico $\{B_t\}_{t\geq 0}$ dado pelas condições abaixo, com algum $D > 0$:
1. $B_0 = 0$;
2. $B_t \sim \mathcal{N}(0, 2Dt)$, $t > 0$;
3. Para $0 \leq t < s < q < r$, os incrementos $B_s - B_t$ e $B_r - B_q$ são independentes
4. Para $0 \leq t < s$, o incremento $B_s - B_t$ é uma variável aleatória com distribuição normal, média zero e variância $2D(t - s)$, ou seja, $B_s - B_t \sim \mathcal{N}(0, 2D(t - s)) = \sqrt{2D(t-s)}\mathcal{N}(0, 1)$.
5. Quase todo caminho amostral é Hölder contínuo, com expoente de Hölder menor mas arbitrariamente próximo de 1/2.

A primeira condição indica que a posição inicial da partícula é, quase certamente, $x = 0$.

A segunda condição é a de que existe um $D>0$ tal que a posição da partícula em instantes $t>0$ seja dada pela normal com média zero e variância $2Dt$. Na prática, o valor de $D$ irá depender do fluido, do estado termodinâmico do fluido e da partícula.

A terceira condição diz que os incrementos são independentes entre si, ou seja, um incremento $B_q - B_r$ é independente de outros incrementos $B_s - B_t$.

A quarta condição diz que cada incremento também é normal, com média zero e variância dada de acordo com o passo temporal, $2D(t-s)$, nos dando um desvio padrão proporcional à raiz quadrada do passo temporal.

A última condição diz que, com probabilidade um em $\omega$, cada caminho amostral $x(t, \omega)$ é tal que, para $0<\theta < 1/2$ e $T > 0$, existe $C > 0$ tal que
$$
  |x(s, \omega) - x(t, \omega)| \leq C|s - t|^\theta,
$$
para todo $0 \leq s, t \leq T$. Naturalmente, $C$ pode depender de $\omega$, $\theta$ e $T$.

## Exercícios

1. Considere a versão tridimensional do modelo de Einstein, onde $\mathbf{x} = (x, y, z) \in \mathbb{R}^3$ e os passos $\boldsymbol{\ell} = (\ell_x, \ell_y, \ell_z) \in \mathbb{R}^3$ são dados de acordo com uma distribuição de probabilidades $g = g(\boldsymbol\ell)$ que é estacionária, homogênea e isotrópica, com passos independentes. Mostre que a densidade de probabilidades $p(t, \mathbf{x}) = p(t, x, y, z)$ da posição da partícula satisfaz a equação de difusão
$$
\frac{\partial p}{\partial t} = D \Delta p,
$$
onde $\Delta = \partial_x^2 + \partial_y^2 + \partial_z^2$ é o operador Laplaciano em três dimensões, $|\mathbf{x}| = \sqrt{x^2 + y^2 + z^2}$ e $D$ é definido de forma análoga ao caso unidimensional, mas envolvendo uma integral tripla. Sua solução também nos dá distribuições normais para a posição da partícula em cada tempo, com média zero e desvio padrão $2Dt$:
$$
p(t, \mathbf{x}) = \frac{1}{(4\pi D t)^{3/2}} e^{-\frac{|\mathbf{x}|^2}{4Dt}}.
$$
Mostre, ainda, que a distância média percorrida satisfaz
$$
\sqrt{\mathbb{E}[|X_t|^2]} = 6Dt.
$$