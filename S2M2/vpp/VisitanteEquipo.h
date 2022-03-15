#ifndef VISITANTEEQUIPO_H
#define VISITANTEEQUIPO_H

namespace S2M2 {
	class VisitanteEquipo {


	public:
		virtual void visitarDisco(Disco d) = 0;

		virtual void visitarTarjeta(Tarjeta t) = 0;

		virtual void visitarBus(Bus b) = 0;
	};
}

#endif
