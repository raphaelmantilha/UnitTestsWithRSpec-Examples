require_relative '../../app/bank'

describe ContaCorrente do
   describe 'Saque' do
      context 'quando o valor é positivo' do
           before (:all) do
              @cc=ContaCorrente.new (1000.00)
              @cc.saca(200.00)
           end
           it 'entao atualiza saldo' do
              expect(@cc.saldo).to eql 795.00                   
           end
      end  

      context 'quando nao tenho saldo' do
           before (:all) do
               @cc=ContaCorrente.new(0.00)
               @cc.saca(100.00)
           end
           it 'então exibe mensagem' do
              expect(@cc.mensagem).to eql 'Saldo Zerado'
           end
           it 'e saldo é zero' do
              expect(@cc.saldo).to eql 0.00
           end
        end  

        context 'quando o saldo é insuficiente' do
            before (:all) do
                @cc=ContaCorrente.new(50.00)
                @cc.saca(100.00)
            end
            it 'então exibe mensagem' do
               expect(@cc.mensagem).to eql 'Saldo Insuficiente'
            end
            it 'e saldo não altera' do
               expect(@cc.saldo).to eql 50.00
            end
         end  

         context 'quando o limite é excedido' do
            before (:all) do
                @cc=ContaCorrente.new(1000.00)
                @cc.saca(701.00)
            end
            it 'então exibe mensagem' do
               expect(@cc.mensagem).to eql 'Limite de Saque e R$ 700'
            end
            it 'e saldo não altera' do
               expect(@cc.saldo).to eql 1000.00
            end
         end  
   end
end
