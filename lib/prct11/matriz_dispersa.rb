require "prct11/matriz"

module Prct11

#Clase que permite la representación de matrices dispersas. Hereda de la clase matriz.
class MatrizDispersa < Matriz
  private
    #Clase que permite acceder a la posición del elemento dentro del hash.
    class Posicion
      #f=fila. c=columna.
      attr_accessor :f, :c
      #Inicializa los valores de fil y col.
      def initialize(fil, col)
        @f, @c = fil, col
      end
      #Devuelve la posición en el hash del elemento f,c.
      def hash
        @f.hash ^ @c.hash
      end
      #Comprueba si dos objetos son iguales.
      def eql?(other)
        @f == other.f and @c == other.c
      end
    end

  public
 
  #Constructor. Llama al de la clase madre para las filas y las columnas,
  #e inicializa la matriz a 0 mediante un hash.
  def initialize(filas, columnas)
    super(filas, columnas)
    @container = Hash.new(zero)
  end


end # class
end # module