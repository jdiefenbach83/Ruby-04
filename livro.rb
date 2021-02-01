class Livro
    attr_reader :titulo, :preco, :ano_lancamento
    #attr_writer :preco

    def initialize(titulo, preco, ano_lancamento, possui_reimpressao)
        @titulo = titulo        
        @ano_lancamento = ano_lancamento
        @preco = calcula_preco preco
        @possui_reimpressao = possui_reimpressao
    end

    private

    def calcula_preco(base)
        if @ano_lancamento < 2000
            base *= 0.7 
        else 
            base    
        end
    end

    def possui_reimpressao?
        @possui_reimpressao
    end
end

algoritmos = Livro.new(
    "Algoritmos",
    100,
    1998,
    true
)

def livro_para_newsletter livro
    if livro.ano_lancamento < 1999
        puts "Newsletter/Liquidação"
        puts livro.titulo
        puts livro.preco
    end
end

livro_para_newsletter algoritmos