class Bicicleta
    attr_accessor :dorsal, :acabado
    
    def initialize(dorsal, tengo_acabar)
        @dorsal = dorsal
        @acabado = tengo_acabar
    end

    def acabar_carrera
        @acabado = true
    end

    def set_dorsal(val)
        @dorsal = val # `self` is an instance of Foo, it has `bar=` method
        @dorsal
    end

    private_class_method :new
end