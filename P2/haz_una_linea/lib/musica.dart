import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Musica {
  bool apagado = true;
  IconData icono = Icons.volume_up;
  int volumen = 1;
  static AudioCache cache = AudioCache();
  static AudioPlayer player = AudioPlayer();

  void comenzarMusica() async {
    player = await cache.loop('music/musica.mp3');
  }

  void setSonido() {
    if (volumen == 1) {
      volumen = 0;
      player.setVolume(volumen.toDouble());
    } else {
      volumen = 1;
      player.setVolume(volumen.toDouble());
    }
  }

  void setVelocidad(double velocidad) {
    player.setPlaybackRate(velocidad);
  }

  void pausarMusica() {
    player.pause();
  }

  void pararMusica() {
    player.stop();
  }

  void reanudarMusica() {
    player.resume();
  }
}