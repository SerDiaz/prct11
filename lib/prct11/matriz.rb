require "./lib/prct09/fraccion.rb"

#Clase que permite la representación de matrices y las operaciones entre ellas.
class Matriz
  include Enumerable
   attr_reader :filas, :columnas

  #Constructor. No crea ningún contenedor.
  def initialize(filas, columnas)
    validate_sizes(filas, columnas)
    @filas = filas
    @columnas = columnas
  end


end #-- class Matriz

end #-- module Prct11

