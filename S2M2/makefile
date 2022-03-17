COMP=g++
INCLUDE=./include
SRC=./src
BIN=./bin
OBJ=./obj

all: $(BIN)/salida

$(BIN)/salida: $(OBJ)/main.o $(OBJ)/VisitantePrecio.o $(OBJ)/VisitantePrecioDetalle.o $(OBJ)/Equipo.o $(OBJ)/Disco.o $(OBJ)/Bus.o $(OBJ)/Tarjeta.o
	g++ -o $@ $^


$(OBJ)/main.o: $(SRC)/main.cpp $(INCLUDE)/
	g++ -o $@ -g -c $< -I$(INCLUDE)

$(OBJ)/VisitantePrecio.o: $(SRC)/VisitantePrecio.cpp
	g++ -o $@ -g -c $< -I$(INCLUDE)

$(OBJ)/VisitantePrecioDetalle.o: $(SRC)/VisitantePrecioDetalle.cpp
	g++ -o $@ -g -c $< -I$(INCLUDE)

$(OBJ)/Equipo.o: $(SRC)/Equipo.cpp
	g++ -o $@ -g -c $< -I$(INCLUDE)

$(OBJ)/Disco.o: $(SRC)/Disco.cpp
	g++ -o $@ -g -c $< -I$(INCLUDE)

$(OBJ)/Bus.o: $(SRC)/Bus.cpp
	g++ -o $@ -g -c $< -I$(INCLUDE)

$(OBJ)/Tarjeta.o: $(SRC)/Tarjeta.cpp
	g++ -o $@ -g -c $< -I$(INCLUDE)

clean-obj:
	rm $(OBJ)/*.o

clean:
	rm $(OBJ)/*.o $(BIN)/salida vgcore*