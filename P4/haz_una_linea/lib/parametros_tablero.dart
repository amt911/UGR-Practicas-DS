class ParametrosTablero {
  static double tableroWidth = 0;
  static double tableroHeight = 0;
  static double widthPantalla = 0;
  static double heightPantalla = 0;
  static double inicioTableroX = 0;
  static double inicioTableroY = 0;
  static const double TABLERO_WIDTH_PIEZAS = 10;
  static const double TABLERO_HEIGHT_PIEZAS = 20;
  static double piezaReservadaTextoWidth = 0;
  static double piezaReservadaTextoHeight = 0;
  static double piezaReservadaWidth = 0;
  static double piezaReservadaHeight = 0;
  static const double REJILLA_RESERVADA = 6;
  static int t = 1;
  static double probabilidad = 0.1;
  static const List<int> delays = [
    1600,
    1434,
    1267,
    1100,
    934,
    767,
    600,
    434,
    267,
    200,
    167,
    134,
    100,
    67,
    34
  ];

  static bool sesionIniciada = false;
}
