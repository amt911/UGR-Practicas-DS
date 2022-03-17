COMP=g++
INCLUDE=include
SRC=src
BIN=bin
OBJ=obj
BIN_NAME=salida

all: $(BIN)/$(BIN_NAME)

$(BIN)/$(BIN_NAME): $(OBJ)/main.o $(OBJ)/VisitantePrecio.o $(OBJ)/VisitantePrecioDetalle.o $(OBJ)/Equipo.o $(OBJ)/Disco.o $(OBJ)/Bus.o $(OBJ)/Tarjeta.o $(OBJ)/Cliente.o $(OBJ)/VisitanteEquipo.o
	g++ -o $@ $^


$(OBJ)/main.o: $(SRC)/main.cpp $(INCLUDE)/Equipo.h $(INCLUDE)/VisitantePrecio.h $(INCLUDE)/VisitantePrecioDetalle.h $(INCLUDE)/Tarjeta.h $(INCLUDE)/Bus.h $(INCLUDE)/Disco.h $(INCLUDE)/VisitanteEquipo.h $(INCLUDE)/ComponenteEquipo.h $(INCLUDE)/Cliente.h
	g++ -o $@ -g -c $< -I$(INCLUDE)

$(OBJ)/VisitantePrecio.o: $(SRC)/VisitantePrecio.cpp $(INCLUDE)/VisitantePrecio.h $(INCLUDE)/Disco.h $(INCLUDE)/Tarjeta.h $(INCLUDE)/Bus.h $(INCLUDE)/VisitanteEquipo.h $(INCLUDE)/Cliente.h
	g++ -o $@ -g -c $< -I$(INCLUDE)

$(OBJ)/VisitantePrecioDetalle.o: $(SRC)/VisitantePrecioDetalle.cpp $(INCLUDE)/VisitantePrecioDetalle.h $(INCLUDE)/VisitanteEquipo.h $(INCLUDE)/Disco.h $(INCLUDE)/Tarjeta.h $(INCLUDE)/Bus.h $(INCLUDE)/Equipo.h $(INCLUDE)/ComponenteEquipo.h $(INCLUDE)/Cliente.h
	g++ -o $@ -g -c $< -I$(INCLUDE)

$(OBJ)/Equipo.o: $(SRC)/Equipo.cpp $(INCLUDE)/Equipo.h $(INCLUDE)/VisitanteEquipo.h $(INCLUDE)/ComponenteEquipo.h $(INCLUDE)/Cliente.h
	g++ -o $@ -g -c $< -I$(INCLUDE)

$(OBJ)/Disco.o: $(SRC)/Disco.cpp $(INCLUDE)/Disco.h $(INCLUDE)/VisitanteEquipo.h $(INCLUDE)/ComponenteEquipo.h $(INCLUDE)/Cliente.h
	g++ -o $@ -g -c $< -I$(INCLUDE)

$(OBJ)/Bus.o: $(SRC)/Bus.cpp $(INCLUDE)/Bus.h $(INCLUDE)/VisitanteEquipo.h $(INCLUDE)/ComponenteEquipo.h $(INCLUDE)/Cliente.h
	g++ -o $@ -g -c $< -I$(INCLUDE)

$(OBJ)/Tarjeta.o: $(SRC)/Tarjeta.cpp $(INCLUDE)/Tarjeta.h $(INCLUDE)/VisitanteEquipo.h $(INCLUDE)/ComponenteEquipo.h $(INCLUDE)/Cliente.h
	g++ -o $@ -g -c $< -I$(INCLUDE)

$(OBJ)/Cliente.o: $(SRC)/Cliente.cpp $(INCLUDE)/Cliente.h
	g++ -o $@ -g -c $< -I$(INCLUDE)


$(OBJ)/VisitanteEquipo.o: $(SRC)/VisitanteEquipo.cpp $(INCLUDE)/VisitanteEquipo.h $(INCLUDE)/Cliente.h
	g++ -o $@ -g -c $< -I$(INCLUDE)

clean:
	rm $(OBJ)/*.o

full:
	rm $(OBJ)/*.o $(BIN)/$(BIN_NAME) vgcore*