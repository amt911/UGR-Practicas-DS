// ignore: use_key_in_widget_constructors
import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:haz_una_linea/factorias/factoria_abstracta.dart';
import 'package:haz_una_linea/factorias/factoria_concreta.dart';
import 'package:haz_una_linea/factorias/factoria_concreta_especial.dart';
import 'package:haz_una_linea/musica.dart';
import 'package:haz_una_linea/pantallas/game_over.dart';
import 'package:haz_una_linea/pantallas/pausa.dart';
import 'package:haz_una_linea/parametros_tablero.dart';
import 'package:haz_una_linea/piezas/bloque.dart';
import 'package:haz_una_linea/piezas/cubo_pieza_bomba.dart';
import 'package:haz_una_linea/piezas/cubo_pieza_normal.dart';
import 'package:haz_una_linea/piezas/i_pieza_bomba.dart';
import 'package:haz_una_linea/piezas/i_pieza_normal.dart';
import 'package:haz_una_linea/piezas/l_pieza_bomba.dart';
import 'package:haz_una_linea/piezas/l_pieza_normal.dart';
import 'package:haz_una_linea/piezas/movimientos.dart';
import 'package:haz_una_linea/piezas/pieza.dart';
import 'package:haz_una_linea/piezas/pieza_mas_bomba.dart';
import 'package:haz_una_linea/piezas/pieza_mas_normal.dart';
import 'package:haz_una_linea/piezas/s_pieza_bomba.dart';
import 'package:haz_una_linea/piezas/s_pieza_normal.dart';
import 'package:haz_una_linea/piezas/t_pieza_bomba.dart';
import 'package:haz_una_linea/piezas/t_pieza_normal.dart';

class Tablero extends StatefulWidget {
  int lineasHechas = 0;
  double multiplier =1;

  Tablero(this.lineasHechas, this.multiplier, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<Tablero> createState() => TableroState();
}

class TableroState extends State<Tablero> with WidgetsBindingObserver {
  late Pieza sombra;
  late Pieza piezaActual;
  Pieza? piezaReservada;
  late Queue<Pieza> piezasSiguientes;
  List<Pieza> listaBombas = [];
  List<Pieza> lista = []; //Lista con los prototipos para la factoria
  late List<List<Bloque?>> bloquesPuestos; //Bloques ya puestos en el tablero

  int contadorLineas =
      0; //Lineas realizadas desde las ultimas 10, solo para calculos internos
  int indiceDelay =
      0; //Indice que el delay que hay que usar en el timer ??? QUIZAS PASARLO A PARAMETROS TABLERO
  int lineasAcumuladas = 0; //Numero de lineas realizadas
  int nivel = 0; //Nivel actual
  int puntuacion = 0;
  int t =
      ParametrosTablero.t; //Indica si el modo de juego es el normal o el bomba

  bool reservado = false; //false permite reservar
  bool esPausa = false; //false para pausar
  bool fin = false; //Indica si ya se ha acabado la partida

  double velocidad = 1; //Velocidad de la musica
  Musica m = Musica(); //Para usar musica
  Timer? timerPrincipal;
  late FactoriaAbstracta fa;

  TableroState() : super() {
    piezaReservada = null; //Al principio no hay pieza reservada

    //Se añaden a la lista las piezas normales
    lista = [
      IPiezaNormal(),
      LPiezaNormal(true),
      LPiezaNormal(false),
      SPiezaNormal(true),
      SPiezaNormal(false),
      CuboPiezaNormal(),
      TPiezaNormal()
    ];

    //Si el modo de juego es normal
    if (ParametrosTablero.t == 0) {
      fa = FactoriaConcreta(lista);
    } else {
      //Si el modo de juego es bomba
      listaBombas = [
        PiezaMasNormal(),
        PiezaMasBomba(),
        IPiezaBomba(),
        LPiezaBomba(false),
        LPiezaBomba(true),
        CuboPiezaBomba(),
        SPiezaBomba(false),
        SPiezaBomba(true),
        TPiezaBomba(),
      ];

      //Se crea la factoria especial con las bombas
      fa = FactoriaConcretaEspecial(
          lista, listaBombas, ParametrosTablero.probabilidad);
    }

    //Se genera la matriz del tablero
    bloquesPuestos = List.generate(
        ParametrosTablero.TABLERO_HEIGHT_PIEZAS.toInt(),
        (index) => List.filled(
            ParametrosTablero.TABLERO_WIDTH_PIEZAS.toInt(), null,
            growable: false),
        growable: false);

    piezaActual = fa.crearPieza();
    piezasSiguientes = Queue();

    //Se añaden mediante la factoria las 3 siguientes piezas
    for (int i = 0; i < 3; i++) {
      piezasSiguientes.add(fa.crearPieza());
    }

    //Se actualiza la sombra
    //actualizarSombra();
  }

  ///Permite comprobar el estado de la aplicación para pausar el juego cuando
  ///se pone en segundo plano.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused) {
      timerPrincipal!.cancel();
      m.pausarMusica();
      Navigator.push(context, MaterialPageRoute(builder: (context) => Pausa(m)))
          .then((value) {
        comenzar();
      });
    }
  }

  ///Permite actualizar la sombra de la [piezaActual]
  void actualizarSombra() {
    sombra = piezaActual.clone();

    ///Simula como si bajase una pieza normal, para asi aparecer en la posicion
    /// en la que se encontraria
    bajarRapido(sombra);
  }

  ///initState se llama justo despues del constructor en el momento en el que
  ///se añade al arbol
  @override
  void initState() {
    if(widget.multiplier<=0){
      widget.multiplier=1;
    }
    ///Se añade el observador para que detecte cuando la aplicación se pone en
    ///segundo plano
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
if(widget.lineasHechas>0){
    int contador = 0;
    for (int i = 0;
        i <
            (ParametrosTablero.TABLERO_WIDTH_PIEZAS.toInt() -
                1 % widget.lineasHechas);
        i++) {
      for (int j = 0;
          j < ParametrosTablero.TABLERO_WIDTH_PIEZAS.toInt() - 1 &&
              contador < widget.lineasHechas;
          j++) {
        bloquesPuestos[ParametrosTablero.TABLERO_HEIGHT_PIEZAS.toInt() - 1 - i]
                [j] =
            Bloque(
                j.toDouble(),
                ParametrosTablero.TABLERO_HEIGHT_PIEZAS.toInt() -
                    1 -
                    i.toDouble(),
                Colors.pink);
        contador++;
      }
    }
}
    actualizarSombra();

    ///Justo despues de llamar al constructor de la clase se llama a este metodo
    ///Es por eso que una vez inicializado todo se llama a la música
    ///y a un timer para que el juego empiece a moverse
    m.comenzarMusica();
    //m.setVelocidad(widget.multiplier*velocidad);
    comenzar();
    //print("alsdkjlsdfkjlsdkfjlskjldkfjgldkfhgjlkdfjglkdfgjldfkgjldfkjgldfkjdflkjfg ${widget.multiplier}");
  }

  ///Destructor que se utiliza al hacerle pop
  @override
  void dispose() {
    //Eliminamos el observador ya que no va a hacer falta que detecte el estado
    WidgetsBinding.instance?.removeObserver(this);
    timerPrincipal!.cancel();
    super.dispose();
  }

  ///Mete los bloques que componen a [piezaActual] en el tablero
  void meterEnTablero() {
    for (Bloque aux in piezaActual.bloques) {
      if (aux.y >= 0) {
        bloquesPuestos[aux.y.toInt()][aux.x.toInt()] = aux;
      } else {
        fin = true;
      }
    }
    if (t == 1) {
      //Si el modo de juego es bomba se explota la pieza
      piezaActual.explotar(bloquesPuestos);
    }
  }

  ///Baja la pieza directamente a la posicion final
  void bajarRapido(Pieza pieza) {
    while (!pieza.estaEnSuelo() &&
        !pieza.estaEncimaPieza(bloquesPuestos) &&
        !gameOver()) {
      pieza.mover(Movimientos.BAJAR);
    }
  }

  ///Comprueba si es necesario subir de nivel y realiza los cambios que esto
  ///conlleva
  void subirNivel() {
    if (contadorLineas >= 10) {
      contadorLineas -= 10;
      nivel++;
      if (nivel <= 9 ||
          nivel == 10 ||
          nivel == 13 ||
          nivel == 16 ||
          nivel == 19 ||
          nivel == 29) {
        indiceDelay++; //Se aumenta la velocidad de bajada
        velocidad += 0.034; //Se aumenta la velocidad de la musica
      }

      m.setVelocidad(widget.multiplier*velocidad);
      //print("aslkdjalrjklsdkfjlsfjhglkdfjhgkldjfghkldfgh ${widget.multiplier*velocidad}");
      ///Paramos el timer ya que tiene que ser mas rapido y llamamos a comenzar
      ///para que se reinicie
      timerPrincipal!.cancel();

      comenzar();
    }
  }

//Al completar una línea, mueve las líneas superiores una casilla abajo.
  void moverLineasSuperiores(List<int> lineas) {
    for (int i in lineas) {
      //Aumentamos los contadores para el nivel y las líneas completadas
      contadorLineas++;
      lineasAcumuladas++;

      for (int f = i; f > 1; f--) {
        for (int c = 0; c < ParametrosTablero.TABLERO_WIDTH_PIEZAS; c++) {
          bloquesPuestos[f][c] =
              bloquesPuestos[f - 1][c]; //Se mueve el bloque hacia abajo

          if (bloquesPuestos[f][c] != null) {
            //Si no esta vacio se mueve la componente interna del bloque
            bloquesPuestos[f][c]!.y += 1;
          }
        }
      }
    }
  }

  ///Comprueba si es el final de la partida
  bool gameOver() {
    if (!fin) {
      for (Bloque aux in piezaActual.bloques) {
        if (aux.y >= -1 &&
            bloquesPuestos[(aux.y + 1).toInt()][aux.x.toInt()] != null) {
          fin = true;
        }
      }
    }

    return fin;
  }

  ///Lanza la pantalla de game over para acabar la partida
  void mostrarGameOver() {
    timerPrincipal!.cancel();
    m.pararMusica();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GameOver(puntuacion, nivel, lineasAcumuladas)));
  }

  ///Calcula la puntuacion en funcion del nivel
  void calcularPuntuacion(int lineas) {
    switch (lineas) {
      case 1:
        puntuacion += 40 * (nivel + 1);
        break;

      case 2:
        puntuacion += 100 * (nivel + 1);
        break;

      case 3:
        puntuacion += 300 * (nivel + 1);
        break;

      default:
        puntuacion += 1200 * (nivel + 1);
        break;
    }
  }

  ///Elimina las lineas que tengan todos los bloques horizontales
  void eliminarLineasCompletas() {
    List<int> lineas = lineasCompletas();

    for (int i in lineas) {
      for (int c = 0; c < ParametrosTablero.TABLERO_WIDTH_PIEZAS; c++) {
        bloquesPuestos[i][c] = null;
      }
    }

    if (lineas.isNotEmpty) {
      calcularPuntuacion(lineas.length);
    }

    moverLineasSuperiores(lineas);
  }

  ///Pinta la informacion relevante de la partida
  List<Widget> pintarInfo() {
    //Modo claro
    Color lima = Colors.lime;
    Color naranja = Colors.orange;
    Color rojo = Colors.red;

    //Si esta en modo oscuro el dispositivo se cambio el tono de color
    if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
      lima = Colors.lime.shade900;
      naranja = Colors.orange.shade900;
      rojo = Colors.red.shade900;
    }
    List<Widget> lista = [
      const SizedBox(
        height: 20,
      ),
      Container(
          width: ParametrosTablero.piezaReservadaWidth,
          color: lima,
          child: Text("Score: $puntuacion")),
      const SizedBox(
        height: 20,
      ),
      Container(
          width: ParametrosTablero.piezaReservadaWidth,
          color: naranja,
          child: Text("Level:  $nivel")),
      const SizedBox(
        height: 20,
      ),
      Container(
          width: ParametrosTablero.piezaReservadaWidth,
          color: rojo,
          child: Text("Lines:  $lineasAcumuladas")),
      const SizedBox(
        height: 20,
      ),
    ];

    return lista;
  }

  //Devuelve los indices en los que se encuentran las lineas completas
  List<int> lineasCompletas() {
    bool linea;
    List<int> lineas = [];
    for (int f = 0; f < ParametrosTablero.TABLERO_HEIGHT_PIEZAS; f++) {
      linea = true;
      for (int c = 0; c < ParametrosTablero.TABLERO_WIDTH_PIEZAS; c++) {
        if (bloquesPuestos[f][c] == null) {
          linea = false;
        }
      }

      if (linea) {
        lineas.add(f);
      }
    }
    return lineas;
  }

  ///Se encarga de lanzar el timer periodico y comprobar los distintos estados
  /// del juego
  void comenzar() {
    //El delay viene dado por el nivel del juego
    timerPrincipal = Timer.periodic(
        Duration(milliseconds: (ParametrosTablero.delays[indiceDelay]~/widget.multiplier)), (timer) {
      setState(() {
        //Si esta la pieza aun en el aire y no ha acabado la partida se baja
        if (!piezaActual.estaEnSuelo() &&
            !piezaActual.estaEncimaPieza(bloquesPuestos) &&
            !gameOver()) {
          piezaActual.mover(Movimientos.BAJAR);
        } else {
          if (fin) {
            mostrarGameOver();
          } else {
            meterEnTablero();
            eliminarLineasCompletas();

            piezaActual = piezasSiguientes.first;

            piezasSiguientes.removeFirst();
            piezasSiguientes.add(fa.crearPieza());

            subirNivel();
            reservado = false;

            actualizarSombra();
          }
        }
      });
    });
  }

  ///Permite cambiar el color de una manera mas precisa haciendo otra logica en
  /// los overflow
  Color cambiarColor(Color color, int valor) {
    int r = color.red + valor;
    int g = color.green + valor;
    int b = color.blue + valor;

    if (r > 255) r = 255;
    if (r < 0) r = 0;

    if (g > 255) g = 255;
    if (g < 0) g = 0;

    if (b > 255) b = 255;
    if (b < 0) b = 0;

    return Color.fromARGB(255, r, g, b);
  }

  ///Pinta el tablero, las piezas ya puestas, la propia pieza y su sombra
  Stack pintarTableroPiezas() {
    //Primero se crea una lista con los bloques de la pieza actual
    List<Widget>? bloquesActivos = List.empty(growable: true);

    bloquesActivos.add(Container(
      //El propio tablero
      margin: const EdgeInsets.all(3),
      width: ParametrosTablero.tableroWidth,
      height: ParametrosTablero.tableroHeight,
      color: Colors.black, //Color.fromARGB(255, 0, 0, 0),
    ));

    for (int i = 0; i < ParametrosTablero.TABLERO_HEIGHT_PIEZAS; i++) {
      for (int j = 0; j < ParametrosTablero.TABLERO_WIDTH_PIEZAS; j++) {
        bloquesActivos.add(Positioned(
          top: ((i *
                  (ParametrosTablero.tableroHeight /
                      ParametrosTablero.TABLERO_HEIGHT_PIEZAS)) +
              ParametrosTablero.inicioTableroY),
          left: ((j *
                  (ParametrosTablero.tableroWidth /
                      ParametrosTablero.TABLERO_WIDTH_PIEZAS)) +
              ParametrosTablero.inicioTableroX),
          child: Container(
            width: ParametrosTablero.tableroWidth /
                ParametrosTablero.TABLERO_WIDTH_PIEZAS,
            height: ParametrosTablero.tableroHeight /
                ParametrosTablero.TABLERO_HEIGHT_PIEZAS,
            //color: Colors.white
            decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                    color: const Color.fromARGB(255, 131, 131, 131))),
          ),
        ));
      }
    }

    for (Bloque aux in sombra.bloques) {
      if (aux.y >= 0) {
        bloquesActivos.add(Positioned(
          //Ejemplo que muestra como se pinta un bloque
          top: ((aux.y *
                  (ParametrosTablero.tableroHeight /
                      ParametrosTablero.TABLERO_HEIGHT_PIEZAS)) +
              ParametrosTablero.inicioTableroY),
          left: ((aux.x *
                  (ParametrosTablero.tableroWidth /
                      ParametrosTablero.TABLERO_WIDTH_PIEZAS)) +
              ParametrosTablero.inicioTableroX),
          child: Container(
            width: ParametrosTablero.tableroWidth /
                ParametrosTablero.TABLERO_WIDTH_PIEZAS,
            height: ParametrosTablero.tableroHeight /
                ParametrosTablero.TABLERO_HEIGHT_PIEZAS,
            //color: aux.color,
            decoration: BoxDecoration(
                color: Colors.grey,
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(255, Colors.grey.red ~/ 2,
                            Colors.grey.green ~/ 2, Colors.grey.blue ~/ 2),
                        width: 5),
                    top: BorderSide(
                        color: cambiarColor(Colors.grey, 50), width: 5),
                    left: BorderSide(
                        color: cambiarColor(Colors.grey, -50), width: 5),
                    right: BorderSide(
                        color: cambiarColor(Colors.grey, -50), width: 5))),
          ),
        ));
      }
    }

    for (Bloque aux in piezaActual.bloques) {
      if (aux.y >= 0) {
        bloquesActivos.add(Positioned(
          //Ejemplo que muestra como se pinta un bloque
          top: ((aux.y *
                  (ParametrosTablero.tableroHeight /
                      ParametrosTablero.TABLERO_HEIGHT_PIEZAS)) +
              ParametrosTablero.inicioTableroY),
          left: ((aux.x *
                  (ParametrosTablero.tableroWidth /
                      ParametrosTablero.TABLERO_WIDTH_PIEZAS)) +
              ParametrosTablero.inicioTableroX),
          child: Container(
            width: ParametrosTablero.tableroWidth /
                ParametrosTablero.TABLERO_WIDTH_PIEZAS,
            height: ParametrosTablero.tableroHeight /
                ParametrosTablero.TABLERO_HEIGHT_PIEZAS,
            //color: aux.color,
            decoration: BoxDecoration(
                color: aux.color,
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(255, aux.color.red ~/ 2,
                            aux.color.green ~/ 2, aux.color.blue ~/ 2),
                        width: 5),
                    top: BorderSide(
                        color: cambiarColor(aux.color, 50), width: 5),
                    left: BorderSide(
                        color: cambiarColor(aux.color, -50), width: 5),
                    right: BorderSide(
                        color: cambiarColor(aux.color, -50), width: 5))),
          ),
        ));
      }
    }

    //Ahora toca la parte de pintar los bloques ya puestos
    for (int i = 0; i < ParametrosTablero.TABLERO_HEIGHT_PIEZAS; i++) {
      for (int j = 0; j < ParametrosTablero.TABLERO_WIDTH_PIEZAS; j++) {
        if (bloquesPuestos[i][j] != null) {
          bloquesActivos.add(Positioned(
              //Ejemplo que muestra como se pinta un bloque
              top: ((bloquesPuestos[i][j]!.y *
                      (ParametrosTablero.tableroHeight /
                          ParametrosTablero.TABLERO_HEIGHT_PIEZAS)) +
                  ParametrosTablero.inicioTableroY),
              left: ((bloquesPuestos[i][j]!.x *
                      (ParametrosTablero.tableroWidth /
                          ParametrosTablero.TABLERO_WIDTH_PIEZAS)) +
                  ParametrosTablero.inicioTableroX),
              child: Container(
                width: ParametrosTablero.tableroWidth /
                    ParametrosTablero.TABLERO_WIDTH_PIEZAS,
                height: ParametrosTablero.tableroHeight /
                    ParametrosTablero.TABLERO_HEIGHT_PIEZAS,
                decoration: BoxDecoration(
                    color: bloquesPuestos[i][j]!.color,
                    border: Border(
                        bottom: BorderSide(
                            color: Color.fromARGB(
                                255,
                                bloquesPuestos[i][j]!.color.red ~/ 2,
                                bloquesPuestos[i][j]!.color.green ~/ 2,
                                bloquesPuestos[i][j]!.color.blue ~/ 2),
                            width: 5),
                        top: BorderSide(
                            color:
                                cambiarColor(bloquesPuestos[i][j]!.color, 50),
                            width: 5),
                        left: BorderSide(
                            color:
                                cambiarColor(bloquesPuestos[i][j]!.color, -50),
                            width: 5),
                        right: BorderSide(
                            color:
                                cambiarColor(bloquesPuestos[i][j]!.color, -50),
                            width: 5))),
              )));
        }
      }
    }

    //Comentar esta parte, solo sirve para depurar el centro de rotacion
    /*bloquesActivos.add(Positioned(
        //Ejemplo que muestra como se pinta un bloque
        top: ((piezaActual.centroPieza.y *
                (ParametrosTablero.tableroHeight / ParametrosTablero.TABLERO_HEIGHT_PIEZAS)) +
            ParametrosTablero.inicioTableroY),
        left: ((piezaActual.centroPieza.x *
                (ParametrosTablero.tableroWidth / ParametrosTablero.TABLERO_WIDTH_PIEZAS)) +
            ParametrosTablero.inicioTableroX),
        child: Container(
            width: ParametrosTablero.tableroWidth / ParametrosTablero.TABLERO_WIDTH_PIEZAS,
            height: ParametrosTablero.tableroHeight / ParametrosTablero.TABLERO_HEIGHT_PIEZAS,
            color: Colors.white)));*/
    return Stack(children: bloquesActivos);
  }

  ///Pinta la pieza reservada en el recuadro
  List<Widget> piezaReservadaDisplay() {
    List<Widget> listaBloque = [];

    //Modo claro
    Color color = Colors.cyan;

    //Modo oscuro
    if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
      color = Colors.cyan.shade900;
    }

    listaBloque.add(Positioned(
      width: ParametrosTablero.piezaReservadaTextoWidth,
      height: ParametrosTablero.piezaReservadaTextoHeight,
      child: Container(
          child: const Center(child: Text("Reservada")), color: color),
    ));

    if (piezaReservada != null) {
      int cont = 0;
      for (Bloque i in piezaReservada!.bloques) {
        listaBloque.add(Positioned(
            key: Key("Pieza Reservada ${cont++}"),
            width: ParametrosTablero.piezaReservadaWidth /
                ParametrosTablero.REJILLA_RESERVADA,
            height: ParametrosTablero.piezaReservadaHeight /
                ParametrosTablero.REJILLA_RESERVADA,
            left: (i.x - 2) *
                ParametrosTablero.piezaReservadaWidth /
                ParametrosTablero.REJILLA_RESERVADA,
            top: (i.y + 4) *
                    ParametrosTablero.piezaReservadaHeight /
                    ParametrosTablero.REJILLA_RESERVADA +
                ParametrosTablero.piezaReservadaTextoHeight,
            child: Container(
              //color: i.color
              decoration: BoxDecoration(
                  color: i.color,
                  border: Border(
                      bottom: BorderSide(
                          color: Color.fromARGB(255, i.color.red ~/ 2,
                              i.color.green ~/ 2, i.color.blue ~/ 2),
                          width: 3),
                      top: BorderSide(
                          color: cambiarColor(i.color, 50), width: 3),
                      left: BorderSide(
                          color: cambiarColor(i.color, -50), width: 3),
                      right: BorderSide(
                          color: cambiarColor(i.color, -50), width: 3))),
            )));
      }
    }
    return listaBloque;
  }

  ///Permite reservar pieza y ademas se encarga de no hacer trampa reservando
  /// y sacando infinitamente las piezas para dar mas tiempo
  void reservarPieza() {
    //Si no habia pieza reservada
    if (piezaReservada == null) {
      piezaReservada = piezaActual;
      piezaReservada!.resetPosicion();
      piezaActual = piezasSiguientes.first;

      piezasSiguientes.removeFirst();
      piezasSiguientes.add(fa.crearPieza());
    } else if (!reservado) {
      Pieza aux = piezaActual;
      piezaActual = piezaReservada!;
      piezaReservada = aux;

      piezaReservada!.resetPosicion();
    }
    reservado = true; //Se pone a true para evitar sacar la pieza
  }

  //Pinta las piezas siguientes del recuadro
  List<Widget> piezasSiguientesDisplay() {
    List<Widget> listaBloque = [];

    //Modo claro
    Color color = Colors.green;

    //Modo oscuro
    if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
      color = Colors.green.shade900;
    }

    listaBloque.add(Positioned(
        width: ParametrosTablero.piezaReservadaTextoWidth,
        height: ParametrosTablero.piezaReservadaTextoHeight,
        child: Container(
          color: color,
          child: const Center(child: Text("Siguientes: ")),
        )));

    for (Bloque i in piezasSiguientes.toList()[0].bloques) {
      listaBloque.add(Positioned(
          width: ParametrosTablero.piezaReservadaWidth /
              ParametrosTablero.REJILLA_RESERVADA,
          height: ParametrosTablero.piezaReservadaHeight /
              ParametrosTablero.REJILLA_RESERVADA,
          left: (i.x - 2) *
              ParametrosTablero.piezaReservadaWidth /
              ParametrosTablero.REJILLA_RESERVADA,
          top: (i.y + 4) *
                  ParametrosTablero.piezaReservadaHeight /
                  ParametrosTablero.REJILLA_RESERVADA +
              ParametrosTablero.piezaReservadaTextoHeight,
          child: Container(
            //color: i.color,
            decoration: BoxDecoration(
                color: i.color,
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(255, i.color.red ~/ 2,
                            i.color.green ~/ 2, i.color.blue ~/ 2),
                        width: 3),
                    top: BorderSide(color: cambiarColor(i.color, 50), width: 3),
                    left:
                        BorderSide(color: cambiarColor(i.color, -50), width: 3),
                    right: BorderSide(
                        color: cambiarColor(i.color, -50), width: 3))),
          )));
    }

    for (Bloque i in piezasSiguientes.toList()[1].bloques) {
      listaBloque.add(Positioned(
          width: ParametrosTablero.piezaReservadaWidth /
              ParametrosTablero.REJILLA_RESERVADA,
          height: ParametrosTablero.piezaReservadaHeight /
              ParametrosTablero.REJILLA_RESERVADA,
          left: (i.x - 2) *
              ParametrosTablero.piezaReservadaWidth /
              ParametrosTablero.REJILLA_RESERVADA,
          top: (i.y + 4) *
                  ParametrosTablero.piezaReservadaHeight /
                  ParametrosTablero.REJILLA_RESERVADA +
              ParametrosTablero.piezaReservadaTextoHeight +
              ParametrosTablero.piezaReservadaHeight,
          child: Container(
            //color: i.color
            decoration: BoxDecoration(
                color: i.color,
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(255, i.color.red ~/ 2,
                            i.color.green ~/ 2, i.color.blue ~/ 2),
                        width: 3),
                    top: BorderSide(color: cambiarColor(i.color, 50), width: 3),
                    left:
                        BorderSide(color: cambiarColor(i.color, -50), width: 3),
                    right: BorderSide(
                        color: cambiarColor(i.color, -50), width: 3))),
          )));
    }

    for (Bloque i in piezasSiguientes.toList()[2].bloques) {
      listaBloque.add(Positioned(
          width: ParametrosTablero.piezaReservadaWidth /
              ParametrosTablero.REJILLA_RESERVADA,
          height: ParametrosTablero.piezaReservadaHeight /
              ParametrosTablero.REJILLA_RESERVADA,
          left: (i.x - 2) *
              ParametrosTablero.piezaReservadaWidth /
              ParametrosTablero.REJILLA_RESERVADA,
          top: (i.y + 4) *
                  ParametrosTablero.piezaReservadaHeight /
                  ParametrosTablero.REJILLA_RESERVADA +
              ParametrosTablero.piezaReservadaTextoHeight +
              2 * ParametrosTablero.piezaReservadaHeight,
          child: Container(
            //color: i.color
            decoration: BoxDecoration(
                color: i.color,
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(255, i.color.red ~/ 2,
                            i.color.green ~/ 2, i.color.blue ~/ 2),
                        width: 3),
                    top: BorderSide(color: cambiarColor(i.color, 50), width: 3),
                    left:
                        BorderSide(color: cambiarColor(i.color, -50), width: 3),
                    right: BorderSide(
                        color: cambiarColor(i.color, -50), width: 3))),
          )));
    }
    return listaBloque;
  }

  @override
  Widget build(BuildContext context) {
    ParametrosTablero.widthPantalla = MediaQuery.of(context).size.width;
    ParametrosTablero.heightPantalla = MediaQuery.of(context).size.height;

    ParametrosTablero.tableroWidth = 0.75 * ParametrosTablero.widthPantalla;
    ParametrosTablero.tableroHeight = 0.9 * (ParametrosTablero.heightPantalla);

    ParametrosTablero.inicioTableroX = 3;
    ParametrosTablero.inicioTableroY = 3;

    ParametrosTablero.piezaReservadaTextoWidth =
        0.23 * ParametrosTablero.widthPantalla;
    ParametrosTablero.piezaReservadaTextoHeight =
        0.05 * ParametrosTablero.widthPantalla;
    ParametrosTablero.piezaReservadaWidth =
        0.23 * ParametrosTablero.widthPantalla;
    ParametrosTablero.piezaReservadaHeight =
        0.23 * ParametrosTablero.widthPantalla;

    return WillPopScope(
        onWillPop: () async {
          m.pararMusica();
          return true;
        },
        child: Scaffold(
            //appBar: appBar,
            body: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                pintarTableroPiezas(),
                //Expanded(
                //child: Column(
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          timerPrincipal!.cancel();
                          //player.clearAll();
                          m.pausarMusica();
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Pausa(m)))
                              .then((value) {
                            //player = cache.loop("music/musica.mp3");
                            //m.reanudarMusica();
                            comenzar();
                          });
                        });
                      },
                      child: const Icon(Icons.pause, size: 32),
                    ),

                    Container(
                      height: ParametrosTablero.piezaReservadaHeight,
                      width: ParametrosTablero.piezaReservadaWidth,
                      color: Colors.grey,
                      child: Stack(children: piezaReservadaDisplay()),
                    ),

                    const SizedBox(
                      height: 8,
                    ), //Para darle un espacio entre containers

                    Container(
                        width: ParametrosTablero.piezaReservadaWidth,
                        height: 3 * ParametrosTablero.piezaReservadaHeight +
                            ParametrosTablero.piezaReservadaTextoHeight,
                        color: Colors.grey,
                        child: Stack(children: piezasSiguientesDisplay())),

                    const SizedBox(
                      height: 8,
                    ), //Para darle un espacio entre containers

                    Column(
                      children: pintarInfo(),
                    ),

                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            reservarPieza();
                            actualizarSombra();
                          });
                        },
                        child: const Text("Save")),
                  ],
                ),
              ],
            ),
            Expanded(
                //flex: 5,
                child: Row(
              mainAxisSize: MainAxisSize.max, //Para que se centre
              mainAxisAlignment: MainAxisAlignment
                  .spaceEvenly, //Para que se dejen un espacio uniforme
              //crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                ElevatedButton(
                  onPressed: () {
                    if (!piezaActual.colisionLateralPieza(
                        true, bloquesPuestos)) {
                      setState(() {
                        piezaActual.mover(Movimientos.IZQUIERDA);
                        actualizarSombra();
                        //sombra.mover(Movimientos.IZQUIERDA);
                      });
                    }
                  },
                  child: const Icon(Icons.arrow_back, size: 32),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (!piezaActual.giroChoque(
                        Movimientos.GIRAR_IZDA, bloquesPuestos)) {
                      setState(() {
                        piezaActual.girar(Movimientos.GIRAR_IZDA);
                        actualizarSombra();
                        //sombra.girar(Movimientos.GIRAR_IZDA);
                      });
                    }
                  },
                  child: const Icon(Icons.rotate_left, size: 32),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (!piezaActual.estaEnSuelo() &&
                        !piezaActual.estaEncimaPieza(bloquesPuestos) &&
                        !gameOver()) {
                      setState(() {
                        piezaActual.mover(Movimientos.BAJAR);
                      });
                    }
                  },
                  onLongPress: () {
                    setState(() {
                      //piezaActual.mover(3);
                      bajarRapido(piezaActual);
                    });
                  },
                  child: const Icon(Icons.arrow_downward, size: 32),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (!piezaActual.giroChoque(
                        Movimientos.GIRAR_DCHA, bloquesPuestos)) {
                      setState(() {
                        piezaActual.girar(Movimientos.GIRAR_DCHA);
                        actualizarSombra();
                        //sombra.girar(Movimientos.GIRAR_DCHA);
                      });
                    }
                  },
                  child: const Icon(Icons.rotate_right, size: 32),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (!piezaActual.colisionLateralPieza(
                        false, bloquesPuestos)) {
                      setState(() {
                        piezaActual.mover(Movimientos.DERECHA);
                        actualizarSombra();
                        //sombra.mover(Movimientos.DERECHA);
                      });
                    }
                  },
                  child: const Icon(Icons.arrow_forward, size: 32),
                ),
              ],
            )),
          ],
        )));
  }
}
