-- Titulo: main
-- Autoria: Thiago Lages
-- Data: 11/04/2017
-- Versão: 1.01
-- Conteúdo: ~135 linhas

-- Função que recebe toda a informação de uma mesa como tabela e transforma em uma String.
-- ANTES: Uma das linhas da tabela mesa.
-- DEPOIS: Uma string com todas as informações da linha.
local function info_em_string(mesa_info)
    toda_informacao = ""
    
    for uma_informacao = 1,  #mesa_info do
        toda_informacao = toda_informacao .. tostring(mesa_info[uma_informacao] .. "\t")
    end
    
    return toda_informacao
end

-- Muda o estado da mesa para Livre.
-- ANTES: Mesa se encontra em um estado X.
-- DEPOIS: Mesa tem o estado mudado para Livre e o horário dela alterado para "NA".
local function mesa_livre(numero)
    mesa[numero][1] = Livre
	mesa[numero][3] = "NA"
end

-- Muda o estado da mesa para Ocupado.
-- ANTES: Mesa se encontra em um estado X.
-- DEPOIS: Mesa tem o estado mudado para Ocupado e o horário é alterado para quando foi ocupado.
local function mesa_ocupada(numero)
    mesa[numero][1] = Ocupado
	mesa[numero][3] = os.date("%H" .. ":" .. "%M")
end

-- Muda o estado da mesa para Reservada.
-- ANTES: Mesa se encontra em um estado X.
-- DEPOIS: Mesa tem o estado mudado para Reservada e o horário é alterado para quando foi reservada.
local function mesa_reservada(numero)
    mesa[numero][1] = Reservado
	
	print(Pedir_a_hora_da_reserva)
	horario = io.read()
	
	mesa[numero][3] = horario
end

-- Printa toda a informação das mesas para o usuário.
-- ANTES: Informações dos usuários estão em uma tabela.
-- DEPOIS: Informações dos usuários estão sendo exibidas na tela.
function exibir_mesas()
    print("----------------------------------------------------------")
    
    for mesa_numero, mesa_info in pairs(mesa) do
        print(mesa_numero .. "\t" .. info_em_string(mesa_info))
    end
end

-- Define o estado de uma mesa.
-- ANTES: Mesa esta em um estado qualquer.
-- DEPOIS: Mesa vai para um dos seguintes estados: Livre, Ocupada ou Reservada.
function mesa_estado(numero, estado)
    numero = tonumber(numero)
    
    if mesa[numero] == nil then
		print(Mesa_nao_existe)
    elseif estado == LIVRE then
		mesa_livre(numero)
    elseif estado == OCUPADO then
		mesa_ocupada(numero)
    elseif estado == RESERVADO then
		mesa_reservada(numero)
    else
		print(Estado_nao_reconhecido)
	end
    
    exibir_mesas()
end

-- Altera o número de lugares que uma mesa tem.
-- ANTES: Mesa possui lugar para X pessoas.
-- DEPOIS: Mesa possui lugar para Y pessoas.
function mesa_lugares(numero, lugares)
    numero = tonumber(numero)

    if mesa[numero] == nil then
        mesa[numero][2] = lugares
    end
    
    exibir_mesas()
end

-- Altera o horário de uma mesa se ela não estiver Livre.
-- ANTES: Mesa possui horario X.
-- DEPOIS: Mesa possui horario Y.
function mesa_horario(numero, horario)
    numero = tonumber(numero)
    
    if mesa[numero] == nil then
		print(Mesa_nao_existe)
    elseif (mesa[numero][1] ~= LIVRE) then
        mesa[numero][3] = horario
    end
    
    exibir_mesas()
end

-- Adiciona uma nova mesa ao sistema.
-- ANTES: Tem X mesas no sistema.
-- DEPOIS: Tem X+1 mesas no sistema.
function adicionar_mesa(numero, estado, lugares, horario)
    numero = tonumber(numero)

    mesa[numero] = {estado, lugares, horario}

    exibir_mesas()
end

-- Remove uma mesa do sistema.
-- ANTES: Mesa X esta no sistema.
-- DEPOIS: Mesa X não esta mais no sistema.
function remover_mesa(numero)
    numero = tonumber(numero)

    if mesa[numero] == nil then
		print(Mesa_nao_existe)
    else
        mesa[numero] = nil
    end

    exibir_mesas()
end


