@def title = "Convergências forte e fraca"

# {{ get_title }}

> "Whereas weak convergence measures the 'error of the means,' strong convergence measures the 'mean of the errors.'" - D. J. Higham & P. E. Kloeden, in *An Introduction to the Numerical Simulation of Stochastic Differential Equations,* (SIAM, 2021).

Processos estocásticos são famílias de variáveis aleatória e qualquer noção de convergência de variáveis aleatórias pode ser utilizada para analisar a convergência de processos estocásticos. No estudo da convergência de métodos numéricos para equações aleatórias e estocásticas, no entanto, uma noção é particularmente utilizada, que é a de convergência em média, que é a convergência do valor esperado do erro absoluto, também conhecida aqui como *convergência forte* (mas que é diferente da noção de convergência forte de variáveis aleatórias, que diz respeito à convergência quase certamente).

Uma outra noção de convergência que não nos dá, exatamente, uma convergência de variáveis aleatórias é a chamada *convergência fraca*, que diz respeito apenas à convergência do valor esperado. A distribuição de probabilidades, em si, pode não convergir.

Associadas a essas convergências, uma outra questão importante é sobre a *taxa* de convergência, ou seja, quão rápida se dá a convergência. Vejamos, aqui, mais detalhes sobre essas noções.

## Convergência forte

Dado um processo contínuo $\{X_t\}_{t \in [0, T]}$ e uma aproximação discreta $\{X_n^{\mathrm{\Delta t}}\}_n$ em instantes $t_j = j \Delta t$, $\Delta t = T/n$, o **erro forte**, ou **erro médio,** é dado por
$$
e_{\Delta t}^{\mathrm{forte}} = \max_{n} \mathbb{E}[|X_{t_n} - X_n^{\mathrm{\Delta t}}|].
$$

Dizemos que o método numérico **converge fortemente** quando
$$
e_{\Delta t}^{\mathrm{forte}} = \max_{n} \mathbb{E}[|X_{t_n} - X_n^{\mathrm{\Delta t}}|] \rightarrow 0, \qquad \Delta t \rightarrow 0.
$$

Um aspecto fundamental em análise numérica é medir essa taxa de convergência, ou seja, quão rápida é a convergência, em função de $\Delta t$. Nesse sentido, um método numérico, ou uma aproximação, é dita de **ordem** $p > 0$, ou **ordem forte** $p > 0$, quando existe uma constante $C > 0$ e um limiar $\delta > 0$ tais que
$$
e_{\Delta t}^{\mathrm{forte}} = \max_{n} \mathbb{E}[|X_{t_n} - X_n^{\mathrm{\Delta t}}|] \leq C \Delta t^p, \qquad \forall 0 < \Delta t \leq \delta.
$$

## Erro ao longo dos caminhos amostrais

A convergência forte é um resultado amostral mas tem consequências, também, nos caminhos individuais, ou em uma boa parcela deles. De fato, considerando um método numérico de ordem forte $p$, temos, pela desigualdade de Markov, que
$$
\mathbb{P}(\left|X_{t_n} - X_n^{\mathrm{\Delta t}}\right| > r) \leq \frac{\mathbb{E}[|X_{t_n} - X_n^{\mathrm{\Delta t}}|]}{r} \leq C\frac{\Delta t^p}{r}.
$$
Escolhendo $r = \Delta t^{p - \varepsilon}$, com $0 < \varepsilon < p$, obtemos
$$
\mathbb{P}(\left|X_{t_n} - X_n^{\mathrm{\Delta t}}\right| > \Delta t^{p - \varepsilon}) \leq C\frac{\Delta t^p}{\Delta t^{p - \varepsilon}} = C \Delta t^\varepsilon.
$$
Em particular, escolhendo $r = p/2$, temos
$$
\mathbb{P}(\left|X_{t_n} - X_n^{\mathrm{\Delta t}}\right| > \Delta t^{p/2}) \leq C \Delta t^{p/2}.
$$

Ou seja, tomando-se $\Delta t$ pequeno, temos, com probabilidade perto de um, que o erro ao longo de um caminho amostral é pequeno.

## Convergência fraca

Em muitos casos, temos um interesse particular no valor esperado de um processo. É claro que se um método numérico converge fortemente, então ele o valor esperado das simulações converge para o valor esperado da solução da equação que está sendo aproximada. Mas pode ser que, em alguns casos, a convergência do valor esperado seja mais rápida. E também pode acontecer do valor esperado convergir, sem que o método seja fortemente convergente. Por esses motivos, define-se uma noção para a convergência do valor esperado, que é esta chamada de convergência fraca.

Nesse sentido, novamente, dado um processo contínuo $\{X_t\}_{t \in [0, T]}$ e uma aproximação discreta $\{X_n^{\mathrm{\Delta t}}\}_n$ em instantes $t_j = j \Delta t$, $\Delta t = T/n$, o **erro fraco** é dado por
$$
e_{\Delta t}^{\mathrm{fraco}} = \max_{n} |\mathbb{E}[X_{t_n}] - \mathbb{E}[X_n^{\mathrm{\Delta t}}]|.
$$

Dizemos que o método numérico **converge fracamente** quando
$$
e_{\Delta t}^{\mathrm{fraco}} = \max_{n} \left|\mathbb{E}[X_{t_n}] - \mathbb{E}[X_n^{\mathrm{\Delta t}}]\right| \rightarrow 0, \qquad \Delta t \rightarrow 0.
$$

Um método numérico, ou uma aproximação, é dita de **ordem fraca** $p > 0$, quando existe uma constante $C > 0$ e um limiar $\delta > 0$ tais que
$$
e_{\Delta t}^{\mathrm{fraco}} = \max_{n} \left|\mathbb{E}[X_{t_n}] - \mathbb{E}[X_n^{\mathrm{\Delta t}}]\right| \leq C \Delta t^p, \qquad \forall 0 < \Delta t \leq \delta.
$$

Observe que, para cada $n$,
$$
\left| \mathbb{E}[X_{t_n}] - \mathbb{E}[X_n^{\mathrm{\Delta t}}] \right| = \left| \mathbb{E}[X_{t_n} - X_n^{\mathrm{\Delta t}}] \right| \leq \mathbb{E}\left[ \left| X_{t_n} - X_n^{\mathrm{\Delta t}}\right| \right],
$$
de modo que
$$
e_{\Delta t}^{\mathrm{fraco}} \leq e_{\Delta t}^{\mathrm{forte}}, \quad \forall \Delta t.
$$

No entanto, como dissemos acima, um método numérico pode convergir fracamente sem que convirja fortemente (e.g. Euler-Maruyama fraco, onde o termo estocástico é calculado via passeio aleatório) ou ambos podem convergir mas com a ordem de convergência fraca mais alta do que a sua ordem de convergência forte.

## Outras fontes de erro

Conforme discutido em Higham & Kloeden (2021), há vários outras fontes de erro, além do erro de discretização considerado acima:

1. *Erros amostrais,* provenientes de se aproximar um processo com espaço amostral contínuo por um número finito de amostras, em particular aproximando-se o valor esperado do processo pela média da amostra finita.

2. *Erros na geração de números aleatórios,* provenientes do fato dos números gerados usualmente em simulações computacionais serem pseudo-aleatórios e não verdadeiramente aleatórios e independentes.

3. *Erros de arredondamento,* proveniente do fato de que a aritmética em ponto flutuante não ser exata.

No caso determinístico, temos que nos preocupar apenas com os erros de arredondamento, causados tipicamente quando o passo de tempo é muito pequeno e, com isso, os erros se acumularem significativamente.

Já no caso de equações diferenciais aleatórias e estocásticas, o erro amostral tende a ser mais significativo.

Além disso, especialmente no caso estocástico, os erros associados à geração de números aleatórios podem ser mais significativos do que os erros de ponto flutuante, deturpando os resultados antes dos erros de arredondamente serem significativos (Komori, Saito & Mitsui (1994)).
