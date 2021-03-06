require_relative '../../app/bank'

describe ContaPoupanca do
   describe 'Saque' do
      context 'quando o valor é positivo' do
           before (:all) do
              @cp=ContaPoupanca.new (1000.00)
              @cp.saca(200.00)
           end
           it 'entao atualiza saldo' do
              expect(@cp.saldo).to eql 798.00                   
           end
      end  

      context 'quando nao tenho saldo' do
           before (:all) do
               @cp=ContaPoupanca.new(0.00)
               @cp.saca(100.00)
           end
           it 'então exibe mensagem' do
              expect(@cp.mensagem).to eql 'Saldo Zerado'
           end
           it 'e saldo é zero' do
              expect(@cp.saldo).to eql 0.00
           end
        end  

        context 'quando o saldo é insuficiente' do
            before (:all) do
                @cp=ContaPoupanca.new(50.00)
                @cp.saca(100.00)
            end
            it 'então exibe mensagem' do
               expect(@cp.mensagem).to eql 'Saldo Insuficiente'
            end
            it 'e saldo não altera' do
               expect(@cp.saldo).to eql 50.00
            end
         end  

         context 'quando o limite é excedido' do
            before (:all) do
                @cp=ContaPoupanca.new(1000.00)
                @cp.saca(701.00)
            end
            it 'então exibe mensagem' do
               expect(@cp.mensagem).to eql 'Limite de Saque e R$ 500'
            end
            it 'e saldo não altera' do
               expect(@cp.saldo).to eql 1000.00
            end
         end  
   end
end
