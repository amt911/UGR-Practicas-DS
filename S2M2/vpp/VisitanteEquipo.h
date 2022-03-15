#ifndef VISITANTEEQUIPO_H
#define VISITANTEEQUIPO_H

namespace S2M2 {
	class VisitanteEquipo {


	public:
		virtual void visitarDisco(S2M2::Disco d) = 0;

		virtual void visitarTarjeta(S2M2::Tarjeta t) = 0;

		virtual void visitarBus(S2M2::Bus b) = 0;
	};
}

#endif
