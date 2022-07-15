@def title = "O processo de Ornstein-Uhlenbeck e a equação de Langevin"

# {{ get_title }}

O modelo clássico (processo de Wiener) para o movimento Browniano de uma micro-partícula em um determinado meio é fundamentado na ação causada pelo bombardeamento aleatória das partículas do meio, mas não leva em consideração o momento da partícula. Uma alternativa a esse modelo é a **equação de Langevin**
$$
\frac{\mathrm{d}v_t}{\mathrm{d}t} = - \nu v_t + \sigma \xi_t
$$
onde $\nu > 0$, $\sigma > 0$, $v_t$ representa a velocidade da partícula no instante $t$ e $\xi_t$ é um *ruído branco*, modelado por $\mathrm{d}W_t/\mathrm{d}t$.

Essa é uma versão estocástica das equações de movimento de Newton. O primeiro termo do lado direito representa um termo viscoso, com uma resultante de forças proporcional à velocidade da partícula. O segundo termo do lado direito representa a ação causada pelo bombardeamento aleatório das partículas do meio. O termo viscoso representa um bombardeamento "médio" ordenado, condizente com a ideia de que a maior parte do bombardeamento ocorre à frente do objeto, conjugada com uma atração molecular das partículas que ficam para trás, puxando a partícula no sentido contrário ao do seu movimento. Em cima desse bombardeamento médio, gerando a viscosidade, temos as flutuações desordenadas dos bombardeamentos, representado pelo ruído branco.

Em termos da *posição* $x_t$ da partícula em cada instante $t$, o modelo de Langevin toma a forma
$$
\ddot x_t = - \nu \dot x_t + \sigma \eta_t.
$$

No entanto, a derivada de um processo de Wiener não está bem definida no sentido clássico, de modo que a equação de Langevin tem apenas um sentido heurístico. Um modelo rigoroso utilizado com esse mesmo sentido físico é o **processo de Ornstein-Uhlenbeck** $\{O_t\}_{t \geq 0}$, dado como solução da equação diferencial estocástica
$$
\mathbb{d}O_t = - \nu O_t\;\mathrm{d}t + \sigma \mathrm{d}W_t,
$$
onde $O_t$ é interpretado como sendo uma variável aleatória representando a velocidade da partícula no instante $t$.

## Resolução

A solução dessa equação é
$$
O_t = e^{-\nu t}O_0 + \sigma \int_0^t e^{-\nu(t - s)}\;\mathrm{d}W_t.
$$

De fato, escrevendo
$$
O_t = e^{-\nu t}O_0 + \sigma e^{-\nu t}\int_0^t e^{\nu s}\;\mathrm{d}W_t,
$$
vemos que
$$
\begin{align*}
\mathrm{d}O_t & = -\nu e^{-\nu t}O_0 \;\mathrm{d}t - \sigma \nu e^{-\nu t}\;\mathrm{d}t \int_0^t e^{\nu s}\;\mathrm{d}W_t + \sigma \;\mathrm{d}W_t \\
& = -\nu O_t\;\mathrm{d}t + \sigma\;\mathrm{d}W_t.
\end{align*}
$$

## Posição e velocidade na forma de sistema

Interpretando um processo de Ornstein-Uhlenbeck como representando a evolução da velocidade de uma partícula, podemos obter a posição integrando esse processo. Nesse caso, é comum denotarmos o processo de Ornstein-Uhlenbeck, modelando a equação de Langevin, como $\{Y_t\}_{t \geq 0}$, de modo que a posição fica sendo dada por
$$
X_t = X_0 + \int_0^t Y_t \;\mathrm{d}t.
$$

Podemos, ainda escrever ambos os processos como solução do sistema de equações diferenciais estocásticas
$$
\begin{cases}
\mathrm{d}X_t = Y_t, \\
\mathrm{d}Y_t = - \nu Y_t \;\mathrm{d}t + \sigma \;\mathrm{d}W_t,
\end{cases}
$$
com condições iniciais
$$
\left. X_t \right|_{t = 0} = X_0, \qquad \left. O_t \right|_{t = 0} = O_0.
$$

Essa é a versão rigorosa da equação de segunda ordem
$$
\ddot x_t = - \nu \dot x_t + \sigma \eta_t.
$$
