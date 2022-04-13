# Juego con personajes y elementos
 
Nos piden modelar un juego en el que cada jugador maneja un conjunto de personajes (p.ej. guerreros, trabajadores, sacerdotes). En el juego hay distintos elementos (p.ej. casas, animales, ríos). Cuando un personaje se encuentra con un elemento, hace cosas que pueden afectar a ambos.

Como recién estamos empezando a aprender programación con objetos, vamos a modelar una situación muy reducida, en la que aparecen solamente estos objetos:

- **luisa**, una _jugadora_,
- **floki**, un _personaje_ guerrero,
- **mario**, un _personaje_ trabajador,
- **ballesta** y **jabalina**, dos _armas_. `floki` tiene una de estas armas.
- **castillo**, **aurora** (que es una vaca) y **tipa** (que es un árbol), tres _elementos_. 

De cada elemento nos va a interesar la _altura_. El `castillo` mide 20 metros de alto, `aurora` 1 metro, la `tipa` arranca en 8 metros pero puede crecer (ya veremos cómo).
Además: debemos manejar el _nivel de defensa_ del `castillo` (un valor numérico que arranca en 150), y si `aurora` _está viva_ o no (nace viva).


<br>

## Encuentro entre personaje y elemento. 

El programa debe resolver el encuentro entre un personaje y un elemento.

Para eso, tanto `floki` como `mario` implementan el método `encontrar(elemento)`.
En el archivo `jugadoresPersonajes.wlk` hay una definición parcial de ambos personajes, que incluye este método en ambos casos. La de `mario` está incompleta, le falta una línea. 


<br> 

### Floki 

En el método `encontrar(elemento)` de `floki` vemos que pasan dos cosas: el elemento recibe un ataque con un valor que es la potencia del arma, y el arma registra que ha sido usada. Hay una condición: que el arma esté cargada.

Veamos cómo debe reaccionar cada elemento al recibir un ataque:
- El `castillo` disminuye su nivel de defensa en la potencia del ataque (p.ej. si recibe un ataque de 30, disminuye el nivel de defensa en 30). 
- `aurora` muere si la potencia del ataque es 10 o más; si no, no le pasa nada. 
- a `tipa` no le pasa nada.

A su vez, respecto de las armas tenemos estas definiciones respecto de la potencia, el uso, y cuándo se consideran cargadas.
- La `ballesta` nace con 10 flechas. Cada vez que se usa, pierde una flecha. Está cargada si tiene flechas. Su potencia es 4.
- La `jabalina` nace cargada. Se puede usar solamente una vez, o sea, con el primer uso deja de estar cargada. Su potencia es 30.


<br> 

### Mario

Pasemos ahora al método `encontrar(elemento)` de `mario`. 
Hay dos cosas definidas y una que tenés que definir vos.

Las dos cosas definidas son: el valor recolectado por `mario` aumenta en un valor que depende del elemento, y el elemento recibe el trabajo que hace `mario` sobre él.

Veamos cómo es cada elemento respecto del valor y del trabajo:
- El `castillo` otorga como valor el 20% de su defensa (o sea, su defensa / 5). 
  Al recibir un trabajo, aumenta su defensa en 20, hasta un tope de 200. O sea, si tiene 192 no pasa a 212, queda en 200 (atención acá: se puede usar `min`).
- `aurora` otorga como valor 15 unidades. Al recibir un trabajo, no le pasa nada.
- La `tipa` otorga como valor el doble de su altura. Al recibir un trabajo, su altura crece en un metro (porque se supone que la riegan y le dan nitratos, ponele).

Se le tiene que poder preguntar a `mario` si _es feliz_ o no. <br> 
`mario` es feliz si: o bien recolectó en total al menos 50 unidades, o bien el último elemento con el que se encontró mide al menos 10 metros de alto.
La acción que falta en el método `encontrar(elemento)` es necesaria para poder evaluar esta segunda condición.


<br>

## Luisa

En cada momento del juego, `luisa` está manejando uno de sus personajes, es el _personaje activo_. En este modelo reducido, el personaje activo de `luisa` puede ser o bien `floki` o bien `mario`. 

El objeto `luisa` debe entender el mensaje `aparece(elemento)`. 
Cuando le llega este mensaje, `luisa` le dice a su personaje activo que encuentre al elemento. 
Luisa no nace con ningún personaje activo, hay que asignarle uno.

# Tests que hay que realizar

Se pide armar estos tres tests

1. `luisa` tiene como personaje activo a `mario`. A `luisa` le aparece primero `aurora`, y después el `castillo`. <br> Después de esto, verificar que: 
	- el valor total recolectado por `mario` es 45, 
	- `mario` es feliz (porque lo último que se encontró, el `castillo`, tiene 20 metros de alto), y 
	- el `castillo` tiene 170 de defensa. 


1. `floki` tiene como arma la jabalina. 
`luisa` tiene como personaje activo a `mario`. A `luisa` le aparece la `tipa`. Después el personaje activo cambia a `floki`, y después de este cambio, a `luisa` le aparecen primero `aurora` y después el `castillo`. <br>
Verificar que: 
	- el valor total recolectado por `mario` es 16, 
	- la altura de la `tipa` es 9 metros, 
	- `mario` no es feliz, 
	- `aurora` está muerta, 
	- la defensa del `castillo` es 150, y 
	- la `jabalina` no está cargada.

1. `floki` tiene como arma la ballesta, `luisa` tiene como personaje activo a `floki`. A `luisa` le aparecen primero `aurora` y después el `castillo`. <br>
Verificar que: 
	- el valor total recolectado por `mario` es 0, 
	- `aurora` está viva, 
	- la defensa del `castillo` es 146, y que 
	- la `ballesta` está cargada, y le quedan 8 flechas.


