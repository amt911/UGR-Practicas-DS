class Bicicleta
    @dorsal
    @acabado
    
    def initialize(dorsal, tengoAcabar)
        @dorsal = dorsal
        @acabado = tengoAcabar
    end

    def acabarCarrera()
        raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end

end

bici = Bicicleta.new(3,false)
