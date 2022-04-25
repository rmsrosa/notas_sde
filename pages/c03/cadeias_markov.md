@def title = "Cadeias de Markov"

# {{ get_title }}

**Cadeias de Markov**, também chamadas de **processos de Markov**, são processos estocásticos em que a mudança de estado para um estado futuro, conhecendo-se o estado atual, não depende dos estados passados. Mais precisamente, se $\{X_t\}_{t\in I}$ é um processo aleatório e $t_1 < t_2 < \ldots < t_n < t_{n+1}$ pertencem a $I$, então, dados $X_{t_1} = x_1, X_{t_2} = x_2, \ldots, X_{t_n} = x_n$, temos que $X_{t_{n+1}}$ só depende de $X_{t_n}$, ou seja
$$
\mathbb{P}(X_{t_{n+1}} = x | X_{t_1} = x_1, X_{t_2} = x_2, \ldots, X_{t_n} = x_n) = \mathbb{P}(X_{t_{n+1}} = x | X_{t_n} = x_n).
$$
Processos de Markov são chamados de *sem memória*. Estados futuros são determinados pelo estada atual, independentemente dos estados assumidos no passado. Processos de Markov podem ser contínuos ou discretos e o espaço de estados também pode ser contínuo ou discreto.

O processo de Bernoulli é um exemplo trivial de uma cadeia de Markov discreta. O passeio aleatório é outro exemplo. O modelo de Einstein para o movimento Browniano, por sua vez, é um exemplo de um processo de Markov contínuo. Já o modelo da urna sem recomposição, como tratado anteriormente, não é uma cadeia de Markov, já que cada passo depende do estado do sistema em todos os passos anteriores.

## Revisitando o problema da urna

Conforme formulado inicialmente, o problema da urna não é uma cadeia de Markov. Mas podemos modelar o problema de outra forma, para que seja uma cadeia de Markov. Lembramos que começamos com $N$ bolinhas de cada cor. Podemos denotar por $X_n$ o *total* de bolinhas vermelhas retiradas da urna *até* o passo $n$, inclusive. Para o passo $n + 1$, só há duas possibilidades: $X_{n + 1} = X_n + 1$, caso uma bolinha vermelha seja retirada, ou $X_{n + 1} = X_n$, caso a bolinha retirada seja da cor preta. Todos os outros estados tem probabilidade nula de ocorrer.

Observe que, inicialmente, temos um total de $2N$ bolinhas. Após $n$ retiradas, sobram $2N - n$ bolinhas. Por sua vez, inicialmente temos $N$ bolinhas de cada cor. Após retirarmos $X_n$ bolinhas vermelhas, temos $N - X_n$ vermelhas restantes. As outras $(2N - n) - (N - X_n) = N - n + X_n$ são bolinhas pretas. Assim, podemos expressar as probabilidades de cada uma das duas realizações possíveis na forma
$$
\mathbb{P}(X_{n + 1} = X_n + 1) = \frac{N - X_n}{2N - n},
$$
e
$$
\mathbb{P}(X_{n + 1} = X_n + 1) = \frac{N - n + X_n}{2N - n}.
$$

## Probabilidades de transição 

Quando temos um número discreto de estados possíveis, podemos determinar a evolução do processo em termos das probabilidades do sistema ir de um estado $i$, no instante $n$, para um estado $j$, no instante $n+1$. Isso nos leva a definir as **probabilidades de transição**
$$
  p_{ij}^n = \mathbb{P}(X_{n+1} = j | X_n = i).
$$

O processo é **temporalmente homogêneo** quando as probabilidades de transição são independentes do parâmetro, i.e. $p_{ij}^n = p_{ij}$ independe de $n$.

Quando o conjunto de possíveis estados é finito, isso nos dá uma **matriz de transição**,
$$
P_n = (p_{ij}^n).
$$

Observe que cada *linha* da matriz de transição deve ter soma igual a
$$
\sum_j p_{ij} = 1, \qquad \forall j.
$$

No caso de um processo de Bernoulli com estados $\{1, 0\}$ (e.g. sucesso e fracasso) ocorrendo com probabilidades $p$ e $1 - p$, respectivamente, temos a matriz de transição
$$
P_n = P = \left[ \begin{matrix} p & 1 - p \\ p & 1 - p \end{matrix} \right].
$$

No caso do passeio aleatório, temos um espaço de estados enumerável, $\Omega = \mathbb{Z}$, e as probabilidades de transição são
$$
p_{ij} = \mathbb{P}(X_{n+1} = j | X_n = i) = \begin{cases} 1/2, & j = i \pm 1, \\ 0, & \text{caso contrário} \end{cases}.
$$

## Previsão ingênua de tempo

Vamos imaginar, agora, um problema de previsão de tempo, em que classificamos o tempo em três estados: "ensolarado", "nublado" e "chuvoso". Seja $X_n$ o estado do sistema no $n$-ésimo dia, com $1$, $2$ e $3$ indicando cada um desses possíveis estados, respectivamente.

Vamos assumir que, a partir de uma "análise criteriosa do histórico do clima em uma determinada região e uma determinada época", observamos que, em média, após um dia ensolarado, temos 70% de chances de termos outro dia ensolarado, 20% de termos um dia nublado e 10% de termos um dia chuvoso. Após um dia nublado, as chances são de 30%, 40%, 30%, respectivamente. E após um dia chuvoso, as chances são de 20%, 40% e 40%.

Como temos um número finito de estados e as probabilidades de transição são estacionárias, podemos definir a matriz de transição de estados $P = (p_{ij})_{ij}$ por
$$
p_{ij} = \mathbb{P}(X_{n+1} = j | X_n = i)
$$
No nosso caso, temos
$$
P = \left[ \begin{matrix} 0.7 & 0.2 & 0.1 \\ 0.3 & 0.4 & 0.3 \\ 0.2 & 0.4 & 0.4 \end{matrix} \right]
$$

Sabendo-se a distribuição de probabilidades representadas por um vetor linha $X_n \sim w = [p1, p2, p3]$, $p_i \geq 0$, $p_1 + p_2 + p_3 = 1$ no instante $n$, as probabilidades no instante $X_{n + 1}$ são dadas por
$$
X_{n + 1} \sim w P = ( P^t w^t)^t.
$$

Previsões de longo prazo podem ser feitas iterando-se a matriz de transição:
$$
X_{n+k} \sim wP^k, \quad k = 1, 2, \ldots.
$$
Por exemplo, se em determinado momento $n$ temos $X_n = 1$, ou seja, temos um dia ensolarado, representado pelo vetor probabilidade $w = [1, 0, 0]$, então daqui a dois dias teremos
$$
X_{n+2} \sim w P^2 = \left( \left[ \begin{matrix} 0.57 & 0.39 & 0.17 \\ 0.26 & 0.44 & 0.36 \\ 0.17 & 0.27 & 0.3 \end{matrix} \right] \left(\begin{matrix} 1 \\ 0 \\ 0 \end{matrix}\right) \right)^t = \left(\begin{matrix} 0.57 \\ 0.26 \\ 0.17 \end{matrix}\right)^t = [0.57, 0.26, 0.17],
$$
ou seja, $57\%$ de termos um dia ensolarado, $13\%$ de termos um dia nublado e $17\%$ de termos um dia chuvoso.

## Distribuições estacionárias de processos temporalmente homogêneos

No caso de um processo temporalmente homogêneo em um espaço de eventos finito $\{1, \ldots, J\}$, a matriz de transição $P$ é independente do parâmetro temporal. Além disso, como as linhas somam $1$, a matriz tem necessariamente um autovalor igual a $1$, com autovetor com todos os coeficientes iguais a $1$. De fato,
$$
P \left(\begin{matrix} 1 \\ \vdots \\ 1 \end{matrix}\right) = \left(\begin{matrix} \sum_{j=1}^J p_{1j} \\ \vdots \\ \sum_{j=1}^J p_{Jj} \end{matrix}\right) = \left(\begin{matrix} 1 \\ \vdots \\ 1 \end{matrix}\right),
$$
Em particular, $\det(P - I) = 0$, portanto $\det(P^t - I) = \det(P - I) = 0$ e $P^t$ também possui um autovalor igual a $1$.

Isso implica na existência de (pelo menos) um vetor linha $v=[v_1, \ldots, v_J]$ tal que $v^t$ seja um autovetor de $P^t$ associado ao autovalor $1$ e com norma $1$, i.e. $P^t v^t = v^t$, ou seja
$$
vP = v,
$$
e tal que $v_1 + \ldots + v_J = 1$. Isso nos dá uma distribuição estacionária
$$
\mathbb{P}(X_n = i) = v_i.
$$
Por exemplo, no caso da previsão ingênua de tempo, 
$$
P^t = \left[ \begin{matrix} 0.7 & 0.3 & 0.2 \\ 0.2 & 0.4 & 0.4 \\ 0.1 & 0.3 & 0.4 \end{matrix} \right]
$$
Os autovalores são aproximadamente $0.0438$, $0.4562$ e $1$. O autoespaço associado ao autovalor $1$ é
$$
V_1 = \{(6s, 4s, 3s); \;s\in \mathbb{R}\}.
$$
O autovalor com elementos não negativos e com norma $1$ é
$$
v = \frac{1}{13}[6, 4, 3] \approx [0.4615, 0.3077, 0.1338].
$$
Assim, a distribuição com probabilidades de aproximadamente $46,15\%$ de sol, $30,77\%$ de nuvens e $13,38\%$ de chuva é uma distribuição estacionária. (Ela está associada a média de dias ensolarados, nublados e chuvosos coletados para a análise). Ou seja, se em um determinado dia essas são as probabilidades para a previsão para o dia seguinte, então as previsões a longo prazo serão iguais a essa. Podemos interpretar $v$ como sendo essa lei de distribuição de probabilidades.

Como, nesse caso, há um único autovalor igual a $1$ e os outros dois são estritamente menores do que $1$, então a previsão "assintótica" é igual a essa obtida pela análise de autovalores: $\lim_{k\rightarrow \infty} wP^{n + k} \sim v$.

Além de, necessariamente, ter um autovalor igual a $1$, qualquer matriz de transição tem autovalores com valor absoluto entre $0$ e $1$, mas eles podem ser negativos ou complexos.

## Exercícios

1. Qualquer matriz cujos elementos sejam não negativos e cujas linhas tenham soma igual a $1$ define um processo de Markov. Tais matrizes são chamadas de **matrizes de Markov**. Encontre os autovalores das seguintes matrizes de Markov, observando que podemos ter (a) autovalores nulos; (b) autovalores negativos; (c) mais de um autovalor igual a $1$; e (d) autovalores complexos conjugados:
$$
\textrm{(a) } P = \left[ \begin{matrix} 1 & 1 \\ 0 & 0 \end{matrix} \right], \qquad
\textrm{(b) } P = \left[ \begin{matrix} 0 & 1 \\ 1 & 0 \end{matrix} \right]
$$
$$
\textrm{(c) } P = \left[ \begin{matrix} 1 & 0 \\ 0 & 1 \end{matrix} \right], \qquad
\textrm{(d) } P = \left[ \begin{matrix} 0 & 1 & 0 \\ 0 & 0 & 1 \\ 1 & 0 & 0\end{matrix} \right]
$$

2. Mostre que quando $1$ é o único autovalor com valor absoluto igual a $1$, de uma matriz de Markov $P$, então $uP^k$ converge para um autovetor associado a esse autovalor. Se o autoespaço desse autovalor tiver dimensão um, então esse limite independe do vetor inicial $u$, desde que ela esteja associada a uma distribuição de probabilidades, ou seja, que seja um vetor com norma $1$.

3. Encontre os autoespaços associados aos autovalores das matrizes (c) e (d) do exercício acima, obtenha as distribuições de probabilidade associadas a esses autovalores e observe que existem distribuições cíclicas, ou seja, que se repetem após dois ou mais passos.
