# AppOfThrones-iOS
Práctica de App Of Thrones versión iOS para Fundamentos de iOS

1.- He creado una tabla detalle decorada con secciones. Lo ideal es refactorizar este código para utilizarlo en el resto de las clases.

2.- Lo mismo que en el punto 1, pero todavía sin refactorizar ni aplicar la refactorización.

3.- He añadido una acción para vaciar el array de rating de los episodios; se refresca desde el tableview sin necesidad de notificación.

4.- He cambiado las cuatro clases modelo (Episode, Cast, House y Rating) para que conformen los protocolos Equatable y CustomStringConvertible

5.- He creado sobre el tabBarController una opción adicional con un icono de corazón relleno para acceder a los Favoritos marcados.


6.- He añadido una frikada FX compuesta por dos mejoras: 

a) Un efecto tipo SplashScreen de Twitter que he [copiado](https://github.com/AtulPrakash007/Twitter-Splash-Animation/tree/master/Twitter%20Splash/Twitter%20Splash/View).
Se aplica cada una de las primeras veces que se instancia el splitViewController.

b) Un efecto de sonido en cada uno de los efectos anteriores y otros efectos en los detalles.
Estos los he grabado yo para que no haya problemas de licencia, así han quedado...

TODO: Voy a intentar que me dé tiempo antes de finalizar el día (que estoy griposo) a refactorizar, sobre todo las vistas detalle en tabla que realmente son comunes a los 3 modelos y si me da tiempo añado circulitos con los artistas cuando aparecen en cada episodio, al estilo las movies en iTunes. 
