# TableService 0 #
Programa destinado a ajudar o serviço de mesas em um restaurante.

# Como usar #
Abrir o prompt de comando nessa pasta
```
C:...\TableService-master>lua
Lua 5.1.4  Copyright (C) 1994-2008 Lua.org, PUC-Rio
> dofile("run.lua")
```

## Comandos ##   
mudar_mesa(numero_da_mesa, estado_da_mesa)
* Numero da mesa - Número entre 1 e o número de mesas registradas em codigo/mesas.lua
* Estado da mesa - As opções são LIVRE, OCUPADO E RESERVADO.
Exemplo
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
----------------------------------------------------------
> mudar_mesa(5, LIVRE)
Mesa livre
----------------------------------------------------------
1       Livre   2       NA
2       Livre   2       NA
3       Livre   2       NA
4       Livre   4       NA
5       Livre   4       NA
6       Livre   4       NA
7       Livre   6       NA
8       Livre   6       NA
9       Livre   6       NA
10      Livre   8       NA
Mesa    Estado  Lugares Horario
----------------------------------------------------------
> mudar_mesa(6, RESERVADO)
Diga o horario da reserva
10:00
----------------------------------------------------------
1       Livre   2       NA
2       Livre   2       NA
3       Livre   2       NA
4       Livre   4       NA
5       Livre   4       NA
6       Reser.  4       10:00
7       Livre   6       NA
8       Livre   6       NA
9       Livre   6       NA
10      Livre   8       NA
Mesa    Estado  Lugares Horario
----------------------------------------------------------
```

# Pastas #
__codigo__    
Todo o funcionamento do software se encontra nessa pasta, todos arquivos lua ou txt necessários.

__diagramas__    
Qualquer diagrama que possa ajudar o entendimento do desenvolvedor ou usuário.

__relatorios__    
Qualquer mudança será explicada no relatório da versão.
