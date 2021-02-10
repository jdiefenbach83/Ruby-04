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

puts precos = [30.00, 40.00, 70.00, 59.00]
precos_string = []
precos.each do |preco|
    puts preco.class
    precos_string << preco.para_dinheiro
end
puts precos_string.to_s
