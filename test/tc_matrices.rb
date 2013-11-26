# Implementar en este fichero las Pruebas Unitarias de nuestra gema

require "./lib/prct09.rb"
require "test/unit"


class Fixnum
        def self.null
                       0
        end
end
        
class String
        def self.null
                       ""
        end
end
        
class Float
        def self.null
                       0.0
        end
end        
        

class Test_Matriz < Test::Unit::TestCase
        def test_simple
                @m1 = Prct09::Matriz_Densa.new(2,2)
                @m2 = Prct09::Matriz_Densa.new(2,2)
                @m3 = Prct09::Matriz_Densa.new(2,2)
        
                @m1.set(0,1,1)
                @m1.set(2,1,3)
                @m1.set(1,5,9)
                @m1.set(0,0,1)
                
                @m2.set(0,0,2)
                @m2.set(3,2,1)
                @m2.set(4,4,1)
                @m2.set(1,1,1)

                @m3.set(3,3,6)
                @m3.set(3,1,4)
                @m3.set(4,1,10)
                @m3.set(15,1,12)


                assert_equal(@m3.to_s,(@m1+@m2).to_s)
        end
        
        def test_simple2
                @md1 = Prct09::Matriz_Dispersa.new(2,2)
                @md2 = Prct09::Matriz_Dispersa.new(2,2)
                @m3 = Prct09::Matriz_Dispersa.new(2,2)

                @md1.set(2,2,2)
                @md1.set(3,3,3)
                @md1.set(4,4,4)
                @md1.set(5,5,5)

                @md2.set(6,6,6)
                @md2.set(7,7,7)
                @md2.set(8,8,8)
                @md2.set(9,9,9)

                @m3.set(1,0,1)
                @m3.set(3,1,3)
                @m3.set(2,0,2)
                @m3.set(4,2,4)

                assert_equal(@m3.to_s,(@md1-@md2).to_s)


        end
        
        def test_typecheck
                @m1 = Prct09::Matriz_Densa.new(1,1)
                @m2 = Prct09::Matriz_Densa.new(1,1)
                @m1.set(0,0,5)
                @m2.set(0,0,"hola")

                assert_raise(TypeError) {@m1+@m2}
        end
        
        def test_failure
                @m1 = Prct09::Matriz_Densa.new(1,1)
                @m2 = Prct09::Matriz_Densa.new(2,2)

                assert_raise(ArgumentError) {@m1*@m2}
        end
end