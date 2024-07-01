@def title = "Aspectos numéricos"

# {{ get_title }}

> "It may very well be said that the best way to understand SDEs is to work with their numerical solutions." - Salih N. Neftci, in *An Introduction to the Mathematics of Financial Derivatives,* 2nd edition (Academic Press, 2000).

## Aproximação numérica

Para ilustrar como métodos numéricos podem nos ajudar a entender os modelos acima, vamos considerar aproximações de Euler para as equações descritas na seção anterior, que no caso de equações estocásticas leva o nome de *método de Euler-Maruyama*.

### O método de Euler para equações diferenciais ordinárias

Inicialmente, no caso da equação diferencial ordinária
$$
\frac{\mathrm{d}x}{\mathrm{d}t} = f(t, x, \lambda),
$$
podemos considerar um passo de tempo $\Delta t$ e os estados discretos $x(t_n),$ a cada passo de tempo $t_n = n\Delta t.$ Uma aproximação de $x(t_{n+1})$ a partir de $x(t_n)$ é dada por
$$
x(t_n + \Delta t) \approx x(t_n) + f(t_n, x(t_n), \lambda)\Delta t.
$$
Assim, os estados $x(t_n),$ para $n\in \mathbb{N},$ são aproximados pela sequência
$$
x_{n+1}^{\Delta t} = x_n^{\Delta t} + f(t_n, x_n^{\Delta t}, \lambda)\Delta t, \qquad n = 0, 1, \ldots,
$$
com a condição inicial $x_0^{\Delta t} = x(0).$ Observe o superescrito $\Delta t$ para indicar que cada aproximação depende do passo de tempo escolhido.

É claro que, a cada passo de tempo, essa aproximação acarreta em erros e os erros vão se acumulando. Conforme diminuímos o passo de tempo, reduzimos o erro em cada passo, mas, por outro lado, aumentamos o número de passos. Como os erros se acumulam, não temos, em princípio, uma garantia de que o acúmulo de erros será controlado. Um papel da Análise Numérica é determinar quais métodos numéricos são bons nesse sentido e quão bom cada um é. Isso é visto examinando se a aproximação numérica converge para uma solução exata, correspondente a uma determinada condição inicial. O sentido da convergência, caso ela ocorra, e a taxa de convergência nos permitem comparar os diversos métodos.

No caso da aproximação de Euler, em particular, é possível mostrar que, para um $T>0$ fixo, as aproximações $x_n^{\Delta t},$ no intervalo $0\leq t_n \leq T,$ convergem *linearmente* para a solução exata, ou seja, com erro da ordem $\mathcal{O}(\Delta t).$

### O método de Euler no caso de equações diferenciais ordinárias com parâmetros aleatórios

Vejamos, agora, o caso de uma equação diferencial aleatória da forma mais simples, onde as realizações não variam com o tempo:
$$
\frac{\mathrm{d}X_t}{\mathrm{d}t} = f(t, X_t, \Lambda),
$$
com variáveis aleatórias
$$
X_{t = 0}(\omega) = X_0(\omega), \quad \lambda = \Lambda(\omega).
$$
Nesse caso, para cada amostra $\omega,$ temos uma realização $X_0(\omega)$ da condição inicial e uma realização $\Lambda(\omega)$ do(s) parâmetro(s). A partir daí, temos uma equação diferencial ordinária clássica. O método de Euler nos dá a seguinte aproximação:
$$
x_{n+1}^{\omega, \Delta t} = x_n + f(t_n, x_n^{\omega, \Delta t}, \Lambda(\omega))\Delta t, \qquad n = 0, 1, \ldots,
$$
com a condição inicial $x_0^{\omega, \Delta t} = X_0(\omega).$ Observe que, agora, incluímos a amostra $\omega$ como parâmetro da família de aproximações.

### O método de Euler no caso de equações diferenciais ordinárias aleatórias

Consideremos, agora, o caso em que a variável aleatória $\Lambda = \Lambda_t$ é um processo estocástico, com as realizações variando com o tempo:
$$
\frac{\mathrm{d}X_t}{\mathrm{d}t} = f(t, X_t, \Lambda_t).
$$

Nesse caso, a cada passo de tempo, devemos calcular um novo valor para o parâmetro, denotado por $\lambda_n^{\omega, \Delta t},$ e chegar na aproximação
$$
x_{n+1}^{\omega, \Delta t} = x_n + f(t_n, x_n^{\omega, \Delta t}, \lambda_n^{\omega, \Delta t})\Delta t.
$$
Essa é a principal diferença. O parâmetro $\Lambda_t(\omega)$ está determinado pela escolha da amostra $\omega$ mas o valor $\lambda_n^{\omega, \Delta t} = \Lambda_{t_n}(\omega)$ de uma realização sua varia com o instante $t_n.$ É possível mostrar que esse método converge, mas a sua ordem de convergência $\mathcal{O}(\Delta t^p)$ depende da regularidade do processo, podendo ser menor do que $1.$ Um resultado clássico garante que essa ordem $p$ é dada pelo expoente de continuidade Hölder do processo $\Lambda_t$ (muitas vezes esse expoente é 1/2, como no movimento Browniano geométrico, associado à regularidade Hölder do processo de Wiener). Mas, resultados recentes indicam que essa ordem de convergência, na verdade, é muito melhor, sendo também ordem $1,$ em uma ampla gama de tipos de ruídos $\{\Lambda_t\}_{t\geq 0}.$

### O método de Euler-Maruyama para equações diferenciais ordinárias estocásticas

Chegamos, agora, ao caso de equações diferenciais estocásticas. Consideremos uma equação da forma
$$
\mathrm{d}X_t = f(t, X_t, \lambda)\mathrm{d}t + \sigma(t, X_t)\mathrm{d}W_t.
$$
Nesse caso, a cada novo instante, fazemos um sorteio de $W_{t_{n+1}}^{\omega, \Delta t}$ para obter o passo $\Delta t_n^{\omega, \Delta t} = W_{t_{n+1}}^{\omega, \Delta t} - W_{t_n}^{\omega, \Delta t},$ chegando à sequência
$$
x_{n+1}^{\omega, \Delta t} = x_n + f(t_n, x_n^{\omega, \Delta t}, \lambda)\Delta t + \sigma(t, x_n^{\omega, \Delta t})\Delta W_n^{\omega, \Delta t}.
$$

Esse método leva o nome de **método de Euler-Maruyama.**

Em muitos casos, o processo estocástico é um **processo de Lévy**, em que os incrementos são estacionários e independentes entre si, ou seja, a distribuição de $W_{t_{n+1}} - W_{t_n}$ depende apenas do passo $\Delta t = t_{n+1} - t_n$ e as realizações a cada passo são independentes. Assim, no método de Euler, podemos sortear $\Delta W_n^{\omega, \Delta t}$ diretamente, a partir de uma determinada distribuição de probabilidades. Esse é o caso do processo de Wiener, associado ao movimento Browniano.

Quanto à ordem de convergência, no caso de um processo de Wiener e no caso *multiplicativo,* i.e. com $\sigma(t, X_t)$ dependendo de $X_t,$ a ordem de convergência do método de Euler-Maruyama cai para $1/2,$ como veremos mais pra frente.
