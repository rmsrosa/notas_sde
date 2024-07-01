@def title = "Lema de Borel-Cantelli"

# {{ get_title }}

> "To infinity and beyond!" - Buzz Lightyear, in the movie series *Toy Story* (Pixar Studios).

O Lema de Borel-Cantelli é um dos resultados mais utilizados em Teoria da Medida e em Probabilidade. Com ele, podemos deduzir, a partir de certas estimativas, se um determinado conjunto é de medida nula ou não. Vejamos o resultado e algumas de suas consequências.

## Lema de Borel-Cantelli

Considere um espaço de probabilidades $(\Omega, \mathcal{A}, \mathbb{P})$ e uma sequência de eventos $E_1, E_2, \ldots \in \mathcal{A}.$ O **Lema de Borel-Cantelli** garante que, se
$$
\sum_{n=1}^\infty \mathbb{P}(E_n) < \infty,
$$
então
$$
\mathbb{P}\left(\limsup_{n\rightarrow \infty} E_n\right) = 0.
$$

Aqui, o limite superior da sequência de eventos é o evento dado por
$$
\limsup_{n\rightarrow \infty} E_n = \bigcap_{n\in \mathbb{N}}\bigcup_{j\geq n} E_j = \left\{x\in \Omega; \;\exists j_n\rightarrow \infty,  x \in E_{j_n} \right\}.
$$
Esse conjunto é comumente escrito na forma
$$
\limsup_{n\rightarrow \infty} E_n = \left\{E_n \textit{ i.o.}\right\},
$$
onde *i.o.* significa "infinitas vezes" (do inglês, *"infinitely often"*).

A demonstração é simples. Observe que os conjuntos $\bigcup_{j\geq n} E_j$ são decrescentes em $n\in\mathbb{N}.$ Então, para qualquer $n\in \mathbb{N},$
$$
\mathbb{P}\left(\limsup_{n\rightarrow \infty} E_n\right) \leq \mathbb{P}\left(\bigcup_{j\geq n} E_j\right) \leq \sum_{j=n}^\infty \mathbb{P}(E_j).
$$
Com a hipótese do somatório ser finito, o termo do lado direito da desigualdade acima, que é o rabo da série, converge para zero. Assim, a probabilidade do limite superior é arbitrariamente pequena, ou seja, é nula.

## Exemplo

No caso particular, comumente encontrado, de termos variáveis aleatórias $\{X_n\}_{n\in \mathbb{N}}$ em $(\Omega, \mathcal{A}, \mathbb{P})$ e os eventos dados por $E_n = \{X_n \geq r\},$ então
$$
\limsup_{n\rightarrow \infty} \{X_n \geq r\} = \left\{X_n \geq r \textit{ i.o.} \right\} = \left\{\limsup_{n\rightarrow \infty} X_n \geq r\right\}.
$$

Daí, tiramos que, se
$$
\sum_{n=1}^\infty \mathbb{P}(X_n \geq r) < \infty,
$$
então
$$
\mathbb{P}\left(\limsup_{n\rightarrow \infty} X_n \geq r \right) = 0,
$$
ou seja
$$
\mathbb{P}\left(\limsup_{n\rightarrow \infty} X_n < r \right) = 1
$$

## Lema Borel-Cantelli complementar

Um resultado complementar vale no caso dos eventos serem independentes. Mais precisamente, se
$$
\sum_{n=1}^\infty \mathbb{P}(E_n) = \infty
$$
e
$$
\mathbb{P}(E_{n_1}\cap \cdots \cap E_{n_k}) = \mathbb{P}(E_{n_1})\cdots \mathbb{P}(E_{n_k}), \qquad \forall n_1 < n_2 < \cdots < n_k.
$$
então
$$
\mathbb{P}\left(\limsup_{n\rightarrow \infty} E_n\right) = 1.
$$

Começamos escrevendo
$$
\mathbb{P}\left(\limsup_{n\rightarrow \infty} E_n\right) = \mathbb{P}\left(\bigcap_{n\in \mathbb{N}}\bigcup_{j\geq n} E_j\right) = 1 - \mathbb{P}\left(\left(\bigcap_{n\in \mathbb{N}}\bigcup_{j\geq n} E_j\right)^c\right) = 1 - \mathbb{P}\left( \bigcup_{n\in\mathbb{N}}\bigcap_{j\geq n} E_j^c\right),
$$
onde $E^c = \Omega \setminus E$ é o complementar de um conjunto $E$ no espaço amostral $\Omega.$ Como a sequência de conjuntos $\cap_{j\geq n} E_n^c$ é crescente em $n$ e as medidas de probabilidade são contínuas por baixo, então
$$
\mathbb{P}\left( \bigcup_{n\in\mathbb{N}}\bigcap_{j\geq n} E_j^c\right) = \lim_{n\rightarrow \infty}\mathbb{P}\left(\bigcap_{j\geq n} E_j^c\right).
$$
Logo,
$$
\mathbb{P}\left(\limsup_{n\rightarrow \infty} E_n\right) = 1 - \lim_{n\rightarrow \infty}\mathbb{P}\left(\bigcap_{j\geq n} E_n^c\right).
$$

Agora, lembremos que, se os eventos são independentes, então os seus complementares também o são. Assim,
$$
\mathbb{P}\left(\bigcap_{j\geq n} E_n^c\right) = 
\Pi_{j\geq n}\mathbb{P}\left( E_n^c\right).
$$

Usando que $\mathbb{P}\left( E_n^c\right) = 1 - \mathbb{P}(E_n)$ e que $e^{-s} \geq 1 - s,$ para qualquer $s\in \mathbb{R},$ obtemos
$$
\mathbb{P}\left(\bigcap_{j\geq n} E_n^c\right) = \Pi_{j\geq n}\left(1 - \mathbb{P}(E_n)\right) \leq e^{-\sum_{j\geq n}\mathbb{P}(E_n)}.
$$

Como $\sum_{n=1}^\infty \mathbb{P}(E_n) = \infty,$ então $\sum_{j\geq n}^\infty \mathbb{P}(E_j) = \infty$ para qualquer $n\in \mathbb{N},$ de modo que
$$
0 \leq \mathbb{P}\left(\bigcap_{j\geq n} E_n^c\right) \leq e^{-\sum_{j\geq n}\mathbb{P}(E_n)} = 0.
$$
Portanto,
$$
\mathbb{P}\left(\limsup_{n\rightarrow \infty} E_n\right) = 1 - \lim_{n\rightarrow \infty}\mathbb{P}\left(\bigcap_{j\geq n} E_n^c\right) = 1 - 0 = 1,
$$
concluindo a demonstração.
