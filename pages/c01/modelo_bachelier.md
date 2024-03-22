@def title = "O modelo de Bachelier para o mercado de opções"

# {{ get_title }}

> "No scientific discovery is named after its original discoverer" (Stiglers law of eponymy) - Gieryn, T. F., ed. (1980). Science and social structure: a festschrift for Robert K. Merton. New York: NY Academy of Sciences. pp. 147.

Louis Bachelier, cinco anos antes do ano miraculoso de Einstein, publicou a sua tese [L. Bachelier, Théorie de la spéculation, Annales scientifiques de l'École Normale Supérieure, Serie 3, Volume 17 (1900), pp. 21-86](https://doi.org/10.24033/asens.476) sobre precificação de opções, incluindo o que pode ser visto como uma versão em finanças do movimento Browniano.

Bachelier teve como professores matemáticos ilustres como Emile Picard, Joseph Boussinesq e Henri Poincaré, este último seu orientador de doutorado, na Sorbonne, e com quem aprendeu o cálculo de probabilidades. Além disso, tinha a sua própria experiência no mercado financeiro. De Boussinesq, herdou o conhecimento de mecânica dos fluidos, como ilustra o título da sua segunda tese "Résistance d'une masse liquide indéfinie pourvue de frottements int́erieurs, régis par les formules de Navier, aux petits mouvements variés de translation d'une sphère solide, immergée dans cette masse et adhérente à la couche fluide qui la touche".

Em sua tese, Bachelier considerou as flutuações no mercado de ações. Segundo Bachelier, as pequenas flutuações no preço observadas em curtos intervalos de tempo são independentes do preço no momento. Implicitamente, também assume que essas flutuações são independentes das flutuações passadas e que são identicamente distribuídas. Dessa forma, Bachelier deduz que os incrementos têm uma distribuição Normal.

Bachelier apresentou, na verdade, duas deduções diferentes, uma semelhante à de Einstein e outra como um caminho aleatório. Em relação ao argumento via caminho aleatório, Mark Davies menciona, em  [Louis Bachelier's Theory of Speculation: The Origins of Modern Finance, Louis Bachelier, Edited and translated by Mark Davis, Alison Etheridge](https://www.jstor.org/stable/j.ctt7scn4), que Bachelier obteve, assim, o movimento Browniano como limite difusivo de caminhos aleatórios. Uma demonstração mais rigorosa do processo de limite do discreto para o contínuo, no entanto, só aparece nos trabalhos de Kolomogorov, em 1931, que reconhece a influência de Bachelier.

Em relação ao primeiro modelo, ao qual o modelo de Einstein se assemelha, Bachelier considera a densidade de probabilidade $p(t, x)$ para o preço de uma ação no tempo $t$ e valor $x$, como feito posteriormente por Einstein para a posição de uma partícula. Uma diferença, no entanto, é que ele não desconecta a densidade de probabilidade $g=g(\ell)$, considerada por Einstein para os passos de comprimento $\ell$ ao longo de um tempo característico $\tau,$ da própria densidade de probabilidade da partícula, ou melhor, do preço. Mais precisamente, observe que um passo $\ell$ do instante $0$ ao instante $\tau$ nos leva à densidade $p(\tau, \ell)$ no instante $\tau$ e posição $\ell,$ i.e.
$$
    g(\ell) = \rho(\tau, \ell).
$$
Em outras palavras, a (densidade de) probabilidade $(\rho(\tau, \ell))$ da partícula, que começou na origem, estar em $\ell$ após o tempo característico $\tau$ é a (densidade de) probabilidade $(g(\ell))$ da partícula dar o passo $\ell$, no tempo característico $\tau$. Da mesma forma para o preço de uma ação. Assim, Bachelier escreve direto
$$
    p(t + \tau, x) = \int_{-\infty}^\infty p(\tau, \ell)p(t, x - \ell)\;\mathrm{d}\ell.
$$
A partir desse ponto, no entanto, ele *não* faz propriamente uma aproximação de Taylor para chegar a uma equação diferencial para $p$. Ele observa diretamente que uma Gaussiana apropriada resolve a equação e prossegue para achar os parâmetros apropriados da Gaussiana, chegando a uma solução da mesma  forma, exceto com parâmetros diferentes, i.e.
$$
    p(t, x) = \frac{1}{2\pi k \sqrt{t}} e^{- \frac{x^2}{4\pi k^2 t}},
$$
para uma determinada constante $k$.

No entanto, ele justifica essa solução Gaussiana de outras formas, incluindo via passeio aleatório; via teoria de radiação de Kirchhoff, que o leva de uma forma ou de outra à equação do calor de Fourier; e via argumentos semelhantes ao do Teorema Central do Limite.

Em particular, Bachelier é creditado também pela própria equação integral acima, que é vista como uma versão da equação conhecida atualmente como equação de Chapman-Kolmogorov para a distribuição conjunta de probabilidades. De fato, podemos escrever a relação de forma condicionada a sabermos $x_0$ em um instante $t_0,$ i.e.
$$
    p(t + \tau, x | t_0, x_0) = \int_{-\infty}^\infty p(t + \tau, x | t, x - \ell) p(t, x - \ell | t_0, x_0)\;\mathrm{d}\ell.
$$
No caso do movimento Browniano, temos $x_0 = 0,$ em $t_0 = 0$, mas a relação vale de forma geral. Essa equação vale, de fato, para qualquer processo Markoviano. A Gaussiana não é a única solução possível. Mas é uma solução, encontrada por Bachelier. E como dito acima, a Gaussiana é também justificada por outras razões.

Conta a história que a tese de Bachelier foi um pouco criticada por não ser muito rigorosa e por ser em uma área pouco familiar para os matemáticos da época. Mas Poincaré o apoiou, apreciando e valorizando vários aspectos do seu trabalho. O seu impacto no desenvolvimento da Teoria das Probabilidades e na Análise Estocástica acabou se mostrando significativo nas décadas seguintes. Já o seu impacto em finanças veio apenas bem mais tarde, quando os seus trabalhos chegaram ao conhecimento do economista Paul Samuelson, na década de 1960.
