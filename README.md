# README

Name: `Covei Denis` \
Group: `312CA`

## Markov is coming
Codificarea starilor si pozitia lor in matrice s-a realizat prin gasirea unei relatii de bijectie:

$$(i,j) \rightarrow S := (i-1)\cdot nc+j$$

$$S \rightarrow (i,j) := \left\{
\begin{array}{ll}
    ([S-1]/nc,\ S\ mod\ \ nc),\ pentru \ nc\nmid S\\
    ([S-1]/nc,\ nc),\ altfel \\
\end{array} 
\right. $$


Pentru a nu scrie cod duplicat, in cautarea vecinilor pentru obtinerea matricelor de adiacenta, respectiv de linkare, am utilizat doi vectori de directii. Practic pentru o pozitie `(i, j)`, avem vecinii `(i + di[k], j + dj[k])`, unde `k = 1 : n`.

Metoda Jacobi a fost implementata prin inmultire directa de matrici, pentru a evita operatiile cu bucle in calcularea sumelor $x_i$.

## Linear Regression
Parsarea fisierelor am facut-o intr-un mod lent, intrucat aplic functia `strtok()` pe fiecare linie citita. Din cauza acestui fapt timpul de citire a crescut. O posibila optimizare ar fi utilizarea `strsplit()`, pentru a evita buclarea.

Posibile optimizari ar fi la gradient descent prin vectorizarea operatiilor.

## MNIST 101

Functia rand intoarce un numar real in intervalul `[0, 1]`. Pentru a aduce acest interval in `(-`$\epsilon$`, `$\epsilon$`)` am translatat si scalat fiecare numar `k`, generat de `rand()`, astfel: $\epsilon$ * `(2` * `k` - `1)`.

Pentru a amesteca randurile matricei `weights` si vectorului de predictii am realizat o permutare pe indicii liniilor.

Redactarea functiei de cost mi-a demonstrat importanta utilizarii operatiilor vectorizate in `Octave`. Un prim algoritmdeloc optimizat conducea la un timp de rulare enorm. Prin implementarea vectorizata a operatiilor, functia de cost rula aproape instant si cu precizie mai buna. Am incercat sa optimizez si mai mult prin utilizarea metodei gradientului descent, insa implementarea initiala a fost suficienta pentru obtinerea preciziei dorite.

Functia de predictie obtinea o rata de succes de `23%` pe antrenarea pe date neamestecate. Amestecarea inputului pentru antrenare a crescut rata de succes a predictiei la `83%`. 

