import 'package:flutter/material.dart';

class Bloque {
  double _x, _y;
  Color _color;

  double get x => _x;
  double get y => _y;
  Color get color => _color;

  set x(x) => _x = x;
  set y(y) => _y = y;
  set color(color) => _color = color;

  Bloque(this._x, this._y, this._color);

  Bloque clone() {
    return Bloque(_x, _y, _color);
  }
}
