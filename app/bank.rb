class Conta
    attr_accessor :saldo,:mensagem

    def initialize(saldo)
        self.saldo=saldo
    end

    def saca(valor,max,taxa)
        if (valor>self.saldo)
            if (self.saldo == 0.00)
               self.mensagem='Saldo zerado'
            else
                self.mensagem='Saldo Insuficiente para saque :('
            end
        elsif (valor>max)
                self.mensagem='Limite de Saque e R$ '+max.to_s
             else
                self.saldo-=valor + taxa
        end
    end
end

class ContaCorrente < Conta
    def saca(valor,max=700,taxa=5)
       super
    end
end

class ContaPoupanca < Conta
   def saca(valor,max=500,taxa=2)
      super
   end 
end