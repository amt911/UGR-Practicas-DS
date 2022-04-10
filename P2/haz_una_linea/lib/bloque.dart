class Bloque {
  int _x, _y;

  int get x => _x;
  int get y => _y;
  set x(x) => _x = x;
  set y(y) => _y = y;

  Bloque(this._x, this._y);

  Bloque clone() {
    return Bloque(_x, _y);
  }
}
