class Livro
    attr_reader :titulo, :preco, :ano_lancamento
    def initialize(titulo, preco, ano_lancamento)
        @titulo = titulo
        @preco = preco
        @ano_lancamento = ano_lancamento
    end
end

livro_rails = Livro.new(
    "Agile Web Developmento with Rails",
    70,
    2011
)

livro_ruby = Livro.new(
    "Programmin Ruby 1.9",
    60,
    2010
)

livros = [
    livro_rails,
    livro_ruby
]

def imprime_nota_fiscal livros
  livros.each do |livro|
    puts "Titulo: #{livro.titulo} - #{livro.preco}"
  end  
end

imprime_nota_fiscal livros