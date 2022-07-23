
@def title = "Processo estocástico Browniano"

# {{ get_title }}

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