@def title = "Integrais de Riemann"

# {{ get_title }}

## Integral definida

Vamos considerar integrais da forma
$$
Y = \int_a^b f(s, X_s) \;\mathrm{d}s,
$$
onde $\{X_t\}_{t \in [a, b]}$ é um processo estocástico real definido em um intervalo $[a, b]\subset \mathbb{R}$.

Vamos considerar, principalmente, funções e processos em que

1. $f:[a, b]\times \mathbb{R} \rightarrow \mathbb{R}$ é contínuo; e
2. Quase certamente, os caminhos amostrais de $\{X_t\}_{t\in [a,b]}$ são contínuos.

Sob essas condições, para quase todo $\omega$, a função
$$
t \mapsto f(t, X_t(\omega))
$$
é contínua e limitada no intervalo compacto $t\in [a, b]$. Portanto, a sua integral de Riemann está bem definida e podemos definir $Y$ pontualmente, via essa integral:
$$
Y(\omega) = \int_a^b f(s, X_s(\omega)) \;\mathrm{d}s.
$$
O conjunto em que o caminho amostral não é contínuo tem medida nula e, nele, podemos definir $Y(\omega)$ como sendo zero ou qualquer outro valor. Não faz diferença, no sentido de medida.

A questão que não é imediata é se $\omega \mapsto Y(\omega)$, assim definido, é mensurável e, portanto, é uma variável aleatória. Para isso, podemos mostrar que $Y$ é o limite, quase sempre, de somas de Riemann.

Seja $a = t_0 < t_1 < \cdots < t_n = b$ uma partição do intervalo $[a, b]$ e defina
$$
Y^n = \sum_{j=1}^{n} f(t_{j-1}, X_{t_{j-1}}(\omega)) (t_j - t_{j-1}).
$$

Como $f$ é contínuo, cada $\omega \mapsto f(t_{j-1}, X_{t_{j-1}}(\omega))$ é mensurável. Como a combinação linear de funções mensuráveis é mensurável, segue que $Y^n$ é mensurável. 

Finalmente, para quase todo $\omega$, $Y^n(\omega)$ é a soma de Riemann da integral de Riemann $Y(\omega)$. Portanto, $Y^n(\omega)$ converge para $Y(\omega)$, para quase todo $\omega$. Assim, vemos que $Y$ é o limite pontual das funções mensurávels $Y^n$. Como o limite de funções mensuráveis reais é mensurável, segue que $Y$ é mensurável. Portanto, $Y$ é uma variável aleatória.

## Processos integrais

Sob as mesmas hipóteses em $f$ e $\{X_t\}_{t\in [a, b]}$, podemos, também, considerar as integrais
$$
Y_t = \int_a^t f(s, X_s) \;\mathrm{d}s.
$$
Naturalmente, $Y_a = 0$.

Para cada $t \in [a, b]$, vimos, acima, que $Y_t$ é uma variável aleatória no mesmo espaço de probabilidades do processo $\{X_t\}_{t\in [a, b]}$. Isso faz de $\{Y_t\}_{t\in [a, b]}$ um processo contínuo.

Além disso, observe que, para quase todo $\omega$, os caminhos amostrais de $\{Y_t\}_{t\in [a, b]}$ são dados por
$$
t \mapsto Y_t(\omega) = \int_a^t f(s, X_s(\omega)) \;\mathrm{d}s.
$$
Como $t \mapsto f(t, X_t(\omega))$ é contínuo, portanto, integrável, segue que cada caminho amostral é contínuo em $[a, b]$.

## Teorema fundamental

Seja, agora, $\{Y_t\}_{t\in [a,b]}$ um processo estocástico com caminhos continuamente diferenciáveis, i.e. tais que, quase sempre, existe o limite
$$
X_t(\omega) = \frac{\mathrm{d}Y_t}{\mathrm{d}t}(\omega) = \lim_{\tau \rightarrow 0} \frac{Y_{t+\tau}(\omega) - Y_t(\omega)}{\tau}
$$
para todo $t\in [a, b]$, com $t \mapsto X_t(\omega)$ contínuo.

As variáveis $X_t$ são obtidas como limites pontuais de variáveis aleatórias, portanto são também variáveis aleatórias, já que o limite de funções reais mensuráveis é mensurável. Dessa forma, $\{X_t\}_{t\in [a, b]}$ é um processo estocástico. Além disso, por hipótese, os seus caminhos amostrais são contínuos. Com isso, a integral de $X_t$ está bem definida.

Finalmente, para cada $\omega$, podemos aplicar o Teorema Fundamental do Cálculo e obter
$$
Y_t = \int_0^t X_s \;\mathrm{d}s = \int_0^t  \frac{\mathrm{d}}{\mathrm{d}t}Y_s \;\mathrm{d}s.
$$

## Integrais em outros sentidos

Podemos estender a integração acima em vários sentidos. Podemos pedir que $t \mapsto f(t, X_t(\omega))$ seja integrável a Riemann, sem necessariamente ser contínua. Também podemos pedir que seja apenas integrável à Lebesgue. Isso nos permite definir $Y(\omega)$ pontualmente. A questão mais delicada passa a ser se $Y$ é mensurável.

Uma solução mais geral para isso é não pensar em definir através de caminhos, mas através da integração de uma função. Isso nos leva ao conceito de 
$$
Y = \int_a^b f(s, X_s) \;\mathrm{d}s,
$$
como *integral de Bochner*. A ideia é enxergar $s \mapsto f(x, X_s)$ como uma função de $r$ em algum espaço de Banach (espaço normado completo), como $L^2(\Omega)$, cuja norma é a da média quadrática. Buscamos, então, aproximar o integrando $s \mapsto f(s, X_s)$ por funções passo e definir a integral como uma integral de Lebesgue com valores em $L^2(\Omega)$. Essa teoria é bem mais delicada e não nos aprofundaremos nos detalhes. Um aspecto importante é que, sob as devidas condições, a integral é um limite de somas de funções simples:
$$
Y = \lim_n \sum_{j=1}^n f_j^n \chi_{E_j^n}(s) \;\mathrm{d}s,
$$
onde $f_j^n = f_j^n(\omega)$ são mensuráveis em $L^2(\Omega)$ (i.e. de média quadrádica finita). As funções simples $f^n = \sum_j f_j^n \chi_{E_j^n}$ aproximam $t \mapsto f(t, X_t)$. O limite acime é no sentido de média quadrática.
$$
\mathbb{P}\left( \left( Y - \sum_{j=1}^n f_j^n \chi_{E_j^n}(s) \;\mathrm{d}s\right)^2\right) \rightarrow 0.
$$
