# Versão 0 #
Data: 09/04/2017

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

# Versão 1 #
Data: 09/04/2017

## diagramas ##
renomeando "hierarquia" para "modulo"

## codigo ##
__tabela.lua__    
Acrescentado a função "ajuda()"    
Foi criada uma função para cada estado de mesa.
__texto.lua__

# Versão 2 #
Data: 10/04/2017

## codigo ##
__tabela.lua__    
Retirada a função "ajuda()", tudo que vai ser preciso é dizer as instruções de mudar_mesa().    
Não é preciso uma função para ajudar a entender a outra.

Função mesa_livre() agora deixa a mesa como Livre e limpa o horario que foi ocupada.
Função mesa_ocupada() agora deixa a mesa como Ocupado.
Função mesa_reservada() agora deixa a mesa como Reservada e o horario da reserva

__texto.lua__
Retirado o texto que "ajuda()" exibia.
