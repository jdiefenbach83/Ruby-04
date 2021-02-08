class Livro
    attr_reader :titulo, :preco, :ano_lancamento
    #attr_writer :preco

    def initialize(titulo, preco, ano_lancamento, possui_reimpressao)
        @titulo = titulo        
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
    def initialize
        @livros = []
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
end

algoritmos = Livro.new(
    "Algoritmos",
    100,
    1998,
    true
)

arquitetura = Livro.new(
    "Introdução a arquitetura e design de software",
    70,
    2011,
    true
)

estoque = Estoque.new
estoque.adiciona algoritmos
estoque.adiciona arquitetura
estoque.adiciona Livro.new("The Pragmatic Programmer", 100, 1999, true)
estoque.adiciona Livro.new("Programming Ruby", 100, 2004, true)
estoque.adiciona nil

estoque.exporta_csv

baratos = estoque.mais_barato_que 80
baratos.each do |livro|
    puts livro.titulo
end