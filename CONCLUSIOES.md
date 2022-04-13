Este ejercicio tiene mucho polimorfismo. Veamos:
- Los personajes, `floki` y `mario`, son polimórficos para `luisa`. 
  ¿Por qué? Porque cuando le dicen a `luisa` que aparece un elemento, `luisa` tiene que decirle a su personaje activo (que puede ser cualquiera de los dos) que se lo encuentre.
- Los elementos son polimórficos para `floki`. Esto se ve en el método de `floki` que detallamos, todos los elementos deben entender el mensaje `recibirAtaque(potencia)`. 
- En forma similar, los elementos son polimórficos para `mario`, obviamente no respecto de `recibirAtaque(potencia)`.
¿Qué mensajes les `mario` a un elemento, que obliga a los elementos a ser polimórficos para `mario`?
- Las armas también son polimórficas para `floki`, ya que les pide la `potencia()`, les pregunta si `estaCargada()`, y les avisa que deben `registrarUso()`.

Si se usa bien el polimorfismo, los únicos `if` que debería haber son: el que mostramos en el método de `floki`, y el que necesita `luisa` para lanzar un error. La condición de error es que el personaje activo sea `== noHayPersonaje`.

¡Ah! una aclaración final. Los métodos `encontrar(unElemento)` en `floki` y `mario`, van exactamente como los pusimos, salvo que en el de `mario` hay que agregar una línea. Y los objetos que hay que implementar son exactamente los 8 que decimos, ni más, ni menos. 

En los diagramas de objetos, no se olviden de poner **todos** los atributos de un objeto en el globito, los que apuntan a otros "objetos que hicimos nosotros", y _también_ los que apuntan a números o booleanos.
