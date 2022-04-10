class Bloque {
  double _x, _y;

  double get x => _x;
  double get y => _y;
  set x(x) => _x = x;
  set y(y) => _y = y;

  Bloque(this._x, this._y);

  Bloque clone() {
    return Bloque(_x, _y);
  }
}
