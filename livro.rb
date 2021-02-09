class Livro
    attr_reader :titulo, :preco, :ano_lancamento
    #attr_writer :preco

    def initialize(titulo, preco, ano_lancamento, possui_reimpressao)
        conversor = Conversor.new    

        @titulo = conversor.string_para_alfanumerico titulo 
        @ano_lancamento = ano_lancamento
        @possui_reimpressao = possui_reimpressao
        @preco = calcula_preco preco
    end

    def to_csv
        "#{@titulo}, #{@ano_lancamento}, #{@preco}"
    end

    private

    def calcula_preco(base)
        if @ano_lancamento < 2006
            if possui_reimpressao?
                base * 0.9
            else
                base * 0.95
            end
        
        elsif @ano_lancamento <= 2010
            base * 0.96
        else
            base
        end
    end

    def possui_reimpressao?
        @possui_reimpressao
    end
end

class Estoque
    attr_reader :livros

    def initialize
        @livros = []
        @livros.extend Contador
    end

    def exporta_csv 
        @livros.each do |livro|
            puts livro.to_csv
        end    
    end

    def mais_barato_que valor
        @livros.select do |livro|
            livro.preco <= valor
        end
    end

    def total
        @livros.size
    end

    def adiciona livro
        @livros << livro if livro
    end

    def << (livro)
        @livros << livro if livro
        self
    end
    
    def remove(livro)
        @livros.delete livro
    end
    
    def maximo_necessario
        @livros.maximo_necessario
    end
end

module Contador
    def << (livro)
      push (livro)
      if @maximo_necessario.nil? || @maximo_necessario < size
        @maximo_necessario = size
      end
      self
    end
  
    attr_reader :maximo_necessario
end


class Conversor
    def string_para_alfanumerico(nome)
        nome.gsub /[^\w\s]/,''
    end
end

class Float
    def para_dinheiro
        valor = "R$" << self.to_s.tr('.', ',')
        valor << "0" unless valor.match /(.*)(\d{2})$/
        valor
    end
  end

algoritmos = Livro.new("Algoritmos", 100, 1998, true)
arquitetura = Livro.new("Introdução À Arquitetura e Design de Software", 70, 2011, true)
programmer = Livro.new("The Pragmatic Programmer", 100, 1999, true)
ruby = Livro.new("Programming Ruby", 100, 2004, true)

estoque = Estoque.new
estoque <<  algoritmos
puts estoque.maximo_necessario
estoque <<  arquitetura
puts estoque.maximo_necessario
estoque <<  programmer << ruby
puts estoque.maximo_necessario

estoque.remove algoritmos
puts estoque.maximo_necessario

puts precos = [30.00, 40.00, 70.00, 59.00]
precos_string = []
precos.each do |preco|
    puts preco.class
    precos_string << preco.para_dinheiro
end
puts precos_string.to_s