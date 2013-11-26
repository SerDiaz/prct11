module Prct11 
  
  class Fraccion
    
    include Comparable
    attr_reader :num, :denom
    # Módulos usados
    
    
      # MCD.
    def gcd(a, b)
        a,b = a.abs, b.abs
        while b != 0
            a, b = b, a % b
        end
        a
    end
    
   def initialize(n,d)
        raise 'El denominador no puede ser 0' unless d != 0
        @num, @denom = n, d

        if n == 0
            @denom = 1
        else
            reducir
        end
    end

    # Conversion 
    def to_s
        "#{num}/#{denom}"
    end

    def to_f
        
        (@num.to_f/@denom.to_f)
    end

    # Comparacion
    def <=>(other)
        if !(other.is_a? Fraccion)
            other = Fraccion.new(other, 1)
        end
        d = @denom * other.denom
        (d/@denom)*@num <=> (d/other.denom)*other.num
    end

    # Aritmetica
    def +(other)
        if !(other.is_a? Fraccion)
            other = Fraccion.new(other, 1)
        end
        d = @denom * other.denom
        Fraccion.new((d/@denom)*@num + (d/other.denom)*other.num, d)
    end

    def -(other)
        if !(other.is_a? Fraccion)
            other = Fraccion.new(other, 1)
        end
        d = @denom * other.denom
        Fraccion.new((d/@denom)*@num - (d/other.denom)*other.num, d)
    end

    def *(other)
        if !(other.is_a? Fraccion)
            Fraccion.new(@num*other, @denom)
        else
            Fraccion.new(@num*other.num, @denom*other.denom)
        end
    end

    def \(other)
        if !(other.is_a? Fraccion)
            Fraccion.new(@num, @denom*other)
        else
            Fraccion.new(@num*other.denom, @denom*other.num)
        end
    end

    def %(other)
        Fraccion.new(0, 1)
    end

    def -@
        Fraccion.new(-@num, @denom)
    end
    
    # Coerce para operar con enteros.
    def coerce(other)
        [Fraccion.new(other, 1), self]
    end

    # Valor absoluto
    def abs
        Fraccion.new(@num.abs, @denom)
    end

    def rec #invertir una fraccion
   
        Fraccion.new(@denom, @num)
    end

private

    #reducir las fracciones
    def reducir

        if @denom < 0
            @num = -@num
            @denom = -@denom
        end

        #Para reducir dividimos el numerador y denominador por el MCD de ambos.
        mcd = gcd(@num, @denom)
        if mcd != 0
            @num /= mcd
            @denom /= mcd
        end
    end

    

end #clase

end # module