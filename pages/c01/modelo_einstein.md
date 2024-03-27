@def title = "O modelo de Einstein para o movimento Browniano"

# {{ get_title }}

> "Each fine increment
>
> of their drawing
>
> delicate dance
>
> is a moment
>
> only chosen by some
>
> random form of order from
>
> the pattern of surrounding atoms."
>
> \- Myles Billard ("Dust", from ["Stochastic Reflections – Poems from the Mind"](https://sites.psu.edu/mylesbillard/stochastic-reflections-poems-from-the-mind/))

O trabalho de Einstein sobre movimento Browniano ([Einstein, A. (1905) Über die von der molekularkinetischen Theorie der Wärme geforderte Bewegung von in ruhenden Flüssigkeiten suspendierten Teilchen [On the movement of small particles suspended in stationary liquids required by the molecular-kinetic theory of heat]. Annals of Physics, 322, 549560](http://dx.doi.org/10.1002/andp.19053220806); veja tradução em [Einstein, A. (1956). Investigations on the Theory of Brownian Movement. New York: Dover](https://archive.org/details/investigationson00eins)) não é relevante apenas pelo fato de dar uma fundamentação física sólida para o movimento Browniano, mas também por ter levado a uma das primeiras provas concretas sobre a existência dos átomos. Os átomos, como partículas elementares constituintes da matéria, aparecem lá atrás com os filósofos gregos. Modelos mais concretos foram propostos a partir do século XIX, começando pelo modelo da bola de bilhar de Dalton, em 1808, seguido do modelo do pudim de passas de Thompson, em 1897, baseado em experimentos do próprio Thompson com descargas elétricas. Pouco antes dos trabalhos de Einstein e Thompson, já no final do século XIX, a teoria cinética dos gases nascia com Clausius, Maxwell e Boltzmann, com os átomos tendo um papel fundamental. Mas a existência dos átomos ainda não era amplamente aceita, possuindo muitos críticos renomados. A teoria de Einstein, conectando a teoria cinética dos gases ao movimento Browniano, criou um cenário plausível para se testar a existência dos átomos.

Em suas palavras:
> "In this paper it will be shown that, according to the molecular-kinetic theory of heat, bodies of a microscopically visible size suspended in liquids must, as a result of thermal molecular motions, perform motions of such magnitudes that they can be easily observed with a microscope. It is possible that the motions to be discussed here are identical with so-called Brownian molecular motion; however, the data available to me on the latter are so imprecise that I could not form a judgment on the question...." - A. Einstein, On the movement of small particles suspended in stationary liquids required by the molecular-kinetic theory of heat, Annals of Physics, 322.

## O modelo de Einstein

Podemos dizer que a teoria de Einstein para o movimento Browniano é composta de duas partes. Uma é um modelo probabilístico para o movimento de partículas microscópicas, supostamente devido a colisões com os átomos e moléculas do meio fluido em que a partícula se encontra em suspensão. A outra conectando mais precisamente esse movimento à teoria cinética dos gases, em particular à pressão osmótica gerada pela movimentação errática dos átomos e moléculas do meio, que por sua vez depende de vários parâmetros como a constante universal dos gases, a temperatura do fluido e o número e a massa dos átomos e moléculas em uma determinada porção do fluido.

No modelo probabilístico do movimento, Einstein considerou uma partícula em um movimento unidimensional, inicialmente, em uma posição denotada por $x = 0$. A partir daí, a partícula pode se deslocar para um lado ou para o outro, de maneira aleatória. A cada instante $t \geq 0$, temos uma *função densidade de probabilidades* $\rho(t, x)$, para a posição da partícula.

A regra para o movimento é que, entre instantes $t$ e $t + \tau$, para um dado intervalo de tempo característico $\tau$ fixado a priori, a partícula pode dar um passo espacial $\ell$ de tamanho arbitrário, para um lado ou para o outro, de acordo com uma certa densidade de probabilidades $g$. Essa densidade depende do passo $\tau$, mas essa dependência não aparece explicitamente, uma vez que $\tau$ está fixo na teoria do Einstein, como uma unidade de medida temporal.

Assume-se que essa densidade seja estacionária (independente do tempo), homogênea (independente da posição da partícula), isotrópica (independente da direção/sentido de movimento) e que os passos sejam independentes entre si (i.e. o passo num instante $s \geq t + \tau$ independe do passo dado em $t \geq 0$).

Um argumento a favor dessas hipóteses é dado por Richard Feynman, em suas notas de aula sobre [Movimento Browniano](https://www.feynmanlectures.caltech.edu/I_41.html). A cada segundo, cada molécula de água é bombardeada por outras moléculas de água em torno de $10^{14}$ vezes. Se tomarmos o passo de tempo característico $\tau$ como sendo da ordem de um milésimo de segundo, teremos em torno de $10^{11}$ colisões por unidade de tempo. É um número tão grande de colisões e as colisões são em direções completamente aleatórias que é razoável assumir que o efeito (momento ganho) de colisões em instantes anteriores seja "esquecido", ou seja, os passos, em instantes diferentes, sejam independentes entre si.

Assim, $\ell$ assume valores em $\mathbb{R}$ e $g$ é independente de $x$ e $t$, sendo portanto uma função apenas do passo, $g=g(\ell)$. Além disso, por ser uma distribuição de probabilidades, $g$ é não negativa e satisfaz $\int_{\mathbb{R}} g(\ell) \;\mathrm{d}\ell = 1$. Finalmente, da hipótese de isotropia, seque que $g$ é simétrica em relação à origem, i.e. $g(-\ell) = g(\ell)$.

Sendo $\rho(t, x)$ a função densidade de distribuição das partículas no instante $t$, uma expansão em série de Taylor nos dá, por um lado
$$
\rho(t + \tau, x) = \rho(t, x) + \tau \frac{\partial \rho}{\partial t}(x, t) + \mathcal{O}(\tau^2).
$$
Por outro lado, usando a densidade de probabilidades $g(\ell)$ do passo espacial, obtemos que
$$
\rho(t + \tau, x) = \int_{\mathbb{R}} \rho(t, x - \ell)g(\ell) \;\mathrm{d}\ell.
$$
Ou seja, a probabilidade da partícula estar em torno de $x$ no instante $t + \tau$ é dada pela superposição das probabilidades da partícula ter estado em $\rho(t, x - \ell)$ no instante $t$ e ter dado um passo $\ell$ para chegar em $x$.

Usando novamente expansão em série de Taylor, dessa vez na direção espacial, vemos que
$$
\rho(t, x - \ell) = \rho(t, x) - \frac{\partial \rho}{\partial x}(t, x)\ell + \frac{1}{2}\frac{\partial^2 \rho}{\partial x^2}(t, x)\ell^2 + \frac{1}{6}\frac{\partial^3 \rho}{\partial x^3}(t, x)\ell^3 + \mathcal{O}(\ell^4).
$$
Logo,
$$
\rho(t + \tau, x) = \int_{\mathbb{R}} \left(\rho(t, x) - \frac{\partial \rho}{\partial x}(t, x) \ell + \frac{1}{2}\frac{\partial^2 \rho}{\partial x^2}(t, x) \ell^2 + \frac{1}{6}\frac{\partial^3 \rho}{\partial x^3}(t, x)\ell^3 + \mathcal{O}(\ell^4) \right)g(\ell) \;\mathrm{d}\ell.
$$

Usando que $g$ é uma densidade de probabilidades e que é simétrica em relação a origem, temos
$$
\int_{\mathbb{R}} g(\ell) \;\mathrm{d}\ell = 1, \quad \int_{\mathbb{R}} \ell^{2n+1} g(\ell) \;\mathrm{d}\ell = \mathbb{E}(\ell^{2n + 1}) = 0, \forall n \in \mathbb{N}.
$$
Com isso, chegamos a
$$
\rho(t, x) + \tau \frac{\partial \rho}{\partial t}(x, t) + \mathcal{O}(\tau^2) = \rho(t, x)  + \frac{1}{2}\frac{\partial^2 \rho}{\partial x^2}(t, x) \int_{\mathbb{R}} \ell^2 g(\ell) \;\mathrm{d}\ell + \mathcal{O}(\mathbb{E}[\ell^4]).
$$
Ou seja,
$$
\frac{\partial \rho}{\partial t}(x, t) = D\frac{\partial^2 \rho}{\partial x^2}(t, x) + \mathcal{O}(\tau) + \mathcal{O}\left(\frac{\mathbb{E}[\ell^4]}{\tau}\right),
$$
onde
$$
D = \frac{1}{2\tau}\int_{\mathbb{R}} \ell^2 g(\ell) \;\mathrm{d}\ell = \frac{1}{2\tau}\mathbb{E}[\ell^2].
$$

Considerando uma escala de tempo relativamente pequena e assumindo $\mathbb{E}[\ell^4] / \tau$ relativamente pequeno, justificado pela hipótese dos passos de maior probabilidade serem relativamente pequenos, obtemos, aproximadamente, a equação de difusão
$$
\frac{\partial \rho}{\partial t}(x, t) = D\frac{\partial^2 \rho}{\partial x^2}(t, x).
$$
Como condição inicial, assumimos que a partícula parte da origem, ou seja, probabilidade $1$ de encontrar a partícula em $x = 0$. Dito de outra forma, temos que $p(0, x)$ é a delta de Dirac $\delta_0(x)$. O problema de valor inicial com condição inicial sendo a delta de Dirac nos dá a solução fundamental
$$
\rho(t, x) = \frac{1}{\sqrt{4\pi D t}} e^{\displaystyle -\frac{x^2}{4D t}}.
$$

Ou seja, lembrando que a distribuição normal $\mathcal{N}(0, \sigma^2)$ com média zero e variância $\sigma^2$ tem densidade de probabilidade
$$
\frac{1}{\sqrt{2\pi \sigma^2}} e^{-\displaystyle \frac{1}{2}\left(\frac{x}{\sigma}\right)^2},
$$
então, em qualquer instante $t$, a posição da partícula é dada de acordo com uma distribuição normal $\mathcal{N}(0, 2Dt)$, com média zero e variância $2Dt$.

## Distância quadrática média percorrida

Sendo $x \mapsto p(t, x)$ uma Gaussiana com variância $\sigma^2 = 2Dt$, a **distância quadrática média** percorrida pelas partículas, após um instante $t$, é exatamente esse desvio padrão:
$$
\sqrt{\mathbb{E}[X_t^2]} = \left( \int_{\mathbb{R}} x^2 p(t, x) \;\mathrm{d}x \right)^{1/2} = \sigma = \sqrt{2 D t}.
$$

Se, por outro lado, observarmos $\mathbb{E}[|x|]$, obtemos uma distância da mesma ordem: $\mathbb{E}[|x|] = 2\int_0^\infty x p(t, x) \;\mathrm{d}x = \sigma\sqrt{2/\pi}$.

Esse foi um dos resultados fundamentais obtidos por Einstein: a distância média percorrida pela partícula em um movimento Browniano é proporcional à raiz quadrada do tempo decorrido.

Isso acontece, nesse caso, pelo movimento frenético das partículas elementares do fluido. Um fenômeno macroscópico análogo acontece em escoamentos turbulentos, que pode ser apreciado no formato de rastros de fumaça em chaminés (pelo menos em condições onde movimentos advectivos não dominam).

## Conexão com difusão e a teoria molecular do calor

Baseado na teoria molecular do calor, providenciada pela teoria cinética dos gases, em que o calor é uma forma de energia associada ao movimento errático dos átomos, Einstein deduziu que uma porção de fluido exerce uma pressão osmótica $p$ da ordem de
$$
p = \frac{RT n}{NV},
$$
onde $R$ é a constante universal dos gases, $T$ é a temperatura; $V$ é o volume de uma porção do fluido; $n$ é o número de átomos/moléculas nesse volume; e $N$ é o número de moléculas em uma grama do fluido.

Em seguida, usando a teoria de difusão, Einstein argumentou que o coeficiente de difusão $D$ na equação do calor é dado por
$$
D = \frac{RT}{N}\frac{1}{6k\pi P},
$$
onde $k$ é o coeficiente de viscosidade do fluido e $P$ é o raio das moléculas do fluido, assumidas esféricas.

Assim, podemos escrever a distância quadrática média percorrida por uma partícula bombardeada pelas moléculas do fluido em um intervalo de tempo $t$ por
$$
\sqrt{\mathbb{E}[x^2]} = \sqrt{2 D t} = \sqrt{\frac{RT}{N}\frac{1}{3k\pi P} t}.
$$

Para concluir, Einstein argumenta que se tormarmos $N = 6 \times 10^{23}$ de acordo com a teoria cinética dos gases; em um meio aquoso a uma temperatura de $T = 17\deg C$, com viscosidade $k = 1.35 \times 10^2$ e o diâmetro das partículas de $0.001\;\texttt{mm}$, então o caminho quadrático médio percorrido é da ordem de $0.8\;\mu$, um pouco abaixo de um micron. O deslocamento médio em um minuto seria da ordem de seis microns.

Por outro lado, Einstein conclui que pode-se usar o cálculo desse deslocamento para se deduzir quanto seria $N$ no caso desse meio aquoso, ou de qualquer outro fluido, ao invés de se considerar o valor emprestado da teoria dos gases.

## Conexão com o modelo de Bachelier

Cinco anos antes de Einstein, [L. Bachelier, Théorie de la spéculation, Annales scientifiques de l'École Normale Supérieure, Serie 3, Volume 17 (1900), pp. 21-86](https://doi.org/10.24033/asens.476) obteve o mesmo modelo probabilístico, ou seja, a mesma densidade de probabilidade, na modelagem de mercados de ações, sujeito, também, a variações aleatórias independentes. Bachelier apresentou duas modelagens diferentes, uma semelhante à de Einstein e outra como um caminho aleatório, semelhante ao que veremos a seguir.

Uma diferença no primeiro modelo do Bachelier é que ele não diferencia a densidade de probabilidade $g=g(\ell)$ da probabilidade $\rho(t, x).$ De fato, observe que, graças as hipóteses de estacionaridade e de homogeneidade, vale
$$
    g(\ell) = \rho(\tau, \ell),
$$
ou seja, a (densidade de) probabilidade $(\rho(\tau, \ell))$ da partícula, que começou na origem, estar em $\ell$ após o tempo característico $\tau$ é a (densidede de) probabilidade $(g(\ell))$ da partícula dar o passo $\ell$, no tempo característico $\tau$. Assim, Bachelier escreve direto
$$
    \rho(t + \tau, x) = \int_{-\infty}^\infty \rho(\tau, \ell)\rho(t, x - \ell)\;\mathrm{d}\ell.
$$

Em seguida, ele procura direto uma solução dessa equação integral na forma de um processo Gaussiano e, assim, chega em uma solução da mesma forma, exceto com parâmetros diferentes, i.e.
$$
    \rho(t, x) = \frac{1}{2\pi k \sqrt{t}} e^{- \frac{x^2}{4\pi k^2 t}},
$$
para uma determinada constante $k$. Vale ressaltar que essa não é a única solução da equação integral acima. De fato, essa equação vale de forma geral, para qualquer processo Markoviano, e é, no fundo, uma versão da equação conhecida atualmente como equação de Chapman-Kolmogorov. Veja mais detalhes na seção sobre o modelo de Bachelier.

## Incrementos

Em um instante $t$, a distribuição normal $\mathcal{N}(0, 2Dt)$ nos dá a probabilidade de encontrarmos a partícula em uma determinada posição (tendo ela partido de $x = 0$ em $t = 0$). Mas dada a posição da partícula no instante $t$, a posição dessa partícula em um instante $t + \Delta t$, com $\Delta t > 0$ não é dada por $\mathcal{N}(0, 2D(t+\Delta t))$ pura e simplesmente. Temos, na verdade, uma probabilidade condicionada. No modelo, isso se reflete nas hipóteses de homogeneidade espacial e temporal. Assim, conhecendo-se $X_t = x$, temos que a posição futura da partícula será dada por
$$
\mathbb{P}(X_{t + \Delta t} | X_t = x) = \mathcal{N}(x, 2D\Delta t) = x + \mathcal{N}(0, 2D\Delta t),
$$
ou seja, o incremento é dado por
$$
\Delta X = X_{t + \Delta t} - X_t \sim \mathcal{N}(0, 2D\Delta t).
$$

```julia:pathWn
#hideall
using Plots
using Random
theme(:ggplot2)
rng = Xoshiro(123)
n = 2^12
plt = plot(title="Amostras de movimentos Brownianos", titlefont = 10, xaxis = "\$t\$", yaxis = "\$X\$", ylims = (-2, 2), linestyle = :dot, marker = :circle, markersize = 3, label = false, size = (800, 500))

tn = [j/n for j in 0:n]
steps = randn(n)
Xn = [0; cumsum(steps)] ./ sqrt(n)
for _ in 1:10
  plot!(tn, Xn, label=nothing, alpha=0.2, color=1)
  randn!(steps)
  Xn .= [0; cumsum(steps)] ./ sqrt(n)
end
plot!(tn, Xn, label="sample path", color=2)

savefig(joinpath(@OUTPUT, "pathWn.svg"))
```
\fig{pathWn}

Em um certo sentido, que veremos mais adiante de forma mais rigorosa, através da *isometria de Itô*, é como se $\Delta X \sim \sqrt{\Delta t}$, ou $\Delta X^2 \sim \Delta t$, com passos independentes. Assim, após $n$ passos $\Delta X_i,$ $i=1, \ldots, n,$ até um ponto $t_n = n\Delta t$, temos a posição $x = x_n$ dada por
$$
\mathbb{E}[X_t^2] = \mathbb{E}\left[\left(\sum_{i=1}^n \Delta X_i\right)^2\right] = \sum_{i=1}^n \sum_{j=1}^n \mathbb{E}\left[\Delta X_i \Delta X_j \right] = \sum_{i=1}^n \mathbb{E}\left[\Delta X_i^2\right] \sim \sum_{i=1}^n \Delta t = t.
$$

## Paradoxo da velocidade infinita de deslocamento

Em um determinado intervalo curto de tempo, podemos ter passos arbitrariamente grandes, levando a partícula a distâncias sem limite. Vimos acima, um resultado a respeito da distância quadrática *média* percorrida por uma partícula, mas nada impede que existam algumas partículas que se movam arbitrariamente rápido. Algo contra-intuitivo.

## Regularidade dos caminhos amostrais

O que salva é que esses possíveis caminhos são raros. De fato, o modelo de Einstein nos garante que, quase sempre, ou seja, com probabilidade um, os caminhos são Hölder contínuos, com expoente próximo de 1/2. Ou seja, probabilidade nula de "observarmos" caminhos descontínuos.

Um caminho amostral $t \rightarrow x(t, \omega)$, em um intervalo $t\in I$, é Hölder contínuo com expoente $\theta > 0$ quando existe $C>0$ tal que
$$
  |x(s, \omega) - x(t, \omega)| \leq C|s - t|^\theta,
$$
para todo $s, t \in I$. O conjunto de caminhos Hölder-contínuos com expoente $\theta$ é a união, em $C > 0$, dos caminhos satisfazendo a desigualdade acima. Os caminhos que não são Hölder-contínuos com expoente $\theta$ pertencem à interseção dos complementos dos caminhos satisfazendo a desigualdade acima.

Vamos considerar $I=[0, T]$, $T > 0$, e estimar a probabilidade de termos uma relação como a acima, em um dado instante fixo $0 \leq t < T$ para qualquer passo $\Delta t > 0$, com $0 \leq t < t + \Delta t \leq T$:
$$
  |\Delta x(t, \omega)| = |x(t + \Delta t, \omega) - x(t, \omega)| \leq C\Delta t^\theta.
$$
Mais precisamente, queremos estimar a probabilidade de termos um caminho com algum passo não satisfazendo essa desigualdade:
$$
  \mathbb{P}\left(|\Delta X_t| \geq C\Delta t^\theta\right).
$$

Temos,
$$
  \mathbb{P}\left(|\Delta X_t| \geq C\Delta t^\theta)\right) = \int_{|\Delta x| \geq C\Delta t^\theta} p(\Delta t, \Delta x) \;\mathrm{d}\Delta x
  \leq \int_{|\Delta x| \geq C\Delta t^\theta} \frac{|\Delta x|^2}{C^2\Delta t^{2\theta}} p(\Delta t, \Delta x) \;\mathrm{d}\Delta x \\
  \leq \frac{1}{C^2\Delta t^{2\theta}}\int_{|\Delta x| \geq C\Delta t^\theta} |\Delta x|^2 p(\Delta t, \Delta x) \;\mathrm{d}\Delta x
  \leq \frac{1}{C^2\Delta t^{2\theta}} \mathbb{E}[\Delta X_t^2]
  \leq \frac{2D\Delta t}{C^2\Delta t^{2\theta}}.
$$
Usamos, acima, uma desigualdade chamada de **desigualdade de Chebyshev**, explorando a condição $|\Delta x| \geq C\Delta t^\theta$ para escrever $1 \leq |\Delta x| / C\Delta t^\theta \leq |\Delta x|^2 / C^2\Delta t^{2\theta}$ e, em seguida, a finitude da distância quadrática média.

Assim,
$$
  \mathbb{P}\left(|\Delta X_t| \geq C\Delta t^\theta\right) \leq \frac{2D\Delta t^{1-2\theta}}{C^2} \rightarrow 0, \quad C \rightarrow \infty.
$$

Com base nisso, usando a **propriedade de continuidade por cima** de uma probabilidade (i.e. se $E_n$ são decrescentes, então $\mathbb{P}(\cap_n E_n) = \lim_n \mathbb{P}(E_n)$), podemos tirar
$$
  \mathbb{P}\left(\frac{|\Delta X_t|}{\Delta t^\theta} < \infty\right) = \mathbb{P}\left(\bigcup_{C > 0} \frac{|\Delta X_t|}{\Delta t^\theta} < C\right) = 1 - \mathbb{P}\left(\bigcap_{C > 0} \frac{|\Delta X_t|}{\Delta t^\theta} \geq C\right) \\ = 1 - \lim_{C\rightarrow \infty} \mathbb{P}\left(\frac{|\Delta X_t|}{\Delta t^\theta} \geq C\right) = 1.
$$

Ou seja, quase sempre, teremos ${|\Delta X_t|}/{\Delta t^\theta}$ limitado, portanto existindo $C > 0$ tal que $|x(t + \Delta t, \omega) - x(t, \omega)| = |\Delta x(t, \omega)| \leq C \Delta t^\theta $.

O argumento acima, na verdade, não é uma demonstração completa, pois a desigualdade de Hölder deve valer para *quase todo* $t$ e para $\Delta t$ arbitrariamente pequeno (essa última condição é que força que $0<\theta \leq 1/2$, para termos $\Delta t^{1-2\theta} \leq h^{1-2\theta}$, para todo $\Delta t$ menor que um certo $h>0$ fixo). De qualquer forma, a estimativa acima é a ideia principal que garante esse resultado. Esse resultado pode ser visto como um caso particular do **Teorema de Continuidade de Kolmogorov**, que mencionaremos novamente ao falarmos de processos estocásticos.

## Exercícios

1. Considere a versão tridimensional do modelo de Einstein, onde $\mathbf{x} = (x, y, z) \in \mathbb{R}^3$ e os passos $\boldsymbol{\ell} = (\ell_x, \ell_y, \ell_z) \in \mathbb{R}^3$ são dados de acordo com uma distribuição de probabilidades $g = g(\boldsymbol\ell)$ que é estacionária, homogênea e isotrópica, com passos independentes. Mostre que a densidade de probabilidades $p(t, \mathbf{x}) = p(t, x, y, z)$ da posição da partícula satisfaz a equação de difusão
$$
\frac{\partial p}{\partial t} = D \Delta p,
$$
onde $\Delta = \partial_x^2 + \partial_y^2 + \partial_z^2$ é o operador Laplaciano em três dimensões, $|\mathbf{x}| = \sqrt{x^2 + y^2 + z^2}$ e $D$ é definido de forma análoga ao caso unidimensional, mas envolvendo uma integral tripla. Sua solução também nos dá distribuições normais para a posição da partícula em cada tempo, com média zero e desvio padrão $2Dt$:
$$
p(t, \mathbf{x}) = \frac{1}{(4\pi D t)^{3/2}} e^{\displaystyle -\frac{|\mathbf{x}|^2}{4Dt}}.
$$
Mostre, ainda, que a distância média percorrida satisfaz
$$
\sqrt{\mathbb{E}[|X_t|^2]} = 6Dt.
$$