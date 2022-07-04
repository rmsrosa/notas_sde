@def title = "Soluções de equações diferenciais estocásticas"

# {{ get_title }}

Vamos considerar, agora, equações diferenciais estocásticas da forma
$$
\mathrm{d}X_t = f(t, X_t)\mathrm{d}t + g(t, X_t)\mathrm{d}W_t, \qquad t \geq 0,
$$
onde $T > 0$, $\{W_t\}_{t\geq 0}$ é um processo de Wiener e $f:[0, T]\times \mathbb{R} \times\mathbb{R} \rightarrow \mathbb{R}$ e $g:[0, T]\times \mathbb{R} \times\mathbb{R} \rightarrow \mathbb{R}$ são globalmente Lipschitz contínuos.

Junte-se à essa equação uma condição inicial
$$
\left.X_t\right|_{t = 0} = C,
$$
onde $C$ é uma variável aleatória real.

O termo $f = f(t, x)$ é chamado de *drift* e $g = g(t, x)$, de *difusão.*

## Sobre as condições de continuidade Lipschitz global

Como dito acima, supomos que $f$ e $g$ são globalmente Lipschitz contínuas, i.e. existem $L_f, L_g > 0$ tais que
$$
\begin{align*}
|f(t, x) - f(t, y)| \leq L_f|x - y|, \qquad \forall x, y \in \mathbb{R}, \\
|g(t, x) - g(t, y)| \leq L_g|x - y|, \qquad \forall x, y \in \mathbb{R}.
\end{align*}
$$

Lembremos que uma hipótese semelhante é usualmente feita para o resultado de existência de solução particular na teoria de equações diferenciais determinísticas. A diferença é que a continuidade Lipschitz assumida é apenas local, ou seja, para $x, y$ numa vizinhança da condição inicial.

No entanto, aqui, por conta do processo de Wiener, os caminhos amostrais podem se afastar rapidamente da condição inicial e perdemos esse controle local. Essa condição pode ser relaxada desde que se possa explorar alguma outra propriedade mais estrutural do processo de Wiener e da equação. Em geral, no entanto, conseguimos a existência apenas sob essa condição global.

## Existência e unicidade no caso de equações com difusão constante
