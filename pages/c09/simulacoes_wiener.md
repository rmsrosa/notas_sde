@def title = "Simulações de processos de Wiener e browniano geométrico"

# {{ get_title }}

Nas simulações numéricas de equações estocásticas, via método de Monte-Carlo (i.e. simulando vários caminhos amostrais), precisamos, em particular, simular processos de Wiener. O mesmo acontece em equações diferenciais aleatórias, quando os parâmetros são funções explícitas de um processo de Wiener.

A observação importante é que, a menos de erros de arredondamento para ponto flutuante e de erros na geração de números aleatórios (que na prática são pseudo aleatórios), um processo de Wiener $\{W_t\}_{t \geq 0}$ pode ser expresso de maneira exata, ao longo dos pontos de uma malha temporal.

O mesmo acontece ao utilizarmos um movimento browniano geométrico, uma ponte browniana ou qualquer outro processo para o qual conhecemos explicitamente a solução.

## Simulando um processo de Wiener

Ao considerarmos uma malha $0 = t_0 < t_1 < \ldots < t_n = T$, por exemplo, começamos com
$$
W_0^n = 0,
$$
que é exato, pois $W_0 = 0$. No próximo ponto, temos
$$
W_{t_1} = W_{t_1} - W_0 \sim \mathcal{N}(0, t_1) = \sqrt{t_1} \mathcal{N}(0, 1).
$$
Considerando uma variável aleatória normal padrão $Z_{t_1} \sim \mathcal{N}(0, 1)$, podemos escrever
$$
W_{t_1} = W_{t_1} + \sqrt{t_1} Z_1.
$$

No ponto seguinte, temos, da mesma forma,
$$
W_{t_2} - W_{t_1} \sim \mathcal{N}(0, t_2 - t_1) = \sqrt{t_2 - t_1}\mathcal{N}(0, 1).
$$
Considerando uma variável aleatória normal padrão $Z_{t_2} \sim \mathcal{N}(0, 1)$ independente de $Z_1$, podemos escrever
$$
W_{t_2} = W_{t_1} + \sqrt{t_2 - t_1}Z_{t_2}.
$$
E assim sucessivamente. Consideramos variáveis aleatórias $Z_{t_j}$. $j = 1, \ldots, n$, com $Z_{t_j}$ independente de $Z_{t_1}, \ldots, Z_{t_{j-1}}$, e obtemos
$$
W_{t_j} = W_{t_{j-1}} + \sqrt{t_j - t_{j-1}}Z_{t_j}, \quad j = 1, \ldots, n.
$$

Essa é uma representação exata. As variáveis aleatórias $Z_{t_j}$ formam um processo discreto $\{Z_{t_j}\}_{j = 1}^n$ que é uma cadeia de Markov, por conta da independência do passado distante. Na verdade, ela independente até do instante imediatamente anterior.

Assim, ao definirmos tomarmos amostras $Z_{t_j}(\omega)$ dessas normais e definirmos a sequência
$$
W_0^n(\omega) = 0, \quad 
W_{t_j}^n(\omega) = W_{t_{j-1}}^n(\omega) + \sqrt{t_j - t_{j-1}}Z_{t_j}(\omega), \quad j = 1, \ldots, n,
$$
estamos, efetivamente, calculando uma *discretização* exata de um caminho amostral de um processo de Wiener. Da mesma forma que os pontos $\{\sin(j\pi/n)\}_{j=0, \ldots, n}$ formam uma discretização exata da função $\sin(x)$, no intervalo $[0, \pi]$.

Os únicos erros possíveis são os erros de arredondamente em ponto flutuante, ao calcularmos $W_{t_{j-1}}^n(\omega) + \sqrt{t_j - t_{j-1}}Z_{t_j}$ e os erros na geração da sequência de números aleatórios $Z_{t_j}(\omega)$, visto que os números gerados são pseudo aleatórios e não são amostras de uma variável verdadeiramente normal.

De qualquer forma, ao analisarmos a convergência de métodos de aproximação de equações estocásticas e de equações aleatórias que envolvam um processo de Wiener, não precisamos considerar, em um primeiro momento, esses erros de arredontamento e de geração de números pseudo-aleatórios e podemos assumir que a sequência gerada $\{W_{t_j}^n(\omega)\}_{j = 0}^n$ é uma discretização exata do processo de Wiener usado na definição da equação em questão.

Mais ainda. Se tivermos uma sequência $\{W_{t_j}^n\}_{j = 0}^n$ e quisermos estender essa sequência a uma malha mais fina, podemos utilizar o procedimento feito na demonstração de existência de um processo de Wiener. Não precisamos refazer todo o processo. Basta introduzir novos pontos, de acordo com uma média ponderada entre as variáveis na malha mais grossa e acrescentar um múltiplo apropriado de uma normal padão associada ao ponto intermediário. As contas são facilitadas no caso de uma malha uniforme e de um refinamento dobrando o número de pontos, mas isso não é necessário. Qualquer refinamento pode ser considerado.

## Simulando um movimento browniano geométrico

A solução $\{X_t\}_{t\geq 0}$ do movimento browniano geométrico, dado por
$$
\mathrm{d}X_t = \mu X_t \;\mathrm{d}t + \sigma X_t \;\mathrm{d}W_t,
$$
com uma condição inicial $X_t|_{t = 0} = X_0$, é conhecida explicitamente, pela fórmula
$$
X_t = X_0 e^{\displaystyle \left(\mu - \frac{\sigma^2}{2}\right)t + \sigma W_t}.
$$

Assim, uma vez de posse de uma amostra discreta exata $\{W_{t_j}^n\}_{j = 0}^n$ de um processo de Wiener em pontos de uma malha $0 = t_0 < t_1 < \ldots < t_n = T$, podemos obter uma amostra discreta exata do movimento browniano através de
$$
X_{t_j}^n = X_0 e^{\displaystyle \left(\mu - \frac{\sigma^2}{2}\right)t_j + \sigma W_{t_j}}.
$$

Mais precisamente, se $\{W_{t_j}(\omega)\}_j$ é uma amostra discreta de um determinado caminho amostral do processo de Wiener, então sorteando uma condição inicial $X_0(\omega)$, obtemos uma amostra discreta de um caminho amostral do movimento browniano geométrico, através de
$$
X_{t_j}^n(\omega) = X_0(\omega) e^{\displaystyle \left(\mu - \frac{\sigma^2}{2}\right)t_j + \sigma W_{t_j}(\omega)}.
$$
Isso pode, também, ser feito recursivamente, na forma
$$
X_{t_j}^n(\omega) = X_{t_{j-1}}^n(\omega) e^{\displaystyle \left(\mu - \frac{\sigma^2}{2}\right)(t_j-t_{j-1}) + \sigma \Delta W_j(\omega)},
$$
onde
$$
\Delta W_j = W_{t_j} - W_{t_{j-1}}.
$$
