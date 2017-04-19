# ---Versão 0--- #
__Data__: 09/04/2017

Criado 3 pastas
* codigo - qualquer codigo ou coisa essencial para o programa rodar.
* diagramas - qualquer diagrama que ajude o developer ou usuário entender.
* relatorios - armazena todas as versões junto da razão de cada versão ou modificação.

## codigo ##
__enumeracao.lua__    
A intenção é funcionar que nem enumeration para que facilite os programadores de entenderem o código.    
__mesas.lua__  
Contém uma tabela que vai representar todas as mesas do restaurante.    
__tabela.lua__  
Funções que ajudaram a administrar as mesas  .  
__texto.lua__  
Qualquer texto que aparece na tela, para fácil alteração mais tarde.

## diagramas ##
Foi feito um diagrama de hierarquia, embora o programa não tivesse muitas coisas com o que usar como módulo.    
Tentei seguir a regra 3 ([3,6] módulos).

# ---Versão 1--- #
__Data__: 09/04/2017

## diagramas ##
renomeando "hierarquia" para "modulo"

## codigo ##
__tabela.lua__    
Acrescentado a função "ajuda()"    
Foi criada uma função para cada estado de mesa.  
__texto.lua__  
Para facilitar mudar a lingua dos textos que aparecem no programa, foi criado um texto.lua que contém qualquer string exibida para o usuário.

# ---Versão 2--- #
__Data__: 10/04/2017

## codigo ##
__tabela.lua__    
Retirada a função "ajuda()", tudo que vai ser preciso é dizer as instruções de mudar_mesa().    
Não é preciso uma função para ajudar a entender a outra.

Função mesa_livre() agora deixa a mesa como Livre e limpa o horario que foi ocupada.  
Função mesa_ocupada() agora deixa a mesa como Ocupado.  
Função mesa_reservada() agora deixa a mesa como Reservada e o horario da reserva.  

__texto.lua__  
Retirado o texto que "ajuda()" exibia.

# ---Versão 3--- #
__Data__: 11/04/2017

## relatorios ##
Pasta deletada, todo o conteúdo sobre atualizações vai ficar em "Patch History.md". Consequentemente os seguintes arquivos com histórico foram deletados.  
version 000.md  
version 001.md  
version 002.md  

# ---Versão 4--- #
__Data__: 11/04/2017

## codigo ##
__main.lua__  
Adicionado a pré-condição e pós-condição em todas as funções.  
exibir_mesas() é global para que o atendente possa visualizar quando quiser.  
mesa_estado() verifica se a mesa existe antes de tentar fazer alteração.  
mudar_mesa() foi deletado pois o usuário não deveria ter tanto poder sobre as mesas a esse ponto, onde podia até decidir o estado da mesa fora dos 3 padrões.  
mesa_lugares() altera o número de lugares em uma mesa.  
mesa_horario() altera o horario de uma mesa.  
remover_mesa() deleta uma das mesas da tabela.  

## diagrama ##
Diagrama dos módulos atualizado.
