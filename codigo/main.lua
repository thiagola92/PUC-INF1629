local function info_em_string(mesa_info)
    toda_informacao = ""
    
    for uma_informacao = 1,  #mesa_info do
        toda_informacao = toda_informacao .. tostring(mesa_info[uma_informacao] .. "\t")
    end
    
    return toda_informacao
end

local function exibir_mesas()
    print("----------------------------------------------------------")
    
    for mesa_numero, mesa_info in pairs(mesa) do
        print(mesa_numero .. "\t" .. info_em_string(mesa_info))
    end
end

local function mesa_livre(numero)
    mesa[numero][1] = Livre
	mesa[numero][3] = "NA"
end

local function mesa_ocupada(numero)
    mesa[numero][1] = Ocupado
	mesa[numero][3] = os.date("%H" .. ":" .. "%M")
end

local function mesa_reservada(numero)
    mesa[numero][1] = Reservado
	
	print(Pedir_a_hora_da_reserva)
	horario = io.read()
	
	mesa[numero][3] = horario
end


function mesa_estado(numero, estado)
    numero = tonumber(numero)

    if estado == LIVRE then
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

function mudar_mesa(numero, estado, lugares, horario)
    numero = tonumber(numero)

    mesa[numero][1] = estado
    mesa[numero][2] = lugares
    mesa[numero][3] = horario
    
    exibir_mesas()
end

function adicionar_mesa(numero, estado, lugares, horario)
    numero = tonumber(numero)

    mesa[numero] = {estado, lugares, horario}

    exibir_mesas()
end
