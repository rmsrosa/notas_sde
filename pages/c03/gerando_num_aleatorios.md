@def title = "Gerando números aleatórios no computador"

# {{ get_title }}

> "Any one who considers arithmetical means of producing random digits is, of course, in a state of sin." - John von Neumann (quoted by D. E. Knuth, in "The Art of Computer Programming II", Addison-Wesley Longman Publishing Co. 1997)

É possível gerar, no computador, números verdadeiramente aleatórios através da medição de fenômenos físicos externos, como ruído térmico, ruído sonoro, turbulência atmosférica, efeitos foto-elétricos, efeitos quânticos, entre outros. Veja, por exemplo, [Wikipedia: Hardware random number generator](https://en.wikipedia.org/wiki/Hardware_random_number_generator) e [RANDOM.ORG](https://www.random.org). Essa forma de geração de números aleatórios é de fundamental importância em algumas aplicações de criptografia, em situações em que a segurança é crítica. Essa classe de geradores de números aleatórios costuma ser denomidada por TRNG *(True Random Number Generators)*.

Mas a geração de tais números é custosa ou relativamente lenta. Por isso, em geral, números gerados aleatoriamente por programas de computador são baseados em algoritmos determinísticos. Esses algoritmos são feitos para simularem a geração de uma sequência aleatória através de alguma regra. Esses números gerados são ditos *pseudo-aleatórios*. Essa classe de geradores de números aleatórios costuma ser denomidada por PRNG *(Pseudo Random Number Generators)*. A maior fonte de aleatoriedade deles vêm de uma *semente*, usada para inicializar a sequência. Essa semente, sim, é baseada, em geral, em alguma fonte externa de entropia fornecida pelo sistema operacional, por exemplo a partir de movimentos do mouse, das teclas digitadas no teclado ou de ruído térmico, obtido através dos sensores de temperatura na placa do circuito integrado.

O estudo desses algoritmos de PRNG formam uma linha de pesquisa importante. E há uma série de testes de aleatoriedade para verificar a qualidade dos algoritmos.

## Geradores Congruentes Lineares

Uma família de métodos simples, que podemos mencionar para efeito de ilustração, é a dos *geradores congruentes lineares*. É uma família de métodos parametrizada por três parâmetros, $a$, $b$ e $m$. A sequência de números pseudo-aleatórios é iniciada a partir de uma **semente** $X_0$ e é definida, recursivamente, por
$$
X_{n+1} = (a X_n + b) \operatorname{mod} m.
$$
A sequência é, necessariamente, periódica e gera, no máximo, $m-1$ números diferentes. Mas a periodicidade pode ser bem menor, dependendo da combinação de parâmetros. A qualidade do método, aliás, é fortemente dependente das escolhas dos parâmetros. Compare, por exemplo, os dois casos abaixo:
```julia:randomlcg1
#hideall
using Plots
theme(:ggplot2)
a = 10
b = 1
m = 9999
x0 = 0

X = Vector{Float64}(undef, m - 1)
X[1] = x0 
for i in 2:m-1
    X[i] = mod( a * X[i-1] + b, m)
end

p1 = scatter(1:m-1, X, title = "Sequência gerada\n(a = $a, b = $b, m = $m)", titlefont = 10, label = false, markersize = 1)

p2 = histogram(X, label = false, xaxis = "X", yaxis = "contagem", title = "Histograma", titlefont = 10, bins = 50)

plot(p1, p2, layout = 2, size = (800, 400))
savefig(joinpath(@OUTPUT, "randomlcg1.svg"))
```
\fig{randomlcg1}

```julia:randomlcg2
#hideall
using Plots
theme(:ggplot2)
a = 7
b = 0
m = 2^13 - 1
x0 = 1

X = Vector{Float64}(undef, m - 1)
X[1] = x0 
for i in 2:m-1
    X[i] = mod( a * X[i-1] + b, m)
end

p1 = scatter(1:m-1, X, title = "Sequência gerada\n(a = $a, b = $b, m = $m)", titlefont = 10, label = false, markersize = 1)

p2 = histogram(X, label = false, xaxis = "X", yaxis = "contagem", title = "Histograma", titlefont = 10, bins = 50)

plot(p1, p2, layout = 2, size = (800, 400))
savefig(joinpath(@OUTPUT, "randomlcg2.svg"))
```
\fig{randomlcg2}

## Mersenne Twister

Por sua vez, um algoritmo clássico e muito utilizado para a geração de números pseudo aleatórios é o **Mersenne Twister**.

## Xoshiro

Um outro algoritmo desenvolvido mais recentemente é o **Xoshiro**.

## Números aleatórios não uniformes

Os algoritmos acima geram números buscando simular números aleatórios distribuídos uniformemente.

## Gerando números aleatórios em Julia
