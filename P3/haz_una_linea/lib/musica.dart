import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Musica {
  bool apagado = true;              //Indica si esta apagado el reproductor
  IconData icono = Icons.volume_up; //Muestra el icono actual dependiendo del estado
  int volumen = 1;                  //El volumen de la musica
  static AudioCache cache = AudioCache();
  static AudioPlayer player = AudioPlayer();

  ///Permite comenzar la musica desde el principio
  void comenzarMusica() async {
    player = await cache.loop('music/musica.mp3');
  }

//Establece el sonido a apagado o encendido.
  void setSonido() {
    if (volumen == 1) {
      volumen = 0;
      player.setVolume(volumen.toDouble());
    } else {
      volumen = 1;
      player.setVolume(volumen.toDouble());
    }
  }

//Cambia la velocidad de la música
  void setVelocidad(double velocidad) {
    player.setPlaybackRate(velocidad);
  }

//Pausa la música
  void pausarMusica() {
    player.pause();
  }

//Para la música
  void pararMusica() {
    player.stop();
  }

//Reaunuda la música
  void reanudarMusica() {
    player.resume();
  }
}
