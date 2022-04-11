@def title = "Aspectos de equações diferenciais estocásticas e aleatórias"

# {{ get_title }}

Afinal, o que são equações diferenciais estocásticas e equações diferenciais aleatórias? Ok, elas combinam equações diferenciais com fatores aleatórios. Mas como? E em que sentido elas se diferenciam?

## Equações diferenciais ordinárias

Para tentarmos esclarecer como a aleatoriedade entra nas equações diferenciais, vamos considerar uma equação simples, da forma
$$
    \frac{\mathrm{d}x}{\mathrm{d}t} = \mu x,
$$
onde $x$ correspondente à concentração populacional de algum organismo (e.g. quantidade de indivíduos por unidade de volume, como o número de células de leveduras por mililitro), $\mu$ é a taxa de crescimento específico e a lei ${\mathrm{d}x}{\mathrm{d}t} = f(t, x, \mu) = \mu x$ é simplesmente uma taxa proporcional à população.

## Aleatoriedades

Em um primeiro momento, podemos assumir que a taxa de crescimento específico esteja bem determinada, em cada situação, mas assumirmos a nossa ignorância em sabê-la com exatidão. A cada experimento ou observação, mesmo em situações as mais parecidas possíveis, pequenas variações podem levar a taxas ligeiramente diferente. Nesse caso, podemos assumir que $\mu$ seja conhecida com um certo grau de incerteza, através de uma distribuição de probabilidades. Em cada situação, temos uma taxa diferente $\eta(\omega)$, onde $\omega$ representa cada amostra do conjunto possível de amostras. Da mesma forma, podemos considerar, também, uma incerteza na condição inicial, com $x(0) = x_0(\omega)$. Ou seja, para cada amostragem indicada por $\omega$, temos uma *realização* $\mu(\omega)$ da taxa de crescimento específico e uma *realização* $x_0(\omega)$ da condição inicial, obtendo, a partir daí, um problema de valor inicial no sentido clássico: $\mathrm{d}x/\mathrm{d}t = \mu(\omega)x$, $x(0) = x_0(\omega)$. Essa situação é típica em problemas de **quantificação de incertezas**.

Porém, mesmo organismos simples, como um fungo, não têm uma taxa de crescimento específico muito bem definida. Fatores ambientais, não-homogeneidades no meio e variações no desenvolvimento próprio de cada indivíduo influenciam na taxa de crescimento. Podemos obter uma taxa média, em determinados tipos de situação (e.g. em uma placa Petri com um determinado tipo de meio, em um tubo de ensaio, na fermentação de um determinado tipo de bebida, etc.), mas mesmo em cada situação, há diversos fatores influenciando a multiplicação celular.

Assim, em um segundo momento, assumimos que fatores aleatórios influenciam *ao longo* do processo, afetando a taxa de crescimento da população a cada momento. Nesse caso, ao invés de $\mu(\omega)$, temos $\mu_t(\omega)$, onde, a cada instante $t$, a realização $\mu_t(\omega)$ varia aleatoriamente, estando associada a uma dada distribuição de probabilidades. É importante ressaltar que a cada instante $t$, temos uma realização diferente $\mu_t(\omega)$ para a taxa de crescimento específico. Essa tal família parametrizada $\{\mu_t\}_t$ que a cada valor $t$ do parâmetro assume valores de acordo com uma certa distribuição de probabilidades é chamada de **processo aleatório**, ou **processo estocástico.** A distribuição de probabilidades no instante $t$ pode, ou não, variar com o tempo. O importante é que, a cada instante, fazemos um novo "sorteio". Note a diferença em relação ao caso anterior, onde não apenas a lei de probabilidade não muda com o tempo, como o "sorteio" é feito "apenas uma vez", antes da evolução. Ao longo da evolução, a taxa é fixa.

A definição acima, no entanto, nos impõe uma questão: em que sentido a equação diferencial $\mathrm{d}x/\mathrm{d}t = \mu_t(\omega)x$ é satisfeita? Podemos, mesmo, "integrar" $\mu_t(\omega)x$ e obter uma função diferenciável $x=x(t, \omega)$ que seja solução da equação? Para que isso seja possível, assume-se que $\mu_t$ seja um processo *contínuo* no tempo, ou seja, que, para cada amostra $\omega$, as realizações $\mu_t(\omega)$ ao longo do tempo nos dêem uma função contínua, $t \rightarrow \mu_t(\omega)$. Com essa condição em $\{\mu_t\}_t$, obtemos uma **equação diferencial aleatória**.

Podemos, no entanto, ir além e considerar que a perturbação seja, digamos assim, mais dramática e imprevisível, permitindo que os *caminhos amostrais* $t \mapsto \mu_t(\omega)$ sejam descontínuos. Isso não vem à toa. A motivação para tal é que isso aparece naturalmente em diversas situações, como no movimento de partículas suspensas em um fluido (movimento Browniano) e nas variações de corrente elétrica devidas a flutuações térmicas, entre outros fenômenos. Mesmo assim, temos certas restrições. Permite-se que essa perturbação apareça de forma *linear* em termos da *"derivada"* de um processo aleatório, "$\mu_t = \sigma(t, X_t)\mathrm{d}W_t/\mathrm{d}t$". Porém, sendo $W_t$ um processo aleatório, ele não é tão suave assim para ter uma derivada temporal no sentido clássico. Essa é a porta de entrada para as as integrais de Itô e de Stratonovich, que dão sentido à integral em relação a infinitesimais $\mu_t\mathrm{d}t = $ "$\sigma(t, X_t)(\mathrm{d}W_t/\mathrm{d}t)\mathrm{d}t$" $= \sigma(t,X_t)\mathrm{d}W_t$. Dessa maneira, obtemos as **equações diferenciais estocásticas**.

## Equações diferenciais estocásticas e aleatórias

Pensemos, agora, em uma equação mais geral 
$$
\mathrm{d}x/\mathrm{d}t = f(t, x, \lambda),
$$
onde $\lambda$ é um parâmetro, ou conjunto de parâmetros (como a taxa de crescimento específico acima, etc.) e $f(t, x, \lambda)$ é a lei de evolução do sistema.

No caso de **equações diferenciais aleatórias**, o que fazemos é permitir que $\lambda$ varie aleatoriamente, sendo, mais precisamente, um **processo estocástico** $\lambda_t$, **com caminhos amostrais contínuos**. Como resultado disso, a própria solução também será um processo estocástico, que denotaremos por $X_t= X_t(\omega)$. Assim, chegamos a uma **equação diferencial aleatória:**
$$
\frac{\mathrm{d}X_t}{\mathrm{d}t} = f(t, X_t, \lambda_t).
$$
Também permitimos que a condição $x(0) = X_0(\omega)$ seja aleatória. Assim, para cada amostra $\omega$, temos uma realização do problema de valor inicial
$$
\begin{cases}
  \displaystyle \frac{\mathrm{d}X_t(\omega)}{\mathrm{d}t} = f(t, X_t(\omega), \lambda_t(\omega)), \\
  \left. X_t(\omega)\right|_{t = 0} = X_0(\omega).
\end{cases}
$$

Agora, para abrir caminho para o caso de equações estocásticas, vamos escrever a equação diferencial na forma
$$
\mathrm{d}x = f(t, x, \lambda)\mathrm{d}t.
$$

A ideia, então, é acrescentarmos um termo $\epsilon_t\mathrm{dt}$, mas com "$\epsilon_t=\sigma(t, x)\mathrm{d}W_t/\mathrm{d}t$". Exceto, que $W_t$ é um processo estocástico que não é diferenciável no sentido clássico. Mas, aproveitando a forma como escrevemos a equação acima, podemos escrever apenas
$$
\mathrm{d}X_t = f(t, X_t, \lambda)\mathrm{d}t + \sigma(t, X_t)\mathrm{d}W_t.
$$

A cada amostra $\omega$, temos a equação
$$
\mathrm{d}X_t(\omega) = f(t, X_t(\omega), \lambda)\mathrm{d}t + \sigma(t, X_t(\omega))\mathrm{d}W_t(\omega).
$$
Mas essa não é uma equação diferencial no sentido clássico. Precisamos esclarecer o termo $\mathrm{d}W_t(\omega)$. Isso será feito oportunamente.

Lembremos que, muitas vezes, na modelagem de algum fenônemo, obtemos a equação diferencial argumentando a partir de uma descrição heurística da evolução temporal discreta do sistema, para o incremento $\Delta x = x(t + \Delta t) - x(t)$ do seu estado, na forma $\Delta x \approx f(t, x, \lambda)\Delta t$ e passando ao limite no passo de tempo $\Delta t \rightarrow 0$. A equação estocástica acima é resultado de permitirmos uma evolução da forma $\Delta x \approx f(t, x, \lambda)\Delta t + g(t, x)\Delta W_t$, onde $\Delta W_t = W(t + \Delta t) - W(t)$ é a variação na componente estocástica, sendo, ela mesma, uma distribuição de probabilidades.

Para justificar esse tipo de modelagem estocástica, trataremos, em breve, do movimento Browniano, onde isso aparece de forma natural. Antes, vamos considerar certos aspectos numéricos.
