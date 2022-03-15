#ifndef VISITANTEPRECIODETALLE_H
#define VISITANTEPRECIODETALLE_H

namespace S2M2 {
	class VisitantePrecioDetalle : VisitanteEquipo {


	public:
		void visitarDisco(Disco d);

		void visitarTarjeta(Tarjeta t);

		void visitarBus(Bus b);
	};
}

#endif
