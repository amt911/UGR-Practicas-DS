#ifndef VISITANTEPRECIODETALLE_H
#define VISITANTEPRECIODETALLE_H

namespace S2M2 {
	class VisitantePrecioDetalle : S2M2::VisitanteEquipo {


	public:
		void visitarDisco(S2M2::Disco d);

		void visitarTarjeta(S2M2::Tarjeta t);

		void visitarBus(S2M2::Bus b);
	};
}

#endif
