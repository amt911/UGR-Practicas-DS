class Bicicleta
    attr_accessor :dorsal, :acabado
    
    def initialize(dorsal, tengoAcabar)
        @dorsal = dorsal
        @acabado = tengoAcabar
    end

    def acabar_carrera
        @acabado = true
    end

    def set_dorsal(val)
        @dorsal = val # `self` is an instance of Foo, it has `bar=` method
        @dorsal
    end
end