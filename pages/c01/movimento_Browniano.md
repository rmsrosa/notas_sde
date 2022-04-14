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

No modelo de Eistein, para explicar o movimento Browniano, temos uma partícula pertence a um espaço contínuo unidimensional. Inicialmente, a partícula está na posição $x = 0$. A partir daí, a partícula pode se deslocar para um lado ou para o outro, de maneira aleatória. A cada instante $t \geq 0$, temos uma *função densidade de probabilidades* $\rho(t, x)$, para a posição da partícula.

A regra para o movimento é que, a cada instante $t$, a partícula pode dar passos espaciais $\ell$ de tamanhos diferentes, de acordo com uma certa densidade de probabilidades $g(\ell)$. Assume-se que essa densidade é estacionária (independente do tempo), homogênea (não depende da posição), isotrópica (não depende da direção/sentido, ou seja, $g(-\ell) = g(\ell)$) e que os passos são independentes entre si (o passo num instante $s > t$ independe do passo dado em $t \geq 0$).

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

Obtemos, assim, a equação de difusão (aproximadamente), cuja solução é
$$
\rho(t, x) = \frac{1}{\sqrt{4\pi D t}} e^{-\frac{x^2}{4D t}}.
$$

Ou seja, em qualquer instante $t$, a posição da partícula é dada de acordo com uma distribuição normal $\mathcal{N}(0, 2Dt)$, com média zero e variância $2Dt$.

## Caminho percorrido

Sendo $x \mapsto p(t, x)$ uma normal com variância $\sigma^2 = 2Dt$. O valor esperado para a distância percorrida por um conjunto de partículas, após um instante $t$, é exatamente o desvio padrão:
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
X_{t + \Delta t} - X_t = \mathcal{N}(0, 2D\Delta t).
$$

## Processo estocástico Browniano

Com a idealização acima, é natural postularmos que o movimento Browniano, ou seja, o movimento da partícula, seja modelado por um processo estocástico $\{B_t\}_{t\geq 0}$ dado pelas condições abaixo, com algum $a > 0$:
1. $B_0 = 0$;
2. $B_t \sim \mathcal{N}(0, 2at)$, $t > 0$;
3. Para $0 \leq t < s < q < r$, os incrementos $B_s - B_t$ e $B_r - B_q$ são independentes
4. Para $0 \leq t < s$, o incremento $B_s - B_t$ é uma variável aleatória com distribuição normal, média zero e variância $2D(t - s)$, ou seja, $B_s - B_t \sim \mathcal{N}(0, 2D(t - s)) = \sqrt{2D(t-s)}\mathcal{N}(0, 1)$.

A primeira condição indica que a posição inicial da partícula é, quase certamente, $x = 0$.

A segunda condição é a de que existe um $D>0$ tal que a posição da partícula em instantes $t>0$ seja dada pela normal com média zero e variância $2Dt$. Na prática, o valor de $a$ irá depender do fluido e da partícula.

A terceira condição diz que os incrementos são independentes entre si, ou seja, um incremento $B_q - B_r$ é indenpendente de outros incrementos $B_s - B_t$.

A última condição diz que cada incremento também é normal, com média zero e variância dada de acordo com o passo temporal, $2D(t-s)$, nos dando um desvio padrão proporcional à raiz quadrada do passo temporal.
