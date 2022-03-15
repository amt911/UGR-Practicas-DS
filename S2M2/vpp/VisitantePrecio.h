#ifndef VISITANTEPRECIO_H
#define VISITANTEPRECIO_H

namespace S2M2 {
	class VisitantePrecio : VisitanteEquipo {


	public:
		void visitarDisco(Disco d);

		void visitarTarjeta(Tarjeta t);

		void visitarBus(Bus b);
	};
}

#endif
