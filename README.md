Thiago Lages de Alencar - 1121561

# TableService #
Programa destinado a ajudar o serviço de mesas em um restaurante.

![diagrama](https://github.com/thiagola92/TableService/blob/master/diagramas/modulo_002.jpg)

# Como usar #
Abrir o prompt de comando nessa pasta
```
C:...\TableService-master>lua
Lua 5.1.4  Copyright (C) 1994-2008 Lua.org, PUC-Rio
> dofile("run.lua")
```

## Comandos ##   

__exibir_mesas()__  
```
> mudar_mesa(5, OCUPADO)
----------------------------------------------------------
1       Livre   2       NA
2       Livre   2       NA
3       Livre   2       NA
4       Livre   4       NA
5       Ocupado 4       08:44
6       Livre   4       NA
7       Livre   6       NA
8       Livre   6       NA
9       Livre   6       NA
10      Livre   8       NA
Mesa    Estado  Lugares Horario
```

__mesa_estado(numero, estado)__  
* numero - Número da mesa, mesa precisa estar registrada antes no sistema.  
* estado - As opções de estado da mesa são LIVRE, OCUPADO E RESERVADO.  
```
> mudar_mesa(5, OCUPADO)
> mudar_mesa(5, LIVRE)
> mudar_mesa(6, RESERVADO)
Diga o horario da reserva
10:00
```

__mesa_lugares(numero, lugares)__   
* numero - Número da mesa, mesa precisa estar registrada antes no sistema.  
* lugares - Número de pessoas que cabem naquela mesa.  
```
> mesa_lugares(5, 10)
> mesa_lugares(5, 30)
> mesa_lugares(5, 2)
```

__mesa_horario(numero, horario)__   
* numero - Número da mesa, mesa precisa estar registrada antes no sistema.
* horario - Se a mesa estiver ocupada ou reservada você pode botar um horário para ela, esse valor deve ser passado dentro de aspas.  
```
> mesa_horario(5, "10:00")
> mesa_horario(5, "20:00")
> mesa_horario(5, "15:00")
```

__adicionar_mesa(numero, estado, lugares, horario)__   
* numero - Número da mesa, mesa precisa estar registrada antes no sistema.  
* estado - As opções de estado da mesa são LIVRE, OCUPADO E RESERVADO.  
* lugares - Número de pessoas que cabem naquela mesa.  
* horario - Se a mesa estiver ocupada ou reservada você pode botar um horário para ela, esse valor deve ser passado dentro de aspas.  
```
> adicionar_mesa(5, LIVRE, 10, "NA")
```

__remover_mesa(numero)__
* numero - Número da mesa que vai ser deletada, mesa precisa estar registrada antes no sistema.  
```
> remover_mesa(5)
```

# Pastas #
__codigo__    
Todo o funcionamento do software se encontra nessa pasta, todos arquivos lua ou txt necessários.

__diagramas__    
Qualquer diagrama que possa ajudar o entendimento do desenvolvedor ou usuário.
