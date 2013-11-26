require './lib/prct09.rb'

describe Prct09::Matriz do
    before :each do
        @m1 = Prct09::Matriz.new(5, 5)
    end
    describe " # Almacenamiento. " do
        it " # Almacenamos numero de filas." do
            @m1.N
        end
        it " # Almacenamos numero de columnas." do
            @m1.M
        end
        it " # Se almacena el contenido." do
            @m1.contenido
        end
    end
end

describe Prct09::Matriz_Densa do
    before :all do
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
        
        
    end
    
    before :each do
        @m1 = Prct09::Matriz_Densa.new(2,2)
        @m2 = Prct09::Matriz_Densa.new(2,2)
        
        @m1.set(3,0,1)
        @m1.set(0,4,2)
        @m1.set(1,1,1)
        @m1.set(0,1,2)
        
        @m2.set(1,2,3)
        @m2.set(3,2,1)
        @m2.set(7,0,7)
        @m2.set(1,9,0)
        
    end
    describe " # Almacenamiento de matrices. " do
        it " # Acceso a los datos almacenados " do      
            @m1.get(0,0).should eq(1)
            @m1.get(0,1).should eq(2)
        end
        it " # Modificacion de la matriz " do     
            @m1.set(1,1,5)
            @m1.get(4,34).should eq(5)
            
            @m1.set(5,1,8)
            @m1.get(3,2).should eq(8)
        end
        it " # Se puede almacenar cualquier tipo de numero (float, int,...) " do      
            @m1.set(0,0,3.0)
            @m1.set(0,1,-6)
            @m1.to_s.should == "3.0\t-6\t\n3\t4\t\n"
        end
    end

    describe " # Operaciones con matrices densas. " do
    it " # Suma " do
        @m3 = Prct09::Matriz_Densa.new(2,2)
        @m3.set(0,0,6)
        @m3.set(0,1,8)
        @m3.set(1,0,10)
        @m3.set(1,1,12)

        (@m1+@m2).to_s.should eq(@m3.to_s)
    end

    it " # Resta " do
        @m3 = Prct09::Matriz_Densa.new(2,2)
        @m3.set(0,0,4)
        @m3.set(0,1,4)
        @m3.set(1,0,4)
        @m3.set(1,1,4)

        (@m2-@m1).to_s.should eq(@m3.to_s)
    end
    it " # Multiplicar " do
        @m3 = Prct09::Matriz_Densa.new(2,2)
        @m3.set(0,0,19)
        @m3.set(0,1,22)
        @m3.set(1,0,43)
        @m3.set(1,1,50)

        (@m1*@m2).to_s.should eq(@m3.to_s)
    end
    it " # 60% ceros, debe ser dispersa." do
        @m_neg = Prct09::Matriz_Densa.new(2,2)
        @m_neg.set(1,1,1)
        @m_neg.set(2,2,2)
        @m_neg.set(3,4,-3)
        @m_neg.set(3,-1,1)

        @m3 = Prct09::Matriz_Dispersa.new(2,2)
        @m3.set(1,1,3)

        (@m1+@m_neg).to_s.should eq(@m3.to_s)
    end
    it " # Fracciones." do
        @mf = Prct09::Matriz_Densa.new(2,2)
        @mf.set(0,0,Prct09::Fraccion.new(1,4))
        @mf.set(0,1,Prct09::Fraccion.new(1,4))
        @mf.set(1,0,Prct09::Fraccion.new(1,4))
        @mf.set(1,1,Prct09::Fraccion.new(1,4))

        @mf_res = Prct09::Matriz_Densa.new(2,2)
        @mf_res.set(0,0,Prct09::Fraccion.new(3,4))
        @mf_res.set(0,1,Prct09::Fraccion.new(3,4))
        @mf_res.set(1,0,Prct09::Fraccion.new(3,4))
        @mf_res.set(1,1,Prct09::Fraccion.new(3,4))

        (@mf+@mf).to_s.should eq(@mf_res.to_s)
    
    @mf1 = Prct09::Matriz_Densa.new(2,2)
    @mf1.set(1,0,Prct09::Fraccion.new(1,3))
     
    @mf2 = Prct09::Matriz_Densa.new(2,2)
    @mf2.set(1,0,1)
    
    @mf_res = Prct09::Matriz_Dispersa.new(2,2)
    @mf_res.set(1,0,Prct09::Fraccion.new(1,3))
        
    (@mf1 * @mf2).to_s.should == @mf_res.to_s
    
    end
    end
    describe " # Operaciones varias. " do
        it " # Maximo sin elementos nulos" do
                  @m1.max.should == 4
                end
                it " # Minimo sin elementos nulos" do
                  @m2.min.should == 5
                end
    end
end


describe Prct09::Matriz_Dispersa do
    before :all do
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
        
        # Etc
    end
    
    before :each do
        @m1 = Prct09::Matriz_Densa.new(3,2)
        
        @m1.set(0,0,0)
        @m1.set(1,1,1)
        
        @m1.set(1,2,1)
        @m1.set(2,7,3)
        
        @m1.set(1,0,0)
        @m1.set(3,0,0)
        
        @md1 = Prct09::Matriz_Dispersa.copy(@m1)
        @md2 = Prct09::Matriz_Dispersa.new(3, 2)
        
    end
    
    describe " # Almacenamiento de matrices. " do
        it " # Se debe poder crear matrices dispersas vacias o a partir de matrices densas." do     
            Prct09::Matriz_Dispersa.new(5, 5)
            Prct09::Matriz_Dispersa.copy(@m1)
        end
        
        it " # Se debe poder calcular el porcentaje de elementos nulos de la matriz dispersa." do
            @md2.null_percent.should == 1.0
            @md1.null_percent.should == 3.0/5.0
        end
        
        it " # Se debe poder acceder a los elementos de la matriz dispersa." do
            @md2.get(0,0).should == 0
            
            @md1.get(1,1).should == 1
            @md1.get(1,0).should == 2
            @md1.get(0,0).should == 3
            
        end
        
        it " # Se deben poder modificar los elementos de la matriz dispersa." do
            @md2.set(0,0,1)
            @md2.get(0,0).should == 1
            
            @md2.set(1,1,1)
            @md2.set(2,0,3)
            @md2.set(3,1,2)
            @md2.set(4,0,1)
            @md2.set(5,1,0)
            
            # Elemento nulo debido a que ha sobrepasado el porcentaje maximo de valores nulos
            @md2.get(2,1).should == 1
            
            @md1.set(1,1,4)
            @md1.set(1,0,2)
            @md1.get(1,1).should == 9
            @md1.get(1,0).should == 3
            
            @md1.get(0,0).should == 4
        end
        
        it " # Se debe poder transformar una matriz dispersa a una cadena de caracteres." do
            @md1.to_s.should == "Fila 0: \nFila 1: 0=>1 1=>3 \nFila 2: \n"
            @md2.to_s.should == "Fila 0: \nFila 1: \nFila 2: \n"
        end

    
    end

    describe " # Operaciones con matrices dispersas. " do
    it " # Suma de matrices " do        
        @md3 = Prct09::Matriz_Dispersa.new(3,2)
        @md3.set(1,1,1)
        @md3.set(1,1,2)
        @md3.set(1,1,4)
        @md3.set(2,1,3)
        @md3.set(1,4,1)
        @md3.set(2,1,3)
        
        
        (@md1+@md2).to_s.should eq(@md3.to_s)
    end
    it " # Resta de matrices " do
        @md3 = Prct09::Matriz_Dispersa.new(3,2)
        @md3.set(0,1,0)
        @md3.set(0,1,0)
        @md3.set(3,1,-2)
        @md3.set(3,1,-4)
        @md3.set(1,1,0)
        @md3.set(1,1,0)

        (@md2-@md1).to_s.should eq(@md3.to_s)
    end
    it " # Multiplicar matrices " do
        @md4 = Prct09::Matriz_Dispersa.new(2,3)
        @md4.set(2,2,-1)
        @md4.set(2,3,1)
        @md4.set(2,3,0)
        
        @md3 = Prct09::Matriz_Dispersa.new(3,3)
        @md3.set(1,1,1)
        @md3.set(1,1,-1)
        @md3.set(1,2,-2)
        @md3.set(1,2,-3)
        @md3.set(1,1,-3)
        @md3.set(1,2,3)
        @md3.set(2,4,0)
        @md3.set(6,2,0)
        @md3.set(2,3,0)

        (@md1*@md4).to_s.should eq(@md3.to_s)
    end
    it " # Operaciones de Fracciones. " do
        @mf1 = Prct09::Matriz_Dispersa.new(2,2)
        @mf1.set(1,0,Prct09::Fraccion.new(1,2))

        @mf2 = Prct09::Matriz_Dispersa.new(2,2)
        @mf2.set(1,0,Prct09::Fraccion.new(-2,4))

        @mf_res = Prct09::Matriz_Dispersa.new(2,2)
        @mf_res.set(1,0,Prct09::Fraccion.new(3,2))

        (@mf1-@mf2).to_s.should eq(@mf_res.to_s)
    
    
     @mf3 = Prct09::Matriz_Dispersa.new(2,2)
     @mf3.set(1,0,Prct09::Fraccion.new(1,3))
     
     @mf4 = Prct09::Matriz_Dispersa.new(2,2)
     @mf4.set(0,0,1)
     
     (@mf3 * @mf4).to_s.should == @mf3.to_s
    
    end

    end
            describe " # Operaciones varias. " do
        it " # Maximos no nulo" do
                  @md1.set(2,1,6)
                  @md1.max.should == 5
        end
        it " # Minimo no nulo" do
                  @md1.min.should == 1
        end
    end
end